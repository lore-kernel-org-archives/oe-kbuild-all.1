Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2191023D29A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 02:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761791777; cv=none; b=KsmLNND/IbvfQud0meOgq3EpXho80MNnamYhsVyL6WTrCIqIDN1InwQZtgACSeoBF1uwwYtsFARAKDJ5mxbigy+Yj15jLlTuTtDRUyekBhrSx7sn9ethrwmeR54NpC3ZpGDF7GeCaEKUoX6kFQjzdDPC+EECsFPDyxbRyqi8LzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761791777; c=relaxed/simple;
	bh=LRMwM4eZvPR2Ccf6B0WOp2RbG6muwdbgNHyQwPW3fzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFZDidPPcWqNji1CodwhrROn3Jq/Rj7VomkwsXo7stzJ79ReIVFxRyFJ4Jh/AQBU9RhupLZwWHva01AQ9W/LT+7UVEfdgpuVmM5dCRWHtiiw8Zq8QrEsJFsSca7waZHW2eFnbgmTaZb9h1jVzAAK5dwYGkiJf4oVgh0iohKsUiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHgG+/hZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHgG+/hZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761791776; x=1793327776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LRMwM4eZvPR2Ccf6B0WOp2RbG6muwdbgNHyQwPW3fzg=;
  b=ZHgG+/hZx34yIwuPxRrtkGRLHne497BKOusPTQcFuUpNgp25TbXpx/xl
   DZN/8J7SehC8r9DHyAk5mcePYoILdqn266umDk607d+wVTH1Ar44AUCjW
   RXM5hmNbpDTy9yzoRzDhOHm3t7D5YN760X1NlfXkcyBSrvieLZjjjVly8
   f45OcYEi1V6qEcm6iOKcxw7+n4O0vLgR5dRlV/H5vF/NYOHDkbwwtcFpF
   ns5SX4ZDAbDHiKnaVmYZiNoRF2DkRHFLO6MNAs+UGR49AL6F5GyzNN2Bl
   Gx/FRAi7kqRL/0r/sWQ0Lv99o9aV83q6y+yUBui0Gx7nfCRC0tr9W/XI3
   Q==;
X-CSE-ConnectionGUID: Pq9RTuFvTSuhHqyvR/cxIw==
X-CSE-MsgGUID: aQvcJgL+ReqoLdPst++OQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63855783"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63855783"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 19:36:13 -0700
X-CSE-ConnectionGUID: NS+qboYPRRqE4TD7PP6rgw==
X-CSE-MsgGUID: KGg4dIpsQ0unIxKGXAiyxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="186275043"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2025 19:36:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEIVn-000LNY-2t;
	Thu, 30 Oct 2025 02:35:56 +0000
Date: Thu, 30 Oct 2025 10:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3257/3257]
 drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_export.c:136:15: sparse:
 sparse: dubious: !x & y
Message-ID: <202510301004.ccwoc5o8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5860abf4ca1c1e5ced0d4787886db4195a9c54ea
commit: ebbca448bcac138da959c5582ab481fd207b68fd [3257/3257] Net: ethernet: Support 3snic 3s9xx network card 3snic inclusion category: feature bugzilla: https://gitee.com/openeuler/kernel/issues/I6TX4J CVE: NA
config: x86_64-randconfig-121-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301004.ccwoc5o8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301004.ccwoc5o8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301004.ccwoc5o8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_export.c:37:11: sparse: sparse: symbol 'sss_rx_buf_size_level' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_export.c:136:15: sparse: sparse: dubious: !x & y
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:311:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *db_base @@     got unsigned char [noderef] [usertype] __iomem *db_base @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:311:54: sparse:     expected unsigned char [usertype] *db_base
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:311:54: sparse:     got unsigned char [noderef] [usertype] __iomem *db_base
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:31: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:533:12: sparse: sparse: context imbalance in 'sss_ctrlq_msg_lock' - different lock contexts for basic block
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:547:13: sparse: sparse: context imbalance in 'sss_ctrlq_msg_unlock' - unexpected unlock
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:311:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:309:54: sparse: sparse: incompatible types in conditional expression (different address spaces):
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:309:54: sparse:    void [noderef] __iomem *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:309:54: sparse:    unsigned char [usertype] *
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:48:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:48:36: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:48:36: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:72:68: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:72:68: sparse:     expected unsigned int flag
   drivers/net/ethernet/3snic/sssnic/hw/sss_wq.c:72:68: sparse:     got restricted gfp_t

vim +136 drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_export.c

   127	
   128	void sss_chip_clear_msix_resend_bit(void *hwdev, u16 msix_id, bool clear_en)
   129	{
   130		u32 val;
   131	
   132		if (!hwdev)
   133			return;
   134	
   135		val = SSS_SET_MSI_CLR_INDIR(msix_id, SIMPLE_INDIR_ID) |
 > 136		      SSS_SET_MSI_CLR_INDIR(!!clear_en, RESEND_TIMER_CLR);
   137	
   138		sss_chip_write_reg(SSS_TO_HWIF(hwdev), SSS_CSR_FUNC_MSI_CLR_WR_ADDR, val);
   139	}
   140	EXPORT_SYMBOL(sss_chip_clear_msix_resend_bit);
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
