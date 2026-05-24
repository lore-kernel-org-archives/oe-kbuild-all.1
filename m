Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537BC2A1BF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 06:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779604475; cv=none; b=l1t1TZUDLtk5W+ymb67UgA+xZpEFL+s7jPoZHTCrsylU3Vlqqv/nx67rmK2awMVIFKT4o+2WFco9KLtSLxvLVf0MVriA3Z482o7r6MLb7nydW738cZeYcJU42MgjtCzSnmn+Z5bh8jKDD5+9ktKBRk+L7yEEhF3tIeNbC+nDMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779604475; c=relaxed/simple;
	bh=UeJypzt4WsYHGZ6//2mp09U3sYkGPorYmzd5NvkxjUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OKJ+DYENoL+YDV37URGGI3wJHZ1aifqTtkH8GaAuqnic1KFYhxrHGDP48k0WkUA+gAELxNGH7H4relD6Q2BJJlDTwM4wpVq6BqurI/UW2dxP7DPkhQiKhrJZaWqDia4zvqlyNqw+xcU5nrhVX/4WUiqb5y7qhItiOz479NXXk8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drNxwSvv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drNxwSvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779604473; x=1811140473;
  h=date:from:to:cc:subject:message-id;
  bh=UeJypzt4WsYHGZ6//2mp09U3sYkGPorYmzd5NvkxjUc=;
  b=drNxwSvvw3QQbwdiuDdcCFB4N9dXjedECHXtWzOjZQbsRq+q81QduVe+
   GglO3p2HsrKXpHVEmfWj+3T3aiVlG2Z3Ink4PyDG1pQ2YIIL1Up2C0If2
   lEX1mvd0oCo8PeyY+UfdbljWn/UQ05IwpmICxcBDIWuyYLqXCwJM5J9Jz
   gSI0vXwScxsM6Osbl1/ZS3zsNobsNuLeusOIf1g2YGxwFsMlGspZSOmsa
   mg/usFLUUXd/rN6j0qNbpPFCXm4BaMt8veoQX+VLYl9ez8YSXX5vx3Hv6
   04TAb3qOo5hsgDlDPto7+8vMROX+rviCICARJoO7boyaFINkJ2NR0MB2g
   g==;
X-CSE-ConnectionGUID: 1HN60DD9RZOVN+bU8glNOg==
X-CSE-MsgGUID: cNX8XvkpQG2JSz3CI9qAlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="80448608"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="80448608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 23:34:33 -0700
X-CSE-ConnectionGUID: 4p9Ey4V+QVusRck7nXOJKg==
X-CSE-MsgGUID: UFBVUbw8QiCRSwZD9ma9PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="246374823"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2026 23:34:31 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR2Pt-000000000ll-0KxF;
	Sun, 24 May 2026 06:34:29 +0000
Date: Sun, 24 May 2026 14:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 235/235]
 arch/x86/kernel/kvm.c:237:2-7: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202605241407.usPpIQKs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   8c66939857f7c1785dcf957b4374265db31c6af5
commit: 4a9f3a9c28a6966c699b4264b6a3c5aaed21ea3e [235/235] x86/kvm: Alloc dummy async #PF token outside of raw spinlock
config: x86_64-randconfig-r064-20260524 (https://download.01.org/0day-ci/archive/20260524/202605241407.usPpIQKs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241407.usPpIQKs-lkp@intel.com/

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
