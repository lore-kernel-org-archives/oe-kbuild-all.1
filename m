Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD943D60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 08:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690617756; x=1722153756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oXw6DwEUvMr5hEe/N+HaFvVDNhczIV8IGtjNzjHVMYI=;
  b=P2xGTgYVFq6REFLbZlLXzeucZlfhNB/mfSI1fzG4gQfsVxdP/K/rkpXN
   d3cZCiD2NeDjLlgB5NXARUa5Imv1ySzXC9yTMfBt4snpG6d9vsY9e61z9
   YB9g24Ilesbu7DR6v3znoSDuuKEzZTyMAR7TkecrC5/WM5DJ3UR4L3dMz
   F+glOa4b2tqv32wOK9Eg1gxkUrbUT8YqFRys/Z/tX6I01W09Eoo77V7Cb
   n8sJ8NgL1demu+MJpNnsWqgSaFglApPPUKf1QFTe0yx7U/NTkTgnSLNOz
   PgKQfN3aP5AA02GUa9Ek1kFy4Qp0v2eEh2JZlh4VZjZgyW/BknGougFWK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="358771775"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="358771775"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 01:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="817755174"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="817755174"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2023 01:02:34 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPeuH-0003uh-2X;
	Sat, 29 Jul 2023 08:02:33 +0000
Date: Sat, 29 Jul 2023 16:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:tcx_warn_dbg 1/1]
 include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of
 type 'long unsigned int', but argument 5 has type 'int'
Message-ID: <202307291512.jsbAq8ls-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git tcx_warn_dbg
head:   60e4b66be28ba06cc6c12d45f741e2ff760ed18f
commit: 607f95d32fb730e23c398b33976594cd41dedd10 [1/1] dbg print for tcx warn splat
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230729/202307291512.jsbAq8ls-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291512.jsbAq8ls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291512.jsbAq8ls-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:17,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from net/sched/sch_generic.c:11:
   net/sched/sch_generic.c: In function 'shutdown_scheduler_queue':
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   net/sched/sch_generic.c:1144:17: note: in expansion of macro 'pr_info'
    1144 |                 pr_info("%s dev %s %lx txq %lx qdisc %lx refcnt %d\n",
         |                 ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
