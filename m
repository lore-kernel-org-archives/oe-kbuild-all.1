Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD05F2E7BB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206472; cv=none; b=oW0Dj27nbE62ot/+KS7nQdEQBr6EKR70KwSGd/zvOFpTbX2hR/s0ftoU4hKwkU6IuiZ0OD7saGNP+8LQWAaoZy8tpnP2rPPmUbC4kVcnJCbJJRJtsVbqWHc0t7Py2CL/2g+2E5sVpmLlp+2bHHwzZPbkdipz+VGPmCzKsvGDRpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206472; c=relaxed/simple;
	bh=ZydozbmgPLq8AVxYg8aDZrqtuVJ7n0hdK5WmuyxFvrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lli4mIMdmiB1hP0jRQnCPLNPVzOXaXFa2/H0miUZz3uq+mUTQXhMtFPEEV2qWEmUKKck3Fq1WFl5NTsqCV04gYD+fotes8QeRPrXptTOv2ji16QgK29pvLE0oxIclMReTnrUBzUUEyZuYbPs72XM8Yf8uRiiI7K7Txvz+SGlUkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXIz4FRh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXIz4FRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761206469; x=1792742469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZydozbmgPLq8AVxYg8aDZrqtuVJ7n0hdK5WmuyxFvrg=;
  b=nXIz4FRh5tgQxlBpvOdzXEo+YJHWlyISrvbjn03AZn7woO7bJmbIxOrJ
   ioAZCqdXs92XfOw6UORV5mD7Kf9XdBviPeEzZj0SO6clupZrliLLoFE5/
   RUF/SnMT82AOO1m59Bu0INtFn74Kv5MjDmkofTF4Ga8A2fr1cBK4l3O16
   yvHhwdp7yXzY1MPQ5dNgqq3Avndg8eMROozWwpe7RB+iVfljSRnI2YspD
   sSr4m6cuGjA7LS+gKJYLZhNvLxDpUZvjxueTZQgLwBa9hQAJl17GA06uD
   Zukl99C5YvyWQYeVDAoCQxgwbAFhNpSo/NPczVHr8hzacu1Kya/KsKOqG
   A==;
X-CSE-ConnectionGUID: lH2rA7ZhSjixZ/OMNNcr3Q==
X-CSE-MsgGUID: /VGZ/c6mQQ6SLSB4K9Vpwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73659154"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="73659154"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:01:07 -0700
X-CSE-ConnectionGUID: wkJwsX+6RWewVCE79AmOQA==
X-CSE-MsgGUID: Z5g+asX/RFixgjRoMgAqtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183312848"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 01:01:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBqFF-000DCH-37;
	Thu, 23 Oct 2025 08:00:47 +0000
Date: Thu, 23 Oct 2025 15:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/14] dma-buf: inline spinlock for fence protection
Message-ID: <202510231511.5ygfBC91-lkp@intel.com>
References: <20251023040800.970283-6-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023040800.970283-6-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/dma-buf-cleanup-dma_fence_describe/20251023-121819
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251023040800.970283-6-matthew.brost%40intel.com
patch subject: [RFC PATCH 05/14] dma-buf: inline spinlock for fence protection
config: x86_64-buildonly-randconfig-004-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231511.5ygfBC91-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231511.5ygfBC91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231511.5ygfBC91-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/segment.h:6,
                    from arch/x86/include/asm/ptrace.h:5,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from include/linux/kthread.h:6,
                    from drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:6:
   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c: In function '__dma_fence_signal__notify':
>> drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:149:34: error: 'struct dma_fence' has no member named 'lock'
     149 |         lockdep_assert_held(fence->lock);
         |                                  ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:9: note: in expansion of macro 'lockdep_assert'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:24: note: in expansion of macro 'lockdep_is_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:149:9: note: in expansion of macro 'lockdep_assert_held'
     149 |         lockdep_assert_held(fence->lock);
         |         ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/debugobjects.h:6,
                    from drivers/gpu/drm/i915/i915_active.c:7:
   drivers/gpu/drm/i915/i915_active.c: In function '__i915_active_fence_set':
