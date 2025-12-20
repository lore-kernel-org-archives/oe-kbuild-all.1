Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E712D47E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766242816; cv=none; b=fiiwEFd7LphcPL70F9E/upKlGF1lbVUF1iDguHEYv3sAsX+RW00vfNi/ew7vzvDvRiz0Uw+FL8KIFun8UV9E54JWkxEKNKP3iS7O0IpfCEd+aF4rlfeQ+6+ddNe8VxgMwdFBiMjuoUsf7R3cjgiXkr3tkR1RhRpl+mz18ejTSmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766242816; c=relaxed/simple;
	bh=V8fdbMRMQZPH9NOp9fcoAD+UuBKNg7Mj8ZOno1Q/jmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P0AM3Aj97uVoYBBgTssSp88J0fifTx+VBCbGYyGvd5mUC8f1385BUQVNr6GiSTY2GJH5fknFYVPtsKDSn9S5z+lrKD/kGTC1kqYgI5fe1pD33rwvkzRKu0KSOvqXpILuGypyu2piaAuSQL7lm3pFFp1ILdGNnr2+6ONi120QEPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPP/ZPSw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPP/ZPSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766242815; x=1797778815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V8fdbMRMQZPH9NOp9fcoAD+UuBKNg7Mj8ZOno1Q/jmY=;
  b=iPP/ZPSwu0EuXyLP92pcthbzWXtOvwZZM7vizYjvR5a+LWpsDPWauT/m
   PtG3OZTmDapKjGW5QAAG7OJf+klmtyZg2KjOcEUBPMdva9+ZFNhm5VdDl
   OjDjSEut5bfaOSNtyVqsmpWHFia3NBXE8yTkiQRiHbUmKsIFftspCWoDA
   R/BjNzHzAYucz9aGf0LJn24w3U1tQllqJZWqab8Srblk0JRQBLxU+Fhau
   u8VtzBhGcIJglEWs3gAmjHbxrvUYRtjfVM4IK3QXe5E3fAQqruy+2BBb4
   x9FMRFWaEhLavC3atqaQeL9FNY85OZ/KCMikxQTT5/TeiQNubLVQAcDxz
   g==;
X-CSE-ConnectionGUID: 1ddie0PZSAiXx6wh1T1/7Q==
X-CSE-MsgGUID: A7SE59trRnyrVYKwmzWgHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68254176"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68254176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:00:13 -0800
X-CSE-ConnectionGUID: eRg2B/bkROq/XWRhDd6G5w==
X-CSE-MsgGUID: ZJl9RacWR5+30qVGbv697A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204177192"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2025 07:00:11 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyRF-000000004hq-1AFT;
	Sat, 20 Dec 2025 15:00:09 +0000
Date: Sat, 20 Dec 2025 22:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202512202222.NmduejIx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 276e8beb2a0c390fdac8f11bb58d9fdf95a6d538 drm/amdgpu/userq: add force completion helpers
date:   4 months ago
config: parisc-randconfig-r112-20251219 (https://download.01.org/0day-ci/archive/20251220/202512202222.NmduejIx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202222.NmduejIx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202222.NmduejIx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:434:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13: sparse:    struct dma_fence *

vim +429 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

   418	
   419	static void
   420	amdgpu_userq_fence_driver_set_error(struct amdgpu_userq_fence *fence,
   421					    int error)
   422	{
   423		struct amdgpu_userq_fence_driver *fence_drv = fence->fence_drv;
   424		unsigned long flags;
   425		struct dma_fence *f;
   426	
   427		spin_lock_irqsave(&fence_drv->fence_list_lock, flags);
   428	
 > 429		f = rcu_dereference_protected(&fence->base,
   430					      lockdep_is_held(&fence_drv->fence_list_lock));
   431		if (f && !dma_fence_is_signaled_locked(f))
   432			dma_fence_set_error(f, error);
   433		spin_unlock_irqrestore(&fence_drv->fence_list_lock, flags);
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
