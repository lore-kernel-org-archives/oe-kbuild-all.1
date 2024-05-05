Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4661576033
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 21:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714945868; cv=none; b=ua3NwQ/UoHWAoYkoQaf54FYC4+Ukt9uI8iiVLvyBNgewt1cWcEkdkU5G/j/QhqDxN36fU6BcCCS6J4e4VB+8Px5bNbdc3iuDbXUowoDGuUKmMWqXl866njkhwZv3IDKor6LcTxE9fBBQkB4zmoz0cjkwAslqb2cQWASwZdoQRUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714945868; c=relaxed/simple;
	bh=3w3cXBpgHYRCxjg9v/YURNZzzHSEZf19ncjYnzpTq+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCob+3imzlLOHOe19uZVFZYQt6/edDbTCoLlI4kexh9NXmsIsRHckQ1grhAJkEXktouP22THNJGGefb0YK+nhxmMA2q1o2jmwWrjyoIRLeBXazTNVWKq95ap7idO0avHqqQrbRX3ge5CY2qgHGEPlsF9PEgMqz0HxrB9+tTdXuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPtqsqxI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPtqsqxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714945865; x=1746481865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3w3cXBpgHYRCxjg9v/YURNZzzHSEZf19ncjYnzpTq+I=;
  b=TPtqsqxIevhQFWG7l7JFGyJAGKM5BEkW7cMas+i2+qB2SUwxlkIiuwke
   lLFq+hptGouk851ngo1XMnQa7QxX/W4mTPdHnynuuW/yZXBJGw07VBRL5
   Q0jcwQFs8Jo6XGecO5BM+YcrJbMV5uQ5fcfpeh2eC9ThODAxNraUUcxOk
   58RN3/sNhtti2uLCFiYQLqfgp1ev5m1o5mEWb1E0v5TNRorjqTLSKGxXU
   e6hIhlR1g5Bqd/e4G37NDToFXvBLl+fsZsOlnbOIisCIsOuoGwQzZ6kmC
   U9D//HOxQ2mJDzlNmNBxwFoyqL32YN6SuwxD6lW4dS9/UfvWkbrkFcdvE
   g==;
X-CSE-ConnectionGUID: vvtHSa2TS16EE+6a8rLnpw==
X-CSE-MsgGUID: WVwOqZjpTcyJd8hmM021uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21233506"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="21233506"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 14:51:04 -0700
X-CSE-ConnectionGUID: 4KaC40RET1aPGvzBvjwy2w==
X-CSE-MsgGUID: qPEQ3/ImTp+p0dRwz5AYUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32482476"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2024 14:51:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3jl6-0000ES-33;
	Sun, 05 May 2024 21:51:00 +0000
Date: Mon, 6 May 2024 05:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3403/30000]
 drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:110:24: warning:
 no previous prototype for 'viv_gem_prime_import'