>> drivers/gpu/drm/i915/i915_active.c:1048:32: error: 'struct dma_fence' has no member named 'lock'
    1048 |         spin_lock_irqsave(fence->lock, flags);
         |                                ^~
   include/linux/spinlock.h:244:48: note: in definition of macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpu/drm/i915/i915_active.c:1048:9: note: in expansion of macro 'spin_lock_irqsave'
    1048 |         spin_lock_irqsave(fence->lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_active.c:1050:38: error: 'struct dma_fence' has no member named 'lock'
    1050 |                 spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                                      ^~
   include/linux/spinlock.h:221:31: note: in definition of macro 'raw_spin_lock_nested'
     221 |         _raw_spin_lock_nested(lock, subclass)
         |                               ^~~~
   drivers/gpu/drm/i915/i915_active.c:1050:17: note: in expansion of macro 'spin_lock_nested'
    1050 |                 spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                 ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_active.c:1064:41: error: 'struct dma_fence' has no member named 'lock'
    1064 |                         spin_unlock(prev->lock);
         |                                         ^~
   drivers/gpu/drm/i915/i915_active.c:1067:45: error: 'struct dma_fence' has no member named 'lock'
    1067 |                 spin_unlock_irqrestore(fence->lock, flags);
         |                                             ^~
   drivers/gpu/drm/i915/i915_active.c:1072:40: error: 'struct dma_fence' has no member named 'lock'
    1072 |                 spin_lock_irqsave(fence->lock, flags);
         |                                        ^~
   include/linux/spinlock.h:244:48: note: in definition of macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpu/drm/i915/i915_active.c:1072:17: note: in expansion of macro 'spin_lock_irqsave'
    1072 |                 spin_lock_irqsave(fence->lock, flags);
         |                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_active.c:1074:46: error: 'struct dma_fence' has no member named 'lock'
    1074 |                         spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                                              ^~
   include/linux/spinlock.h:221:31: note: in definition of macro 'raw_spin_lock_nested'
     221 |         _raw_spin_lock_nested(lock, subclass)
         |                               ^~~~
   drivers/gpu/drm/i915/i915_active.c:1074:25: note: in expansion of macro 'spin_lock_nested'
    1074 |                         spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                         ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_active.c:1091:33: error: 'struct dma_fence' has no member named 'lock'
    1091 |                 spin_unlock(prev->lock); /* serialise with prev->cb_list */
         |                                 ^~
   drivers/gpu/drm/i915/i915_active.c:1094:37: error: 'struct dma_fence' has no member named 'lock'
    1094 |         spin_unlock_irqrestore(fence->lock, flags);
         |                                     ^~


vim +149 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c

0152b3b3f49b36 Chris Wilson 2019-05-08  142  
0152b3b3f49b36 Chris Wilson 2019-05-08  143  static void
f2cb60e9a3881e Chris Wilson 2019-08-17  144  __dma_fence_signal__notify(struct dma_fence *fence,
f2cb60e9a3881e Chris Wilson 2019-08-17  145  			   const struct list_head *list)
0152b3b3f49b36 Chris Wilson 2019-05-08  146  {
0152b3b3f49b36 Chris Wilson 2019-05-08  147  	struct dma_fence_cb *cur, *tmp;
0152b3b3f49b36 Chris Wilson 2019-05-08  148  
0152b3b3f49b36 Chris Wilson 2019-05-08 @149  	lockdep_assert_held(fence->lock);
0152b3b3f49b36 Chris Wilson 2019-05-08  150  
f2cb60e9a3881e Chris Wilson 2019-08-17  151  	list_for_each_entry_safe(cur, tmp, list, node) {
0152b3b3f49b36 Chris Wilson 2019-05-08  152  		INIT_LIST_HEAD(&cur->node);
0152b3b3f49b36 Chris Wilson 2019-05-08  153  		cur->func(fence, cur);
0152b3b3f49b36 Chris Wilson 2019-05-08  154  	}
0152b3b3f49b36 Chris Wilson 2019-05-08  155  }
0152b3b3f49b36 Chris Wilson 2019-05-08  156  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
