Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5717C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674548459; x=1706084459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=646iZV0vCSOXzomsw6GdlKkISp70HH7GpSSnxISS2Dg=;
  b=Y5tYub3yLP2npB8NI36F33UGybQC3QgPED1xrmNXXQJiZoJKc7La1Hvq
   MywBv27X2YUultr2LfySXwtIhCcv5I+kjqedR5ABi3jaJf+Kl8QS6MCny
   6axY+rWtddnCAJiGkqkCau0DCVMTQIEP40J/iX2R/g/tC99U/ViIoOZDa
   attxNefrCLCrOEU0mrq5+ZVvQqUsxXWJuRW0qJfbqqDnovKT5BaWIasPV
   TE2m1+4Sc9r25xkwh6iPIyRexuL3Fk9LoncO/6WxwR5aEykV5TAMHsTVD
   mOmO88zn6tpRm2+XdF9YP2QHgnPqTy062oiIQqAs3TW9Fx5uZszqwQK3S
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306601601"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="306601601"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 00:20:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907404338"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="907404338"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2023 00:20:47 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKEXu-0006GY-05;
	Tue, 24 Jan 2023 08:20:46 +0000
Date: Tue, 24 Jan 2023 16:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/19] mm: Introduce a cgroup for pinned memory
Message-ID: <202301241632.opMeQ3t6-lkp@intel.com>
References: <183372b80aac73e640d9f5ac3c742d505fc6c1f2.1674538665.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <183372b80aac73e640d9f5ac3c742d505fc6c1f2.1674538665.git-series.apopple@nvidia.com>

Hi Alistair,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on 2241ab53cbb5cdb08a6b2d4688feb13971058f65]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-Introduce-vm_account/20230124-135027
base:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
patch link:    https://lore.kernel.org/r/183372b80aac73e640d9f5ac3c742d505fc6c1f2.1674538665.git-series.apopple%40nvidia.com
patch subject: [RFC PATCH 14/19] mm: Introduce a cgroup for pinned memory
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230124/202301241632.opMeQ3t6-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4eba1da312a889b27469e42f20c216183d19cd4d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alistair-Popple/mm-Introduce-vm_account/20230124-135027
        git checkout 4eba1da312a889b27469e42f20c216183d19cd4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> mm/pins_cgroup.c:19:41: error: field 'css' has incomplete type
      19 |         struct cgroup_subsys_state      css;
         |                                         ^~~
>> mm/pins_cgroup.c:24:41: error: field 'events_file' has incomplete type
      24 |         struct cgroup_file              events_file;
         |                                         ^~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from mm/pins_cgroup.c:8:
   mm/pins_cgroup.c: In function 'css_pins':
   include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   mm/pins_cgroup.c:30:16: note: in expansion of macro 'container_of'
      30 |         return container_of(css, struct pins_cgroup, css);
         |                ^~~~~~~~~~~~
   mm/pins_cgroup.c: In function 'get_pins_cg':
>> mm/pins_cgroup.c:40:25: error: implicit declaration of function 'task_get_css' [-Werror=implicit-function-declaration]
      40 |         return css_pins(task_get_css(task, pins_cgrp_id));
         |                         ^~~~~~~~~~~~
>> mm/pins_cgroup.c:40:44: error: 'pins_cgrp_id' undeclared (first use in this function); did you mean 'pins_cgroup'?
      40 |         return css_pins(task_get_css(task, pins_cgrp_id));
         |                                            ^~~~~~~~~~~~
         |                                            pins_cgroup
   mm/pins_cgroup.c:40:44: note: each undeclared identifier is reported only once for each function it appears in
   mm/pins_cgroup.c: At top level:
   mm/pins_cgroup.c:76:6: warning: no previous prototype for 'pins_cancel' [-Wmissing-prototypes]
      76 | void pins_cancel(struct pins_cgroup *pins, int num)
         |      ^~~~~~~~~~~
