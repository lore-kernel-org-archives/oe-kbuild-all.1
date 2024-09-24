Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387C146D59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727170154; cv=none; b=Ni7zAvXrNgexM5cmDPcwGuwAF7JAkSgJU7UB1YkkYLC06YMfAT1R0lwzw/sEJmbE7cjSPqSGgIXYElodisaqe3Oya+MxFQ6kewzIRP7gUg5UYyIg4AhNTs4+ID7mQPo8rk5ex1aKoekQkDU4ngOd9loQfTV0/a+b5yuTB1QSl4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727170154; c=relaxed/simple;
	bh=rtNFiM+XUc2d0GPvivCrAcVxZnq2eqB/qYy3mG60r2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrGgll0pkNnQlCgSe7moaLTn5ql7CXQR/aZnobEBo521A/LIt2JkDNclvR/NYan+511bsB4e7xAaw3+quQCjyFQkp5BvBZqmCmo6MMmWgwpGicsWrWSEOzaOTjVwUsdihNVwMm04vNMeri+Lo7pzN8Wgwps/0S7kkWAUhPz0Nc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFdinIzD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFdinIzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727170151; x=1758706151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rtNFiM+XUc2d0GPvivCrAcVxZnq2eqB/qYy3mG60r2Q=;
  b=jFdinIzD2WEfWsBrIsk2FDQkwSAjqLxv9xZV3DDIKA6ykYpE3hsujOLO
   WQD5nW6uA4oBXPDZAH3ME0g+beugp9A6qtuxT+zYz21btmB3URNs7cwwU
   PFgdAfnvoCoCb7SgE4QNVUtlePyt54KLiFHd4ZDQQAxfa9GvNYtVqC9bF
   rgTJ2ZI1A8gVwJcgri1+42XiwQWP8Ljq65csIz4trl/+Ae11hNaxUId7x
   gne+vd6o00eQIE4+OqcHUrz/mpkbHsGN30a3m7fyHbcVr5P9b+2RQ1wkk
   LQRhhKbHweKlEaIEAR6tdZ8pDJ1hPesYPvYjFu9W6YFFQ7u7qp7dp/DtZ
   Q==;
X-CSE-ConnectionGUID: Oq18wHlXQmCYvyF1SZoWuA==
X-CSE-MsgGUID: VXcPd2G0TL610r4yntLzNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="30039215"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="30039215"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 02:29:11 -0700
X-CSE-ConnectionGUID: 6LqAdUeJSvufaFTTekTXvg==
X-CSE-MsgGUID: OSyvbF8kTuGaXc21Atk+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="71630632"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2024 02:29:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st1r2-000IBD-1M;
	Tue, 24 Sep 2024 09:29:08 +0000
Date: Tue, 24 Sep 2024 17:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/main 285/2981] kernel/sched/cputime.c:256:24: error: use
 of undeclared identifier 'paravirt_steal_enabled'
Message-ID: <202409241724.JOGb6ynD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.10/main
head:   14cddf41a02f74b2d2a6727fe33914a57b4432f6
commit: d423eb552e8d9ccb6577937f3cf762b783679f8e [285/2981] sched/alt: Headers cleanup
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409241724.JOGb6ynD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241724.JOGb6ynD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241724.JOGb6ynD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:56:
>> kernel/sched/cputime.c:256:24: error: use of undeclared identifier 'paravirt_steal_enabled'
     256 |         if (static_key_false(&paravirt_steal_enabled)) {
         |                               ^
>> kernel/sched/cputime.c:259:11: error: call to undeclared function 'paravirt_steal_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     259 |                 steal = paravirt_steal_clock(smp_processor_id());
         |                         ^
   5 warnings and 2 errors generated.


vim +/paravirt_steal_enabled +256 kernel/sched/cputime.c

1fcf54deb767d4 Josh Don            2022-06-29  247  
03cbc732639ddc Wanpeng Li          2016-08-17  248  /*
03cbc732639ddc Wanpeng Li          2016-08-17  249   * When a guest is interrupted for a longer amount of time, missed clock
03cbc732639ddc Wanpeng Li          2016-08-17  250   * ticks are not redelivered later. Due to that, this function may on
03cbc732639ddc Wanpeng Li          2016-08-17  251   * occasion account more time than the calling functions think elapsed.
03cbc732639ddc Wanpeng Li          2016-08-17  252   */
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  253  static __always_inline u64 steal_account_process_time(u64 maxtime)
73fbec604432e1 Frederic Weisbecker 2012-06-16  254  {
73fbec604432e1 Frederic Weisbecker 2012-06-16  255  #ifdef CONFIG_PARAVIRT
73fbec604432e1 Frederic Weisbecker 2012-06-16 @256  	if (static_key_false(&paravirt_steal_enabled)) {
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  257  		u64 steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  258  
73fbec604432e1 Frederic Weisbecker 2012-06-16 @259  		steal = paravirt_steal_clock(smp_processor_id());
73fbec604432e1 Frederic Weisbecker 2012-06-16  260  		steal -= this_rq()->prev_steal_time;
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  261  		steal = min(steal, maxtime);
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  262  		account_steal_time(steal);
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  263  		this_rq()->prev_steal_time += steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  264  
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  265  		return steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  266  	}
73fbec604432e1 Frederic Weisbecker 2012-06-16  267  #endif
807e5b80687c06 Wanpeng Li          2016-06-13  268  	return 0;
73fbec604432e1 Frederic Weisbecker 2012-06-16  269  }
73fbec604432e1 Frederic Weisbecker 2012-06-16  270  

:::::: The code at line 256 was first introduced by commit
:::::: 73fbec604432e1fbfeb1bc59a110dac1f98160f6 sched: Move cputime code to its own file

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
