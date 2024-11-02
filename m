Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4A11ABEC5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 23:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730590446; cv=none; b=Ka0Vim282V+QbAwVDoQlbCZ5BDysO+zZJ/UvwaAluSSpf7jqbNz5jzQ1fts2KbHoQkAxL0ME6delif50C1CAR2aPNN7XLffr8MXvloB4HHA/nqTsQBei3lXqhDHA3uObT2TeJ5aeHIkP9wavLVXL5pjuibqIkdQIAMOIOQeB0bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730590446; c=relaxed/simple;
	bh=wQBbb6T3YRzO/dzpl6k2VVJINsal32U080NSYt0fxkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3Qy4xUs9W8g3nOtJaah0Vrmeu4xnQI4PPvqHFM3wIVEv4CF32bUctdkdiNQ7YVKj7rAY459wA4mWoUJUf2FfK6AVAmqaVAJ2PENgKgcPxF2yYaep1ZhfbmQbKNCpLLVwFCdhgre9AjY6/2//eQZ/S7GDwpWggM329qTLsFiokU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpUBL7Ve; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpUBL7Ve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730590445; x=1762126445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQBbb6T3YRzO/dzpl6k2VVJINsal32U080NSYt0fxkQ=;
  b=cpUBL7VefOkPMnfaXpNwrcftMlTn2nQf1nPKW9frJdMb6QmrPVRaicWC
   RU30aeG1P5AMKDLdu6P35Ug7riinDsko62ZjTpcZ/AZm4xh7UFrkeGQVo
   HuEFvT5tlmeO0wOvcA5+inRGwd/Ihsp0mcl3w7HEDgfqKWUjkUA9NF1EC
   yLRWhmqPg/Fr9o+xFFBBRpJ8styo0K3nB+nKgz55F0o1uWBdoS8YsPA/1
   DIRW4IneSYzg2htEmjCDBLSp0vhsvV7sP0PEnPIDob/0kExFGdnBQbD3R
   WTdOBC326Nz0j98Lr6FZEEOO4XJSmyZ5h2yFb4gjLGp+OwGf8yZnvOA1w
   w==;
X-CSE-ConnectionGUID: TH9qJ4YGSbSZGmaN+LZYnA==
X-CSE-MsgGUID: 8aiFujN/S0uVLbMEfm0ODg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41413224"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41413224"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 16:34:03 -0700
X-CSE-ConnectionGUID: gYgeX1PxQWmT4Uy2OAoUUQ==
X-CSE-MsgGUID: cifcm+lMRhuQieAcyVvRuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83178344"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Nov 2024 16:34:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Nd1-000jSH-0s;
	Sat, 02 Nov 2024 23:33:59 +0000
Date: Sun, 3 Nov 2024 07:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 104/107] kernel/signal.c:2002:39: error:
 'POSIX_TIMER_REQUEUE_PENDING' undeclared
