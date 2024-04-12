Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904421E53A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712942661; cv=none; b=Eq+veunKoCoSvxIMi/hjVyjuJ4/6OwQL5jUHkNUL896RyqMw+RoQBRdsnsvLIBZKXNey3gGTVwxZrlRcoUAdQGM5TJPvpcCkqyd9J21TS+4KMZ8PWZbBEVhH9V2rE5ujLFGeNcoPSZaNiMIvftu+Xol92t72ypT9iKEUBPD2yBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712942661; c=relaxed/simple;
	bh=JwRUeRCbm5RoEett7+JQfBfXL5vCqs+qpoxubwEGxTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F6Gl2R0Aq8J4B+osnUBseViYrDXCpjLG1nRg2rkiUDJX17HLr4jovTHC6I/VvRNzLnoXAAlzNVE9+EKELvb5FRsjufcU8jcknbOfABCWuX1g/smci8ZD2KbypBCCyvPx1IRJFqYb+6iU8QbKoFwSHQRJC9KB17VvnLRyv+MDYHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFanBwqA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFanBwqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712942660; x=1744478660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JwRUeRCbm5RoEett7+JQfBfXL5vCqs+qpoxubwEGxTg=;
  b=fFanBwqAmQAnd3/T+PvPpmazSpwDq0wYRll6kvRYKvskArK7WLlEv32U
   0wd/enbWi9wCM2eofGwaG58tvK9qBXDGt8OJrMvOWfA2F79j2wZio6TJ5
   /F5FKfM5r/oYUPWW2Hj6ilvVnOt/ySpHapRGimI3TQjuZU58ClRpuDuqA
   ovx+Ej1IBh2srKEkH/FYbg0ABRzcKTVHhjHNroYDQc8sCz2HDWScZLrzN
   NWmneWjAq4vEFU1lTBABvn0D8djgwIehG4Uw9MpayMgxb7oXLvDBctN9d
   GIuW//kHVsqypdtZuvh57uLZDDCqrkp6KvPDkU8/a/g5/Kaa8/x/i6c87
   Q==;
X-CSE-ConnectionGUID: BNrXhvYmSLWskMSEJ6HtJg==
X-CSE-MsgGUID: aArG9znSS0Omc4AV8uXY1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12256843"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="12256843"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 10:24:19 -0700
X-CSE-ConnectionGUID: gyRFAnmOQ2yT8fh+di+VDA==
X-CSE-MsgGUID: tsJUyNvZQyeXIOoLW9JhSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21362769"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 10:24:18 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvKdL-0000OR-31;
	Fri, 12 Apr 2024 17:24:15 +0000
Date: Sat, 13 Apr 2024 01:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2730/7378]
 drivers/platform/mpam/mpam_resctrl.c:25:1: sparse: sparse: symbol
 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
Message-ID: <202404130113.aJEKDEIq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2ce949a800b76538410170a027def9b8f24f791a
commit: 9119da1439390ea4f29a0635652248aa3c2040f0 [2730/7378] arm_mpam: resctrl: Allow resctrl to allocate monitors
config: arm64-randconfig-r131-20240412 (https://download.01.org/0day-ci/archive/20240413/202404130113.aJEKDEIq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404130113.aJEKDEIq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404130113.aJEKDEIq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/mpam/mpam_resctrl.c:25:1: sparse: sparse: symbol 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
>> drivers/platform/mpam/mpam_resctrl.c:45:5: sparse: sparse: symbol '__mon_is_rmid_idx' was not declared. Should it be static?
>> drivers/platform/mpam/mpam_resctrl.c:46:6: sparse: sparse: symbol 'mon_is_rmid_idx' was not declared. Should it be static?
   drivers/platform/mpam/mpam_resctrl.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false

vim +/resctrl_mon_ctx_waiters +25 drivers/platform/mpam/mpam_resctrl.c

    24	
  > 25	DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
    26	
    27	/*
    28	 * The classes we've picked to map to resctrl resources.
    29	 * Class pointer may be NULL.
    30	 */
    31	static struct mpam_resctrl_res mpam_resctrl_exports[RDT_NUM_RESOURCES];
    32	
    33	static bool exposed_alloc_capable;
    34	static bool exposed_mon_capable;
    35	static struct mpam_class *mbm_local_class;
    36	static struct mpam_class *mbm_total_class;
    37	
    38	/*
    39	 * MPAM emulates CDP by setting different PARTID in the I/D fields of MPAM1_EL1.
    40	 * This applies globally to all traffic the CPU generates.
    41	 */
    42	static bool cdp_enabled;
    43	
    44	/* A dummy mon context to use when the monitors were allocated up front */
  > 45	u32 __mon_is_rmid_idx = USE_RMID_IDX;
  > 46	void *mon_is_rmid_idx = &__mon_is_rmid_idx;
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
