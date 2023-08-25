Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8F32571
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692979239; x=1724515239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MnuvzrNKnRvtiPcWohCPH2/9BEFOKpPwiUltvwSihn0=;
  b=Z9L0pCnQTcWil9daGc3TiapMicUp1H/4arsQBH69PenHxMhkzNQDOx3+
   mwIJj7SFtrZPlPMvsNkZ/r+ghiXhtNVEh0poVlkxUwW67OktjAQUg/85w
   qtE8vymN1eFUBh63QJZSCf8og253Yx1pOz1vhvt7EmmQVXIhhrDtrwfMg
   W2dH+l7vh6a7ASP2tSWl/RInDANfURYgSCSU+PvREVtF8rg/eUZmUDxYT
   THYlXp1PHni6zWRVnyXtZ8l/grDBLl3rkLYHe+UPWXehKsJ34Y5rJI/FF
   uOx4X9c3tLwMjd/Us9tZwIrShpIdQibLgPoYWRjW/OloIii4F6D6e2/6/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="364935452"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="364935452"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 09:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="766996217"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="766996217"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 09:00:21 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZZE8-0003mB-1S;
	Fri, 25 Aug 2023 16:00:10 +0000
Date: Fri, 25 Aug 2023 23:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Redpath <chris.redpath@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Patrick Bellasi <patrick.bellasi@arm.com>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 1455/9999]
 kernel/sched/fair.c:6738:1: sparse: sparse: symbol '__pcpu_scope_eenv_cache'
 was not declared. Should it be static?
Message-ID: <202308252341.Dzh8qhmS-lkp@intel.com>
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
config: i386-randconfig-062-20230825 (https://download.01.org/0day-ci/archive/20230825/202308252341.Dzh8qhmS-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252341.Dzh8qhmS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252341.Dzh8qhmS-lkp@intel.com/

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
   kernel/sched/fair.c:9942:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9942:9: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9942:9: sparse:    struct sched_domain *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/fair.c:4950:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:4950:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:4950:14: sparse:    struct sched_domain *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/fair.c:6409:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6409:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:6409:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6400:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6400:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:6400:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6409:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6409:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:6409:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6400:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6400:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:6400:15: sparse:    struct sched_domain_shared *
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
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/fair.c:9778:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9778:16: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9778:16: sparse:    struct sched_domain *
   kernel/sched/fair.c:4950:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:4950:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:4950:14: sparse:    struct sched_domain *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2127:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2127:16: sparse:    struct update_util_data *
   In file included from kernel/sched/fair.c:25:0:
   include/linux/sched/topology.h:196:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    const struct sched_group_energy * const(*sched_domain_energy_f)(int cpu);
    ^~~~~
   In file included from kernel/sched/fair.c:39:0:
   kernel/sched/sched.h:1106:34: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
     const struct sched_group_energy const *sge;

vim +/__pcpu_scope_eenv_cache +6738 kernel/sched/fair.c

  6737	
> 6738	DEFINE_PER_CPU(struct energy_env, eenv_cache);
  6739	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
