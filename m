Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D48028E7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 21:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757367963; cv=none; b=qeOwdE63rzJUAbD6Zz98kAAjNQPh9M9IMAE5Kfcz1W/uq1pUfDtcUlnULCJpaZF9j+rfZd2ZnTFWOiDIim59410Szlhzf3g+nIKhjQ/Kd1cT+Gn7YS+hq3m8QX1OYPmIRmlxVN5LFxv/wqIrzoq2c1D5BWr8madROqqGe0lZ4mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757367963; c=relaxed/simple;
	bh=+VBdwy5swQiE4wpXOskzg09ZHpNQB8sM4PKTKvC0OVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qEQdfqnDIFLyOay0bw0rKlEkdgYnrlJuVgVV02cNivK7jBp7V/yN0zxBy875B5zO4Wp7unnnr4ntGzUzUTiTcTBSsioDssfG1w/3JdKGfXva6bizQJnTFYRS1gYB5NgiMaDnnb2nieOIZgOfGF0sobDaQ/9oK3IAdQUkZhOvri4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBy2TpJl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBy2TpJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757367961; x=1788903961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VBdwy5swQiE4wpXOskzg09ZHpNQB8sM4PKTKvC0OVY=;
  b=EBy2TpJlXZwKtUd0iY0/tuEm1okwOTdXHqnj+L68ZBo5kZegrQkkHe0s
   McJriq6qZmGTc6ufeaPwt7cb7wWabLBAqv3Ca30sYgRTwOh2W3vVp/1ZE
   euiCtcDCmy7CVZxjRL9qlI8qehxf6WNMMJoMb9026etsZmww/SC7AoLy+
   H3aZeocjD1CgKVLcLXBaUotYtns5z/7XmZjKelfE1mX2+uGV0oLYVqxTa
   XlplqTCVuA8/Sfj9t3qzK+Y3RWqbk9O2/GJ1yb0Y5SRoPO10DnBTjO/s9
   7+TZ8C6FI43rvrxUWD48uBIBI4FSAMVptOcMjuGaQE2tB7c83yeex3mZq
   g==;
X-CSE-ConnectionGUID: aosG9U1aRN+9vF6PXuJWtw==
X-CSE-MsgGUID: kxl/eu6oTwmPg/dp258FwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59578183"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="59578183"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 14:46:00 -0700
X-CSE-ConnectionGUID: d8h1oU5dSZKxPF8kDlHv6g==
X-CSE-MsgGUID: LASpCzXcQca59DYWHwsgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203684955"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 14:45:58 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvjgS-0004BP-1a;
	Mon, 08 Sep 2025 21:45:56 +0000
Date: Tue, 9 Sep 2025 05:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 6487/7110]
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202509090529.Ftjikm1G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3e8e5822146bc396d2a7e5fbb7be13271665522a
commit: 276e8beb2a0c390fdac8f11bb58d9fdf95a6d538 [6487/7110] drm/amdgpu/userq: add force completion helpers
config: arc-randconfig-r123-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090529.Ftjikm1G-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250909/202509090529.Ftjikm1G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090529.Ftjikm1G-lkp@intel.com/

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
