Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A1C8C4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 05:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajLq1s9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699422103; x=1730958103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mvAYbcXPW6PhEU0J+OAUvroh06tni64aLkIH1hC6BMc=;
  b=ajLq1s9l3LjQrbqQs6DmKpVDFR3wOi8D03Q3qsQpxo+1orlxmHHXXI9w
   aX7Y90NXmDU35wQI6yPrGYM1CQeeqGqBk0E3wNjx6mF4XkC425OhiVk2s
   R1jM+tWsgVxRJ5AKl6aPPCLFRLccB15m+R8b+xsWN6JX3/TuimFpkYSym
   LD7Gi95AxD/2AlmqAq8IaJE8pPPcOkc1FarHxD4Z01bqhitF8+wKSIBeV
   WECet9yf0uBEMJDzlEMxQMWhfcA98xCXJtor0QroY2PCneekp40+I6Gk2
   KkgNPHd1GoS4L9JPSGffV4GODvFhUuxrnjyq6LNwQDBEhTsX57Mesg8YS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="11249382"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="11249382"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 21:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="4075400"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2023 21:41:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0bJq-0007hY-0s;
	Wed, 08 Nov 2023 05:41:38 +0000
Date: Wed, 8 Nov 2023 13:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 16/19] kernel/sched/debug.c:529:50:
 warning: format '%ld' expects argument of type 'long int', but argument 4
 has type 'unsigned int'
Message-ID: <202311081143.2gkl83d1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   4a97a4d025f6984a0ae7bb2c21ab09a52d4c1c6a
commit: 727da1ee003381aa8f9a21ba534a86e40c0e9b7e [16/19] sched/fair: Fair server interface
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20231108/202311081143.2gkl83d1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081143.2gkl83d1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081143.2gkl83d1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
   kernel/sched/debug.c:342:57: warning: integer overflow in expression of type 'long int' results in '-100663296' [-Woverflow]
     342 | static unsigned long fair_server_period_max = (1 << 22) * NSEC_PER_USEC; /* ~4 seconds */
         |                                                         ^
   kernel/sched/debug.c: In function 'debugfs_fair_server_init':
>> kernel/sched/debug.c:529:50: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]
     529 |                 snprintf(buf, sizeof(buf), "cpu%ld", cpu);
         |                                                ~~^   ~~~
         |                                                  |   |
         |                                                  |   unsigned int
         |                                                  long int
         |                                                %d


vim +529 kernel/sched/debug.c

   515	
   516	static void debugfs_fair_server_init(void)
   517	{
   518		struct dentry *d_fair;
   519		unsigned int cpu;
   520	
   521		d_fair = debugfs_create_dir("fair_server", debugfs_sched);
   522		if (!d_fair)
   523			return;
   524	
   525		for_each_possible_cpu(cpu) {
   526			struct dentry *d_cpu;
   527			char buf[32];
   528	
 > 529			snprintf(buf, sizeof(buf), "cpu%ld", cpu);
   530			d_cpu = debugfs_create_dir(buf, d_fair);
   531	
   532			debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &fair_server_runtime_fops);
   533			debugfs_create_file("period", 0644, d_cpu, (void *) cpu, &fair_server_period_fops);
   534			debugfs_create_file("defer", 0644, d_cpu, (void *) cpu, &fair_server_defer_fops);
   535		}
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
