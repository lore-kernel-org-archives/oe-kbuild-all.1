Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3882713C9D4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 08:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726042063; cv=none; b=jKfa+cUg1nUv559GsbEiCQkwvAdTFRMfggM0XYii4vgeh3dHVpPY2UDLjyYwzysT+Hy4YFiqqGe2yb8aVLj3Kf5LmKFfs4O1vFJEKGlID20RZORoc+VeNRBaehBeGDrzssMnYzmQU2874m/1e+G8qtp4z2Z9lWVgIS6DBByA9Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726042063; c=relaxed/simple;
	bh=tzv1hLv69V7adFmlYlqpVe3PqDjbyMSihh0GNMqUPsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ip1X1Vk73zppAHj25DSPveXz/1ewggVL9iZEiPda3zcIy87uTBN2j9/iKFq/agS+3dpJfgdIjXk5tmP7XseWKhR7FdW6xtC8VQwnMr0Us3loEx9BuwINyyH0ZHg5RC8iAOLdNxAGH+fxUbzawl4+qN1mUeI3XPcvvkyfJ6k/aKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1kaIgIE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1kaIgIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726042062; x=1757578062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tzv1hLv69V7adFmlYlqpVe3PqDjbyMSihh0GNMqUPsU=;
  b=l1kaIgIE9AMmqxjmP14inCbWwc+Q+vwrRZ3eUWtxZdAEqiBRk5CCRglX
   ZA/B3LFKwcYwLewid0tU1qtb9G7YzmlzpZndWp+zHKzd6lyOXl0Ni/Ugs
   cGO6J1Y5vNW+IskBwZADHQriiKUjKdu105RPQywxplicEblTKpJBJMV9p
   9vOYDAQ7uXFpkZqWHWGP8aH2/pmeQV5GMu/4Sue/f1Q9tvwoXog8J4MRL
   ZnyJdiB5E/PeDPklz8n1FgvQMNErcCdMBd3cSWolsN4PkqNlaUFcrU81U
   upfZOW4r4rUbcPz3evhfIT553goA78OavrKMH0m1NO3RDmcAbr5210JJT
   g==;
X-CSE-ConnectionGUID: /WsbE/ZiSK+LFhVZx68Jiw==
X-CSE-MsgGUID: 36M2bfl+TMmBdgsjIgsxBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36180869"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="36180869"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 01:07:40 -0700
X-CSE-ConnectionGUID: yoYl8tuURmKXQTZELaPvPw==
X-CSE-MsgGUID: IdWmv0zDQeGSn6rTDmRucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="72063083"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Sep 2024 01:07:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soIO0-0003DV-1S;
	Wed, 11 Sep 2024 08:07:36 +0000
Date: Wed, 11 Sep 2024 16:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13350/15118]
 drivers/net/wireless/iwl7000/iwlwifi/fw/dbg.c:3325:5: warning: no previous
 prototype for function 'iwl_fw_send_timestamp_marker_cmd'
Message-ID: <202409111621.yDmf6g5z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   997445cbc4f201b247ea9ceee1996ed430ca8e18
commit: 90bd21b536dd67fe8cd25d1a905b81a288d8bbf3 [13350/15118] CHROMIUM: iwl7000: add driver
config: x86_64-buildonly-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111621.yDmf6g5z-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111621.yDmf6g5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111621.yDmf6g5z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/iwl7000/iwlwifi/fw/dbg.c:3325:5: warning: no previous prototype for function 'iwl_fw_send_timestamp_marker_cmd' [-Wmissing-prototypes]
    3325 | int iwl_fw_send_timestamp_marker_cmd(struct iwl_fw_runtime *fwrt)
         |     ^
   drivers/net/wireless/iwl7000/iwlwifi/fw/dbg.c:3325:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3325 | int iwl_fw_send_timestamp_marker_cmd(struct iwl_fw_runtime *fwrt)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_ARC4
   Depends on [n]: CRYPTO [=y] && CRYPTO_USER_API_ENABLE_OBSOLETE [=n]
   Selected by [m]:
   - IWL7000 [=m] && NETDEVICES [=y] && WLAN [=y] && PCI [=y] && HAS_IOMEM [=y] && CFG80211 [=m] && X86_64 [=y] && m && MODULES [=y]


vim +/iwl_fw_send_timestamp_marker_cmd +3325 drivers/net/wireless/iwl7000/iwlwifi/fw/dbg.c

  3324	
> 3325	int iwl_fw_send_timestamp_marker_cmd(struct iwl_fw_runtime *fwrt)
  3326	{
  3327		struct iwl_mvm_marker marker = {
  3328			.dw_len = sizeof(struct iwl_mvm_marker) / 4,
  3329			.marker_id = MARKER_ID_SYNC_CLOCK,
  3330		};
  3331		struct iwl_host_cmd hcmd = {
  3332			.flags = CMD_ASYNC,
  3333			.id = WIDE_ID(LONG_GROUP, MARKER_CMD),
  3334			.dataflags = {},
  3335		};
  3336		struct iwl_mvm_marker_rsp *resp;
  3337		int cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
  3338						    WIDE_ID(LONG_GROUP, MARKER_CMD),
  3339						    IWL_FW_CMD_VER_UNKNOWN);
  3340		int ret;
  3341	
  3342		if (cmd_ver == 1) {
  3343			/* the real timestamp is taken from the ftrace clock
  3344			 * this is for finding the match between fw and kernel logs
  3345			 */
  3346			marker.timestamp = cpu_to_le64(fwrt->timestamp.seq++);
  3347		} else if (cmd_ver == 2) {
  3348			marker.timestamp = cpu_to_le64(ktime_get_boottime_ns());
  3349		} else {
  3350			IWL_DEBUG_INFO(fwrt,
  3351				       "Invalid version of Marker CMD. Ver = %d\n",
  3352				       cmd_ver);
  3353			return -EINVAL;
  3354		}
  3355	
  3356		hcmd.data[0] = &marker;
  3357		hcmd.len[0] = sizeof(marker);
  3358	
  3359		ret = iwl_trans_send_cmd(fwrt->trans, &hcmd);
  3360	
  3361		if (cmd_ver > 1 && hcmd.resp_pkt) {
  3362			resp = (void *)hcmd.resp_pkt->data;
  3363			IWL_DEBUG_INFO(fwrt, "FW GP2 time: %u\n", le32_to_cpu(resp->gp2));
  3364		}
  3365	
  3366		return ret;
  3367	}
  3368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
