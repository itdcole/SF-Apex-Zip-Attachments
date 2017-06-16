/*
*    AUTHOR : Avi (avidev9@gmail.com)
*    Modified by: Dennis (itdcole@gmail.com) 2016/09/02
*    Changes: Line 17-19; search and replace characters not readable by component.
*
**/
public class VFZip_Con_V2 {
    public Integer randomInt{get;set;}
    
    public VFZip_Con_V2(){
        randomInt = getRandomNumber(10000);
    }
    
	/* Removes characters that show up when listing attachments */
	@RemoteAction
    public static List<AttachmentWrapper> getAttachments(String attachmentIdCSV){
         attachmentIdCSV = attachmentIdCSV.replace('[','');
         attachmentIdCSV = attachmentIdCSV.replace(']','');
         attachmentIdCSV = attachmentIdCSV.replace(' ','');
        List<String> attachmentIds = attachmentIdCSV.split(',');
        
        return wrapAttachments([SELECT Id,Name,Body FROM Attachment WHERE Id IN:attachmentIds]);
    }
    
    
    private static List<AttachmentWrapper> wrapAttachments(List<Attachment> attachments){
        List<AttachmentWrapper> wrappers = new List<AttachmentWrapper>();
        for(Attachment att : attachments){
            wrappers.add(new AttachmentWrapper(att));
        }
        
        return wrappers;
    }
    
    public class AttachmentWrapper{
        public Attachment AttachmentObj;
        public String base64Body;
        
        public AttachmentWrapper(Attachment AttachmentObj){
            this.AttachmentObj  = AttachmentObj;
            this.base64Body = EncodingUtil.base64Encode(AttachmentObj.Body);
            this.AttachmentObj.Body = NULL;
        }
    }
    
    /*
    *Random number generator to change the js function name if multiple components us
    ***/
    private Integer getRandomNumber(Integer size){
        Double d = Math.random() * size;
        return d.intValue();
    }
}