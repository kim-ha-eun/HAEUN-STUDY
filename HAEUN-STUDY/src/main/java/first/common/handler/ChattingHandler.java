package first.common.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChattingHandler extends TextWebSocketHandler{
	Logger logger  = LogManager.getLogger(this.getClass());
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		logger.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);

		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>)session.getAttributes().get("sessionInfo");
		String name = (String)userMap.get("USER_NAME");

		logger.info(name + "님이 입장하셨습니다.");

		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage("IN"+":"+name));
		}

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>)session.getAttributes().get("sessionInfo");
		String name = (String)userMap.get("USER_NAME");

		logger.info("#ChattingHandler, handleMessage");
		logger.info(name + ": " + message);
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage("MSG"+":"+name + ":" + message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		logger.info("#ChattingHandler, afterConnectionClosed");
		sessionList.remove(session);

		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>)session.getAttributes().get("sessionInfo");
		String name = (String)userMap.get("USER_NAME");

		logger.info(name + "님이 퇴장하셨습니다.");

		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage("OUT"+":"+name));
		}

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		this.logger.error("웹소켓 에러!", exception);
	}




}
