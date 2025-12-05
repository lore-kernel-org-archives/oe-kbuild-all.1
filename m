Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACCB2BE03C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 05:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764912549; cv=none; b=Tttm/XRsmjni5okqWM3r2/NjkpjP9Hp/FQ3BXBoxL6hmK38bVdEAom7zyiyuYpHW53/btx0RWz2As6Rj1OkypseLxOjBgdCqEb1k1+HKtOU53kWusIRkYAY47y9L4RRRclYRyCM1mUMomPCJt/SNdb5PvJohPzyNz1NROst0F0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764912549; c=relaxed/simple;
	bh=Hp9Xebz6+cnsS14oU0eEfkE5UlDFhJq7qG6Zgsuy4DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXOVvJ9QjhL+Cx4QNqlmRRtJNQqYKU0Aa7uJ4EON6jeAu5mntne6Wo93e2ZEWWhGNIZ/hhnu86Lmd6MuoEJtzvDM9ObyzP1xOm3um3fGJA2QbT7PHqG0RvGlau0aPZBLQH8Eltt+c6NZUnJcMCh+EW8TphhFwxXV6uPZ+Hjrm6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZPF9nZk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZPF9nZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764912548; x=1796448548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hp9Xebz6+cnsS14oU0eEfkE5UlDFhJq7qG6Zgsuy4DI=;
  b=WZPF9nZkA/2vNYbo5gOGF93kZDsXenFMMLogEg6k7vx4bNmaCO851gCk
   RIthAAMn6aVmMx7MxW6tTdMFrw/mz1ketg6jqnyeU31d+tedOKtOLWZtq
   BkpX4ApEfsN44PT2x2prl3O9nc0xhMwvWI5LYPyeD4SUVtLXfIvVwIfEt
   gzRfYz0QWcoZGVJXFatci0pxlz515CewC3aEnvhM3l1Aebm8FhsDTSZBl
   3rE5iDQpmisj+R2PMgmc/7/pZ38kXhBkNFW9Th5pzkRr/VYVEYG8pC4Re
   IgJNkYH9FIcc8w8lWW/AmgaZMUON8pSrDg0xI+mW7vs6YGrXV89JBmj+r
   A==;
X-CSE-ConnectionGUID: HO0qPZ47SrKQA7Y/Ovc9Bg==
X-CSE-MsgGUID: 7+7KMwKDRkCSvwv7Dx+hXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77267394"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="77267394"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 21:29:02 -0800
X-CSE-ConnectionGUID: lOIpydqDSS+Rp4mBXDCRRQ==
X-CSE-MsgGUID: Y18uj1LmT8yspzHZNNan3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="200328137"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2025 21:29:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRONF-00000000EeD-1ymq;
	Fri, 05 Dec 2025 05:28:57 +0000
Date: Fri, 5 Dec 2025 13:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com
Subject: Re: [PATCH 3/4] drm/{i915, xe}/stolen: move stolen memory handling
 to display parent interface
Message-ID: <202512051314.oZYc0VKc-lkp@intel.com>
References: <cc2125f57b98401ea47746ad4784bb4bc6b198c2.1764868989.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc2125f57b98401ea47746ad4784bb4bc6b198c2.1764868989.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.18 next-20251204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-fbc-let-to_intel_display-do-its-generic-magic/20251205-012659
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/cc2125f57b98401ea47746ad4784bb4bc6b198c2.1764868989.git.jani.nikula%40intel.com
patch subject: [PATCH 3/4] drm/{i915, xe}/stolen: move stolen memory handling to display parent interface
config: i386-buildonly-randconfig-005-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051314.oZYc0VKc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051314.oZYc0VKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051314.oZYc0VKc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_fbc.c: In function 'fbc_sys_cache_enable':
>> drivers/gpu/drm/i915/display/intel_fbc.c:1011:18: error: implicit declaration of function 'i915_gem_stolen_node_offset'; did you mean 'intel_parent_stolen_node_offset'? [-Wimplicit-function-declaration]
    1011 |         offset = i915_gem_stolen_node_offset(fbc->compressed_fb) / (4 * 1024);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  intel_parent_stolen_node_offset


vim +1011 drivers/gpu/drm/i915/display/intel_fbc.c

0b806d62fd5f59 Vinod Govindapillai 2025-11-28   998  
0b806d62fd5f59 Vinod Govindapillai 2025-11-28   999  static void fbc_sys_cache_enable(const struct intel_fbc *fbc)
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1000  {
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1001  	struct intel_display *display = fbc->display;
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1002  	struct sys_cache_cfg *sys_cache = &display->fbc.sys_cache;
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1003  	int range, offset;
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1004  	u32 cfg;
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1005  
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1006  	if (!HAS_FBC_SYS_CACHE(display))
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1007  		return;
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1008  
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1009  	range = fbc_sys_cache_limit(display) / (64 * 1024);
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1010  
0b806d62fd5f59 Vinod Govindapillai 2025-11-28 @1011  	offset = i915_gem_stolen_node_offset(fbc->compressed_fb) / (4 * 1024);
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1012  
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1013  	cfg = FBC_SYS_CACHE_TAG_USE_RES_SPACE | FBC_SYS_CACHEABLE_RANGE(range) |
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1014  	      FBC_SYS_CACHE_START_BASE(offset);
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1015  
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1016  	mutex_lock(&sys_cache->lock);
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1017  	/* update sys cache config only if sys cache is unassigned */
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1018  	if (sys_cache->id == FBC_SYS_CACHE_ID_NONE)
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1019  		fbc_sys_cache_update_config(display, cfg, fbc->id);
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1020  	mutex_unlock(&sys_cache->lock);
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1021  }
0b806d62fd5f59 Vinod Govindapillai 2025-11-28  1022  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
