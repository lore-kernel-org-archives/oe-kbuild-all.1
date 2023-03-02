Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769F16FCC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 20:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677789575; x=1709325575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z3EmlkjpkrbckAE+XfCDHg6ANGYO34a6vhLpW/so4Iw=;
  b=h3J5cVxiJIx2q/zUxQBcmbhvrbLedWuDHWzkXLWxElZmu0n6reg5jEsr
   Zd0Q9cbnlg/M+aFaBJ1XyRZd7cByfVIynNUtOpPZIXGvwOo7o/Pk/b9hO
   is2E4GrswPbS5rBacsi1XTO53O358x9FGOo0mLXh5pt/7JvsFO0JJeq9v
   HTBA4+NlszwxV86wl+XdJUvzSRu2uPhfMO/wfpwMcRCra86ZItrd8ok3N
   4G+2+0gPj6TvpLdDMCZAV/uPK7POVjdZyaI+vwPSv0/2OFqQ1dMnT7XgY
   Q3PL3EYQSPBBZct+CXLwSOx8L/C1o1NvfnAJqqaOtMY5vpjGDNYeG5a1N
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="323142073"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="323142073"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 12:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="920850477"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="920850477"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Mar 2023 12:39:33 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXpi8-0000rs-2m;
	Thu, 02 Mar 2023 20:39:32 +0000
Date: Fri, 3 Mar 2023 04:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vineeth Pillai <vineethrp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Joel Fernandes <joelaf@google.com>
Subject: [jfern:sched/rt-throttle 11/12] kernel/sched/debug.c:690:11: error:
 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean
 'rt_cg_throttled'?
Message-ID: <202303030444.fjj7vHlG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle
head:   3426c4b45d36b426432e250f667021e9b4b5356b
commit: a35d0b488fd029bd34b6326d2712909f9b2bfc22 [11/12] debug bits
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230303/202303030444.fjj7vHlG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=a35d0b488fd029bd34b6326d2712909f9b2bfc22
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle
        git checkout a35d0b488fd029bd34b6326d2712909f9b2bfc22
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030444.fjj7vHlG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:73:
   kernel/sched/debug.c: In function 'print_rt_rq':
>> kernel/sched/debug.c:690:11: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
     690 |         P(rt_nr_cg_throttled);
         |           ^~~~~~~~~~~~~~~~~~
   kernel/sched/debug.c:17:31: note: in definition of macro 'SEQ_printf'
      17 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/debug.c:690:9: note: in expansion of macro 'P'
     690 |         P(rt_nr_cg_throttled);
         |         ^
   In file included from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
>> kernel/sched/debug.c:690:11: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
     690 |         P(rt_nr_cg_throttled);
         |           ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:429:33: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:542:9: note: in expansion of macro 'printk'
     542 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/debug.c:19:17: note: in expansion of macro 'pr_cont'
      19 |                 pr_cont(x);                     \
         |                 ^~~~~~~
   kernel/sched/debug.c:678:9: note: in expansion of macro 'SEQ_printf'
     678 |         SEQ_printf(m, "  .%-30s: %Ld\n", #x, (long long)(rt_rq->x))
         |         ^~~~~~~~~~
   kernel/sched/debug.c:690:9: note: in expansion of macro 'P'
     690 |         P(rt_nr_cg_throttled);
         |         ^


vim +690 kernel/sched/debug.c

   676	
   677	#define P(x) \
   678		SEQ_printf(m, "  .%-30s: %Ld\n", #x, (long long)(rt_rq->x))
   679	#define PU(x) \
   680		SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(rt_rq->x))
   681	#define PN(x) \
   682		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rt_rq->x))
   683	
   684		PU(rt_nr_running);
   685	#ifdef CONFIG_SMP
   686		PU(rt_nr_migratory);
   687	#endif
   688		P(rt_bw_throttled);
   689		P(rt_se_running);
 > 690		P(rt_nr_cg_throttled);
   691		PN(rt_time);
   692		PN(rt_runtime);
   693	
   694		SEQ_printf(m, "rq bitmap: 0x%lx-0x%lx\n", array->bitmap[1], array->bitmap[0]);
   695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
