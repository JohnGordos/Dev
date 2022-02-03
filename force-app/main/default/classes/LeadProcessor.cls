global class LeadProcessor implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext jobId) {
        return Database.getQueryLocator('SELECT ID, LeadSource FROM LEAD');
    }

    global void execute(Database.BatchableContext jobId, List<Lead> scope) {
        List<Lead> updatedleads = new List<Lead>();
        system.debug(scope.size());
        for(Lead l : scope){
            l.LeadSource='Dreamforce';
            updatedleads.add(l);
        }
        update updatedleads;
    }
    global void finish(Database.BatchableContext jobIdParam) {
    
    }
    /*
    global void finish(Database.BatchableContext jobIdParam) {
        list<CronTrigger> ct = [SELECT CronExpression, CronJobDetailId, CronJobDetail.Name, Id, State FROM CronTrigger WHERE CronJobDetail.Name like '%nomeBatch%'];
        list<AsyncApexJob> apJb = [SELECT TotalJobItems,JobItemsProcessed,NumberOfErrors,CreatedDate,CompletedDate,ExtendedStatus
                                   FROM AsyncApexJob where ApexClass.Name = 'nomeBatch'
                                   ORDER BY CompletedDate desc limit 1
        if(ct.size()>0) {
            System.abortJob(ct[0].id);
        }
        if(apJb.size()>0) {
            if(apJb[0].NumberOfErrors <> 0){
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.toAddresses = new String[] { 'your@email.com'};
                message.subject = 'Erro no batch nomeBatch';
                message.plainTextBody = 'Erro no batch nomeBatch: '+apJb[0].TotalJobItems+'\r\n'+ 'Lotes Processados: '+apJb[0].JobItemsProcessed+'\r\n'+ 'Falhas: '+apJb[0].NumberOfErrors+'\r\n'+ 'Data do Envio: '+apJb[0].CreatedDate+'\r\n'+ 'Data de Conclusão: '+apJb[0].CompletedDate+'\r\n'+'Msg de Erro: '+apJb[0].ExtendedStatus;
                Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
                if(!Test.isRunningTest()){
                    Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                    if (results[0].success) {
                        System.debug('O email foi enviado com sucesso');
                    } else {
                        System.debug('Houve falha no envio do email: ' + results[0].errors[0].message);
                    }
                }
            }
        }
        if(!Test.isRunningTest()) {
            System.scheduleBatch(new nomeBatch(), 'Job nomeBatch' + system.now().format('dd.MM.yyyy-HH.mm.ss.SSS'),minutesFromNow, batchSize);
        }
    }
    */
}