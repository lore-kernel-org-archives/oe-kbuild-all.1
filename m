Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF223C4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 16:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680886678; x=1712422678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pmpluUeZ8/OvMfQJcqWQb8Sb4H7ogTTPKOH6/R8Rlbk=;
  b=iUuUnszZlATFTclljLWcNrWDJa9s/tY2X6rjWE2IJ0UMjPu+8u9I8fhP
   TZQXGxfqcxiCimddlQ0u0dLWjw01hc07Y8tSGA1Jsp6iCqEmUGmUWmd1N
   6n6CWUuKkM3BjU+0nRB5cL1WEUQw11mboWj7ck4Tm7w1W/BgbjmrzF+Bi
   XqBLB2Vt6mGP1VOj1wZZ4rmWFZE20f729Sea8Iyh/FOezfo66Eq2MK1Xr
   x53ztGz57MxaU949k4pn27Tpc6JsdlmsHRr+fXrHkYDxqRJS5VsQSmQmr
   Z8w85y1DWWRJp+zIzXgZisBtPXUmL5aVhXFxUdjVc5bdeqWi3e+6JPxdu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="340515946"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="340515946"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 09:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811452136"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="811452136"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2023 09:57:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpPP-000Shl-1P;
	Fri, 07 Apr 2023 16:57:55 +0000
Date: Sat, 8 Apr 2023 00:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nvme: host: hwmon: constify pointers to
 hwmon_channel_info
Message-ID: <202304080031.JzoLJ7pI-lkp@intel.com>
References: <20230407145845.79557-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407145845.79557-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on axboe-block/for-next linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/nvme-host-hwmon-constify-pointers-to-hwmon_channel_info/20230407-230001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230407145845.79557-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] nvme: host: hwmon: constify pointers to hwmon_channel_info
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080031.JzoLJ7pI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a92019809fb469cc9c9f751cee4cfaad054ddb48
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/nvme-host-hwmon-constify-pointers-to-hwmon_channel_info/20230407-230001
        git checkout a92019809fb469cc9c9f751cee4cfaad054ddb48
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/nvme/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080031.JzoLJ7pI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/hwmon.c:221:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     221 |         .info   = nvme_hwmon_info,
         |                   ^~~~~~~~~~~~~~~


vim +/const +221 drivers/nvme/host/hwmon.c

400b6a7b13a3fd Guenter Roeck 2019-11-06  218  
400b6a7b13a3fd Guenter Roeck 2019-11-06  219  static const struct hwmon_chip_info nvme_hwmon_chip_info = {
400b6a7b13a3fd Guenter Roeck 2019-11-06  220  	.ops	= &nvme_hwmon_ops,
400b6a7b13a3fd Guenter Roeck 2019-11-06 @221  	.info	= nvme_hwmon_info,
400b6a7b13a3fd Guenter Roeck 2019-11-06  222  };
400b6a7b13a3fd Guenter Roeck 2019-11-06  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
