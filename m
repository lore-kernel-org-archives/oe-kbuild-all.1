Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADDD3D3D09
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772030765; cv=none; b=MFsGUBubK384O/eudBL9gI/Ur0uSWqHb9wBsesyTbBKzp8QC37yhU0BrK8oXKG0H4SvTcTySUBhSIrDhtx9GU8C8RljEgUikruieMH8NBDB9+BHt/wdb3RQ0VlTbPJZvplkR5+wDlXRIw2W1YjH7Ixqoc/Jm1XKu9PK3zLmqnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772030765; c=relaxed/simple;
	bh=s3EBxN6DFKhiVS0BBD1m5vV6kTqExTJU1zCMUbR2rqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HXn+R2mDeHRMdEI6A51Bwx8jkd2vZsNz2/86ppyAdK14qI2/FXSiq9m/xyaguvTdxK6cN0UOHB4dNxx70U6WVJkXyg90mKEytqpkdoK0deguMnChRsF8BSY3HvfaWb34b0fkYlvn5FjMKT4s7ORj37b8PwkoDqKenoEvaSVqr8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1PWx7SZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1PWx7SZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772030762; x=1803566762;
  h=date:from:to:cc:subject:message-id;
  bh=s3EBxN6DFKhiVS0BBD1m5vV6kTqExTJU1zCMUbR2rqs=;
  b=M1PWx7SZWVccfHe04CN+rVL9WN1b5HUwlXfAnpgJDvXsvJ6Z8Jg8vL76
   UHkTaPxw7HlKlKVQuCbnuHiOQXP2DwT2ktE9FZwgvZFYCzBj2Gmz53VGc
   bhv2VxWp6hxTCd6IhcV712kiZ/NVwMHzmuALhkHi/tLmuREi8ErLJc+gN
   nsINJdLn89ZpDHstWvslrjK2YHSNwhn0fyJ8SW+EtNUVQQlV0QI02pGYA
   2rHLIzRiycas4yH1qkCScetlykYC5oWkRxocrCkZqXj+AOE4w4ho9JVw2
   Rxn5NKHaZwH0I5pdp/dr5PgIwNbNpzb+tBEZ6f87AWG32KxHAGUiKTwGU
   Q==;
X-CSE-ConnectionGUID: 8Y8sk7hnRBe099oHpX4xrg==
X-CSE-MsgGUID: vkcfPyXiSg2e79efGxkTSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84527348"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="84527348"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 06:46:01 -0800
X-CSE-ConnectionGUID: QKt41g/5Qzal8VEjv9Zmrg==
X-CSE-MsgGUID: a76FYHWWQae1mOICOeH6CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="216279645"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Feb 2026 06:46:00 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvG9F-00000000630-2tGI;
	Wed, 25 Feb 2026 14:45:57 +0000
Date: Wed, 25 Feb 2026 22:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-sub-sched-v2 39/40]
 kernel/sched/ext.c:311:26: warning: 'scx_find_sub_sched' defined but not used
