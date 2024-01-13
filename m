Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE50A5F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 00:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgLVfa/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705107329; x=1736643329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kR5kxUGyi4v0IXzo2nMiWalnKEyHQ7edJMGt7yb9jaU=;
  b=XgLVfa/EkBn7Mb/CnLjjR+lFXrvcjN4xinlfAhuu3/JXG6m6KIIZuHcd
   fCLszMylMnFO4+DeRoE23EPYkK2mbRFqPnB7cuCw5lNzz074MnXM1KFSc
   8R2oSZ8uvAnCu43odR1QnlDs8mSPVhWrpjOhsSCER87Fuo84nUxBVDKdl
   r8/1mDZNMLBqkaZv17BwN4vJTzSn9JIh92b+1ZsQqag37Dy12FVPmx80D
   YTKWmFQ6uc4/vWBO1Qk2eKYSArlmxr4flD6PAsvtiO7HzjoHrUZxJ0zyv
   LDKfNj+NjlpGMJ1puI+lBYwE1Xu5LVeOZA3z9LAZsjIHqn64xmK8qIsD9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="396468295"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="396468295"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 16:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="783209796"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="783209796"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Jan 2024 16:55:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOSJ2-0009wq-1w;
	Sat, 13 Jan 2024 00:55:24 +0000
Date: Sat, 13 Jan 2024 08:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 12/15] drm/i915: Simplify intel_initial_plane_config()
 calling convention
Message-ID: <202401130812.FuCMw99v-lkp@intel.com>
References: <20231215105929.29568-13-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215105929.29568-13-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip linus/master next-20240112]
[cannot apply to drm-intel/for-linux-next-fixes v6.7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-Use-struct-resource-for-memory-region-IO-as-well/20240112-020958
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20231215105929.29568-13-ville.syrjala%40linux.intel.com
patch subject: [PATCH v2 12/15] drm/i915: Simplify intel_initial_plane_config() calling convention
config: arm64-randconfig-004-20240113 (https://download.01.org/0day-ci/archive/20240113/202401130812.FuCMw99v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130812.FuCMw99v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130812.FuCMw99v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/xe_plane_initial.c:270:6: warning: no previous prototype for 'intel_crtc_initial_plane_config' [-Wmissing-prototypes]
     270 | void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && EXPERT [=y] && DRM_XE [=m]=m


vim +/intel_crtc_initial_plane_config +270 drivers/gpu/drm/xe/display/xe_plane_initial.c

44e694958b9539 Maarten Lankhorst 2023-08-17  269  
44e694958b9539 Maarten Lankhorst 2023-08-17 @270  void intel_crtc_initial_plane_config(struct intel_crtc *crtc)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
