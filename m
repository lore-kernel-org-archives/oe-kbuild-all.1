Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3769D12B6B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 12:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683721773; x=1715257773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zd/GIJHU3rOEa1HvQb+xj4XYWv6tYKgsXvYoMSx+qYU=;
  b=PlxE4WmG4kvoGkOTRn95ylQKKU6dUFKfLb/bYmu4cM8cVwn6Epf6uOjb
   H2zkt40oWOtvcc+/O+ton+5D+Os/cU37duexw9WsXIYnwGzZGAofZ81GR
   J6mCyVJCWgL9m6068iVxRmJpulRe9xCdkJ4bXWK+/V+8tddc9JwlEr0De
   LjBm9xH3c9WyJ66YvnnhczswKOBmEX9SBGWr9O+9sidVfhHk4ZbhQ3sEo
   JLxM02hXxNkpaIGEyVYvOjeIzuXnmlFNq2FhjctgrruaMm+fMikB936If
   ZKbNuUaor5kWk1Ij39lAtAlDuBsMvkZ7WVGljfKqnQmBV5Q9+MxPRLNJB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350234307"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="350234307"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 05:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="699278877"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="699278877"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 May 2023 05:29:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwiwk-0003HK-0b;
	Wed, 10 May 2023 12:29:30 +0000
Date: Wed, 10 May 2023 20:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 58/58]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:278:5: warning: no previous
 prototype for 'amdgpu_try_dma_buf_mmap'
Message-ID: <202305102022.wWCG9fam-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   bb8c2f3d1febda3cf9c91ad7e7727f889c1dbb57
commit: bb8c2f3d1febda3cf9c91ad7e7727f889c1dbb57 [58/58] CHROMIUM: drm/amdgpu: Implement mmap of imported dma-bufs
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305102022.wWCG9fam-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout bb8c2f3d1febda3cf9c91ad7e7727f889c1dbb57
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102022.wWCG9fam-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:278:5: warning: no previous prototype for 'amdgpu_try_dma_buf_mmap' [-Wmissing-prototypes]
     278 | int amdgpu_try_dma_buf_mmap(struct file *filp, struct vm_area_struct *vma)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c: In function 'amdgpu_try_dma_buf_mmap':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:285:27: warning: variable 'bo' set but not used [-Wunused-but-set-variable]
     285 |         struct amdgpu_bo *bo = NULL;
         |                           ^~


vim +/amdgpu_try_dma_buf_mmap +278 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c

   277	
 > 278	int amdgpu_try_dma_buf_mmap(struct file *filp, struct vm_area_struct *vma)
   279	{
   280		struct drm_file *priv = filp->private_data;
   281		struct drm_device *dev = priv->minor->dev;
   282		struct amdgpu_device *adev = drm_to_adev(dev);
   283		struct ttm_device *bdev = &adev->mman.bdev;
   284		struct ttm_buffer_object *tbo = NULL;
 > 285		struct amdgpu_bo *bo = NULL;
   286		struct drm_gem_object *obj = NULL;
   287		struct drm_vma_offset_node *node;
   288		int ret;
   289	
   290		if (drm_dev_is_unplugged(dev))
   291			return -ENODEV;
   292	
   293		drm_vma_offset_lock_lookup(bdev->vma_manager);
   294		node = drm_vma_offset_exact_lookup_locked(bdev->vma_manager,
   295							  vma->vm_pgoff,
   296							  vma_pages(vma));
   297	
   298		if (likely(node)) {
   299			tbo = container_of(node, struct ttm_buffer_object,
   300					   base.vma_node);
   301			tbo = ttm_bo_get_unless_zero(tbo);
   302		}
   303		drm_vma_offset_unlock_lookup(bdev->vma_manager);
   304	
   305		if (!tbo)
   306			return -EINVAL;
   307	
   308		bo = ttm_to_amdgpu_bo(tbo);
   309		obj = &tbo->base;
   310	
   311		if (!obj->import_attach) {
   312			ret = -EINVAL;
   313			goto done;
   314		}
   315	
   316		ret = dma_buf_mmap(obj->import_attach->dmabuf, vma, 0);
   317	
   318	done:
   319		ttm_bo_put(tbo);
   320		return ret;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
