Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391447FAEE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 16:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452275; cv=none; b=YHv1jpm2+egic5EB3YD9IVF0QG/ZHdcyDsMVuVZxl7v7ouQLH4CLi9HqX4+tjiE3dogUce2KyrHO2jfvd/LtYVtsQ6id+2NDSKnyUvo2Lk7bo+e08djRZbWZTK4ZX/st+5yiNU6qnfHFX1MEKIoK4r3uuj4fwFDpGIw0KaRwZgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452275; c=relaxed/simple;
	bh=WWY02lZHrOVqEUeuL+9lLViTCBX3QStGf3HLzaFFrAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KjnlQtfkBbhhGZI2hchIX+0QtF+HFotiti/OhGDdhbj/w/GPPbK5/jxiJVXiILKNackmXMMN6aU+1BV8WRvktdPsFwWpBgYYGQN0oVOf5wlcLgcdQjP23je5DTNEfCYIgiDJ71uHf0iUXCosMxex8ECYcY/ToRwcAwU2OXDz8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzYJOpp0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzYJOpp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788452274; x=1819988274;
  h=date:from:to:cc:subject:message-id;
  bh=WWY02lZHrOVqEUeuL+9lLViTCBX3QStGf3HLzaFFrAg=;
  b=JzYJOpp0nAVVVEN0qmG9dFVCYaMQVKv+OUVc4GND+rSZvFjF28JiknCi
   zFq+ROyvoxhJKraCvEQFlVuR6N+cSvScLnTZra8UOZRbLlTbZx4DU47z5
   2mBRKVs0jNGdEFHoETI2d5TG0m3L1YmIvpAhanEm5L6O3ZwnacPmJuB5x
   3koFQqgRnkSTIMAYx5RxYByTH/nm7HbuasRlrrPmS52Ti9EeZjs9yH5Ja
   JnbcidavaA8yNVjxLLoLyZBIFWqUDhQ2ugKPlVg5qvUnySm2s0g7OvK/f
   v7gZBYLmnjOgbGXgc7Hzdt5zaEra/0Jl6Ggb1a5+6jLWiOUlEc4zpH6Wv
   A==;
X-CSE-ConnectionGUID: +IOpY4r/TLijTcQOIpYmvw==
X-CSE-MsgGUID: QveO+1JIQCCVX/bjH5v2vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106463090"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="106463090"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:17:54 -0700
X-CSE-ConnectionGUID: YaJitWwYSwSOGnI85BRFOw==
X-CSE-MsgGUID: UlEto0etSXicfO41ZP+iog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267190544"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2026 09:17:52 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2A8L-0000000052w-3qVh;
	Thu, 03 Sep 2026 16:17:49 +0000
Date: Fri, 04 Sep 2026 00:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 278/278]
 arch/x86/kernel/kvm.c:237:2-7: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202609040016.YQuJJkEC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   ae917b3c7332e08006443a49c261aa97ce703103
commit: 4a9f3a9c28a6966c699b4264b6a3c5aaed21ea3e [278/278] x86/kvm: Alloc dummy async #PF token outside of raw spinlock
config: i386-randconfig-r061-20260903 (https://download.01.org/0day-ci/archive/20260904/202609040016.YQuJJkEC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609040016.YQuJJkEC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/kvm.c:237:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +237 arch/x86/kernel/kvm.c

   186	
   187	void kvm_async_pf_task_wake(u32 token)
   188	{
   189		u32 key = hash_32(token, KVM_TASK_SLEEP_HASHBITS);
   190		struct kvm_task_sleep_head *b = &async_pf_sleepers[key];
   191		struct kvm_task_sleep_node *n, *dummy = NULL;
   192	
   193		if (token == ~0) {
   194			apf_task_wake_all();
   195			return;
   196		}
   197	
   198	again:
   199		raw_spin_lock(&b->lock);
   200		n = _find_apf_task(b, token);
   201		if (!n) {
   202			/*
   203			 * Async #PF not yet handled, add a dummy entry for the token.
   204			 * Allocating the token must be down outside of the raw lock
   205			 * as the allocator is preemptible on PREEMPT_RT kernels.
   206			 */
   207			if (!dummy) {
   208				raw_spin_unlock(&b->lock);
   209				dummy = kzalloc(sizeof(*dummy), GFP_KERNEL);
   210	
   211				/*
   212				 * Continue looping on allocation failure, eventually
   213				 * the async #PF will be handled and allocating a new
   214				 * node will be unnecessary.
   215				 */
   216				if (!dummy)
   217					cpu_relax();
   218	
   219				/*
   220				 * Recheck for async #PF completion before enqueueing
   221				 * the dummy token to avoid duplicate list entries.
   222				 */
   223				goto again;
   224			}
   225			dummy->token = token;
   226			dummy->cpu = smp_processor_id();
   227			init_swait_queue_head(&dummy->wq);
   228			hlist_add_head(&dummy->link, &b->list);
   229			dummy = NULL;
   230		} else {
   231			apf_task_wake_one(n);
   232		}
   233		raw_spin_unlock(&b->lock);
   234	
   235		/* A dummy token might be allocated and ultimately not used.  */
   236		if (dummy)
 > 237			kfree(dummy);
   238	}
   239	EXPORT_SYMBOL_GPL(kvm_async_pf_task_wake);
   240	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
