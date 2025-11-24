Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A6127FD76
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 19:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764013481; cv=none; b=VeSjyV5+1yHmeTNQDRXjOUMXjzZDRHKIdgRFtI+/5Hevyh7zON+Lt9PyW8oG8JLNQf7y7fin+Zu8bF/AdghO5UtZHC2eqGj0qP1FQIK0h1q0sgirMiKvz8EcOofOSBAVS/ZutYSo6dspZCdXUDak8/DsDDFqcGatfcrRdJJwZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764013481; c=relaxed/simple;
	bh=3NEfNiAr6SRpQ/C5KzaPX8QonaI9088y+cCKC8w1Zuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HrQEooZw7KoPTCoCZ0BlUaEEBSdMAo4/3+9oxOXZAZN/tbeB6EqekfR6QVM17hn92xfeqW3OscM1fYeQxsVnPJj7AOTq9WTiz3dTNK5KAYOffKTL2SeZfCoRJw4lDIYs7JY5A/tDRi4Xh1zmyddC6JwGO6fh+17IroNYWajmr8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtBwUhd7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtBwUhd7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764013478; x=1795549478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3NEfNiAr6SRpQ/C5KzaPX8QonaI9088y+cCKC8w1Zuc=;
  b=AtBwUhd7+K3nsA1UZFqptO0p5ZjmVoHLpiOZ0nYkH33oP1bULbPLl6io
   wcn8W7HkjHrWFt6THW8N4gEQzaZupeuNDk1ha35LQMFI3pbXUIa9zo7fq
   ttdE+F1opjpm6JcqkY2vqBitNqtgw7S21afS6mWPM1TkVxJeLYFONOX9f
   cuSALLUa3ggiMV3/kjiIuz42NXiBfUvdZ3+XIIr+nmlaEVodzcgyacOfF
   GnBNGmppkK3PP0Jy7Rie8VfDMmKOUoyTeACKomLzb105nnRxpF6fGRlYI
   5UyRzGq5DbnBpsRgyqeA8TyKktAQjRu9P/UkMxdxNp3puo6cyUidSq335
   w==;
X-CSE-ConnectionGUID: jxW3piymSxyr86PdTaIXeA==
X-CSE-MsgGUID: ggnrCBd1QR+2qoPKO1tZpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="88672836"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="88672836"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:44:37 -0800
X-CSE-ConnectionGUID: Ug3Np2pxQl6h9tgHw6eGHw==
X-CSE-MsgGUID: uaw0oUgiRN6BO5EMaVwZlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="196593863"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Nov 2025 11:44:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNcUE-00000000157-2bvo;
	Mon, 24 Nov 2025 19:44:34 +0000
Date: Tue, 25 Nov 2025 03:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3316/3316] kernel/xsched/cgroup.c:327:34:
 warning: 'struct cgroup_taskset' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202511250338.G8XPRtIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   041fb9446ce5643d6c19a4b5bcbb3068054a42fd
