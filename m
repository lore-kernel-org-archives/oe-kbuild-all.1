Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2928316909
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766402954; cv=none; b=tT9JJaiakWeH24W6uIDsfbuIqLNQgS1cBhkunZ91j40RFfIvnrHWeAEBN1uSpEGTX8WteofkcTx0ttQ7+A4K7O3VuhIFnSL9EQdK2pn7KNYjXswHB2oflvHC2PN6zL6ftpxvh1AJtkUDRMUuzaR4ytOpHdCJCFEobaMmsUwZtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766402954; c=relaxed/simple;
	bh=ta0cwaWm+hlY1zCAdJnjrUwH3Al5KMx9l8FxIWas55c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mZI2bQWb3OeAsepaxQkwEJwojVwtB5zlVJdbJjKnMOzLU9MvcYMmzmG10XnLVAqkuMU1wRB8NfeyIaplQ2xK8UJUDmkoaDwM65zB5yTaGWOyq9ovXBFj8n4uOlV6g27vJ9MzKgQFlu/omPcp6AW6fVbCbqvbyoYKVKCNFI5Cjnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFIVBR0G; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFIVBR0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766402952; x=1797938952;
  h=date:from:to:cc:subject:message-id;
  bh=ta0cwaWm+hlY1zCAdJnjrUwH3Al5KMx9l8FxIWas55c=;
  b=kFIVBR0Go66Awxa0X2hrX51dF9Dpc3365JpG/A02Uj/9N1U0KT1Qg8nk
   BwodaSHzjfNkHrSn/e8opxazI6ZjmGc/UPPcU0Ysu/tQUBuQT+RT7qMyw
   dEFFHAzAPTIN1Ro0ATTqjEBH5I/nMBE6xba/q6fsW+i8BUbDMyZvmAztc
   OZaavA6UYZMmt4TU7/6Sdz1gRuQoulaSvP2xXvth1DzKXYl/7l9JcHKX+
   +Vujs9kDbrEDi78XeT3Z6Bkg8fmt52tuVMX6UNNJiKAXTMzPgQvPazjAm
   vLj1CyQe7rV5/oQpEUmxIPTf7BPjsfmaUuTrIoSSFGMKTvc7eoXPl0rS0
   w==;
X-CSE-ConnectionGUID: E/oewZgcS5SgPh6ZTR/Nag==
X-CSE-MsgGUID: SNyCxJ70Tye/7FGR5GP1TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="90918049"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="90918049"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 03:29:11 -0800
X-CSE-ConnectionGUID: a2f7a4+7TqibCUM9oX3JuA==
X-CSE-MsgGUID: FNFwylgMTNmd7c570MeSjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204031592"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2025 03:29:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXe67-000000000SH-0UVw;
	Mon, 22 Dec 2025 11:29:07 +0000
Date: Mon, 22 Dec 2025 19:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3557/3557]
 drivers/platform/mpam/mpam_resctrl.c:25:1: sparse: sparse: symbol
 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
Message-ID: <202512221945.aSbuNpcr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 9119da1439390ea4f29a0635652248aa3c2040f0 [3557/3557] arm_mpam: resctrl: Allow resctrl to allocate monitors
config: arm64-randconfig-r132-20251218 (https://download.01.org/0day-ci/archive/20251222/202512221945.aSbuNpcr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221945.aSbuNpcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221945.aSbuNpcr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/mpam/mpam_resctrl.c:25:1: sparse: sparse: symbol 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
>> drivers/platform/mpam/mpam_resctrl.c:45:5: sparse: sparse: symbol '__mon_is_rmid_idx' was not declared. Should it be static?
   drivers/platform/mpam/mpam_resctrl.c:46:6: sparse: sparse: symbol 'mon_is_rmid_idx' was not declared. Should it be static?

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
    46	void *mon_is_rmid_idx = &__mon_is_rmid_idx;
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
