Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282C88482
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 18:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680890481; x=1712426481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=urwSxCX2ZwmlBGzogjwOTlb3kNDcwEr94clQuXQTKcY=;
  b=IrwmhdO/m6nNTjaTpYYc7ZXARSrgWIAQPYGIpZ/toTERCa66kfzcVrCJ
   tYAw1EQjawMgQSbSwy2927qV5/k7k2M3NmAnMgxSBGIJnUXDekUk0bS/R
   7bD94pgMv330JvDbQrkLYeJeleoLWxbzcryW7XgbnFT9FOUnvDrKYivq9
   MbP3NIERhtPejNFKjGGwTaJZ2jv9QhKgivjsbCn1gTZnCnVoKNEEBZEom
   YHiOEe1SIEQVczr3/Wah3XlzYn+PfjR/pzDJmC1uHJmSwiC7T8PZitig7
   DkvDPLHqupfvbhfHDwNm23to3Y89P39RsDpa8OomLWawQAAB/BHWaHx2M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="429326234"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="429326234"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:01:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="664972488"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="664972488"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2023 11:00:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqOP-000SlC-0z;
	Fri, 07 Apr 2023 18:00:57 +0000
Date: Sat, 8 Apr 2023 02:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/8] net: phy: bcm54140: constify pointers to
 hwmon_channel_info
Message-ID: <202304080140.ipzShrZB-lkp@intel.com>
References: <20230407145911.79642-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407145911.79642-4-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main horms-ipvs/master linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/net-aquantia-constify-pointers-to-hwmon_channel_info/20230407-230419
patch link:    https://lore.kernel.org/r/20230407145911.79642-4-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 4/8] net: phy: bcm54140: constify pointers to hwmon_channel_info
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080140.ipzShrZB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2f0810b511fe86325ce86827102c4cdfa7ad0189
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/net-aquantia-constify-pointers-to-hwmon_channel_info/20230407-230419
        git checkout 2f0810b511fe86325ce86827102c4cdfa7ad0189
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080140.ipzShrZB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/bcm54140.c:388:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     388 |         .info = bcm54140_hwmon_info,
         |                 ^~~~~~~~~~~~~~~~~~~


vim +/const +388 drivers/net/phy/bcm54140.c

6937602ed3f9eb Michael Walle 2020-04-20  385  
4406d36dfdf1fb Michael Walle 2020-04-20  386  static const struct hwmon_chip_info bcm54140_chip_info = {
4406d36dfdf1fb Michael Walle 2020-04-20  387  	.ops = &bcm54140_hwmon_ops,
4406d36dfdf1fb Michael Walle 2020-04-20 @388  	.info = bcm54140_hwmon_info,
4406d36dfdf1fb Michael Walle 2020-04-20  389  };
4406d36dfdf1fb Michael Walle 2020-04-20  390  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
