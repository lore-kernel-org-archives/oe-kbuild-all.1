Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4F8548F3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714396846; cv=none; b=j4ZGZ88yq2PDzKjmywpijIw7dAODQxUPBayw9C3i+8bHfC50xhwJmnniT1TLkPAhnzq4QBOg1pn23jTSynuFAYzKwAeJ0Wmckv4tw5cgXYl1vTcBCyFveVGMNRW6PHYOQHnR9L/T3eTWhnZVmy3lGixe5kH9zWqsSah0dbtA3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714396846; c=relaxed/simple;
	bh=Vfaf50X4PRiaSqFodJenXFx0eabSPAlpfOn3LT7jxuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+BqygSdKfg6qBWN5iSKGtoOJVyPEl7HW7+SM0OOlmqEj5QuLYlnKJvdG20N4bJdYkSDifhTjs5i3lPclOxeppDNYECgXM4LAk1tj3A8uYPAK0d4PIscfnTIW8qbgQyr3drvysjHvU/RizXAh3ucagpVfm7EEkeUqWzgRib9oL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAxNtCY/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAxNtCY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714396844; x=1745932844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vfaf50X4PRiaSqFodJenXFx0eabSPAlpfOn3LT7jxuo=;
  b=IAxNtCY/Kr21PgwaqCRftrdyzUiR7OVyAYkQgyNsQKHMe20KRxEgTOAN
   tW0m7eWUTkCKkKVLzz9HIgvFKseJUtA+qcZWPX9oYTY1YJDqfqj+b8lQ/
   e78WdkUKhzfw+qUZPjJVIvfbIppmX1WzH9uqfkeLPtQm9e/RplfBB9OWP
   l8YznNEfPG5aIyXEM9BL1bv8YEzLY6a5Xn4cXiyGJvO77qNs0G0baTP2l
   FmJF5bc1p/GMmLQtRRZwg+IfEUVPq4ngX2Rv/L8uwLlih3tqNddycToaS
   +0BjxHy2wmUmu79ea/9ISVBLi/LUDbW42oRFxYlpa2OgELUcEK7eIMFKw
   Q==;
X-CSE-ConnectionGUID: Y4E7eBusR86tP9NT4hc3Ow==
X-CSE-MsgGUID: H5ZKE1dzTP2eR8VAYC2vrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9914842"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9914842"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 06:20:42 -0700
X-CSE-ConnectionGUID: xF0iql79RWirvDT598Q0IQ==
X-CSE-MsgGUID: 66pK9YouRhifXX0t4YZvQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="49320068"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2024 06:20:40 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Qvu-0007By-1h;
	Mon, 29 Apr 2024 13:20:38 +0000
Date: Mon, 29 Apr 2024 21:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3468/29983]
 drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:110:24: warning:
 no previous prototype for function 'viv_gem_prime_import'
