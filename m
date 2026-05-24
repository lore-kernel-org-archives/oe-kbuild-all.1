Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8833019DC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779630008; cv=none; b=u9gsry7At/FJPNLIMcKM/mEWbuet+ZF+Ewma0vOUIhx8IvqBs/PGwo3S4o1QkCdBsa1/thlrufwRq9S/SvumS4n0i1L8qpDXWxBQkvg1MeeqBw7/hrMq7Czajdxi6QNolEOlIrMQ46UqNzTdmE69lWkyU64Ksh6YPF+jmAMA5po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779630008; c=relaxed/simple;
	bh=qV3kSed2cQNydhHw+FQkOt3D0FcZ+sNQerKeIvSdhXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DWNKc+S+fO+WOAUkpXnfuFRaKhIMJ0MZrC5/H8RkuoyE7ZpMk78BwnGtG1xm8wbG0b/WKThWiHXtTQJy5xHdyja2z+uYKRe58ek7AdcnyqLyH+6MAdos4Q18qgGLGVlbJGb0W5UMhC9hu3cUfv0xLSucNyYcJiybBwIdAe5Md9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7v2UsVL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7v2UsVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779630007; x=1811166007;
  h=date:from:to:cc:subject:message-id;
  bh=qV3kSed2cQNydhHw+FQkOt3D0FcZ+sNQerKeIvSdhXM=;
  b=O7v2UsVLYLF5YCyDdQNSNzwNpLFFTSxSDTEC4rOdfkAA/rPj6F9ZXzm0
   4v3zDzY2QbS/VCAui+IosjNizXIFR3LwBlvcGeRL/iNWUVuOWF5TmRiXa
   rNU9mm0jSw/hJUbuxV95Xzg6YJyf9CLmntsUvOWelWzwd8dU32d/lRd/A
   MPdHteawgEx9W1FAAiJCmpBKTlMRi0AySKnxAbm9emKATV8TVRHJIOH9S
   kpUx4Rypk1u+kipnZHmlK/1j5iNdj77cSC+ZgepJNuOU4zoR37dvaz32r
   AodZ9qu+GBp96FQ+g2TCUtjNTEkeuj7GDwv7PyOolJNjoWSLOrQZGJgXm
   w==;
X-CSE-ConnectionGUID: DZfGq9yETymI5nZtKmyB0A==
X-CSE-MsgGUID: 56R4jFwVRxGV4yKaL+VnEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="91163774"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="91163774"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 06:40:06 -0700
X-CSE-ConnectionGUID: 3oZEmmD6Q5yKtXH0U3o29g==
X-CSE-MsgGUID: GXGnx6TAQG+Z0su03oEYUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="237150461"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 May 2026 06:40:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR93i-000000000Gv-1lVn;
	Sun, 24 May 2026 13:40:02 +0000
Date: Sun, 24 May 2026 21:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 235/235]
 arch/x86/kernel/kvm.c:237:2-7: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202605242143.8eBRI1Tn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   8c66939857f7c1785dcf957b4374265db31c6af5
commit: 4a9f3a9c28a6966c699b4264b6a3c5aaed21ea3e [235/235] x86/kvm: Alloc dummy async #PF token outside of raw spinlock
config: x86_64-randconfig-r064-20260524 (https://download.01.org/0day-ci/archive/20260524/202605242143.8eBRI1Tn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605242143.8eBRI1Tn-lkp@intel.com/

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
