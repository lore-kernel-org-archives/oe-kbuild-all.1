Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAC83A1DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Nov 2024 01:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731635393; cv=none; b=DupnjIW8jW8e81MFGUYZ9Jz5GtAA5PzQH5lTZfwITmXzACsN9sgOYYoZVYjkHZT4HixP0nGZa/i0e6Yzl/5ceBAwsEOwe9dolQKsPFqxxuwrZjbEqTmRFeFGAc75ZWWq6spi7T0zn/V/M4QzUftqEW/ukcnwHrwHXloWCBHSd28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731635393; c=relaxed/simple;
	bh=zLXyKayWIPa0Qhp/wyMm8qR1JiA5funFrCq7xs9U73c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fUoMcVwQYjB0UVf4HsHCMYYI6fWMMOYRcGnG81UH4zwRErKqfxgJ7j3DnGWa2pFMAzvzqSOP9CDCcvTr3k2KxTCm2sl261R+ae1N7y+rN5GsLzysO6RMNKJaWXxsnN+vV5fF/eVF42PKNzj+eNgGCFx46myvPmVmincJNCbCB8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsT12BRW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsT12BRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731635391; x=1763171391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zLXyKayWIPa0Qhp/wyMm8qR1JiA5funFrCq7xs9U73c=;
  b=EsT12BRWm+zmrZUC50wuj+VM2dnQs8lCVxD8GlDI2CJezDAKYDjJMoCu
   YWsacyalFhkRu8TwbsGj7qSQuDHwKIA49AtkekquMMXHgpMvNPUTe4pdM
   QBlzUYseJBdBGFIjAxElPmALVXGZcG/lCoJrOJ6vKfWVG1hYpEOVgaSyP
   8hozZpKBOMYaiTSq4ApUFz9QXXFLMnWJajSOOpBq7px5d/4MRPHURMXFG
   FFT7ItY1phQyd5SbD4smJw/0KS/MHQFyIqrlnYXNfYDd5tL1YsfaMloMe
   z54meLzlOqEogUVMLeRu2k37n1mylszzVrKUObkVAJqxlj+ktUkBAI4x6
   g==;
X-CSE-ConnectionGUID: UayOc3imSiuRe8NpRCQfgg==
X-CSE-MsgGUID: 2sDlqMFvRtCugiq0KuseXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31771115"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="31771115"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 12:11:12 -0800
X-CSE-ConnectionGUID: onRr/u2jTV+QqtpDAW+27g==
X-CSE-MsgGUID: tDCSAOXMQuG6LY3a+UxaHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="93142337"
Received: from lkp-server02.sh.intel.com (HELO f9eb7a33fd1e) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Nov 2024 12:11:10 -0800
Received: from kbuild by f9eb7a33fd1e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBgAv-00004f-1K;
	Thu, 14 Nov 2024 20:10:51 +0000
Date: Fri, 15 Nov 2024 04:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1466/1466] kernel/sched/isolation.c:244:19:
 error: invalid storage class for function 'enhanced_isolcpus_setup'
Message-ID: <202411150414.EQvXfvAg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xiongfeng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d69967a075c9d0f558f61dba44b2185a87e75026
commit: 5f20541757730418065c3ae77dfdbcde3f523394 [1466/1466] blk-mq: avoid housekeeping CPUs scheduling a worker on a non-housekeeping CPU
config: loongarch-randconfig-r051-20241114 (https://download.01.org/0day-ci/archive/20241115/202411150414.EQvXfvAg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150414.EQvXfvAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150414.EQvXfvAg-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                         ^~~~~~~~~~~~~~
   kernel/sched/isolation.c:54:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
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
