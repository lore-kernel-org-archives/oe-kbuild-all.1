Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B967346E55
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772821477; cv=none; b=WbOymF9bRBAGDstiY454OUJB2wuf+h3VR9I8/SXmIt0QRc3706wR3cYkQf1iAosFXDd1j8JtbQW78LX/tjnTS3fjl1IEVRqFk5UgcYaJsrdzJMOVeFkC8cjxCvrZuzirGw39LFjZb5+Gs290VfKmrgBjc+8kXPteIHAx0RB4Pvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772821477; c=relaxed/simple;
	bh=GoKtrVOFPv9jOjedgeYI6gu5CaJo4PKx6t+qqYdGtLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lef/5Vt+GpLQUD6NX0cn5yisQiyQQv5nhfEJlMP7M4QHjoyTrS3gF5OiAZCm2drwExnJLUDvRAojWggqR0N+DX+4muPDCju4aOp2qeAYiGEvfrbs8pe7bF4SZeSwQHZ6VmIazd1Ge91fCMj+dEMtnFR3Lxp78eZidGbHi9xvwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpzbKBj3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpzbKBj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772821475; x=1804357475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GoKtrVOFPv9jOjedgeYI6gu5CaJo4PKx6t+qqYdGtLY=;
  b=SpzbKBj3fAnx87dfD0jRpeCp/2NiZOGLO5d7yz0czMJ4eeKUUXu1Rc2U
   HV9ICdlVcotOPPV32hKLxWA4Y8F3TtYdrrMDvx1Aqmu9RZtnRtTel4XRs
   6xmVVXBrcEKlVSawMUJcR8g/8FqMLqH0IRidQ8oYc/Sk8FbJm0OM5hDKz
   Dji0ZIeZASkCQ4RnMceIz4eXHjPq5rQ1box4HvMqO3NraS5NpKez6xSH6
   Ych/otSoqNkOU+GsMoHXjmcTYVG+y5FUROSNklfU8cO0USKR9pH2C9QDB
   ufDX2egjRUaeT+mlLNWtoPVxD0fNwhqnwCkVKQs203/yP9fP0jl7BIUz5
   Q==;
X-CSE-ConnectionGUID: Y5SC/9PSTTSQhYlVFqW2NA==
X-CSE-MsgGUID: ICjf0wNwQ5S2gxjPdqS5HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="96551040"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="96551040"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 10:24:35 -0800
X-CSE-ConnectionGUID: t5V8EEZZSnG6W2oBNVPUaA==
X-CSE-MsgGUID: 23eXXWNXTuyq+CjM8tHWvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="224055389"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 10:24:34 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyZqh-000000001Cb-1RqN;
	Fri, 06 Mar 2026 18:24:31 +0000
Date: Sat, 7 Mar 2026 02:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] locking: add mutex_lock_nospin()
Message-ID: <202603070229.G9hHE2az-lkp@intel.com>
References: <20260304074650.58165-2-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304074650.58165-2-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v7.0-rc2 next-20260305]
[cannot apply to trace/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/locking-add-mutex_lock_nospin/20260304-155633
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20260304074650.58165-2-laoar.shao%40gmail.com
patch subject: [RFC PATCH 1/2] locking: add mutex_lock_nospin()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260307/202603070229.G9hHE2az-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070229.G9hHE2az-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070229.G9hHE2az-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/locking/mutex.c: In function 'mutex_lock_nospin':
>> kernel/locking/mutex.c:299:17: error: implicit declaration of function '__mutex_lock_nospin'; did you mean 'mutex_lock_nospin'? [-Wimplicit-function-declaration]
     299 |                 __mutex_lock_nospin(lock);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 mutex_lock_nospin
   kernel/locking/mutex.c: In function '__mutex_lock_common':
>> kernel/locking/mutex.c:630:13: error: too many arguments to function 'mutex_optimistic_spin'; expected 3, have 4
     630 |             mutex_optimistic_spin(lock, ww_ctx, NULL, nospin)) {
         |             ^~~~~~~~~~~~~~~~~~~~~                     ~~~~~~
   kernel/locking/mutex.c:532:1: note: declared here
     532 | mutex_optimistic_spin(struct mutex *lock, struct ww_acquire_ctx *ww_ctx,
         | ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c:731:29: error: too many arguments to function 'mutex_optimistic_spin'; expected 3, have 4
     731 |                         if (mutex_optimistic_spin(lock, ww_ctx, &waiter, nospin))
         |                             ^~~~~~~~~~~~~~~~~~~~~                        ~~~~~~
   kernel/locking/mutex.c:532:1: note: declared here
     532 | mutex_optimistic_spin(struct mutex *lock, struct ww_acquire_ctx *ww_ctx,
         | ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c: At top level:
>> kernel/locking/mutex.c:792:1: error: static declaration of '__mutex_lock_nospin' follows non-static declaration
     792 | __mutex_lock_nospin(struct mutex *lock, unsigned int state, unsigned int subclass,
         | ^~~~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c:299:17: note: previous implicit declaration of '__mutex_lock_nospin' with type 'int()'
     299 |                 __mutex_lock_nospin(lock);
         |                 ^~~~~~~~~~~~~~~~~~~
>> kernel/locking/mutex.c:792:1: warning: '__mutex_lock_nospin' defined but not used [-Wunused-function]
     792 | __mutex_lock_nospin(struct mutex *lock, unsigned int state, unsigned int subclass,
         | ^~~~~~~~~~~~~~~~~~~


vim +299 kernel/locking/mutex.c

   293	
   294	void __sched mutex_lock_nospin(struct mutex *lock)
   295	{
   296		might_sleep();
   297	
   298		if (!__mutex_trylock_fast(lock))
 > 299			__mutex_lock_nospin(lock);
   300	}
   301	#endif
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