Message-ID: <202602252240.6Xdpel20-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-sched-v2
head:   f2122e67cf5ccb9d8844e72cd437a6fd56f0ad80
commit: d677bb99b962654339f800fe691c1d9972664402 [39/40] sched_ext: Add rhashtable lookup for sub-schedulers
config: powerpc-randconfig-001-20260225 (https://download.01.org/0day-ci/archive/20260225/202602252240.6Xdpel20-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602252240.6Xdpel20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602252240.6Xdpel20-lkp@intel.com/

All warnings (new ones prefixed by >>):

     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2448:24: note: in expansion of macro 'rcu_access_pointer'
    2448 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
   kernel/sched/ext.c:2448:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2448 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:507:50: note: in expansion of macro 'READ_ONCE'
     507 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:626:31: note: in expansion of macro '__rcu_access_pointer'
     626 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __UNIQUE_ID(rcu), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2448:24: note: in expansion of macro 'rcu_access_pointer'
    2448 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:2448:52: error: 'struct sched_ext_entity' has no member named 'sched'
    2448 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                                                    ^
   include/linux/rcupdate.h:509:19: note: in definition of macro '__rcu_access_pointer'
     509 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   kernel/sched/ext.c:2448:24: note: in expansion of macro 'rcu_access_pointer'
    2448 |                 sch == rcu_access_pointer(prev->scx.sched);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c:2472:27: error: 'struct scx_sched_pcpu' has no member named 'bypass_host_seq'
    2472 |                 if (!(pcpu->bypass_host_seq++ % SCX_BYPASS_HOST_NTH) &&
         |                           ^~
   kernel/sched/ext.c: In function '__scx_init_task':
   kernel/sched/ext.c:3212:28: warning: unused variable 'tg' [-Wunused-variable]
    3212 |         struct task_group *tg = task_group(p);
         |                            ^~
   In file included from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from arch/powerpc/include/asm/cmpxchg.h:8,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13:
   kernel/sched/ext.c: In function 'scx_disable_and_exit_task':
   kernel/sched/ext.c:3379:28: error: 'scx_enabling_sub_sched' undeclared (first use in this function); did you mean 'scx_find_sub_sched'?
    3379 |             !WARN_ON_ONCE(!scx_enabling_sub_sched)) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/ext.c:3379:14: note: in expansion of macro 'WARN_ON_ONCE'
    3379 |             !WARN_ON_ONCE(!scx_enabling_sub_sched)) {
         |              ^~~~~~~~~~~~
   kernel/sched/ext.c:3379:28: note: each undeclared identifier is reported only once for each function it appears in
    3379 |             !WARN_ON_ONCE(!scx_enabling_sub_sched)) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/ext.c:3379:14: note: in expansion of macro 'WARN_ON_ONCE'
    3379 |             !WARN_ON_ONCE(!scx_enabling_sub_sched)) {
         |              ^~~~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_fork':
   kernel/sched/ext.c:3419:52: error: invalid use of undefined type 'struct css_set'
    3419 |                 struct scx_sched *sch = kargs->cset->dfl_cgrp->scx_sched;
         |                                                    ^~
   kernel/sched/ext.c: In function 'scx_root_disable':
   kernel/sched/ext.c:5055:9: error: implicit declaration of function 'drain_descendants' [-Werror=implicit-function-declaration]
    5055 |         drain_descendants(sch);
         |         ^~~~~~~~~~~~~~~~~
   kernel/sched/ext.c:5116:29: error: 'struct scx_sched' has no member named 'cgrp'
    5116 |         set_cgroup_sched(sch->cgrp, NULL);
         |                             ^~
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:5609:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    5609 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_root_enable':
   kernel/sched/ext.c:5874:45: error: 'cgrp_dfl_root' undeclared (first use in this function)
    5874 |         sch = scx_alloc_and_add_sched(ops, &cgrp_dfl_root.cgrp, NULL);
         |                                             ^~~~~~~~~~~~~
   kernel/sched/ext.c:5980:29: error: 'struct scx_sched' has no member named 'cgrp'
    5980 |         set_cgroup_sched(sch->cgrp, sch);
         |                             ^~
   kernel/sched/ext.c: At top level:
   kernel/sched/ext.c:5042:13: warning: 'scx_propgate_disable' defined but not used [-Wunused-function]
    5042 | static void scx_propgate_disable(struct scx_sched *sch) { }
         |             ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:311:26: warning: 'scx_find_sub_sched' defined but not used [-Wunused-function]
     311 | static struct scx_sched *scx_find_sub_sched(u64 cgroup_id) { return NULL; }
         |                          ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/scx_find_sub_sched +311 kernel/sched/ext.c

   303	
   304	static void scx_set_task_sched(struct task_struct *p, struct scx_sched *sch)
   305	{
   306		rcu_assign_pointer(p->scx.sched, sch);
   307	}
   308	#else	/* CONFIG_EXT_SUB_SCHED */
   309	static struct scx_sched *scx_parent(struct scx_sched *sch) { return NULL; }
   310	static struct scx_sched *scx_next_descendant_pre(struct scx_sched *pos, struct scx_sched *root) { return pos ? NULL : root; }
 > 311	static struct scx_sched *scx_find_sub_sched(u64 cgroup_id) { return NULL; }
   312	static void scx_set_task_sched(struct task_struct *p, struct scx_sched *sch) {}
   313	#endif	/* CONFIG_EXT_SUB_SCHED */
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
