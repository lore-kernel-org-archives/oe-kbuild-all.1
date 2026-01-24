Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B615A3EBF09
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296422; cv=none; b=PtcD4vOtam4WQOvg/1tSFfXedYzfPdmJSEwJr1XaURTOqDB34FIKy8SSnNRtK6X/9VREaOq9VDURrZOL3iUvjStZ0kjsv5UIN7mJUIWKQcGklx++zPjr51szXS/LMhX9aa3xveF+A5dci93ElJ608EfJaZgITK/MX0PoSMssSU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296422; c=relaxed/simple;
	bh=SW72zuBAAMaiw8Nrs7Xl+R4rTuKwVKSMd/AOP51e7OI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=co1HSmcCj+RBWBmeIvZzIdqGq0eDTATOpr5LxPnhlov++5jpxp8JzfwEZt9MnTI1y2OX4cnFWmA2RQ7Tn4xQR2FUMNX8Z7Wz+neima5vs0pYtqW5yAMEQ0rtOAoSTz8+h3s0Vs9nDwp7ErAqCp2nQyt6oClgEozRQsS2F+MW7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTlC9kcK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTlC9kcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769296421; x=1800832421;
  h=date:from:to:cc:subject:message-id;
  bh=SW72zuBAAMaiw8Nrs7Xl+R4rTuKwVKSMd/AOP51e7OI=;
  b=NTlC9kcKcrtwD5tRbeyzSL4xzVPsyg9eMfducegGrLhWYXaywS/7vW5V
   n+Iul9ACf9G9y0wFvnUI8go1tUd99uGbcCzkscTQpAisfCOJwL4vNAkWj
   m9CoykIirWvKuZoSmcru4f+N6fqnLPFemHMijWTeINHBm1HCVYMaNpX1M
   2mP+3NnOwAHREGs6X+FGmi3Wjmq04vQwEJkuHFbEUlQmcmwKFQHndKSen
   d7VcnTawZMSqRcM9x24RYGQv+XGTbZxaC/Kdoeh1uppca6pj+z4US/5wj
   2ajDPztJZfNp247KuBvY1iW98XWoO6Y91cQ1rPxERLoYdshksNeeoBf66
   w==;
X-CSE-ConnectionGUID: VmRZD2OHRYyrY5mhvXLypg==
X-CSE-MsgGUID: e+pEq6QySLydoe3mI8VRYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70418122"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="70418122"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 15:13:41 -0800
X-CSE-ConnectionGUID: nrAY2BZyTri+ZzD7IgHtHA==
X-CSE-MsgGUID: iNYFTaowRRibdf4LKGAUGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="211804190"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jan 2026 15:13:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjmoy-00000000VbO-1iIv;
	Sat, 24 Jan 2026 23:13:36 +0000
Date: Sun, 25 Jan 2026 07:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 arch/x86/kernel/kvm.c:237:2-7: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202601250701.LavuXjGV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   9798fda6e4488a9762669b40f98c27d3036fbe71
commit: 7b54eb6319342eccd2c95a3e479e10282a5946c8 [0/1] x86/kvm: Alloc dummy async #PF token outside of raw spinlock
config: i386-randconfig-051-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250701.LavuXjGV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250701.LavuXjGV-lkp@intel.com/

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
