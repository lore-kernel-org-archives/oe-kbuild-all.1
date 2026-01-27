Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D272DAFB5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 04:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769489822; cv=none; b=NAavulmF+u+0UF1YH+xG4baLbOBB4bzbY5VCB8jT6LkNznV+/Tit/SqBx6zeoBl7HR2vRWF5yJ23qzkPlQeKplwLXGPLIW9HsIODjzADj4yvKF7NZlIqF8pdgjKSFAIpUmRflcW9sqvAhzUT04sb7FISezOT8E+bWILUn6vO6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769489822; c=relaxed/simple;
	bh=gdAbZco7AYOgBCqpBkUvDwk4XLCrRqIpAeLK1rwSmtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onksKS6hJrEdNEZKnMnrmHyilFDgd2XZ6Ritak2qWu/z2Q69P+Z0aLNlJv1GOPkfeY9708vuXQVPBgmCdHuAxN4oJnVJqx7Xk6uU9AY8wkpUsyR9zcIRSQuDc82y47jQkO6+q+zE/9g1VwnWZMBCZNumDZj6NHTI10mZURz9E3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IuE16fNe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IuE16fNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769489821; x=1801025821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gdAbZco7AYOgBCqpBkUvDwk4XLCrRqIpAeLK1rwSmtI=;
  b=IuE16fNeZex6nK64uhluMPmlaDMIa8zvu22Fv4TDLw4uXuB2LvxePMPv
   trQf6qag4FpsF46en8FbLe2Z2c90qAg3JpPzJ3fBHzbmiUuBnpU9DIPZN
   26h8x0DPHEVGZxMffHJLoT3fubWL/kS+PZVYp7vmP7RqRXkbpQysVF6EG
   BQHYXG3SUiM9EQlo95W0tuh2AuK1+7K7DTv/ixotJpKX21JL7DM+zK0mz
   60DVXZTujxHraX6OGwF4uAsLo0p1uXBjaqxn9qoqqfs9O9OC+AWn2mkaI
   AbP5rnN0HcS2CvSFv4BPxSW26JrwcwX6KIrNtE3rLPRfNv2kf/q7RtloP
   A==;
X-CSE-ConnectionGUID: V3vPhLg9Q1OFGT44QJ36Pw==
X-CSE-MsgGUID: AAocsv82RP6BNZ6ANQu8fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70576401"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70576401"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 20:56:56 -0800
X-CSE-ConnectionGUID: YKkVOZHhR3ePQucQF9Ts6g==
X-CSE-MsgGUID: 1ddyYHuPTq6JtQO7mril+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207103832"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jan 2026 20:56:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkb8E-00000000Y0Q-2Q01;
	Tue, 27 Jan 2026 04:56:50 +0000
Date: Tue, 27 Jan 2026 12:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 5/9] dma-buf: inline spinlock for fence protection v4
Message-ID: <202601271204.Yb3rgz99-lkp@intel.com>
References: <20260120105655.7134-6-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120105655.7134-6-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-xe/drm-xe-next drm-tip/drm-tip next-20260126]
[cannot apply to linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-protected-fence-ops-by-RCU-v5/20260120-195535
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260120105655.7134-6-christian.koenig%40amd.com
patch subject: [PATCH 5/9] dma-buf: inline spinlock for fence protection v4
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260127/202601271204.Yb3rgz99-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271204.Yb3rgz99-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271204.Yb3rgz99-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/kthread.h:6,
                    from drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:6:
   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c: In function '__dma_fence_signal__notify':
>> drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:151:34: error: 'struct dma_fence' has no member named 'lock'
     151 |         lockdep_assert_held(fence->lock);
         |                                  ^~
   include/linux/lockdep.h:392:61: note: in definition of macro 'lockdep_assert_held'
     392 | #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
         |                                                             ^
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
   include/linux/spinlock.h:235:44: note: in definition of macro 'raw_spin_lock_nested'
     235 |         _raw_spin_lock(((void)(subclass), (lock)))
         |                                            ^~~~
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
   include/linux/spinlock.h:235:44: note: in definition of macro 'raw_spin_lock_nested'
     235 |         _raw_spin_lock(((void)(subclass), (lock)))
         |                                            ^~~~
   drivers/gpu/drm/i915/i915_active.c:1074:25: note: in expansion of macro 'spin_lock_nested'
    1074 |                         spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                         ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_active.c:1091:33: error: 'struct dma_fence' has no member named 'lock'
    1091 |                 spin_unlock(prev->lock); /* serialise with prev->cb_list */
         |                                 ^~
   drivers/gpu/drm/i915/i915_active.c:1094:37: error: 'struct dma_fence' has no member named 'lock'
    1094 |         spin_unlock_irqrestore(fence->lock, flags);
         |                                     ^~


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
