Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976523AB88
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768127316; cv=none; b=HhPwv6Qag9qBE6i+lDl/sPLdtbk28iLfUTFIMTo3AhHpVWtlfV+jnOb9sZahQAJJn0jNwHv1zrz7p5PNRiU/uyXtWYoW2aiqBHhXQ5mAZ0zWuTmTWjDuWoj43/82Y/zEZRsq7HxRJJP71hHY6LHaq4I+quuD3oOL8it6YDMomlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768127316; c=relaxed/simple;
	bh=edTuhcMQvi42cTc659NsjN1pjFoySmAZY5l+4tI7Aj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pJ2AEArD+TPOlLqP7C7MEdYtw1H2VC5q+4YiZagpHj+rYm+WvW/bYtEiddioZe1tLYUKbBtBmzgpyI2gqjS5MpdQBnTgxoRmyZBNOlONMvTLVE2m7N+IFOItV+Qcu9mtxtD9APU64TFSAOz+OFvwA2v7UGIynZ00ypeo/PyPgDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fpv9ruiA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fpv9ruiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768127315; x=1799663315;
  h=date:from:to:cc:subject:message-id;
  bh=edTuhcMQvi42cTc659NsjN1pjFoySmAZY5l+4tI7Aj8=;
  b=Fpv9ruiAzS0KhTosMSWmNNaRpkz9x3KvWEsNhOIw8wyxUo8MLPeVKvZf
   QmvsUsjiU/eHjwSOVRqFJnmFL6VEJYvsarudsNIPuAx7rhLo7od26O7uA
   yE4H8gXfxJfoiTIAAny8Kmga+1owpy9m+/8FSgyear/JxTW2QStFKRpJ7
   5/Wmd/ZtOquZK82tFW0wLNOwg/HZknwOMnNgAi/esUANq+Q7Y3LRg1xQG
   DOnlh5mZ9XbFM4df70+sK13yVbbcDlcGCo3AKRHI6/Fr4h3FuEsaPQs/j
   2aslx519JgLHIHXskrZhg6yc5SccM4wWDtt9NvVM51gE3C4qcPYZ+nSNR
   g==;
X-CSE-ConnectionGUID: l5mxs6/HTLOwGst+guIE+Q==
X-CSE-MsgGUID: H94nsA4JTvWvyVsI9WresQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="73278102"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="73278102"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 02:28:34 -0800
X-CSE-ConnectionGUID: kInprEJ2T9WkEfTcJ2WMBQ==
X-CSE-MsgGUID: HNOh8uOVTvyVjA7HX5bmfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="208335105"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jan 2026 02:28:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vesgP-000000009uu-2sKJ;
	Sun, 11 Jan 2026 10:28:29 +0000
Date: Sun, 11 Jan 2026 18:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Michael Chan <michael.chan@broadcom.com>
Subject: [netdev-net-next:main 48/53]
 drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:13: error: implicit
 declaration of function 'boot_cpu_has'; did you mean 'boot_cpu_init'?
Message-ID: <202601111808.WnBJCuWI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   60d8484c4cec811f5ceb6550655df74490d1a165
commit: c470195b989fe7b9f92297e465c4e8a2363c0bb3 [48/53] bnxt_en: Add PTP .getcrosststamp() interface to get device/host times
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260111/202601111808.WnBJCuWI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111808.WnBJCuWI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601111808.WnBJCuWI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c: In function 'bnxt_ptp_init':
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:13: error: implicit declaration of function 'boot_cpu_has'; did you mean 'boot_cpu_init'? [-Wimplicit-function-declaration]
    1141 |             boot_cpu_has(X86_FEATURE_ART))
         |             ^~~~~~~~~~~~
         |             boot_cpu_init
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:26: error: 'X86_FEATURE_ART' undeclared (first use in this function); did you mean 'X86_FEATURE_ANY'?
    1141 |             boot_cpu_has(X86_FEATURE_ART))
         |                          ^~~~~~~~~~~~~~~
         |                          X86_FEATURE_ANY
   drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:26: note: each undeclared identifier is reported only once for each function it appears in


vim +1141 drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c

  1102	
  1103	int bnxt_ptp_init(struct bnxt *bp)
  1104	{
  1105		struct bnxt_ptp_cfg *ptp = bp->ptp_cfg;
  1106		int rc;
  1107	
  1108		if (!ptp)
  1109			return 0;
  1110	
  1111		rc = bnxt_map_ptp_regs(bp);
  1112		if (rc)
  1113			return rc;
  1114	
  1115		if (ptp->ptp_clock && bnxt_pps_config_ok(bp))
  1116			return 0;
  1117	
  1118		bnxt_ptp_free(bp);
  1119	
  1120		WRITE_ONCE(ptp->tx_avail, BNXT_MAX_TX_TS);
  1121		seqlock_init(&ptp->ptp_lock);
  1122		spin_lock_init(&ptp->ptp_tx_lock);
  1123	
  1124		if (BNXT_PTP_USE_RTC(bp)) {
  1125			bnxt_ptp_timecounter_init(bp, false);
  1126			rc = bnxt_ptp_init_rtc(bp, ptp->rtc_configured);
  1127			if (rc)
  1128				goto out;
  1129		} else {
  1130			bnxt_ptp_timecounter_init(bp, true);
  1131			bnxt_ptp_adjfine_rtc(bp, 0);
  1132		}
  1133		bnxt_hwrm_func_drv_rgtr(bp, NULL, 0, true);
  1134	
  1135		ptp->ptp_info = bnxt_ptp_caps;
  1136		if ((bp->fw_cap & BNXT_FW_CAP_PTP_PPS)) {
  1137			if (bnxt_ptp_pps_init(bp))
  1138				netdev_err(bp->dev, "1pps not initialized, continuing without 1pps support\n");
  1139		}
  1140		if ((bp->fw_cap & BNXT_FW_CAP_PTP_PTM) && pcie_ptm_enabled(bp->pdev) &&
> 1141		    boot_cpu_has(X86_FEATURE_ART))
  1142			ptp->ptp_info.getcrosststamp = bnxt_ptp_getcrosststamp;
  1143	
  1144		ptp->ptp_clock = ptp_clock_register(&ptp->ptp_info, &bp->pdev->dev);
  1145		if (IS_ERR(ptp->ptp_clock)) {
  1146			int err = PTR_ERR(ptp->ptp_clock);
  1147	
  1148			ptp->ptp_clock = NULL;
  1149			rc = err;
  1150			goto out;
  1151		}
  1152	
  1153		ptp->stats.ts_pkts = 0;
  1154		ptp->stats.ts_lost = 0;
  1155		atomic64_set(&ptp->stats.ts_err, 0);
  1156	
  1157		if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS) {
  1158			bnxt_refclk_read(bp, NULL, &ptp->current_time);
  1159			WRITE_ONCE(ptp->old_time, ptp->current_time >> BNXT_HI_TIMER_SHIFT);
  1160			ptp_schedule_worker(ptp->ptp_clock, 0);
  1161		}
  1162		ptp->txts_tmo = BNXT_PTP_DFLT_TX_TMO;
  1163		return 0;
  1164	
  1165	out:
  1166		bnxt_ptp_free(bp);
  1167		bnxt_unmap_ptp_regs(bp);
  1168		return rc;
  1169	}
  1170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