commit: 43bbefc53356009d3603faa2c6e6a2858f724e4d [3316/3316] xsched: Add XCU control group implementation and its backend in xsched CFS
config: x86_64-buildonly-randconfig-003-20251125 (https://download.01.org/0day-ci/archive/20251125/202511250338.G8XPRtIi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250338.G8XPRtIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250338.G8XPRtIi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/xsched/cgroup.c:21:
   include/linux/xsched.h:265:36: error: field 'css' has incomplete type
     265 |         struct cgroup_subsys_state css;
         |                                    ^~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/cgroup.h:12,
                    from kernel/xsched/cgroup.c:18:
   kernel/xsched/cgroup.c: In function 'xcu_cg_from_css':
   include/linux/compiler_types.h:411:27: error: expression in static assertion is not an integer
     411 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   kernel/xsched/cgroup.c:184:22: note: in expansion of macro 'container_of'
     184 |         return css ? container_of(css, struct xsched_group, css) : NULL;
         |                      ^~~~~~~~~~~~
   kernel/xsched/cgroup.c: In function 'xcu_css_online':
   kernel/xsched/cgroup.c:254:53: error: invalid use of undefined type 'struct cgroup_subsys_state'
     254 |         struct cgroup_subsys_state *parent_css = css->parent;
         |                                                     ^~
   kernel/xsched/cgroup.c: At top level:
>> kernel/xsched/cgroup.c:327:34: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
     327 | static int xcu_can_attach(struct cgroup_taskset *tset)
         |                                  ^~~~~~~~~~~~~~
   kernel/xsched/cgroup.c: In function 'xcu_can_attach':
   kernel/xsched/cgroup.c:335:9: error: implicit declaration of function 'cgroup_taskset_for_each'; did you mean 'cgroup_task_frozen'? [-Wimplicit-function-declaration]
     335 |         cgroup_taskset_for_each(task, dst_css, tset) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         cgroup_task_frozen
   kernel/xsched/cgroup.c:335:53: error: expected ';' before '{' token
     335 |         cgroup_taskset_for_each(task, dst_css, tset) {
         |                                                     ^~
         |                                                     ;
>> kernel/xsched/cgroup.c:333:13: warning: unused variable 'ret' [-Wunused-variable]
     333 |         int ret = 0;
         |             ^~~
>> kernel/xsched/cgroup.c:332:34: warning: unused variable 'entry' [-Wunused-variable]
     332 |         struct xcg_attach_entry *entry;
         |                                  ^~~~~
>> kernel/xsched/cgroup.c:331:40: warning: unused variable 'dst_xcg' [-Wunused-variable]
     331 |         struct xsched_group *old_xcg, *dst_xcg;
         |                                        ^~~~~~~
>> kernel/xsched/cgroup.c:331:30: warning: unused variable 'old_xcg' [-Wunused-variable]
     331 |         struct xsched_group *old_xcg, *dst_xcg;
         |                              ^~~~~~~
>> kernel/xsched/cgroup.c:330:47: warning: unused variable 'old_css' [-Wunused-variable]
     330 |         struct cgroup_subsys_state *dst_css, *old_css;
         |                                               ^~~~~~~
>> kernel/xsched/cgroup.c:355:1: warning: no return statement in function returning non-void [-Wreturn-type]
     355 | }
         | ^
   kernel/xsched/cgroup.c: At top level:
   kernel/xsched/cgroup.c:357:38: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
     357 | static void xcu_cancel_attach(struct cgroup_taskset *tset)
         |                                      ^~~~~~~~~~~~~~
   kernel/xsched/cgroup.c:368:6: warning: no previous prototype for 'xcu_move_task' [-Wmissing-prototypes]
     368 | void xcu_move_task(struct task_struct *task, struct xsched_group *old_xcg,
         |      ^~~~~~~~~~~~~
   kernel/xsched/cgroup.c:401:31: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
     401 | static void xcu_attach(struct cgroup_taskset *tset)
         |                               ^~~~~~~~~~~~~~
   kernel/xsched/cgroup.c: In function 'xsched_group_inherit':
   kernel/xsched/cgroup.c:432:15: error: implicit declaration of function 'task_get_css' [-Wimplicit-function-declaration]
     432 |         css = task_get_css(task, xcu_cgrp_id);
         |               ^~~~~~~~~~~~
   kernel/xsched/cgroup.c:432:34: error: 'xcu_cgrp_id' undeclared (first use in this function)
     432 |         css = task_get_css(task, xcu_cgrp_id);
         |                                  ^~~~~~~~~~~
   kernel/xsched/cgroup.c:432:34: note: each undeclared identifier is reported only once for each function it appears in
   kernel/xsched/cgroup.c: In function 'xcu_sched_class_show':
   kernel/xsched/cgroup.c:440:43: error: implicit declaration of function 'seq_css' [-Wimplicit-function-declaration]
     440 |         struct cgroup_subsys_state *css = seq_css(sf);
         |                                           ^~~~~~~
   kernel/xsched/cgroup.c:440:43: error: initialization of 'struct cgroup_subsys_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   kernel/xsched/cgroup.c: In function 'xcu_sched_class_write':
   kernel/xsched/cgroup.c:490:43: error: implicit declaration of function 'of_css' [-Wimplicit-function-declaration]
     490 |         struct cgroup_subsys_state *css = of_css(of);
         |                                           ^~~~~~
   kernel/xsched/cgroup.c:490:43: error: initialization of 'struct cgroup_subsys_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   kernel/xsched/cgroup.c:508:29: error: invalid use of undefined type 'struct cgroup_subsys_state'
     508 |         if (!list_empty(&css->children))
         |                             ^~
   kernel/xsched/cgroup.c: At top level:
>> kernel/xsched/cgroup.c:520:65: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
     520 | static s64 xcu_read_s64(struct cgroup_subsys_state *css, struct cftype *cft)
         |                                                                 ^~~~~~
   kernel/xsched/cgroup.c: In function 'xcu_read_s64':
   kernel/xsched/cgroup.c:525:20: error: invalid use of undefined type 'struct cftype'
     525 |         switch (cft->private) {
         |                    ^~
   In file included from include/linux/kernel.h:31:
   kernel/xsched/cgroup.c:530:63: error: invalid use of undefined type 'struct cftype'
     530 |                 XSCHED_ERR("invalid operation %lu @ %s\n", cft->private, __func__);
         |                                                               ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/xsched.h:20:9: note: in expansion of macro 'pr_err'
      20 |         pr_err(pr_fmt(XSCHED_ERR_PREFIX fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/xsched/cgroup.c:530:17: note: in expansion of macro 'XSCHED_ERR'
     530 |                 XSCHED_ERR("invalid operation %lu @ %s\n", cft->private, __func__);
         |                 ^~~~~~~~~~
   kernel/xsched/cgroup.c: At top level:
   kernel/xsched/cgroup.c:581:66: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
     581 | static int xcu_write_s64(struct cgroup_subsys_state *css, struct cftype *cft,
         |                                                                  ^~~~~~
   kernel/xsched/cgroup.c: In function 'xcu_write_s64':
   kernel/xsched/cgroup.c:587:20: error: invalid use of undefined type 'struct cftype'
     587 |         switch (cft->private) {
         |                    ^~
   kernel/xsched/cgroup.c:597:63: error: invalid use of undefined type 'struct cftype'
     597 |                 XSCHED_ERR("invalid operation %lu @ %s\n", cft->private, __func__);
         |                                                               ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/xsched.h:20:9: note: in expansion of macro 'pr_err'
      20 |         pr_err(pr_fmt(XSCHED_ERR_PREFIX fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/xsched/cgroup.c:597:17: note: in expansion of macro 'XSCHED_ERR'
     597 |                 XSCHED_ERR("invalid operation %lu @ %s\n", cft->private, __func__);
         |                 ^~~~~~~~~~
   kernel/xsched/cgroup.c: In function 'xcu_stat':
   kernel/xsched/cgroup.c:607:43: error: initialization of 'struct cgroup_subsys_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     607 |         struct cgroup_subsys_state *css = seq_css(sf);
         |                                           ^~~~~~~
   kernel/xsched/cgroup.c: At top level:
   kernel/xsched/cgroup.c:630:22: error: array type has incomplete element type 'struct cftype'
     630 | static struct cftype xcu_cg_files[] = {
         |                      ^~~~~~~~~~~~
   kernel/xsched/cgroup.c:633:26: error: 'CFTYPE_NOT_ON_ROOT' undeclared here (not in a function)
     633 |                 .flags = CFTYPE_NOT_ON_ROOT,
         |                          ^~~~~~~~~~~~~~~~~~
   kernel/xsched/cgroup.c:651:8: error: variable 'xcu_cgrp_subsys' has initializer but incomplete type
     651 | struct cgroup_subsys xcu_cgrp_subsys = {
         |        ^~~~~~~~~~~~~
   kernel/xsched/cgroup.c:652:10: error: 'struct cgroup_subsys' has no member named 'css_alloc'
     652 |         .css_alloc = xcu_css_alloc,
         |          ^~~~~~~~~
>> kernel/xsched/cgroup.c:652:22: warning: excess elements in struct initializer
     652 |         .css_alloc = xcu_css_alloc,
         |                      ^~~~~~~~~~~~~
   kernel/xsched/cgroup.c:652:22: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:653:10: error: 'struct cgroup_subsys' has no member named 'css_online'
     653 |         .css_online = xcu_css_online,
         |          ^~~~~~~~~~
   kernel/xsched/cgroup.c:653:23: warning: excess elements in struct initializer
     653 |         .css_online = xcu_css_online,
         |                       ^~~~~~~~~~~~~~
   kernel/xsched/cgroup.c:653:23: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:654:10: error: 'struct cgroup_subsys' has no member named 'css_offline'
     654 |         .css_offline = xcu_css_offline,
         |          ^~~~~~~~~~~
   kernel/xsched/cgroup.c:654:24: warning: excess elements in struct initializer
     654 |         .css_offline = xcu_css_offline,
         |                        ^~~~~~~~~~~~~~~
   kernel/xsched/cgroup.c:654:24: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:655:10: error: 'struct cgroup_subsys' has no member named 'css_free'
     655 |         .css_free = xcu_css_free,
         |          ^~~~~~~~
   kernel/xsched/cgroup.c:655:21: warning: excess elements in struct initializer
     655 |         .css_free = xcu_css_free,
         |                     ^~~~~~~~~~~~
   kernel/xsched/cgroup.c:655:21: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:656:10: error: 'struct cgroup_subsys' has no member named 'can_attach'
     656 |         .can_attach = xcu_can_attach,
         |          ^~~~~~~~~~
   kernel/xsched/cgroup.c:656:23: warning: excess elements in struct initializer
     656 |         .can_attach = xcu_can_attach,
         |                       ^~~~~~~~~~~~~~
   kernel/xsched/cgroup.c:656:23: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:657:10: error: 'struct cgroup_subsys' has no member named 'cancel_attach'
     657 |         .cancel_attach = xcu_cancel_attach,
         |          ^~~~~~~~~~~~~
   kernel/xsched/cgroup.c:657:26: warning: excess elements in struct initializer
     657 |         .cancel_attach = xcu_cancel_attach,
         |                          ^~~~~~~~~~~~~~~~~
   kernel/xsched/cgroup.c:657:26: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:658:10: error: 'struct cgroup_subsys' has no member named 'attach'
     658 |         .attach = xcu_attach,
         |          ^~~~~~
   kernel/xsched/cgroup.c:658:19: warning: excess elements in struct initializer
     658 |         .attach = xcu_attach,
         |                   ^~~~~~~~~~
   kernel/xsched/cgroup.c:658:19: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:659:10: error: 'struct cgroup_subsys' has no member named 'dfl_cftypes'
     659 |         .dfl_cftypes = xcu_cg_files,
         |          ^~~~~~~~~~~
   kernel/xsched/cgroup.c:659:24: warning: excess elements in struct initializer
     659 |         .dfl_cftypes = xcu_cg_files,
         |                        ^~~~~~~~~~~~
   kernel/xsched/cgroup.c:659:24: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:660:10: error: 'struct cgroup_subsys' has no member named 'legacy_cftypes'
     660 |         .legacy_cftypes = xcu_cg_files,
         |          ^~~~~~~~~~~~~~
   kernel/xsched/cgroup.c:660:27: warning: excess elements in struct initializer
     660 |         .legacy_cftypes = xcu_cg_files,
         |                           ^~~~~~~~~~~~
   kernel/xsched/cgroup.c:660:27: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:661:10: error: 'struct cgroup_subsys' has no member named 'early_init'
     661 |         .early_init = false,
         |          ^~~~~~~~~~
   kernel/xsched/cgroup.c:661:23: warning: excess elements in struct initializer
     661 |         .early_init = false,
         |                       ^~~~~
   kernel/xsched/cgroup.c:661:23: note: (near initialization for 'xcu_cgrp_subsys')
   kernel/xsched/cgroup.c:651:22: error: storage size of 'xcu_cgrp_subsys' isn't known
     651 | struct cgroup_subsys xcu_cgrp_subsys = {
         |                      ^~~~~~~~~~~~~~~
   kernel/xsched/cgroup.c: In function 'xcu_cg_from_css':
>> kernel/xsched/cgroup.c:185:1: warning: control reaches end of non-void function [-Wreturn-type]
     185 | }
         | ^
   kernel/xsched/cgroup.c: At top level:
>> kernel/xsched/cgroup.c:630:22: warning: 'xcu_cg_files' defined but not used [-Wunused-variable]
     630 | static struct cftype xcu_cg_files[] = {
         |                      ^~~~~~~~~~~~
>> kernel/xsched/cgroup.c:309:12: warning: 'xcu_task_can_attach' defined but not used [-Wunused-function]
     309 | static int xcu_task_can_attach(struct task_struct *task,
         |            ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +327 kernel/xsched/cgroup.c

   181	
   182	inline struct xsched_group *xcu_cg_from_css(struct cgroup_subsys_state *css)
   183	{
   184		return css ? container_of(css, struct xsched_group, css) : NULL;
 > 185	}
   186	
   187	/*
   188	 * Determine whether the given css corresponds to root_xsched_group.css.
   189	 *
   190	 * Parameter only_css_self:
   191	 *   - true  : Only check whether the css pointer itself is NULL
   192	 *             (i.e., the subsystem root). Do not dereference xg->parent.
   193	 *             Used in the allocation path (css_alloc).
   194	 *   - false : Further check whether the associated xsched_group
   195	 *             has no parent (i.e., a normal root check).
   196	 */
   197	static inline bool xsched_group_css_is_root(struct cgroup_subsys_state *css, bool only_css_self)
   198	{
   199		struct xsched_group *xg;
   200	
   201		/* NULL indicates the subsystem root */
   202		if (!css)
   203			return true;
   204	
   205		/*
   206		 * During the allocation phase,
   207		 * cannot find its parent xsched_group via xg->parent,
   208		 * so can only determine on the css itself.
   209		 */
   210		if (only_css_self)
   211			return false;
   212	
   213		xg = xcu_cg_from_css(css);
   214	
   215		return xg && !xg->parent;
   216	}
   217	
   218	/**
   219	 * xcu_css_alloc() - Allocate and init xcu cgroup.
   220	 * @parent_css: css of parent xcu cgroup
   221	 *
   222	 * Called from kernel/cgroup.c with cgroup_lock() held.
   223	 * First called in subsys initialization to create root xcu cgroup, when
   224	 * XCUs haven't been initialized yet. Func used on every new cgroup creation,
   225	 * on second call to set root xsched_group runqueue.
   226	 *
   227	 * Return: pointer of new xcu cgroup css on success, -ENOMEM otherwise.
   228	 */
   229	static struct cgroup_subsys_state *
   230	xcu_css_alloc(struct cgroup_subsys_state *parent_css)
   231	{
   232		struct xsched_group *xg;
   233	
   234		if (xsched_group_css_is_root(parent_css, true))
   235			return &root_xsched_group.css;
   236	
   237		xg = kmem_cache_alloc(xsched_group_cache, GFP_KERNEL | __GFP_ZERO);
   238		if (!xg)
   239			return ERR_PTR(-ENOMEM);
   240	
   241		return &xg->css;
   242	}
   243	
   244	static void xcu_css_free(struct cgroup_subsys_state *css)
   245	{
   246		struct xsched_group *xcg = xcu_cg_from_css(css);
   247	
   248		kmem_cache_free(xsched_group_cache, xcg);
   249	}
   250	
   251	static int xcu_css_online(struct cgroup_subsys_state *css)
   252	{
   253		struct xsched_group *xg = xcu_cg_from_css(css);
   254		struct cgroup_subsys_state *parent_css = css->parent;
   255		struct xsched_group *parent_xg;
   256		int err;
   257	
   258		if (!parent_css)
   259			return 0;
   260	
   261		parent_xg = xcu_cg_from_css(parent_css);
   262		err = xcu_cg_init(xg, parent_xg);
   263		if (err) {
   264			kmem_cache_free(xsched_group_cache, xg);
   265			XSCHED_ERR("Failed to initialize new xsched_group @ %s.\n", __func__);
   266			return err;
   267		}
   268	
   269		return 0;
   270	}
   271	
   272	static void xcu_css_offline(struct cgroup_subsys_state *css)
   273	{
   274		struct xsched_group *xcg;
   275	
   276		xcg = xcu_cg_from_css(css);
   277		if (!xsched_group_css_is_root(css, false)) {
   278			switch (xcg->sched_class) {
   279			case XSCHED_TYPE_CFS:
   280				xcu_cfs_cg_deinit(xcg);
   281				break;
   282			default:
   283				XSCHED_INFO("xcu_cgroup: deinit RT group css=0x%lx\n",
   284				       (uintptr_t)&xcg->css);
   285				break;
   286			}
   287		}
   288		list_del(&xcg->group_node);
   289	}
   290	
   291	static void xsched_group_xse_attach(struct xsched_group *xg,
   292					struct xsched_entity *xse)
   293	{
   294		spin_lock(&xg->lock);
   295		list_add_tail(&xse->group_node, &xg->members);
   296		spin_unlock(&xg->lock);
   297		xse->parent_grp = xg;
   298	}
   299	
   300	void xsched_group_xse_detach(struct xsched_entity *xse)
   301	{
   302		struct xsched_group *xcg = xse->parent_grp;
   303	
   304		spin_lock(&xcg->lock);
   305		list_del(&xse->group_node);
   306		spin_unlock(&xcg->lock);
   307	}
   308	
 > 309	static int xcu_task_can_attach(struct task_struct *task,
   310				struct xsched_group *old)
   311	{
   312		struct xsched_entity *xse;
   313		bool has_xse = false;
   314	
   315		spin_lock(&old->lock);
   316		list_for_each_entry(xse, &old->members, group_node) {
   317			if (xse->owner_pid == task_pid_nr(task)) {
   318				has_xse = true;
   319				break;
   320			}
   321		}
   322		spin_unlock(&old->lock);
   323	
   324		return has_xse ? -EINVAL : 0;
   325	}
   326	
 > 327	static int xcu_can_attach(struct cgroup_taskset *tset)
   328	{
   329		struct task_struct *task;
 > 330		struct cgroup_subsys_state *dst_css, *old_css;
 > 331		struct xsched_group *old_xcg, *dst_xcg;
 > 332		struct xcg_attach_entry *entry;
 > 333		int ret = 0;
   334	
   335		cgroup_taskset_for_each(task, dst_css, tset) {
   336			rcu_read_lock();
   337			old_css = task_css(task, xcu_cgrp_id);
   338			rcu_read_unlock();
   339			dst_xcg = xcu_cg_from_css(dst_css);
   340			old_xcg = xcu_cg_from_css(old_css);
   341	
   342			ret = xcu_task_can_attach(task, old_xcg);
   343			if (ret)
   344				break;
   345	
   346			/* record entry for this task */
   347			entry = kmem_cache_alloc(xcg_attach_entry_cache, GFP_KERNEL | __GFP_ZERO);
   348			entry->task = task;
   349			entry->old_xcg = old_xcg;
   350			entry->new_xcg = dst_xcg;
   351			list_add_tail(&entry->node, &xcg_attach_list);
   352		}
   353	
   354		return ret;
 > 355	}
   356	
   357	static void xcu_cancel_attach(struct cgroup_taskset *tset)
   358	{
   359		struct xcg_attach_entry *entry, *tmp;
   360	
   361		/* error: clear all entries */
   362		list_for_each_entry_safe(entry, tmp, &xcg_attach_list, node) {
   363			list_del(&entry->node);
   364			kmem_cache_free(xcg_attach_entry_cache, entry);
   365		}
   366	}
   367	
   368	void xcu_move_task(struct task_struct *task, struct xsched_group *old_xcg,
   369				struct xsched_group *new_xcg)
   370	{
   371		struct xsched_entity *xse, *tmp;
   372		struct xsched_cu *xcu;
   373	
   374		spin_lock(&old_xcg->lock);
   375		list_for_each_entry_safe(xse, tmp, &old_xcg->members, group_node) {
   376			if (xse->owner_pid != task_pid_nr(task))
   377				continue;
   378	
   379			xcu = xse->xcu;
   380	
   381			if (old_xcg != xse->parent_grp) {
   382				WARN_ON(old_xcg != xse->parent_grp);
   383				return;
   384			}
   385	
   386			/* delete from the old_xcg */
   387			list_del(&xse->group_node);
   388	
   389			mutex_lock(&xcu->xcu_lock);
   390			/* dequeue from the current runqueue */
   391			dequeue_ctx(xse, xcu);
   392			/* attach to the new_xcg */
   393			xsched_group_xse_attach(new_xcg, xse);
   394			/* enqueue to the runqueue in new_xcg */
   395			enqueue_ctx(xse, xcu);
   396			mutex_unlock(&xcu->xcu_lock);
   397		}
   398		spin_unlock(&old_xcg->lock);
   399	}
   400	
   401	static void xcu_attach(struct cgroup_taskset *tset)
   402	{
   403		struct xcg_attach_entry *entry, *tmp;
   404	
   405		list_for_each_entry(entry, &xcg_attach_list, node) {
   406			xcu_move_task(entry->task, entry->old_xcg, entry->new_xcg);
   407		}
   408	
   409		/* cleanup */
   410		list_for_each_entry_safe(entry, tmp, &xcg_attach_list, node) {
   411			list_del(&entry->node);
   412			kmem_cache_free(xcg_attach_entry_cache, entry);
   413		}
   414	}
   415	
   416	/**
   417	 * xsched_group_inherit() - Attach new entity to task's xsched_group.
   418	 * @task: task_struct
   419	 * @xse: xsched entity
   420	 *
   421	 * Called in xsched context initialization to attach xse to task's group
   422	 * and inherit its xse scheduling class and bandwidth control policy.
   423	 *
   424	 * Return: Zero on success.
   425	 */
   426	void xsched_group_inherit(struct task_struct *task, struct xsched_entity *xse)
   427	{
   428		struct cgroup_subsys_state *css;
   429		struct xsched_group *xg;
   430	
   431		xse->owner_pid = task_pid_nr(task);
   432		css = task_get_css(task, xcu_cgrp_id);
   433		xg = xcu_cg_from_css(css);
   434		xsched_group_xse_attach(xg, xse);
   435		css_put(css);
   436	}
   437	
   438	static int xcu_sched_class_show(struct seq_file *sf, void *v)
   439	{
   440		struct cgroup_subsys_state *css = seq_css(sf);
   441		struct xsched_group *xg = xcu_cg_from_css(css);
   442	
   443		seq_printf(sf, "%s\n", xcu_sched_name[xg->sched_class]);
   444		return 0;
   445	}
   446	
   447	/**
   448	 * xcu_cg_set_sched_class() - Set scheduling type for group.
   449	 * @xg: xsched group
   450	 * @type: scheduler type
   451	 *
   452	 * Scheduler type can be changed if task is child of root group
   453	 * and haven't got scheduling entities.
   454	 *
   455	 * Return: Zero on success or -EINVAL
   456	 */
   457	static int xcu_cg_set_sched_class(struct xsched_group *xg, int type)
   458	{
   459		if (type == xg->sched_class)
   460			return 0;
   461	
   462		/* can't change scheduler when there are running members */
   463		if (!list_empty(&xg->members))
   464			return -EBUSY;
   465	
   466		/* deinit old type if necessary */
   467		switch (xg->sched_class) {
   468		case XSCHED_TYPE_CFS:
   469			xcu_cfs_cg_deinit(xg);
   470			break;
   471		default:
   472			break;
   473		}
   474	
   475		/* update type */
   476		xg->sched_class = type;
   477	
   478		/* init new type if necessary */
   479		switch (type) {
   480		case XSCHED_TYPE_CFS:
   481			return xcu_cfs_cg_init(xg, xg->parent);
   482		default:
   483			return 0;
   484		}
   485	}
   486	
   487	static ssize_t xcu_sched_class_write(struct kernfs_open_file *of, char *buf,
   488					size_t nbytes, loff_t off)
   489	{
   490		struct cgroup_subsys_state *css = of_css(of);
   491		struct xsched_group *xg = xcu_cg_from_css(css);
   492		char type_name[4];
   493		int type = -1;
   494	
   495		ssize_t ret = sscanf(buf, "%3s", type_name);
   496	
   497		if (ret < 1)
   498			return -EINVAL;
   499	
   500		for (type = 0; type < XSCHED_TYPE_NUM; type++) {
   501			if (!strcmp(type_name, xcu_sched_name[type]))
   502				break;
   503		}
   504	
   505		if (type == XSCHED_TYPE_NUM)
   506			return -EINVAL;
   507	
   508		if (!list_empty(&css->children))
   509			return -EBUSY;
   510	
   511		/* only root child can switch scheduler type */
   512		if (!xg->parent || !xsched_group_css_is_root(&xg->parent->css, false))
   513			return -EINVAL;
   514	
   515		ret = xcu_cg_set_sched_class(xg, type);
   516	
   517		return (ret) ? ret : nbytes;
   518	}
   519	
 > 520	static s64 xcu_read_s64(struct cgroup_subsys_state *css, struct cftype *cft)
   521	{
   522		s64 ret = 0;
   523		struct xsched_group *xcucg = xcu_cg_from_css(css);
   524	
   525		switch (cft->private) {
   526		case XCU_FILE_SHARES:
   527			ret = xcucg->shares_cfg;
   528			break;
   529		default:
   530			XSCHED_ERR("invalid operation %lu @ %s\n", cft->private, __func__);
   531			break;
   532		}
   533	
   534		return ret;
   535	}
   536	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
