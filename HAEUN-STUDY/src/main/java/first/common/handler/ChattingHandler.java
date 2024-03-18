package first.common.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import first.common.util.CommonUtils;
import first.hnBlog.chatting.service.ChattingrService;


public class ChattingHandler extends TextWebSocketHandler{
	Logger logger  = LogManager.getLogger(this.getClass());
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Resource(name = "chattingService")
	public ChattingrService chattingService;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		logger.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>)session.getAttributes().get("sessionInfo");
		userMap.put("SESSION_ID", session.getId());

		//DB 에 접속정보 저장
		Map<String, Object> map = chattingService.insertChattingUserList(userMap);
		String name = (String)userMap.get("USER_NAME");
		logger.info(name + "님이 입장하셨습니다.");

		String cn = name + "님이 입장하셨습니다.";
		String idx = session.getId();

		JSONObject obj = new JSONObject();
		obj.put("cn", cn);
		obj.put("idx", idx);
		obj.put("name", name);
		obj.put("se", "IN");

		String jsonToString = obj.toJSONString();

//		userMap.put("MESSAGE", cn);
//		//메세지 DB에 저장
//		chattingService.insertChattingMessage(userMap);

		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(jsonToString));
		}

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>)session.getAttributes().get("sessionInfo");
		String name = (String)userMap.get("USER_NAME");

		logger.info("#ChattingHandler, handleMessage");
		logger.info(name + ": " + message);

		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(message.getPayload());
		String idx = "";
		String se = "";
		String cn = "";

		if(!CommonUtils.isEmpty(obj.get("idx"))){
			idx = (String) obj.get("idx");
		}

		if(!CommonUtils.isEmpty(obj.get("se"))){
			se = (String) obj.get("se");

		}

		if(!CommonUtils.isEmpty(obj.get("cn"))){
			cn = (String) obj.get("cn");

		}

		if(se.equals("MSG")){
			cn = cn.replace("\n", "<br>");
			userMap.put("MESSAGE", cn);
			//메세지 DB에 저장
			chattingService.insertChattingMessage(userMap);
		}

		obj.put("name", name);
		obj.put("idx", idx);

		String jsonToString = obj.toJSONString();

		for(WebSocketSession s : sessionList) {

			s.sendMessage(new TextMessage(jsonToString));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		logger.info("#ChattingHandler, afterConnectionClosed");
		sessionList.remove(session);

		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>)session.getAttributes().get("sessionInfo");
		String name = (String)userMap.get("USER_NAME");
		userMap.put("SESSION_ID", session.getId());

		//DB 에 접속정보 저장
		chattingService.updateChattingUserList(userMap);
		logger.info(name + "님이 퇴장하셨습니다.");

		String cn = name + "님이 퇴장하셨습니다.";
		String idx = session.getId();

//		userMap.put("MESSAGE", cn);
//		//메세지 DB에 저장
//		chattingService.insertChattingMessage(userMap);

		JSONObject obj = new JSONObject();
		obj.put("cn", cn);
		obj.put("idx", idx);
		obj.put("name", name);
		obj.put("se", "OUT");

		String jsonToString = obj.toJSONString();

		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(jsonToString));
		}
		System.out.println();
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		this.logger.error("웹소켓 에러!", exception);
	}




}
