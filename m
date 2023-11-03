Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C24250ED
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 23:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXiYJn3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699053136; x=1730589136;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pN8216hR02GlZmBVwuZfLXUiufX34enfJKK566iscaM=;
  b=WXiYJn3O0uV7t6hQ6psYv8jPxFniFpX7p6ScEgecBnyo/k1jnFG4Nocn
   tZ0npXMGWaRrP5rxYLpbmaPU4QxYjivlHLLoa1wC0E3Si7kbb/o7azBbs
   Ykb8ikpxxQjfrY6O+pmJgJ2igoAZ34cIFJzcB5IbShR71X2m1HsXo3TiP
   fzTCpMNnYPfV2uiLtDi4PRk2q+FmZ4/qgDoCAKBRkF3Q/lGc71nr0JAGL
   5fXLUL3WdCptYDvGeB+I0NgEtX88BK4J6e91GRK2Ssqkb909LgtdrpSkT
   BJoY/uB07VrAslLelzeVzpessuMEgGx6YvRRJV8nZ7fodfVu2UCI6oXSH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="10575660"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="10575660"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765402781"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="765402781"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 16:12:12 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz3Kj-00032j-1e;
	Fri, 03 Nov 2023 23:12:09 +0000
Date: Sat, 4 Nov 2023 07:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: [drm-xe:oak/drm-evictable-lru 11/11]
 drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:65:34: error:
 'struct ttm_resource' has no member named 'size'
Message-ID: <202311040742.1HyQ0JZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
commit: d1f59526925ae851c6abf77af8ae6f8c3cffeebd [11/11] drm/ttm: Write ttm functions using drm lru manager functions
config: loongarch-randconfig-002-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040742.1HyQ0JZI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040742.1HyQ0JZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040742.1HyQ0JZI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.c:23:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h: In function 'amdgpu_res_first':
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:65:34: error: 'struct ttm_resource' has no member named 'size'
      65 |         BUG_ON(start + size > res->size);
         |                                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:65:9: note: in expansion of macro 'BUG_ON'
      65 |         BUG_ON(start + size > res->size);
         |         ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_object.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1499,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/inc/amd_powerplay.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/inc/hwmgr.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.c:27:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:67:28: error: 'struct ttm_resource' has no member named 'mem_type'
      67 |         cur->mem_type = res->mem_type;
         |                            ^~
   In file included from arch/loongarch/include/asm/bug.h:59,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h:114:42: error: 'struct ttm_resource' has no member named 'size'
     114 |         WARN_ON(res && start + size > res->size);
         |                                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_object.h: In function 'amdgpu_bo_in_cpu_visible_vram':
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_object.h:255:29: error: 'struct ttm_resource' has no member named 'mem_type'
     255 |         if (bo->tbo.resource->mem_type != TTM_PL_VRAM)
         |                             ^~
--
   In file included from include/linux/string.h:5,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/gpu/drm/amd/amdgpu/atombios_encoders.c:27:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h: In function 'amdgpu_res_first':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:34: error: 'struct ttm_resource' has no member named 'size'
      65 |         BUG_ON(start + size > res->size);
         |                                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:9: note: in expansion of macro 'BUG_ON'
      65 |         BUG_ON(start + size > res->size);
         |         ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:33,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:1499,
                    from drivers/gpu/drm/amd/amdgpu/atombios_encoders.c:32:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:67:28: error: 'struct ttm_resource' has no member named 'mem_type'
      67 |         cur->mem_type = res->mem_type;
         |                            ^~
   In file included from arch/loongarch/include/asm/bug.h:59,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:114:42: error: 'struct ttm_resource' has no member named 'size'
     114 |         WARN_ON(res && start + size > res->size);
         |                                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h: In function 'amdgpu_bo_in_cpu_visible_vram':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:255:29: error: 'struct ttm_resource' has no member named 'mem_type'
     255 |         if (bo->tbo.resource->mem_type != TTM_PL_VRAM)
         |                             ^~
