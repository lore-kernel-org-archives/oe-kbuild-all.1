Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCA84C6B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 04:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYKVyz02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701751207; x=1733287207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yUKpdJx0jTCliiztHEgEC4zEe/B4VCrinfxKrtfnM3s=;
  b=XYKVyz02Fl4rC6e/AHM1gibrqPmpvcASjEK5ZsZPUJ1Vmy6JU9y11egn
   00E/gC1aP9seRg8yuT7Uk5XLFs5w0I+xng+DPK6Exv5GDmv67qopHQcL0
   pSLKgCMKZhQySwAEhylt4zwCISDf5mM/TYfPxobH4qAqX/RVfwo25+da3
   2ueTT8pCw1eZ95HfD5+M6kWgxNofKt+CliZwlJGAosrTNQyl9UUx7JSNz
   CIGOGo9ItEUvRxymeOkpqfv1LOQZo6AshqJ11bhnpath8bp5w2cHoVC0r
   99WeejhW3cUpWM3ubZGVeLXKJ104oFGiJ5jsjUDvdQ1zX2MqrA/obqLrv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="717837"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="717837"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 20:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="720565437"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="720565437"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Dec 2023 20:40:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rANE2-0008Lk-35;
	Tue, 05 Dec 2023 04:40:02 +0000
