Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633B27E5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 02:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687055461; x=1718591461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ORP7A6OGo9/Lh+dqaC0b8FFe8JRTulWCmA2prL6mOE=;
  b=SlTJRQIvjFs+xRsFOisT8bFFCdT5zH7MxnyYS3IM7Oqg5pH64+vVGzCF
   9DLqoEwGRAtu7ey3oN+JB/efjlkkd1+FDAKGUHAGCeqyEWhM2wgQk7NrY
   1ci8qh9Vq/HRmuSrYUsd6aMzRdmX6eAliHYFXex60PFGFbcK1V6ZzG8we
   elarUv4q7AG7f3Ry2mFx4xr/k6aq4g8157On+IyyUARO43wxAeMWWdmuM
   f/Y7nFj54248ASYylDQs85yRNMJ98xCOreW1vrr54d14xEWmRD8seXz1f
   SuMk638qfgVRqUfatYg92aWxLvEH5FSJhqQjQtlUNvRyKjG5AxOAXg3C6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="362860399"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="362860399"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 19:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="707488029"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="707488029"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Jun 2023 19:30:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAiBv-0003JO-0K;
	Sun, 18 Jun 2023 02:30:59 +0000
Date: Sun, 18 Jun 2023 10:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 16/17]
 kernel/pid_namespace.c:475:9: error: too many arguments to function
 'register_sysctl_init'
Message-ID: <202306181036.F15yf0n4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   cbba378db4b97256c72560da5762aaed778957c0
commit: b1f6ed030567099a052906e9af1bdc6e6f9e5285 [16/17] sysctl: Add size to register_sysctl_init
config: nios2-randconfig-s053-20230618 (https://download.01.org/0day-ci/archive/20230618/202306181036.F15yf0n4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181036.F15yf0n4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181036.F15yf0n4-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/pid_namespace.c: In function 'pid_namespaces_init':
>> kernel/pid_namespace.c:475:9: error: too many arguments to function 'register_sysctl_init'
     475 |         register_sysctl_init("kernel", pid_ns_ctl_table,
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/key.h:17,
                    from include/linux/cred.h:13,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:976,
                    from include/linux/pid_namespace.h:7,
                    from kernel/pid_namespace.c:13:
   include/linux/sysctl.h:258:20: note: declared here
     258 | static inline void register_sysctl_init(const char *path, struct ctl_table *table)
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +/register_sysctl_init +475 kernel/pid_namespace.c

   469	
   470	static __init int pid_namespaces_init(void)
   471	{
   472		pid_ns_cachep = KMEM_CACHE(pid_namespace, SLAB_PANIC | SLAB_ACCOUNT);
   473	
   474	#ifdef CONFIG_CHECKPOINT_RESTORE
 > 475		register_sysctl_init("kernel", pid_ns_ctl_table,
   476				     ARRAY_SIZE(pid_ns_ctl_table));
   477	#endif
   478	
   479		register_pid_ns_sysctl_table_vm();
   480		return 0;
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
