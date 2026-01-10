Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B74B21771C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 23:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768087295; cv=none; b=D1+hAsllI0TiaIbcEOa/Ck0itFkkE6oHGyS9Hpbc5qF9dM4+j6bV6bxVJH1XaJO/LuKxBlFFpcly55tX3MaeFm3WPJYnQKLrmb6sn16uz6d1RVQSYnzcGVNY9LB4C3J1etUt7ToufwHnChx8aEYeQR7Ndsu6HgY7Xw+cUTSBUtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768087295; c=relaxed/simple;
	bh=R3p0Cp+rL+FJlR0tRknLokpijswtEw9bXdLycLtjcLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tf0PKOV6jAv/rP7sI2IjRXB1xk/u3e8OS/cjaJlo5I9x8oGBo5ti7PBPshdJAWafgUkiALR6VilayNZXtVjOvet+duRhzWxnKfWVq3xot+HYrtQZ296wYYa+uLJHBLCJAM+DLWpUK9Lqq1rvtQutPjfguQnrYHJGgEmVBovp6Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izvVpP7G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izvVpP7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768087294; x=1799623294;
  h=date:from:to:cc:subject:message-id;
  bh=R3p0Cp+rL+FJlR0tRknLokpijswtEw9bXdLycLtjcLs=;
  b=izvVpP7GLuI/LTxN6Tt+EJRpvOtpTQzPNfHoQdO02jes6K3KDWnoqS0t
   B3qhjMrJFfUWx9EHUwtZj1QpUPDedhogcrbd5SLWUmmcBbdoYen/LUcJa
   uKnU++aLiylL733SjaV7veO7y72rF3GkAwniIPxxfOFm38O8Ty8qEyJjz
   jDOkcqZ6LuVaVuVQ11ir5Toh2h4EjQgJtfe6S0zA+BXzghsGtno1mP67o
   8LCdTjaHSngpPNd1dkQM9LmDr2PDjT0Lcze7TUNS82rXje6nSrry1GnDe
   LnsE1LW7AjNhLo9SJG2t5HHrXIQKcWaHruHo+Dw6pRDPYcHngR7Tjy3r9
   A==;
X-CSE-ConnectionGUID: 8EkltICmTyyvkYqsePSdvw==
X-CSE-MsgGUID: 7ONuJvfzTsmK22A/+MJKsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="94893761"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="94893761"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 15:21:32 -0800
X-CSE-ConnectionGUID: axptTYKfThu3Zq0ykD+QAA==
X-CSE-MsgGUID: YvFjAtV+SBaVLhxLwPXZpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="203383272"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2026 15:21:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veiGt-000000009JC-3qKo;
	Sat, 10 Jan 2026 23:21:27 +0000
