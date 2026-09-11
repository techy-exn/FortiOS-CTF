#!/usr/bin/env bash
# Move unused workshop images into data/images/old-images/
# Generated for the FortiOS 8.0 CTF. Run from anywhere; it resolves paths itself.
# It ONLY moves the 257 files listed below (images not referenced by any page or
# challenge). Referenced images are left in place. Safe to re-run.
set -euo pipefail

# --- locate the images folder -------------------------------------------------
# Default assumes this script sits in the project root next to data/.
# Override by passing the images dir as the first argument:
#   ./move-unused-images.sh /path/to/data/images
IMG_DIR="${1:-data/images}"

if [ ! -d "$IMG_DIR" ]; then
  echo "ERROR: images directory not found: $IMG_DIR"
  echo "Pass it explicitly, e.g.: $0 ~/Documents/FortiOS-CTF/data/images"
  exit 1
fi

DEST="$IMG_DIR/old-images"
mkdir -p "$DEST"

moved=0
missing=0
while IFS= read -r name; do
  [ -z "$name" ] && continue
  src="$IMG_DIR/$name"
  if [ -f "$src" ]; then
    mv -n "$src" "$DEST/$name"
    moved=$((moved+1))
  else
    echo "  (already moved or missing: $name)"
    missing=$((missing+1))
  fi
