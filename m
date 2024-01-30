Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF24374D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 05:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706593252; cv=none; b=tllQdBB2crv9D7RSXZ5MtHw4VLtggAbsX04kjbWE6oShVwg8TDJFgyfizYAwTWLwh7ECoKJnuLMDN2dCIRmn5xYYMe/Z8wIJ3A3Lv9iUIG5nmKx2pOxkemcERwdlS18cKerFVCkyFPF6AAvw6AMIy1WXJypCa8oMaOcSph5hBwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706593252; c=relaxed/simple;
	bh=CFvJHNTh+bKqeU8F1OJihMXdJC+Csf2qaU9ySqsMKqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2XappscywF9141ZZ2uUG1Y5qrmhqLbLl1XQFMaPE6rm0+4VVqh9RSu9HrfyQ33GL8ABh84+ovW/H3eUOA9gk/dYD5X9ubNDrtbXONYYeRHgikbE+tZMtQ9HC92e1nCeoCAJEUoxqtBHmlPk5HwWmHyJQ1YAGHchwgPgRZZIZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gK0L6ll+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gK0L6ll+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706593251; x=1738129251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CFvJHNTh+bKqeU8F1OJihMXdJC+Csf2qaU9ySqsMKqw=;
  b=gK0L6ll+zzV0cJkEyXBPIkgTGfgAu5uaZv5/IM1cooTeymk/zq0hUiMK
   cFXWq9Z1FgLk+j5G8fZsOrQdyDsN3EL+ZEvyqY5TutgR/gsGcdEtAzFym
   wZ44WLwgp79jaVwi0MCN2fkeCh9p0vZciC3oRhIlpygQYhmIV7Tuzkl0+
   M/cVdZp/dmlHRNBaftdR2mOhJIVTBi/mM/+WcfKxjDutaj0qLO/4XWBcV
   lDgYiyOfr0BFi+3ZA2JP6av+yWB6E3n006w96zrcv/eqxaRE8KbogiTf0
   Z1YIOFOcnOjFrAPA1y8h9sRrEfLMMUyDYr1rLfA3MLB2lH+isniLQ0l92
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9815840"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="9815840"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 21:40:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3548319"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2024 21:40:47 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUgrV-0004w8-09;
	Tue, 30 Jan 2024 05:40:45 +0000
Date: Tue, 30 Jan 2024 13:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file-bd_inode 35/37]
 drivers/gpu/drm/drm_gem_vram_helper.c:938:35: error: implicit declaration of
 function 'drm_vram_mm_obdev_file'; did you mean 'drm_vram_mm_of_bdev'?
Message-ID: <202401301340.6Em35GNa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file-bd_inode
head:   92279a7f8c418cb71e6fb335e4af2c7565944a11
commit: d8db7fccf2cac31fb2021ddc1dc989d2c878099d [35/37] fs & block: remove bdev->bd_inode
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240130/202401301340.6Em35GNa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401301340.6Em35GNa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401301340.6Em35GNa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem_vram_helper.c: In function 'bo_driver_io_mem_reserve':
>> drivers/gpu/drm/drm_gem_vram_helper.c:938:35: error: implicit declaration of function 'drm_vram_mm_obdev_file'; did you mean 'drm_vram_mm_of_bdev'? [-Werror=implicit-function-declaration]
     938 |         struct drm_vram_mm *vmm = drm_vram_mm_obdev_file(bdev);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
         |                                   drm_vram_mm_of_bdev
>> drivers/gpu/drm/drm_gem_vram_helper.c:938:35: warning: initialization of 'struct drm_vram_mm *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +938 drivers/gpu/drm/drm_gem_vram_helper.c

   934	
   935	static int bo_driver_io_mem_reserve(struct ttm_device *bdev,
   936					    struct ttm_resource *mem)
   937	{
 > 938		struct drm_vram_mm *vmm = drm_vram_mm_obdev_file(bdev);
   939	
   940		switch (mem->mem_type) {
   941		case TTM_PL_SYSTEM:	/* nothing to do */
   942			break;
   943		case TTM_PL_VRAM:
   944			mem->bus.offset = (mem->start << PAGE_SHIFT) + vmm->vram_base;
   945			mem->bus.is_iomem = true;
   946			mem->bus.caching = ttm_write_combined;
   947			break;
   948		default:
   949			return -EINVAL;
   950		}
   951	
   952		return 0;
   953	}
   954	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
