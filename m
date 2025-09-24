Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C351C9DE5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 06:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758695701; cv=none; b=d+zo0UZjNlzI5xTjGO+Qcn9FOOgUzyVc6LzujLFxSY/iUgVNoc+ju1WhC9btKdaa474MmamsjDLwUiOBH56zTaIZulOMMKEshNXfb5DSIEYjwxhVeQLdvaxetRiUKSuC1QClP+PpcIRIrau/FWDMdNWTSeQKmLgmP98cOU2FySA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758695701; c=relaxed/simple;
	bh=RYs6dFZoDg6kEk1qs/2ATg5d1YjH6ApQZkfP4u1s+cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/PR8GmMDy1PCDlyDDyrvvar9WEGbch3N4boDoFmGWNqf0geiX7hPlVCjhG9jgm+BwLIPyDAkAGOPiININCB3KiASiZA5iKjl0FhQc0n2rrpbJXnolGKPkkwiDUWrXH2oZwH0UPNsu43IeHNmktKeEcVPPOEEYV+5eaGRVTq0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoxnygIT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoxnygIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758695700; x=1790231700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RYs6dFZoDg6kEk1qs/2ATg5d1YjH6ApQZkfP4u1s+cs=;
  b=DoxnygITenzxNnhLvARtDOK1wwxZiBBc/t/KfelUFEOyBSpvoq/eLzHU
   GR7MGiaD+3jk/I12MZGivQEjFTXI7yxf2sEW7WSQ4Is6vfqvN1tDRdBz3
   7b2ow6YlMUuYaYU95d9jJbg7Kzj4iUxkoeXwuwZllvMUO+Y0ePTlI1WkG
   N4i62oXJKen9ih5LtYygXtsc+52CcXXNAEB/SYH1DREilR1kj0lUfx68c
   PLL4t8/P8pr5dRL1L/9QFrRdDWUfhD1oN531Qm9e2wJ6/G0RFeA3TDQZO
   N1zEHTXu7ACC0r/tTXKklMe8/JYke/fH6IEk3ME8PTfIlHBnjDZNJCBkO
   g==;
X-CSE-ConnectionGUID: hZTFtx3NSnSS27TW+udsfA==
X-CSE-MsgGUID: HFkDcmOmT4yQCa5JNVJFrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60926305"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60926305"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 23:34:59 -0700
X-CSE-ConnectionGUID: Nd63gH7LS9CBANKqRHa9yA==
X-CSE-MsgGUID: p2x5b2q5TD2w7Q350HXPkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176789062"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Sep 2025 23:34:57 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1J5b-0003rR-1U;
	Wed, 24 Sep 2025 06:34:55 +0000
