Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F1818E04
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZT9oTxVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699448889; x=1730984889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnpoUL6eo7mN5rOpXDah5OEqxicGacL6nHtckD7z0fs=;
  b=ZT9oTxVpMm+zeZE5MHku9xEtJgaGIkmk1ngoCyqvEFQjxKrG+5SZF9jM
   OK1gWvpfaCEWXuUiQ7Y+jrvm3tcUmSzLPrt/aIC4E5s4/Yz65kVvvicwU
   VI6N3GA07QDbS/gnUgJIqOnSDZaP70hCeNeyVXgA0NMFqFsjkFn4uf+PM
   lhO82YjCCHIkh85sC/4Vd9hyzmInLVpK5wGpOEyJ6+OREDSlRYpu4NGdq
   6bX7nGTGXlKUpfuM/8HUdp2py91w4FmOri1YTiPJfDtMyiAHyE5oCwlXd
   jndjs2qTYqlZCVQqu7yilIYr60GAXk8mvTic6ATS42fekymKYEQnG82Jv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475985264"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="475985264"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 05:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="4375146"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Nov 2023 05:08:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0iHt-0007wu-0e;
	Wed, 08 Nov 2023 13:08:05 +0000
Date: Wed, 8 Nov 2023 21:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenhuacai-loongson:loongarch-next 5/13]
 arch/loongarch/kernel/smp.c:509:9: error: implicit declaration of function
 'rcutree_report_cpu_starting'
Message-ID: <202311082108.ZqnnqZN0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   1d375d65466e5c8d7a9406826d80d475a22e8c6d
commit: d11e7c8330949cbf9c3894d615b72d203e8c99bb [5/13] LoongArch/smp: Call rcutree_report_cpu_starting() earlier
config: loongarch-randconfig-002-20231108 (https://download.01.org/0day-ci/archive/20231108/202311082108.ZqnnqZN0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311082108.ZqnnqZN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311082108.ZqnnqZN0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/smp.c: In function 'start_secondary':
>> arch/loongarch/kernel/smp.c:509:9: error: implicit declaration of function 'rcutree_report_cpu_starting' [-Werror=implicit-function-declaration]
     509 |         rcutree_report_cpu_starting(cpu);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/rcutree_report_cpu_starting +509 arch/loongarch/kernel/smp.c

   497	
   498	/*
   499	 * First C code run on the secondary CPUs after being started up by
   500	 * the master.
   501	 */
   502	asmlinkage void start_secondary(void)
   503	{
   504		unsigned int cpu;
   505	
   506		sync_counter();
   507		cpu = raw_smp_processor_id();
   508		set_my_cpu_offset(per_cpu_offset(cpu));
 > 509		rcutree_report_cpu_starting(cpu);
   510	
   511		cpu_probe();
   512		constant_clockevent_init();
   513		loongson_init_secondary();
   514	
   515		set_cpu_sibling_map(cpu);
   516		set_cpu_core_map(cpu);
   517	
   518		notify_cpu_starting(cpu);
   519	
   520		/* Notify boot CPU that we're starting */
   521		complete(&cpu_starting);
   522	
   523		/* The CPU is running, now mark it online */
   524		set_cpu_online(cpu, true);
   525	
   526		calculate_cpu_foreign_map();
   527	
   528		/*
   529		 * Notify boot CPU that we're up & online and it can safely return
   530		 * from __cpu_up()
   531		 */
   532		complete(&cpu_running);
   533	
   534		/*
   535		 * irq will be enabled in loongson_smp_finish(), enabling it too
   536		 * early is dangerous.
   537		 */
   538		WARN_ON_ONCE(!irqs_disabled());
   539		loongson_smp_finish();
   540	
   541		cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
   542	}
   543	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
