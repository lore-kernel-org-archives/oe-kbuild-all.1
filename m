Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF8513CF8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715377836; cv=none; b=tXsG/uss6CmOwDJT126r85L6akw1IMX1qoRhbKF74BXVS6RR17s8Pbz18o4/zPnEpbabbGXf3oCGmPQmMI9t5L0Sxi6t2T8N/6m0s/yeypEF2WHlzzvvzg/xeC5s8Xrix1u7OEL96gOIpOT+d4gE1SNITqrmuiZw/EYBBOgmzB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715377836; c=relaxed/simple;
	bh=gRR88CNig+NlIjGZsMMImTgYG+WpTUavkUCYweNVUy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sb7ZnUf7qe3ftDDNZ0kAIcTvka0srlZ42q/E94FMsGZjhGGjk4pOQ1JX8yw4VaMZwGONR1VTQ6FtZuNNbQCMqg350l66zujqo9TpnTlknCRm5eQIwZGCYdVZOwzc7+U82FQ0VclFUc/06T0gSlyQni8gKPTh6iPorBuO5JP2ufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebnylN0v; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebnylN0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715377835; x=1746913835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRR88CNig+NlIjGZsMMImTgYG+WpTUavkUCYweNVUy0=;
  b=ebnylN0vH+70H8eCXW54J5XU4wPdUr5jnq7H2lONSozvm6/CWSo6cHRd
   +iHm6rcpBs2misHZYC8icuQ7cpXIZWq154wyaRbEsRBiPgnj5Rbyn24Nj
   DT6tAOD8WOfHo8bkV59CYWgJs+MLxpjUuWeE+i80RA9eKVfhzzE6ENfzo
   NKYNvtFEJ7jah75DwznDUbI4/uTIl7uX2Xy2n/4TIKruFNx/DksTOO5zB
   hDz4i1VYudsL4dGLvX+smaPoram6opO5tdEtJQ4b2Ft7WxjZId/CaeXPw
   Y9NNA2ZSi+nRsA/e1GdzN4eoaJKNdwfAx8iSH33woYJNqZuEVldkT8eQj
   w==;
X-CSE-ConnectionGUID: Z9DiKvK0Rf+NZtVzmiwOzw==
X-CSE-MsgGUID: r0stJUbZSISTYUjSmNwqEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11542706"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="11542706"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 14:50:34 -0700
X-CSE-ConnectionGUID: Qa6NsCCrSzazjJtGiMuHeA==
X-CSE-MsgGUID: tGYitw5dSdWHhhOJbr6IjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="34613512"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 May 2024 14:50:32 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Y8L-0006bn-3D;
	Fri, 10 May 2024 21:50:30 +0000
Date: Sat, 11 May 2024 05:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2850/9501] kernel/sched/isolation.c:244:19:
 error: invalid storage class for function 'enhanced_isolcpus_setup'
