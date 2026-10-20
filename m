Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496773;
	b=uIpJ9VTPsSnPfLeHMuzdf46LXvNJgaUyMu0WtaljKilIjRmE0W0w7kiFGODKH1wuzLrp
	 tYJHS+g4DJguBK5g8LGDJV3P4ShGASaVh9gpxuc87x1Sgd9NaNKbMnJQwJZq9oV6qV541
	 c6zGXqPEJRV4+W0qyafChiqZGhcCKcQu+L2BwvFhGpg/KXuGwUsdk278DKi9YMNNZH9FX
	 aZVDb/wQXcw7IJ0yI2uoirfgQeaLFOoWITkl2IkVKyaIhRe8LJbt5qNyH3Dfiq7cmcCm3
	 oH/OYiof1TlvU5JV0aee5aiy0a3AZDDGVr11Ngl6cZ63Pv2AEmajcRUrO773DcGGjHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496773;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ImZUChEeOkEOUH2/OwS70DBw4oZSAENqE/9AnZnMlUg=;
	b=y/LM+XvBT+sjUZW6/CbzAJU1KkD+rDDvn2Jx7a0A7oyJrGvoCNcMcrAP7RTbEhyPnqIt
	 99+tsfe4RsNlI7PlwDuwAuMsECNux/VHNABlb0W8EQsxypUucJc6abtbZ6Sz0u4AmIJiX
	 508xr16iKe7DSiYWDk/OU2sxsQLq8lUNr7hEuwRaESjO0jU/rESHamvMfSz60SOOR3BMr
	 YJKDL/5pMih+LW8j2DmI8tX9o6OVBKRwvfPwdrU/05uGHO4RFxkmGs9SEAV++ErXChqvN
	 KbnSUVcyLO010of1BxINWZyli1CKldLkib4WOXMM7XYAs98V02urLl7aUOSUplZtpZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="LUKDkh/m";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94699606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 11:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94699606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LUKDkh/m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792496772; x=1824032772;
  h=date:from:to:cc:subject:message-id;
  bh=aC9r/o4mkpA4Wyan8FKpE7QRka8OeLDaBZgGA+SEIYM=;
  b=LUKDkh/mh2GhTtJMpHWm0BD58lrzs61lxzvXilJEr6kG2gkbuHHjIEKZ
   jIGXX5qI614CWNlqPDEQ1wo/l/8EDT72YrGwwdBtYLUAnzCv3RLP1jikr
   qyHLQ+o3Rt4mqIhx8uszSDnnJ7aT4qy+aoTakILqpORs9yxaTEzetORKf
   Pgu1uEF8Ekgd0p9+b97EjcnIYcIel2MFSQ4MAvhdz9xBUXVJzSVaF60Fa
   vxH5aNEqOmvdS2JmXLvVOXdmzOFZtfjDNkMF0+7+T0UBScB7fQXYvr+xu
   ue7skBvMvUlwFv5gziywmwffewWyvfqMtjvQtprWKx2ZWz9/w/6YWuTcl
   A==;
X-CSE-ConnectionGUID: sECsnPNzSQeGDgbkGTK4Og==
X-CSE-MsgGUID: bLt81J7yT2yGHY070sW58g==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1210430"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1210430"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:46:11 -0700
X-CSE-ConnectionGUID: OvbMP1RsRN6JChC/IJTlRQ==
X-CSE-MsgGUID: /r9jXRE1TtqyH9RrIS0hoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4548463"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 20 Oct 2026 04:46:09 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ8IA-000000006GZ-2CH3;
	Tue, 20 Oct 2026 11:46:06 +0000
Date: Tue, 20 Oct 2026 13:45:46 +0200
From: kernel test robot <lkp@intel.com>
To: Ludwig Rydberg <ludwig.rydberg@gaisler.com>
Cc: oe-kbuild-all@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>
Subject: [linux-next:master 16823/17742] kernel/seccomp.c:437:9:
 sparse: sparse: cast removes address space '__rcu' of expression
Message-ID: <202610201358.qXIH5yFX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Ludwig,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d229ce89862b8e82d71a9e11d6f840ca272a6d6
commit: f8905074f3f3880ffa4a1f4328a391136d3cfecf [16823/17742] sparc32: add seccomp filter support
config: sparc-randconfig-r2305-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201358.qXIH5yFX-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201358.qXIH5yFX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201358.qXIH5yFX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/seccomp.c:1431:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1431:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1431:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1443:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1443:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1443:33: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/seccomp.c:437:9: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/seccomp.c:451:9: sparse: sparse: cast removes address space '__rcu' of expression
--
   kernel/fork.c:1695:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1695:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1695:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1704:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1704:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1704:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1705:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1705:9: sparse:     expected void const *
   kernel/fork.c:1705:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1706:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1706:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1706:33: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/fork.c:1804:9: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/fork.c:2123:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2123:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2123:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2127:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2127:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2127:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2466:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2466:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2466:32: sparse:     got struct task_struct *
   kernel/fork.c:2475:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2475:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2475:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2536:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2536:54: sparse:     expected struct list_head *head
   kernel/fork.c:2536:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2556:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2556:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2556:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2582:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2582:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2582:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2610:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2610:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2610:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2643:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2643:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2643:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2645:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2645:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2645:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3096:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3096:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3096:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3178:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3178:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3178:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:2177:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/linux/ftrace.h, include/linux/bpf.h, include/linux/security.h):
   include/linux/ptrace.h:211:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:211:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:211:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:211:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:211:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:211:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2532:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2533:59: sparse: sparse: dereference of noderef expression

vim +/__rcu +437 kernel/seccomp.c

1f41b450416e68 Kees Cook     2014-06-25  434  
1f41b450416e68 Kees Cook     2014-06-25  435  static inline bool seccomp_may_assign_mode(unsigned long seccomp_mode)
1f41b450416e68 Kees Cook     2014-06-25  436  {
69f6a34bdeea4f Guenter Roeck 2014-08-10 @437  	assert_spin_locked(&current->sighand->siglock);
dbd952127d11bb Kees Cook     2014-06-27  438  
1f41b450416e68 Kees Cook     2014-06-25  439  	if (current->seccomp.mode && current->seccomp.mode != seccomp_mode)
1f41b450416e68 Kees Cook     2014-06-25  440  		return false;
e2cfabdfd07564 Will Drewry   2012-04-12  441  
1f41b450416e68 Kees Cook     2014-06-25  442  	return true;
1f41b450416e68 Kees Cook     2014-06-25  443  }
1f41b450416e68 Kees Cook     2014-06-25  444  

:::::: The code at line 437 was first introduced by commit
:::::: 69f6a34bdeea4fec50bb90619bc9602973119572 seccomp: Replace BUG(!spin_is_locked()) with assert_spin_lock

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
