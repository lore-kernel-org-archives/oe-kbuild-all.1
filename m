Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2238A93D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687017941; x=1718553941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZG4l3ifwfA5aOy7hcQJTPpfQwPOcvRYZcelZLIDTXng=;
  b=ZWLNY4bPo83rXfgm0JVfVCgXytHF/nXPK0HM2vY+hTm3jszFeW2wvTGc
   /rRGf2hEGulV9P19dtg4P9zU9ZWNnIVDUCatByXM3oT224zzN3hCjaogv
   nVAU+ZGRmJZTiBSYxhns+9s0m6S3LPQPoFMJT1l7SFRoVwAz2dobktrWl
   2Ny7pfR6tp9zTL12WkKlVAisb1u0JriK9OCN4Fv+ZmWgCIv/aMPKDsvy5
   elONS5WMaunDoKHdFKHMSXq3/7XOdJN0wid8SctLi4btgzhOR0mhKja0M
   eJaSzqi6gJ84Pslvaqhs3kyNDyY686IkrDt2v6oPGKwRWDLW/ZoJ7zu52
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339735828"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="339735828"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 09:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="826094990"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="826094990"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2023 09:05:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAYQl-0002ts-02;
	Sat, 17 Jun 2023 16:05:39 +0000
Date: Sun, 18 Jun 2023 00:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [linux-next:master 5707/10546]
 drivers/gpu/drm/i915/i915_driver.c:1806:24: error: 'i915_drm_client_fdinfo'
 undeclared here (not in a function); did you mean 'i915_drm_client_alloc'?
Message-ID: <202306180044.rvrE6n8B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7efed9f38f886edb450041b82a6f15d663c98f8
commit: e894b724c316d9b45d963f929c97578cdffbbe8d [5707/10546] drm/i915: Use the fdinfo helper
config: i386-buildonly-randconfig-r004-20230617 (https://download.01.org/0day-ci/archive/20230618/202306180044.rvrE6n8B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180044.rvrE6n8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180044.rvrE6n8B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_driver.c:1806:24: error: 'i915_drm_client_fdinfo' undeclared here (not in a function); did you mean 'i915_drm_client_alloc'?
    1806 |         .show_fdinfo = i915_drm_client_fdinfo,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        i915_drm_client_alloc


vim +1806 drivers/gpu/drm/i915/i915_driver.c

  1793	
  1794	static const struct drm_driver i915_drm_driver = {
  1795		/* Don't use MTRRs here; the Xserver or userspace app should
  1796		 * deal with them for Intel hardware.
  1797		 */
  1798		.driver_features =
  1799		    DRIVER_GEM |
  1800		    DRIVER_RENDER | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_SYNCOBJ |
  1801		    DRIVER_SYNCOBJ_TIMELINE,
  1802		.release = i915_driver_release,
  1803		.open = i915_driver_open,
  1804		.lastclose = i915_driver_lastclose,
  1805		.postclose = i915_driver_postclose,
> 1806		.show_fdinfo = i915_drm_client_fdinfo,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
