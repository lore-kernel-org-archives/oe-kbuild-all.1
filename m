Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F3A2AD04
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 06:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732343958; cv=none; b=GUbZk5+K5YZC2mo+80fa6VU8Wtz/zuV4Or/8rAcKiVq1whxVLGAvuk+N0757Sd/NnrqSD/FjcuvLg6wAzqlDuETnfQXELlc6k1arH9qzfwpcjeJgEhKMXFf0GRkpss2EdbxbEuRXQQmEXf1X8a5BatPhyG78/W7nQCWoP6SyPEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732343958; c=relaxed/simple;
	bh=+3lTpMI8UAOe9YFwCvSetqfozw/vPemsCeFVVisezEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cp2SiV8677tlzm41GdQ9vSo/ziUBJs3CZPid0TXMVF/HSU6l/JVgLJGG9ANq8lL8d2B8UHGeeELIZFd3UxuVZriir8T/srK/CJB9DcAtA5S/QIIwUOqBjujlS3YHxbZi64vjbLYSHWg6w4l+SMLJlqy7GQISCAuK6RsqI5zNZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0rK7THI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0rK7THI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732343957; x=1763879957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+3lTpMI8UAOe9YFwCvSetqfozw/vPemsCeFVVisezEE=;
  b=B0rK7THIyjEADTGbOcMdrIw44r4YkbwdvUfd5OonSzKInbL2JtUTzIaK
   CJ61Z5Y09ppwTB0oDB7ge2NzIXM3b7MQSLZSOwSLX5kfJTBATxczGfWmu
   NVtEkNZQgCFQ6cpWsI+s6c+3j1PMI3YFlFxLz+OsK66fIDNKn54Qhhnnd
   oqAxyytWBn5IqKszwXvFivJ/1l7gMiEwO1n+aIznJu4fbPci1dSzYrJsF
   xc4h+wzori5PEGMmXym9mp+11UAVHwQzICqD0cWIppmME1oRupJoqro1u
   4oUNvee+zbH/FqWQBzlhiLq2IMwZti5nE+1EXIIHtcMEg+Y0LR7mevhbi
   A==;
X-CSE-ConnectionGUID: H5Vp6oapSqe3sOcTR1bj+Q==
X-CSE-MsgGUID: O+CTv1BvRLKLMNw8T13vHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49923613"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="49923613"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 22:39:16 -0800
X-CSE-ConnectionGUID: MoDFdMRdTMKrvJR6E69bOw==
X-CSE-MsgGUID: rnze4ml0T3irFcbDZL9pcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="90407061"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Nov 2024 22:39:15 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEjnV-0004TX-1M;
	Sat, 23 Nov 2024 06:39:13 +0000
Date: Sat, 23 Nov 2024 14:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?unknown-8bit?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: [agd5f:amd-staging-drm-next 1356/1393]
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:379: warning: Function parameter
 or struct member 'dbuf' not described in 'amdgpu_bo_create_isp_user'
Message-ID: <202411231427.fXR7FF4q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   52a0eae4140af43141a217398938aaa26241fa39
commit: 6d3cf1db87759f22b624a38e503e13be80c27373 [1356/1393] drm/amd/amdgpu: Add support for isp buffers
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241123/202411231427.fXR7FF4q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231427.fXR7FF4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231427.fXR7FF4q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:379: warning: Function parameter or struct member 'dbuf' not described in 'amdgpu_bo_create_isp_user'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:379: warning: Excess function parameter 'dma_buf' description in 'amdgpu_bo_create_isp_user'


vim +379 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c

   355	
   356	/**
   357	 * amdgpu_bo_create_isp_user - create user BO for isp
   358	 *
   359	 * @adev: amdgpu device object
   360	 * @dma_buf: DMABUF handle for isp buffer
   361	 * @domain: where to place it
   362	 * @bo:  used to initialize BOs in structures
   363	 * @gpu_addr: GPU addr of the pinned BO
   364	 *
   365	 * Imports isp DMABUF to allocate and pin a user BO for isp internal use. It does
   366	 * GART alloc to generate gpu_addr for BO to make it accessible through the
   367	 * GART aperture for ISP HW.
   368	 *
   369	 * This function is exported to allow the V4L2 isp device external to drm device
   370	 * to create and access the isp user BO.
   371	 *
   372	 * Returns:
   373	 * 0 on success, negative error code otherwise.
   374	 */
   375	int amdgpu_bo_create_isp_user(struct amdgpu_device *adev,
   376				   struct dma_buf *dbuf, u32 domain, struct amdgpu_bo **bo,
   377				   u64 *gpu_addr)
   378	
 > 379	{
   380		struct drm_gem_object *gem_obj;
   381		int r;
   382	
   383		gem_obj = amdgpu_gem_prime_import(&adev->ddev, dbuf);
   384		*bo = gem_to_amdgpu_bo(gem_obj);
   385		if (!(*bo)) {
   386			dev_err(adev->dev, "failed to get valid isp user bo\n");
   387			return -EINVAL;
   388		}
   389	
   390		r = amdgpu_bo_reserve(*bo, false);
   391		if (r) {
   392			dev_err(adev->dev, "(%d) failed to reserve isp user bo\n", r);
   393			return r;
   394		}
   395	
   396		r = amdgpu_bo_pin(*bo, domain);
   397		if (r) {
   398			dev_err(adev->dev, "(%d) isp user bo pin failed\n", r);
   399			goto error_unreserve;
   400		}
   401	
   402		r = amdgpu_ttm_alloc_gart(&(*bo)->tbo);
   403		if (r) {
   404			dev_err(adev->dev, "%p bind failed\n", *bo);
   405			goto error_unpin;
   406		}
   407	
   408		if (!WARN_ON(!gpu_addr))
   409			*gpu_addr = amdgpu_bo_gpu_offset(*bo);
   410	
   411		amdgpu_bo_unreserve(*bo);
   412	
   413		return 0;
   414	
   415	error_unpin:
   416		amdgpu_bo_unpin(*bo);
   417	error_unreserve:
   418		amdgpu_bo_unreserve(*bo);
   419		amdgpu_bo_unref(bo);
   420	
   421		return r;
   422	}
   423	EXPORT_SYMBOL(amdgpu_bo_create_isp_user);
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
