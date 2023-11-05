Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4EF79DF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1hk3/M4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699172620; x=1730708620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VkLvX6AMxYyzGF1Wl5p/n3NSWglWyEZnzq0B8cYeRlI=;
  b=Y1hk3/M4fwpNwmr36bW5N/wb227EsVFTevz7TXimDUEEghi/tf/X6YRv
   bZkiI1qzQV0Wqx0J8L66qBHpUk4ZwnhTAGD+AjUoPSTP+gn6twJrVX1jJ
   QyqFemc81s0tiCiVsBoiTOGPuRf3liPtQao2Fg5L6WlKKtNafavBIhO/T
   RJL3rqGVWnVlkDFajmUZM6CqQXqp67ZSFt92nqg+rdcaXOqc0HWQh18rj
   EP5Ec7MlwkGD3f2KbF6Rclwu/Zpr5i0mCGb7/qccP7SkkTreI3aRMVxPb
   r6z5gbURYW9mVe4OmIWlrZ71qP9KioSzNGg0VZEE9/y9+r8qZs24m9K4f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="2106522"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="2106522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="9802296"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2023 01:23:38 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzYPv-0005Bx-1o;
	Sun, 05 Nov 2023 08:23:35 +0000
Date: Sun, 5 Nov 2023 16:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Arun R Murthy <arun.r.mruthy@intel.com>
Subject: [drm-xe:drm-xe-next 1807/1906]
 drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous
 prototype for 'intel_gmch_vga_set_decode'
Message-ID: <202311051609.P3gULvxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uma,

FYI, the error/warning still remains.

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   fc457bcc18109467961edc92c80b238009f6a9fb
commit: e2f3d6c51c72c6ae6046ede17f03ca962a093bc1 [1807/1906] drm/xe/display: Create a dummy version for vga decode
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231105/202311051609.P3gULvxf-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051609.P3gULvxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051609.P3gULvxf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous prototype for 'intel_gmch_vga_set_decode' [-Wmissing-prototypes]
      10 | unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/intel_gmch_vga_set_decode +10 drivers/gpu/drm/xe/display/xe_display_misc.c

     9	
  > 10	unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
