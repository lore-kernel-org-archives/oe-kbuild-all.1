Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CEFE56C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715496765; cv=none; b=fqDke5sTiFX1XmUzyx5A4tDv1DrNcql8bMpfuOSPxzdSusNiAsaeqXEAlB/2uN0JmNvzVt87vzyxPOTp7qkeaM2pKLqCgBLge0gMEJiVJIXrf0Yrr11p2/Yp3ryYz5Y2cPDiCYQ+2jfVcWmSuljaxgXS3beUamMECwb1swmgCR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715496765; c=relaxed/simple;
	bh=E15T5RCJKzz20S2I9UZNXD7S+8FVt5utlpTe5+NWjbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emI6Hetipq4YKU4KDS+2qYxKicWs4jFs7P3FzuI4DykhJnKgcsfZZdiCwpNTqDjRhQ1gQljYFSnPfDXCb0Cc/54v04fQgxpFhLG9H7VAB1DWK3udDkDoBddJrzOko2reE9o+NDW0MIs85hzqXrP5ECFhvQOTtEPcKLtLO+qoBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/kd7kVp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/kd7kVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715496764; x=1747032764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E15T5RCJKzz20S2I9UZNXD7S+8FVt5utlpTe5+NWjbU=;
  b=g/kd7kVpCyVVs3cOUgtH0YnwD09bKR803DcoOs4EnL/VCtwT9WSOJ4Oo
   MFfvKkmQ1N3lNEMmP/dUynN/6gJ3Z4XsbGbTj1pLJ41UyJBVuO0lrS6Kj
   ZN8BI6CrNxEMuHLCvvoiir1sb7qcmNLLlWsBVVCQH+I4YPzzxqys9tB6p
   O11v2j4hSpAt6btlP05sduYDCxuBW4QVRtPhSbgSytCTvv8hKyucvorvE
   6uGIYVDVl36bGftSCK83Hd5Latn2drjT0lthM8003kS/B13fCkv/b9Vb/
   48N2ZfZB4afgRXTu7Y+/4PD/4VnEfF/nwKP7VnziO3tLzu0juA39uBMQT
   A==;
X-CSE-ConnectionGUID: 0X4DocNLRUyv3G9NS8biqQ==
X-CSE-MsgGUID: v9jP0vfGSx6KCZmofIESfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="15259725"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="15259725"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 23:52:43 -0700
X-CSE-ConnectionGUID: 4NuYV5brRJilZwBzLt/t7w==
X-CSE-MsgGUID: 7Mvd5pWUQNKqYBObQuKzrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="30003443"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2024 23:52:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s634a-0008Gm-21;
	Sun, 12 May 2024 06:52:40 +0000
Date: Sun, 12 May 2024 14:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 166/177] drivers/gpu/drm/drm_gpuvm.c:2680:
 warning: Function parameter or struct member 'priv' not described in
 'drm_gpuvm_bo_unmap'
Message-ID: <202405121415.Yqr5yYRX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   1213cf25cd551a6dc57b5be9df35ccb955f0ab59
commit: 436416207fac1011fc79899107b63858640e7489 [166/177] drm/gpuvm: Add drm_gpuvm_bo_unmap()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240512/202405121415.Yqr5yYRX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121415.Yqr5yYRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121415.Yqr5yYRX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpuvm.c:2680: warning: Function parameter or struct member 'priv' not described in 'drm_gpuvm_bo_unmap'


vim +2680 drivers/gpu/drm/drm_gpuvm.c

  2666	
  2667	/**
  2668	 * drm_gpuvm_bo_unmap() - unmaps a GEM
  2669	 * @vm_bo: the &drm_gpuvm_bo abstraction
  2670	 *
  2671	 * This function calls the unmap callback for every GPUVA attached to a GEM.
  2672	 *
  2673	 * It is the callers responsibility to protect the GEMs GPUVA list against
  2674	 * concurrent access using the GEMs dma_resv lock.
  2675	 *
  2676	 * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
  2677	 */
  2678	int
  2679	drm_gpuvm_bo_unmap(struct drm_gpuvm_bo *vm_bo, void *priv)
> 2680	{
  2681		struct drm_gpuva_op *op;
  2682		int ret;
  2683	
  2684		if (unlikely(!vm_bo->vm))
  2685			return -EINVAL;
  2686	
  2687		const struct drm_gpuvm_ops *vm_ops = vm_bo->vm->ops;
  2688	
  2689		if (unlikely(!(vm_ops && vm_ops->sm_step_unmap)))
  2690			return -EINVAL;
  2691	
  2692		struct drm_gpuva_ops *ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
  2693	        if (IS_ERR(ops))
  2694	                return PTR_ERR(ops);
  2695	
  2696		drm_gpuva_for_each_op(op, ops) {
  2697			drm_WARN_ON(vm_bo->vm->drm, op->op != DRM_GPUVA_OP_UNMAP);
  2698	
  2699			ret = op_unmap_cb(vm_ops, priv, op->unmap.va, false);
  2700			if (ret)
  2701				goto cleanup;
  2702		}
  2703	
  2704	cleanup:
  2705		drm_gpuva_ops_free(vm_bo->vm, ops);
  2706		return ret;
  2707	}
  2708	EXPORT_SYMBOL_GPL(drm_gpuvm_bo_unmap);
  2709	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
