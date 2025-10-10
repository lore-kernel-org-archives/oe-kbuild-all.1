Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4724E2848BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760097214; cv=none; b=MliQlCi4fypNHOIkzjY9m8Y9H1AuUMMvd6+gxwk9mm+gtoClJb6YlBRb/DJZa0sT2V2ht9DAN3pBsDSZmvo7gcuZOnOc8YJF0B6rhFCJ6+Qmf1/RFgodo3ehgSIsgqLjE00HuIsEE62Z8ZiqUP4FYb6nlLrNFEBv28CFEj+XXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760097214; c=relaxed/simple;
	bh=mnF153/u5pORlnyNNn753iFUl0pXSU+9wxN7wNMiZ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCR0Boow9tvPg1W28KBFFtRCN+WCeF3eAPrglNcGy94CoHU3CPjrKlK6z4VkViauOG/g+MdSg3gNJ1LNyGOZ/dNQE6UYOz/qypX3SpgrVlV04IKB6Bg5OpVHLPBk362ioqaoYeXKsRZ0sjcfEL8Y0oE6kgLENhO/lSwxqodukKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlsL1uM3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlsL1uM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760097211; x=1791633211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnF153/u5pORlnyNNn753iFUl0pXSU+9wxN7wNMiZ0Q=;
  b=WlsL1uM3H9T3kHS8aJ9Nql2imZDhhSkMv51JDJJthdCZYCZS6Wd3m1+B
   2+M54nwjs92JX8GymjqanlLPjvmN+K5mXCK1IG6+hCISJ4kBVuTxHPuwr
   T3oIl7hNOsUJStW6LBUl/3YlchULTOgjko0msJfSQzrrUMEuSF1vmorW6
   CQGTRiG0ZlLmkn2EJ7YIM8rL52El79hJHQWDhq9fJI+qk32G4CFyZv+Qe
   pyNJLWrF3D4hVRKutvSBY0EEwk+SOiv51SgEWLjXTlasVz6t7sN8TIp3D
   7dSEEdlkI+YOMDLNWJmFg5FGiUqhgjsJwAjnMM4VkqlXNXZVDYLuWJgU4
   w==;
X-CSE-ConnectionGUID: 7Aewfg+mRiagC72jvKBVyg==
X-CSE-MsgGUID: Fub5bHqxS0aM1B1BRYHO/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62018709"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="62018709"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 04:53:31 -0700
X-CSE-ConnectionGUID: g0Qqj9GJQZKvop0GKzZ+/g==
X-CSE-MsgGUID: fs566SrDSmeqp3SlMavz9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="184993585"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Oct 2025 04:53:30 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Bgc-0002bZ-3C;
	Fri, 10 Oct 2025 11:53:26 +0000
Date: Fri, 10 Oct 2025 19:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/sysctl_jiffies 11/15]
 include/linux/sched/signal.h:756:13: error: storage class specified for
 parameter 'lockdep_assert_task_sighand_held'
Message-ID: <202510101946.9lsXbuCb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/sysctl_jiffies
head:   554ee06fa18e09b6f41bccfed20385b5aa716d54
commit: fd98457173e626d2501830b48b9bfe973fe663b4 [11/15] sysctl: new proc_dointvec_conv
config: s390-randconfig-001-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101946.9lsXbuCb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101946.9lsXbuCb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101946.9lsXbuCb-lkp@intel.com/