Message-ID: <202411030744.COM9Qydr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   7dff83f0eba841872222db257facf9efac85dd2e
commit: a4329b49227494eab8b0dc4220b65c9c341ef3f9 [104/107] signal: Queue ignored posixtimers on ignore list
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241103/202411030744.COM9Qydr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030744.COM9Qydr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030744.COM9Qydr-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/signal.c: In function 'posixtimer_send_sigqueue':
>> kernel/signal.c:2002:39: error: 'POSIX_TIMER_REQUEUE_PENDING' undeclared (first use in this function)
    2002 |                 if (tmr->it_status == POSIX_TIMER_REQUEUE_PENDING) {
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/signal.c:2002:39: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/signal.c:2014:58: error: passing argument 2 of 'posixtimer_sig_ignore' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2014 |                                 posixtimer_sig_ignore(t, tmr);
         |                                                          ^~~
         |                                                          |
         |                                                          struct k_itimer *
   kernel/signal.c:734:84: note: expected 'struct sigqueue *' but argument is of type 'struct k_itimer *'
     734 | static inline void posixtimer_sig_ignore(struct task_struct *tsk, struct sigqueue *q);
         |                                                                   ~~~~~~~~~~~~~~~~~^
   kernel/signal.c: In function 'posixtimer_sig_ignore':
   kernel/signal.c:2059:31: error: 'POSIX_TIMER_REQUEUE_PENDING' undeclared (first use in this function)
    2059 |         if (tmr->it_status == POSIX_TIMER_REQUEUE_PENDING)
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/POSIX_TIMER_REQUEUE_PENDING +2002 kernel/signal.c

  1970	
  1971	int posixtimer_send_sigqueue(struct k_itimer *tmr)
  1972	{
  1973		struct sigqueue *q = &tmr->sigq;
  1974		int sig = q->info.si_signo;
  1975		struct task_struct *t;
  1976		unsigned long flags;
  1977		int result;
  1978	
  1979		guard(rcu)();
  1980	
  1981		t = posixtimer_get_target(tmr);
  1982		if (!t)
  1983			return -1;
  1984	
  1985		if (!likely(lock_task_sighand(t, &flags)))
  1986			return -1;
  1987	
  1988		/*
  1989		 * Update @tmr::sigqueue_seq for posix timer signals with sighand
  1990		 * locked to prevent a race against dequeue_signal().
  1991		 */
  1992		tmr->it_sigqueue_seq = tmr->it_signal_seq;
  1993	
  1994		if (!prepare_signal(sig, t, false)) {
  1995			result = TRACE_SIGNAL_IGNORED;
  1996	
  1997			/* Paranoia check. Try to survive. */
  1998			if (WARN_ON_ONCE(!list_empty(&q->list)))
  1999				goto out;
  2000	
  2001			/* Periodic timers with SIG_IGN are queued on the ignored list */
> 2002			if (tmr->it_status == POSIX_TIMER_REQUEUE_PENDING) {
  2003				/*
  2004				 * Already queued means the timer was rearmed after
  2005				 * the previous expiry got it on the ignore list.
  2006				 * Nothing to do for that case.
  2007				 */
  2008				if (hlist_unhashed(&tmr->ignored_list)) {
  2009					/*
  2010					 * Take a signal reference and queue it on
  2011					 * the ignored list.
  2012					 */
  2013					posixtimer_sigqueue_getref(q);
> 2014					posixtimer_sig_ignore(t, tmr);
  2015				}
  2016			} else if (!hlist_unhashed(&tmr->ignored_list)) {
  2017				/*
  2018				 * Covers the case where a timer was periodic and
  2019				 * then signal was ignored. Then it was rearmed as
  2020				 * oneshot timer. The previous signal is invalid
  2021				 * now, and the oneshot signal has to be dropped.
  2022				 * Remove it from the ignored list and drop the
  2023				 * reference count as the signal is not longer
  2024				 * queued.
  2025				 */
  2026				hlist_del_init(&tmr->ignored_list);
  2027				posixtimer_putref(tmr);
  2028			}
  2029			goto out;
  2030		}
  2031	
  2032		/* This should never happen and leaks a reference count */
  2033		if (WARN_ON_ONCE(!hlist_unhashed(&tmr->ignored_list)))
  2034			hlist_del_init(&tmr->ignored_list);
  2035	
  2036		if (unlikely(!list_empty(&q->list))) {
  2037			/* This holds a reference count already */
  2038			result = TRACE_SIGNAL_ALREADY_PENDING;
  2039			goto out;
  2040		}
  2041	
  2042		posixtimer_sigqueue_getref(q);
  2043		posixtimer_queue_sigqueue(q, t, tmr->it_pid_type);
  2044		result = TRACE_SIGNAL_DELIVERED;
  2045	out:
  2046		trace_signal_generate(sig, &q->info, t, tmr->it_pid_type != PIDTYPE_PID, result);
  2047		unlock_task_sighand(t, &flags);
  2048		return 0;
  2049	}
  2050	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
