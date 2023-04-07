Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549D3848E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 18:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680891780; x=1712427780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d2IMPRMCxvgRtVKzPNWXPXZAy5awwui9x34jepfzU94=;
  b=oImG+85Z/xRL9gi0vEi0oA3oy6+glyk8DyKx8VjzjvwHWVVSU8BR3tBD
   bQz7+oPIf+Jm/6oBK/V5uMjjVtxppK6wwcwmZSXoeTI/Y6uVtBEdKZfRh
   dw9YxirR7Yq1xT4mYHeZsLxMJ2pHQLZxHjvAphe400tAtDS58mzb+bPjc
   yxraMG/xM+ueH++DzPp92jmFRv4ULejMpPoHIYBWdneB20Hros/85v6ma
   t3bhk3gXRIR2BkdiWG+WwF7Y4Xnfuk5Tl0TY3BH3D9VCOqwfEIfK0SCMA
   8jGXmXaax7vQQbfvGtXB3R7ZXWHOdDNxgDINoT+pkLPAOploHQB82vfLC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="343050168"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="343050168"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:22:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="776914987"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="776914987"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2023 11:22:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqji-000SmU-0B;
	Fri, 07 Apr 2023 18:22:58 +0000
Date: Sat, 8 Apr 2023 02:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] w1: therm: constify pointers to hwmon_channel_info
Message-ID: <202304080230.np12Enyc-lkp@intel.com>
References: <20230407150121.79887-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150121.79887-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/w1-therm-constify-pointers-to-hwmon_channel_info/20230407-230519
patch link:    https://lore.kernel.org/r/20230407150121.79887-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] w1: therm: constify pointers to hwmon_channel_info
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080230.np12Enyc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9db1d901e409a44fc2b6d59cc07a76018a085aee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/w1-therm-constify-pointers-to-hwmon_channel_info/20230407-230519
        git checkout 9db1d901e409a44fc2b6d59cc07a76018a085aee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/w1/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080230.np12Enyc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/w1/slaves/w1_therm.c:469:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     469 |         .info = w1_info,
         |                 ^~~~~~~


vim +/const +469 drivers/w1/slaves/w1_therm.c

a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  466  
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  467  static const struct hwmon_chip_info w1_chip_info = {
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  468  	.ops = &w1_hwmon_ops,
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30 @469  	.info = w1_info,
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  470  };
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  471  #define W1_CHIPINFO	(&w1_chip_info)
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  472  #else
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  473  #define W1_CHIPINFO	NULL
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  474  #endif
a97db8818c7e8b Jaghathiswari Rankappagounder Natarajan 2017-08-30  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
