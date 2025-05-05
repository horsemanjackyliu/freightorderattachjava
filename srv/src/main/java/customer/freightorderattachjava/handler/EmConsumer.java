package customer.freightorderattachjava.handler;

import org.springframework.stereotype.Component;

import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.messaging.TopicMessageEventContext;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class EmConsumer implements EventHandler {
    private static final Logger logger = LoggerFactory.getLogger(EmConsumer.class);
@On(service = "freightorderattachjava-messaging",event = "ce/sap/s4/beh/FreightOrder/Created/v1" )
    public void listen(TopicMessageEventContext context){
        logger.info("checking if the message if read from SAP Event Mesh {}",context.getIsInbound());
        Map<String, Object> payloadMap = context.getDataMap();
        logger.info("reading event id{}",context.getMessageId());
        payloadMap = context.getDataMap();
        logger.info("reading event data{}", payloadMap);        
    }

}
