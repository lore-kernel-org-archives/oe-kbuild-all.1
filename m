Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610933ADAF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059354; cv=none; b=T5oVcMBwjZJWy+KHkjb+/rSPxMA4ek3iUGdGzAc0kIj/ZeWO1/CG+FYBGmgISZKfCfCbZvYFWeEvGkv0KO77XjgZ/tDXgBmjKk/vxwI1F2QRS+ogBoyBhYtaBFItx3S0gdK+nt6beeezNsFCV2XBM1uTeFVjK05rg/gow7HQPQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059354; c=relaxed/simple;
	bh=3Gr+ou/7S145m5BgT3QJizEly49CwDfW+ViL5pyinXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mQTpcRe2Z8pS270LpghZvcPOuRlwjV130P/5XrgTw388P/MzkIvYv2OAsypVrfrQsFWlrO/hDRzxhetZ1WASSW/P6QIpxf+OGnKCYq2UP8tWLdS3f+JpUbUYvSmHJojSVGhT4GtirLJCSNElLGh0PYfVAlEWUMysLyHwnXrHQDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AiAsclvK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AiAsclvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778059353; x=1809595353;
  h=date:from:to:cc:subject:message-id;
  bh=3Gr+ou/7S145m5BgT3QJizEly49CwDfW+ViL5pyinXc=;
  b=AiAsclvKVJuPOTFD2aE75scp3C56iFBw5+5/j4/1RLfliXb+JHsVU37y
   hSMFCxa1xMkpSKsq/SQX0bF9KTU9+6qqFUBHositcJB2IsmVYWKKUQ8i4
   za0+9JslzZDV7uHtKGOuk1tvzcDQrQp5y0regW90Eq18VsE87FpTvphta
   ad08ao2C6dzhVa5NqObT5MSyyREsHzh//+nJrXeawz1stgRZPeyK+btu0
   3jg2YrZBYFMgcu+BIBqNyS634IhE2Akn8mtjNlXdrNFDN+mWGP1IGHcph
   nNy1zcwJtOS1TzcdzYXLfV/nVfs7cGy57xqwImMKiPs3KGKQGV1BPofBz
   Q==;
X-CSE-ConnectionGUID: I0rcUudrSmuorvceAEs/Fw==
X-CSE-MsgGUID: mNO1f3amSU6MxGKbnuxL1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="79092638"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="79092638"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:22:32 -0700
X-CSE-ConnectionGUID: cyJItb09SU69wEU5SMjVIA==
X-CSE-MsgGUID: CQYc5u8ETpy6M0P63vChnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259517996"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 May 2026 02:22:30 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKYSa-000000000ql-0E0Q;
	Wed, 06 May 2026 09:22:28 +0000
Date: Wed, 06 May 2026 17:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Gospodarek <gospo@broadcom.com>,
 Dave Jiang <dave.jiang@intel.com>
Subject: drivers/fwctl/bnxt/main.c:85 bnxtctl_validate_rpc() warn:
 always true condition '(scope >= 0) => (0-u32max >= 0)'
Message-ID: <202605061701.ZCok0cvD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   74fe02ce122a6103f207d29fafc8b3a53de6abaf
commit: e782efb830cd8c1879ee15d80c6441ac9fa6c8a8 fwctl/bnxt_fwctl: Add bnxt fwctl device
date:   5 weeks ago
config: loongarch-randconfig-r073-20260506 (https://download.01.org/0day-ci/archive/20260506/202605061701.ZCok0cvD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e782efb830cd ("fwctl/bnxt_fwctl: Add bnxt fwctl device")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061701.ZCok0cvD-lkp@intel.com/

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
