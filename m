Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B398821C9F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471732; cv=none; b=O954Himy4d/XiXL6vhjrHO6SgXFrJ3PWN+laFWa1zR5jm174D5L6D9NPGeYWF+9BMCjowv7rzc+58aysAcEWwcpe45J8Q8EGcjDdWt1mhQugI321EjdS7d+Xeq67S4S3DvZYL8yc2ReA95mFXtlNbWqC8EkXRbB4wNKxdsPBl7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471732; c=relaxed/simple;
	bh=ADYB0ifPc1dppNXb6D+Ghx0brlysISC9VNRTPBcVwzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZ/5ndHtUv/SU9vfsVrClJORRBWd+W2i3v1ihytv7Q8QDgdi+0Pl5hyAd2YvJBH8YiGt+PrQfgGHei0z6l19dyEqmiCz8ND4L3cy8euOQm7Gmkjy5ae6h1/MfIyXWKxrW1pnvbBwzyu2+IoWg/5VXTDFa5M/KFGjiItPw9kpWaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDEtmQVL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDEtmQVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742471731; x=1774007731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ADYB0ifPc1dppNXb6D+Ghx0brlysISC9VNRTPBcVwzA=;
  b=FDEtmQVLifmPk73oCtyBzt8lgCC3ZX9TbLjGrutkhhf3J8zfOZeaLS9Z
   Pja5to9g1nkniHSlP7Ntn0SiF5+Sw5TLQsw8x2Cdaelbzn4O+/R7lXm0I
   nAlZ+i/bpbwk87vG8AOHtbCW7Nf3kklSq5QbzQcsNLwpNcWga0+lVS7xZ
   +oZjg2htan9fbwvQNrGibmLq9ZbCzAmnHHGw1Dlsa8v+pnpc2JFX92aFq
   MtdvOAOwluzww1drwks00hlQ3GdVOfxAR0APnfmJm67MydfKD48p90oQC
   VYy8p/soAHv4xzP9EnwctNCsdura0fy39iLECWT2jolRp94vAxkQOodow
   A==;
X-CSE-ConnectionGUID: Q3YsZHoxRi6+PhNGi+ze8Q==
X-CSE-MsgGUID: nyfzA7i0TdKiUc1kWD67yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54687301"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="54687301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 04:55:29 -0700
X-CSE-ConnectionGUID: 4qcOwSZTRF+3DZPMssnE2A==
X-CSE-MsgGUID: MhqGnwY/SAeo1CrROjT7TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="123078471"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Mar 2025 04:55:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvEUe-0000Pf-2E;
	Thu, 20 Mar 2025 11:55:24 +0000
Date: Thu, 20 Mar 2025 19:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-chromeos:bugfix_6_6 1/1]
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1219:37: error: use of
 undeclared identifier 'fwrt'; did you mean 'for'?
Message-ID: <202503201915.Zsv0WbeC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git bugfix_6_6
head:   7f86f1180df0f18a6911806a3177c6d3c401699f
commit: 7f86f1180df0f18a6911806a3177c6d3c401699f [1/1] wifi: iwlwifi: support BIOS override for 5G9 in CA also in LARI version 8
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250320/202503201915.Zsv0WbeC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201915.Zsv0WbeC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201915.Zsv0WbeC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1219:37: error: use of undeclared identifier 'fwrt'; did you mean 'for'?
    1219 |         u8 cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
         |                                            ^~~~
         |                                            for
>> drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1219:37: error: expected expression
   drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1242:21: error: use of undeclared identifier 'fwrt'; did you mean 'for'?
    1242 |                     !fw_has_capa(&fwrt->fw->ucode_capa,
         |                                   ^~~~
         |                                   for
   drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1242:21: error: expected expression
>> drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1247:6: error: member reference type 'struct iwl_lari_config_change_cmd_v6' is not a pointer; did you mean to use '.'?
    1247 |                 cmd->oem_unii4_allow_bitmap = cpu_to_le32(_value);
         |                 ~~~^~
         |                    .
>> drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1247:31: error: expression is not assignable
    1247 |                 cmd->oem_unii4_allow_bitmap = cpu_to_le32(_value);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   6 errors generated.


vim +1219 drivers/net/wireless/intel/iwlwifi/mvm/fw.c

  1206	
  1207	#define DSM_UNII4_ALLOW_BITMAP (DSM_VALUE_UNII4_US_OVERRIDE_MSK		|\
  1208					DSM_VALUE_UNII4_US_EN_MSK		|\
  1209					DSM_VALUE_UNII4_ETSI_OVERRIDE_MSK	|\
  1210					DSM_VALUE_UNII4_ETSI_EN_MSK		|\
  1211					DSM_VALUE_UNII4_CANADA_OVERRIDE_MSK	|\
  1212					DSM_VALUE_UNII4_CANADA_EN_MSK)
  1213	
  1214	static void iwl_mvm_lari_cfg(struct iwl_mvm *mvm)
  1215	{
  1216		int ret;
  1217		u32 value;
  1218		struct iwl_lari_config_change_cmd_v6 cmd = {};
> 1219		u8 cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
  1220						   WIDE_ID(REGULATORY_AND_NVM_GROUP,
  1221							   LARI_CONFIG_CHANGE), 1);
  1222	
  1223		cmd.config_bitmap = iwl_acpi_get_lari_config_bitmap(&mvm->fwrt);
  1224	
  1225		ret = iwl_acpi_get_dsm_u32(mvm->fwrt.dev, 0, DSM_FUNC_11AX_ENABLEMENT,
  1226					   &iwl_guid, &value);
  1227		if (!ret)
  1228			cmd.oem_11ax_allow_bitmap = cpu_to_le32(value);
  1229	
  1230		ret = iwl_acpi_get_dsm_u32(mvm->fwrt.dev, 0,
  1231					   DSM_FUNC_ENABLE_UNII4_CHAN,
  1232					   &iwl_guid, &value);
  1233		if (!ret) {
  1234			u32 _value = cpu_to_le32(value);
  1235	
  1236			_value &= DSM_UNII4_ALLOW_BITMAP;
  1237	
  1238			/* Since version 9, bits 4 and 5 are supported
  1239			 * regardless of this capability.
  1240			 */
  1241			if (cmd_ver < 9 &&
  1242			    !fw_has_capa(&fwrt->fw->ucode_capa,
  1243					 IWL_UCODE_TLV_CAPA_BIOS_OVERRIDE_5G9_FOR_CA))
  1244				_value &= ~(DSM_VALUE_UNII4_CANADA_OVERRIDE_MSK |
  1245					   DSM_VALUE_UNII4_CANADA_EN_MSK);
  1246	
> 1247			cmd->oem_unii4_allow_bitmap = cpu_to_le32(_value);
  1248		}
  1249	
  1250		ret = iwl_acpi_get_dsm_u32(mvm->fwrt.dev, 0,
  1251					   DSM_FUNC_ACTIVATE_CHANNEL,
  1252					   &iwl_guid, &value);
  1253		if (!ret)
  1254			cmd.chan_state_active_bitmap = cpu_to_le32(value);
  1255	
  1256		ret = iwl_acpi_get_dsm_u32(mvm->fwrt.dev, 0,
  1257					   DSM_FUNC_ENABLE_6E,
  1258					   &iwl_guid, &value);
  1259		if (!ret)
  1260			cmd.oem_uhb_allow_bitmap = cpu_to_le32(value);
  1261	
  1262		ret = iwl_acpi_get_dsm_u32(mvm->fwrt.dev, 0,
  1263					   DSM_FUNC_FORCE_DISABLE_CHANNELS,
  1264					   &iwl_guid, &value);
  1265		if (!ret)
  1266			cmd.force_disable_channels_bitmap = cpu_to_le32(value);
  1267	
  1268		if (cmd.config_bitmap ||
  1269		    cmd.oem_uhb_allow_bitmap ||
  1270		    cmd.oem_11ax_allow_bitmap ||
  1271		    cmd.oem_unii4_allow_bitmap ||
  1272		    cmd.chan_state_active_bitmap ||
  1273		    cmd.force_disable_channels_bitmap) {
  1274			size_t cmd_size;
  1275			u8 cmd_ver = iwl_fw_lookup_cmd_ver(mvm->fw,
  1276							   WIDE_ID(REGULATORY_AND_NVM_GROUP,
  1277								   LARI_CONFIG_CHANGE),
  1278							   1);
  1279			switch (cmd_ver) {
  1280			case 6:
  1281				cmd_size = sizeof(struct iwl_lari_config_change_cmd_v6);
  1282				break;
  1283			case 5:
  1284				cmd_size = sizeof(struct iwl_lari_config_change_cmd_v5);
  1285				break;
  1286			case 4:
  1287				cmd_size = sizeof(struct iwl_lari_config_change_cmd_v4);
  1288				break;
  1289			case 3:
  1290				cmd_size = sizeof(struct iwl_lari_config_change_cmd_v3);
  1291				break;
  1292			case 2:
  1293				cmd_size = sizeof(struct iwl_lari_config_change_cmd_v2);
  1294				break;
  1295			default:
  1296				cmd_size = sizeof(struct iwl_lari_config_change_cmd_v1);
  1297				break;
  1298			}
  1299	
  1300			IWL_DEBUG_RADIO(mvm,
  1301					"sending LARI_CONFIG_CHANGE, config_bitmap=0x%x, oem_11ax_allow_bitmap=0x%x\n",
  1302					le32_to_cpu(cmd.config_bitmap),
  1303					le32_to_cpu(cmd.oem_11ax_allow_bitmap));
  1304			IWL_DEBUG_RADIO(mvm,
  1305					"sending LARI_CONFIG_CHANGE, oem_unii4_allow_bitmap=0x%x, chan_state_active_bitmap=0x%x, cmd_ver=%d\n",
  1306					le32_to_cpu(cmd.oem_unii4_allow_bitmap),
  1307					le32_to_cpu(cmd.chan_state_active_bitmap),
  1308					cmd_ver);
  1309			IWL_DEBUG_RADIO(mvm,
  1310					"sending LARI_CONFIG_CHANGE, oem_uhb_allow_bitmap=0x%x, force_disable_channels_bitmap=0x%x\n",
  1311					le32_to_cpu(cmd.oem_uhb_allow_bitmap),
  1312					le32_to_cpu(cmd.force_disable_channels_bitmap));
  1313			ret = iwl_mvm_send_cmd_pdu(mvm,
  1314						   WIDE_ID(REGULATORY_AND_NVM_GROUP,
  1315							   LARI_CONFIG_CHANGE),
  1316						   0, cmd_size, &cmd);
  1317			if (ret < 0)
  1318				IWL_DEBUG_RADIO(mvm,
  1319						"Failed to send LARI_CONFIG_CHANGE (%d)\n",
  1320						ret);
  1321		}
  1322	}
  1323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
