Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F415E90
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 16:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727023323; cv=none; b=hxni0xTmWhrmwKXLGRIM4eUFuwTD/ktEBddpQBZvtfEux5y5kO7gX0JhMJEQTONul9yQdePz6Cj1lOO/VNgg5WE3RwOMC7YGq6PS4FiicQawZVirXQ8eJJcEz8Zmf1csjTJ53q908P7dVb3x3w2DyNKQgek+Smn9n2II3GAmi5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727023323; c=relaxed/simple;
	bh=IF0AY1pHjXoX9/TgTrOx1rpM312J7g8IvOBvJKW1vho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fwXOttGKiwIcZPBoqzZ0VfhYPvtAR6kcgT4ONwwYysjaGNHzH1Zh+n7N+5l0T5ryzB7u7wYJq537acP2uO8e1v5aieGkiun7qE+MUD7I9uJnPJk4c9GbR0q8ANosdjHuBmCkrHGa0TbFjMJYBEBsvEcPTUmJ6/86ZSICw7nyFuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buZr/+Gx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buZr/+Gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727023322; x=1758559322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IF0AY1pHjXoX9/TgTrOx1rpM312J7g8IvOBvJKW1vho=;
  b=buZr/+GxTUPy7UrapBLJcONOUVpOxDt7Z5Y385Avexcj9QWc3M9U0oXz
   9hK1h0k9ldbsUg+Sol7OnRliwc4ZDBVz3d53hZc3ykO0iS3rPc7nJmVCC
   twTWX9I6R+6oNgT/YZpF4H/sxhXA1S7r2xSTpnvfBVctJ+jAzWYyZ6pOa
   FGLEWWDNjFyT0lpmeBPhbnINyVPmIZb07ZyfG+449L5KcmzIgjVVm0psY
   qSozwMMfQDZt2SRuD0wSsSHYn23QfmYMLkrKvuWJ7Zh/OKu8yqAJjb12y
   HrZjbxWcQ+sLGaYnvHTrCduLc9wWBrG/nW95Diy8DzyHW+8MdgwPLLQL1
   g==;
X-CSE-ConnectionGUID: 6bWEQHuyS1uV6aWlj4YFjg==
X-CSE-MsgGUID: kQs5BmZvQqy3yr4mn16jCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37343675"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="37343675"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 09:42:01 -0700
X-CSE-ConnectionGUID: kEU/298pT9qb/WHhRG2JDg==
X-CSE-MsgGUID: iCVQ29gLQmGo/07G76o/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="94169207"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2024 09:42:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssPeo-000GV4-09;
	Sun, 22 Sep 2024 16:41:58 +0000
Date: Mon, 23 Sep 2024 00:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:ftrace/stress-test 1/1] kernel/trace/fstress.c:73:1: sparse:
 sparse: symbol 'ops_a' was not declared. Should it be static?
Message-ID: <202409230015.1Oe2qkvd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git ftrace/stress-test
head:   3c154bddff894d321f1e43f1eec711a477f44bf9
commit: 3c154bddff894d321f1e43f1eec711a477f44bf9 [1/1] HACK: ftrace stress test
config: i386-randconfig-061-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230015.1Oe2qkvd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230015.1Oe2qkvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230015.1Oe2qkvd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/fstress.c:73:1: sparse: sparse: symbol 'ops_a' was not declared. Should it be static?
>> kernel/trace/fstress.c:74:1: sparse: sparse: symbol 'ops_b' was not declared. Should it be static?
>> kernel/trace/fstress.c:75:1: sparse: sparse: symbol 'ops_c' was not declared. Should it be static?
>> kernel/trace/fstress.c:77:1: sparse: sparse: symbol 'ops_e' was not declared. Should it be static?
>> kernel/trace/fstress.c:78:1: sparse: sparse: symbol 'ops_f' was not declared. Should it be static?
>> kernel/trace/fstress.c:79:1: sparse: sparse: symbol 'ops_g' was not declared. Should it be static?
>> kernel/trace/fstress.c:80:1: sparse: sparse: symbol 'ops_h' was not declared. Should it be static?
>> kernel/trace/fstress.c:148:20: sparse: sparse: symbol 'tracee_threads' was not declared. Should it be static?

