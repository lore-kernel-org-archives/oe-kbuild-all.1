Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FEC274FEB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 22:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771712310; cv=none; b=aUlRMuwlxLFUJ0VTXPmL0O9JOCFZVQ1ZtU0XTFT872UQri4wBK/xqJMzULHvh68Sd6BgeWHd+wJWaZKhXTuU4eAt5CtTtTK1CMq2Mj0qLTa4qldtwLQSf6jgKZxAQKWCidruuknsN6JshscQZ663GOWgyCm0icNXpDxRr0KRUi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771712310; c=relaxed/simple;
	bh=LaZcY6yP24Mbx129wMiWkGxkE+5/+UOQmbbo0t4OemY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HZ+tCx6R/6h2wiOq5mbyhXIXK3ZYbomeJEMQju39Q/zP7aeWySbxG148uw5faMkbr/AdUgDpnqWKea7gJKybBFz9SdUSrWWjuroDz6CebFYhB/Nsdi4Cn5YqhMkFXUGe/lnhIsKmSy9yeclVAhiIRmyLsfrgz32mmuqrg1Zjdtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioFX6SbT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioFX6SbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771712307; x=1803248307;
  h=date:from:to:cc:subject:message-id;
  bh=LaZcY6yP24Mbx129wMiWkGxkE+5/+UOQmbbo0t4OemY=;
  b=ioFX6SbTkfg34p2/ZceyrreC848OsIXwz818iNeuiUSZ2NOYeLvzP1vD
   GtDr1AXYR0wlVanW26UieTYxhsy7mCif3IZfFVjbeTW28cPcoobdaIIEy
   zjOfw0DaERFeTBL+bItCpVr5c+mV0P2s9m++DK3TlMAoEiVbb1Y2ewID4
   EUOv7w04AxzOlHGseMw1+Wh7/BX9kcBYPvLh/JyAwsIcUe8L44k9hp6jT
   NH73H1SEzo9e/faW3c5Q1U5WZMiNy1i1lmF+G01bnqlCdoJGql22As1Uj
   gX20zAJ0HC+5p4yxKCn5I59t+R2UyONg1mXWNSfyiD92s7zPX/EZtbhIA
   w==;
X-CSE-ConnectionGUID: U7wYcPbwQAyY/4QACCHxjA==
X-CSE-MsgGUID: 88lCQh83TCKSC9vbUGOXGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="84214168"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="84214168"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 14:18:27 -0800
X-CSE-ConnectionGUID: gUdoCiYUS0CvyDa2dnq38g==
X-CSE-MsgGUID: 5vppcOVLSfmmTdu6OI5MHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="219686933"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Feb 2026 14:18:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtvIs-000000015Do-0VXF;
	Sat, 21 Feb 2026 22:18:22 +0000
Date: Sun, 22 Feb 2026 06:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: lib/test_context-analysis.c:483:9: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202602220623.h42T9E7T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8934827db5403eae57d4537114a9ff88b0a8460f
commit: d3febf16dee28a74b01ba43195ee4965edb6208f locking/local_lock: Support Clang's context analysis
date:   7 weeks ago
config: hexagon-randconfig-r111-20260222 (https://download.01.org/0day-ci/archive/20260222/202602220623.h42T9E7T-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602220623.h42T9E7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602220623.h42T9E7T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   lib/test_context-analysis.c: note: in included file:
   include/linux/bit_spinlock.h:78:25: sparse: sparse: context imbalance in 'test_bit_spin_lock' - unexpected unlock
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
   lib/test_context-analysis.c:505:68: sparse: sparse: context imbalance in 'test_local_lock_guard' - wrong count at exit
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
 > 493		local_unlock_irqrestore(&test_local_lock_data.lock, flags);
   494	
 > 495		local_lock_nested_bh(&test_local_lock_data.lock);
   496		this_cpu_add(test_local_lock_data.counter, 1);
   497		local_unlock_nested_bh(&test_local_lock_data.lock);
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
