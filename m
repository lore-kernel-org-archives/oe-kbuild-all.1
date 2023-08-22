Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF6E1FA1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 02:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692671432; x=1724207432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bnD7/0pVnDenR+1Gn7nXDkgpoQf0CM6Y5OAiQo1uB3M=;
  b=Zw2pcS9ZezIiolaf7D7Sv+hGI/73fyWlfb8ILLQzUUNAHRgDDnSbPKqi
   O672WaEJFrqhS/t0DJSGW/d/kM2FKYfAejJQok+bRSAO8pbA60o6JUHOd
   jhGP8D2n1IOtM0wjkKBiDBa/kw52t7J3YgWq0tQvBuvQab2a9frvLEhDm
   RF58mxpcesEfXmAcWbejzyQYcQv2UR49/d5r//TSGtcwv7/wIdE3C7OQw
   XiW4nulu3hnvnF4k0geIpNs1mZ+/WSD+ESZsB+FnChWjifSQcI1iDgzO9
   4Memk4oKfqoP8yScKqs95xZSgNcTi3pWamLMA04tIHt+hZLEZzXpSk3Ps
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="363924920"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="363924920"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 19:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712985254"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="712985254"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 19:30:30 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYH9v-0001FA-1i;
	Tue, 22 Aug 2023 02:30:21 +0000
Date: Tue, 22 Aug 2023 10:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next 5/13] arch/parisc/kernel/processor.c:390:46:
 warning: unused variable 'cpuinfo'
Message-ID: <202308221034.LX3wcH2L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   557fefd16958f21ae5aa9994dd2b2d9e0d683787
commit: 90f22b0437b2b738aef254555d24f0d953622cb9 [5/13] parisc: Fix /proc/cpuinfo output for lscpu
config: parisc-randconfig-r015-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221034.LX3wcH2L-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221034.LX3wcH2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221034.LX3wcH2L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/parisc/kernel/processor.c: In function 'show_cpuinfo':
>> arch/parisc/kernel/processor.c:390:46: warning: unused variable 'cpuinfo' [-Wunused-variable]
     390 |                 const struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
         |                                              ^~~~~~~


vim +/cpuinfo +390 arch/parisc/kernel/processor.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  373  
^1da177e4c3f41 Linus Torvalds 2005-04-16  374  /*
7022672e4046fa Simon Arlott   2007-05-11  375   * Display CPU info for all CPUs.
^1da177e4c3f41 Linus Torvalds 2005-04-16  376   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  377  int
^1da177e4c3f41 Linus Torvalds 2005-04-16  378  show_cpuinfo (struct seq_file *m, void *v)
^1da177e4c3f41 Linus Torvalds 2005-04-16  379  {
ef017bebd01c1b Helge Deller   2008-12-31  380  	unsigned long cpu;
90f22b0437b2b7 Helge Deller   2023-08-18  381  	char cpu_name[60], *p;
90f22b0437b2b7 Helge Deller   2023-08-18  382  
90f22b0437b2b7 Helge Deller   2023-08-18  383  	/* strip PA path from CPU name to not confuse lscpu */
90f22b0437b2b7 Helge Deller   2023-08-18  384  	strlcpy(cpu_name, per_cpu(cpu_data, 0).dev->name, sizeof(cpu_name));
90f22b0437b2b7 Helge Deller   2023-08-18  385  	p = strrchr(cpu_name, '[');
90f22b0437b2b7 Helge Deller   2023-08-18  386  	if (p)
90f22b0437b2b7 Helge Deller   2023-08-18  387  		*(--p) = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  388  
ef017bebd01c1b Helge Deller   2008-12-31  389  	for_each_online_cpu(cpu) {
ef017bebd01c1b Helge Deller   2008-12-31 @390  		const struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
^1da177e4c3f41 Linus Torvalds 2005-04-16  391  #ifdef CONFIG_SMP
ef017bebd01c1b Helge Deller   2008-12-31  392  		if (0 == cpuinfo->hpa)
^1da177e4c3f41 Linus Torvalds 2005-04-16  393  			continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  394  #endif
ef017bebd01c1b Helge Deller   2008-12-31  395  		seq_printf(m, "processor\t: %lu\n"
^1da177e4c3f41 Linus Torvalds 2005-04-16  396  				"cpu family\t: PA-RISC %s\n",
ef017bebd01c1b Helge Deller   2008-12-31  397  				 cpu, boot_cpu_data.family_name);
^1da177e4c3f41 Linus Torvalds 2005-04-16  398  
^1da177e4c3f41 Linus Torvalds 2005-04-16  399  		seq_printf(m, "cpu\t\t: %s\n",  boot_cpu_data.cpu_name );
^1da177e4c3f41 Linus Torvalds 2005-04-16  400  
^1da177e4c3f41 Linus Torvalds 2005-04-16  401  		/* cpu MHz */
^1da177e4c3f41 Linus Torvalds 2005-04-16  402  		seq_printf(m, "cpu MHz\t\t: %d.%06d\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  403  				 boot_cpu_data.cpu_hz / 1000000,
^1da177e4c3f41 Linus Torvalds 2005-04-16  404  				 boot_cpu_data.cpu_hz % 1000000  );
^1da177e4c3f41 Linus Torvalds 2005-04-16  405  

:::::: The code at line 390 was first introduced by commit
:::::: ef017bebd01c1b4e075d649eee0c8c1c79f9ceb9 parisc: Replace NR_CPUS in parisc code

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Kyle McMartin <kyle@mcmartin.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
