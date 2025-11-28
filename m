Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668DB1D9346
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 01:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764294592; cv=none; b=h+7NgzfBWdsZl4HApxScwqOibyzKmgHXmiOFAPhGQrQN61KhPHZTjoY7PBruMcMkLtRGsJ+bv45P+Uwd/7HfTGpS14pRllJQY96lBXESLXVnXIRxIHMhw7raQRwGFxkNfLyQ+P+ptJ9cxmTqdlhOkP4cYkqk8n1lX0lIERTJAYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764294592; c=relaxed/simple;
	bh=7d+ebyQoWo58+nBuMKOPTTNYXgeo2ZIqflPVr0wEcuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxtCX1fLHiHihNC6BpIwbzKRY9aLXyogrfdTzYDPtk6SY8bht48qQA4KPWJ/f7pMGAtUtpzWDErfXH9UJIvEnvNjSCt7G7+8QWcKG1NhL7j52Na47H/arcHql6FtnkTVzjV1r7eBsPHeAPIv8QRXmm+KqoKSJRYFDEzLIKgjj8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDePK0e9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDePK0e9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764294590; x=1795830590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7d+ebyQoWo58+nBuMKOPTTNYXgeo2ZIqflPVr0wEcuY=;
  b=XDePK0e9mOqYP4kuc4C0Rqn0RQm8XHUwBTiGToGeqc0Xty3o9uYZnrxn
   +HqbEB3Gp7WXcgMj3tsPuznNu54jC4bwD7fTZBpKuVbi6sbjQw0n396ON
   fB6uem8W1DS8uWfT0xgfJ9/zCcYKhQAAF3KymGjSsP1M4UjN5HdMqJ7UM
   2oWgFXpjyYwt7sCUypKzEGe2bObnV9v62YHge3HuLF86dYd9H5GtVPsYX
   q7dP9y1OFq5M+8KuxvVfvuDXdRaM4HOFg7QWLEhNC9D/zqVpn2P/lr9nN
   APGYIpVUC2vQFfE44L/pCHaGGgZXaUGt+Jh08HRPRa8LImEWW2JCmsUOy
   Q==;
X-CSE-ConnectionGUID: sl6/BIoKTtmrFvMxXjYTyQ==
X-CSE-MsgGUID: z6haIDqBQOiuPX05r5d3EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70193052"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="70193052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 17:49:50 -0800
X-CSE-ConnectionGUID: yXb+vhnWTrOdQJIfF9eY6w==
X-CSE-MsgGUID: yxrdyXH/TqawMlWnUKOmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="224047455"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2025 17:49:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOncI-000000005uR-14q7;
	Fri, 28 Nov 2025 01:49:46 +0000
Date: Fri, 28 Nov 2025 09:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] mm: Avoid percpu MM counters on single-threaded
 tasks
Message-ID: <202511280956.Pbp1eIpB-lkp@intel.com>
References: <20251127233635.4170047-4-krisman@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127233635.4170047-4-krisman@suse.de>

Hi Gabriel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc7 next-20251127]
[cannot apply to akpm-mm/mm-everything dennis-percpu/for-next kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/lib-percpu_counter-Split-out-a-helper-to-insert-into-hotplug-list/20251128-073934
base:   linus/master
patch link:    https://lore.kernel.org/r/20251127233635.4170047-4-krisman%40suse.de
patch subject: [RFC PATCH 3/4] mm: Avoid percpu MM counters on single-threaded tasks
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251128/202511280956.Pbp1eIpB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280956.Pbp1eIpB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280956.Pbp1eIpB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:21,
                    from include/linux/sched/signal.h:14,
                    from include/linux/ptrace.h:7,
                    from arch/alpha/kernel/asm-offsets.c:12:
   include/linux/lazy_percpu_counter.h: In function 'lazy_percpu_counter_initialized':
>> include/linux/lazy_percpu_counter.h:48:42: error: 'struct percpu_counter' has no member named 'remote'
      48 |         return !(atomic_long_read(&lpc->c.remote) & LAZY_INIT_BIAS);
         |                                          ^
   include/linux/lazy_percpu_counter.h: In function 'lazy_percpu_counter_init_many':
   include/linux/lazy_percpu_counter.h:56:42: error: 'struct percpu_counter' has no member named 'remote'
      56 |                 atomic_long_set(&lpc[i].c.remote, LAZY_INIT_BIAS);
         |                                          ^
   In file included from include/linux/sched.h:37,
                    from arch/alpha/kernel/asm-offsets.c:11:
>> include/linux/lazy_percpu_counter.h:57:45: error: 'struct percpu_counter' has no member named 'lock'
      57 |                 raw_spin_lock_init(&lpc[i].c.lock);
         |                                             ^
   include/linux/spinlock.h:113:16: note: in definition of macro 'raw_spin_lock_init'
     113 |         do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
         |                ^~~~
   include/linux/lazy_percpu_counter.h: In function 'lazy_percpu_counter_add_atomic':
   include/linux/lazy_percpu_counter.h:67:51: error: 'struct percpu_counter' has no member named 'remote'
      67 |                 counter = atomic_long_read(&lpc->c.remote);
         |                                                   ^
   include/linux/lazy_percpu_counter.h:72:53: error: 'struct percpu_counter' has no member named 'remote'
      72 |         } while (atomic_long_cmpxchg_relaxed(&lpc->c.remote, counter, (counter+x)) != counter);
         |                                                     ^
   include/linux/lazy_percpu_counter.h: In function 'lazy_percpu_counter_sum_local':
   include/linux/lazy_percpu_counter.h:94:52: error: 'struct percpu_counter' has no member named 'remote'
      94 |         return remove_bias(atomic_long_read(&lpc->c.remote));
         |                                                    ^
   include/linux/lazy_percpu_counter.h: In function 'lazy_percpu_counter_sum':
   include/linux/lazy_percpu_counter.h:101:52: error: 'struct percpu_counter' has no member named 'remote'
     101 |         return remove_bias(atomic_long_read(&lpc->c.remote)) + lpc->c.count;
         |                                                    ^
   include/linux/lazy_percpu_counter.h: In function 'lazy_percpu_counter_read':
   include/linux/lazy_percpu_counter.h:115:52: error: 'struct percpu_counter' has no member named 'remote'
     115 |         return remove_bias(atomic_long_read(&lpc->c.remote)) + lpc->c.count;
         |                                                    ^
   make[3]: *** [scripts/Makefile.build:182: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +48 include/linux/lazy_percpu_counter.h

64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  45  
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  46  static inline bool lazy_percpu_counter_initialized(struct lazy_percpu_counter *lpc)
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  47  {
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27 @48  	return !(atomic_long_read(&lpc->c.remote) & LAZY_INIT_BIAS);
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  49  }
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  50  
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  51  static inline void lazy_percpu_counter_init_many(struct lazy_percpu_counter *lpc, int amount,
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  52  					       int nr_counters)
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  53  {
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  54  	for (int i = 0; i < nr_counters; i++) {
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  55  		lpc[i].c.count = amount;
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  56  		atomic_long_set(&lpc[i].c.remote, LAZY_INIT_BIAS);
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27 @57  		raw_spin_lock_init(&lpc[i].c.lock);
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  58  	}
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  59  }
64259dc8f53734 Gabriel Krisman Bertazi 2025-11-27  60  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
