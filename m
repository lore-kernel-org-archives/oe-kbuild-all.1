Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DF76FC8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680887343; x=1712423343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YgaOtyEV7tf/MuLUMMI6WtYkBIbPhlv8yh2DHk1vULA=;
  b=XbImlQkP+DTJbTF2GlJdsrbZbrxUGCqLL2O3RpBiXUzGnCRYEmxn/MWj
   nffu6cZzHmQKfLHw6XxNV/EoQb9vQLV4fuHQnTYLr6+B94kI0aVV5oYlg
   R5KmJzSSNlH/c4tFGDP1HeOuQt4jumVga335B5kyeUa8C7+FnOvsc7tBK
   Z06GiRYUBJE/bnXs6BYHsvx+peCVWooilgmr7a4QPCJQjdd0WkQM/A5B5
   kb9N132sfuuM5FVGo9SzKaX5U2eEPDjkYjqKAZSmsRLJfcnUPHKb0YarB
   yinNc/KD3rwubC1chJmmB1obbiho+g1DjErKi79yZXVuLxGPEDcONzKM0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344805049"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="344805049"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637764966"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="637764966"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 10:09:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpa3-000Sid-2r;
	Fri, 07 Apr 2023 17:08:55 +0000
Date: Sat, 8 Apr 2023 01:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/8] net: phy: aquantia: constify pointers to
 hwmon_channel_info
Message-ID: <202304080009.qfRygYfS-lkp@intel.com>
References: <20230407145911.79642-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407145911.79642-3-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main horms-ipvs/master linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/net-aquantia-constify-pointers-to-hwmon_channel_info/20230407-230419
patch link:    https://lore.kernel.org/r/20230407145911.79642-3-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 3/8] net: phy: aquantia: constify pointers to hwmon_channel_info
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080009.qfRygYfS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0ac86391752dc29efb1c85830abd19180b2f0904
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/net-aquantia-constify-pointers-to-hwmon_channel_info/20230407-230419
        git checkout 0ac86391752dc29efb1c85830abd19180b2f0904
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080009.qfRygYfS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/aquantia_hwmon.c:221:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     221 |         .info = aqr_hwmon_info,
         |                 ^~~~~~~~~~~~~~


vim +/const +221 drivers/net/phy/aquantia_hwmon.c

fb470f70fea71a Heiner Kallweit 2019-02-25  218  
fb470f70fea71a Heiner Kallweit 2019-02-25  219  static const struct hwmon_chip_info aqr_hwmon_chip_info = {
fb470f70fea71a Heiner Kallweit 2019-02-25  220  	.ops = &aqr_hwmon_ops,
fb470f70fea71a Heiner Kallweit 2019-02-25 @221  	.info = aqr_hwmon_info,
fb470f70fea71a Heiner Kallweit 2019-02-25  222  };
fb470f70fea71a Heiner Kallweit 2019-02-25  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