done <<'UNUSED_LIST'
A9120jje1_lap0mg_lx4.png
Accept_Warning_HA_Failover.jpg
AdaptixInsideBeacon_RefreshProcessBrowser.jpg
Adaptix_BlankScreen.jpg
Adaptix_Folder_Containing_All_Beacons.jpg
Adaptix_Menu_For_BOFs.jpg
Adaptix_RightClick_OnBeacon.jpg
Adaptix_SecondBeacon_AfterUAC.jpg
AfterTokenSteal_EngAdminContext.jpg
After_HA_Failover.jpg
All_AI_Application_Signatures.jpg
Asset_Focus_On.jpg
Asset_Network_Graph.jpg
BE-2026-Q3-FortiOS-Roadshow-HEADER-LP.webp
BE-2026-Q3-FortiOS-Roadshow-PPT.png
BE_-_2026-03-26_-Blackout-Lockout_PPT-no-date.png
Block_Override_Unsanctioned.jpg
Claude_Unsancioned_.jpg
Click_Delete.jpg
Click_TIA_Portal.jpg
Cloudshare_Display_Fullscreen.jpg
Cloudshare_SSH_CON.jpg
Cloudshare_VM_List.jpg
Cloudshare_keyboard_sentext.jpg
Cloudshare_menu_UsernamePassword.jpg
Cluster_In_Sync.jpg
Config_Revision_List.jpg
Config_Sync_Not_In_Sync.jpg
Console_Opens.jpg
Console_Typing_Help.jpg
Console_Typing_WhoAmI.jpg
Create_Profile.jpg
DC_IT_Hacked_beacon.jpg
DNS_Get_After_Change.png
DNS_Get_Before_Change.png
DNS_Set_Change.png
Diagnose_AI_Database.jpg
Diagnostics_And_Tools.jpg
Dir_OT_Domain_While_Admin_Context.jpg
Download_To_Device.jpg
Edit_Gen_AI.jpg
Edit_Policy.jpg
Exclusive_Networks_logo.svg_2.png
ExecuteCommandIfCosoleIsNotWorking.jpg
Exporting_Gen_AI.jpg
Extra_Info_HA.jpg
FG1_Back_To_Primary.jpg
FG1_Primary.jpg
Failover_In_Process.jpg
Filter_On_Gen_AI.jpg
Find_Claude_Upload.jpg
Focus_On_IP.jpg
Force_Failover.jpg
Force_Failover_Second_Time.jpg
Force_HA_Failover.jpg
Force_Resync_Greyed_Out.jpg
Forideceptor_deployment_wizards_config2.jpg
Forideceptor_deployment_wizards_setnetwork1.jpg
Forideceptor_deployment_wizards_setnetwork2.jpg
FortiDeceptor_CreatingDecoy_NetworkConfig.jpg
FortiDeceptor_Creating_Decoy_DeployButton.jpg
FortiDeceptor_Creating_New_Decoy.jpg
FortiDeceptor_DecoyStatus_StatusRunning.jpg
FortiDeceptor_DecoyStatus_preparing.jpg
FortiDeceptor_DeployWizard_DecoyPart.jpg
FortiDeceptor_DeployWizard_FirstPart.jpg
FortiDeceptor_Menu_DeploymentWizard.jpg
FortiDeceptor_login_screen.jpg
FortiGate1_CLI_Primary.jpg
FortiGate2_Primary.jpg
FortiGate_HA_NotSynched.jpg
FortiPAM_LaunchSecret.jpg
FortiPAM_recording_Video_inside_RDP.jpg
FortiSRA_LaunchSecret_After_Approval.jpg
FortiSRA_LaunchingSecret_VideoRecording.jpg
FortiSRA_LaunchingSecret_VideoRecording_Part2.jpg
FortiSRA_LaunchingSecret_VideoRecording_Part2_Scuccesful.jpg
FortiSRA_LogsOverview.jpg
FortiSRA_Logs_ViewVideoButton.jpg
FortiSRA_MenuOverview_SecretEventAndVideo.jpg
FortiSRA_RequestStartJob.jpg
FortiSRA_Secret_Request_Part1.jpg
FortiSRA_watching_RecordedVideo.jpg
Fortigate.jpg
Fortigatefwai1.jpg
Fortipam_Screen_Before_Recording.jpg
Fortipamcreatesecret_settings.jpg
Fortipamloginscreen.jpg
Generative_AI_In_Profile.jpg
GetSystemToken_W10.jpg
GettingIntoDCOT.jpg
Go_To_Log_And_Report.jpg
Guardian_Detect_ChangeIP.jpg
Guardian_Detect_ChangeIP_Part2.jpg
Guardian_Detect_ChangeIP_Part3.jpg
Guardian_Detect_ChangeIP_Part4.jpg
Guardian_Detect_ChangeIP_Part5.jpg
Guardian_Detect_ChangeIP_Part6.jpg
Guardian_Enriched_After_Smart_Polling.jpg
HA_In_Synch.jpg
HackPLC_Initiate_Scan.jpg
HackPLC_Initiate_Scan_Result.jpg
Hack_PLC_Change_Network_Config.jpg
Hack_PLC_Change_Network_Config_Part2.jpg
Hack_PLC_Result_On_PLC.jpg
Hack_PLC_Result_On_PLC_Part2.jpg
Hack_PLC_Stop_CPU.jpg
IT_To_Internet_Policy.jpg
Inside_Beacon_Console.jpg
Inside_Beacon_Help_Command.jpg
Inside_Beacon_UACBypass.jpg
Inside_Logs_To_App_Control.jpg
Inside_Session_graph_1_beacon.jpg
Interactive_PLC_Hack_part1.jpg
Interactive_PLC_Hack_part2.jpg
Interactive_PLC_Hack_part3.jpg
Interactive_PLC_Hack_part4.jpg
Interactive_PLC_Hack_part5.jpg
Log_Details.jpg
LoginAsIT-Admin.jpg
NN_Guardian_Detected_Active.jpg
NN_Guardian_Detected_Passively.jpg
NN_Guardian_ExecutePlan.jpg
NN_Guardian_SP_Add_nodes.jpg
NN_Guardian_SmartPollingMenu.jpg
NN_Guardian_SmartPolling_Menu.jpg
NN_Guardian_SmartPolling_NewPlanButton.jpg
NN_Guardian_SmartPolling_NewPlan_Empty.jpg
NN_Guardian_SmartPolling_NewPlan_FilledIn.jpg
NN_Guardian_little_i_icon.jpg
On_W10_S1_Detected_VPNBeacon.jpg
Operations.jpg
PAM_Flow.png
Powershell_find_DC.jpg
Ransom-2.jpg
Ransom-3.jpg
Ransom-5.jpg
Ransom-6.jpg
Ransom-7.jpg
Ransom-8.jpg
Refresh_Chrome.jpg
Requirement_Deep_Inspection.jpg
RightClickBeacon_ProcessBrowser.jpg
RightClickBeacon_ToConsole.jpg
RightClickVirus_RunAsAdmin.jpg
RightClick_StealToken_EngAdmin.jpg
Right_Click_In_Session_Table.jpg
Right_click_In_session_graph.jpg
Run_VPN_config_AsAdmin.jpg
Screenshot_dnsexfill_1.png
Screenshot_dnsexfill_2.png
Screenshot_dnsexfill_3.png
Screenshot_dnsexfill_4.png
Screenshot_dnsexfill_5.png
Seeing_AI_Logs.jpg
Select_keyboard.jpg
Select_secondary.jpg
SentinelOne_BeaconDetected.jpg
SentinelOne_Beacon_ActionsToTake.jpg
SentinelOne_Beacon_AlertEndpoint.jpg
SentinelOne_Beacon_DetectionDetails.jpg
SentinelOne_Beacon_FileAndProcess.jpg
SentinelOne_Beacon_GoToGraphExplorer.jpg
SentinelOne_Beacon_InsideGraphViewer.jpg
SentinelOne_Beacon_PurpleAI.jpg
SentinelOne_Beacon_TargetAsset.jpg
SentinelOne_Dashboard.jpg
SentinelOne_OpenedAlert.jpg
SessionGraph_With_AllDevices_OT.jpg
Session_Appears.jpg
Session_Graph_Icon.jpg
Show_DC-IT_Beacon.jpg
StartingAdaptixClient.jpg
StartingPLC.jpg
Starting_AdaptixClient.jpg
StealAdminToken.jpg
StealToken_it-admin.jpg
Switching_Between_Session_Graph_And_Session_Table.jpg
TIAPortal_GoOnline.jpg
TIAPortal_Online_Loading.jpg
TIAPortal_OpenProject.jpg
TIAPortal_SelectPLC.jpg
TIA_Portal_DoubleClick_DeviceConfiguration.jpg
TIA_Portal_Online_Completed.jpg
TIAportal_CompileToDevice.jpg
TIAportal_OpenProjectView.jpg
Upload_Beacon_To_Share.jpg
Upload_Block_Failed.jpg
Upload_Blocked.jpg
Upload_Blocked_Logs.jpg
Upload_Claude.jpg
Upload_File_Claude_2.jpg
UserInsideDCSession.jpg
VPN_is_Connected_popup.jpg
Vantage_Detect_ChangeIP_Part1.jpg
Vantage_Detect_ChangeIP_Part2.jpg
Vantage_Detect_ChangeIP_Part3.jpg
Vantage_Detect_ChangeIP_Part4.jpg
Vantage_SmartPolling_Addbutton.jpg
Vantage_SmartPolling_ConfigurationPart1.jpg
Vantage_SmartPolling_ConfigurationPart2.jpg
Vantage_SmartPolling_ConfigurationPart3.jpg
Vantage_SmartPolling_ConfigurationPart4.jpg
Vantage_SmartPolling_Menu.jpg
W10_Process_Browser_Again.jpg
Win10_IT_GoingToShare.jpg
accessdenied.jpg
adaptix_axscriptmanager_BOF.jpg
adaptixclient_profile.jpg
adaptixconsole_axscript.jpg
all_beacons_graph.jpg
config_Diff_In_Sync.jpg
disallowed.jpg
fortigategenai.jpg
fortigatesslgenai.jpg
fortinetgenai2.jpg
fortipam_editsecret_adminapproval.jpg
fortipam_editsecret_recording.jpg
fortipam_secret_details_general.jpg
fortipam_secret_details_settings.jpg
fortipam_secret_gateway.jpg
fortipam_secret_target.jpg
fortipamcreatesecret_filledin.jpg
fortipamcreatesecrettemplateselection.jpg
fortipamcreatetargetempty.jpg
fortipamcreatetargetfilledin.jpg
fortipamgotosecrets.jpg
fortipamgototargets.jpg
image_4.png
image_5.png
image_6.png
image_7.png
pam-.jpg
please-pretty.jpg
powershell_py_tool.jpg
pslist_BOF_insideConsole_secondBeacon.jpg
puTTY.jpg
ransom-1.jpg
show-config-admin.jpg
snip-s1.jpg
snip10-deceptor.jpg
snip11-deceptor.jpg
snip12-deceptor.jpg
snip13-deceptor.jpg
snip14-deceptor.jpg
snip1_deceptor.jpg
snip2-s1.jpg
snip3-s1.jpg
snip4-deceptor.jpg
snip5-deceptor.jpg
snip6-deceptor.jpg
snip7-deceptor.jpg
snip8-deceptor.jpg
split_terminal_horizontally.jpg
starting_adaptixserver.jpg
xnip2-deceptor.jpg
xnip3-deceptor.jpg
UNUSED_LIST

echo ""
echo "Done. Moved $moved file(s) into $DEST"
[ "$missing" -gt 0 ] && echo "$missing file(s) were already gone (fine on a re-run)."
echo "Referenced images remain in $IMG_DIR."
