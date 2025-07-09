Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DC1A92E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752097109; cv=none; b=UAsabqSEtiJPJkECrjMEjO3jZDa+L1nR1I8e7osCp+M9KmYGXgkQzk0V1YW6GOA/i3TobUwSgi5HZvREHYcqaNE3FWYtBMYJCrh+2j2bNZ9aiyaFvtIkTWBImt0J+hV1KKg6bFyOpu1EYVDiT6xPJqQE/8J47f+umVf/UDW61CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752097109; c=relaxed/simple;
	bh=EOEuYCpfHhpN71XiPc3SP4/dXAPh/Rr1YkyJ7qckDDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ejvfyIJ6aGxcwYD6Ndw+gMUjMF0Q8QlofPWOKI+61HKeRlnvChdR74h6zxnWiASIxuf1XB9jdEAXm4dhNFWNFyLOBNtxD4dOGNFAZI+27+R7iWLF4xJOLEpNbvpRA/KRL8KMkBtTpeR3KtFzW26YQuBESKs23Wu9Kzqz6m/1DpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBdtO2Q5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBdtO2Q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752097106; x=1783633106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOEuYCpfHhpN71XiPc3SP4/dXAPh/Rr1YkyJ7qckDDc=;
  b=DBdtO2Q5bcw2tFUbFs6zMofb2CVLZO2opzd0c5ToL0dfvwpgsnQMxyaq
   5Xj+0sN5E9gYFjIS2SkyMJU0/o+CzO1QJZ7ZFNRMYvMC9toXH2PePGGI2
   2TdiDSUT3412obmtKH/mizUw0eyu0c6qeeg+urdPPnHgUnvz3KwUnNlFm
   5sLod+qvqEMU34bWQCFaLFm74crpZvnviHMVMZtaRbU+lNdNtWY+cBvaC
   5qQnOsWgYGnyrOjYodpFyPG8gtcU6lYxSbtkIHWvomnUn86n2hdcZ7LeF
   qagwTYEH4X0VITn6np9Q9HNPrjLz0V5MF5UOXEcAJ/1WUCAOsawFwdYqB
   Q==;
X-CSE-ConnectionGUID: 9XZJ7J+QTOONwwuYcupieQ==
X-CSE-MsgGUID: eZ/BRqBpTcu2YStmI4Hz8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="79806346"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="79806346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 14:38:24 -0700
X-CSE-ConnectionGUID: FXncfOajQ6aU2aPiNRyycQ==
X-CSE-MsgGUID: eGjDpl3nQPGnfGlNS7ohlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="160220542"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jul 2025 14:38:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZcUe-00045v-1g;
	Wed, 09 Jul 2025 21:38:20 +0000
Date: Thu, 10 Jul 2025 05:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_need_resched 28/38]
 kernel/trace/rv/monitors/sleep/sleep.c:192:66: error: passing argument 1 of
 'check_trace_callback_type_sched_set_state_tp' from incompatible pointer
 type
Message-ID: <202507100541.CCLaVJkz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_rv_need_resched
head:   2757d6e4f86634f62d63be0cc7a16425b8df9b9a
commit: 9554517281ce68cccab62a1d5de8ea84ec7c5f27 [28/38] sched: Adapt sched tracepoints for RV task model
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250710/202507100541.CCLaVJkz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100541.CCLaVJkz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100541.CCLaVJkz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/rv/ltl_monitor.h:11,
                    from kernel/trace/rv/monitors/sleep/sleep.c:23:
   kernel/trace/rv/monitors/sleep/sleep.c: In function 'enable_sleep':