Note: the joel-granados/jag/sysctl_jiffies HEAD 554ee06fa18e09b6f41bccfed20385b5aa716d54 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

         | ^
   include/linux/sched/signal.h:483:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     483 | {
         | ^
   include/linux/sched/signal.h:488:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     488 | {
         | ^
   include/linux/sched/signal.h:492:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     492 | {
         | ^
   include/linux/sched/signal.h:496:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     496 | {
         | ^
   include/linux/sched/signal.h:500:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     500 | {
         | ^
   include/linux/sched/signal.h:537:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     537 | {
         | ^
   include/linux/sched/signal.h:542:12: error: storage class specified for parameter 'set_user_sigmask'
     542 | extern int set_user_sigmask(const sigset_t __user *umask, size_t sigsetsize);
         |            ^~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:545:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     545 | {
         | ^
   include/linux/sched/signal.h:553:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     553 | {
         | ^
   include/linux/sched/signal.h:561:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     561 | {
         | ^
   include/linux/sched/signal.h:570:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     570 | {
         | ^
   include/linux/sched/signal.h:584:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     584 | {
         | ^
   include/linux/sched/signal.h:601:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     601 | {
         | ^
   include/linux/sched/signal.h:609:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     609 | {
         | ^
   include/linux/sched/signal.h:616:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     616 | {
         | ^
   include/linux/sched/signal.h:626:13: error: storage class specified for parameter '__cleanup_sighand'
     626 | extern void __cleanup_sighand(struct sighand_struct *);
         |             ^~~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:627:13: error: storage class specified for parameter 'flush_itimer_signals'
     627 | extern void flush_itimer_signals(void);
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:638:13: error: storage class specified for parameter 'current_is_single_threaded'
     638 | extern bool current_is_single_threaded(void);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:661:15: error: storage class specified for parameter 'proc_visitor'
     661 | typedef int (*proc_visitor)(struct task_struct *p, void *data);
         |               ^~~~~~~~~~~~
   include/linux/sched/signal.h:662:49: error: expected declaration specifiers or '...' before 'proc_visitor'
     662 | void walk_process_tree(struct task_struct *top, proc_visitor, void *);
         |                                                 ^~~~~~~~~~~~
   include/linux/sched/signal.h:666:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     666 | {
         | ^
   include/linux/sched/signal.h:676:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     676 | {
         | ^
   include/linux/sched/signal.h:686:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     686 | {
         | ^
   include/linux/sched/signal.h:691:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     691 | {
         | ^
   include/linux/sched/signal.h:696:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     696 | {
         | ^
   include/linux/sched/signal.h:701:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     701 | {
         | ^
   include/linux/sched/signal.h:707:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     707 | {
         | ^
   include/linux/sched/signal.h:715:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     715 | {
         | ^
   include/linux/sched/signal.h:723:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     723 | {
         | ^
   include/linux/sched/signal.h:728:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     728 | {
         | ^
   include/linux/sched/signal.h:736:31: error: storage class specified for parameter '__lock_task_sighand'
     736 | extern struct sighand_struct *__lock_task_sighand(struct task_struct *task,
         |                               ^~~~~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:741:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     741 | {
         | ^
   include/linux/sched/signal.h:751:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     751 | {
         | ^
>> include/linux/sched/signal.h:756:13: error: storage class specified for parameter 'lockdep_assert_task_sighand_held'
     756 | extern void lockdep_assert_task_sighand_held(struct task_struct *task);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:763:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     763 | {
         | ^
   include/linux/sched/signal.h:769:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     769 | {
         | ^
   include/linux/sched/signal.h:774:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     774 | {
         | ^
   include/linux/sched/signal.h:779:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     779 | {
         | ^
   In file included from include/linux/mm.h:8,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10:
>> include/linux/pgalloc_tag.h:205:58: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     205 | static inline void clear_page_tag_ref(struct page *page) {}
         |                                                          ^
   include/linux/pgalloc_tag.h:206:45: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     206 | static inline void alloc_tag_sec_init(void) {}
         |                                             ^
   include/linux/pgalloc_tag.h:207:89: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     207 | static inline void pgalloc_tag_split(struct folio *folio, int old_order, int new_order) {}
         |                                                                                         ^
   include/linux/pgalloc_tag.h:208:75: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     208 | static inline void pgalloc_tag_swap(struct folio *new, struct folio *old) {}
         |                                                                           ^
   include/linux/pgalloc_tag.h:209:68: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     209 | static inline struct alloc_tag *pgalloc_tag_get(struct page *page) { return NULL; }
         |                                                                    ^
   In file included from include/linux/mm.h:17:
   include/linux/mmap_lock.h:6:12: error: storage class specified for parameter 'rcuwait_wake_up'
       6 | extern int rcuwait_wake_up(struct rcuwait *w);
         |            ^~~~~~~~~~~~~~~
   In file included from include/linux/sched.h:49:
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_mmap_lock_start_locking'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/mmap_lock.h:20:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      20 | DECLARE_TRACEPOINT(mmap_lock_start_locking);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_mmap_lock_acquire_returned'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/mmap_lock.h:21:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      21 | DECLARE_TRACEPOINT(mmap_lock_acquire_returned);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_mmap_lock_released'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/mmap_lock.h:22:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      22 | DECLARE_TRACEPOINT(mmap_lock_released);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:33:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      33 | {
         | ^
   include/linux/mmap_lock.h:40:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      40 | {
         | ^
   include/linux/mmap_lock.h:46:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      46 | {
         | ^
   include/linux/mmap_lock.h:70:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      70 | {
         | ^
   include/linux/mmap_lock.h:75:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      75 | {
         | ^
   include/linux/mmap_lock.h:82:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      82 | {
         | ^
   include/linux/mmap_lock.h:87:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      87 | {
         | ^
   include/linux/mmap_lock.h:92:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      92 | {
         | ^
   include/linux/mmap_lock.h:98:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      98 | {
         | ^
   include/linux/mmap_lock.h:109:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     109 | {
         | ^
   include/linux/mmap_lock.h:114:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     114 | {
         | ^
   include/linux/mmap_lock.h:126:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     126 | {
         | ^
   include/linux/mmap_lock.h:137:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     137 | {
         | ^
   include/linux/mmap_lock.h:165:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     165 | {
         | ^
   include/linux/mmap_lock.h:242:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     242 | {
         | ^
   include/linux/mmap_lock.h:261:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     261 | {
         | ^
   include/linux/mmap_lock.h:266:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     266 | {
         | ^
   include/linux/mmap_lock.h:272:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     272 | {
         | ^
   include/linux/mmap_lock.h:291:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     291 | {
         | ^
   include/linux/mmap_lock.h:301:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     301 | {
         | ^
   include/linux/mmap_lock.h:308:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     308 | {
         | ^
--
   include/linux/mmap_lock.h:437:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     437 | {
         | ^
   include/linux/mmap_lock.h:444:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     444 | {
         | ^
   include/linux/mmap_lock.h:451:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     451 | {
         | ^
   include/linux/mmap_lock.h:458:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     458 | {
         | ^
   include/linux/mmap_lock.h:468:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     468 | {
         | ^
   include/linux/mmap_lock.h:478:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     478 | {
         | ^
   include/linux/cleanup.h:276:15: error: storage class specified for parameter 'class_mmap_read_lock_t'
     276 | typedef _type class_##_name##_t;                                        \
         |               ^~~~~~
   include/linux/cleanup.h:379:9: note: in expansion of macro 'DEFINE_CLASS'
     379 |         DEFINE_CLASS(_name, _type, if (!__GUARD_IS_ERR(_T)) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |         ^~~~~~~~~~~~
   include/linux/mmap_lock.h:483:1: note: in expansion of macro 'DEFINE_GUARD'
     483 | DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:278:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     278 | { _type _T = *p; _exit; }                                               \
         | ^
   include/linux/cleanup.h:379:9: note: in expansion of macro 'DEFINE_CLASS'
     379 |         DEFINE_CLASS(_name, _type, if (!__GUARD_IS_ERR(_T)) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |         ^~~~~~~~~~~~
   include/linux/mmap_lock.h:483:1: note: in expansion of macro 'DEFINE_GUARD'
     483 | DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:280:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     280 | { _type t = _init; return t; }
         | ^
   include/linux/cleanup.h:379:9: note: in expansion of macro 'DEFINE_CLASS'
     379 |         DEFINE_CLASS(_name, _type, if (!__GUARD_IS_ERR(_T)) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |         ^~~~~~~~~~~~
   include/linux/mmap_lock.h:483:1: note: in expansion of macro 'DEFINE_GUARD'
     483 | DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:379:102: error: expected declaration specifiers before ';' token
     379 |         DEFINE_CLASS(_name, _type, if (!__GUARD_IS_ERR(_T)) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |                                                                                                      ^
   include/linux/mmap_lock.h:483:1: note: in expansion of macro 'DEFINE_GUARD'
     483 | DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:341:34: error: storage class specified for parameter 'class_mmap_read_lock_is_conditional'
     341 | static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
         |                                  ^~~~~~
   include/linux/cleanup.h:371:9: note: in expansion of macro '__DEFINE_CLASS_IS_CONDITIONAL'
     371 |         __DEFINE_CLASS_IS_CONDITIONAL(_name, false); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:380:9: note: in expansion of macro 'DEFINE_CLASS_IS_GUARD'
     380 |         DEFINE_CLASS_IS_GUARD(_name)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:483:1: note: in expansion of macro 'DEFINE_GUARD'
     483 | DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:379:102: error: parameter 'class_mmap_read_lock_is_conditional' is initialized
     379 |         DEFINE_CLASS(_name, _type, if (!__GUARD_IS_ERR(_T)) { _unlock; }, ({ _lock; _T; }), _type _T); \
         |                                                                                                      ^
   include/linux/mmap_lock.h:483:1: note: in expansion of macro 'DEFINE_GUARD'
     483 | DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:350:54: error: expected declaration specifiers or '...' before 'class_mmap_read_lock_t'
     350 |         static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T) \
         |                                                      ^~~~~~
   include/linux/cleanup.h:372:9: note: in expansion of macro '__DEFINE_GUARD_LOCK_PTR'
     372 |         __DEFINE_GUARD_LOCK_PTR(_name, _T)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:380:9: note: in expansion of macro 'DEFINE_CLASS_IS_GUARD'
     380 |         DEFINE_CLASS_IS_GUARD(_name)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:483:1: note: in expansion of macro 'DEFINE_GUARD'
     483 | DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:358:52: error: expected declaration specifiers or '...' before 'class_mmap_read_lock_t'
     358 |         static inline int class_##_name##_lock_err(class_##_name##_t *_T)   \
         |                                                    ^~~~~~
   include/linux/cleanup.h:372:9: note: in expansion of macro '__DEFINE_GUARD_LOCK_PTR'
     372 |         __DEFINE_GUARD_LOCK_PTR(_name, _T)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:380:9: note: in expansion of macro 'DEFINE_CLASS_IS_GUARD'
     380 |         DEFINE_CLASS_IS_GUARD(_name)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:483:1: note: in expansion of macro 'DEFINE_GUARD'
     483 | DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
         | ^~~~~~~~~~~~
   include/linux/mmap_lock.h:487:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     487 | {
         | ^
   include/linux/mmap_lock.h:493:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     493 | {
         | ^
   In file included from include/linux/mm.h:18:
>> include/linux/range.h:6:1: warning: empty declaration
       6 | struct range {
         | ^~~~~~
>> include/linux/range.h:12:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      12 | {
         | ^
   include/linux/range.h:19:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      19 | {
         | ^
   include/linux/range.h:26:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      26 | {
         | ^
   In file included from include/linux/mm.h:20:
>> include/linux/percpu-refcount.h:59:1: warning: empty declaration
      59 | struct percpu_ref;
         | ^~~~~~
>> include/linux/percpu-refcount.h:60:15: error: storage class specified for parameter 'percpu_ref_func_t'
      60 | typedef void (percpu_ref_func_t)(struct percpu_ref *);
         |               ^~~~~~~~~~~~~~~~~
   include/linux/percpu-refcount.h:63:1: warning: empty declaration
      63 | enum {
         | ^~~~
   include/linux/percpu-refcount.h:72:1: warning: empty declaration
      72 | enum {
         | ^~~~
>> include/linux/percpu-refcount.h:97:9: error: expected specifier-qualifier-list before 'percpu_ref_func_t'
      97 |         percpu_ref_func_t       *release;
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-refcount.h:95:1: warning: empty declaration
      95 | struct percpu_ref_data {
         | ^~~~~~
   include/linux/percpu-refcount.h:105:1: warning: empty declaration
     105 | struct percpu_ref {
         | ^~~~~~
>> include/linux/percpu-refcount.h:122:34: error: expected declaration specifiers or '...' before 'percpu_ref_func_t'
     122 |                                  percpu_ref_func_t *release, unsigned int flags,
         |                                  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-refcount.h:126:34: error: expected declaration specifiers or '...' before 'percpu_ref_func_t'
     126 |                                  percpu_ref_func_t *confirm_switch);
         |                                  ^~~~~~~~~~~~~~~~~
   include/linux/percpu-refcount.h:130:34: error: expected declaration specifiers or '...' before 'percpu_ref_func_t'
     130 |                                  percpu_ref_func_t *confirm_kill);
         |                                  ^~~~~~~~~~~~~~~~~
>> include/linux/percpu-refcount.h:148:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     148 | {
         | ^
   include/linux/percpu-refcount.h:160:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     160 | {
         | ^
   include/linux/percpu-refcount.h:199:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     199 | {
         | ^
   include/linux/percpu-refcount.h:221:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     221 | {
         | ^
   include/linux/percpu-refcount.h:237:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     237 | {
         | ^
   include/linux/percpu-refcount.h:265:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     265 | {
         | ^
   include/linux/percpu-refcount.h:276:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     276 | {
         | ^
   include/linux/percpu-refcount.h:307:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     307 | {
         | ^
   include/linux/percpu-refcount.h:327:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     327 | {
         | ^
   include/linux/percpu-refcount.h:350:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     350 | {
         | ^
   include/linux/percpu-refcount.h:364:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     364 | {
         | ^
   In file included from include/linux/mm.h:21:
   include/linux/bit_spinlock.h:17:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      17 | {
         | ^
   include/linux/bit_spinlock.h:42:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      42 | {
         | ^
   include/linux/bit_spinlock.h:58:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      58 | {
         | ^
   include/linux/bit_spinlock.h:75:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      75 | {
         | ^
   include/linux/bit_spinlock.h:90:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      90 | {
         | ^
   In file included from include/linux/mm.h:22:
   include/linux/shrinker.h:16:1: warning: empty declaration
      16 | struct shrinker_info_unit {
         | ^~~~~~
   include/linux/shrinker.h:21:1: warning: empty declaration
      21 | struct shrinker_info {
         | ^~~~~~
   include/linux/shrinker.h:34:1: warning: empty declaration
      34 | struct shrink_control {
         | ^~~~~~
   include/linux/shrinker.h:82:1: warning: empty declaration
      82 | struct shrinker {
         | ^~~~~~
   In file included from include/linux/compiler_types.h:89,
                    from <command-line>:
   include/linux/compiler_attributes.h:158:41: error: expected declaration specifiers before '__attribute__'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                         ^~~~~~~~~~~~~
   include/linux/shrinker.h:134:1: note: in expansion of macro '__printf'
     134 | __printf(2, 3)
         | ^~~~~~~~
   include/linux/shrinker.h:140:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     140 | {
         | ^
   include/linux/shrinker.h:145:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     145 | {
         | ^
   include/linux/shrinker.h:156:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     156 | {
         | ^
   In file included from include/linux/mm.h:24:
   include/linux/page_ext.h:9:1: warning: empty declaration
       9 | struct pglist_data;
         | ^~~~~~
   include/linux/page_ext.h:190:1: warning: empty declaration
     190 | struct page_ext;
         | ^~~~~~
>> include/linux/page_ext.h:193:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     193 | {
         | ^
   include/linux/page_ext.h:198:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     198 | {
         | ^
   include/linux/page_ext.h:202:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     202 | {
         | ^
   include/linux/page_ext.h:206:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     206 | {
         | ^
   include/linux/page_ext.h:210:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     210 | {
         | ^
   include/linux/page_ext.h:214:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     214 | {
         | ^
   include/linux/page_ext.h:219:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     219 | {
         | ^
>> include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_set'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:10:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      10 | DECLARE_TRACEPOINT(page_ref_set);
         | ^~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_mod'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:11:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      11 | DECLARE_TRACEPOINT(page_ref_mod);
         | ^~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_mod_and_test'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:12:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      12 | DECLARE_TRACEPOINT(page_ref_mod_and_test);
         | ^~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_mod_and_return'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:13:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      13 | DECLARE_TRACEPOINT(page_ref_mod_and_return);
         | ^~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_mod_unless'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:14:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      14 | DECLARE_TRACEPOINT(page_ref_mod_unless);
         | ^~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_freeze'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:15:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      15 | DECLARE_TRACEPOINT(page_ref_freeze);
         | ^~~~~~~~~~~~~~~~~~
>> include/linux/tracepoint-defs.h:88:34: error: storage class specified for parameter '__tracepoint_page_ref_unfreeze'
      88 |         extern struct tracepoint __tracepoint_##tp
         |                                  ^~~~~~~~~~~~~
   include/linux/page_ref.h:16:1: note: in expansion of macro 'DECLARE_TRACEPOINT'
      16 | DECLARE_TRACEPOINT(page_ref_unfreeze);
         | ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm.h:27:
>> include/linux/page_ref.h:42:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      42 | {
         | ^
   include/linux/page_ref.h:45:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      45 | {
         | ^
   include/linux/page_ref.h:48:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      48 | {
         | ^
   include/linux/page_ref.h:51:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      51 | {
         | ^
   include/linux/page_ref.h:54:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      54 | {
         | ^
   include/linux/page_ref.h:57:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      57 | {
         | ^
   include/linux/page_ref.h:60:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      60 | {
         | ^
   include/linux/page_ref.h:66:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      66 | {
         | ^
   include/linux/page_ref.h:88:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      88 | {
         | ^
   include/linux/page_ref.h:93:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      93 | {
         | ^
   include/linux/page_ref.h:98:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      98 | {
         | ^
   include/linux/page_ref.h:105:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     105 | {
         | ^
   include/linux/page_ref.h:114:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     114 | {
         | ^
   include/linux/page_ref.h:119:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     119 | {
         | ^
   include/linux/page_ref.h:126:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     126 | {
         | ^
   include/linux/page_ref.h:131:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     131 | {
         | ^
   include/linux/page_ref.h:138:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     138 | {
         | ^
   include/linux/page_ref.h:143:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     143 | {
         | ^
   include/linux/page_ref.h:152:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     152 | {
         | ^
   include/linux/page_ref.h:159:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     159 | {
         | ^
   include/linux/page_ref.h:164:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     164 | {
         | ^
   include/linux/page_ref.h:171:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     171 | {
         | ^
   include/linux/page_ref.h:176:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     176 | {
         | ^
   include/linux/page_ref.h:185:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     185 | {
         | ^
   include/linux/page_ref.h:190:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     190 | {
         | ^
   include/linux/page_ref.h:199:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     199 | {
         | ^
   include/linux/page_ref.h:204:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     204 | {
         | ^
   include/linux/page_ref.h:213:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     213 | {
         | ^
   include/linux/page_ref.h:218:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     218 | {
         | ^
   include/linux/page_ref.h:227:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     227 | {
         | ^
   include/linux/page_ref.h:232:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     232 | {
         | ^
   include/linux/page_ref.h:247:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     247 | {
         | ^
   include/linux/page_ref.h:263:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     263 | {
         | ^
   include/linux/page_ref.h:268:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     268 | {
         | ^
   include/linux/page_ref.h:273:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     273 | {
         | ^
   include/linux/page_ref.h:282:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     282 | {
         | ^
   include/linux/page_ref.h:287:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     287 | {
         | ^
   include/linux/page_ref.h:297:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     297 | {
         | ^
   In file included from include/linux/kasan.h:6,
                    from include/linux/mm.h:32:
>> include/linux/kasan-enabled.h:24:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      24 | {
         | ^
   include/linux/kasan-enabled.h:29:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      29 | {
         | ^
>> include/linux/kasan.h:12:1: warning: empty declaration
      12 | struct kmem_cache;
         | ^~~~~~
   include/linux/kasan.h:13:1: warning: empty declaration
      13 | struct page;
         | ^~~~~~
   include/linux/kasan.h:14:1: warning: empty declaration
      14 | struct slab;
         | ^~~~~~
   include/linux/kasan.h:15:1: warning: empty declaration
      15 | struct vm_struct;
         | ^~~~~~
   include/linux/kasan.h:16:1: warning: empty declaration
      16 | struct task_struct;
         | ^~~~~~
   include/linux/kasan.h:25:32: error: storage class specified for parameter 'kasan_vmalloc_flags_t'
      25 | typedef unsigned int __bitwise kasan_vmalloc_flags_t;
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan.h:81:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      81 | {
         | ^
   include/linux/kasan.h:86:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      86 | {}
         | ^
   include/linux/kasan.h:88:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      88 | static inline void kasan_enable_current(void) {}
         |                                               ^
   include/linux/kasan.h:89:48: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      89 | static inline void kasan_disable_current(void) {}
         |                                                ^
   include/linux/kasan.h:100:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     100 | {
         | ^
   include/linux/kasan.h:405:75: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     405 | static inline void kasan_unpoison_range(const void *address, size_t size) {}
         |                                                                           ^
   include/linux/kasan.h:407:50: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     407 |                                       bool init) {}
         |                                                  ^
   include/linux/kasan.h:410:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     410 | {
         | ^
   include/linux/kasan.h:413:57: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     413 | static inline void kasan_poison_slab(struct slab *slab) {}
         |                                                         ^
   include/linux/kasan.h:415:55: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     415 |                                         void *object) {}
         |                                                       ^
   include/linux/kasan.h:417:55: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     417 |                                         void *object) {}
         |                                                       ^
   include/linux/kasan.h:420:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     420 | {
         | ^
   include/linux/kasan.h:425:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     425 | {
         | ^
   include/linux/kasan.h:431:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     431 | {
         | ^
   include/linux/kasan.h:434:49: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     434 | static inline void kasan_kfree_large(void *ptr) {}
         |                                                 ^
   include/linux/kasan.h:437:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     437 | {
         | ^
   include/linux/kasan.h:442:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     442 | {
         | ^
   include/linux/kasan.h:446:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     446 | {
         | ^
   include/linux/kasan.h:451:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     451 | {
         | ^
   include/linux/kasan.h:455:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     455 | {
         | ^
   include/linux/kasan.h:458:88: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     458 | static inline void kasan_mempool_unpoison_pages(struct page *page, unsigned int order) {}
         |                                                                                        ^
   include/linux/kasan.h:460:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     460 | {
         | ^
   include/linux/kasan.h:463:74: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     463 | static inline void kasan_mempool_unpoison_object(void *ptr, size_t size) {}
         |                                                                          ^
   include/linux/kasan.h:466:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     466 | {
         | ^
   include/linux/kasan.h:476:72: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     476 | static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
         |                                                                        ^
   include/linux/kasan.h:477:75: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     477 | static inline void kasan_unpoison_task_stack_below(const void *watermark) {}
         |                                                                           ^
   include/linux/kasan.h:500:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     500 | {
         | ^
   include/linux/kasan.h:506:60: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     506 |                                       slab_flags_t *flags) {}


vim +/lockdep_assert_task_sighand_held +756 include/linux/sched/signal.h

c3edc4010e9d102 Ingo Molnar         2017-02-02  732  
c3edc4010e9d102 Ingo Molnar         2017-02-02  733  #define delay_group_leader(p) \
c3edc4010e9d102 Ingo Molnar         2017-02-02  734  		(thread_group_leader(p) && !thread_group_empty(p))
c3edc4010e9d102 Ingo Molnar         2017-02-02  735  
9e9291c71eb92b4 Andrei Vagin        2019-05-14 @736  extern struct sighand_struct *__lock_task_sighand(struct task_struct *task,
c3edc4010e9d102 Ingo Molnar         2017-02-02  737  							unsigned long *flags);
c3edc4010e9d102 Ingo Molnar         2017-02-02  738  
9e9291c71eb92b4 Andrei Vagin        2019-05-14  739  static inline struct sighand_struct *lock_task_sighand(struct task_struct *task,
c3edc4010e9d102 Ingo Molnar         2017-02-02  740  						       unsigned long *flags)
c3edc4010e9d102 Ingo Molnar         2017-02-02  741  {
c3edc4010e9d102 Ingo Molnar         2017-02-02  742  	struct sighand_struct *ret;
c3edc4010e9d102 Ingo Molnar         2017-02-02  743  
9e9291c71eb92b4 Andrei Vagin        2019-05-14  744  	ret = __lock_task_sighand(task, flags);
9e9291c71eb92b4 Andrei Vagin        2019-05-14  745  	(void)__cond_lock(&task->sighand->siglock, ret);
c3edc4010e9d102 Ingo Molnar         2017-02-02  746  	return ret;
c3edc4010e9d102 Ingo Molnar         2017-02-02  747  }
c3edc4010e9d102 Ingo Molnar         2017-02-02  748  
9e9291c71eb92b4 Andrei Vagin        2019-05-14  749  static inline void unlock_task_sighand(struct task_struct *task,
c3edc4010e9d102 Ingo Molnar         2017-02-02  750  						unsigned long *flags)
c3edc4010e9d102 Ingo Molnar         2017-02-02  751  {
9e9291c71eb92b4 Andrei Vagin        2019-05-14  752  	spin_unlock_irqrestore(&task->sighand->siglock, *flags);
c3edc4010e9d102 Ingo Molnar         2017-02-02  753  }
c3edc4010e9d102 Ingo Molnar         2017-02-02  754  
a5dec9f82ab2ae4 Frederic Weisbecker 2021-07-26  755  #ifdef CONFIG_LOCKDEP
a5dec9f82ab2ae4 Frederic Weisbecker 2021-07-26 @756  extern void lockdep_assert_task_sighand_held(struct task_struct *task);
a5dec9f82ab2ae4 Frederic Weisbecker 2021-07-26  757  #else
a5dec9f82ab2ae4 Frederic Weisbecker 2021-07-26  758  static inline void lockdep_assert_task_sighand_held(struct task_struct *task) { }
a5dec9f82ab2ae4 Frederic Weisbecker 2021-07-26  759  #endif
a5dec9f82ab2ae4 Frederic Weisbecker 2021-07-26  760  

:::::: The code at line 756 was first introduced by commit
:::::: a5dec9f82ab2ae486119f0b0820ea16db3e522c3 posix-cpu-timers: Assert task sighand is locked while starting cputime counter

:::::: TO: Frederic Weisbecker <frederic@kernel.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