Date: Wed, 24 Sep 2025 14:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1]
 drivers/net/wireless/marvell/libertas/cfg.c:1106:18: warning: comparison of
 distinct pointer types ('typeof (ssid_eid[1]) *' (aka 'const unsigned char
 *') and 'typeof (32) *' (aka 'int *'))
Message-ID: <202509241433.m1ZuOEbP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   c92395c2d69365e987de03603133963279b28a32
commit: 00ad031167017b5cfaf2c0e0ae4a7d1a624882ac [1/1] wifi: libertas: cap SSID len in lbs_associate()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250924/202509241433.m1ZuOEbP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241433.m1ZuOEbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241433.m1ZuOEbP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/marvell/libertas/cfg.c:1106:18: warning: comparison of distinct pointer types ('typeof (ssid_eid[1]) *' (aka 'const unsigned char *') and 'typeof (32) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
    1106 |                 u32 ssid_len = min(ssid_eid[1], IEEE80211_MAX_SSID_LEN);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:876:19: note: expanded from macro 'min'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:867:24: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:857:4: note: expanded from macro '__safe_cmp'
     857 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:843:29: note: expanded from macro '__typecheck'
     843 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                            ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +1106 drivers/net/wireless/marvell/libertas/cfg.c

  1049	
  1050	
  1051	/*
  1052	 * Create association request
  1053	 */
  1054	#define LBS_ASSOC_MAX_CMD_SIZE                     \
  1055		(sizeof(struct cmd_ds_802_11_associate)    \
  1056		 - 512 /* cmd_ds_802_11_associate.iebuf */ \
  1057		 + LBS_MAX_SSID_TLV_SIZE                   \
  1058		 + LBS_MAX_CHANNEL_TLV_SIZE                \
  1059		 + LBS_MAX_CF_PARAM_TLV_SIZE               \
  1060		 + LBS_MAX_AUTH_TYPE_TLV_SIZE              \
  1061		 + LBS_MAX_WPA_TLV_SIZE)
  1062	
  1063	static int lbs_associate(struct lbs_private *priv,
  1064			struct cfg80211_bss *bss,
  1065			struct cfg80211_connect_params *sme)
  1066	{
  1067		struct cmd_ds_802_11_associate_response *resp;
  1068		struct cmd_ds_802_11_associate *cmd = kzalloc(LBS_ASSOC_MAX_CMD_SIZE,
  1069							      GFP_KERNEL);
  1070		const u8 *ssid_eid;
  1071		size_t len, resp_ie_len;
  1072		int status;
  1073		int ret;
  1074		u8 *pos;
  1075		u8 *tmp;
  1076	
  1077		if (!cmd) {
  1078			ret = -ENOMEM;
  1079			goto done;
  1080		}
  1081		pos = &cmd->iebuf[0];
  1082	
  1083		/*
  1084		 * cmd              50 00
  1085		 * length           34 00
  1086		 * sequence         xx xx
  1087		 * result           00 00
  1088		 * BSS id           00 13 19 80 da 30
  1089		 * capabilities     11 00
  1090		 * listen interval  0a 00
  1091		 * beacon interval  00 00
  1092		 * DTIM period      00
  1093		 * TLVs             xx   (up to 512 bytes)
  1094		 */
  1095		cmd->hdr.command = cpu_to_le16(CMD_802_11_ASSOCIATE);
  1096	
  1097		/* Fill in static fields */
  1098		memcpy(cmd->bssid, bss->bssid, ETH_ALEN);
  1099		cmd->listeninterval = cpu_to_le16(MRVDRV_DEFAULT_LISTEN_INTERVAL);
  1100		cmd->capability = cpu_to_le16(bss->capability);
  1101	
  1102		/* add SSID TLV */
  1103		rcu_read_lock();
  1104		ssid_eid = ieee80211_bss_get_ie(bss, WLAN_EID_SSID);
  1105		if (ssid_eid) {
> 1106			u32 ssid_len = min(ssid_eid[1], IEEE80211_MAX_SSID_LEN);
  1107	
  1108			pos += lbs_add_ssid_tlv(pos, ssid_eid + 2, ssid_len);
  1109		} else {
  1110			lbs_deb_assoc("no SSID\n");
  1111		}
  1112		rcu_read_unlock();
  1113	
  1114		/* add DS param TLV */
  1115		if (bss->channel)
  1116			pos += lbs_add_channel_tlv(pos, bss->channel->hw_value);
  1117		else
  1118			lbs_deb_assoc("no channel\n");
  1119	
  1120		/* add (empty) CF param TLV */
  1121		pos += lbs_add_cf_param_tlv(pos);
  1122	
  1123		/* add rates TLV */
  1124		tmp = pos + 4; /* skip Marvell IE header */
  1125		pos += lbs_add_common_rates_tlv(pos, bss);
  1126		lbs_deb_hex(LBS_DEB_ASSOC, "Common Rates", tmp, pos - tmp);
  1127	
  1128		/* add auth type TLV */
  1129		if (MRVL_FW_MAJOR_REV(priv->fwrelease) >= 9)
  1130			pos += lbs_add_auth_type_tlv(pos, sme->auth_type);
  1131	
  1132		/* add WPA/WPA2 TLV */
  1133		if (sme->ie && sme->ie_len)
  1134			pos += lbs_add_wpa_tlv(pos, sme->ie, sme->ie_len);
  1135	
  1136		len = (sizeof(*cmd) - sizeof(cmd->iebuf)) +
  1137			(u16)(pos - (u8 *) &cmd->iebuf);
  1138		cmd->hdr.size = cpu_to_le16(len);
  1139	
  1140		lbs_deb_hex(LBS_DEB_ASSOC, "ASSOC_CMD", (u8 *) cmd,
  1141				le16_to_cpu(cmd->hdr.size));
  1142	
  1143		/* store for later use */
  1144		memcpy(priv->assoc_bss, bss->bssid, ETH_ALEN);
  1145	
  1146		ret = lbs_cmd_with_response(priv, CMD_802_11_ASSOCIATE, cmd);
  1147		if (ret)
  1148			goto done;
  1149	
  1150		/* generate connect message to cfg80211 */
  1151	
  1152		resp = (void *) cmd; /* recast for easier field access */
  1153		status = le16_to_cpu(resp->statuscode);
  1154	
  1155		/* Older FW versions map the IEEE 802.11 Status Code in the association
  1156		 * response to the following values returned in resp->statuscode:
  1157		 *
  1158		 *    IEEE Status Code                Marvell Status Code
  1159		 *    0                       ->      0x0000 ASSOC_RESULT_SUCCESS
  1160		 *    13                      ->      0x0004 ASSOC_RESULT_AUTH_REFUSED
  1161		 *    14                      ->      0x0004 ASSOC_RESULT_AUTH_REFUSED
  1162		 *    15                      ->      0x0004 ASSOC_RESULT_AUTH_REFUSED
  1163		 *    16                      ->      0x0004 ASSOC_RESULT_AUTH_REFUSED
  1164		 *    others                  ->      0x0003 ASSOC_RESULT_REFUSED
  1165		 *
  1166		 * Other response codes:
  1167		 *    0x0001 -> ASSOC_RESULT_INVALID_PARAMETERS (unused)
  1168		 *    0x0002 -> ASSOC_RESULT_TIMEOUT (internal timer expired waiting for
  1169		 *                                    association response from the AP)
  1170		 */
  1171		if (MRVL_FW_MAJOR_REV(priv->fwrelease) <= 8) {
  1172			switch (status) {
  1173			case 0:
  1174				break;
  1175			case 1:
  1176				lbs_deb_assoc("invalid association parameters\n");
  1177				status = WLAN_STATUS_CAPS_UNSUPPORTED;
  1178				break;
  1179			case 2:
  1180				lbs_deb_assoc("timer expired while waiting for AP\n");
  1181				status = WLAN_STATUS_AUTH_TIMEOUT;
  1182				break;
  1183			case 3:
  1184				lbs_deb_assoc("association refused by AP\n");
  1185				status = WLAN_STATUS_ASSOC_DENIED_UNSPEC;
  1186				break;
  1187			case 4:
  1188				lbs_deb_assoc("authentication refused by AP\n");
  1189				status = WLAN_STATUS_UNKNOWN_AUTH_TRANSACTION;
  1190				break;
  1191			default:
  1192				lbs_deb_assoc("association failure %d\n", status);
  1193				/* v5 OLPC firmware does return the AP status code if
  1194				 * it's not one of the values above.  Let that through.
  1195				 */
  1196				break;
  1197			}
  1198		}
  1199	
  1200		lbs_deb_assoc("status %d, statuscode 0x%04x, capability 0x%04x, "
  1201			      "aid 0x%04x\n", status, le16_to_cpu(resp->statuscode),
  1202			      le16_to_cpu(resp->capability), le16_to_cpu(resp->aid));
  1203	
  1204		resp_ie_len = le16_to_cpu(resp->hdr.size)
  1205			- sizeof(resp->hdr)
  1206			- 6;
  1207		cfg80211_connect_result(priv->dev,
  1208					priv->assoc_bss,
  1209					sme->ie, sme->ie_len,
  1210					resp->iebuf, resp_ie_len,
  1211					status,
  1212					GFP_KERNEL);
  1213	
  1214		if (status == 0) {
  1215			/* TODO: get rid of priv->connect_status */
  1216			priv->connect_status = LBS_CONNECTED;
  1217			netif_carrier_on(priv->dev);
  1218			if (!priv->tx_pending_len)
  1219				netif_tx_wake_all_queues(priv->dev);
  1220		}
  1221	
  1222		kfree(cmd);
  1223	done:
  1224		return ret;
  1225	}
  1226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