Message-ID: <202405060556.rTYXYFzz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: c7fdcea5d4f61d6ac30340e7752cf8730a24b1f3 [3403/30000] MGS-6058 [#imx-2391] fix vivante drm build break for L5.10
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240506/202405060556.rTYXYFzz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060556.rTYXYFzz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060556.rTYXYFzz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/arm/mm: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:86:17: warning: no previous prototype for 'viv_gem_prime_export' [-Wmissing-prototypes]
      86 | struct dma_buf *viv_gem_prime_export(struct drm_gem_object *gem_obj,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:110:24: warning: no previous prototype for 'viv_gem_prime_import' [-Wmissing-prototypes]
     110 | struct drm_gem_object *viv_gem_prime_import(struct drm_device *drm,
         |                        ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:152:6: warning: no previous prototype for 'viv_gem_free_object' [-Wmissing-prototypes]
     152 | void viv_gem_free_object(struct drm_gem_object *gem_obj)
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:69:
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c: In function 'viv_ioctl_gem_create':
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: error: implicit declaration of function 'drm_gem_object_put_locked'; did you mean 'drm_gem_object_lookup'? [-Werror=implicit-function-declaration]
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:235:5: note: in expansion of macro 'drm_gem_object_unreference_unlocked'
     235 |     drm_gem_object_unreference_unlocked(gem_obj);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:173:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     173 |     int ret = 0;
         |         ^~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c: At top level:
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:746:5: warning: no previous prototype for 'viv_drm_open' [-Wmissing-prototypes]
     746 | int viv_drm_open(struct drm_device *drm, struct drm_file *file)
         |     ^~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:766:6: warning: no previous prototype for 'viv_drm_postclose' [-Wmissing-prototypes]
     766 | void viv_drm_postclose(struct drm_device *drm, struct drm_file *file)
         |      ^~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:803:6: error: 'struct drm_driver' has no member named 'gem_free_object_unlocked'
     803 |     .gem_free_object_unlocked = viv_gem_free_object,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:803:33: error: initialization of 'void (*)(struct drm_device *)' from incompatible pointer type 'void (*)(struct drm_gem_object *)' [-Werror=incompatible-pointer-types]
     803 |     .gem_free_object_unlocked = viv_gem_free_object,
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:803:33: note: (near initialization for 'viv_drm_driver.lastclose')
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:809:6: error: 'struct drm_driver' has no member named 'gem_prime_export'; did you mean 'gem_prime_import'?
     809 |     .gem_prime_export   = viv_gem_prime_export,
         |      ^~~~~~~~~~~~~~~~
         |      gem_prime_import
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:809:27: error: initialization of 'struct drm_gem_object * (*)(struct drm_device *, struct dma_buf *)' from incompatible pointer type 'struct dma_buf * (*)(struct drm_gem_object *, int)' [-Werror=incompatible-pointer-types]
     809 |     .gem_prime_export   = viv_gem_prime_export,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:809:27: note: (near initialization for 'viv_drm_driver.gem_prime_import')
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:810:27: warning: initialized field overwritten [-Woverride-init]
     810 |     .gem_prime_import   = viv_gem_prime_import,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:810:27: note: (near initialization for 'viv_drm_driver.gem_prime_import')
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:821:5: warning: no previous prototype for 'viv_drm_probe' [-Wmissing-prototypes]
     821 | int viv_drm_probe(struct device *dev)
         |     ^~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:863:5: warning: no previous prototype for 'viv_drm_remove' [-Wmissing-prototypes]
     863 | int viv_drm_remove(struct device *dev)
         |     ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/viv_gem_prime_import +110 drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c

3dcab85234f3a47 Xianzhong     2019-01-29   84  
8f28c6e2fb2b56f Richard Liu   2019-12-25   85  #if LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,0)
8f28c6e2fb2b56f Richard Liu   2019-12-25  @86  struct dma_buf *viv_gem_prime_export(struct drm_gem_object *gem_obj,
8f28c6e2fb2b56f Richard Liu   2019-12-25   87                  int flags)
8f28c6e2fb2b56f Richard Liu   2019-12-25   88  {
8f28c6e2fb2b56f Richard Liu   2019-12-25   89      struct drm_device *drm = gem_obj->dev;
8f28c6e2fb2b56f Richard Liu   2019-12-25   90  #else
3dcab85234f3a47 Xianzhong     2019-01-29   91  struct dma_buf *viv_gem_prime_export(struct drm_device *drm,
3dcab85234f3a47 Xianzhong     2019-01-29   92                  struct drm_gem_object *gem_obj,
3dcab85234f3a47 Xianzhong     2019-01-29   93                  int flags)
3dcab85234f3a47 Xianzhong     2019-01-29   94  {
8f28c6e2fb2b56f Richard Liu   2019-12-25   95  #endif
3dcab85234f3a47 Xianzhong     2019-01-29   96      struct viv_gem_object *viv_obj = container_of(gem_obj, struct viv_gem_object, base);
3dcab85234f3a47 Xianzhong     2019-01-29   97      struct dma_buf *dmabuf = gcvNULL;
3dcab85234f3a47 Xianzhong     2019-01-29   98      gckGALDEVICE gal_dev = (gckGALDEVICE)drm->dev_private;
3dcab85234f3a47 Xianzhong     2019-01-29   99  
3dcab85234f3a47 Xianzhong     2019-01-29  100      if (gal_dev)
3dcab85234f3a47 Xianzhong     2019-01-29  101      {
3dcab85234f3a47 Xianzhong     2019-01-29  102          gckKERNEL kernel = gal_dev->device->map[gal_dev->device->defaultHwType].kernels[0];
41dc8391b73c360 Minjie Zhuang 2019-09-23  103          gcmkVERIFY_OK(gckVIDMEM_NODE_Export(kernel, viv_obj->node_object, flags,
3dcab85234f3a47 Xianzhong     2019-01-29  104                                              (gctPOINTER*)&dmabuf, gcvNULL));
3dcab85234f3a47 Xianzhong     2019-01-29  105      }
3dcab85234f3a47 Xianzhong     2019-01-29  106  
3dcab85234f3a47 Xianzhong     2019-01-29  107      return dmabuf;
3dcab85234f3a47 Xianzhong     2019-01-29  108  }
3dcab85234f3a47 Xianzhong     2019-01-29  109  
3dcab85234f3a47 Xianzhong     2019-01-29 @110  struct drm_gem_object *viv_gem_prime_import(struct drm_device *drm,
3dcab85234f3a47 Xianzhong     2019-01-29  111                                              struct dma_buf *dmabuf)
3dcab85234f3a47 Xianzhong     2019-01-29  112  {
3dcab85234f3a47 Xianzhong     2019-01-29  113      struct drm_gem_object *gem_obj = gcvNULL;
3dcab85234f3a47 Xianzhong     2019-01-29  114      struct viv_gem_object *viv_obj;
3dcab85234f3a47 Xianzhong     2019-01-29  115  
3dcab85234f3a47 Xianzhong     2019-01-29  116      gcsHAL_INTERFACE iface;
3dcab85234f3a47 Xianzhong     2019-01-29  117      gckGALDEVICE gal_dev;
3dcab85234f3a47 Xianzhong     2019-01-29  118      gckKERNEL kernel;
3dcab85234f3a47 Xianzhong     2019-01-29  119      gctUINT32 processID;
3dcab85234f3a47 Xianzhong     2019-01-29  120      gckVIDMEM_NODE nodeObject;
3dcab85234f3a47 Xianzhong     2019-01-29  121      gceSTATUS status = gcvSTATUS_OK;
3dcab85234f3a47 Xianzhong     2019-01-29  122  
3dcab85234f3a47 Xianzhong     2019-01-29  123      gal_dev = (gckGALDEVICE)drm->dev_private;
3dcab85234f3a47 Xianzhong     2019-01-29  124      if (!gal_dev)
3dcab85234f3a47 Xianzhong     2019-01-29  125      {
3dcab85234f3a47 Xianzhong     2019-01-29  126          gcmkONERROR(gcvSTATUS_INVALID_ARGUMENT);
3dcab85234f3a47 Xianzhong     2019-01-29  127      }
3dcab85234f3a47 Xianzhong     2019-01-29  128  
3dcab85234f3a47 Xianzhong     2019-01-29  129      gckOS_ZeroMemory(&iface, sizeof(iface));
3dcab85234f3a47 Xianzhong     2019-01-29  130      iface.command = gcvHAL_WRAP_USER_MEMORY;
3dcab85234f3a47 Xianzhong     2019-01-29  131      iface.hardwareType = gal_dev->device->defaultHwType;
3dcab85234f3a47 Xianzhong     2019-01-29  132      iface.u.WrapUserMemory.desc.flag = gcvALLOC_FLAG_DMABUF;
3dcab85234f3a47 Xianzhong     2019-01-29  133      iface.u.WrapUserMemory.desc.handle = -1;
3dcab85234f3a47 Xianzhong     2019-01-29  134      iface.u.WrapUserMemory.desc.dmabuf = gcmPTR_TO_UINT64(dmabuf);
3dcab85234f3a47 Xianzhong     2019-01-29  135      gcmkONERROR(gckDEVICE_Dispatch(gal_dev->device, &iface));
3dcab85234f3a47 Xianzhong     2019-01-29  136  
3dcab85234f3a47 Xianzhong     2019-01-29  137      kernel = gal_dev->device->map[gal_dev->device->defaultHwType].kernels[0];
3dcab85234f3a47 Xianzhong     2019-01-29  138      gcmkONERROR(gckOS_GetProcessID(&processID));
3dcab85234f3a47 Xianzhong     2019-01-29  139      gcmkONERROR(gckVIDMEM_HANDLE_Lookup(kernel, processID, iface.u.WrapUserMemory.node, &nodeObject));
3dcab85234f3a47 Xianzhong     2019-01-29  140  
3dcab85234f3a47 Xianzhong     2019-01-29  141      /* ioctl output */
3dcab85234f3a47 Xianzhong     2019-01-29  142      gem_obj = kzalloc(sizeof(struct viv_gem_object), GFP_KERNEL);
3dcab85234f3a47 Xianzhong     2019-01-29  143      drm_gem_private_object_init(drm, gem_obj, dmabuf->size);
3dcab85234f3a47 Xianzhong     2019-01-29  144      viv_obj = container_of(gem_obj, struct viv_gem_object, base);
3dcab85234f3a47 Xianzhong     2019-01-29  145      viv_obj->node_handle = iface.u.WrapUserMemory.node;
3dcab85234f3a47 Xianzhong     2019-01-29  146      viv_obj->node_object = nodeObject;
3dcab85234f3a47 Xianzhong     2019-01-29  147  
3dcab85234f3a47 Xianzhong     2019-01-29  148  OnError:
3dcab85234f3a47 Xianzhong     2019-01-29  149      return gem_obj;
3dcab85234f3a47 Xianzhong     2019-01-29  150  }
3dcab85234f3a47 Xianzhong     2019-01-29  151  
3dcab85234f3a47 Xianzhong     2019-01-29  152  void viv_gem_free_object(struct drm_gem_object *gem_obj)
3dcab85234f3a47 Xianzhong     2019-01-29  153  {
3dcab85234f3a47 Xianzhong     2019-01-29  154      struct viv_gem_object *viv_obj = container_of(gem_obj, struct viv_gem_object, base);
3dcab85234f3a47 Xianzhong     2019-01-29  155      struct drm_device *drm = gem_obj->dev;
3dcab85234f3a47 Xianzhong     2019-01-29  156  
3dcab85234f3a47 Xianzhong     2019-01-29  157      gcsHAL_INTERFACE iface;
3dcab85234f3a47 Xianzhong     2019-01-29  158      gckGALDEVICE gal_dev = (gckGALDEVICE)drm->dev_private;
3dcab85234f3a47 Xianzhong     2019-01-29  159  
3dcab85234f3a47 Xianzhong     2019-01-29  160      gckOS_ZeroMemory(&iface, sizeof(iface));
3dcab85234f3a47 Xianzhong     2019-01-29  161      iface.command = gcvHAL_RELEASE_VIDEO_MEMORY;
3dcab85234f3a47 Xianzhong     2019-01-29  162      iface.hardwareType = gal_dev->device->defaultHwType;
3dcab85234f3a47 Xianzhong     2019-01-29  163      iface.u.ReleaseVideoMemory.node = viv_obj->node_handle;
3dcab85234f3a47 Xianzhong     2019-01-29  164      gcmkVERIFY_OK(gckDEVICE_Dispatch(gal_dev->device, &iface));
3dcab85234f3a47 Xianzhong     2019-01-29  165  
3dcab85234f3a47 Xianzhong     2019-01-29  166      drm_gem_object_release(gem_obj);
3dcab85234f3a47 Xianzhong     2019-01-29  167      kfree(gem_obj);
3dcab85234f3a47 Xianzhong     2019-01-29  168  }
3dcab85234f3a47 Xianzhong     2019-01-29  169  
3dcab85234f3a47 Xianzhong     2019-01-29  170  static int viv_ioctl_gem_create(struct drm_device *drm, void *data,
3dcab85234f3a47 Xianzhong     2019-01-29  171                                  struct drm_file *file)
3dcab85234f3a47 Xianzhong     2019-01-29  172  {
3dcab85234f3a47 Xianzhong     2019-01-29 @173      int ret = 0;
3dcab85234f3a47 Xianzhong     2019-01-29  174      struct drm_viv_gem_create *args = (struct drm_viv_gem_create*)data;
3dcab85234f3a47 Xianzhong     2019-01-29  175      struct drm_gem_object *gem_obj = gcvNULL;
3dcab85234f3a47 Xianzhong     2019-01-29  176      struct viv_gem_object *viv_obj = gcvNULL;
3dcab85234f3a47 Xianzhong     2019-01-29  177  
3dcab85234f3a47 Xianzhong     2019-01-29  178      gcsHAL_INTERFACE iface;
3dcab85234f3a47 Xianzhong     2019-01-29  179      gckGALDEVICE gal_dev;
3dcab85234f3a47 Xianzhong     2019-01-29  180      gckKERNEL kernel;
3dcab85234f3a47 Xianzhong     2019-01-29  181      gctUINT32 processID;
3dcab85234f3a47 Xianzhong     2019-01-29  182      gckVIDMEM_NODE nodeObject;
3dcab85234f3a47 Xianzhong     2019-01-29  183      gctUINT32 flags = gcvALLOC_FLAG_DMABUF_EXPORTABLE;
3dcab85234f3a47 Xianzhong     2019-01-29  184      gceSTATUS status = gcvSTATUS_OK;
41dc8391b73c360 Minjie Zhuang 2019-09-23  185      gctUINT64 alignSize = PAGE_ALIGN(args->size);
3dcab85234f3a47 Xianzhong     2019-01-29  186  
3dcab85234f3a47 Xianzhong     2019-01-29  187      gal_dev = (gckGALDEVICE)drm->dev_private;
3dcab85234f3a47 Xianzhong     2019-01-29  188      if (!gal_dev)
3dcab85234f3a47 Xianzhong     2019-01-29  189      {
3dcab85234f3a47 Xianzhong     2019-01-29  190          gcmkONERROR(gcvSTATUS_INVALID_ARGUMENT);
3dcab85234f3a47 Xianzhong     2019-01-29  191      }
3dcab85234f3a47 Xianzhong     2019-01-29  192  
3dcab85234f3a47 Xianzhong     2019-01-29  193      if (args->flags & DRM_VIV_GEM_CONTIGUOUS)
3dcab85234f3a47 Xianzhong     2019-01-29  194      {
3dcab85234f3a47 Xianzhong     2019-01-29  195          flags |= gcvALLOC_FLAG_CONTIGUOUS;
3dcab85234f3a47 Xianzhong     2019-01-29  196      }
3dcab85234f3a47 Xianzhong     2019-01-29  197      if (args->flags & DRM_VIV_GEM_CACHED)
3dcab85234f3a47 Xianzhong     2019-01-29  198      {
3dcab85234f3a47 Xianzhong     2019-01-29  199          flags |= gcvALLOC_FLAG_CACHEABLE;
3dcab85234f3a47 Xianzhong     2019-01-29  200      }
3dcab85234f3a47 Xianzhong     2019-01-29  201      if (args->flags & DRM_VIV_GEM_SECURE)
3dcab85234f3a47 Xianzhong     2019-01-29  202      {
3dcab85234f3a47 Xianzhong     2019-01-29  203          flags |= gcvALLOC_FLAG_SECURITY;
3dcab85234f3a47 Xianzhong     2019-01-29  204      }
3dcab85234f3a47 Xianzhong     2019-01-29  205      if (args->flags & DRM_VIV_GEM_CMA_LIMIT)
3dcab85234f3a47 Xianzhong     2019-01-29  206      {
3dcab85234f3a47 Xianzhong     2019-01-29  207          flags |= gcvALLOC_FLAG_CMA_LIMIT;
3dcab85234f3a47 Xianzhong     2019-01-29  208      }
3dcab85234f3a47 Xianzhong     2019-01-29  209  
3dcab85234f3a47 Xianzhong     2019-01-29  210      gckOS_ZeroMemory(&iface, sizeof(iface));
3dcab85234f3a47 Xianzhong     2019-01-29  211      iface.command = gcvHAL_ALLOCATE_LINEAR_VIDEO_MEMORY;
3dcab85234f3a47 Xianzhong     2019-01-29  212      iface.hardwareType = gal_dev->device->defaultHwType;
41dc8391b73c360 Minjie Zhuang 2019-09-23  213      iface.u.AllocateLinearVideoMemory.bytes = alignSize;
3dcab85234f3a47 Xianzhong     2019-01-29  214      iface.u.AllocateLinearVideoMemory.alignment = 256;
41dc8391b73c360 Minjie Zhuang 2019-09-23  215      iface.u.AllocateLinearVideoMemory.type = gcvVIDMEM_TYPE_GENERIC;
3dcab85234f3a47 Xianzhong     2019-01-29  216      iface.u.AllocateLinearVideoMemory.flag = flags;
41dc8391b73c360 Minjie Zhuang 2019-09-23  217      iface.u.AllocateLinearVideoMemory.pool = gcvPOOL_DEFAULT;
3dcab85234f3a47 Xianzhong     2019-01-29  218      gcmkONERROR(gckDEVICE_Dispatch(gal_dev->device, &iface));
3dcab85234f3a47 Xianzhong     2019-01-29  219  
3dcab85234f3a47 Xianzhong     2019-01-29  220      kernel = gal_dev->device->map[gal_dev->device->defaultHwType].kernels[0];
3dcab85234f3a47 Xianzhong     2019-01-29  221      gcmkONERROR(gckOS_GetProcessID(&processID));
3dcab85234f3a47 Xianzhong     2019-01-29  222      gcmkONERROR(gckVIDMEM_HANDLE_Lookup(kernel, processID, iface.u.AllocateLinearVideoMemory.node, &nodeObject));
3dcab85234f3a47 Xianzhong     2019-01-29  223  
3dcab85234f3a47 Xianzhong     2019-01-29  224      /* ioctl output */
3dcab85234f3a47 Xianzhong     2019-01-29  225      gem_obj = kzalloc(sizeof(struct viv_gem_object), GFP_KERNEL);
41dc8391b73c360 Minjie Zhuang 2019-09-23  226      drm_gem_private_object_init(drm, gem_obj, (size_t)alignSize);
3dcab85234f3a47 Xianzhong     2019-01-29  227      ret = drm_gem_handle_create(file, gem_obj, &args->handle);
3dcab85234f3a47 Xianzhong     2019-01-29  228  
3dcab85234f3a47 Xianzhong     2019-01-29  229      viv_obj = container_of(gem_obj, struct viv_gem_object, base);
3dcab85234f3a47 Xianzhong     2019-01-29  230      viv_obj->node_handle = iface.u.AllocateLinearVideoMemory.node;
3dcab85234f3a47 Xianzhong     2019-01-29  231      viv_obj->node_object = nodeObject;
3dcab85234f3a47 Xianzhong     2019-01-29  232      viv_obj->cacheable = flags & gcvALLOC_FLAG_CACHEABLE;
3dcab85234f3a47 Xianzhong     2019-01-29  233  
3dcab85234f3a47 Xianzhong     2019-01-29  234      /* drop reference from allocate - handle holds it now */
3dcab85234f3a47 Xianzhong     2019-01-29 @235      drm_gem_object_unreference_unlocked(gem_obj);
3dcab85234f3a47 Xianzhong     2019-01-29  236  
3dcab85234f3a47 Xianzhong     2019-01-29  237  OnError:
3dcab85234f3a47 Xianzhong     2019-01-29  238      return gcmIS_ERROR(status) ? -ENOTTY : 0;
3dcab85234f3a47 Xianzhong     2019-01-29  239  }
3dcab85234f3a47 Xianzhong     2019-01-29  240  

:::::: The code at line 110 was first introduced by commit
:::::: 3dcab85234f3a4768e11d0fa9b18cfc9145c1131 MGS-4530-1 add 6.2.4.p4 gpu driver for L4.19

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