>> mm/pins_cgroup.c:146:35: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
     146 | static int pins_can_attach(struct cgroup_taskset *tset)
         |                                   ^~~~~~~~~~~~~~
   mm/pins_cgroup.c: In function 'pins_can_attach':
>> mm/pins_cgroup.c:151:9: error: implicit declaration of function 'cgroup_taskset_for_each'; did you mean 'cgroup_task_frozen'? [-Werror=implicit-function-declaration]
     151 |         cgroup_taskset_for_each(task, dst_css, tset) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         cgroup_task_frozen
>> mm/pins_cgroup.c:151:53: error: expected ';' before '{' token
     151 |         cgroup_taskset_for_each(task, dst_css, tset) {
         |                                                     ^~
         |                                                     ;
   mm/pins_cgroup.c:164:1: error: no return statement in function returning non-void [-Werror=return-type]
     164 | }
         | ^
   mm/pins_cgroup.c: At top level:
   mm/pins_cgroup.c:166:39: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
     166 | static void pins_cancel_attach(struct cgroup_taskset *tset)
         |                                       ^~~~~~~~~~~~~~
   mm/pins_cgroup.c: In function 'pins_cancel_attach':
   mm/pins_cgroup.c:171:53: error: expected ';' before '{' token
     171 |         cgroup_taskset_for_each(task, dst_css, tset) {
         |                                                     ^~
         |                                                     ;
   mm/pins_cgroup.c: In function 'pins_max_write':
>> mm/pins_cgroup.c:188:43: error: implicit declaration of function 'of_css' [-Werror=implicit-function-declaration]
     188 |         struct cgroup_subsys_state *css = of_css(of);
         |                                           ^~~~~~
>> mm/pins_cgroup.c:188:43: warning: initialization of 'struct cgroup_subsys_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   mm/pins_cgroup.c: In function 'pins_max_show':
>> mm/pins_cgroup.c:217:43: error: implicit declaration of function 'seq_css' [-Werror=implicit-function-declaration]
     217 |         struct cgroup_subsys_state *css = seq_css(sf);
         |                                           ^~~~~~~
   mm/pins_cgroup.c:217:43: warning: initialization of 'struct cgroup_subsys_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   mm/pins_cgroup.c: At top level:
>> mm/pins_cgroup.c:230:37: warning: 'struct cftype' declared inside parameter list will not be visible outside of this definition or declaration
     230 |                              struct cftype *cft)
         |                                     ^~~~~~
   mm/pins_cgroup.c: In function 'pins_events_show':
>> mm/pins_cgroup.c:239:45: warning: passing argument 1 of 'css_pins' makes pointer from integer without a cast [-Wint-conversion]
     239 |         struct pins_cgroup *pins = css_pins(seq_css(sf));
         |                                             ^~~~~~~~~~~
         |                                             |
         |                                             int
   mm/pins_cgroup.c:28:65: note: expected 'struct cgroup_subsys_state *' but argument is of type 'int'
      28 | static struct pins_cgroup *css_pins(struct cgroup_subsys_state *css)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/pins_cgroup.c: At top level:
>> mm/pins_cgroup.c:245:22: error: array type has incomplete element type 'struct cftype'
     245 | static struct cftype pins_files[] = {
         |                      ^~~~~~~~~~
>> mm/pins_cgroup.c:250:26: error: 'CFTYPE_NOT_ON_ROOT' undeclared here (not in a function)
     250 |                 .flags = CFTYPE_NOT_ON_ROOT,
         |                          ^~~~~~~~~~~~~~~~~~
>> mm/pins_cgroup.c:266:8: error: variable 'pins_cgrp_subsys' has initializer but incomplete type
     266 | struct cgroup_subsys pins_cgrp_subsys = {
         |        ^~~~~~~~~~~~~
>> mm/pins_cgroup.c:267:10: error: 'struct cgroup_subsys' has no member named 'css_alloc'
     267 |         .css_alloc = pins_css_alloc,
         |          ^~~~~~~~~
>> mm/pins_cgroup.c:267:22: warning: excess elements in struct initializer
     267 |         .css_alloc = pins_css_alloc,
         |                      ^~~~~~~~~~~~~~
   mm/pins_cgroup.c:267:22: note: (near initialization for 'pins_cgrp_subsys')
>> mm/pins_cgroup.c:268:10: error: 'struct cgroup_subsys' has no member named 'css_free'
     268 |         .css_free = pins_css_free,
         |          ^~~~~~~~
   mm/pins_cgroup.c:268:21: warning: excess elements in struct initializer
     268 |         .css_free = pins_css_free,
         |                     ^~~~~~~~~~~~~
   mm/pins_cgroup.c:268:21: note: (near initialization for 'pins_cgrp_subsys')
>> mm/pins_cgroup.c:269:10: error: 'struct cgroup_subsys' has no member named 'legacy_cftypes'
     269 |         .legacy_cftypes = pins_files,
         |          ^~~~~~~~~~~~~~
   mm/pins_cgroup.c:269:27: warning: excess elements in struct initializer
     269 |         .legacy_cftypes = pins_files,
         |                           ^~~~~~~~~~
   mm/pins_cgroup.c:269:27: note: (near initialization for 'pins_cgrp_subsys')
>> mm/pins_cgroup.c:270:10: error: 'struct cgroup_subsys' has no member named 'dfl_cftypes'
     270 |         .dfl_cftypes = pins_files,
         |          ^~~~~~~~~~~
   mm/pins_cgroup.c:270:24: warning: excess elements in struct initializer
     270 |         .dfl_cftypes = pins_files,
         |                        ^~~~~~~~~~
   mm/pins_cgroup.c:270:24: note: (near initialization for 'pins_cgrp_subsys')
   mm/pins_cgroup.c:271:10: error: 'struct cgroup_subsys' has no member named 'can_attach'
     271 |         .can_attach = pins_can_attach,
         |          ^~~~~~~~~~
   mm/pins_cgroup.c:271:23: warning: excess elements in struct initializer
     271 |         .can_attach = pins_can_attach,
         |                       ^~~~~~~~~~~~~~~
   mm/pins_cgroup.c:271:23: note: (near initialization for 'pins_cgrp_subsys')
   mm/pins_cgroup.c:272:10: error: 'struct cgroup_subsys' has no member named 'cancel_attach'
     272 |         .cancel_attach = pins_cancel_attach,
         |          ^~~~~~~~~~~~~
   mm/pins_cgroup.c:272:26: warning: excess elements in struct initializer
     272 |         .cancel_attach = pins_cancel_attach,
         |                          ^~~~~~~~~~~~~~~~~~
   mm/pins_cgroup.c:272:26: note: (near initialization for 'pins_cgrp_subsys')
   mm/pins_cgroup.c:266:22: error: storage size of 'pins_cgrp_subsys' isn't known
     266 | struct cgroup_subsys pins_cgrp_subsys = {
         |                      ^~~~~~~~~~~~~~~~
   mm/pins_cgroup.c: In function 'get_pins_cg':
   mm/pins_cgroup.c:41:1: error: control reaches end of non-void function [-Werror=return-type]
      41 | }
         | ^
   mm/pins_cgroup.c: In function 'parent_pins':
   mm/pins_cgroup.c:36:1: error: control reaches end of non-void function [-Werror=return-type]
      36 | }
         | ^
   mm/pins_cgroup.c: At top level:
   mm/pins_cgroup.c:245:22: warning: 'pins_files' defined but not used [-Wunused-variable]
     245 | static struct cftype pins_files[] = {
         |                      ^~~~~~~~~~
   mm/pins_cgroup.c:107:13: warning: 'pins_charge' defined but not used [-Wunused-function]
     107 | static void pins_charge(struct pins_cgroup *pins, int num)
         |             ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/css +19 mm/pins_cgroup.c

    17	
    18	struct pins_cgroup {
  > 19		struct cgroup_subsys_state	css;
    20	
    21		atomic64_t			counter;
    22		atomic64_t			limit;
    23	
  > 24		struct cgroup_file		events_file;
    25		atomic64_t			events_limit;
    26	};
    27	
    28	static struct pins_cgroup *css_pins(struct cgroup_subsys_state *css)
    29	{
    30		return container_of(css, struct pins_cgroup, css);
    31	}
    32	
    33	static struct pins_cgroup *parent_pins(struct pins_cgroup *pins)
    34	{
    35		return css_pins(pins->css.parent);
    36	}
    37	
    38	struct pins_cgroup *get_pins_cg(struct task_struct *task)
    39	{
  > 40		return css_pins(task_get_css(task, pins_cgrp_id));
    41	}
    42	
    43	void put_pins_cg(struct pins_cgroup *cg)
    44	{
    45		css_put(&cg->css);
    46	}
    47	
    48	static struct cgroup_subsys_state *
    49	pins_css_alloc(struct cgroup_subsys_state *parent)
    50	{
    51		struct pins_cgroup *pins;
    52	
    53		pins = kzalloc(sizeof(struct pins_cgroup), GFP_KERNEL);
    54		if (!pins)
    55			return ERR_PTR(-ENOMEM);
    56	
    57		atomic64_set(&pins->counter, 0);
    58		atomic64_set(&pins->limit, PINS_MAX);
    59		atomic64_set(&pins->events_limit, 0);
    60		return &pins->css;
    61	}
    62	
    63	static void pins_css_free(struct cgroup_subsys_state *css)
    64	{
    65		kfree(css_pins(css));
    66	}
    67	
    68	/**
    69	 * pins_cancel - uncharge the local pin count
    70	 * @pins: the pin cgroup state
    71	 * @num: the number of pins to cancel
    72	 *
    73	 * This function will WARN if the pin count goes under 0, because such a case is
    74	 * a bug in the pins controller proper.
    75	 */
    76	void pins_cancel(struct pins_cgroup *pins, int num)
    77	{
    78		/*
    79		 * A negative count (or overflow for that matter) is invalid,
    80		 * and indicates a bug in the `pins` controller proper.
    81		 */
    82		WARN_ON_ONCE(atomic64_add_negative(-num, &pins->counter));
    83	}
    84	
    85	/**
    86	 * pins_uncharge - hierarchically uncharge the pin count
    87	 * @pins: the pin cgroup state
    88	 * @num: the number of pins to uncharge
    89	 */
    90	void pins_uncharge(struct pins_cgroup *pins, int num)
    91	{
    92		struct pins_cgroup *p;
    93	
    94		for (p = pins; parent_pins(p); p = parent_pins(p))
    95			pins_cancel(p, num);
    96	}
    97	
    98	/**
    99	 * pins_charge - hierarchically charge the pin count
   100	 * @pins: the pin cgroup state
   101	 * @num: the number of pins to charge
   102	 *
   103	 * This function does *not* follow the pin limit set. It cannot fail and the new
   104	 * pin count may exceed the limit. This is only used for reverting failed
   105	 * attaches, where there is no other way out than violating the limit.
   106	 */
   107	static void pins_charge(struct pins_cgroup *pins, int num)
   108	{
   109		struct pins_cgroup *p;
   110	
   111		for (p = pins; parent_pins(p); p = parent_pins(p))
   112			atomic64_add(num, &p->counter);
   113	}
   114	
   115	/**
   116	 * pins_try_charge - hierarchically try to charge the pin count
   117	 * @pins: the pin cgroup state
   118	 * @num: the number of pins to charge
   119	 *
   120	 * This function follows the set limit. It will fail if the charge would cause
   121	 * the new value to exceed the hierarchical limit. Returns 0 if the charge
   122	 * succeeded, otherwise -EAGAIN.
   123	 */
   124	int pins_try_charge(struct pins_cgroup *pins, int num)
   125	{
   126		struct pins_cgroup *p, *q;
   127	
   128		for (p = pins; parent_pins(p); p = parent_pins(p)) {
   129			uint64_t new = atomic64_add_return(num, &p->counter);
   130			uint64_t limit = atomic64_read(&p->limit);
   131	
   132			if (limit != PINS_MAX && new > limit)
   133				goto revert;
   134		}
   135	
   136		return 0;
   137	
   138	revert:
   139		for (q = pins; q != p; q = parent_pins(q))
   140			pins_cancel(q, num);
   141		pins_cancel(p, num);
   142	
   143		return -EAGAIN;
   144	}
   145	
 > 146	static int pins_can_attach(struct cgroup_taskset *tset)
   147	{
   148		struct cgroup_subsys_state *dst_css;
   149		struct task_struct *task;
   150	
 > 151		cgroup_taskset_for_each(task, dst_css, tset) {
   152			struct pins_cgroup *pins = css_pins(dst_css);
   153			struct cgroup_subsys_state *old_css;
   154			struct pins_cgroup *old_pins;
   155	
   156			old_css = task_css(task, pins_cgrp_id);
   157			old_pins = css_pins(old_css);
   158	
   159			pins_charge(pins, task->mm->locked_vm);
   160			pins_uncharge(old_pins, task->mm->locked_vm);
   161		}
   162	
   163		return 0;
   164	}
   165	
   166	static void pins_cancel_attach(struct cgroup_taskset *tset)
   167	{
   168		struct cgroup_subsys_state *dst_css;
   169		struct task_struct *task;
   170	
   171		cgroup_taskset_for_each(task, dst_css, tset) {
   172			struct pins_cgroup *pins = css_pins(dst_css);
   173			struct cgroup_subsys_state *old_css;
   174			struct pins_cgroup *old_pins;
   175	
   176			old_css = task_css(task, pins_cgrp_id);
   177			old_pins = css_pins(old_css);
   178	
   179			pins_charge(old_pins, task->mm->locked_vm);
   180			pins_uncharge(pins, task->mm->locked_vm);
   181		}
   182	}
   183	
   184	
   185	static ssize_t pins_max_write(struct kernfs_open_file *of, char *buf,
   186				      size_t nbytes, loff_t off)
   187	{
 > 188		struct cgroup_subsys_state *css = of_css(of);
   189		struct pins_cgroup *pins = css_pins(css);
   190		uint64_t limit;
   191		int err;
   192	
   193		buf = strstrip(buf);
   194		if (!strcmp(buf, PINS_MAX_STR)) {
   195			limit = PINS_MAX;
   196			goto set_limit;
   197		}
   198	
   199		err = kstrtoll(buf, 0, &limit);
   200		if (err)
   201			return err;
   202	
   203		if (limit < 0 || limit >= PINS_MAX)
   204			return -EINVAL;
   205	
   206	set_limit:
   207		/*
   208		 * Limit updates don't need to be mutex'd, since it isn't
   209		 * critical that any racing fork()s follow the new limit.
   210		 */
   211		atomic64_set(&pins->limit, limit);
   212		return nbytes;
   213	}
   214	
   215	static int pins_max_show(struct seq_file *sf, void *v)
   216	{
 > 217		struct cgroup_subsys_state *css = seq_css(sf);
   218		struct pins_cgroup *pins = css_pins(css);
   219		uint64_t limit = atomic64_read(&pins->limit);
   220	
   221		if (limit >= PINS_MAX)
   222			seq_printf(sf, "%s\n", PINS_MAX_STR);
   223		else
   224			seq_printf(sf, "%lld\n", limit);
   225	
   226		return 0;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