Message-ID: <202405110520.AdmHWk19-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a00ba8b54d9123a4242dc589aee8122a3adf0d4a
commit: 5f20541757730418065c3ae77dfdbcde3f523394 [2850/9501] blk-mq: avoid housekeeping CPUs scheduling a worker on a non-housekeeping CPU
config: x86_64-randconfig-012-20240511 (https://download.01.org/0day-ci/archive/20240511/202405110520.AdmHWk19-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110520.AdmHWk19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110520.AdmHWk19-lkp@intel.com/

All errors (new ones prefixed by >>):

      54 | EXPORT_SYMBOL_GPL(housekeeping_any_cpu);
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:39:5: note: previous definition of 'housekeeping_any_cpu' with type 'int(enum hk_type)'
      39 | int housekeeping_any_cpu(enum hk_type type)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:63:19: error: non-static declaration of 'housekeeping_cpumask' follows static declaration
      63 | EXPORT_SYMBOL_GPL(housekeeping_cpumask);
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/isolation.c:63:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      63 | EXPORT_SYMBOL_GPL(housekeeping_cpumask);
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:56:23: note: previous definition of 'housekeeping_cpumask' with type 'const struct cpumask *(enum hk_type)'
      56 | const struct cpumask *housekeeping_cpumask(enum hk_type type)
         |                       ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:71:19: error: non-static declaration of 'housekeeping_affine' follows static declaration
      71 | EXPORT_SYMBOL_GPL(housekeeping_affine);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/isolation.c:71:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      71 | EXPORT_SYMBOL_GPL(housekeeping_affine);
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:65:6: note: previous definition of 'housekeeping_affine' with type 'void(struct task_struct *, enum hk_type)'
      65 | void housekeeping_affine(struct task_struct *t, enum hk_type type)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:80:19: error: non-static declaration of 'housekeeping_test_cpu' follows static declaration
      80 | EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/isolation.c:80:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      80 | EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:73:6: note: previous definition of 'housekeeping_test_cpu' with type 'bool(int,  enum hk_type)' {aka '_Bool(int,  enum hk_type)'}
      73 | bool housekeeping_test_cpu(int cpu, enum hk_type type)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:100:20: error: invalid storage class for function 'housekeeping_setup_type'
     100 | static void __init housekeeping_setup_type(enum hk_type type,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:109:19: error: invalid storage class for function 'housekeeping_setup'
     109 | static int __init housekeeping_setup(char *str, unsigned long flags)
         |                   ^~~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:180:19: error: invalid storage class for function 'housekeeping_nohz_full_setup'
     180 | static int __init housekeeping_nohz_full_setup(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/linux/kernel.h:30:
   kernel/sched/isolation.c:189:23: error: initializer element is not constant
     189 | __setup("nohz_full=", housekeeping_nohz_full_setup);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/isolation.c:189:1: note: in expansion of macro '__setup'
     189 | __setup("nohz_full=", housekeeping_nohz_full_setup);
         | ^~~~~~~
   kernel/sched/isolation.c:189:23: note: (near initialization for '__setup_housekeeping_nohz_full_setup.setup_func')
     189 | __setup("nohz_full=", housekeeping_nohz_full_setup);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/isolation.c:189:1: note: in expansion of macro '__setup'
     189 | __setup("nohz_full=", housekeeping_nohz_full_setup);
         | ^~~~~~~
   kernel/sched/isolation.c:191:19: error: invalid storage class for function 'housekeeping_isolcpus_setup'
     191 | static int __init housekeeping_isolcpus_setup(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:241:22: error: initializer element is not constant
     241 | __setup("isolcpus=", housekeeping_isolcpus_setup);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/isolation.c:241:1: note: in expansion of macro '__setup'
     241 | __setup("isolcpus=", housekeeping_isolcpus_setup);
         | ^~~~~~~
   kernel/sched/isolation.c:241:22: note: (near initialization for '__setup_housekeeping_isolcpus_setup.setup_func')
     241 | __setup("isolcpus=", housekeeping_isolcpus_setup);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/isolation.c:241:1: note: in expansion of macro '__setup'
     241 | __setup("isolcpus=", housekeeping_isolcpus_setup);
         | ^~~~~~~
>> kernel/sched/isolation.c:244:19: error: invalid storage class for function 'enhanced_isolcpus_setup'
     244 | static int __init enhanced_isolcpus_setup(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/isolation.c:249:30: error: initializer element is not constant
     249 | __setup("enhanced_isolcpus", enhanced_isolcpus_setup);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/isolation.c:249:1: note: in expansion of macro '__setup'
     249 | __setup("enhanced_isolcpus", enhanced_isolcpus_setup);
         | ^~~~~~~
   kernel/sched/isolation.c:249:30: note: (near initialization for '__setup_enhanced_isolcpus_setup.setup_func')
     249 | __setup("enhanced_isolcpus", enhanced_isolcpus_setup);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/isolation.c:249:1: note: in expansion of macro '__setup'
     249 | __setup("enhanced_isolcpus", enhanced_isolcpus_setup);
         | ^~~~~~~
   In file included from kernel/sched/build_utility.c:109:
   kernel/sched/autogroup.c:7:28: error: section attribute cannot be specified for local variables
       7 | unsigned int __read_mostly sysctl_sched_autogroup_enabled = 1;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:15:35: error: initializer element is not constant
      15 |                 .data           = &sysctl_sched_autogroup_enabled,
         |                                   ^
   kernel/sched/autogroup.c:15:35: note: (near initialization for 'sched_autogroup_sysctls[0].data')
   kernel/sched/autogroup.c:25:20: error: invalid storage class for function 'sched_autogroup_sysctl_init'
      25 | static void __init sched_autogroup_sysctl_init(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:47:20: error: invalid storage class for function 'autogroup_destroy'
      47 | static inline void autogroup_destroy(struct kref *kref)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:60:20: error: invalid storage class for function 'autogroup_kref_put'
      60 | static inline void autogroup_kref_put(struct autogroup *ag)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:65:33: error: invalid storage class for function 'autogroup_kref_get'
      65 | static inline struct autogroup *autogroup_kref_get(struct autogroup *ag)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:71:33: error: invalid storage class for function 'autogroup_task_get'
      71 | static inline struct autogroup *autogroup_task_get(struct task_struct *p)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:85:33: error: invalid storage class for function 'autogroup_create'
      85 | static inline struct autogroup *autogroup_create(void)
         |                                 ^~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:158:1: error: invalid storage class for function 'autogroup_move_group'
     158 | autogroup_move_group(struct task_struct *p, struct autogroup *ag)
         | ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:202:15: error: non-static declaration of 'sched_autogroup_create_attach' follows static declaration
     202 | EXPORT_SYMBOL(sched_autogroup_create_attach);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:202:1: note: in expansion of macro 'EXPORT_SYMBOL'
     202 | EXPORT_SYMBOL(sched_autogroup_create_attach);
         | ^~~~~~~~~~~~~
   kernel/sched/autogroup.c:193:6: note: previous definition of 'sched_autogroup_create_attach' with type 'void(struct task_struct *)'
     193 | void sched_autogroup_create_attach(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:209:15: error: non-static declaration of 'sched_autogroup_detach' follows static declaration
     209 | EXPORT_SYMBOL(sched_autogroup_detach);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:209:1: note: in expansion of macro 'EXPORT_SYMBOL'
     209 | EXPORT_SYMBOL(sched_autogroup_detach);
         | ^~~~~~~~~~~~~
   kernel/sched/autogroup.c:205:6: note: previous definition of 'sched_autogroup_detach' with type 'void(struct task_struct *)'
     205 | void sched_autogroup_detach(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:221:19: error: invalid storage class for function 'setup_autogroup'
     221 | static int __init setup_autogroup(char *str)
         |                   ^~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:227:24: error: initializer element is not constant
     227 | __setup("noautogroup", setup_autogroup);
         |                        ^~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/autogroup.c:227:1: note: in expansion of macro '__setup'
     227 | __setup("noautogroup", setup_autogroup);
         | ^~~~~~~
   kernel/sched/autogroup.c:227:24: note: (near initialization for '__setup_setup_autogroup.setup_func')
     227 | __setup("noautogroup", setup_autogroup);
         |                        ^~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/autogroup.c:227:1: note: in expansion of macro '__setup'
     227 | __setup("noautogroup", setup_autogroup);
         | ^~~~~~~


vim +/enhanced_isolcpus_setup +244 kernel/sched/isolation.c

   242	
   243	bool enhanced_isolcpus;
 > 244	static int __init enhanced_isolcpus_setup(char *str)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
