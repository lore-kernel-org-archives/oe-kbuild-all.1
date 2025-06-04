Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21A12B73
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 01:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749001097; cv=none; b=G72rEa1BUdY6F/Rzd7+67mKI8bbk0BFelU+J6eypUASWO4IIKcL2J98K9FQM4jcHhKWFjsYnZwTkGG8W81OiQCGJlLpFnTvdyoYgpfUTJsn825IBegIP2M5nRzixS148Vo/GNy0YrQj1zsOZc6j60SzgFlDAjPfjnTn4SPchjTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749001097; c=relaxed/simple;
	bh=O4Ft+YDmL5Y0xNMle7Ts3XU5/jGl40h9HptiN3KihqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0h7QFpcGkrGKVhgr0kaR4baifGex7QmIeLiY7iiLfwISiGQBGtexP4oqJm/nzOnBkHwKWFYwdPfTFjrVri+E9JtizNK/LFL0uuUZhuvBgPP42YRthCA19OwFB2uwX2J9HUAs/bgEYEIS1BHSREtM0yEmRRCgAzVYTwNKs9ucZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHM8s29a; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHM8s29a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749001095; x=1780537095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4Ft+YDmL5Y0xNMle7Ts3XU5/jGl40h9HptiN3KihqY=;
  b=oHM8s29aupDyTuz19mQ4fSSWQs2MEU4CuQnf1FrqS37qYxEPyMVWeJgR
   K/+QvZUzue2WzAcT4+2EtZf5uSbZUpDhw8QehQQuMmD397BLw9BrbiNEU
   40Rzfbs1WnlkTtkKhBk0WNjeTXSDAg7jF/D3iUKXcdJqfDChbuvW/wpwn
   zdDhCdUevshk0Ox1FqZ/zwn9YlTI3vOmDQEXB0/mKtmgBwzCm9TBFH+eh
   C+G8WEuH2YHHnnzRfrpzhUcjqhcXeA2IvmTgSgO6oIz5nEXnvHwfenqnP
   S0t3rHOgqgzvSdsCIx8arT9AEHuOT4ZrWhxbs9F+IkXLq/VYzk1LCYfwO
   Q==;
X-CSE-ConnectionGUID: IRIa73NwQKSnCd9RKXj9xQ==
X-CSE-MsgGUID: 4TEp8OatSz6GKwTDS4foUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53690679"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="53690679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 18:38:14 -0700
X-CSE-ConnectionGUID: XHyDvX5jTIqbpJortm/QEw==
X-CSE-MsgGUID: w69r/TklR6eHXC2poo8HFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="168199379"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2025 18:38:14 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMd51-0001bC-0j;
	Wed, 04 Jun 2025 01:38:11 +0000
Date: Wed, 4 Jun 2025 09:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] arch/x86/events/amd/brs.c:339:6:
 warning: no previous prototype for 'perf_amd_brs_lopwr_cb'
Message-ID: <202506040948.XIX3UmG8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: 600130a3b3f73d76dbfa38d63f68d1c2520e582d [2882/2882] kabi: Fix kabi breakage without build warning.
config: x86_64-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250604/202506040948.XIX3UmG8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506040948.XIX3UmG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506040948.XIX3UmG8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/amd/brs.c:339:6: warning: no previous prototype for 'perf_amd_brs_lopwr_cb' [-Wmissing-prototypes]
     339 | void perf_amd_brs_lopwr_cb(bool lopwr_in)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/perf_amd_brs_lopwr_cb +339 arch/x86/events/amd/brs.c

fb5f22f8054df9 Stephane Eranian 2022-03-22  334  
fb5f22f8054df9 Stephane Eranian 2022-03-22  335  /*
fb5f22f8054df9 Stephane Eranian 2022-03-22  336   * called from ACPI processor_idle.c or acpi_pad.c
fb5f22f8054df9 Stephane Eranian 2022-03-22  337   * with interrupts disabled
fb5f22f8054df9 Stephane Eranian 2022-03-22  338   */
fb5f22f8054df9 Stephane Eranian 2022-03-22 @339  void perf_amd_brs_lopwr_cb(bool lopwr_in)
fb5f22f8054df9 Stephane Eranian 2022-03-22  340  {
fb5f22f8054df9 Stephane Eranian 2022-03-22  341  	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
fb5f22f8054df9 Stephane Eranian 2022-03-22  342  	union amd_debug_extn_cfg cfg;
fb5f22f8054df9 Stephane Eranian 2022-03-22  343  
fb5f22f8054df9 Stephane Eranian 2022-03-22  344  	/*
fb5f22f8054df9 Stephane Eranian 2022-03-22  345  	 * on mwait in, we may end up in non C0 state.
fb5f22f8054df9 Stephane Eranian 2022-03-22  346  	 * we must disable branch sampling to avoid holding the NMI
fb5f22f8054df9 Stephane Eranian 2022-03-22  347  	 * for too long. We disable it in hardware but we
fb5f22f8054df9 Stephane Eranian 2022-03-22  348  	 * keep the state in cpuc, so we can re-enable.
fb5f22f8054df9 Stephane Eranian 2022-03-22  349  	 *
fb5f22f8054df9 Stephane Eranian 2022-03-22  350  	 * The hardware will deliver the NMI if needed when brsmen cleared
fb5f22f8054df9 Stephane Eranian 2022-03-22  351  	 */
fb5f22f8054df9 Stephane Eranian 2022-03-22  352  	if (cpuc->brs_active) {
fb5f22f8054df9 Stephane Eranian 2022-03-22  353  		cfg.val = get_debug_extn_cfg();
fb5f22f8054df9 Stephane Eranian 2022-03-22  354  		cfg.brsmen = !lopwr_in;
fb5f22f8054df9 Stephane Eranian 2022-03-22  355  		set_debug_extn_cfg(cfg.val);
fb5f22f8054df9 Stephane Eranian 2022-03-22  356  	}
fb5f22f8054df9 Stephane Eranian 2022-03-22  357  }
fb5f22f8054df9 Stephane Eranian 2022-03-22  358  

:::::: The code at line 339 was first introduced by commit
:::::: fb5f22f8054df9c6cc2c2e40e54a76ea62fb4824 perf/x86/amd: Add idle hooks for branch sampling

:::::: TO: Stephane Eranian <eranian@google.com>
:::::: CC: Xie Haocheng <haocheng.xie@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
