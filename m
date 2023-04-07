Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134BAAD22
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 19:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680894905; x=1712430905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w8CiT3NDbkju3etKuiuizGapm7M2nRpMfWnN9wynB8c=;
  b=dUIpw0WFDn6YngI+3X979qXiQqCY+MIvqTCE6DUsbB5dWyt2lVZvIyQJ
   KDQ/Fo0UbP2UwOXXGt/6qT8d9Db0+eFq1ZK8yZ3bEE6JqBRCLG10Jl6Dr
   xLfuR2EKBgwfOG/BJ2eJMzUjhr1fe+wfCs/btkaNrPouBTYxJH7OfEYxF
   vKj/PN6svfcGF+7FV1zsdPRpf+FKLPF9Kn13CsnThEJwBNkjZ4066PPY1
   g8CpRsGRXPav4NM0fO8eyaIWw9yZkVw7CzusGWTTyvtR/ObQb/SK7yJBb
   vEQ0rJnzl3Nc71wnW4KvNlfoZIzrawESACUcj5RLF4ij0cJpxzMWuV5dz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="322690638"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="322690638"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 12:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="664987938"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="664987938"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2023 12:15:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkrY5-000SoK-3D;
	Fri, 07 Apr 2023 19:15:02 +0000
Date: Sat, 8 Apr 2023 03:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] fpga: dfl-fme: constify pointers to hwmon_channel_info
Message-ID: <202304080337.9U8nnFr9-lkp@intel.com>
References: <20230407150112.79854-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150112.79854-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc5 next-20230404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/fpga-dfl-fme-constify-pointers-to-hwmon_channel_info/20230407-230805
patch link:    https://lore.kernel.org/r/20230407150112.79854-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] fpga: dfl-fme: constify pointers to hwmon_channel_info
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230408/202304080337.9U8nnFr9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5b9bcef28b40b20ec5539bacbe0a8ae6e063bfa8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/fpga-dfl-fme-constify-pointers-to-hwmon_channel_info/20230407-230805
        git checkout 5b9bcef28b40b20ec5539bacbe0a8ae6e063bfa8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080337.9U8nnFr9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fpga/dfl-fme-main.c:277:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     277 |         .info = thermal_hwmon_info,
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-fme-main.c:477:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     477 |         .info = power_hwmon_info,
         |                 ^~~~~~~~~~~~~~~~


vim +/const +277 drivers/fpga/dfl-fme-main.c

4284c65a9fda9d Wu Hao 2019-10-14  274  
4284c65a9fda9d Wu Hao 2019-10-14  275  static const struct hwmon_chip_info thermal_hwmon_chip_info = {
4284c65a9fda9d Wu Hao 2019-10-14  276  	.ops = &thermal_hwmon_ops,
4284c65a9fda9d Wu Hao 2019-10-14 @277  	.info = thermal_hwmon_info,
4284c65a9fda9d Wu Hao 2019-10-14  278  };
4284c65a9fda9d Wu Hao 2019-10-14  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
