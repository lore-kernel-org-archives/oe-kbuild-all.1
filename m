Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45703C05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682084777; x=1713620777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F8sAXmbcgfW6+uCQpYGxmzM3GwTEHgQF3kNKT6VuRvA=;
  b=jp+gDPQwr47fUKQfDUUBbgjXntkVUHIbhq9rh3Kw+RsipSxy1mFe/2sA
   iEU7ZjieU0AAQviWpdk5kVDxChfLScGf58LLhrpgT2Ej1nj3sdCdU9blb
   hkEWXNtna/CU6UaMgj7wZpJirX/3SXz47+7cwnbo42cFkYPfcC0rIEVCR
   SdsyDGutQtP57RSQu4J8dBwtRoiGJgX6l4mPMwAQpY8f7AbkxgfoahrUu
   76eQ5M8hbkxhSarq1DJ65ULEq4ztXO08m6/k6Y7xNWHyk5RKp07yPIfhE
   LfWZxdCLRb0IAjkhwKD4uGQKVAdgY1CHjnrxzZB0UXhtcDHT/qBjoXNeQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="373918171"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="373918171"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 06:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="803745714"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="803745714"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2023 06:46:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppr5a-000gcK-1z;
	Fri, 21 Apr 2023 13:46:14 +0000
Date: Fri, 21 Apr 2023 21:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Redpath <chris.redpath@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Patrick Bellasi <patrick.bellasi@arm.com>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 1455/9999]
 kernel/sched/fair.c:6738:1: sparse: sparse: symbol '__pcpu_scope_eenv_cache'
 was not declared. Should it be static?
Message-ID: <202304212113.A0D1kjmf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 0d2a194c54348734338a8be17f0860be327eb00d [1455/9999] ANDROID: sched/fair: re-factor energy_diff to use a single (extensible) energy_env
config: sparc64-randconfig-s053-20230416 (https://download.01.org/0day-ci/archive/20230421/202304212113.A0D1kjmf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/0d2a194c54348734338a8be17f0860be327eb00d
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 0d2a194c54348734338a8be17f0860be327eb00d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash drivers/mmc/host/ kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304212113.A0D1kjmf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:1106:47: sparse: sparse: duplicate const
   kernel/sched/fair.c:56:14: sparse: sparse: symbol 'normalized_sysctl_sched_latency' was not declared. Should it be static?
   kernel/sched/fair.c:86:14: sparse: sparse: symbol 'normalized_sysctl_sched_min_granularity' was not declared. Should it be static?
   kernel/sched/fair.c:109:14: sparse: sparse: symbol 'normalized_sysctl_sched_wakeup_granularity' was not declared. Should it be static?
   kernel/sched/fair.c:143:14: sparse: sparse: symbol 'capacity_margin' was not declared. Should it be static?
   kernel/sched/fair.c:3547:6: sparse: sparse: symbol 'sync_entity_load_avg' was not declared. Should it be static?
   kernel/sched/fair.c:3560:6: sparse: sparse: symbol 'remove_entity_load_avg' was not declared. Should it be static?
   kernel/sched/fair.c:9606:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9606:22: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9606:22: sparse:    struct sched_domain *
   kernel/sched/fair.c:9618:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9618:9: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9618:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:5108:1: sparse: sparse: symbol '__pcpu_scope_load_balance_mask' was not declared. Should it be static?
   kernel/sched/fair.c:5109:1: sparse: sparse: symbol '__pcpu_scope_select_idle_mask' was not declared. Should it be static?
   kernel/sched/fair.c:5495:15: sparse: sparse: symbol 'capacity_curr_of' was not declared. Should it be static?
   kernel/sched/fair.c:5812:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5812:22: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:5812:22: sparse:    struct sched_domain *
   kernel/sched/fair.c:5816:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5816:17: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:5816:17: sparse:    struct sched_domain *
   kernel/sched/fair.c:6133:1: sparse: sparse: symbol 'boosted_cpu_util' was not declared. Should it be static?
   kernel/sched/fair.c:6531:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6531:19: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:6531:19: sparse:    struct sched_domain *
>> kernel/sched/fair.c:6738:1: sparse: sparse: symbol '__pcpu_scope_eenv_cache' was not declared. Should it be static?
   kernel/sched/fair.c:6949:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6949:9: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:6949:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:9728:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9728:9: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9728:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:9868:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9868:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9868:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:9942:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9942:9: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9942:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:10058:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10058:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:10058:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:4950:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:4950:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:4950:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:6589:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6589:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:6589:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:6620:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6620:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:6620:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:5880:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5880:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:5880:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:6881:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6881:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:6881:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:6381:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6381:17: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:6381:17: sparse:    struct sched_domain *
   kernel/sched/fair.c:10174:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10174:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:10174:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:10188:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10188:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:10188:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:10197:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10197:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:10197:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:9851:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9851:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9851:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:9778:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9778:16: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9778:16: sparse:    struct sched_domain *
   kernel/sched/fair.c:9778:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9778:16: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9778:16: sparse:    struct sched_domain *
   kernel/sched/fair.c:10174:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10174:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:10174:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:10188:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10188:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:10188:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:10197:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10197:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:10197:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:9851:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9851:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9851:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:4950:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:4950:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:4950:14: sparse:    struct sched_domain *
   In file included from kernel/sched/fair.c:25:0:
   include/linux/sched/topology.h:196:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    const struct sched_group_energy * const(*sched_domain_energy_f)(int cpu);
    ^~~~~
   In file included from kernel/sched/fair.c:39:0:
   kernel/sched/sched.h:1106:34: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
     const struct sched_group_energy const *sge;
                                     ^~~~~
   kernel/sched/fair.c:3409:5: warning: no previous declaration for 'update_rt_rq_load_avg' [-Wmissing-declarations]
    int update_rt_rq_load_avg(u64 now, int cpu, struct rt_rq *rt_rq, int running)
        ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3547:6: warning: no previous declaration for 'sync_entity_load_avg' [-Wmissing-declarations]
    void sync_entity_load_avg(struct sched_entity *se)
         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3560:6: warning: no previous declaration for 'remove_entity_load_avg' [-Wmissing-declarations]
    void remove_entity_load_avg(struct sched_entity *se)
         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5495:15: warning: no previous declaration for 'capacity_curr_of' [-Wmissing-declarations]
    unsigned long capacity_curr_of(int cpu)
                  ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6133:1: warning: no previous declaration for 'boosted_cpu_util' [-Wmissing-declarations]
    boosted_cpu_util(int cpu)
    ^~~~~~~~~~~~~~~~

vim +/__pcpu_scope_eenv_cache +6738 kernel/sched/fair.c

  6737	
> 6738	DEFINE_PER_CPU(struct energy_env, eenv_cache);
  6739	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
