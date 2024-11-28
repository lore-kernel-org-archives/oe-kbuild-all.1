Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCFA823D1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732816986; cv=none; b=cozsbgMyrWMRE6hn9RUHKNDbUyEcQCyjyoUL81ZfFdBC1A6HoGLx728fihr18j5C4mZm6uFfG/dYcDzWSihcpnUYRBAESNfdR6JYmLJXEK242L/OIq8lqQfcMzsC56z9en/8A3q23+AvftbWJR002Ha2LKDeW84rVUL8jBSgy+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732816986; c=relaxed/simple;
	bh=528D6MF0T1dOrBqql43iG7zO/edzY2/MPkih90qG/Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=piKViXQbms3WGtPAuppmQZENKUVtHBxnN3l0rQfyT5qNJYo5I57exSyaGV259AFSF7iiW/Yn49pL52ZFyt61x0R3xmBvjUcpc1R81tson/13jalMFndm5zRapStgdbSSIPXGz7MMFfYRN1XZsJFKbK2NzJIcdMpyFd+BdIaf/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KB7CLhmR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KB7CLhmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732816984; x=1764352984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=528D6MF0T1dOrBqql43iG7zO/edzY2/MPkih90qG/Mk=;
  b=KB7CLhmRfDgqzDsu4IwDqREPL5DArgMwXLjLx047K1DiqT0iMlukcIJ9
   PWW7oqDEk/YHwvmHdcUrQef5vf9n5xHUN6j8yiUmWGI2aZxYJ5pU4NH0l
   d4Wh9zjWdzW+LG6gOw9o+899QK1pcX8/UDp6yhcKMRCk2mkjppiAlcf+/
   4Rz8Ui133jQebC1yFT6naO5b7hbiuQX8jbMdTQeoQbgTrUlgj4LoHkJOR
   WsfrptooNyiJA5xROc4CXlreOr99DRcGpj3ChsaIf3lWgZA6mQz7W40w7
   MQlIhqq373ZidfSTpQtCow8lohDb0TDbzLHRfv3SA1qBBKalPy2s+YB2e
   w==;
X-CSE-ConnectionGUID: r0iZ/0zTSFGpTlozyKKU9w==
X-CSE-MsgGUID: x4FTKIs6QGaIoe+gWPlliw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36987992"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="36987992"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 10:03:03 -0800
X-CSE-ConnectionGUID: LKjIx3nYTmyMii2FdBSgdQ==
X-CSE-MsgGUID: tfer/8FnQXql+e3LYbmoJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="92174080"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2024 10:03:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGiqy-0009tT-0n;
	Thu, 28 Nov 2024 18:03:00 +0000
Date: Fri, 29 Nov 2024 02:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:gpu/feat-gettime 574/1045]
 drivers/gpu/drm/drm_gpuvm.c:2680: warning: Function parameter or struct
 member 'priv' not described in 'drm_gpuvm_bo_unmap'
Message-ID: <202411290104.HClHBf40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/feat-gettime
head:   cecfe574a0faf4c21d6f7a99cbf076223d7a04e6
commit: 3071faed85b4c2fc9d6de681d2059c02d56388ef [574/1045] drm/gpuvm: Add drm_gpuvm_bo_unmap()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241129/202411290104.HClHBf40-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290104.HClHBf40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290104.HClHBf40-lkp@intel.com/

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
