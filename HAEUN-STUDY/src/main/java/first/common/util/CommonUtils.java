package first.common.util;

import java.lang.reflect.Array;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class CommonUtils {

	public static String getRandomString(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

    public static String createSaltKey() {
    	SecureRandom random = null;
		try {
			random = SecureRandom.getInstance("SHA1PRNG");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes = new byte[16];
		random.nextBytes(bytes);
		String salt = new String(Base64.getEncoder().encode(bytes));

		return salt;
    }

    public static Boolean isEmpty(Object obj) {
        if (obj instanceof String) return obj == null || "".equals(obj.toString().trim());
        else if (obj instanceof List) return obj == null || ((List<?>) obj).isEmpty();
        else if (obj instanceof Map) return obj == null || ((Map<?, ?>) obj).isEmpty();
        else if (obj instanceof Object[]) return obj == null || Array.getLength(obj) == 0;
        else return obj == null;
    }

    public static Boolean isNotEmpty(Object obj) {
        return !isEmpty(obj);
    }

	public static String encryptSHA512(String data, String salt) throws Exception {
		String result = "";
		if(isEmpty(salt)) salt = "";
		try {

			MessageDigest sha = MessageDigest.getInstance("SHA-512");
			sha.update(data.getBytes());
			sha.update(salt.getBytes());
			StringBuffer sb = new StringBuffer();
			for (byte b : sha.digest()) {
				sb.append(Integer.toHexString(0xff & b));
			}
			result = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
