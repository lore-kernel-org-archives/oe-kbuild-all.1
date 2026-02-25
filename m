Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3373AA18B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772020091; cv=none; b=FAUZv7dZhM2A8V5eVHHsLdf9LL6CleIGZW/GHblMMxypZamsrFJ9ChzV0M96nTS1tnVuavN3SXCzI/VWsvsTgUdWgEZ46/gH4cASuKz+Ktq1brDIqxPo0ukpmAXre3mRv7of4ep02S4ZZcdPhgfU1X6qqvRx96AUEjMTg96yY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772020091; c=relaxed/simple;
	bh=UpnA8wtNVColnP+f6tGOCuVaaBcr00UgkeO41u0tBoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uhsfs/FhZjpbXtxfSLn2epaUa0Muwp7onQ0V2bJFWg/vVDLC7W/H6Mo8GWdLgF4lgc7S5qrvYYZpXNpYc8tBJUPZ5TCWxBYxj7m9lWDR+eiUqQnjGWv43tMMTXTE19cYyjZ7U1dRLDU793Fji60a420XL/qtLB+KV8ijbXTqbuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLz/Jzva; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLz/Jzva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772020090; x=1803556090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpnA8wtNVColnP+f6tGOCuVaaBcr00UgkeO41u0tBoE=;
  b=TLz/Jzvaqc6HBDMTYqxqSQq4tCjbSWzVUr8K6A9Qu6v53MTpNk2rvw1f
   mfhm7h8CLq6rAOUUQFydCkMqfnKsP0URowrdxsrH7oVpjwib/rVBMKsS1
   Q2CTTW7RrSnv5ewB97Gz60EIR3N5UwB1bru8IEC0pQfg3hwKPG8wnbQ8w
   b7fSUNf4KZLSnJwhebHdgE9dvsBBwLcihOVFStWirhUBw8ufzENdQer9L
   9mWal896Tz9rygl9I4NQ86diWLZ9Ua6yXAzuPGo8zqwDvZgYDswFPNYZg
   iBMFi3h6KWhidWGw405fIjhqhGb5lI2Kg/tyHUoG5Uuu3Asu6n24c6NbH
   Q==;
X-CSE-ConnectionGUID: CtMzATxoSRipAFinLR+FGw==
X-CSE-MsgGUID: ithe9yAISYSMJzdfL2AJ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="60628198"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="60628198"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 03:48:09 -0800
X-CSE-ConnectionGUID: RKjEh+oaSsqDS9nrJz0DFg==
X-CSE-MsgGUID: OqEJDItzQUeoERxXGHJmaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="220816248"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2026 03:48:07 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvDN7-000000005UZ-0wjf;
	Wed, 25 Feb 2026 11:48:05 +0000
Date: Wed, 25 Feb 2026 19:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [drm-misc:for-linux-next 4/13]
 drivers/gpu/drm/i915/selftests/i915_active.c:326:28: error: 'struct
 dma_fence' has no member named 'lock'
Message-ID: <202602251941.3vqWv8ra-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Christian,

First bad commit (maybe != root cause):

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   2622649ad6cdbb3e77bfafc8c0fe686090b77f70
commit: 1f32f310a13c9fb67a9993ab67f596b3f960206f [4/13] dma-buf: inline spinlock for fence protection v5
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260225/202602251941.3vqWv8ra-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251941.3vqWv8ra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251941.3vqWv8ra-lkp@intel.com/

Note: the drm-misc/for-linux-next HEAD 2622649ad6cdbb3e77bfafc8c0fe686090b77f70 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_active.c:1177:
   drivers/gpu/drm/i915/selftests/i915_active.c: In function 'active_flush':
>> drivers/gpu/drm/i915/selftests/i915_active.c:326:28: error: 'struct dma_fence' has no member named 'lock'
     326 |         spin_lock_irq(fence->lock);
         |                            ^~
   drivers/gpu/drm/i915/selftests/i915_active.c:328:30: error: 'struct dma_fence' has no member named 'lock'
     328 |         spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
         |                              ^~


vim +326 drivers/gpu/drm/i915/selftests/i915_active.c

38813767c7c5d9 Chris Wilson 2019-11-01  316  
e3e7aeec3281af Chris Wilson 2020-03-06  317  static void active_flush(struct i915_active *ref,
e3e7aeec3281af Chris Wilson 2020-03-06  318  			 struct i915_active_fence *active)
e3e7aeec3281af Chris Wilson 2020-03-06  319  {
e3e7aeec3281af Chris Wilson 2020-03-06  320  	struct dma_fence *fence;
e3e7aeec3281af Chris Wilson 2020-03-06  321  
e3e7aeec3281af Chris Wilson 2020-03-06  322  	fence = xchg(__active_fence_slot(active), NULL);
e3e7aeec3281af Chris Wilson 2020-03-06  323  	if (!fence)
e3e7aeec3281af Chris Wilson 2020-03-06  324  		return;
e3e7aeec3281af Chris Wilson 2020-03-06  325  
e3e7aeec3281af Chris Wilson 2020-03-06 @326  	spin_lock_irq(fence->lock);
e3e7aeec3281af Chris Wilson 2020-03-06  327  	__list_del_entry(&active->cb.node);
e3e7aeec3281af Chris Wilson 2020-03-06  328  	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
e3e7aeec3281af Chris Wilson 2020-03-06  329  	atomic_dec(&ref->count);
e3e7aeec3281af Chris Wilson 2020-03-06  330  
e3e7aeec3281af Chris Wilson 2020-03-06  331  	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
e3e7aeec3281af Chris Wilson 2020-03-06  332  }
e3e7aeec3281af Chris Wilson 2020-03-06  333  

:::::: The code at line 326 was first introduced by commit
:::::: e3e7aeec3281af446d7410d6982020e1aa5795fc drm/i915/selftests: Apply a heavy handed flush to i915_active

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
