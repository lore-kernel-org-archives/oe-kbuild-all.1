Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB805292B5F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 10:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155137; cv=none; b=GVEAIV0IDUfCPMAORz8HxsAtatHZwNrDhUNxJo8os/GexFMBimwZD+EQbb077ZWdIk3BYsZJ5DbjrDwB0QOY0UbUmLHyNeiJzkcPKigNqP/KL9vfS6YS7Yiy9Tm5goiU6OOTezacj1EF+6LzjMJgQ1gDVEzOQN2DDW8TxFPalBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155137; c=relaxed/simple;
	bh=XAvKBjpiOxyz2EasLStqmsGkTN9L4+IoPKnxQlmao7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tlQuw5DDzI6LVghD9pGSSI6/f1U5H4CFxIzz4uWzlwQsCg8v4IiTS6wVVXLRH4GDjb6C2xhfRWkkAJTQ1x1cEjXx5yROQqtlRxWWEf+5/Hm3zrPxeRS4iR4Db4+z11vVxudwRdjTslW4Wz2Tk45siCNuzO4SfJirFzuRnq3d5+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjR6ehuV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjR6ehuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750155136; x=1781691136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XAvKBjpiOxyz2EasLStqmsGkTN9L4+IoPKnxQlmao7E=;
  b=NjR6ehuVmTUwlFGzfOkr0ykzxR/tcBEqsggGNZqvGAZF/q8upwQz2n3u
   YMdKRm53tr/PgPyrr+WlFYCe+ocLtuevcrzoGirFG/2rE2ZCcTE98gv71
   IjLP7mWw9cWURue8/mzrAXAYSMh5XF3A+GGYZfUJaMdqgMONlVOJMB5If
   g3JMXP9EsG6q4ef6Nvkil8CbMAhbky7WrrkT4j88pKaVinq41AWq2HVT2
   H5Ya6oP04/jjzAGJrnc+CGNMsJ1yo3+D/FmBnTNPGHu9ckoGPN6MhZ6lz
   6tsTdouqWvTDCHeJEtFV0aFcTZ4E3uUZK+Va2ecQzukovYa45H0jz0aFJ
   w==;
X-CSE-ConnectionGUID: gv49NQRoQpO1MLMKb+CySQ==
X-CSE-MsgGUID: 0ms2NDJLTcK8Dzuapl+dZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52407393"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="52407393"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 03:12:16 -0700
X-CSE-ConnectionGUID: hR1csmq7SuWhsLpuf1pYbw==
X-CSE-MsgGUID: mmL4gHbxSNyxN4lIxv+OKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148563301"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jun 2025 03:12:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRTIZ-000Fro-33;
	Tue, 17 Jun 2025 10:12:11 +0000
Date: Tue, 17 Jun 2025 18:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.16-rc1 63/83]
 drivers/platform/arm64/mpam/mpam_resctrl.c:23:1: sparse: sparse: symbol
 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
Message-ID: <202506171843.xsU4gkHd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc1
head:   8872f14d9fa3dabda25ac1679ab2bf2a7520a07c
commit: 3231c9af8d70b5bc4cf0871b27eaff3ad524b476 [63/83] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-randconfig-r121-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171843.xsU4gkHd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171843.xsU4gkHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171843.xsU4gkHd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/arm64/mpam/mpam_resctrl.c:23:1: sparse: sparse: symbol 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
>> drivers/platform/arm64/mpam/mpam_resctrl.c:52:5: sparse: sparse: symbol '__mon_is_rmid_idx' was not declared. Should it be static?
>> drivers/platform/arm64/mpam/mpam_resctrl.c:53:6: sparse: sparse: symbol 'mon_is_rmid_idx' was not declared. Should it be static?

vim +/resctrl_mon_ctx_waiters +23 drivers/platform/arm64/mpam/mpam_resctrl.c

0c5b551c9d30bd James Morse 2019-06-11  22  
dc04a163da724c James Morse 2021-06-25 @23  DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
dc04a163da724c James Morse 2021-06-25  24  
0c5b551c9d30bd James Morse 2019-06-11  25  /*
0c5b551c9d30bd James Morse 2019-06-11  26   * The classes we've picked to map to resctrl resources, wrapped
0c5b551c9d30bd James Morse 2019-06-11  27   * in with their resctrl structure.
0c5b551c9d30bd James Morse 2019-06-11  28   * Class pointer may be NULL.
0c5b551c9d30bd James Morse 2019-06-11  29   */
0c5b551c9d30bd James Morse 2019-06-11  30  static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
0c5b551c9d30bd James Morse 2019-06-11  31  
6b6c75fb3fc562 James Morse 2024-05-16  32  /*
6b6c75fb3fc562 James Morse 2024-05-16  33   * The classes we've picked to map to resctrl events.
6b6c75fb3fc562 James Morse 2024-05-16  34   * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
6b6c75fb3fc562 James Morse 2024-05-16  35   * array lets us find the actual class backing the event counters. e.g.
6b6c75fb3fc562 James Morse 2024-05-16  36   * the only memory bandwidth counters may be on the memory controller, but to
6b6c75fb3fc562 James Morse 2024-05-16  37   * make use of them, we pretend they are on L3.
6b6c75fb3fc562 James Morse 2024-05-16  38   * Class pointer may be NULL.
6b6c75fb3fc562 James Morse 2024-05-16  39   */
6b6c75fb3fc562 James Morse 2024-05-16  40  static struct mpam_class *mpam_resctrl_counters[QOS_NUM_EVENTS];
6b6c75fb3fc562 James Morse 2024-05-16  41  
0c5b551c9d30bd James Morse 2019-06-11  42  static bool exposed_alloc_capable;
0c5b551c9d30bd James Morse 2019-06-11  43  static bool exposed_mon_capable;
0c5b551c9d30bd James Morse 2019-06-11  44  
13ea02cc68f880 James Morse 2021-06-25  45  /*
13ea02cc68f880 James Morse 2021-06-25  46   * MPAM emulates CDP by setting different PARTID in the I/D fields of MPAM1_EL1.
13ea02cc68f880 James Morse 2021-06-25  47   * This applies globally to all traffic the CPU generates.
13ea02cc68f880 James Morse 2021-06-25  48   */
b1b6d0ef730034 James Morse 2025-05-22  49  static bool cdp_enabled;
b1b6d0ef730034 James Morse 2025-05-22  50  
dc04a163da724c James Morse 2021-06-25  51  /* A dummy mon context to use when the monitors were allocated up front */
dc04a163da724c James Morse 2021-06-25 @52  u32 __mon_is_rmid_idx = USE_RMID_IDX;
dc04a163da724c James Morse 2021-06-25 @53  void *mon_is_rmid_idx = &__mon_is_rmid_idx;
dc04a163da724c James Morse 2021-06-25  54  

:::::: The code at line 23 was first introduced by commit
:::::: dc04a163da724ce78458ebf6d60f8c8b1c68affc arm_mpam: resctrl: Allow resctrl to allocate monitors

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: James Morse <james.morse@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