>> kernel/trace/rv/monitors/sleep/sleep.c:192:66: error: passing argument 1 of 'check_trace_callback_type_sched_set_state_tp' from incompatible pointer type [-Wincompatible-pointer-types]
     192 |         rv_attach_trace_probe("rtapp_sleep", sched_set_state_tp, handle_sched_set_state);
         |                                                                  ^~~~~~~~~~~~~~~~~~~~~~
         |                                                                  |
         |                                                                  void (*)(void *, struct task_struct *, int)
   include/rv/instrumentation.h:18:48: note: in definition of macro 'rv_attach_trace_probe'
      18 |                 check_trace_callback_type_##tp(rv_handler);                             \
         |                                                ^~~~~~~~~~
   In file included from kernel/trace/rv/monitors/sleep/sleep.c:3:
   include/linux/tracepoint.h:260:49: note: expected 'void (*)(void *, struct task_struct *, int,  bool)' {aka 'void (*)(void *, struct task_struct *, int,  _Bool)'} but argument is of type 'void (*)(void *, struct task_struct *, int)'
     260 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                          ~~~~~~~^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:472:9: note: in expansion of macro '__DECLARE_TRACE'
     472 |         __DECLARE_TRACE(name##_tp, PARAMS(proto), PARAMS(args),         \
         |         ^~~~~~~~~~~~~~~
   include/trace/events/sched.h:897:1: note: in expansion of macro 'DECLARE_TRACE_CONDITION'
     897 | DECLARE_TRACE_CONDITION(sched_set_state,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/rv/monitors/sleep/sleep.c:85:13: note: 'handle_sched_set_state' declared here
      85 | static void handle_sched_set_state(void *data, struct task_struct *task, int state)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:31,
                    from include/linux/interrupt.h:6,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from kernel/trace/rv/monitors/sleep/sleep.c:2:
>> kernel/trace/rv/monitors/sleep/sleep.c:192:66: error: passing argument 1 of 'register_trace_sched_set_state_tp' from incompatible pointer type [-Wincompatible-pointer-types]
     192 |         rv_attach_trace_probe("rtapp_sleep", sched_set_state_tp, handle_sched_set_state);
         |                                                                  ^~~~~~~~~~~~~~~~~~~~~~
         |                                                                  |
         |                                                                  void (*)(void *, struct task_struct *, int)
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/rv/instrumentation.h:19:17: note: in expansion of macro 'WARN_ONCE'
      19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),                        \
         |                 ^~~~~~~~~
   kernel/trace/rv/monitors/sleep/sleep.c:192:9: note: in expansion of macro 'rv_attach_trace_probe'
     192 |         rv_attach_trace_probe("rtapp_sleep", sched_set_state_tp, handle_sched_set_state);
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:241:38: note: expected 'void (*)(void *, struct task_struct *, int,  bool)' {aka 'void (*)(void *, struct task_struct *, int,  _Bool)'} but argument is of type 'void (*)(void *, struct task_struct *, int)'
     241 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:472:9: note: in expansion of macro '__DECLARE_TRACE'
     472 |         __DECLARE_TRACE(name##_tp, PARAMS(proto), PARAMS(args),         \
         |         ^~~~~~~~~~~~~~~
   include/trace/events/sched.h:897:1: note: in expansion of macro 'DECLARE_TRACE_CONDITION'
     897 | DECLARE_TRACE_CONDITION(sched_set_state,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/rv/monitors/sleep/sleep.c:85:13: note: 'handle_sched_set_state' declared here
      85 | static void handle_sched_set_state(void *data, struct task_struct *task, int state)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/rv/monitors/sleep/sleep.c: In function 'disable_sleep':
>> kernel/trace/rv/monitors/sleep/sleep.c:205:66: error: passing argument 1 of 'unregister_trace_sched_set_state_tp' from incompatible pointer type [-Wincompatible-pointer-types]
     205 |         rv_detach_trace_probe("rtapp_sleep", sched_set_state_tp, handle_sched_set_state);
         |                                                                  ^~~~~~~~~~~~~~~~~~~~~~
         |                                                                  |
         |                                                                  void (*)(void *, struct task_struct *, int)
   include/rv/instrumentation.h:28:39: note: in definition of macro 'rv_detach_trace_probe'
      28 |                 unregister_trace_##tp(rv_handler, NULL);                                \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:254:40: note: expected 'void (*)(void *, struct task_struct *, int,  bool)' {aka 'void (*)(void *, struct task_struct *, int,  _Bool)'} but argument is of type 'void (*)(void *, struct task_struct *, int)'
     254 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:472:9: note: in expansion of macro '__DECLARE_TRACE'
     472 |         __DECLARE_TRACE(name##_tp, PARAMS(proto), PARAMS(args),         \
         |         ^~~~~~~~~~~~~~~
   include/trace/events/sched.h:897:1: note: in expansion of macro 'DECLARE_TRACE_CONDITION'
     897 | DECLARE_TRACE_CONDITION(sched_set_state,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/rv/monitors/sleep/sleep.c:85:13: note: 'handle_sched_set_state' declared here
      85 | static void handle_sched_set_state(void *data, struct task_struct *task, int state)
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/check_trace_callback_type_sched_set_state_tp +192 kernel/trace/rv/monitors/sleep/sleep.c

927a5669f2d659 Nam Cao 2025-07-04   21  
927a5669f2d659 Nam Cao 2025-07-04   22  #include "sleep.h"
927a5669f2d659 Nam Cao 2025-07-04  @23  #include <rv/ltl_monitor.h>
927a5669f2d659 Nam Cao 2025-07-04   24  
927a5669f2d659 Nam Cao 2025-07-04   25  static void ltl_atoms_fetch(struct task_struct *task, struct ltl_monitor *mon)
927a5669f2d659 Nam Cao 2025-07-04   26  {
927a5669f2d659 Nam Cao 2025-07-04   27  	/*
927a5669f2d659 Nam Cao 2025-07-04   28  	 * This includes "actual" real-time tasks and also PI-boosted
927a5669f2d659 Nam Cao 2025-07-04   29  	 * tasks. A task being PI-boosted means it is blocking an "actual"
927a5669f2d659 Nam Cao 2025-07-04   30  	 * real-task, therefore it should also obey the monitor's rule,
927a5669f2d659 Nam Cao 2025-07-04   31  	 * otherwise the "actual" real-task may be delayed.
927a5669f2d659 Nam Cao 2025-07-04   32  	 */
927a5669f2d659 Nam Cao 2025-07-04   33  	ltl_atom_set(mon, LTL_RT, rt_or_dl_task(task));
927a5669f2d659 Nam Cao 2025-07-04   34  }
927a5669f2d659 Nam Cao 2025-07-04   35  
927a5669f2d659 Nam Cao 2025-07-04   36  static void ltl_atoms_init(struct task_struct *task, struct ltl_monitor *mon, bool task_creation)
927a5669f2d659 Nam Cao 2025-07-04   37  {
927a5669f2d659 Nam Cao 2025-07-04   38  	ltl_atom_set(mon, LTL_SLEEP, false);
927a5669f2d659 Nam Cao 2025-07-04   39  	ltl_atom_set(mon, LTL_WAKE, false);
927a5669f2d659 Nam Cao 2025-07-04   40  	ltl_atom_set(mon, LTL_ABORT_SLEEP, false);
927a5669f2d659 Nam Cao 2025-07-04   41  	ltl_atom_set(mon, LTL_WOKEN_BY_HARDIRQ, false);
927a5669f2d659 Nam Cao 2025-07-04   42  	ltl_atom_set(mon, LTL_WOKEN_BY_NMI, false);
927a5669f2d659 Nam Cao 2025-07-04   43  	ltl_atom_set(mon, LTL_WOKEN_BY_EQUAL_OR_HIGHER_PRIO, false);
927a5669f2d659 Nam Cao 2025-07-04   44  
927a5669f2d659 Nam Cao 2025-07-04   45  	if (task_creation) {
927a5669f2d659 Nam Cao 2025-07-04   46  		ltl_atom_set(mon, LTL_KTHREAD_SHOULD_STOP, false);
927a5669f2d659 Nam Cao 2025-07-04   47  		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_MONOTONIC, false);
927a5669f2d659 Nam Cao 2025-07-04   48  		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI, false);
927a5669f2d659 Nam Cao 2025-07-04   49  		ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, false);
927a5669f2d659 Nam Cao 2025-07-04   50  		ltl_atom_set(mon, LTL_CLOCK_NANOSLEEP, false);
927a5669f2d659 Nam Cao 2025-07-04   51  		ltl_atom_set(mon, LTL_FUTEX_WAIT, false);
927a5669f2d659 Nam Cao 2025-07-04   52  		ltl_atom_set(mon, LTL_FUTEX_LOCK_PI, false);
927a5669f2d659 Nam Cao 2025-07-04   53  		ltl_atom_set(mon, LTL_BLOCK_ON_RT_MUTEX, false);
927a5669f2d659 Nam Cao 2025-07-04   54  	}
927a5669f2d659 Nam Cao 2025-07-04   55  
927a5669f2d659 Nam Cao 2025-07-04   56  	if (task->flags & PF_KTHREAD) {
927a5669f2d659 Nam Cao 2025-07-04   57  		ltl_atom_set(mon, LTL_KERNEL_THREAD, true);
927a5669f2d659 Nam Cao 2025-07-04   58  
927a5669f2d659 Nam Cao 2025-07-04   59  		/* kernel tasks do not do syscall */
927a5669f2d659 Nam Cao 2025-07-04   60  		ltl_atom_set(mon, LTL_FUTEX_WAIT, false);
927a5669f2d659 Nam Cao 2025-07-04   61  		ltl_atom_set(mon, LTL_FUTEX_LOCK_PI, false);
927a5669f2d659 Nam Cao 2025-07-04   62  		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_MONOTONIC, false);
927a5669f2d659 Nam Cao 2025-07-04   63  		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI, false);
927a5669f2d659 Nam Cao 2025-07-04   64  		ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, false);
927a5669f2d659 Nam Cao 2025-07-04   65  		ltl_atom_set(mon, LTL_CLOCK_NANOSLEEP, false);
927a5669f2d659 Nam Cao 2025-07-04   66  
927a5669f2d659 Nam Cao 2025-07-04   67  		if (strstarts(task->comm, "migration/"))
927a5669f2d659 Nam Cao 2025-07-04   68  			ltl_atom_set(mon, LTL_TASK_IS_MIGRATION, true);
927a5669f2d659 Nam Cao 2025-07-04   69  		else
927a5669f2d659 Nam Cao 2025-07-04   70  			ltl_atom_set(mon, LTL_TASK_IS_MIGRATION, false);
927a5669f2d659 Nam Cao 2025-07-04   71  
927a5669f2d659 Nam Cao 2025-07-04   72  		if (strstarts(task->comm, "rcu"))
927a5669f2d659 Nam Cao 2025-07-04   73  			ltl_atom_set(mon, LTL_TASK_IS_RCU, true);
927a5669f2d659 Nam Cao 2025-07-04   74  		else
927a5669f2d659 Nam Cao 2025-07-04   75  			ltl_atom_set(mon, LTL_TASK_IS_RCU, false);
927a5669f2d659 Nam Cao 2025-07-04   76  	} else {
927a5669f2d659 Nam Cao 2025-07-04   77  		ltl_atom_set(mon, LTL_KTHREAD_SHOULD_STOP, false);
927a5669f2d659 Nam Cao 2025-07-04   78  		ltl_atom_set(mon, LTL_KERNEL_THREAD, false);
927a5669f2d659 Nam Cao 2025-07-04   79  		ltl_atom_set(mon, LTL_TASK_IS_RCU, false);
927a5669f2d659 Nam Cao 2025-07-04   80  		ltl_atom_set(mon, LTL_TASK_IS_MIGRATION, false);
927a5669f2d659 Nam Cao 2025-07-04   81  	}
927a5669f2d659 Nam Cao 2025-07-04   82  
927a5669f2d659 Nam Cao 2025-07-04   83  }
927a5669f2d659 Nam Cao 2025-07-04   84  
927a5669f2d659 Nam Cao 2025-07-04  @85  static void handle_sched_set_state(void *data, struct task_struct *task, int state)
927a5669f2d659 Nam Cao 2025-07-04   86  {
927a5669f2d659 Nam Cao 2025-07-04   87  	if (state & TASK_INTERRUPTIBLE)
927a5669f2d659 Nam Cao 2025-07-04   88  		ltl_atom_pulse(task, LTL_SLEEP, true);
927a5669f2d659 Nam Cao 2025-07-04   89  	else if (state == TASK_RUNNING)
927a5669f2d659 Nam Cao 2025-07-04   90  		ltl_atom_pulse(task, LTL_ABORT_SLEEP, true);
927a5669f2d659 Nam Cao 2025-07-04   91  }
927a5669f2d659 Nam Cao 2025-07-04   92  
927a5669f2d659 Nam Cao 2025-07-04   93  static void handle_sched_wakeup(void *data, struct task_struct *task)
927a5669f2d659 Nam Cao 2025-07-04   94  {
927a5669f2d659 Nam Cao 2025-07-04   95  	ltl_atom_pulse(task, LTL_WAKE, true);
927a5669f2d659 Nam Cao 2025-07-04   96  }
927a5669f2d659 Nam Cao 2025-07-04   97  
927a5669f2d659 Nam Cao 2025-07-04   98  static void handle_sched_waking(void *data, struct task_struct *task)
927a5669f2d659 Nam Cao 2025-07-04   99  {
927a5669f2d659 Nam Cao 2025-07-04  100  	if (this_cpu_read(hardirq_context)) {
927a5669f2d659 Nam Cao 2025-07-04  101  		ltl_atom_pulse(task, LTL_WOKEN_BY_HARDIRQ, true);
927a5669f2d659 Nam Cao 2025-07-04  102  	} else if (in_task()) {
927a5669f2d659 Nam Cao 2025-07-04  103  		if (current->prio <= task->prio)
927a5669f2d659 Nam Cao 2025-07-04  104  			ltl_atom_pulse(task, LTL_WOKEN_BY_EQUAL_OR_HIGHER_PRIO, true);
927a5669f2d659 Nam Cao 2025-07-04  105  	} else if (in_nmi()) {
927a5669f2d659 Nam Cao 2025-07-04  106  		ltl_atom_pulse(task, LTL_WOKEN_BY_NMI, true);
927a5669f2d659 Nam Cao 2025-07-04  107  	}
927a5669f2d659 Nam Cao 2025-07-04  108  }
927a5669f2d659 Nam Cao 2025-07-04  109  
927a5669f2d659 Nam Cao 2025-07-04  110  static void handle_contention_begin(void *data, void *lock, unsigned int flags)
927a5669f2d659 Nam Cao 2025-07-04  111  {
927a5669f2d659 Nam Cao 2025-07-04  112  	if (flags & LCB_F_RT)
927a5669f2d659 Nam Cao 2025-07-04  113  		ltl_atom_update(current, LTL_BLOCK_ON_RT_MUTEX, true);
927a5669f2d659 Nam Cao 2025-07-04  114  }
927a5669f2d659 Nam Cao 2025-07-04  115  
927a5669f2d659 Nam Cao 2025-07-04  116  static void handle_contention_end(void *data, void *lock, int ret)
927a5669f2d659 Nam Cao 2025-07-04  117  {
927a5669f2d659 Nam Cao 2025-07-04  118  	ltl_atom_update(current, LTL_BLOCK_ON_RT_MUTEX, false);
927a5669f2d659 Nam Cao 2025-07-04  119  }
927a5669f2d659 Nam Cao 2025-07-04  120  
927a5669f2d659 Nam Cao 2025-07-04  121  static void handle_sys_enter(void *data, struct pt_regs *regs, long id)
927a5669f2d659 Nam Cao 2025-07-04  122  {
927a5669f2d659 Nam Cao 2025-07-04  123  	struct ltl_monitor *mon;
927a5669f2d659 Nam Cao 2025-07-04  124  	unsigned long args[6];
927a5669f2d659 Nam Cao 2025-07-04  125  	int op, cmd;
927a5669f2d659 Nam Cao 2025-07-04  126  
927a5669f2d659 Nam Cao 2025-07-04  127  	mon = ltl_get_monitor(current);
927a5669f2d659 Nam Cao 2025-07-04  128  
927a5669f2d659 Nam Cao 2025-07-04  129  	switch (id) {
927a5669f2d659 Nam Cao 2025-07-04  130  	case __NR_clock_nanosleep:
927a5669f2d659 Nam Cao 2025-07-04  131  #ifdef __NR_clock_nanosleep_time64
927a5669f2d659 Nam Cao 2025-07-04  132  	case __NR_clock_nanosleep_time64:
927a5669f2d659 Nam Cao 2025-07-04  133  #endif
927a5669f2d659 Nam Cao 2025-07-04  134  		syscall_get_arguments(current, regs, args);
927a5669f2d659 Nam Cao 2025-07-04  135  		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_MONOTONIC, args[0] == CLOCK_MONOTONIC);
927a5669f2d659 Nam Cao 2025-07-04  136  		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI, args[0] == CLOCK_TAI);
927a5669f2d659 Nam Cao 2025-07-04  137  		ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, args[1] == TIMER_ABSTIME);
927a5669f2d659 Nam Cao 2025-07-04  138  		ltl_atom_update(current, LTL_CLOCK_NANOSLEEP, true);
927a5669f2d659 Nam Cao 2025-07-04  139  		break;
927a5669f2d659 Nam Cao 2025-07-04  140  
927a5669f2d659 Nam Cao 2025-07-04  141  	case __NR_futex:
927a5669f2d659 Nam Cao 2025-07-04  142  #ifdef __NR_futex_time64
927a5669f2d659 Nam Cao 2025-07-04  143  	case __NR_futex_time64:
927a5669f2d659 Nam Cao 2025-07-04  144  #endif
927a5669f2d659 Nam Cao 2025-07-04  145  		syscall_get_arguments(current, regs, args);
927a5669f2d659 Nam Cao 2025-07-04  146  		op = args[1];
927a5669f2d659 Nam Cao 2025-07-04  147  		cmd = op & FUTEX_CMD_MASK;
927a5669f2d659 Nam Cao 2025-07-04  148  
927a5669f2d659 Nam Cao 2025-07-04  149  		switch (cmd) {
927a5669f2d659 Nam Cao 2025-07-04  150  		case FUTEX_LOCK_PI:
927a5669f2d659 Nam Cao 2025-07-04  151  		case FUTEX_LOCK_PI2:
927a5669f2d659 Nam Cao 2025-07-04  152  			ltl_atom_update(current, LTL_FUTEX_LOCK_PI, true);
927a5669f2d659 Nam Cao 2025-07-04  153  			break;
927a5669f2d659 Nam Cao 2025-07-04  154  		case FUTEX_WAIT:
927a5669f2d659 Nam Cao 2025-07-04  155  		case FUTEX_WAIT_BITSET:
927a5669f2d659 Nam Cao 2025-07-04  156  		case FUTEX_WAIT_REQUEUE_PI:
927a5669f2d659 Nam Cao 2025-07-04  157  			ltl_atom_update(current, LTL_FUTEX_WAIT, true);
927a5669f2d659 Nam Cao 2025-07-04  158  			break;
927a5669f2d659 Nam Cao 2025-07-04  159  		}
927a5669f2d659 Nam Cao 2025-07-04  160  		break;
927a5669f2d659 Nam Cao 2025-07-04  161  	}
927a5669f2d659 Nam Cao 2025-07-04  162  }
927a5669f2d659 Nam Cao 2025-07-04  163  
927a5669f2d659 Nam Cao 2025-07-04  164  static void handle_sys_exit(void *data, struct pt_regs *regs, long ret)
927a5669f2d659 Nam Cao 2025-07-04  165  {
927a5669f2d659 Nam Cao 2025-07-04  166  	struct ltl_monitor *mon = ltl_get_monitor(current);
927a5669f2d659 Nam Cao 2025-07-04  167  
927a5669f2d659 Nam Cao 2025-07-04  168  	ltl_atom_set(mon, LTL_FUTEX_LOCK_PI, false);
927a5669f2d659 Nam Cao 2025-07-04  169  	ltl_atom_set(mon, LTL_FUTEX_WAIT, false);
927a5669f2d659 Nam Cao 2025-07-04  170  	ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_MONOTONIC, false);
927a5669f2d659 Nam Cao 2025-07-04  171  	ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI, false);
927a5669f2d659 Nam Cao 2025-07-04  172  	ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, false);
927a5669f2d659 Nam Cao 2025-07-04  173  	ltl_atom_update(current, LTL_CLOCK_NANOSLEEP, false);
927a5669f2d659 Nam Cao 2025-07-04  174  }
927a5669f2d659 Nam Cao 2025-07-04  175  
927a5669f2d659 Nam Cao 2025-07-04  176  static void handle_kthread_stop(void *data, struct task_struct *task)
927a5669f2d659 Nam Cao 2025-07-04  177  {
927a5669f2d659 Nam Cao 2025-07-04  178  	/* FIXME: this could race with other tracepoint handlers */
927a5669f2d659 Nam Cao 2025-07-04  179  	ltl_atom_update(task, LTL_KTHREAD_SHOULD_STOP, true);
927a5669f2d659 Nam Cao 2025-07-04  180  }
927a5669f2d659 Nam Cao 2025-07-04  181  
927a5669f2d659 Nam Cao 2025-07-04  182  static int enable_sleep(void)
927a5669f2d659 Nam Cao 2025-07-04  183  {
927a5669f2d659 Nam Cao 2025-07-04  184  	int retval;
927a5669f2d659 Nam Cao 2025-07-04  185  
927a5669f2d659 Nam Cao 2025-07-04  186  	retval = ltl_monitor_init();
927a5669f2d659 Nam Cao 2025-07-04  187  	if (retval)
927a5669f2d659 Nam Cao 2025-07-04  188  		return retval;
927a5669f2d659 Nam Cao 2025-07-04  189  
927a5669f2d659 Nam Cao 2025-07-04  190  	rv_attach_trace_probe("rtapp_sleep", sched_waking, handle_sched_waking);
927a5669f2d659 Nam Cao 2025-07-04  191  	rv_attach_trace_probe("rtapp_sleep", sched_wakeup, handle_sched_wakeup);
927a5669f2d659 Nam Cao 2025-07-04 @192  	rv_attach_trace_probe("rtapp_sleep", sched_set_state_tp, handle_sched_set_state);
927a5669f2d659 Nam Cao 2025-07-04  193  	rv_attach_trace_probe("rtapp_sleep", contention_begin, handle_contention_begin);
927a5669f2d659 Nam Cao 2025-07-04  194  	rv_attach_trace_probe("rtapp_sleep", contention_end, handle_contention_end);
927a5669f2d659 Nam Cao 2025-07-04  195  	rv_attach_trace_probe("rtapp_sleep", sched_kthread_stop, handle_kthread_stop);
927a5669f2d659 Nam Cao 2025-07-04  196  	rv_attach_trace_probe("rtapp_sleep", sys_enter, handle_sys_enter);
927a5669f2d659 Nam Cao 2025-07-04  197  	rv_attach_trace_probe("rtapp_sleep", sys_exit, handle_sys_exit);
927a5669f2d659 Nam Cao 2025-07-04  198  	return 0;
927a5669f2d659 Nam Cao 2025-07-04  199  }
927a5669f2d659 Nam Cao 2025-07-04  200  
927a5669f2d659 Nam Cao 2025-07-04  201  static void disable_sleep(void)
927a5669f2d659 Nam Cao 2025-07-04  202  {
927a5669f2d659 Nam Cao 2025-07-04  203  	rv_detach_trace_probe("rtapp_sleep", sched_waking, handle_sched_waking);
927a5669f2d659 Nam Cao 2025-07-04  204  	rv_detach_trace_probe("rtapp_sleep", sched_wakeup, handle_sched_wakeup);
927a5669f2d659 Nam Cao 2025-07-04 @205  	rv_detach_trace_probe("rtapp_sleep", sched_set_state_tp, handle_sched_set_state);
927a5669f2d659 Nam Cao 2025-07-04  206  	rv_detach_trace_probe("rtapp_sleep", contention_begin, handle_contention_begin);
927a5669f2d659 Nam Cao 2025-07-04  207  	rv_detach_trace_probe("rtapp_sleep", contention_end, handle_contention_end);
927a5669f2d659 Nam Cao 2025-07-04  208  	rv_detach_trace_probe("rtapp_sleep", sched_kthread_stop, handle_kthread_stop);
927a5669f2d659 Nam Cao 2025-07-04  209  	rv_detach_trace_probe("rtapp_sleep", sys_enter, handle_sys_enter);
927a5669f2d659 Nam Cao 2025-07-04  210  	rv_detach_trace_probe("rtapp_sleep", sys_exit, handle_sys_exit);
927a5669f2d659 Nam Cao 2025-07-04  211  
927a5669f2d659 Nam Cao 2025-07-04  212  	ltl_monitor_destroy();
927a5669f2d659 Nam Cao 2025-07-04  213  }
927a5669f2d659 Nam Cao 2025-07-04  214  

:::::: The code at line 192 was first introduced by commit
:::::: 927a5669f2d65967036d1665fef41fd22b13a105 rv: Add rtapp_sleep monitor

:::::: TO: Nam Cao <namcao@linutronix.de>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
