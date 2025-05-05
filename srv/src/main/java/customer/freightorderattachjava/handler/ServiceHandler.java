package customer.freightorderattachjava.handler;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.messaging.TopicMessageEventContext;

import cds.gen.adminservice.AdminService_;


@Component
@ServiceName(AdminService_.CDS_NAME)
public class ServiceHandler implements EventHandler {

    private static final Logger logger =  LoggerFactory.getLogger(ServiceHandler.class);

    @On(service = "freightorderattachjava-messaging",event = "ce/sap/s4/beh/FreightOrder/Created/v1")
    public void receiveFreightOrderCreated(TopicMessageEventContext context){
    // String payload = context.getData();

    logger.info("admin service");
    String msgId = context.getMessageId();
     Map<String, Object> payloadMap = context.getDataMap();
    logger.info(msgId);
     logger.info(payloadMap.toString());

    }

}
