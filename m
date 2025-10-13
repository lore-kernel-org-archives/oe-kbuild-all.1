Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A197261D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387444; cv=none; b=qXyCh4Bug8x66GnMskd3yL12DZZ+TASSaTTePOgXGAZgObZE7ljMgIBfMwuoPMDEgVpNH/bOKhvwQ2OoVGybMGT2UxbXUXcz61hePP5lYCs2AC9/O6VC37LwX0GJSBzc7SNB3jxuTry0eiCkK9PvLVU8SdLpvNxNF+cpRqO110M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387444; c=relaxed/simple;
	bh=TkWzNIMYjMA6cCfbdW9QfMreRyY8r9dsMnpdE5NQV9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kLkdkFSfpfsZhpfQKC7gnOqz27+u4hIsfm3cJfPa01458SOCjAWfGg8UhpcAsIpBiN5QNwIaaS5zezvX3u7LgtDvNRTmn2rUY3tI1xizvDsk3sf3JDQzCDVhJAXesAAAhK7hn7JvmwJmlwI9LjdxBhS9QJD5ql7hRHmt33738Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mePdIxYv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mePdIxYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760387443; x=1791923443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkWzNIMYjMA6cCfbdW9QfMreRyY8r9dsMnpdE5NQV9Q=;
  b=mePdIxYvPuA5PGARgZWLDsinKCFvPi5NKR1F0OqrUKOrpxe8z3S4uSg4
   GFXreslqW9/HKQJ3KwMsyL97D32/GC5tn2+TnZKFBYYWlsKUIiK+HYQ6j
   F60nSqIB6ROHGASOXQfKnUMlxmGhYKqAIXLBvx8YIeekyLo5Pbkj48GfA
   NQQCRQFZTa7btsmMnMRJ7kUdkn/au9BXdiNJLVXy+Wilfh1+wL6COLTTS
   /ynpymE2g69p0Z4M1Xz0tz/GtvCl0wLejlbYmnLvf30EpTCGs9kcV1HCY
   mDymOtegadRIAQRgmXVmbhRrDAvKcBtB+xJlYiES8w106YswC8Yq2oqNj
   g==;
X-CSE-ConnectionGUID: AxfFI1iCRVK3nxH6+6XZ7A==
X-CSE-MsgGUID: 4NJhIkbbQS+dIayBMoK8KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66359996"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66359996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 13:30:42 -0700
X-CSE-ConnectionGUID: cnnvy5JERCeDvLTI58Oibw==
X-CSE-MsgGUID: Ep7y1L2ZRvKEkfdBI8j1Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="181710004"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Oct 2025 13:30:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8PBm-00021v-35;
	Mon, 13 Oct 2025 20:30:38 +0000
Date: Tue, 14 Oct 2025 04:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2967/2967]
 drivers/gpu/drm/phytium/phytium_gem.c:174:5: warning: no previous prototype
 for 'phytium_gem_prime_mmap'
Message-ID: <202510140437.03o5mC31-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi xuyan,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   168e029a9e4d8300e9779b8559d1e125a869533f
commit: 3b4a5906fa714bdc9a15fc04374942888737eb4c [2967/2967] drm/phytium: Fix Phytium DRM build fail
config: x86_64-randconfig-r123-20251014 (https://download.01.org/0day-ci/archive/20251014/202510140437.03o5mC31-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140437.03o5mC31-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140437.03o5mC31-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/phytium/phytium_gem.c:22:5: warning: no previous prototype for 'phytium_memory_pool_alloc' [-Wmissing-prototypes]
      22 | int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:37:6: warning: no previous prototype for 'phytium_memory_pool_free' [-Wmissing-prototypes]
      37 | void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:161:5: warning: no previous prototype for 'phytium_gem_prime_vmap' [-Wmissing-prototypes]
     161 | int phytium_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:170:6: warning: no previous prototype for 'phytium_gem_prime_vunmap' [-Wmissing-prototypes]
     170 | void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_gem.c:174:5: warning: no previous prototype for 'phytium_gem_prime_mmap' [-Wmissing-prototypes]
     174 | int phytium_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:186:5: warning: no previous prototype for 'phytium_dma_transfer' [-Wmissing-prototypes]
     186 | int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
         |     ^~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/phytium/pe220x_dc.c:79:6: warning: no previous prototype for 'pe220x_dc_hw_vram_init' [-Wmissing-prototypes]
      79 | void pe220x_dc_hw_vram_init(struct phytium_display_private *priv, resource_size_t vram_addr,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:93:6: warning: no previous prototype for 'pe220x_dc_hw_config_pix_clock' [-Wmissing-prototypes]
      93 | void pe220x_dc_hw_config_pix_clock(struct drm_crtc *crtc, int clock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:110:6: warning: no previous prototype for 'pe220x_dc_hw_reset' [-Wmissing-prototypes]
     110 | void pe220x_dc_hw_reset(struct drm_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:231:5: warning: no previous prototype for 'pe220x_dc_hw_fb_format_check' [-Wmissing-prototypes]
     231 | int pe220x_dc_hw_fb_format_check(const struct drm_mode_fb_cmd2 *mode_cmd, int count)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:243:6: warning: no previous prototype for 'pe220x_dc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     243 | void pe220x_dc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/pe220x_dc.c:252:6: warning: no previous prototype for 'pe220x_dc_bmc_hw_plane_get_primary_format' [-Wmissing-prototypes]
     252 | void pe220x_dc_bmc_hw_plane_get_primary_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:261:6: warning: no previous prototype for 'pe220x_dc_hw_plane_get_cursor_format' [-Wmissing-prototypes]
     261 | void pe220x_dc_hw_plane_get_cursor_format(const uint64_t **format_modifiers,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:270:6: warning: no previous prototype for 'pe220x_dc_hw_update_primary_hi_addr' [-Wmissing-prototypes]
     270 | void pe220x_dc_hw_update_primary_hi_addr(struct drm_plane *plane)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/pe220x_dc.c:287:6: warning: no previous prototype for 'pe220x_dc_hw_update_cursor_hi_addr' [-Wmissing-prototypes]
     287 | void pe220x_dc_hw_update_cursor_hi_addr(struct drm_plane *plane, uint64_t iova)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/phytium_gem_prime_mmap +174 drivers/gpu/drm/phytium/phytium_gem.c

b80df10f845813 lishuo 2024-01-31  173  
e2cdf30a3e12bb XuYan  2025-04-09 @174  int phytium_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
e2cdf30a3e12bb XuYan  2025-04-09  175  {
e2cdf30a3e12bb XuYan  2025-04-09  176  	return phytium_gem_mmap_obj(obj, vma);
b80df10f845813 lishuo 2024-01-31  177  }
b80df10f845813 lishuo 2024-01-31  178  

:::::: The code at line 174 was first introduced by commit
:::::: e2cdf30a3e12bb55e76d60e99c0abd7db2917b5c drm/phytium: Fix some Bugs in Phytium Display Engine

:::::: TO: XuYan <xuyan1481@phytium.com.cn>
:::::: CC: xuyan <xuyan1481@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
