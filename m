Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97653364A4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCT7CcnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701102579; x=1732638579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wf4AokSkS2kzjtH7rZNEPvVtXn35sCy53/3joAFFCM=;
  b=BCT7CcnI7Dd9nJpw+pVvn5byJ5Al1sybTnzTm7e4boW59SD63GUiSTFR
   Or802pZRaidJSGjAF1QkUTTOPC+hNCJ/0sDyZaXEyal3NoXyqBj3WQwb7
   ijeCCpJ7Hj+42AEKt6xcpk7E2RT1a0y+JRTojNw52KSfT9y0n4r/Gbj6p
   8YJ0wb1Pcqk3Wbs+oe4ONDoV+rQorDyTobW//6rAyavp2AZDQYQrzFzsG
   Q7y463IAOVyQuddbP+Azvh/TJRD9bdHoBL21t++tpem05W28khVbbTflD
   G16d50Xm8x4Wlm2x1Gs5GcLa1wM2e7su4/ltkgF5ySloKs4UeKNBbQ7UE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="5930677"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="5930677"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 08:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="744612634"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="744612634"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Nov 2023 08:28:03 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7eSf-0006QS-0u;
	Mon, 27 Nov 2023 16:27:53 +0000
Date: Tue, 28 Nov 2023 00:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3550/3551] arch/sparc/kernel/setup_64.c:658:35:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202311272244.tXvOAAfj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48bbaf8b793e0770798519f8ee1ea2908ff0943a
commit: 233d97f67e6525aff8a621735926a8acbd980ca1 [3550/3551] sparc: turn off Werror for now
config: sparc64-randconfig-r121-20231127 (https://download.01.org/0day-ci/archive/20231127/202311272244.tXvOAAfj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311272244.tXvOAAfj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311272244.tXvOAAfj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/sparc/kernel/setup_64.c:602:13: sparse: sparse: symbol 'alloc_irqstack_bootmem' was not declared. Should it be static?
>> arch/sparc/kernel/setup_64.c:658:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 extern [addressable] [toplevel] [usertype] ic_myaddr @@     got unsigned int [assigned] [usertype] cl @@
   arch/sparc/kernel/setup_64.c:658:35: sparse:     expected restricted __be32 extern [addressable] [toplevel] [usertype] ic_myaddr
   arch/sparc/kernel/setup_64.c:658:35: sparse:     got unsigned int [assigned] [usertype] cl
>> arch/sparc/kernel/setup_64.c:659:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 extern [addressable] [toplevel] [usertype] ic_servaddr @@     got unsigned int [assigned] [usertype] sv @@
   arch/sparc/kernel/setup_64.c:659:37: sparse:     expected restricted __be32 extern [addressable] [toplevel] [usertype] ic_servaddr
   arch/sparc/kernel/setup_64.c:659:37: sparse:     got unsigned int [assigned] [usertype] sv
>> arch/sparc/kernel/setup_64.c:661:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 extern [addressable] [toplevel] [usertype] ic_gateway @@     got unsigned int [assigned] [usertype] gw @@
   arch/sparc/kernel/setup_64.c:661:44: sparse:     expected restricted __be32 extern [addressable] [toplevel] [usertype] ic_gateway
   arch/sparc/kernel/setup_64.c:661:44: sparse:     got unsigned int [assigned] [usertype] gw

vim +658 arch/sparc/kernel/setup_64.c

^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  648  
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  649  #ifdef CONFIG_IP_PNP
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  650  	if (!ic_set_manually) {
8d1255627d4ce9 arch/sparc/kernel/setup_64.c Andres Salomon  2010-10-08  651  		phandle chosen = prom_finddevice("/chosen");
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  652  		u32 cl, sv, gw;
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  653  
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  654  		cl = prom_getintdefault (chosen, "client-ip", 0);
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  655  		sv = prom_getintdefault (chosen, "server-ip", 0);
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  656  		gw = prom_getintdefault (chosen, "gateway-ip", 0);
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  657  		if (cl && sv) {
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16 @658  			ic_myaddr = cl;
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16 @659  			ic_servaddr = sv;
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  660  			if (gw)
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16 @661  				ic_gateway = gw;
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  662  #if defined(CONFIG_IP_PNP_BOOTP) || defined(CONFIG_IP_PNP_RARP)
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  663  			ic_proto_enabled = 0;
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  664  #endif
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  665  		}
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  666  	}
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  667  #endif
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  668  
56fb4df6da76c3 arch/sparc64/kernel/setup.c  David S. Miller 2006-02-26  669  	/* Get boot processor trap_block[] setup.  */
72aff53f1fe741 arch/sparc64/kernel/setup.c  David S. Miller 2006-02-17  670  	init_cur_cpu_trap(current_thread_info());
52845cdb3b9c4c arch/sparc64/kernel/setup.c  David S. Miller 2006-02-26  671  
52845cdb3b9c4c arch/sparc64/kernel/setup.c  David S. Miller 2006-02-26  672  	paging_init();
ac85fe8b212480 arch/sparc/kernel/setup_64.c David S. Miller 2011-07-28  673  	init_sparc64_elf_hwcap();
9b2f753ec23710 arch/sparc/kernel/setup_64.c Atish Patra     2016-09-15  674  	smp_fill_in_cpu_possible_map();
ebb99a4c12e4da arch/sparc/kernel/setup_64.c Atish Patra     2016-09-15  675  	/*
ebb99a4c12e4da arch/sparc/kernel/setup_64.c Atish Patra     2016-09-15  676  	 * Once the OF device tree and MDESC have been setup and nr_cpus has
ebb99a4c12e4da arch/sparc/kernel/setup_64.c Atish Patra     2016-09-15  677  	 * been parsed, we know the list of possible cpus.  Therefore we can
ebb99a4c12e4da arch/sparc/kernel/setup_64.c Atish Patra     2016-09-15  678  	 * allocate the IRQ stacks.
ebb99a4c12e4da arch/sparc/kernel/setup_64.c Atish Patra     2016-09-15  679  	 */
ebb99a4c12e4da arch/sparc/kernel/setup_64.c Atish Patra     2016-09-15  680  	alloc_irqstack_bootmem();
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  681  }
^1da177e4c3f41 arch/sparc64/kernel/setup.c  Linus Torvalds  2005-04-16  682  

:::::: The code at line 658 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
