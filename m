Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C926A40
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 01:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681607220; x=1713143220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4nRC9M3DTUA+TfGP/E7/osftEaD3NYcWW8mvdzYS24=;
  b=lG0V46y68fUBQri+U0n5hfsxlu7qbDU5uZ59AoQQ+JAM+gue1YYCv/uB
   18yDp0EuHHZc5VA4YIiM/Pa8dL62RRl4rzXOQqMWSi83/nLGdcGui711E
   QD2UG8i5sU/jhfKOOYCVW5uMWK5PKuRtdsQEfz1tOcdXGKzE2ggecs9Ql
   Yj84j+ilKQ25UzNOEWb8D0bo6w8wdQp/n3MgLTyjnjMNI3N4zKpOGLG2e
   haFsL5nD0K3IU2vXqf20GkeBHVZxcT1mWr5TIHuHOTY2sP9yUFnvQmKbr
   LNZWqKnRoV8ArTe+++tkCz9sAfHWV4ivmFIN4BA2tBeUuYCQzEzuAcQfa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="372567931"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="372567931"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 18:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="1020000743"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="1020000743"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Apr 2023 18:06:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnqr3-000bS5-2i;
	Sun, 16 Apr 2023 01:06:57 +0000
Date: Sun, 16 Apr 2023 09:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 42/55] drivers/clk/sprd/common.c:54:24:
 error: implicit declaration of function
 'devm_platform_get_and_ioremap_resource'; did you mean
 'devm_platform_ioremap_resource'?
Message-ID: <202304160824.N3uneI0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   f1644c8e3a228f45290da7c56e23b0f10baf3565
commit: b9c86282636aa2fc71680d65461885767f41b0bb [42/55] clk: sprd: set max_register according to mapping range
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304160824.N3uneI0H-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=b9c86282636aa2fc71680d65461885767f41b0bb
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout b9c86282636aa2fc71680d65461885767f41b0bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/sprd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160824.N3uneI0H-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/clk/sprd/common.c: In function 'sprd_clk_regmap_init':
>> drivers/clk/sprd/common.c:54:24: error: implicit declaration of function 'devm_platform_get_and_ioremap_resource'; did you mean 'devm_platform_ioremap_resource'? [-Werror=implicit-function-declaration]
      54 |                 base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        devm_platform_ioremap_resource
>> drivers/clk/sprd/common.c:54:22: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      54 |                 base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
         |                      ^
   cc1: some warnings being treated as errors


vim +54 drivers/clk/sprd/common.c

    37	
    38	int sprd_clk_regmap_init(struct platform_device *pdev,
    39				 const struct sprd_clk_desc *desc)
    40	{
    41		void __iomem *base;
    42		struct device_node *node = pdev->dev.of_node;
    43		struct regmap *regmap;
    44		struct resource *res;
    45		struct regmap_config reg_config = sprdclk_regmap_config;
    46	
    47		if (of_find_property(node, "sprd,syscon", NULL)) {
    48			regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
    49			if (IS_ERR(regmap)) {
    50				pr_err("%s: failed to get syscon regmap\n", __func__);
    51				return PTR_ERR(regmap);
    52			}
    53		} else {
  > 54			base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
    55			if (IS_ERR(base))
    56				return PTR_ERR(base);
    57	
    58			reg_config.max_register = resource_size(res) - reg_config.reg_stride;
    59	
    60			regmap = devm_regmap_init_mmio(&pdev->dev, base,
    61						       &reg_config);
    62			if (IS_ERR(regmap)) {
    63				pr_err("failed to init regmap\n");
    64				return PTR_ERR(regmap);
    65			}
    66		}
    67	
    68		sprd_clk_set_regmap(desc, regmap);
    69	
    70		return 0;
    71	}
    72	EXPORT_SYMBOL_GPL(sprd_clk_regmap_init);
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
