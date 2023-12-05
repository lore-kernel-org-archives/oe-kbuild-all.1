Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CAFCA57
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 04:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZX6X1MoP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701750006; x=1733286006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rld/ISMJVEYTZtPEH7nGbYZPNSbfq2+7cNQjr1Y1oUg=;
  b=ZX6X1MoPzoY1U7IYzbNa9LVSz2gQVo+qgO/OZ2p4cXd+OmnOFgTXqkQ0
   IWzvc3IbqzzLfxzABjP0G/Y53Ss5ozrlSszo9fJPYkDQIcpurC05KQ4IL
   /Kc77CgEak3J8RsPIlDyOB8oeIWlgCQzVua0bIchIGuoytZxpNUiFH8WE
   fzq4br8CjWXE/gAGqVK6Z0DDZuGrOeoN5PbHEX+mn+1nMhhfo2Y20Rbuq
   +Ieme0dUvQObPtbqqGhnriGfgYCgXK1F2EMhoA7C1kL+Qn+yf1+9AdgGI
   mMyUwLqdcV086d87O2I0FUfuG23pvzB1mlEXZP32YupL/eN89j+Ma8ujo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="480032196"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="480032196"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 20:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861621290"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="861621290"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 20:20:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAMug-0008L8-1E;
	Tue, 05 Dec 2023 04:20:02 +0000
Date: Tue, 5 Dec 2023 12:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
Message-ID: <202312051212.dTxjtBEJ-lkp@intel.com>
References: <20231204123315.28456-5-keith.zhao@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204123315.28456-5-keith.zhao@starfivetech.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.7-rc4]
[cannot apply to drm-misc/drm-misc-next drm/drm-next next-20231204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Zhao/dt-bindings-display-Add-yamls-for-JH7110-display-system/20231204-203725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231204123315.28456-5-keith.zhao%40starfivetech.com
patch subject: [v3 4/6] drm/vs: Add KMS crtc&plane
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051212.dTxjtBEJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051212.dTxjtBEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051212.dTxjtBEJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/verisilicon/vs_dc.c: In function 'dc_isr':
   drivers/gpu/drm/verisilicon/vs_dc.c:970:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     970 |         u32 i, ret;
         |                ^~~
   drivers/gpu/drm/verisilicon/vs_dc.c: At top level:
>> drivers/gpu/drm/verisilicon/vs_dc.c:78:18: warning: 'primary_overlay_format1' defined but not used [-Wunused-const-variable=]
      78 | static const u32 primary_overlay_format1[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/verisilicon/vs_plane.c: In function 'vs_plane_atomic_duplicate_state':
>> drivers/gpu/drm/verisilicon/vs_plane.c:48:32: warning: variable 'old_state' set but not used [-Wunused-but-set-variable]
      48 |         struct vs_plane_state *old_state;
         |                                ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMA_CMA
   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
   Selected by [y]:
   - DRM_VERISILICON [=y] && HAS_IOMEM [=y] && DRM [=y]


vim +/primary_overlay_format1 +78 drivers/gpu/drm/verisilicon/vs_dc.c

    77	
  > 78	static const u32 primary_overlay_format1[] = {
    79		DRM_FORMAT_XRGB8888,
    80		DRM_FORMAT_XBGR8888,
    81		DRM_FORMAT_RGBX8888,
    82		DRM_FORMAT_BGRX8888,
    83		DRM_FORMAT_ARGB8888,
    84		DRM_FORMAT_ABGR8888,
    85		DRM_FORMAT_RGBA8888,
    86		DRM_FORMAT_BGRA8888,
    87		DRM_FORMAT_ARGB2101010,
    88		DRM_FORMAT_ABGR2101010,
    89		DRM_FORMAT_RGBA1010102,
    90		DRM_FORMAT_BGRA1010102,
    91		DRM_FORMAT_NV12,
    92		DRM_FORMAT_NV21,
    93		DRM_FORMAT_YUV444,
    94	};
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
