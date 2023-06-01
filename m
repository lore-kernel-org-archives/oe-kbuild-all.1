Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174CA539B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 07:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685604807; x=1717140807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1hHAFShfH6RM5D9bIYTnO7pAcWdhlDUAINDV1bTB028=;
  b=nZeAOIxQZf2y88aditSu0ShNg0YGoDq9S2uWBHLNzAr1eZIXnbyWeks5
   FPjMwmyeE5RCodiOKUBp/eAeMUzmOvoTp/SZwlsTMrRieswax0BwqEdA/
   4FeyiteoXBSWFcW3XufJ9fuOf87uSbda7PXhIUUpE5mCaend99fpa0nM8
   P4IxNF5HTUKhzTeSdXD1fnvBbvynxkQR0b0ff9ihstdaRzswK40U8MFOq
   T1/7MWfnJpTmFZqy6sAq3M3J5iu1+MQDDVbcU0DcXLznAhoyPQWr6hFLO
   Jbwd7E16fPPrG9qDXTdZK+GS4vamwiYrxb7MpjRG8/HxsivC4Ivv022zv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="340080706"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="340080706"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 00:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684741528"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="684741528"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Jun 2023 00:33:25 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4coG-00023b-2B;
	Thu, 01 Jun 2023 07:33:24 +0000
Date: Thu, 1 Jun 2023 15:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/amlogic/upstream/clkid-public-migration 1/8]
 drivers/clk/meson/meson-eeclk.c:71:70: warning: passing argument 3 of
 'devm_of_clk_add_hw_provider' discards 'const' qualifier from pointer target
 type
Message-ID: <202306011538.cJ1clRa6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/superna9999/linux topic/amlogic/upstream/clkid-public-migration
head:   2d9fa5ad146edb7e6e77b66ef66e213ff379e1a5
commit: 2b2a283b2ddf771ce7895a58579e2640dfca3bd0 [1/8] clk: meson: migrate meson-eeclk out of hw_onecell_data
config: arm64-randconfig-r033-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011538.cJ1clRa6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/superna9999/linux/commit/2b2a283b2ddf771ce7895a58579e2640dfca3bd0
        git remote add superna9999 https://github.com/superna9999/linux
        git fetch --no-tags superna9999 topic/amlogic/upstream/clkid-public-migration
        git checkout 2b2a283b2ddf771ce7895a58579e2640dfca3bd0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/meson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011538.cJ1clRa6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/meson/meson-eeclk.c: In function 'meson_eeclkc_probe':
>> drivers/clk/meson/meson-eeclk.c:71:70: warning: passing argument 3 of 'devm_of_clk_add_hw_provider' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      71 |         return devm_of_clk_add_hw_provider(dev, meson_eeclkc_hw_get, data);
         |                                                                      ^~~~
   In file included from drivers/clk/meson/meson-eeclk.c:7:
   include/linux/clk-provider.h:1542:34: note: expected 'void *' but argument is of type 'const struct meson_eeclkc_data *'
    1542 |                            void *data);
         |                            ~~~~~~^~~~


vim +71 drivers/clk/meson/meson-eeclk.c

    29	
    30	int meson_eeclkc_probe(struct platform_device *pdev)
    31	{
    32		const struct meson_eeclkc_data *data;
    33		struct device *dev = &pdev->dev;
    34		struct device_node *np;
    35		struct regmap *map;
    36		int ret, i;
    37	
    38		data = of_device_get_match_data(dev);
    39		if (!data)
    40			return -EINVAL;
    41	
    42		/* Get the hhi system controller node */
    43		np = of_get_parent(dev->of_node);
    44		map = syscon_node_to_regmap(np);
    45		of_node_put(np);
    46		if (IS_ERR(map)) {
    47			dev_err(dev,
    48				"failed to get HHI regmap\n");
    49			return PTR_ERR(map);
    50		}
    51	
    52		if (data->init_count)
    53			regmap_multi_reg_write(map, data->init_regs, data->init_count);
    54	
    55		/* Populate regmap for the regmap backed clocks */
    56		for (i = 0; i < data->regmap_clk_num; i++)
    57			data->regmap_clks[i]->map = map;
    58	
    59		for (i = 0; i < data->hw_clk_num; i++) {
    60			/* array might be sparse */
    61			if (!data->hw_clks[i])
    62				continue;
    63	
    64			ret = devm_clk_hw_register(dev, data->hw_clks[i]);
    65			if (ret) {
    66				dev_err(dev, "Clock registration failed\n");
    67				return ret;
    68			}
    69		}
    70	
  > 71		return devm_of_clk_add_hw_provider(dev, meson_eeclkc_hw_get, data);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