--
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/loongarch/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/ktime.h:24,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:26:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h: In function 'amdgpu_res_first':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:34: error: 'struct ttm_resource' has no member named 'size'
      65 |         BUG_ON(start + size > res->size);
         |                                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:9: note: in expansion of macro 'BUG_ON'
      65 |         BUG_ON(start + size > res->size);
         |         ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:33,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:1499:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:67:28: error: 'struct ttm_resource' has no member named 'mem_type'
      67 |         cur->mem_type = res->mem_type;
         |                            ^~
   In file included from arch/loongarch/include/asm/bug.h:59,
                    from include/linux/ktime.h:26:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:114:42: error: 'struct ttm_resource' has no member named 'size'
     114 |         WARN_ON(res && start + size > res->size);
         |                                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h: In function 'amdgpu_bo_in_cpu_visible_vram':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:255:29: error: 'struct ttm_resource' has no member named 'mem_type'
     255 |         if (bo->tbo.resource->mem_type != TTM_PL_VRAM)
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: In function 'amdgpu_preempt_mgr_init':
   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:121:61: error: 'VMW_PL_SYSTEM' undeclared (first use in this function); did you mean 'TTM_PL_SYSTEM'?
     121 |         ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[VMW_PL_SYSTEM]);
         |                                                             ^~~~~~~~~~~~~
         |                                                             TTM_PL_SYSTEM
   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:121:61: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from include/linux/string.h:5,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h: In function 'amdgpu_res_first':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:34: error: 'struct ttm_resource' has no member named 'size'
      65 |         BUG_ON(start + size > res->size);
         |                                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:9: note: in expansion of macro 'BUG_ON'
      65 |         BUG_ON(start + size > res->size);
         |         ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:33,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:1499,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:28:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:67:28: error: 'struct ttm_resource' has no member named 'mem_type'
      67 |         cur->mem_type = res->mem_type;
         |                            ^~
   In file included from arch/loongarch/include/asm/bug.h:59,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:114:42: error: 'struct ttm_resource' has no member named 'size'
     114 |         WARN_ON(res && start + size > res->size);
         |                                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h: In function 'amdgpu_bo_in_cpu_visible_vram':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:255:29: error: 'struct ttm_resource' has no member named 'mem_type'
     255 |         if (bo->tbo.resource->mem_type != TTM_PL_VRAM)
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function 'amdgpu_vram_mgr_new':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:481:41: error: 'struct ttm_resource' has no member named 'size'
     481 |         remaining_size = (u64)vres->base.size;
         |                                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:541:48: error: 'struct ttm_resource' has no member named 'size'
     541 |                 original_size = (u64)vres->base.size;
         |                                                ^
   In file included from arch/loongarch/include/asm/page.h:34,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8:
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:576:46: error: 'struct ttm_resource' has no member named 'size'
     576 |                 if (start > PFN_UP(vres->base.size))
         |                                              ^
   include/linux/pfn.h:19:28: note: in definition of macro 'PFN_UP'
      19 | #define PFN_UP(x)       (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
         |                            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:577:51: error: 'struct ttm_resource' has no member named 'size'
     577 |                         start -= PFN_UP(vres->base.size);
         |                                                   ^
   include/linux/pfn.h:19:28: note: in definition of macro 'PFN_UP'
      19 | #define PFN_UP(x)       (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
         |                            ^
