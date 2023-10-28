Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DED39F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 01:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8AaLJRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698455224; x=1729991224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8G3uWKWYqYtPRnMz+AtmrSMgcy3McXkM5DzW/5ZBEI=;
  b=L8AaLJRtbKr0zlsHZF0go2QaHIlv9j3p+wRLB7ziKmlsMa9HUskrftms
   Z4PKfpSAWhBTfhuW2vai3ui+2zICQ8NmO8asZ1QbC3lfsbKSHOnUFqAHJ
   LweP0C1lepiBLHySbRnCYpCMDRtE9UN4lNJbTjXSKV9RMi0DATJwKA37t
   M7gvdEweTEoxo5/fvbR4RcNgqzgbL+hhO+sglsn5AwaR/g7t4AxrbZFD+
   ++9VFUyfYXigHgYpVTc1sGKk/awnutiniK+rLaSn00+4i9uCzdNN4ve34
   RXpNIU2nXF23YzqlfS1AazQpYuhgUZN1Hnp2FOpB/m6Aw8mFptliyMAHk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474109973"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="474109973"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 18:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="903446294"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="903446294"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2023 18:04:32 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwXn2-000BKc-0A;
	Sat, 28 Oct 2023 01:07:00 +0000
Date: Sat, 28 Oct 2023 09:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 14/14]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:279:5: warning: no previous
 prototype for 'amdgpu_try_dma_buf_mmap'
Message-ID: <202310280843.0k4Etil3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   43687fc30e87bae87e23591557473682303a6e65
commit: 43687fc30e87bae87e23591557473682303a6e65 [14/14] CHROMIUM: drm/amdgpu: Implement mmap of imported dma-bufs
config: arm-randconfig-002-20231028 (https://download.01.org/0day-ci/archive/20231028/202310280843.0k4Etil3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280843.0k4Etil3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280843.0k4Etil3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:279:5: warning: no previous prototype for 'amdgpu_try_dma_buf_mmap' [-Wmissing-prototypes]
     279 | int amdgpu_try_dma_buf_mmap(struct file *filp, struct vm_area_struct *vma)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c: In function 'amdgpu_try_dma_buf_mmap':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:286:27: warning: variable 'bo' set but not used [-Wunused-but-set-variable]
     286 |         struct amdgpu_bo *bo = NULL;
         |                           ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +/amdgpu_try_dma_buf_mmap +279 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c

   278	
 > 279	int amdgpu_try_dma_buf_mmap(struct file *filp, struct vm_area_struct *vma)
   280	{
   281		struct drm_file *priv = filp->private_data;
   282		struct drm_device *dev = priv->minor->dev;
   283		struct amdgpu_device *adev = drm_to_adev(dev);
   284		struct ttm_device *bdev = &adev->mman.bdev;
   285		struct ttm_buffer_object *tbo = NULL;
 > 286		struct amdgpu_bo *bo = NULL;
   287		struct drm_gem_object *obj = NULL;
   288		struct drm_vma_offset_node *node;
   289		int ret;
   290	
   291		if (drm_dev_is_unplugged(dev))
   292			return -ENODEV;
   293	
   294		drm_vma_offset_lock_lookup(bdev->vma_manager);
   295		node = drm_vma_offset_exact_lookup_locked(bdev->vma_manager,
   296							  vma->vm_pgoff,
   297							  vma_pages(vma));
   298	
   299		if (likely(node)) {
   300			tbo = container_of(node, struct ttm_buffer_object,
   301					   base.vma_node);
   302			tbo = ttm_bo_get_unless_zero(tbo);
   303		}
   304		drm_vma_offset_unlock_lookup(bdev->vma_manager);
   305	
   306		if (!tbo)
   307			return -EINVAL;
   308	
   309		bo = ttm_to_amdgpu_bo(tbo);
   310		obj = &tbo->base;
   311	
   312		if (!obj->import_attach) {
   313			ret = -EINVAL;
   314			goto done;
   315		}
   316	
   317		ret = dma_buf_mmap(obj->import_attach->dmabuf, vma, 0);
   318	
   319	done:
   320		ttm_bo_put(tbo);
   321		return ret;
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
