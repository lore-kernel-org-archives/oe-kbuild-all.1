Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B571474A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735381661; cv=none; b=UkYS/3L1aX1eRNCpcZtXKdZhqZkRHI1U3Kac+DuxntXkEE9Qi+Ap962wn3baLBqjPZA3ObUnJz7II61WWn2XMI+nfBYUXmj2ccMsNBgPHWYQ59trGOV8dpJOM8NszMLxVb6Orof698Xs9i2bxGiImYeOE/k74ewvLHpDMg7x3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735381661; c=relaxed/simple;
	bh=YfYYVqVsofYdWt5w5L6HPYAn7vDjd4nLv0FBrtuHKnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lc3zoy4QCzUSJpSOdCIGOMMPqH49NJRBWMhHR/DtSkLJeDUyvoAXw3vOEEApYCU1o76vV2opR0xqJCbwZeWX3KbDOy6sKZ1kIMcz4fV939GAISdnM4v5sAp1xFPAwlLj55ukOTMOUVfW/JpwjXWeN43rw4kkw6N3rnsCdPpI/kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cStVLMs4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cStVLMs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735381658; x=1766917658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YfYYVqVsofYdWt5w5L6HPYAn7vDjd4nLv0FBrtuHKnw=;
  b=cStVLMs4R4n1lLxTM9mt/NZ2sxKoc3FYzpLDidJG6GIc4UV7zZdJG8Iu
   EKlD/1fUoa2MqX4inVWnzfhTJ/4nYaYDgDwtZmkUqgkMtjSCbILM0PH6W
   vX27QCaIqH7sFECMOWj8ypCDAxYNyVemivaAnOnLWf+9AL0h+NSMVaA3M
   YqninSBObxEznMPrQFCdH7aBHButd221IG6DhXGTzzEIQFqAZ11aeTk8M
   DA1GILtoyyWIgzMXYsDBtYlob2LnrBtOztn3OEj3+Ba/8hvK52pjExfBO
   Xh2fapZiiOCbtEpdQpzy8+IMenH9h5XI37HgGywgN2T26wCE61kDBPhp3
   Q==;
X-CSE-ConnectionGUID: WUU+7kPsQReGenEj016Ybw==
X-CSE-MsgGUID: FbxALfzxRUmhES6Bj70tMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35631662"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="35631662"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 02:27:37 -0800
X-CSE-ConnectionGUID: UzAQ9vINRh+0YERnn5PvFQ==
X-CSE-MsgGUID: 6TSku3seTiCaCjGEn8wgGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100831983"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Dec 2024 02:27:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRU2g-000416-00;
	Sat, 28 Dec 2024 10:27:34 +0000
Date: Sat, 28 Dec 2024 18:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 10/13]
 arch/x86/kernel/cpu/centaur.c:120:17: error: expected ';' at end of
 declaration
Message-ID: <202412281843.CzCMVfcc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   831a3852bafc8cabcce4c27132e763d6c88e3e25
commit: 563fd86807e60fe4d5f95ee43ae88e8284c14ab3 [10/13] x86/msr: Replace wrmsr() with wrmsrl()
config: i386-buildonly-randconfig-006-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281843.CzCMVfcc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281843.CzCMVfcc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281843.CzCMVfcc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/centaur.c:120:17: error: expected ';' at end of declaration
     120 |         u32  newlo, u32  aa, bb, cc, dd;
         |                        ^
         |                        ;
>> arch/x86/kernel/cpu/centaur.c:181:12: error: use of undeclared identifier 'lo'
     181 |                 newlo = (lo|fcr_set) & (~fcr_clr);
         |                          ^
   arch/x86/kernel/cpu/centaur.c:183:16: error: use of undeclared identifier 'lo'
     183 |                 if (newlo != lo) {
         |                              ^
   arch/x86/kernel/cpu/centaur.c:183:16: error: use of undeclared identifier 'lo'
   arch/x86/kernel/cpu/centaur.c:183:16: error: use of undeclared identifier 'lo'
   arch/x86/kernel/cpu/centaur.c:185:5: error: use of undeclared identifier 'lo'
     185 |                                 lo, newlo);
         |                                 ^
   arch/x86/kernel/cpu/centaur.c:189:37: error: use of undeclared identifier 'lo'
     189 |                         pr_info("Centaur FCR is 0x%X\n", lo);
         |                                                          ^
>> arch/x86/kernel/cpu/centaur.c:201:23: error: use of undeclared identifier 'aa'
     201 |                         cpuid(0x80000005, &aa, &bb, &cc, &dd);
         |                                            ^
>> arch/x86/kernel/cpu/centaur.c:201:28: error: use of undeclared identifier 'bb'
     201 |                         cpuid(0x80000005, &aa, &bb, &cc, &dd);
         |                                                 ^
>> arch/x86/kernel/cpu/centaur.c:201:33: error: use of undeclared identifier 'cc'
     201 |                         cpuid(0x80000005, &aa, &bb, &cc, &dd);
         |                                                      ^
