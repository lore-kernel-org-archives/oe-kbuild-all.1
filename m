Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E8336EA8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327760; cv=none; b=ebTty1vn5wHWDwp+EAK7XSJsY3Z16SfAeFVYnrJo/DTCxm/xP7Rc1Kk+6MOiua9oXU8Xg8LvzkhVvEKqplzyiQ486AqwSXemGi9ojzNF1n84zZB0WlhHHqeqihB/X0GruZM1yYlzHWqvkdhbXkP+SkO0IcIhUUy6pFj11lckL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327760; c=relaxed/simple;
	bh=xpw7Lb3IyGVuNXgsa8It18ulURhPwPoN/iPZXz4KI+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WNn7gAf4gPTauXFhOJ0JfLkJNPN0ls5ZIP6iQ3A22073qQfSnUPfAeIU2m7yYk3+6eun4sBmlfuV6Sq8GhQjlIZUh2qkqMGgI4TdPxAb/sDH1QBCeNxLNfVZhH11pcX51fOu0IulNbMl6+/R3J16s1wzprrR/IuM4fAm5hUnm4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcX5azP1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcX5azP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787327756; x=1818863756;
  h=date:from:to:cc:subject:message-id;
  bh=xpw7Lb3IyGVuNXgsa8It18ulURhPwPoN/iPZXz4KI+Y=;
  b=BcX5azP13GIw69MlkvZuJ9JgX5eBtnCWuvisVGBRBY8o75UgHO/bwpMW
   64XL6yh+4A6ZxV2ZmdAPCSfLwLtHQMJybAX2pHGFbCDSXGne/klZFAsmG
   YNip4hCDYjGgOKlr/VdX78MEUi9QcxAxgZhmeboAoRDUCW5XTqvcJYSCn
   5CuIUzn98Gbw1XjWXgyRjzCSHklAledbEUlx0mTn9CEAJzC4dMaZ9lN7C
   cMQ/QpJEDgmva17FZkSFaRlfQgrNvmR0GUvAZWZqAqNtLlUGHeJxQWUAo
   x7gfaCJlhXCNrb/TdUiAarEGitzsWlGqXquigYgr7zk01Xg7yhrPjoDxr
   A==;
X-CSE-ConnectionGUID: TH85zQIXRKyvFi2Pm45Gjg==
X-CSE-MsgGUID: YDe+34T5S+GwXTlk50ygJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="105258427"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="105258427"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 08:55:54 -0700
X-CSE-ConnectionGUID: Wjv68jYBT0q4tNQHD8hi5w==
X-CSE-MsgGUID: PzIKYV29TKCNRlM1bSOIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291235239"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 08:55:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxRau-00000000q81-32uL;
	Fri, 21 Aug 2026 15:55:48 +0000
Date: Fri, 21 Aug 2026 23:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Gospodarek <gospo@broadcom.com>,
 Dave Jiang <dave.jiang@intel.com>
Subject: drivers/fwctl/bnxt/main.c:85 bnxtctl_validate_rpc() warn:
 always true condition '(scope >= 0) => (0-u32max >= 0)'
