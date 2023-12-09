Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BDE1C68D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgSXApTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702159699; x=1733695699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YaFUXNbBtaqUvdEWk5/wtGou8FeKsG9QoVoYIcZahYk=;
  b=JgSXApTQdgNK20W5FZivAmvMKQYXsCDhvuckYh0bKSwxUevm3BH4yStB
   vTHoQObYBAsVipKY61La8aKD3pLbcgUEu4EAxvooaOeFoyDBzTorxlSfw
   ukNlaXa+AZccdaG9LsAWmj3hq1rTHywtpJ7sV4fJLUVWqFUEnkaCcBNTp
   iMCp3qBu+xvRcAO4lPSX5cAFwPoHNs28ryNnTFDtp7mC2TPlbXY/fWJ13
   VJKVXmQoJkWPet1ss6EBV4ZVhO36eIFIhNzXZhzmvAEzfUStavunHy7TT
   zBgzLFVYUIbocI88hV4d+x/aW/R/GH6+jDWVv+VnnlQKOlFXdcBd02aln
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="394265193"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="394265193"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 14:08:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="801493114"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="801493114"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2023 14:07:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC5Tw-000G15-1D;
	Sat, 09 Dec 2023 22:07:32 +0000
Date: Sun, 10 Dec 2023 06:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 897/1053]
 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:24: error:
 implicit declaration of function 'readq'; did you mean 'readb'?
