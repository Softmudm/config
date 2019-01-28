/**
 * Project Name:oms-web
 * File Name:JsonUtils.java
 * Package Name:com.snto.oms.util
 * Date:2014-9-26����9:55:29
 *
*/

package com.ooze.util;

import java.lang.reflect.Type;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

import org.apache.commons.lang3.StringUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * ClassName:JsonUtils <br/>
 * Function: Json ����������. <br/>
 * Date:     2014-9-26 ����9:55:29 <br/>
 * @author   z144746
 * @since    JDK 1.7
 */
public class JsonUtils {
	
	 /**
	 * jsonStr2List:(Json �ַ���תList). <br/>
	 * @author z144746
	 * @param str
	 * @param clazz
	 * @since JDK 1.7
	 */
	@SuppressWarnings("unchecked")
	public static List<?> jsonStr2List(String str,Class<?> clazz){
		 	if(StringUtils.isEmpty(str)){
		 		return null;
		 	}
		 	List<?> objList = null;
		 	try{
		 		 JSONArray jarr=JSONArray.fromObject(str);
		 		objList = (List<Object>)JSONArray.toCollection(jarr,clazz);
		 	}catch(Exception e){
		 		e.printStackTrace();
		 	}
	        return objList;
	}
	/**
	 * jsonStr2List:(Json �ַ���תʵ��). <br/>
	 * @author z144746
	 * @param str
	 * @param clazz
	 * @since JDK 1.7
	 */
	public static Object jsonStr2Entity(String str,Class<?> clazz){
		 	if(StringUtils.isEmpty(str)){
		 		return null;
		 	}
		 	Object obj = null;
		 	try{
		 		JSONUtils.getMorpherRegistry().registerMorpher(
		                new DateMorpherEx(new String[] { "yyyy-MM-dd HH:mm:ss","yyyy-MM-dd HH:mm",
		                        "yyyy-MM-dd", "yyyy-MM-dd't'HH:mm:ss" }, (Date)null),true);
		 		obj = JSONObject.toBean( JSONObject.fromObject(str), clazz);
		 	}catch(Exception e){
		 		e.printStackTrace();
		 	}
	        return obj;
	}
	
	// ��Stringת����JSON
		public static String string2json(String key, String value) {
			JSONObject object = new JSONObject();
			object.put(key, value);
			return object.toString();
		}

		// ��JSONת��������,����valueClzΪ�����д�ŵĶ����Class
		public static Object json2Array(String json, Class valueClz) {
			JSONArray jsonArray = JSONArray.fromObject(json);
			return JSONArray.toArray(jsonArray, valueClz);
		}

		// ��Collectionת����JSON
		public static String collection2json(Object object) {
			JSONArray jsonArray = JSONArray.fromObject(object);
			return jsonArray.toString();
		}

		// ������ת����JSON
		public static String array2json(Object object) {
			JSONArray jsonArray = JSONArray.fromObject(object);
			return jsonArray.toString();
		}

		// ��Mapת����JSON
		public static String map2json(Object object) {
			JSONObject jsonObject = JSONObject.fromObject(object);
			return jsonObject.toString();
		}

		// ��JSONת����Map,����valueClzΪMap��value��Class,keyArrayΪMap��key
		public static Map json2Map(Object[] keyArray, String json, Class valueClz) {
			JSONObject jsonObject = JSONObject.fromObject(json);
			Map classMap = new HashMap();

			for (int i = 0; i < keyArray.length; i++) {
				classMap.put(keyArray[i], valueClz);
			}

			return (Map) JSONObject.toBean(jsonObject, Map.class, classMap);
		}

		// ��POJOת����JSON
		public static String bean2json(Object object) {
			JSONObject jsonObject = JSONObject.fromObject(object);
			return jsonObject.toString();
		}



		// ��JSONת����String
		public static String json2String(String json, String key) {
			JSONObject jsonObject = JSONObject.fromObject(json);
			return jsonObject.get(key).toString();
		}
		public static List<?> jsonStr2ListGson(String str,Type type) {
			Gson gson=  new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss").create();
			return (List<?>) gson.fromJson(str,type);
		}
		public static Object jsonStr2Gson(String str, Class<?> clazz) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			return gson.fromJson(str, clazz);  
		}
}