vim +/ops_a +73 kernel/trace/fstress.c

    46	
    47	#define DEFINE_OPS(x)							\
    48		static void trace_func_##x(unsigned long ip,			\
    49					   unsigned long parent_ip,		\
    50					   struct ftrace_ops *op,		\
    51					   struct ftrace_regs *fregs);		\
    52										\
    53		struct ftrace_ops ops_##x =  {					\
    54			.func = trace_func_##x,					\
    55		};								\
    56										\
    57		static noinstr void trace_func_##x(unsigned long ip,		\
    58						   unsigned long parent_ip,	\
    59						   struct ftrace_ops *op,	\
    60						   struct ftrace_regs *fregs)	\
    61		{								\
    62			struct ftrace_ops *expected = &ops_##x;			\
    63			if (op == expected)					\
    64				return;						\
    65			if (raw_atomic_cmpxchg(&fstress_panic, 0, 1))		\
    66				return;						\
    67			instrumentation_begin();				\
    68			report_bad_ops(__func__, ip, parent_ip, op, fregs,	\
    69				       expected);				\
    70			instrumentation_end();					\
    71		}
    72	
  > 73	DEFINE_OPS(a);
  > 74	DEFINE_OPS(b);
  > 75	DEFINE_OPS(c);
  > 76	DEFINE_OPS(d);
  > 77	DEFINE_OPS(e);
  > 78	DEFINE_OPS(f);
  > 79	DEFINE_OPS(g);
  > 80	DEFINE_OPS(h);
    81	
    82	static struct ftrace_ops *fstress_ops[] = {
    83		&ops_a,
    84		&ops_b,
    85		&ops_c,
    86		&ops_d,
    87		&ops_e,
    88		&ops_f,
    89		&ops_g,
    90		&ops_h,
    91	};
    92	
    93	static noinline void tracee(void)
    94	{
    95		/*
    96		 * Do nothing, but prevent compiler from eliding calls to this
    97		 * function.
    98		 */
    99		barrier();
   100	}
   101	
   102	static noinline int fstress_tracee_thread(void *unused)
   103	{
   104		while (!kthread_should_stop()) {
   105			for (int i = 0; i < 100000; i++)
   106				tracee();
   107			schedule();
   108		}
   109	
   110		return 0;
   111	}
   112	
   113	static int fstress_manager_thread(void *unused)
   114	{
   115		const int nr_ops = ARRAY_SIZE(fstress_ops);
   116	
   117		for (int i = 0; i < nr_ops; i++) {
   118			ftrace_set_filter_ip(fstress_ops[i], (unsigned long)tracee, 0, 0);
   119		}
   120	
   121		while (!kthread_should_stop()) {
   122			for (int i = 0; i <= nr_ops; i++) {
   123				if (i < nr_ops)
   124					WARN_ON_ONCE(register_ftrace_function(fstress_ops[i]));
   125				if (i > 0)
   126					WARN_ON_ONCE(unregister_ftrace_function(fstress_ops[i - 1]));
   127	
   128				/*
   129				 * Try to schedule while one trace function is active
   130				 * (rather than the list func) to maximize the
   131				 * possibility that threads are preemted while a single
   132				 * trace function is active.
   133				 */
   134				schedule();
   135			}
   136		}
   137	
   138		for (int i = 0; i < nr_ops; i++) {
   139			WARN_ON_ONCE(unregister_ftrace_function(fstress_ops[i]));
   140			ftrace_free_filter(fstress_ops[i]);
   141		}
   142	
   143		return 0;
   144	}
   145	
   146	#define NR_TRACEE_THREADS	100
   147	
 > 148	struct task_struct *tracee_threads[NR_TRACEE_THREADS];
   149	struct task_struct *manager_thread;
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
