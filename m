Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E6128E2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680519364; x=1712055364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v+kcj0sTO/IKKp6uBWGgjPyK5ZNmgdLdPm7bcdAmJII=;
  b=hDKXjqdDSrmEoRXwsoYfHRGwVXTHDlDm2wr+hMmUL/MyPbNXdb8gvcLd
   RPo7r8kgAFqAIpa4RrTYL+R96CWBcTmuxQKXyh6RlHrSnzlU7BunX4Wtq
   c0fYQ0CR6eaFHIo8t4quvbwzU1/b6Exx/CdQwZP81hz5/qKURb+PVz5DH
   3nhzmmmu5J+CogC4NEu6wJsjtMdDfnmTCO/1ouNlWptudxR0gswKqz8O0
   XhokQ2xwPwRQ4o1eh5vwSzllPaBsYAcjirRt73IlyHOw+OsnZZCSoaM62
   VqlhxFTeekzUBcGOgEdxj990FdtSAPzsCdwCp1sVpolLLrEzFlvgJnBI0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="344417653"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="344417653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 03:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="860159520"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="860159520"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Apr 2023 03:56:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjHqz-000ODJ-2I;
	Mon, 03 Apr 2023 10:56:01 +0000
Date: Mon, 3 Apr 2023 18:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Add support for PM DEMAND
Message-ID: <202304031821.7mf2eSpM-lkp@intel.com>
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Kahola/drm-i915-mtl-Add-support-for-PM-DEMAND/20230403-165720
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230403085043.2219092-1-mika.kahola%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915/mtl: Add support for PM DEMAND
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230403/202304031821.7mf2eSpM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/4be7899ed410c745e6af3dbc42d17ee129ba5fd5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mika-Kahola/drm-i915-mtl-Add-support-for-PM-DEMAND/20230403-165720
        git checkout 4be7899ed410c745e6af3dbc42d17ee129ba5fd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304031821.7mf2eSpM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_pm.c:47:6: error: no previous prototype for 'intel_is_c10phy' [-Werror=missing-prototypes]
      47 | bool intel_is_c10phy(struct drm_i915_private *dev_priv, enum phy phy)
         |      ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