Message-ID: <202608212315.eIwZpVXQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   818bebeb63dd6bf5f4e07e145f6cdbace520a34c
commit: e782efb830cd8c1879ee15d80c6441ac9fa6c8a8 fwctl/bnxt_fwctl: Add bnxt fwctl device
date:   5 months ago
config: powerpc-randconfig-r073-20260821 (https://download.01.org/0day-ci/archive/20260821/202608212315.eIwZpVXQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e782efb830cd ("fwctl/bnxt_fwctl: Add bnxt fwctl device")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608212315.eIwZpVXQ-lkp@intel.com/

smatch warnings:
drivers/fwctl/bnxt/main.c:85 bnxtctl_validate_rpc() warn: always true condition '(scope >= 0) => (0-u32max >= 0)'

vim +85 drivers/fwctl/bnxt/main.c

    57	
    58	/* Caller must hold edev->en_dev_lock */
    59	static bool bnxtctl_validate_rpc(struct bnxt_en_dev *edev,
    60					 struct bnxt_fw_msg *hwrm_in,
    61					 enum fwctl_rpc_scope scope)
    62	{
    63		struct input *req = (struct input *)hwrm_in->msg;
    64	
    65		lockdep_assert_held(&edev->en_dev_lock);
    66		if (edev->flags & BNXT_EN_FLAG_ULP_STOPPED)
    67			return false;
    68	
    69		switch (le16_to_cpu(req->req_type)) {
    70		case HWRM_FUNC_RESET:
    71		case HWRM_PORT_CLR_STATS:
    72		case HWRM_FW_RESET:
    73		case HWRM_FW_SYNC:
    74		case HWRM_FW_SET_TIME:
    75		case HWRM_DBG_LOG_BUFFER_FLUSH:
    76		case HWRM_DBG_ERASE_NVM:
    77		case HWRM_DBG_CFG:
    78		case HWRM_NVM_DEFRAG:
    79		case HWRM_NVM_FACTORY_DEFAULTS:
    80		case HWRM_NVM_FLUSH:
    81		case HWRM_NVM_VERIFY_UPDATE:
    82		case HWRM_NVM_ERASE_DIR_ENTRY:
    83		case HWRM_NVM_MOD_DIR_ENTRY:
    84		case HWRM_NVM_FIND_DIR_ENTRY:
  > 85			return scope >= FWCTL_RPC_CONFIGURATION;
    86	
    87		case HWRM_VER_GET:
    88		case HWRM_ERROR_RECOVERY_QCFG:
    89		case HWRM_FUNC_QCAPS:
    90		case HWRM_FUNC_QCFG:
    91		case HWRM_FUNC_QSTATS:
    92		case HWRM_PORT_PHY_QCFG:
    93		case HWRM_PORT_MAC_QCFG:
    94		case HWRM_PORT_PHY_QCAPS:
    95		case HWRM_PORT_PHY_I2C_READ:
    96		case HWRM_PORT_PHY_MDIO_READ:
    97		case HWRM_QUEUE_PRI2COS_QCFG:
    98		case HWRM_QUEUE_COS2BW_QCFG:
    99		case HWRM_VNIC_RSS_QCFG:
   100		case HWRM_QUEUE_GLOBAL_QCFG:
   101		case HWRM_QUEUE_ADPTV_QOS_RX_FEATURE_QCFG:
   102		case HWRM_QUEUE_ADPTV_QOS_TX_FEATURE_QCFG:
   103		case HWRM_QUEUE_QCAPS:
   104		case HWRM_QUEUE_ADPTV_QOS_RX_TUNING_QCFG:
   105		case HWRM_QUEUE_ADPTV_QOS_TX_TUNING_QCFG:
   106		case HWRM_TUNNEL_DST_PORT_QUERY:
   107		case HWRM_PORT_TX_FIR_QCFG:
   108		case HWRM_FW_LIVEPATCH_QUERY:
   109		case HWRM_FW_QSTATUS:
   110		case HWRM_FW_HEALTH_CHECK:
   111		case HWRM_FW_GET_TIME:
   112		case HWRM_PORT_EP_TX_QCFG:
   113		case HWRM_PORT_QCFG:
   114		case HWRM_PORT_MAC_QCAPS:
   115		case HWRM_TEMP_MONITOR_QUERY:
   116		case HWRM_REG_POWER_QUERY:
   117		case HWRM_CORE_FREQUENCY_QUERY:
   118		case HWRM_CFA_REDIRECT_QUERY_TUNNEL_TYPE:
   119		case HWRM_CFA_ADV_FLOW_MGNT_QCAPS:
   120		case HWRM_FUNC_RESOURCE_QCAPS:
   121		case HWRM_FUNC_BACKING_STORE_QCAPS:
   122		case HWRM_FUNC_BACKING_STORE_QCFG:
   123		case HWRM_FUNC_QSTATS_EXT:
   124		case HWRM_FUNC_PTP_PIN_QCFG:
   125		case HWRM_FUNC_PTP_EXT_QCFG:
   126		case HWRM_FUNC_BACKING_STORE_QCFG_V2:
   127		case HWRM_FUNC_BACKING_STORE_QCAPS_V2:
   128		case HWRM_FUNC_SYNCE_QCFG:
   129		case HWRM_FUNC_TTX_PACING_RATE_PROF_QUERY:
   130		case HWRM_PORT_PHY_FDRSTAT:
   131		case HWRM_DBG_RING_INFO_GET:
   132		case HWRM_DBG_QCAPS:
   133		case HWRM_DBG_QCFG:
   134		case HWRM_DBG_USEQ_FLUSH:
   135		case HWRM_DBG_USEQ_QCAPS:
   136		case HWRM_DBG_SIM_CABLE_STATE:
   137		case HWRM_DBG_TOKEN_QUERY_AUTH_IDS:
   138		case HWRM_NVM_GET_DEV_INFO:
   139		case HWRM_NVM_GET_DIR_INFO:
   140		case HWRM_SELFTEST_QLIST:
   141			return scope >= FWCTL_RPC_DEBUG_READ_ONLY;
   142	
   143		case HWRM_PORT_PHY_I2C_WRITE:
   144		case HWRM_PORT_PHY_MDIO_WRITE:
   145			return scope >= FWCTL_RPC_DEBUG_WRITE;
   146	
   147		default:
   148			return false;
   149		}
   150	}
   151	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