--
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/loongarch/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/ktime.h:24,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:34:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h: In function 'amdgpu_res_first':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:34: error: 'struct ttm_resource' has no member named 'size'
      65 |         BUG_ON(start + size > res->size);
         |                                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:9: note: in expansion of macro 'BUG_ON'
      65 |         BUG_ON(start + size > res->size);
         |         ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:33,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:1499:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:67:28: error: 'struct ttm_resource' has no member named 'mem_type'
      67 |         cur->mem_type = res->mem_type;
         |                            ^~
   In file included from arch/loongarch/include/asm/bug.h:59,
                    from include/linux/ktime.h:26:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:114:42: error: 'struct ttm_resource' has no member named 'size'
     114 |         WARN_ON(res && start + size > res->size);
         |                                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h: In function 'amdgpu_bo_in_cpu_visible_vram':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:255:29: error: 'struct ttm_resource' has no member named 'mem_type'
     255 |         if (bo->tbo.resource->mem_type != TTM_PL_VRAM)
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c: In function 'amdgpu_dma_buf_map':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:164:64: error: 'struct ttm_resource' has no member named 'mem_type'
     164 |         } else if (!(amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type) &
         |                                                                ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:169:33: error: 'struct ttm_resource' has no member named 'mem_type'
     169 |         switch (bo->tbo.resource->mem_type) {
         |                                 ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c: In function 'amdgpu_dma_buf_move_notify':
   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:375:50: error: 'struct ttm_resource' has no member named 'mem_type'
     375 |         if (!bo->tbo.resource || bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
         |                                                  ^~
--
   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/power_supply.h:15,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:28:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h: In function 'amdgpu_res_first':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:34: error: 'struct ttm_resource' has no member named 'size'
      65 |         BUG_ON(start + size > res->size);
         |                                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:9: note: in expansion of macro 'BUG_ON'
      65 |         BUG_ON(start + size > res->size);
         |         ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:33,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:1499,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:49:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:67:28: error: 'struct ttm_resource' has no member named 'mem_type'
      67 |         cur->mem_type = res->mem_type;
         |                            ^~
   In file included from arch/loongarch/include/asm/bug.h:59,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:114:42: error: 'struct ttm_resource' has no member named 'size'
     114 |         WARN_ON(res && start + size > res->size);
         |                                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h: In function 'amdgpu_bo_in_cpu_visible_vram':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:255:29: error: 'struct ttm_resource' has no member named 'mem_type'
     255 |         if (bo->tbo.resource->mem_type != TTM_PL_VRAM)
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function 'amdgpu_device_recover_vram':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4478:41: error: 'struct ttm_resource' has no member named 'mem_type'
    4478 |                 if (shadow->tbo.resource->mem_type != TTM_PL_TT ||
         |                                         ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4480:49: error: 'struct ttm_resource' has no member named 'mem_type'
    4480 |                     shadow->parent->tbo.resource->mem_type != TTM_PL_VRAM)
         |                                                 ^~
--
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:32:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h: In function 'amdgpu_res_first':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:34: error: 'struct ttm_resource' has no member named 'size'
      65 |         BUG_ON(start + size > res->size);
         |                                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:65:9: note: in expansion of macro 'BUG_ON'
      65 |         BUG_ON(start + size > res->size);
         |         ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:33,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:1499,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:39:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:67:28: error: 'struct ttm_resource' has no member named 'mem_type'
      67 |         cur->mem_type = res->mem_type;
         |                            ^~
   In file included from arch/loongarch/include/asm/bug.h:59,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:33:
   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h:114:42: error: 'struct ttm_resource' has no member named 'size'
     114 |         WARN_ON(res && start + size > res->size);
         |                                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h: In function 'amdgpu_bo_in_cpu_visible_vram':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:255:29: error: 'struct ttm_resource' has no member named 'mem_type'
     255 |         if (bo->tbo.resource->mem_type != TTM_PL_VRAM)
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_create':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:628:29: error: 'struct ttm_resource' has no member named 'mem_type'
     628 |             bo->tbo.resource->mem_type == TTM_PL_VRAM &&
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:636:29: error: 'struct ttm_resource' has no member named 'mem_type'
     636 |             bo->tbo.resource->mem_type == TTM_PL_VRAM) {
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_pin_restricted':
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:925:53: error: 'struct ttm_resource' has no member named 'mem_type'
     925 |                 uint32_t mem_type = bo->tbo.resource->mem_type;
         |                                                     ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:981:60: error: 'struct ttm_resource' has no member named 'mem_type'
     981 |         domain = amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
         |                                                            ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_unpin':
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1033:29: error: 'struct ttm_resource' has no member named 'mem_type'
    1033 |         if (bo->tbo.resource->mem_type == TTM_PL_VRAM) {
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1037:36: error: 'struct ttm_resource' has no member named 'mem_type'
    1037 |         } else if (bo->tbo.resource->mem_type == TTM_PL_TT) {
         |                                    ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_move_notify':
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1276:25: error: 'struct ttm_resource' has no member named 'mem_type'
    1276 |             bo->resource->mem_type != TTM_PL_SYSTEM)
         |                         ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1288:42: error: 'struct ttm_resource' has no member named 'mem_type'
    1288 |         trace_amdgpu_bo_move(abo, new_mem->mem_type, old_mem->mem_type);
         |                                          ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1288:61: error: 'struct ttm_resource' has no member named 'mem_type'
    1288 |         trace_amdgpu_bo_move(abo, new_mem->mem_type, old_mem->mem_type);
         |                                                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_get_memory':
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1301:60: error: 'struct ttm_resource' has no member named 'mem_type'
    1301 |         domain = amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
         |                                                            ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_release_notify':
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1360:42: error: 'struct ttm_resource' has no member named 'mem_type'
    1360 |         if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
         |                                          ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_fault_reserve_notify':
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1398:25: error: 'struct ttm_resource' has no member named 'mem_type'
    1398 |         if (bo->resource->mem_type != TTM_PL_VRAM)
         |                         ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1424:25: error: 'struct ttm_resource' has no member named 'mem_type'
    1424 |         if (bo->resource->mem_type == TTM_PL_VRAM &&
         |                         ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_gpu_offset':
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1515:38: error: 'struct ttm_resource' has no member named 'mem_type'
    1515 |         WARN_ON_ONCE(bo->tbo.resource->mem_type == TTM_PL_SYSTEM);
         |                                      ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1519:38: error: 'struct ttm_resource' has no member named 'mem_type'
    1519 |         WARN_ON_ONCE(bo->tbo.resource->mem_type == TTM_PL_VRAM &&
         |                                      ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_gpu_offset_no_check':
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1538:64: error: 'struct ttm_resource' has no member named 'mem_type'
    1538 |                  amdgpu_ttm_domain_start(adev, bo->tbo.resource->mem_type);
         |                                                                ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_print_info':
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1593:68: error: 'struct ttm_resource' has no member named 'mem_type'
    1593 |                 domain = amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type);
         |                                                                    ^~
..


vim +65 drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_res_cursor.h

ee18f40ea1816b Christian König          2021-02-17   43  
ee18f40ea1816b Christian König          2021-02-17   44  /**
ee18f40ea1816b Christian König          2021-02-17   45   * amdgpu_res_first - initialize a amdgpu_res_cursor
ee18f40ea1816b Christian König          2021-02-17   46   *
ee18f40ea1816b Christian König          2021-02-17   47   * @res: TTM resource object to walk
ee18f40ea1816b Christian König          2021-02-17   48   * @start: Start of the range
ee18f40ea1816b Christian König          2021-02-17   49   * @size: Size of the range
ee18f40ea1816b Christian König          2021-02-17   50   * @cur: cursor object to initialize
ee18f40ea1816b Christian König          2021-02-17   51   *
ee18f40ea1816b Christian König          2021-02-17   52   * Start walking over the range of allocations between @start and @size.
ee18f40ea1816b Christian König          2021-02-17   53   */
ee18f40ea1816b Christian König          2021-02-17   54  static inline void amdgpu_res_first(struct ttm_resource *res,
ee18f40ea1816b Christian König          2021-02-17   55  				    uint64_t start, uint64_t size,
ee18f40ea1816b Christian König          2021-02-17   56  				    struct amdgpu_res_cursor *cur)
ee18f40ea1816b Christian König          2021-02-17   57  {
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   58  	struct drm_buddy_block *block;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   59  	struct list_head *head, *next;
ee18f40ea1816b Christian König          2021-02-17   60  	struct drm_mm_node *node;
ee18f40ea1816b Christian König          2021-02-17   61  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   62  	if (!res)
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   63  		goto fallback;
ee18f40ea1816b Christian König          2021-02-17   64  
e3c92eb4a84fb0 Somalapuram Amaranath    2022-10-27  @65  	BUG_ON(start + size > res->size);
ee18f40ea1816b Christian König          2021-02-17   66  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  @67  	cur->mem_type = res->mem_type;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   68  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   69  	switch (cur->mem_type) {
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   70  	case TTM_PL_VRAM:
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   71  		head = &to_amdgpu_vram_mgr_resource(res)->blocks;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   72  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   73  		block = list_first_entry_or_null(head,
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   74  						 struct drm_buddy_block,
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   75  						 link);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   76  		if (!block)
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   77  			goto fallback;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   78  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   79  		while (start >= amdgpu_vram_mgr_block_size(block)) {
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   80  			start -= amdgpu_vram_mgr_block_size(block);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   81  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   82  			next = block->link.next;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   83  			if (next != head)
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   84  				block = list_entry(next, struct drm_buddy_block, link);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   85  		}
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   86  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   87  		cur->start = amdgpu_vram_mgr_block_start(block) + start;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   88  		cur->size = min(amdgpu_vram_mgr_block_size(block) - start, size);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   89  		cur->remaining = size;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   90  		cur->node = block;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   91  		break;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08   92  	case TTM_PL_TT:
dc3499c71d3618 Alex Deucher             2023-07-14   93  	case AMDGPU_PL_DOORBELL:
cb1c81467af355 Christian König          2021-04-30   94  		node = to_ttm_range_mgr_node(res)->mm_nodes;
15e16daa35ba15 Nirmoy Das               2021-03-19   95  		while (start >= node->size << PAGE_SHIFT)
ee18f40ea1816b Christian König          2021-02-17   96  			start -= node++->size << PAGE_SHIFT;
ee18f40ea1816b Christian König          2021-02-17   97  
ee18f40ea1816b Christian König          2021-02-17   98  		cur->start = (node->start << PAGE_SHIFT) + start;
ee18f40ea1816b Christian König          2021-02-17   99  		cur->size = min((node->size << PAGE_SHIFT) - start, size);
ee18f40ea1816b Christian König          2021-02-17  100  		cur->remaining = size;
ee18f40ea1816b Christian König          2021-02-17  101  		cur->node = node;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  102  		break;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  103  	default:
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  104  		goto fallback;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  105  	}
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  106  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  107  	return;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  108  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  109  fallback:
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  110  	cur->start = start;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  111  	cur->size = size;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  112  	cur->remaining = size;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  113  	cur->node = NULL;
e3c92eb4a84fb0 Somalapuram Amaranath    2022-10-27  114  	WARN_ON(res && start + size > res->size);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  115  	return;
ee18f40ea1816b Christian König          2021-02-17  116  }
ee18f40ea1816b Christian König          2021-02-17  117  

:::::: The code at line 65 was first introduced by commit
:::::: e3c92eb4a84fb0f00442e6b5cabf4f11b0eaaf41 drm/ttm: rework on ttm_resource to use size_t type

:::::: TO: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
