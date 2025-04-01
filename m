Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0426020126C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 22:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743544969; cv=none; b=d8ah/hMJ7zJdg4wCqSK8suF0i3+jpD2fsXYaErG0ZOJbJcK7wozmQcJZYjM3aI2MXa3x/6tW+rlx/uEEoctuW2lLxRUEcMXCQpBQ48F54MQyNmMOoQDf+Enw0oc80CzA6QG6nGIB8ns04r0YQ2Cn++XeVxaAY493xOVQ4805o0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743544969; c=relaxed/simple;
	bh=1aJIHJ/NAO6bkC+CrFGL2dZMdv0WNQh2nRrfyjXSRLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kLQ+RL7pGsdDjCtNiqkIsOIwOyr0LLH7GqF1HNmjdT97YzX0dnqHNI9JzKLKyPhH/d0CMxMCBoPZX1NyYBeQluF357tZVP1IJQlfsc8n66brNsOfA6kVHgvr861F1BsEXsVNFCWH6v9NDk+2vs2voPNUhEFXU/Ew5d7oQKiP63M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzDrzNjB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzDrzNjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743544967; x=1775080967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1aJIHJ/NAO6bkC+CrFGL2dZMdv0WNQh2nRrfyjXSRLE=;
  b=mzDrzNjB34bH2aH4CxUaLLumhhPCOPPMk9MklQPVvP+D+sxkV1+ubv/6
   tLFIdgUP8/VYF0L8q+B4dVfi4qTm5RQ1igM3yKlOf5BWao6Uthsz4ljbm
   a35gUm5VCPmYb9vXIsJMsNwLxsSDmWP+qIsGgs0vkB3OxXgGKHLtDv9eN
   PquHk1xO2aP5UtoJXqJetfJ9YI+Q6kvwDkm+etZuwUo7AXeK29Y3ytWQz
   dXgRAyFIUTx1gP3uxYDoNzHXponVYjGQm1+E0rkyjX+e+FONQZ2sZCkfP
   8BIJVTwtyk3GUGlDfARRUX8UAS+4QI+Fecyz5ty3gZcP8f8Q5cAj3T90j
   w==;
X-CSE-ConnectionGUID: 0fAj/onYSiKfEL3APdmdIQ==
X-CSE-MsgGUID: 3ZzeDVZtTkKTqmk3jwc9qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44598011"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="44598011"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 15:02:46 -0700
X-CSE-ConnectionGUID: +iKh8ZDpQR2mt85PQQBmyA==
X-CSE-MsgGUID: 50vTDmu4RUyLwvvoivqMaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="127418384"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Apr 2025 15:02:45 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzjgq-000AAK-2g;
	Tue, 01 Apr 2025 22:02:41 +0000
Date: Wed, 2 Apr 2025 06:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_any_andnot 13/13] include/linux/rculist.h:23:1:
 error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