Message-ID: <202404292143.hHSY5TYT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: c7fdcea5d4f61d6ac30340e7752cf8730a24b1f3 [3468/29983] MGS-6058 [#imx-2391] fix vivante drm build break for L5.10
config: arm64-randconfig-003-20240429 (https://download.01.org/0day-ci/archive/20240429/202404292143.hHSY5TYT-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292143.hHSY5TYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292143.hHSY5TYT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:61:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:86:17: warning: no previous prototype for function 'viv_gem_prime_export' [-Wmissing-prototypes]
      86 | struct dma_buf *viv_gem_prime_export(struct drm_gem_object *gem_obj,
         |                 ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      86 | struct dma_buf *viv_gem_prime_export(struct drm_gem_object *gem_obj,
         | ^
         | static 
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:110:24: warning: no previous prototype for function 'viv_gem_prime_import' [-Wmissing-prototypes]
     110 | struct drm_gem_object *viv_gem_prime_import(struct drm_device *drm,
         |                        ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:110:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     110 | struct drm_gem_object *viv_gem_prime_import(struct drm_device *drm,
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:152:6: warning: no previous prototype for function 'viv_gem_free_object' [-Wmissing-prototypes]
     152 | void viv_gem_free_object(struct drm_gem_object *gem_obj)
         |      ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     152 | void viv_gem_free_object(struct drm_gem_object *gem_obj)
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:235:5: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     235 |     drm_gem_object_unreference_unlocked(gem_obj);
         |     ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:173:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     173 |     int ret = 0;
         |         ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:277:9: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     277 |         drm_gem_object_unreference_unlocked(gem_obj);
         |         ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:323:9: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     323 |         drm_gem_object_unreference_unlocked(gem_obj);
         |         ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:383:9: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     383 |         drm_gem_object_unreference_unlocked(gem_obj);
         |         ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:426:9: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     426 |         drm_gem_object_unreference_unlocked(gem_obj);
         |         ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:460:9: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     460 |         drm_gem_object_unreference_unlocked(gem_obj);
         |         ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:496:9: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     496 |         drm_gem_object_unreference_unlocked(gem_obj);
         |         ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:532:9: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     532 |         drm_gem_object_unreference_unlocked(gem_obj);
         |         ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:630:9: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     630 |         drm_gem_object_unreference_unlocked(gem_obj);
         |         ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:726:9: error: implicit declaration of function 'drm_gem_object_put_locked' [-Werror,-Wimplicit-function-declaration]
     726 |         drm_gem_object_unreference_unlocked(gem_obj);
         |         ^
   drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_drm.h:202:45: note: expanded from macro 'drm_gem_object_unreference_unlocked'
     202 | #define drm_gem_object_unreference_unlocked drm_gem_object_put_locked
         |                                             ^
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:746:5: warning: no previous prototype for function 'viv_drm_open' [-Wmissing-prototypes]
     746 | int viv_drm_open(struct drm_device *drm, struct drm_file *file)
         |     ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:746:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     746 | int viv_drm_open(struct drm_device *drm, struct drm_file *file)
         | ^
         | static 
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:766:6: warning: no previous prototype for function 'viv_drm_postclose' [-Wmissing-prototypes]
     766 | void viv_drm_postclose(struct drm_device *drm, struct drm_file *file)
         |      ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:766:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     766 | void viv_drm_postclose(struct drm_device *drm, struct drm_file *file)
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:803:6: error: field designator 'gem_free_object_unlocked' does not refer to any field in type 'struct drm_driver'
     803 |     .gem_free_object_unlocked = viv_gem_free_object,
         |     ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:809:6: error: field designator 'gem_prime_export' does not refer to any field in type 'struct drm_driver'; did you mean 'gem_prime_import'?
     809 |     .gem_prime_export   = viv_gem_prime_export,
         |      ^~~~~~~~~~~~~~~~
         |      gem_prime_import
   include/drm/drm_drv.h:330:28: note: 'gem_prime_import' declared here
     330 |         struct drm_gem_object * (*gem_prime_import)(struct drm_device *dev,
         |                                   ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:809:27: error: incompatible function pointer types initializing 'struct drm_gem_object *(*)(struct drm_device *, struct dma_buf *)' with an expression of type 'struct dma_buf *(struct drm_gem_object *, int)' [-Wincompatible-function-pointer-types]
     809 |     .gem_prime_export   = viv_gem_prime_export,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:810:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     810 |     .gem_prime_import   = viv_gem_prime_import,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:809:27: note: previous initialization is here
     809 |     .gem_prime_export   = viv_gem_prime_export,
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:821:5: warning: no previous prototype for function 'viv_drm_probe' [-Wmissing-prototypes]
     821 | int viv_drm_probe(struct device *dev)
         |     ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:821:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     821 | int viv_drm_probe(struct device *dev)
         | ^
         | static 
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:863:5: warning: no previous prototype for function 'viv_drm_remove' [-Wmissing-prototypes]
     863 | int viv_drm_remove(struct device *dev)
         |     ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c:863:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     863 | int viv_drm_remove(struct device *dev)
         | ^
         | static 
   10 warnings and 13 errors generated.


vim +/viv_gem_prime_import +110 drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_drm.c

3dcab85234f3a4 Xianzhong     2019-01-29  109  
3dcab85234f3a4 Xianzhong     2019-01-29 @110  struct drm_gem_object *viv_gem_prime_import(struct drm_device *drm,
3dcab85234f3a4 Xianzhong     2019-01-29  111                                              struct dma_buf *dmabuf)
3dcab85234f3a4 Xianzhong     2019-01-29  112  {
3dcab85234f3a4 Xianzhong     2019-01-29  113      struct drm_gem_object *gem_obj = gcvNULL;
3dcab85234f3a4 Xianzhong     2019-01-29  114      struct viv_gem_object *viv_obj;
3dcab85234f3a4 Xianzhong     2019-01-29  115  
3dcab85234f3a4 Xianzhong     2019-01-29  116      gcsHAL_INTERFACE iface;
3dcab85234f3a4 Xianzhong     2019-01-29  117      gckGALDEVICE gal_dev;
3dcab85234f3a4 Xianzhong     2019-01-29  118      gckKERNEL kernel;
3dcab85234f3a4 Xianzhong     2019-01-29  119      gctUINT32 processID;
3dcab85234f3a4 Xianzhong     2019-01-29  120      gckVIDMEM_NODE nodeObject;
3dcab85234f3a4 Xianzhong     2019-01-29  121      gceSTATUS status = gcvSTATUS_OK;
3dcab85234f3a4 Xianzhong     2019-01-29  122  
3dcab85234f3a4 Xianzhong     2019-01-29  123      gal_dev = (gckGALDEVICE)drm->dev_private;
3dcab85234f3a4 Xianzhong     2019-01-29  124      if (!gal_dev)
3dcab85234f3a4 Xianzhong     2019-01-29  125      {
3dcab85234f3a4 Xianzhong     2019-01-29  126          gcmkONERROR(gcvSTATUS_INVALID_ARGUMENT);
3dcab85234f3a4 Xianzhong     2019-01-29  127      }
3dcab85234f3a4 Xianzhong     2019-01-29  128  
3dcab85234f3a4 Xianzhong     2019-01-29  129      gckOS_ZeroMemory(&iface, sizeof(iface));
3dcab85234f3a4 Xianzhong     2019-01-29  130      iface.command = gcvHAL_WRAP_USER_MEMORY;
3dcab85234f3a4 Xianzhong     2019-01-29  131      iface.hardwareType = gal_dev->device->defaultHwType;
3dcab85234f3a4 Xianzhong     2019-01-29  132      iface.u.WrapUserMemory.desc.flag = gcvALLOC_FLAG_DMABUF;
3dcab85234f3a4 Xianzhong     2019-01-29  133      iface.u.WrapUserMemory.desc.handle = -1;
3dcab85234f3a4 Xianzhong     2019-01-29  134      iface.u.WrapUserMemory.desc.dmabuf = gcmPTR_TO_UINT64(dmabuf);
3dcab85234f3a4 Xianzhong     2019-01-29  135      gcmkONERROR(gckDEVICE_Dispatch(gal_dev->device, &iface));
3dcab85234f3a4 Xianzhong     2019-01-29  136  
3dcab85234f3a4 Xianzhong     2019-01-29  137      kernel = gal_dev->device->map[gal_dev->device->defaultHwType].kernels[0];
3dcab85234f3a4 Xianzhong     2019-01-29  138      gcmkONERROR(gckOS_GetProcessID(&processID));
3dcab85234f3a4 Xianzhong     2019-01-29  139      gcmkONERROR(gckVIDMEM_HANDLE_Lookup(kernel, processID, iface.u.WrapUserMemory.node, &nodeObject));
3dcab85234f3a4 Xianzhong     2019-01-29  140  
3dcab85234f3a4 Xianzhong     2019-01-29  141      /* ioctl output */
3dcab85234f3a4 Xianzhong     2019-01-29  142      gem_obj = kzalloc(sizeof(struct viv_gem_object), GFP_KERNEL);
3dcab85234f3a4 Xianzhong     2019-01-29  143      drm_gem_private_object_init(drm, gem_obj, dmabuf->size);
3dcab85234f3a4 Xianzhong     2019-01-29  144      viv_obj = container_of(gem_obj, struct viv_gem_object, base);
3dcab85234f3a4 Xianzhong     2019-01-29  145      viv_obj->node_handle = iface.u.WrapUserMemory.node;
3dcab85234f3a4 Xianzhong     2019-01-29  146      viv_obj->node_object = nodeObject;
3dcab85234f3a4 Xianzhong     2019-01-29  147  
3dcab85234f3a4 Xianzhong     2019-01-29  148  OnError:
3dcab85234f3a4 Xianzhong     2019-01-29  149      return gem_obj;
3dcab85234f3a4 Xianzhong     2019-01-29  150  }
3dcab85234f3a4 Xianzhong     2019-01-29  151  
3dcab85234f3a4 Xianzhong     2019-01-29  152  void viv_gem_free_object(struct drm_gem_object *gem_obj)
3dcab85234f3a4 Xianzhong     2019-01-29  153  {
3dcab85234f3a4 Xianzhong     2019-01-29  154      struct viv_gem_object *viv_obj = container_of(gem_obj, struct viv_gem_object, base);
3dcab85234f3a4 Xianzhong     2019-01-29  155      struct drm_device *drm = gem_obj->dev;
3dcab85234f3a4 Xianzhong     2019-01-29  156  
3dcab85234f3a4 Xianzhong     2019-01-29  157      gcsHAL_INTERFACE iface;
3dcab85234f3a4 Xianzhong     2019-01-29  158      gckGALDEVICE gal_dev = (gckGALDEVICE)drm->dev_private;
3dcab85234f3a4 Xianzhong     2019-01-29  159  
3dcab85234f3a4 Xianzhong     2019-01-29  160      gckOS_ZeroMemory(&iface, sizeof(iface));
3dcab85234f3a4 Xianzhong     2019-01-29  161      iface.command = gcvHAL_RELEASE_VIDEO_MEMORY;
3dcab85234f3a4 Xianzhong     2019-01-29  162      iface.hardwareType = gal_dev->device->defaultHwType;
3dcab85234f3a4 Xianzhong     2019-01-29  163      iface.u.ReleaseVideoMemory.node = viv_obj->node_handle;
3dcab85234f3a4 Xianzhong     2019-01-29  164      gcmkVERIFY_OK(gckDEVICE_Dispatch(gal_dev->device, &iface));
3dcab85234f3a4 Xianzhong     2019-01-29  165  
3dcab85234f3a4 Xianzhong     2019-01-29  166      drm_gem_object_release(gem_obj);
3dcab85234f3a4 Xianzhong     2019-01-29  167      kfree(gem_obj);
3dcab85234f3a4 Xianzhong     2019-01-29  168  }
3dcab85234f3a4 Xianzhong     2019-01-29  169  
3dcab85234f3a4 Xianzhong     2019-01-29  170  static int viv_ioctl_gem_create(struct drm_device *drm, void *data,
3dcab85234f3a4 Xianzhong     2019-01-29  171                                  struct drm_file *file)
3dcab85234f3a4 Xianzhong     2019-01-29  172  {
3dcab85234f3a4 Xianzhong     2019-01-29 @173      int ret = 0;
3dcab85234f3a4 Xianzhong     2019-01-29  174      struct drm_viv_gem_create *args = (struct drm_viv_gem_create*)data;
3dcab85234f3a4 Xianzhong     2019-01-29  175      struct drm_gem_object *gem_obj = gcvNULL;
3dcab85234f3a4 Xianzhong     2019-01-29  176      struct viv_gem_object *viv_obj = gcvNULL;
3dcab85234f3a4 Xianzhong     2019-01-29  177  
3dcab85234f3a4 Xianzhong     2019-01-29  178      gcsHAL_INTERFACE iface;
3dcab85234f3a4 Xianzhong     2019-01-29  179      gckGALDEVICE gal_dev;
3dcab85234f3a4 Xianzhong     2019-01-29  180      gckKERNEL kernel;
3dcab85234f3a4 Xianzhong     2019-01-29  181      gctUINT32 processID;
3dcab85234f3a4 Xianzhong     2019-01-29  182      gckVIDMEM_NODE nodeObject;
3dcab85234f3a4 Xianzhong     2019-01-29  183      gctUINT32 flags = gcvALLOC_FLAG_DMABUF_EXPORTABLE;
3dcab85234f3a4 Xianzhong     2019-01-29  184      gceSTATUS status = gcvSTATUS_OK;
41dc8391b73c36 Minjie Zhuang 2019-09-23  185      gctUINT64 alignSize = PAGE_ALIGN(args->size);
3dcab85234f3a4 Xianzhong     2019-01-29  186  
3dcab85234f3a4 Xianzhong     2019-01-29  187      gal_dev = (gckGALDEVICE)drm->dev_private;
3dcab85234f3a4 Xianzhong     2019-01-29  188      if (!gal_dev)
3dcab85234f3a4 Xianzhong     2019-01-29  189      {
3dcab85234f3a4 Xianzhong     2019-01-29  190          gcmkONERROR(gcvSTATUS_INVALID_ARGUMENT);
3dcab85234f3a4 Xianzhong     2019-01-29  191      }
3dcab85234f3a4 Xianzhong     2019-01-29  192  
3dcab85234f3a4 Xianzhong     2019-01-29  193      if (args->flags & DRM_VIV_GEM_CONTIGUOUS)
3dcab85234f3a4 Xianzhong     2019-01-29  194      {
3dcab85234f3a4 Xianzhong     2019-01-29  195          flags |= gcvALLOC_FLAG_CONTIGUOUS;
3dcab85234f3a4 Xianzhong     2019-01-29  196      }
3dcab85234f3a4 Xianzhong     2019-01-29  197      if (args->flags & DRM_VIV_GEM_CACHED)
3dcab85234f3a4 Xianzhong     2019-01-29  198      {
3dcab85234f3a4 Xianzhong     2019-01-29  199          flags |= gcvALLOC_FLAG_CACHEABLE;
3dcab85234f3a4 Xianzhong     2019-01-29  200      }
3dcab85234f3a4 Xianzhong     2019-01-29  201      if (args->flags & DRM_VIV_GEM_SECURE)
3dcab85234f3a4 Xianzhong     2019-01-29  202      {
3dcab85234f3a4 Xianzhong     2019-01-29  203          flags |= gcvALLOC_FLAG_SECURITY;
3dcab85234f3a4 Xianzhong     2019-01-29  204      }
3dcab85234f3a4 Xianzhong     2019-01-29  205      if (args->flags & DRM_VIV_GEM_CMA_LIMIT)
3dcab85234f3a4 Xianzhong     2019-01-29  206      {
3dcab85234f3a4 Xianzhong     2019-01-29  207          flags |= gcvALLOC_FLAG_CMA_LIMIT;
3dcab85234f3a4 Xianzhong     2019-01-29  208      }
3dcab85234f3a4 Xianzhong     2019-01-29  209  
3dcab85234f3a4 Xianzhong     2019-01-29  210      gckOS_ZeroMemory(&iface, sizeof(iface));
3dcab85234f3a4 Xianzhong     2019-01-29  211      iface.command = gcvHAL_ALLOCATE_LINEAR_VIDEO_MEMORY;
3dcab85234f3a4 Xianzhong     2019-01-29  212      iface.hardwareType = gal_dev->device->defaultHwType;
41dc8391b73c36 Minjie Zhuang 2019-09-23  213      iface.u.AllocateLinearVideoMemory.bytes = alignSize;
3dcab85234f3a4 Xianzhong     2019-01-29  214      iface.u.AllocateLinearVideoMemory.alignment = 256;
41dc8391b73c36 Minjie Zhuang 2019-09-23  215      iface.u.AllocateLinearVideoMemory.type = gcvVIDMEM_TYPE_GENERIC;
3dcab85234f3a4 Xianzhong     2019-01-29  216      iface.u.AllocateLinearVideoMemory.flag = flags;
41dc8391b73c36 Minjie Zhuang 2019-09-23  217      iface.u.AllocateLinearVideoMemory.pool = gcvPOOL_DEFAULT;
3dcab85234f3a4 Xianzhong     2019-01-29  218      gcmkONERROR(gckDEVICE_Dispatch(gal_dev->device, &iface));
3dcab85234f3a4 Xianzhong     2019-01-29  219  
3dcab85234f3a4 Xianzhong     2019-01-29  220      kernel = gal_dev->device->map[gal_dev->device->defaultHwType].kernels[0];
3dcab85234f3a4 Xianzhong     2019-01-29  221      gcmkONERROR(gckOS_GetProcessID(&processID));
3dcab85234f3a4 Xianzhong     2019-01-29  222      gcmkONERROR(gckVIDMEM_HANDLE_Lookup(kernel, processID, iface.u.AllocateLinearVideoMemory.node, &nodeObject));
3dcab85234f3a4 Xianzhong     2019-01-29  223  
3dcab85234f3a4 Xianzhong     2019-01-29  224      /* ioctl output */
3dcab85234f3a4 Xianzhong     2019-01-29  225      gem_obj = kzalloc(sizeof(struct viv_gem_object), GFP_KERNEL);
41dc8391b73c36 Minjie Zhuang 2019-09-23  226      drm_gem_private_object_init(drm, gem_obj, (size_t)alignSize);
3dcab85234f3a4 Xianzhong     2019-01-29  227      ret = drm_gem_handle_create(file, gem_obj, &args->handle);
3dcab85234f3a4 Xianzhong     2019-01-29  228  
3dcab85234f3a4 Xianzhong     2019-01-29  229      viv_obj = container_of(gem_obj, struct viv_gem_object, base);
3dcab85234f3a4 Xianzhong     2019-01-29  230      viv_obj->node_handle = iface.u.AllocateLinearVideoMemory.node;
3dcab85234f3a4 Xianzhong     2019-01-29  231      viv_obj->node_object = nodeObject;
3dcab85234f3a4 Xianzhong     2019-01-29  232      viv_obj->cacheable = flags & gcvALLOC_FLAG_CACHEABLE;
3dcab85234f3a4 Xianzhong     2019-01-29  233  
3dcab85234f3a4 Xianzhong     2019-01-29  234      /* drop reference from allocate - handle holds it now */
3dcab85234f3a4 Xianzhong     2019-01-29  235      drm_gem_object_unreference_unlocked(gem_obj);
3dcab85234f3a4 Xianzhong     2019-01-29  236  
3dcab85234f3a4 Xianzhong     2019-01-29  237  OnError:
3dcab85234f3a4 Xianzhong     2019-01-29  238      return gcmIS_ERROR(status) ? -ENOTTY : 0;
3dcab85234f3a4 Xianzhong     2019-01-29  239  }
3dcab85234f3a4 Xianzhong     2019-01-29  240  

:::::: The code at line 110 was first introduced by commit
:::::: 3dcab85234f3a4768e11d0fa9b18cfc9145c1131 MGS-4530-1 add 6.2.4.p4 gpu driver for L4.19

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