>> arch/x86/kernel/cpu/centaur.c:201:38: error: use of undeclared identifier 'dd'
     201 |                         cpuid(0x80000005, &aa, &bb, &cc, &dd);
         |                                                           ^
   arch/x86/kernel/cpu/centaur.c:203:25: error: use of undeclared identifier 'cc'
     203 |                         c->x86_cache_size = (cc>>24)+(dd>>24);
         |                                              ^
   arch/x86/kernel/cpu/centaur.c:203:34: error: use of undeclared identifier 'dd'
     203 |                         c->x86_cache_size = (cc>>24)+(dd>>24);
         |                                                       ^
   13 errors generated.


vim +120 arch/x86/kernel/cpu/centaur.c

   113	
   114	static void init_centaur(struct cpuinfo_x86 *c)
   115	{
   116	#ifdef CONFIG_X86_32
   117		char *name;
   118		u32  fcr_set = 0;
   119		u32  fcr_clr = 0;
 > 120		u32  newlo, u32  aa, bb, cc, dd;
   121		struct msr value;
   122	
   123		/*
   124		 * Bit 31 in normal CPUID used for nonstandard 3DNow ID;
   125		 * 3DNow is IDd by bit 31 in extended CPUID (1*32+31) anyway
   126		 */
   127		clear_cpu_cap(c, 0*32+31);
   128	#endif
   129		early_init_centaur(c);
   130		init_intel_cacheinfo(c);
   131	
   132		if (c->cpuid_level > 9) {
   133			unsigned int eax = cpuid_eax(10);
   134	
   135			/*
   136			 * Check for version and the number of counters
   137			 * Version(eax[7:0]) can't be 0;
   138			 * Counters(eax[15:8]) should be greater than 1;
   139			 */
   140			if ((eax & 0xff) && (((eax >> 8) & 0xff) > 1))
   141				set_cpu_cap(c, X86_FEATURE_ARCH_PERFMON);
   142		}
   143	
   144	#ifdef CONFIG_X86_32
   145		if (c->x86 == 5) {
   146			switch (c->x86_model) {
   147			case 4:
   148				name = "C6";
   149				fcr_set = ECX8|DSMC|EDCTLB|EMMX|ERETSTK;
   150				fcr_clr = DPDC;
   151				pr_notice("Disabling bugged TSC.\n");
   152				clear_cpu_cap(c, X86_FEATURE_TSC);
   153				break;
   154			case 8:
   155				switch (c->x86_stepping) {
   156				default:
   157				name = "2";
   158					break;
   159				case 7 ... 9:
   160					name = "2A";
   161					break;
   162				case 10 ... 15:
   163					name = "2B";
   164					break;
   165				}
   166				fcr_set = ECX8|DSMC|DTLOCK|EMMX|EBRPRED|ERETSTK|
   167					  E2MMX|EAMD3D;
   168				fcr_clr = DPDC;
   169				break;
   170			case 9:
   171				name = "3";
   172				fcr_set = ECX8|DSMC|DTLOCK|EMMX|EBRPRED|ERETSTK|
   173					  E2MMX|EAMD3D;
   174				fcr_clr = DPDC;
   175				break;
   176			default:
   177				name = "??";
   178			}
   179	
   180			rdmsrl(MSR_IDT_FCR1, value.q);
 > 181			newlo = (lo|fcr_set) & (~fcr_clr);
   182	
   183			if (newlo != lo) {
   184				pr_info("Centaur FCR was 0x%X now 0x%X\n",
   185					lo, newlo);
   186				value.l = newlo;
   187				wrmsrl(MSR_IDT_FCR1, value.q);
   188			} else {
   189				pr_info("Centaur FCR is 0x%X\n", lo);
   190			}
   191			/* Emulate MTRRs using Centaur's MCR. */
   192			set_cpu_cap(c, X86_FEATURE_CENTAUR_MCR);
   193			/* Report CX8 */
   194			set_cpu_cap(c, X86_FEATURE_CX8);
   195			/* Set 3DNow! on Winchip 2 and above. */
   196			if (c->x86_model >= 8)
   197				set_cpu_cap(c, X86_FEATURE_3DNOW);
   198			/* See if we can find out some more. */
   199			if (cpuid_eax(0x80000000) >= 0x80000005) {
   200				/* Yes, we can. */
 > 201				cpuid(0x80000005, &aa, &bb, &cc, &dd);
   202				/* Add L1 data and code cache sizes. */
   203				c->x86_cache_size = (cc>>24)+(dd>>24);
   204			}
   205			sprintf(c->x86_model_id, "WinChip %s", name);
   206		}
   207	#endif
   208		if (c->x86 == 6 || c->x86 >= 7)
   209			init_c3(c);
   210	#ifdef CONFIG_X86_64
   211		set_cpu_cap(c, X86_FEATURE_LFENCE_RDTSC);
   212	#endif
   213	
   214		init_ia32_feat_ctl(c);
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
