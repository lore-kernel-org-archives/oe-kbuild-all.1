Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4100C803
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 04:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686024660; x=1717560660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uJi8anE4IkOQrfyBiu1MA1pZ4L4g/vxaEDSpdRExgwY=;
  b=ar96lfp37Y1gmR0DEuFaqmCBRPtFAH6W9u3i6rkVmm0BF8w1DKAZjhxt
   QLZOb/SyPPGqk0IF0HRUE5QxZmgx97ym1U8GUYOdhASZJHPG8PP02UiFA
   N2bwqrVNJXzOEtcmVtrEPqOOQr4GfDo/eGEnAAOx0CSbY+diMhp35PxQ6
   0++5Uu8/t6WfsKhgpIc/OO//XTw6I6Nze+4rwgenpBCw8rugJvWi91fw/
   bkB1ZNJdcLiKKqzHL5cV1UbOyP0kjyvfkgrx9nNdnwLGp7G+OsTFMJSXL
   Cp5eTdKHEmKgx1LnwfkcdOu9ijweaVH+SKtRj5G/XO5RO7Otf/gL+cGk3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384864408"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="384864408"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 21:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738603909"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="738603909"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 21:10:55 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6O22-0004pZ-2t;
	Tue, 06 Jun 2023 04:10:54 +0000
Date: Tue, 6 Jun 2023 12:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 59/61] kernel/signal.c:1973:6: error:
 conflicting types for 'posixtimer_send_sigqueue'; have 'void(struct k_itimer
 *)'
Message-ID: <202306061214.iVoRW6gI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   16a20adb1e0ae19ad42041a7d1b5583e4705ca0c
commit: 233b6af26247fdf59593dcbab2aa3bdbc63bdb3a [59/61] posix-timers: Cleanup SIG_IGN workaround leftovers
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230606/202306061214.iVoRW6gI-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=233b6af26247fdf59593dcbab2aa3bdbc63bdb3a
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel timers/posix
        git checkout 233b6af26247fdf59593dcbab2aa3bdbc63bdb3a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061214.iVoRW6gI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/signal.c:1973:6: error: conflicting types for 'posixtimer_send_sigqueue'; have 'void(struct k_itimer *)'
    1973 | void posixtimer_send_sigqueue(struct k_itimer *tmr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/sched.h:34,
                    from include/linux/sched/mm.h:7,
                    from kernel/signal.c:17:
   include/linux/posix-timers.h:281:12: note: previous declaration of 'posixtimer_send_sigqueue' with type 'int(struct k_itimer *)'
     281 | extern int posixtimer_send_sigqueue(struct k_itimer *tmr);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:7,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from kernel/signal.c:14:
   kernel/signal.c: In function 'posixtimer_sig_unignore':
   kernel/signal.c:2096:61: error: 'kernel_siginfo_t' {aka 'struct kernel_siginfo'} has no member named 'list'
    2096 |                 if (WARN_ON_ONCE(!list_empty(&tmr->sigq.info.list)))
         |                                                             ^
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/signal.c:2096:21: note: in expansion of macro 'WARN_ON_ONCE'
    2096 |                 if (WARN_ON_ONCE(!list_empty(&tmr->sigq.info.list)))
         |                     ^~~~~~~~~~~~


vim +1973 kernel/signal.c

  1972	
> 1973	void posixtimer_send_sigqueue(struct k_itimer *tmr)
  1974	{
  1975		struct sigqueue *q = &tmr->sigq;
  1976		int sig = q->info.si_signo;
  1977		struct task_struct *t;
  1978		unsigned long flags;
  1979		int result;
  1980	
  1981		rcu_read_lock();
  1982	
  1983		t = posixtimer_get_target(tmr);
  1984		if (!t)
  1985			goto ret;
  1986	
  1987		if (!likely(lock_task_sighand(t, &flags)))
  1988			goto ret;
  1989	
  1990		/*
  1991		 * Update @q::info::si_sys_private for posix timer signals with
  1992		 * sighand locked to prevent a race against dequeue_signal() which
  1993		 * decides based on si_sys_private whether to invoke
  1994		 * posixtimer_rearm() or not.
  1995		 */
  1996		q->info.si_sys_private = tmr->it_signal_seq;
  1997	
  1998		/*
  1999		 * Set the overrun count to zero unconditionally. The posix timer
  2000		 * code does not self rearm periodic timers. They are rearmed from
  2001		 * dequeue_signal().
  2002		 *
  2003		 * But there is a situation where @q is already enqueued:
  2004		 *
  2005		 * 1) timer_settime()
  2006		 *      arm_timer()
  2007		 * 2) timer_expires()
  2008		 *      send_sigqueue(@q)
  2009		 *        enqueue(@q)
  2010		 * 3) timer_settime()
  2011		 *      arm_timer()
  2012		 * 4) timer_expires()
  2013		 *      send_sigqueue(@q) <- Observes @q already queued
  2014		 *
  2015		 * In this case incrementing si_overrun does not make sense because
  2016		 * there is no relationship between timer_settime() #1 and #2.
  2017		 *
  2018		 * The POSIX specification is useful as always: "The effect of
  2019		 * disarming or resetting a timer with pending expiration
  2020		 * notifications is unspecified."
  2021		 *
  2022		 * Just do the sensible thing and reset the overrun.
  2023		 */
  2024		q->info.si_overrun = 0;
  2025	
  2026		if (!prepare_signal(sig, t, false)) {
  2027			result = TRACE_SIGNAL_IGNORED;
  2028	
  2029			/* Paranoia check. Try to survive. */
  2030			if (WARN_ON_ONCE(!list_empty(&q->list)))
  2031				goto out;
  2032	
  2033			if (hlist_unhashed(&tmr->ignored_list)) {
  2034				hlist_add_head(&tmr->ignored_list, &t->signal->ignored_posix_timers);
  2035				posixtimer_sigqueue_getref(q);
  2036			}
  2037			goto out;
  2038		}
  2039	
  2040		/* This should never happen and leaks a reference count */
  2041		if (WARN_ON_ONCE(!hlist_unhashed(&tmr->ignored_list)))
  2042			hlist_del_init(&tmr->ignored_list);
  2043	
  2044		if (unlikely(!list_empty(&q->list))) {
  2045			/* This holds a reference count already */
  2046			result = TRACE_SIGNAL_ALREADY_PENDING;
  2047			goto out;
  2048		}
  2049	
  2050		posixtimer_sigqueue_getref(q);
  2051		posixtimer_queue_sigqueue(q, t, tmr->it_pid_type);
  2052		result = TRACE_SIGNAL_DELIVERED;
  2053	out:
  2054		trace_signal_generate(sig, &q->info, t, tmr->it_pid_type != PIDTYPE_PID, result);
  2055		unlock_task_sighand(t, &flags);
  2056	ret:
  2057		rcu_read_unlock();
  2058	}
  2059	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
