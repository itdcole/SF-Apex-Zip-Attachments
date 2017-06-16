# SF-Apex-Zip-Attachments
Collated code of different developers to enable a single button of zipping attachments in Salesforce.

KNOWN ISSUE:
COLLECTIVE FILE SIZE CAN'T BE MORE THAN 5MB


INSTALLATION:

1. Copy files to your Salesforce Sandbox
    FILE: Download Attachments.page > Visual Force Pages
    FILE: JSZip.zip > Static resources (named JSZip)
    FILE: Reveal.zip > Static Resources (named Reveal)
    FILE VFZip_Con_V2.cls > Apex Classes
    FILE: VFZip_Con_V2.component > Visualforce Components
    
2. Modify Visualforce page for necessary controller
    Acceptable controllers are: Contact, Account, Opportunity, or custom Objects: Custom_Object__c

3. Modify Visualforce page to pull necessary attachments (See instructions inside page file)

4. Create a button on the Object you wish to add this function to. Note: For each object you wish to use this on, you will need a separate Visualforce Page with the necessary edits relating to that Object/Custom Object.
4.1 Create button, call it "Download Attachments"
4.2 Choose "Detail Page Button"
4.3 Behaviour: Execute Javascript
4.4 Content source: OnClick Javascript

BUTTON CODE:
                window.open("/apex/NAME_OF_VISUAL_FORCE_PAGE?id={!CHANGEME_OBJECT.Id}", "_blank", "width=710, height=410");


5. Edit the Page Layout and add the button to the page. 

Test. 