Date: Sun, 11 Jan 2026 07:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [tip:locking/core 22/43] lib/test_context-analysis.c:483:9:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202601110728.MK2SXeDp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   a45026cef17d1080c985adf28234d6c8475ad66f
commit: d3febf16dee28a74b01ba43195ee4965edb6208f [22/43] locking/local_lock: Support Clang's context analysis
config: riscv-randconfig-r123-20260111 (https://download.01.org/0day-ci/archive/20260111/202601110728.MK2SXeDp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110728.MK2SXeDp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601110728.MK2SXeDp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   lib/test_context-analysis.c: note: in included file (through include/linux/local_lock.h):
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   lib/test_context-analysis.c:148:1: sparse: sparse: undefined identifier '__cond_acquire'
>> lib/test_context-analysis.c:483:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:483:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:483:9: sparse:     got struct local_lock [noderef] __percpu *
>> lib/test_context-analysis.c:483:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:483:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:483:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:485:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:485:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:485:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:485:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:485:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:485:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:487:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:487:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:487:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:487:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:487:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:487:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:489:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:489:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:489:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:489:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:489:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:489:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:491:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:491:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:491:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:491:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:491:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:491:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:493:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:493:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:493:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:493:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:493:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:493:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:495:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:495:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:495:9: sparse:     got struct local_lock [noderef] __percpu *
>> lib/test_context-analysis.c:495:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_lock [usertype] *l @@     got struct local_trylock [usertype] * @@
   lib/test_context-analysis.c:495:9: sparse:     expected struct local_lock [usertype] *l
   lib/test_context-analysis.c:495:9: sparse:     got struct local_trylock [usertype] *
   lib/test_context-analysis.c:497:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   lib/test_context-analysis.c:497:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   lib/test_context-analysis.c:497:9: sparse:     got struct local_lock [noderef] __percpu *
   lib/test_context-analysis.c:497:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_lock [usertype] *l @@     got struct local_trylock [usertype] * @@
   lib/test_context-analysis.c:497:9: sparse:     expected struct local_lock [usertype] *l
   lib/test_context-analysis.c:497:9: sparse:     got struct local_trylock [usertype] *
   lib/test_context-analysis.c:83:1: sparse: sparse: context imbalance in 'test_raw_spinlock_guard' - wrong count at exit
   lib/test_context-analysis.c:90:20: sparse: sparse: context imbalance in 'test_raw_spinlock_trylock_extra' - wrong count at exit
   lib/test_context-analysis.c:107:1: sparse: sparse: context imbalance in 'test_spinlock_guard' - wrong count at exit
   lib/test_context-analysis.c:114:20: sparse: sparse: context imbalance in 'test_spinlock_trylock_extra' - wrong count at exit
   lib/test_context-analysis.c:131:1: sparse: sparse: context imbalance in 'test_write_lock_guard' - wrong count at exit
   lib/test_context-analysis.c:148:1: sparse: sparse: context imbalance in 'test_read_lock_guard' - wrong count at exit
   lib/test_context-analysis.c:188:17: sparse: sparse: context imbalance in 'test_mutex_trylock' - unexpected unlock
   lib/test_context-analysis.c:203:20: sparse: sparse: context imbalance in 'test_mutex_guard' - wrong count at exit
   lib/test_context-analysis.c:209:20: sparse: sparse: context imbalance in 'test_mutex_cond_guard' - wrong count at exit
   lib/test_context-analysis.c:263:9: sparse: sparse: context imbalance in 'test_seqlock_scoped' - wrong count at exit
   lib/test_context-analysis.c:286:17: sparse: sparse: context imbalance in 'test_rwsem_reader' - unexpected unlock
   lib/test_context-analysis.c:304:17: sparse: sparse: context imbalance in 'test_rwsem_writer' - unexpected unlock
   lib/test_context-analysis.c:315:20: sparse: sparse: context imbalance in 'test_rwsem_guard' - wrong count at exit
   lib/test_context-analysis.c:321:20: sparse: sparse: context imbalance in 'test_rwsem_cond_guard' - wrong count at exit
   lib/test_context-analysis.c:461:53: sparse: sparse: context imbalance in 'test_srcu_guard' - wrong count at exit
   lib/test_context-analysis.c: note: in included file:
>> include/linux/local_lock.h:86:1: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock @@
   include/linux/local_lock.h:86:1: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/local_lock.h:86:1: sparse:     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock
>> include/linux/local_lock.h:86:1: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock @@
   include/linux/local_lock.h:86:1: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/local_lock.h:86:1: sparse:     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock
   include/linux/local_lock.h:89:1: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock @@
   include/linux/local_lock.h:89:1: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/local_lock.h:89:1: sparse:     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock
   include/linux/local_lock.h:89:1: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock @@
   include/linux/local_lock.h:89:1: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/local_lock.h:89:1: sparse:     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock
   include/linux/local_lock.h:92:1: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock @@
   include/linux/local_lock.h:92:1: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/local_lock.h:92:1: sparse:     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock
   include/linux/local_lock.h:92:1: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock @@
   include/linux/local_lock.h:92:1: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/local_lock.h:92:1: sparse:     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock
   include/linux/local_lock.h:103:1: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock @@
   include/linux/local_lock.h:103:1: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/local_lock.h:103:1: sparse:     got struct local_lock [noderef] [usertype] __percpu *[usertype] lock
>> include/linux/local_lock.h:103:1: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_lock [usertype] *l @@     got struct local_trylock [usertype] * @@
   include/linux/local_lock.h:103:1: sparse:     expected struct local_lock [usertype] *l
   include/linux/local_lock.h:103:1: sparse:     got struct local_trylock [usertype] *
   lib/test_context-analysis.c: note: in included file (through include/linux/local_lock.h):
   include/linux/local_lock_internal.h:46:9: sparse: sparse: context imbalance in 'test_local_lock_guard' - wrong count at exit
   lib/test_context-analysis.c:530:17: sparse: sparse: context imbalance in 'test_local_trylock' - unexpected unlock

vim +483 lib/test_context-analysis.c

   478	
   479	static void __used test_local_lock(void)
   480	{
   481		unsigned long flags;
   482	
 > 483		local_lock(&test_local_lock_data.lock);
   484		this_cpu_add(test_local_lock_data.counter, 1);
   485		local_unlock(&test_local_lock_data.lock);
   486	
   487		local_lock_irq(&test_local_lock_data.lock);
   488		this_cpu_add(test_local_lock_data.counter, 1);
   489		local_unlock_irq(&test_local_lock_data.lock);
   490	
   491		local_lock_irqsave(&test_local_lock_data.lock, flags);
   492		this_cpu_add(test_local_lock_data.counter, 1);
   493		local_unlock_irqrestore(&test_local_lock_data.lock, flags);
   494	
 > 495		local_lock_nested_bh(&test_local_lock_data.lock);
   496		this_cpu_add(test_local_lock_data.counter, 1);
   497		local_unlock_nested_bh(&test_local_lock_data.lock);
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
