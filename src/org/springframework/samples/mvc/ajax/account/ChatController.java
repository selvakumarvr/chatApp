package org.springframework.samples.mvc.ajax.account;

import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;





@Controller
@RequestMapping(value="/chat")
public class ChatController {
	
	
	
	@RequestMapping(method=RequestMethod.GET)
	public String getCreateForm(Model model) {
		model.addAttribute(new Message());
		return "chat/chatForm";
	}

	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody Messages create(@RequestBody  Message message) {
		
		
		long startTime = new java.util.Date().getTime()-10;
		
	
		System.out.println("ChatController");
		Messages messages= new Messages();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		message.setTime(new java.util.Date().getTime());
			pm.makePersistent(message);
			try {
				List<Message> posts;
		
				System.out.println("update1...");
				Query query = pm.newQuery(Message.class);
				query.setFilter("time >=timeParam");
				 query.declareParameters("String timeParam");

				posts = (List<Message>) pm.newQuery(query).execute(startTime);
				System.out.println(" Size of message"+posts.size());
				posts.size();
				if((posts != null) && (posts.size()>0)){
					  System.out.println("Setting message status is 1");
						messages.setStatus("1");
						messages.setTime(new Date().getTime());
						messages.setMessages(posts.toArray(new Message[posts.size()]));
						System.out.println("Messages has been set to array");
					}else{
						messages.setStatus("2");
					}

				}catch(Exception e){
					System.out.println("Exception message  "+e.getMessage());
				
				}
			
			return messages;
	}
	
	
	@RequestMapping(value="/updateMsg", method=RequestMethod.GET)
	public @ResponseBody Messages update(@RequestParam long currentDate) {
		
	
		System.out.println("Udpated message called...");
		Messages messages= new Messages();
		new java.util.Date().getTime();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
		List<Message> posts;
		System.out.println("Current Date "+currentDate);
		System.out.println("update1...");
		Query query = pm.newQuery(Message.class);
		query.setFilter("time > timeParam");
		 query.declareParameters("String timeParam");

		posts = (List<Message>) pm.newQuery(query).execute(currentDate);
		System.out.println(" Size of message"+posts.size());
		posts.size();
		if((posts != null) && (posts.size()>0)){
			  System.out.println("Setting message status is 1");
				messages.setStatus("1");
				messages.setTime(new Date().getTime());
				messages.setMessages(posts.toArray(new Message[posts.size()]));
				System.out.println("Messages has been set to array");
			}else{
				messages.setStatus("2");
			}

		}catch(Exception e){
			System.out.println("Exception message  "+e.getMessage());
		
		}
		finally {

		}
		return messages;
	}
	
}
