Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7C05683
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 13:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680529812; x=1712065812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZmqDsCRRuHls+1ctdUMUaP5F8izRtUhRjeQFX9zDUPI=;
  b=VmJqVDZWL1/jgy8wpuLufqEog8DlRf+J/ys3UHv5QMLVZkQA9Dhzd7Oe
   xnrdi9KDcZQDwqNKuYjU+NehwcwvG1zVRSBf/5NQjmD3rtlUcE5Xn/0Lx
   /xurMtkXPrfVzbphs14gL0bUWK0vxRMz+fuxaYIAoLhiv2OHSLNBhXP1E
   TiZS7B61HcpL6QqNd2Nye1wnK8HsI8fr97L15Pv1oBR+UvqOWbgKvf65u
   jfbyFta2331VA1fEg5FNwZZuG42/gEfZ0waeEekgeWv0bYdBunR+i6Rv3
   ElnsMA4aiEwj2BTC+AHCV75y78f+G09SZsOIK2BqcCJJyWfFJXHHzl7mR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404654178"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="404654178"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 06:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="1015717436"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="1015717436"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2023 06:50:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjKZW-000OMH-1B;
	Mon, 03 Apr 2023 13:50:10 +0000
Date: Mon, 3 Apr 2023 21:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Add support for PM DEMAND
Message-ID: <202304032107.aoVUtLmT-lkp@intel.com>
References: <20230403085043.2219092-1-mika.kahola@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403085043.2219092-1-mika.kahola@intel.com>

Hi Mika,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Kahola/drm-i915-mtl-Add-support-for-PM-DEMAND/20230403-165720
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230403085043.2219092-1-mika.kahola%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915/mtl: Add support for PM DEMAND
config: i386-randconfig-a016-20230403 (https://download.01.org/0day-ci/archive/20230403/202304032107.aoVUtLmT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/4be7899ed410c745e6af3dbc42d17ee129ba5fd5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mika-Kahola/drm-i915-mtl-Add-support-for-PM-DEMAND/20230403-165720
        git checkout 4be7899ed410c745e6af3dbc42d17ee129ba5fd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304032107.aoVUtLmT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_pm.c:47:6: warning: no previous prototype for 'intel_is_c10phy' [-Wmissing-prototypes]
      47 | bool intel_is_c10phy(struct drm_i915_private *dev_priv, enum phy phy)
         |      ^~~~~~~~~~~~~~~


vim +/intel_is_c10phy +47 drivers/gpu/drm/i915/intel_pm.c

    46	
  > 47	bool intel_is_c10phy(struct drm_i915_private *dev_priv, enum phy phy)
    48	{
    49	        if (IS_METEORLAKE(dev_priv) && (phy < PHY_C))
    50	                return true;
    51	
    52	        return false;
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