Message-ID: <202312100637.R8yMm5VH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   1fc141d1f445b8e5ab4ff14645b0482dd98460b9
commit: 0931b43873794c814a4a6fe1868b61edfe993b67 [897/1053] drm/xe/display: Implement display support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231210/202312100637.R8yMm5VH-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312100637.R8yMm5VH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100637.R8yMm5VH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15,
                    from drivers/gpu/drm/xe/xe_display.c:16:
   drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h: In function 'i915_gem_object_read_from_page':
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:24: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
      55 |                 *ptr = readq((void __iomem *)(virtual + ofs));
         |                        ^~~~~
         |                        readb
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15,
                    from drivers/gpu/drm/xe/display/intel_fbdev_fb.c:13:
   drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h: In function 'i915_gem_object_read_from_page':
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:24: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
      55 |                 *ptr = readq((void __iomem *)(virtual + ofs));
         |                        ^~~~~
         |                        readb
   drivers/gpu/drm/xe/display/intel_fbdev_fb.c: In function 'intel_fbdev_fb_alloc':
   drivers/gpu/drm/xe/display/intel_fbdev_fb.c:72:28: error: implicit declaration of function 'intel_bo_to_drm_bo' [-Werror=implicit-function-declaration]
      72 |         drm_gem_object_put(intel_bo_to_drm_bo(obj));
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/display/intel_fbdev_fb.c:72:28: warning: passing argument 1 of 'drm_gem_object_put' makes pointer from integer without a cast [-Wint-conversion]
      72 |         drm_gem_object_put(intel_bo_to_drm_bo(obj));
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                            |
         |                            int
   In file included from include/drm/ttm/ttm_bo.h:34,
                    from drivers/gpu/drm/xe/xe_bo_types.h:12,
                    from drivers/gpu/drm/xe/xe_bo.h:11,
                    from drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11:
   include/drm/drm_gem.h:501:43: note: expected 'struct drm_gem_object *' but argument is of type 'int'
     501 | drm_gem_object_put(struct drm_gem_object *obj)
         |                    ~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/xe/display/intel_fbdev_fb.c: In function 'intel_fbdev_fb_fill_info':
   drivers/gpu/drm/xe/display/intel_fbdev_fb.c:101:52: error: invalid type argument of '->' (have 'int')
     101 |         info->screen_size = intel_bo_to_drm_bo(obj)->size;
         |                                                    ^~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15,
                    from drivers/gpu/drm/i915/display/intel_display_trace.h:16,
                    from drivers/gpu/drm/i915/display/intel_atomic_plane.c:46:
   drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h: In function 'i915_gem_object_read_from_page':
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:24: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
      55 |                 *ptr = readq((void __iomem *)(virtual + ofs));
         |                        ^~~~~
         |                        readb
   drivers/gpu/drm/i915/display/intel_atomic_plane.c: In function 'intel_prepare_plane_fb':
   drivers/gpu/drm/i915/display/intel_atomic_plane.c:1099:51: error: implicit declaration of function 'intel_bo_to_drm_bo' [-Werror=implicit-function-declaration]
    1099 |                         ret = add_dma_resv_fences(intel_bo_to_drm_bo(old_obj)->resv,
         |                                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_atomic_plane.c:1099:78: error: invalid type argument of '->' (have 'int')
    1099 |                         ret = add_dma_resv_fences(intel_bo_to_drm_bo(old_obj)->resv,
         |                                                                              ^~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15,
                    from drivers/gpu/drm/i915/display/intel_de.h:9,
                    from drivers/gpu/drm/i915/display/intel_cursor.c:17:
   drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h: In function 'i915_gem_object_read_from_page':
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:24: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
      55 |                 *ptr = readq((void __iomem *)(virtual + ofs));
         |                        ^~~~~
         |                        readb
   In file included from drivers/gpu/drm/i915/display/intel_cursor.c:22:
   drivers/gpu/drm/i915/display/intel_frontbuffer.h: At top level:
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:28: error: field 'write' has incomplete type
      46 |         struct i915_active write;
         |                            ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:15,
                    from drivers/gpu/drm/i915/display/intel_fbdev.c:48:
   drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h: In function 'i915_gem_object_read_from_page':
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:55:24: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
      55 |                 *ptr = readq((void __iomem *)(virtual + ofs));
         |                        ^~~~~
         |                        readb
   In file included from drivers/gpu/drm/i915/display/intel_fbdev.c:54:
   drivers/gpu/drm/i915/display/intel_frontbuffer.h: At top level:
   drivers/gpu/drm/i915/display/intel_frontbuffer.h:46:28: error: field 'write' has incomplete type
      46 |         struct i915_active write;
         |                            ^~~~~
   drivers/gpu/drm/i915/display/intel_fbdev.c: In function 'intel_fbdev_init_bios':
   drivers/gpu/drm/i915/display/intel_fbdev.c:335:21: error: implicit declaration of function 'intel_bo_to_drm_bo' [-Werror=implicit-function-declaration]
     335 |                 if (intel_bo_to_drm_bo(obj)->size > max_size) {
         |                     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fbdev.c:335:44: error: invalid type argument of '->' (have 'int')
     335 |                 if (intel_bo_to_drm_bo(obj)->size > max_size) {
         |                                            ^~
   drivers/gpu/drm/i915/display/intel_fbdev.c:340:59: error: invalid type argument of '->' (have 'int')
     340 |                         max_size = intel_bo_to_drm_bo(obj)->size;
         |                                                           ^~
   cc1: some warnings being treated as errors


vim +55 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h

    33	
    34	static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
    35						  u32 ofs, u64 *ptr, u32 size)
    36	{
    37		struct ttm_bo_kmap_obj map;
    38		void *virtual;
    39		bool is_iomem;
    40		int ret;
    41	
    42		XE_WARN_ON(size != 8);
    43	
    44		ret = xe_bo_lock(bo, true);
    45		if (ret)
    46			return ret;
    47	
    48		ret = ttm_bo_kmap(&bo->ttm, ofs >> PAGE_SHIFT, 1, &map);
    49		if (ret)
    50			goto out_unlock;
    51	
    52		ofs &= ~PAGE_MASK;
    53		virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
    54		if (is_iomem)
  > 55			*ptr = readq((void __iomem *)(virtual + ofs));
    56		else
    57			*ptr = *(u64 *)(virtual + ofs);
    58	
    59		ttm_bo_kunmap(&map);
    60	out_unlock:
    61		xe_bo_unlock(bo);
    62		return ret;
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
