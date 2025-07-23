Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80981220F5D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 17:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292739; cv=none; b=rkjpCxoGC3iSY3ih78t15C5/iJP80N3fQZfGAHhuyqwCXg1Hlk5UZxGHouKnm7NGo4cDqcwXGQpzjSlhVyWEINad8ZmKZ7V0TvIA5B/V/Yt8xqaOQzVg/W+Ern5VeX2nQyEG0v75RHKLJhk5H3qC1mlNz/Xw3ps4PQfDzEx+3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292739; c=relaxed/simple;
	bh=we3xupXK+0GMqAiDt5xDcwoEY9t/2JzTO8H8PNR8K2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kJchdWimW8Ob+0xNFP/qmh8o5l6HjcXt8Fou0RLI+k2lvzMOMBjZHn6pTKZO+T1sUsumyoOwlMogmH3mlDldkRIGotUz5DHYEj2Assb7p1e3biCBd+//DkCNiY6fv5zdD6iS2xkN8cVj4JcLDKLPcB5xIldVEpMhzaPrBnMcLKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFFbxwv8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFFbxwv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753292738; x=1784828738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=we3xupXK+0GMqAiDt5xDcwoEY9t/2JzTO8H8PNR8K2w=;
  b=CFFbxwv8i9P/1Abyfp7q/MI1Is7yRGsYMtEUl2Z+Vs0ly76kK+ebITGb
   dQ795McCtkr/zE/2rplB/4A/YJIK+W02QlpHLVxd+xfRjeo1Uh/x7DOE9
   wx/uDxYp19rJOxdb2dbFp/qtQPfXD2hDL+yCH6dIhCO2iZoBO21Fj3VS2
   VybL6PMolrPAUguxUnpy0F1ixhPiI/w4625xE3uPCYRbUBVgMkdTKsx+G
   fmmPhAY+VpIXYxVF3kb56qk1HmpQ8hcMojwfGUqJ/xynktNe5S5PAe0/6
   qlejLo62W5j3p91ExUiaoO8pK1jKxGhcZ40DCviufEdU4BsNIMvVNN4If
   A==;
X-CSE-ConnectionGUID: bJhncBnmQeiqdeWepxyWwA==
X-CSE-MsgGUID: BEQbo/O2S+mc+mjKu4GFVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73043038"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="73043038"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:45:34 -0700
X-CSE-ConnectionGUID: uZM1j6NzTh2C7dwL9x2DCA==
X-CSE-MsgGUID: OS4YDBWnSiSywSJx/PdTxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="159417979"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2025 10:45:33 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uedX0-000019-1y;
	Wed, 23 Jul 2025 17:45:30 +0000
Date: Wed, 23 Jul 2025 17:18:15 +0200
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [agd5f:kq_resets 2304/2346]
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:174: warning: Function parameter or
 struct member 'dmabuf' not described in 'isp_user_buffer_alloc'
Message-ID: <202507231758.GS93qDWN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git kq_resets
head:   524eebfdd4b30fd63ca774d7ea346bcf0e8e76b1
commit: 5cab8cc383a58877fa0fd9eb566e68b815500cdf [2304/2346] drm/amd/amdgpu: Add helper functions for isp buffers
config: i386-buildonly-randconfig-2003-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231758.GS93qDWN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231758.GS93qDWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231758.GS93qDWN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:174: warning: Function parameter or struct member 'dmabuf' not described in 'isp_user_buffer_alloc'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c:174: warning: Excess function parameter 'dma_buf' description in 'isp_user_buffer_alloc'


vim +174 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c

   153	
   154	/**
   155	 * isp_user_buffer_alloc - create user buffer object (BO) for isp
   156	 *
   157	 * @dev: isp device handle
   158	 * @dma_buf: DMABUF handle for isp buffer allocated in system memory
   159	 * @buf_obj: GPU buffer object handle to initialize
   160	 * @buf_addr: GPU addr of the pinned BO to initialize
   161	 *
   162	 * Imports isp DMABUF to allocate and pin a user BO for isp internal use. It does
   163	 * GART alloc to generate GPU addr for BO to make it accessible through the
   164	 * GART aperture for ISP HW.
   165	 *
   166	 * This function is exported to allow the V4L2 isp device external to drm device
   167	 * to create and access the isp user BO.
   168	 *
   169	 * Returns:
   170	 * 0 on success, negative error code otherwise.
   171	 */
   172	int isp_user_buffer_alloc(struct device *dev, void *dmabuf,
   173				  void **buf_obj, u64 *buf_addr)
 > 174	{
   175		struct platform_device *ispdev = to_platform_device(dev);
   176		const struct isp_platform_data *isp_pdata;
   177		struct amdgpu_device *adev;
   178		struct mfd_cell *mfd_cell;
   179		struct amdgpu_bo *bo;
   180		u64 gpu_addr;
   181		int ret;
   182	
   183		if (WARN_ON(!ispdev))
   184			return -ENODEV;
   185	
   186		if (WARN_ON(!buf_obj))
   187			return -EINVAL;
   188	
   189		if (WARN_ON(!buf_addr))
   190			return -EINVAL;
   191	
   192		mfd_cell = &ispdev->mfd_cell[0];
   193		if (!mfd_cell)
   194			return -ENODEV;
   195	
   196		isp_pdata = mfd_cell->platform_data;
   197		adev = isp_pdata->adev;
   198	
   199		ret = is_valid_isp_device(ispdev->dev.parent, adev->dev);
   200		if (ret)
   201			return ret;
   202	
   203		ret = amdgpu_bo_create_isp_user(adev, dmabuf,
   204						AMDGPU_GEM_DOMAIN_GTT, &bo, &gpu_addr);
   205		if (ret) {
   206			drm_err(&adev->ddev, "failed to alloc gart user buffer (%d)", ret);
   207			return ret;
   208		}
   209	
   210		*buf_obj = (void *)bo;
   211		*buf_addr = gpu_addr;
   212	
   213		return 0;
   214	}
   215	EXPORT_SYMBOL(isp_user_buffer_alloc);
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
