Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86415A29
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 05:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681534971; x=1713070971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1aG+7Y854kZYLgSG+zUTYmZKxa80o4tWgEwPMfdmH/k=;
  b=QUzIlNz9fVKZkV3bjnd8DiQiN1gPm2XopL8R8dbtlrh7sqoXnlfySmKM
   7i/ya0I8mF5YrkKIdmxr1W2FOocewayZWAmuoAvsWlJGRDiFTFeE7w+cX
   4LcR3Z/R1WLbV8IJcSZaZfkOY+rZ4CMsOAqUyaNnQhP4qtb1Gxjorpbhy
   kijkTiZHcyG0PTbmZRk/1/wp+AzJx4UUAtG6V0ye6AsPlp2uEsojwjPUN
   xGj0L8YE083d2pIG8ItA0n31Sbl+L3Pkbzbb1qfSHi4F0Thoix6afwd9p
   ILnRqhzPDYXRhaWQKszX/psUVGUVuD2sPC0wsO96RaO1PHWaMRyiKJOsq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="347345971"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="347345971"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 22:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="814144038"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="814144038"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Apr 2023 22:02:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnY3A-000aU3-1D;
	Sat, 15 Apr 2023 05:02:12 +0000
Date: Sat, 15 Apr 2023 13:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Chris Redpath <chris.redpath@arm.com>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 1400/9999]
 include/linux/sched/topology.h:193:1: warning: type qualifiers ignored on
 function return type
Message-ID: <202304151214.wLUi5FCu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dietmar,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: d8ea4a04803c782839b65e16955b910ea47c3cdf [1400/9999] ANDROID: sched: Introduce energy data structures
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230415/202304151214.wLUi5FCu-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/d8ea4a04803c782839b65e16955b910ea47c3cdf
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout d8ea4a04803c782839b65e16955b910ea47c3cdf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/gpu/drm/i915/ kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151214.wLUi5FCu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpuset.h:13:0,
                    from kernel/sched/core.c:14:
>> include/linux/sched/topology.h:193:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    const struct sched_group_energy * const(*sched_domain_energy_f)(int cpu);
    ^~~~~
   In file included from kernel/sched/core.c:36:0:
   kernel/sched/sched.h:1098:34: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
     const struct sched_group_energy const *sge;
                                     ^~~~~
   kernel/sched/core.c:1294:5: warning: no previous declaration for 'migrate_swap' [-Wmissing-declarations]
    int migrate_swap(struct task_struct *cur, struct task_struct *p)
        ^~~~~~~~~~~~
   kernel/sched/core.c:1588:6: warning: no previous declaration for 'sched_set_stop_task' [-Wmissing-declarations]
    void sched_set_stop_task(int cpu, struct task_struct *stop)
         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3455:35: warning: no previous declaration for 'schedule_user' [-Wmissing-declarations]
    asmlinkage __visible void __sched schedule_user(void)
                                      ^~~~~~~~~~~~~
   kernel/sched/core.c:3594:35: warning: no previous declaration for 'preempt_schedule_irq' [-Wmissing-declarations]
    asmlinkage __visible void __sched preempt_schedule_irq(void)
                                      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'sched_init':
   kernel/sched/core.c:5792:32: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
     unsigned long alloc_size = 0, ptr;
                                   ^~~
--
   In file included from kernel/sched/sched.h:6:0,
                    from kernel/sched/loadavg.c:13:
>> include/linux/sched/topology.h:193:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    const struct sched_group_energy * const(*sched_domain_energy_f)(int cpu);
    ^~~~~
   In file included from kernel/sched/loadavg.c:13:0:
   kernel/sched/sched.h:1098:34: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
     const struct sched_group_energy const *sge;
                                     ^~~~~
--
   In file included from kernel/sched/fair.c:25:0:
>> include/linux/sched/topology.h:193:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    const struct sched_group_energy * const(*sched_domain_energy_f)(int cpu);
    ^~~~~
   In file included from kernel/sched/fair.c:39:0:
   kernel/sched/sched.h:1098:34: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
     const struct sched_group_energy const *sge;
                                     ^~~~~
   kernel/sched/fair.c:3502:6: warning: no previous declaration for 'sync_entity_load_avg' [-Wmissing-declarations]
    void sync_entity_load_avg(struct sched_entity *se)
         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3515:6: warning: no previous declaration for 'remove_entity_load_avg' [-Wmissing-declarations]
    void remove_entity_load_avg(struct sched_entity *se)
         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4805:6: warning: no previous declaration for 'init_cfs_bandwidth' [-Wmissing-declarations]
    void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9604:6: warning: no previous declaration for 'free_fair_sched_group' [-Wmissing-declarations]
    void free_fair_sched_group(struct task_group *tg) { }
         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9606:5: warning: no previous declaration for 'alloc_fair_sched_group' [-Wmissing-declarations]
    int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
        ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9611:6: warning: no previous declaration for 'online_fair_sched_group' [-Wmissing-declarations]
    void online_fair_sched_group(struct task_group *tg) { }
         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9613:6: warning: no previous declaration for 'unregister_fair_sched_group' [-Wmissing-declarations]
    void unregister_fair_sched_group(struct task_group *tg) { }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/bitops.h: Assembler messages:
   arch/x86/include/asm/bitops.h:225: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
--
   In file included from kernel/sched/sched.h:6:0,
                    from kernel/sched/rt.c:7:
>> include/linux/sched/topology.h:193:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    const struct sched_group_energy * const(*sched_domain_energy_f)(int cpu);
    ^~~~~
   In file included from kernel/sched/rt.c:7:0:
   kernel/sched/sched.h:1098:34: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
     const struct sched_group_energy const *sge;
                                     ^~~~~
   kernel/sched/rt.c:252:6: warning: no previous declaration for 'free_rt_sched_group' [-Wmissing-declarations]
    void free_rt_sched_group(struct task_group *tg) { }
         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:254:5: warning: no previous declaration for 'alloc_rt_sched_group' [-Wmissing-declarations]
    int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
        ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:625:6: warning: no previous declaration for 'sched_rt_bandwidth_account' [-Wmissing-declarations]
    bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +193 include/linux/sched/topology.h

   189	
   190	typedef const struct cpumask *(*sched_domain_mask_f)(int cpu);
   191	typedef int (*sched_domain_flags_f)(void);
   192	typedef
 > 193	const struct sched_group_energy * const(*sched_domain_energy_f)(int cpu);
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