Date: Tue, 5 Dec 2023 12:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 12/14] drm/panthor: Allow driver compilation
Message-ID: <202312051231.xeR6rO2B-lkp@intel.com>
References: <20231204173313.2098733-13-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204173313.2098733-13-boris.brezillon@collabora.com>

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc4 next-20231204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-panthor-Add-GPU-register-definitions/20231205-023301
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231204173313.2098733-13-boris.brezillon%40collabora.com
patch subject: [PATCH v3 12/14] drm/panthor: Allow driver compilation
config: alpha-randconfig-r122-20231205 (https://download.01.org/0day-ci/archive/20231205/202312051231.xeR6rO2B-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312051231.xeR6rO2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051231.xeR6rO2B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panthor/panthor_gem.c:98:24: sparse: sparse: Using plain integer as NULL pointer

vim +98 drivers/gpu/drm/panthor/panthor_gem.c

b982314ad8e9c0 Boris Brezillon 2023-12-04   57  
b982314ad8e9c0 Boris Brezillon 2023-12-04   58  /**
b982314ad8e9c0 Boris Brezillon 2023-12-04   59   * panthor_kernel_bo_create() - Create and map a GEM object to a VM
b982314ad8e9c0 Boris Brezillon 2023-12-04   60   * @ptdev: Device.
b982314ad8e9c0 Boris Brezillon 2023-12-04   61   * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
b982314ad8e9c0 Boris Brezillon 2023-12-04   62   * @size: Size of the buffer object.
b982314ad8e9c0 Boris Brezillon 2023-12-04   63   * @bo_flags: Combination of drm_panthor_bo_flags flags.
b982314ad8e9c0 Boris Brezillon 2023-12-04   64   * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
b982314ad8e9c0 Boris Brezillon 2023-12-04   65   * that are related to map operations).
b982314ad8e9c0 Boris Brezillon 2023-12-04   66   * @gpu_va: GPU address assigned when mapping to the VM.
b982314ad8e9c0 Boris Brezillon 2023-12-04   67   * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
b982314ad8e9c0 Boris Brezillon 2023-12-04   68   * automatically allocated.
b982314ad8e9c0 Boris Brezillon 2023-12-04   69   *
b982314ad8e9c0 Boris Brezillon 2023-12-04   70   * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
b982314ad8e9c0 Boris Brezillon 2023-12-04   71   */
b982314ad8e9c0 Boris Brezillon 2023-12-04   72  struct panthor_kernel_bo *
b982314ad8e9c0 Boris Brezillon 2023-12-04   73  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
b982314ad8e9c0 Boris Brezillon 2023-12-04   74  			 size_t size, u32 bo_flags, u32 vm_map_flags,
b982314ad8e9c0 Boris Brezillon 2023-12-04   75  			 u64 gpu_va)
b982314ad8e9c0 Boris Brezillon 2023-12-04   76  {
b982314ad8e9c0 Boris Brezillon 2023-12-04   77  	struct drm_gem_shmem_object *obj;
b982314ad8e9c0 Boris Brezillon 2023-12-04   78  	struct panthor_kernel_bo *kbo;
b982314ad8e9c0 Boris Brezillon 2023-12-04   79  	struct panthor_gem_object *bo;
b982314ad8e9c0 Boris Brezillon 2023-12-04   80  	int ret;
b982314ad8e9c0 Boris Brezillon 2023-12-04   81  
b982314ad8e9c0 Boris Brezillon 2023-12-04   82  	kbo = kzalloc(sizeof(*kbo), GFP_KERNEL);
b982314ad8e9c0 Boris Brezillon 2023-12-04   83  	if (!kbo)
b982314ad8e9c0 Boris Brezillon 2023-12-04   84  		return ERR_PTR(-ENOMEM);
b982314ad8e9c0 Boris Brezillon 2023-12-04   85  
b982314ad8e9c0 Boris Brezillon 2023-12-04   86  	obj = drm_gem_shmem_create(&ptdev->base, size);
b982314ad8e9c0 Boris Brezillon 2023-12-04   87  	if (IS_ERR(obj)) {
b982314ad8e9c0 Boris Brezillon 2023-12-04   88  		ret = PTR_ERR(obj);
b982314ad8e9c0 Boris Brezillon 2023-12-04   89  		goto err_free_bo;
b982314ad8e9c0 Boris Brezillon 2023-12-04   90  	}
b982314ad8e9c0 Boris Brezillon 2023-12-04   91  
b982314ad8e9c0 Boris Brezillon 2023-12-04   92  	bo = to_panthor_bo(&obj->base);
b982314ad8e9c0 Boris Brezillon 2023-12-04   93  	size = obj->base.size;
b982314ad8e9c0 Boris Brezillon 2023-12-04   94  	kbo->obj = &obj->base;
b982314ad8e9c0 Boris Brezillon 2023-12-04   95  	bo->flags = bo_flags;
b982314ad8e9c0 Boris Brezillon 2023-12-04   96  
b982314ad8e9c0 Boris Brezillon 2023-12-04   97  	if (!vm)
b982314ad8e9c0 Boris Brezillon 2023-12-04  @98  		return 0;
b982314ad8e9c0 Boris Brezillon 2023-12-04   99  
b982314ad8e9c0 Boris Brezillon 2023-12-04  100  	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
b982314ad8e9c0 Boris Brezillon 2023-12-04  101  	if (ret)
b982314ad8e9c0 Boris Brezillon 2023-12-04  102  		goto err_put_obj;
b982314ad8e9c0 Boris Brezillon 2023-12-04  103  
b982314ad8e9c0 Boris Brezillon 2023-12-04  104  	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
b982314ad8e9c0 Boris Brezillon 2023-12-04  105  	if (ret)
b982314ad8e9c0 Boris Brezillon 2023-12-04  106  		goto err_free_va;
b982314ad8e9c0 Boris Brezillon 2023-12-04  107  
b982314ad8e9c0 Boris Brezillon 2023-12-04  108  	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
b982314ad8e9c0 Boris Brezillon 2023-12-04  109  	drm_gem_object_get(bo->exclusive_vm_root_gem);
b982314ad8e9c0 Boris Brezillon 2023-12-04  110  	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
b982314ad8e9c0 Boris Brezillon 2023-12-04  111  	return kbo;
b982314ad8e9c0 Boris Brezillon 2023-12-04  112  
b982314ad8e9c0 Boris Brezillon 2023-12-04  113  err_free_va:
b982314ad8e9c0 Boris Brezillon 2023-12-04  114  	panthor_vm_free_va(vm, &kbo->va_node);
b982314ad8e9c0 Boris Brezillon 2023-12-04  115  
b982314ad8e9c0 Boris Brezillon 2023-12-04  116  err_put_obj:
b982314ad8e9c0 Boris Brezillon 2023-12-04  117  	drm_gem_object_put(&obj->base);
b982314ad8e9c0 Boris Brezillon 2023-12-04  118  
b982314ad8e9c0 Boris Brezillon 2023-12-04  119  err_free_bo:
b982314ad8e9c0 Boris Brezillon 2023-12-04  120  	kfree(kbo);
b982314ad8e9c0 Boris Brezillon 2023-12-04  121  	return ERR_PTR(ret);
b982314ad8e9c0 Boris Brezillon 2023-12-04  122  }
b982314ad8e9c0 Boris Brezillon 2023-12-04  123  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
