package top.nzhz.wiki.job;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import top.nzhz.wiki.service.DocService;

import javax.annotation.Resource;

@Component
public class DocJob {

   private static final Logger LOG = LoggerFactory.getLogger(DocJob.class);

   @Resource
   private DocService docService;
   /**
    * 自定义cron表达式跑批
    * 只有等上一次执行完成，下一次才会在下一个时间点执行，错过就错过
    */
   @Scheduled(cron = "0/30 * * * * ?")
   public void cron() {
        docService.updateMusicInfo();
   }

}
