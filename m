Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D373835581D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374812; cv=none; b=ggta/6zZ8J4lPxyy6c+QfVAKiK7IN0XY3iboZZGgFgOwsVa4umQ8KYWH3vH5oBlGZw3M7vP62k0gSpMGpQCwzIXiWNje2YpJ6QQkfONg6Utyj3OSzM0G/UTX3pwQ932ocYvJJXzzxIuoVSeW/rfyrWOzpUClYNCuiUj6FKdi04g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374812; c=relaxed/simple;
	bh=B1i3RGrMn24RmFoQ6OZ5PlSAfVLwdXHdm5Wr+tCH83k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2dLvwz8ybmovntJBDJCn06YJ3NhJ0rXCSUiWL6Bx+icFKnrWOOFY2m1iF4rlyYCZKjhzmHRlvbwiOJJQCdV38k0Mp/7Liw0U2fC+ZrAlHDdCpXmTDudJbDMaCHScnNT3ypHtHDepi+jbfUq+h7hvtAhTxBCe2aVr0umszRYxhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDKSroOn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDKSroOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768374806; x=1799910806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B1i3RGrMn24RmFoQ6OZ5PlSAfVLwdXHdm5Wr+tCH83k=;
  b=PDKSroOnHRXPFHaxoS4oEUcTajviezoI7tT2CmQiuKEqRjqpATFA3N2L
   BmE9S+eD/j8r57+kuOVKoC7tq2vixhAYyd2vQwKhwC7Y/p8ZeQRwR3RPf
   MsOFmgUC3BrcMyGkM3uqRGdqNKQYe4SVzDStvS4s80nKzr9dIJxG1uOO5
   p8RaJ4GdQslVCosBhOL+Y96pGY6nerdphTd5Zbzv2JzcWlDTXWLQe3li4
   9r2+U9qUd16KcI1hJkC482DtLFAcv/49vWCDo/xwwOTYzUtULy9VLqP1T
   pDNAh31Tp95BtBJGB6ovVkRJc2irdE4yRsnH7FMa5IA6+CkXiC4S1rhRp
   w==;
X-CSE-ConnectionGUID: +9gY6pb7SpKBGAWSfGmTwg==
X-CSE-MsgGUID: dUifv3keQYG9QAIFdIhgUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69577186"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69577186"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:13:22 -0800
X-CSE-ConnectionGUID: rdcFbvxzTmKOdXk1PYbxcw==
X-CSE-MsgGUID: LFZsELyYRUSJLhQCO+80AA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 23:13:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfv49-00000000Fya-46Ny;
	Wed, 14 Jan 2026 07:13:17 +0000
Date: Wed, 14 Jan 2026 15:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 05/10] dma-buf: inline spinlock for fence protection v4
Message-ID: <202601141412.WQDwevjM-lkp@intel.com>
References: <20260113152125.47380-6-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113152125.47380-6-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-tip/drm-tip next-20260114]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-add-dma_fence_is_initialized-function/20260114-001656
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260113152125.47380-6-christian.koenig%40amd.com
patch subject: [PATCH 05/10] dma-buf: inline spinlock for fence protection v4
config: x86_64-buildonly-randconfig-004-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141412.WQDwevjM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141412.WQDwevjM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141412.WQDwevjM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/segment.h:6,
                    from arch/x86/include/asm/ptrace.h:5,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from include/linux/kthread.h:6,
                    from drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:6:
   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c: In function '__dma_fence_signal__notify':
>> drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:151:34: error: 'struct dma_fence' has no member named 'lock'
     151 |         lockdep_assert_held(fence->lock);
         |                                  ^~
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:9: note: in expansion of macro 'lockdep_assert'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:24: note: in expansion of macro 'lockdep_is_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:151:9: note: in expansion of macro 'lockdep_assert_held'
     151 |         lockdep_assert_held(fence->lock);
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
   In file included from drivers/gpu/drm/i915/i915_active.c:1174:
   drivers/gpu/drm/i915/selftests/i915_active.c: In function 'active_flush':
>> drivers/gpu/drm/i915/selftests/i915_active.c:326:28: error: 'struct dma_fence' has no member named 'lock'
     326 |         spin_lock_irq(fence->lock);
         |                            ^~
   drivers/gpu/drm/i915/selftests/i915_active.c:328:30: error: 'struct dma_fence' has no member named 'lock'
     328 |         spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
         |                              ^~


vim +151 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c

0152b3b3f49b36 Chris Wilson 2019-05-08  144  
0152b3b3f49b36 Chris Wilson 2019-05-08  145  static void
f2cb60e9a3881e Chris Wilson 2019-08-17  146  __dma_fence_signal__notify(struct dma_fence *fence,
f2cb60e9a3881e Chris Wilson 2019-08-17  147  			   const struct list_head *list)
0152b3b3f49b36 Chris Wilson 2019-05-08  148  {
0152b3b3f49b36 Chris Wilson 2019-05-08  149  	struct dma_fence_cb *cur, *tmp;
0152b3b3f49b36 Chris Wilson 2019-05-08  150  
0152b3b3f49b36 Chris Wilson 2019-05-08 @151  	lockdep_assert_held(fence->lock);
0152b3b3f49b36 Chris Wilson 2019-05-08  152  
f2cb60e9a3881e Chris Wilson 2019-08-17  153  	list_for_each_entry_safe(cur, tmp, list, node) {
0152b3b3f49b36 Chris Wilson 2019-05-08  154  		INIT_LIST_HEAD(&cur->node);
0152b3b3f49b36 Chris Wilson 2019-05-08  155  		cur->func(fence, cur);
0152b3b3f49b36 Chris Wilson 2019-05-08  156  	}
0152b3b3f49b36 Chris Wilson 2019-05-08  157  }
0152b3b3f49b36 Chris Wilson 2019-05-08  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