Message-ID: <202504020530.zG4pqppQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_any_andnot
head:   d18e9bef696af868ef6afafb5d50ca9732a089cd
commit: d18e9bef696af868ef6afafb5d50ca9732a089cd [13/13] cpumask_any_andnot_but
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250402/202504020530.zG4pqppQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020530.zG4pqppQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020530.zG4pqppQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   include/linux/rcupdate.h:325:27: error: storage class specified for parameter 'rcu_callback_map'
     325 | extern struct lockdep_map rcu_callback_map;
         |                           ^~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:357:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     357 | {
         | ^
   include/linux/rcupdate.h:362:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     362 | {
         | ^
   include/linux/rcupdate.h:367:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     367 | {
         | ^
   include/linux/rcupdate.h:372:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     372 | {
         | ^
   include/linux/rcupdate.h:377:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     377 | {
         | ^
   include/linux/rcupdate.h:838:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     838 | {
         | ^
   include/linux/rcupdate.h:868:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     868 | {
         | ^
   include/linux/rcupdate.h:891:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     891 | {
         | ^
   include/linux/rcupdate.h:905:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     905 | {
         | ^
   include/linux/rcupdate.h:929:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     929 | {
         | ^
   include/linux/rcupdate.h:939:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     939 | {
         | ^
   include/linux/rcupdate.h:950:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     950 | {
         | ^
   include/linux/rcupdate.h:960:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     960 | {
         | ^
   include/linux/rcupdate.h:1123:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1123 | {
         | ^
   include/linux/rcupdate.h:1142:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1142 | {
         | ^
   include/linux/rcupdate.h:1152:12: error: storage class specified for parameter 'rcu_expedited'
    1152 | extern int rcu_expedited;
         |            ^~~~~~~~~~~~~
   include/linux/rcupdate.h:1153:12: error: storage class specified for parameter 'rcu_normal'
    1153 | extern int rcu_normal;
         |            ^~~~~~~~~~
   include/linux/cleanup.h:292:34: error: storage class specified for parameter 'class_rcu_is_conditional'
     292 | static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
         |                                  ^~~~~~
   include/linux/cleanup.h:407:1: note: in expansion of macro '__DEFINE_CLASS_IS_CONDITIONAL'
     407 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1155:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
    1155 | DEFINE_LOCK_GUARD_0(rcu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1155:1: error: parameter 'class_rcu_is_conditional' is initialized
   include/linux/cleanup.h:371:3: error: storage class specified for parameter 'class_rcu_t'
     371 | } class_##_name##_t;                                                    \
         |   ^~~~~~
   include/linux/cleanup.h:408:1: note: in expansion of macro '__DEFINE_UNLOCK_GUARD'
     408 | __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)                \
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1155:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
    1155 | DEFINE_LOCK_GUARD_0(rcu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:373:47: error: expected declaration specifiers or '...' before 'class_rcu_t'
     373 | static inline void class_##_name##_destructor(class_##_name##_t *_T)    \
         |                                               ^~~~~~
   include/linux/cleanup.h:408:1: note: in expansion of macro '__DEFINE_UNLOCK_GUARD'
     408 | __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)                \
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1155:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
    1155 | DEFINE_LOCK_GUARD_0(rcu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:378:46: error: expected declaration specifiers or '...' before 'class_rcu_t'
     378 | static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T)     \
         |                                              ^~~~~~
   include/linux/cleanup.h:408:1: note: in expansion of macro '__DEFINE_UNLOCK_GUARD'
     408 | __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)                \
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1155:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
    1155 | DEFINE_LOCK_GUARD_0(rcu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:393:33: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'class_rcu_constructor'
     393 | static inline class_##_name##_t class_##_name##_constructor(void)       \
         |                                 ^~~~~~
   include/linux/cleanup.h:409:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_0'
     409 | __DEFINE_LOCK_GUARD_0(_name, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1155:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_0'
    1155 | DEFINE_LOCK_GUARD_0(rcu,
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/rculist.h:23:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      23 | {
         | ^
   include/linux/rculist.h:89:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      89 | {
         | ^
   include/linux/rculist.h:116:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     116 | {
         | ^
   include/linux/rculist.h:138:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     138 | {
         | ^
   include/linux/rculist.h:167:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     167 | {
         | ^
   include/linux/rculist.h:201:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     201 | {
         | ^
   include/linux/rculist.h:226:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     226 | {
         | ^
   include/linux/rculist.h:246:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     246 | {
         | ^
   include/linux/rculist.h:277:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     277 | {
         | ^
   include/linux/rculist.h:324:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     324 | {
         | ^
   include/linux/rculist.h:339:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     339 | {
         | ^
   include/linux/rculist.h:559:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     559 | {
         | ^
   include/linux/rculist.h:575:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     575 | {
         | ^
   include/linux/rculist.h:597:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     597 | {
         | ^
   include/linux/rculist.h:635:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     635 | {
         | ^
   include/linux/rculist.h:666:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     666 | {
         | ^
   include/linux/rculist.h:702:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     702 | {
         | ^
   include/linux/rculist.h:729:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     729 | {
         | ^
   In file included from include/linux/sched/signal.h:8:
   include/linux/sched/jobctl.h:7:1: warning: empty declaration
       7 | struct task_struct;
         | ^~~~~~
>> include/linux/sched/jobctl.h:43:13: error: storage class specified for parameter 'task_set_jobctl_pending'
      43 | extern bool task_set_jobctl_pending(struct task_struct *task, unsigned long mask);
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/sched/jobctl.h:44:13: error: storage class specified for parameter 'task_clear_jobctl_trapping'
      44 | extern void task_clear_jobctl_trapping(struct task_struct *task);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/sched/jobctl.h:45:13: error: storage class specified for parameter 'task_clear_jobctl_pending'
      45 | extern void task_clear_jobctl_pending(struct task_struct *task, unsigned long mask);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9:
   include/linux/refcount.h:102:1: warning: empty declaration
     102 | struct mutex;
         | ^~~~~~
   include/linux/refcount.h:108:1: warning: empty declaration
     108 | enum refcount_saturation_type {
         | ^~~~
   include/linux/refcount.h:124:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     124 | {
         | ^
   include/linux/refcount.h:135:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     135 | {
         | ^
   include/linux/refcount.h:141:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     141 | {
         | ^
   include/linux/refcount.h:177:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     177 | {
         | ^
   include/linux/refcount.h:183:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     183 | {
         | ^
   include/linux/refcount.h:212:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     212 | {
         | ^
   include/linux/refcount.h:217:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     217 | {
         | ^
   include/linux/refcount.h:235:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     235 | {
         | ^
   include/linux/refcount.h:240:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     240 | {
         | ^
   include/linux/refcount.h:257:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     257 | {
         | ^
   include/linux/refcount.h:263:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     263 | {
         | ^
   include/linux/refcount.h:301:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     301 | {
         | ^
   include/linux/refcount.h:306:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     306 | {
         | ^
   include/linux/refcount.h:324:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     324 | {
         | ^
   include/linux/refcount.h:329:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     329 | {
         | ^
   include/linux/refcount.h:350:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     350 | {
         | ^
   include/linux/refcount.h:354:26: error: storage class specified for parameter 'refcount_dec_if_one'
     354 | extern __must_check bool refcount_dec_if_one(refcount_t *r);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:355:26: error: storage class specified for parameter 'refcount_dec_not_one'
     355 | extern __must_check bool refcount_dec_not_one(refcount_t *r);
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:356:26: error: storage class specified for parameter 'refcount_dec_and_mutex_lock'
     356 | extern __must_check bool refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock) __cond_acquires(lock);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:357:26: error: storage class specified for parameter 'refcount_dec_and_lock'
     357 | extern __must_check bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock) __cond_acquires(lock);
         |                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:358:26: error: storage class specified for parameter 'refcount_dec_and_lock_irqsave'
     358 | extern __must_check bool refcount_dec_and_lock_irqsave(refcount_t *r,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:5,
                    from include/linux/sched/task.h:13:
>> include/linux/fault-inject-usercopy.h:18:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      18 | static inline bool should_fail_usercopy(void) { return false; }
         |                                               ^
   In file included from include/linux/uaccess.h:8:
   include/linux/nospec.h:12:1: warning: empty declaration
      12 | struct task_struct;
         | ^~~~~~
>> include/linux/nospec.h:30:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      30 | {
         | ^
   In file included from include/linux/uaccess.h:10:
>> include/linux/ucopysize.h:28:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      28 | { }
         | ^
>> include/linux/ucopysize.h:32:1: error: storage class specified for parameter '__bad_copy_from'
      32 | __bad_copy_from(void);
         | ^~~~~~~~~~~~~~~
   include/linux/ucopysize.h:32:1: warning: 'error' attribute ignored [-Wattributes]
>> include/linux/ucopysize.h:34:1: error: storage class specified for parameter '__bad_copy_to'
      34 | __bad_copy_to(void);
         | ^~~~~~~~~~~~~
   include/linux/ucopysize.h:34:1: warning: 'error' attribute ignored [-Wattributes]
   include/linux/ucopysize.h:39:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      39 | {
         | ^
   include/linux/ucopysize.h:46:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      46 | {
         | ^
   In file included from arch/openrisc/include/asm/uaccess.h:21,
                    from include/linux/uaccess.h:12:
>> include/linux/prefetch.h:18:1: warning: empty declaration
      18 | struct page;
         | ^~~~~~
>> include/linux/prefetch.h:51:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      51 | {
         | ^
   include/linux/prefetch.h:62:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      62 | {
         | ^
   In file included from ./arch/openrisc/include/generated/asm/extable.h:1,
                    from arch/openrisc/include/asm/uaccess.h:24:
   include/asm-generic/extable.h:18:1: warning: empty declaration
      18 | struct exception_table_entry
         | ^~~~~~
   include/asm-generic/extable.h:24:1: warning: empty declaration
      24 | struct pt_regs;
         | ^~~~~~
>> include/asm-generic/extable.h:25:12: error: storage class specified for parameter 'fixup_exception'
      25 | extern int fixup_exception(struct pt_regs *regs);
         |            ^~~~~~~~~~~~~~~
   In file included from arch/openrisc/include/asm/uaccess.h:25:
>> include/asm-generic/access_ok.h:32:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      32 | {
         | ^
>> arch/openrisc/include/asm/uaccess.h:55:13: error: storage class specified for parameter '__put_user_bad'
      55 | extern long __put_user_bad(void);
         |             ^~~~~~~~~~~~~~
>> arch/openrisc/include/asm/uaccess.h:85:1: warning: empty declaration
      85 | struct __large_struct {
         | ^~~~~~
>> arch/openrisc/include/asm/uaccess.h:147:13: error: storage class specified for parameter '__get_user_bad'
     147 | extern long __get_user_bad(void);
         |             ^~~~~~~~~~~~~~
>> arch/openrisc/include/asm/uaccess.h:210:1: error: storage class specified for parameter '__copy_tofrom_user'
     210 | __copy_tofrom_user(void *to, const void *from, unsigned long size);
         | ^~~~~~~~~~~~~~~~~~
>> arch/openrisc/include/asm/uaccess.h:213:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     213 | {
         | ^
   arch/openrisc/include/asm/uaccess.h:218:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     218 | {
         | ^
>> arch/openrisc/include/asm/uaccess.h:224:22: error: storage class specified for parameter '__clear_user'
     224 | extern unsigned long __clear_user(void __user *addr, unsigned long size);
         |                      ^~~~~~~~~~~~
   arch/openrisc/include/asm/uaccess.h:228:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     228 | {
         | ^
>> arch/openrisc/include/asm/uaccess.h:234:13: error: storage class specified for parameter 'strncpy_from_user'
     234 | extern long strncpy_from_user(char *dest, const char __user *src, long count);
         |             ^~~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/uaccess.h:236:26: error: storage class specified for parameter 'strnlen_user'
     236 | extern __must_check long strnlen_user(const char __user *str, long n);
         |                          ^~~~~~~~~~~~
   include/linux/uaccess.h:91:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      91 | {
         | ^
   include/linux/uaccess.h:103:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     103 | {
         | ^
   include/linux/uaccess.h:131:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     131 | {
         | ^
   include/linux/uaccess.h:141:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     141 | {
         | ^
   include/linux/uaccess.h:160:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     160 | {
         | ^
   include/linux/uaccess.h:187:1: error: storage class specified for parameter '_copy_from_user'
     187 | _copy_from_user(void *, const void __user *, unsigned long);
         | ^~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     191 | {
         | ^
   include/linux/uaccess.h:202:1: error: storage class specified for parameter '_copy_to_user'
     202 | _copy_to_user(void __user *, const void *, unsigned long);
         | ^~~~~~~~~~~~~
   include/linux/uaccess.h:206:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     206 | {
         | ^
   include/linux/uaccess.h:218:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     218 | {
         | ^
   include/linux/uaccess.h:236:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     236 | {
         | ^
   include/linux/uaccess.h:243:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     243 | {
         | ^
   include/linux/uaccess.h:248:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     248 | {
         | ^
   include/linux/uaccess.h:260:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     260 | {
         | ^
   include/linux/uaccess.h:270:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     270 | {
         | ^
   include/linux/uaccess.h:283:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     283 | {
         | ^
   include/linux/uaccess.h:315:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     315 | {
         | ^
   include/linux/uaccess.h:326:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     326 | {
         | ^
   include/linux/uaccess.h:332:25: error: storage class specified for parameter 'check_zeroed_user'
     332 | extern __must_check int check_zeroed_user(const void __user *from, size_t size);
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:384:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     384 | {
         | ^
   include/linux/uaccess.h:481:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     481 | {
         | ^
   include/linux/uaccess.h:506:14: error: 'no_instrument_function' attribute applies only to functions
     506 | long notrace copy_to_kernel_nofault(void *dst, const void *src, size_t size);
         |              ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:509:14: error: 'no_instrument_function' attribute applies only to functions
     509 | long notrace copy_to_user_nofault(void __user *dst, const void *src,
         |              ^~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:558:52: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     558 | static inline unsigned long user_access_save(void) { return 0UL; }
         |                                                    ^
   include/linux/uaccess.h:559:61: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     559 | static inline void user_access_restore(unsigned long flags) { }
         |                                                             ^
   include/linux/sched/task.h:15:1: warning: empty declaration
      15 | struct task_struct;
         | ^~~~~~
   include/linux/sched/task.h:16:1: warning: empty declaration
      16 | struct rusage;
         | ^~~~~~
   include/linux/sched/task.h:17:1: warning: empty declaration
      17 | union thread_union;
         | ^~~~~
   include/linux/sched/task.h:18:1: warning: empty declaration
      18 | struct css_set;
         | ^~~~~~
   include/linux/sched/task.h:23:1: warning: empty declaration
      23 | struct kernel_clone_args {
         | ^~~~~~
   include/linux/sched/task.h:55:17: error: storage class specified for parameter 'tasklist_lock'
      55 | extern rwlock_t tasklist_lock;
         |                 ^~~~~~~~~~~~~
   include/linux/sched/task.h:56:19: error: storage class specified for parameter 'mmlist_lock'
      56 | extern spinlock_t mmlist_lock;


vim +23 include/linux/rculist.h

82524746c27fa4 Franck Bui-Huu   2008-05-12  12  
2a855b644c310d Paul E. McKenney 2013-08-23  13  /*
2a855b644c310d Paul E. McKenney 2013-08-23  14   * INIT_LIST_HEAD_RCU - Initialize a list_head visible to RCU readers
2a855b644c310d Paul E. McKenney 2013-08-23  15   * @list: list to be initialized
2a855b644c310d Paul E. McKenney 2013-08-23  16   *
2a855b644c310d Paul E. McKenney 2013-08-23  17   * You should instead use INIT_LIST_HEAD() for normal initialization and
2a855b644c310d Paul E. McKenney 2013-08-23  18   * cleanup tasks, when readers have no access to the list being initialized.
2a855b644c310d Paul E. McKenney 2013-08-23  19   * However, if the list being initialized is visible to readers, you
2a855b644c310d Paul E. McKenney 2013-08-23  20   * need to keep the compiler from being too mischievous.
2a855b644c310d Paul E. McKenney 2013-08-23  21   */
2a855b644c310d Paul E. McKenney 2013-08-23  22  static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
2a855b644c310d Paul E. McKenney 2013-08-23 @23  {
7d0ae8086b8283 Paul E. McKenney 2015-03-03  24  	WRITE_ONCE(list->next, list);
7d0ae8086b8283 Paul E. McKenney 2015-03-03  25  	WRITE_ONCE(list->prev, list);
2a855b644c310d Paul E. McKenney 2013-08-23  26  }
2a855b644c310d Paul E. McKenney 2013-08-23  27  

:::::: The code at line 23 was first introduced by commit
:::::: 2a855b644c310d5db5a80b8816c0c7748c167977 rcu: Make list_splice_init_rcu() account for RCU readers

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
