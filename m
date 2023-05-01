Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FAF882F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 20:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682974640; x=1714510640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWLnpg2UZ46UC1fzjyIv7vjM2ote3ON/Dx4schBPhA0=;
  b=Ja5ho2wDBdgyE3LUOEvNjJnVLOb3SzUZPGqx6kexzfySIdWEf82a3FfS
   DXuUX2O9GBEeQULkX+pGi0MqPLMN51icaRrAon52uTRXw2icb7BadnLUy
   to52QbKDd3HatpyHHqZ5rWxDtJn5/7TWTItkfn3enPzufiiYGQGce8Mq2
   wEovjoCz0B7QXyhWWI/b+LuKyO18shG4rxrDMrDZ6GpTloLJk/g/Q9kV/
   XTLfppVTyzXf/LrJuXZdew0/Apy4TtlrmQketkVc5IXcoLt3I/jdpXrJA
   vHicW6Pl8qlkl1mqkkuXgj775QXXMjF6ifKqFa4YW2x4WmwelosXffOYw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="337358104"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="337358104"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 13:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="760814787"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="760814787"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 May 2023 13:57:15 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptaaA-0000e3-0Y;
	Mon, 01 May 2023 20:57:14 +0000
Date: Tue, 2 May 2023 04:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 57/59]
 drivers/pinctrl/pinctrl-at91.c:1305:67: error: invalid type argument of '->'
 (have 'int')
Message-ID: <202305020413.bjVsr1x7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   7637af07fc9dd17bd0f6c2df329ea6da853c0e38
commit: 86671662a0e9c3e83897935ceec70d9b7d69d16a [57/59] Use of_device_get_match_data
config: arm-randconfig-r016-20230501 (https://download.01.org/0day-ci/archive/20230502/202305020413.bjVsr1x7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=86671662a0e9c3e83897935ceec70d9b7d69d16a
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 86671662a0e9c3e83897935ceec70d9b7d69d16a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pinctrl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020413.bjVsr1x7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-at91.c: In function 'at91_pinctrl_probe_dt':
   drivers/pinctrl/pinctrl-at91.c:1305:17: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
    1305 |                 of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
         |                 ^~~~~~~~~~~~~~~
         |                 of_match_node
>> drivers/pinctrl/pinctrl-at91.c:1305:67: error: invalid type argument of '->' (have 'int')
    1305 |                 of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
         |                                                                   ^~
   cc1: some warnings being treated as errors


vim +1305 drivers/pinctrl/pinctrl-at91.c

6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1290  
150632b09aadf1 Greg Kroah-Hartman               2012-12-21  1291  static int at91_pinctrl_probe_dt(struct platform_device *pdev,
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1292  				 struct at91_pinctrl *info)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1293  {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1294  	int ret = 0;
91da7032d86a2a Rob Herring                      2018-07-12  1295  	int i, j, ngpio_chips_enabled = 0;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1296  	uint32_t *tmp;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1297  	struct device_node *np = pdev->dev.of_node;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1298  	struct device_node *child;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1299  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1300  	if (!np)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1301  		return -ENODEV;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1302  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1303  	info->dev = &pdev->dev;
f56b273cd845a1 Rikard Falkeborn                 2021-05-12  1304  	info->ops = (const struct at91_pinctrl_mux_ops *)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12 @1305  		of_match_device(at91_pinctrl_of_match, &pdev->dev)->data;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1306  	at91_pinctrl_child_count(info, np);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1307  
91da7032d86a2a Rob Herring                      2018-07-12  1308  	/*
91da7032d86a2a Rob Herring                      2018-07-12  1309  	 * We need all the GPIO drivers to probe FIRST, or we will not be able
91da7032d86a2a Rob Herring                      2018-07-12  1310  	 * to obtain references to the struct gpio_chip * for them, and we
91da7032d86a2a Rob Herring                      2018-07-12  1311  	 * need this to proceed.
91da7032d86a2a Rob Herring                      2018-07-12  1312  	 */
91da7032d86a2a Rob Herring                      2018-07-12  1313  	for (i = 0; i < MAX_GPIO_BANKS; i++)
91da7032d86a2a Rob Herring                      2018-07-12  1314  		if (gpio_chips[i])
91da7032d86a2a Rob Herring                      2018-07-12  1315  			ngpio_chips_enabled++;
91da7032d86a2a Rob Herring                      2018-07-12  1316  
91da7032d86a2a Rob Herring                      2018-07-12  1317  	if (ngpio_chips_enabled < info->nactive_banks)
91da7032d86a2a Rob Herring                      2018-07-12  1318  		return -EPROBE_DEFER;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1319  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1320  	ret = at91_pinctrl_mux_mask(info, np);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1321  	if (ret)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1322  		return ret;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1323  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1324  	dev_dbg(&pdev->dev, "nmux = %d\n", info->nmux);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1325  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1326  	dev_dbg(&pdev->dev, "mux-mask\n");
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1327  	tmp = info->mux_mask;
a0b957f306fa4d Jean-Christophe PLAGNIOL-VILLARD 2015-01-16  1328  	for (i = 0; i < gpio_banks; i++) {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1329  		for (j = 0; j < info->nmux; j++, tmp++) {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1330  			dev_dbg(&pdev->dev, "%d:%d\t0x%x\n", i, j, tmp[0]);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1331  		}
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1332  	}
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1333  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1334  	dev_dbg(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1335  	dev_dbg(&pdev->dev, "ngroups = %d\n", info->ngroups);
a86854d0c599b3 Kees Cook                        2018-06-12  1336  	info->functions = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook                        2018-06-12  1337  					info->nfunctions,
a86854d0c599b3 Kees Cook                        2018-06-12  1338  					sizeof(struct at91_pmx_func),
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1339  					GFP_KERNEL);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1340  	if (!info->functions)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1341  		return -ENOMEM;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1342  
a86854d0c599b3 Kees Cook                        2018-06-12  1343  	info->groups = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook                        2018-06-12  1344  					info->ngroups,
a86854d0c599b3 Kees Cook                        2018-06-12  1345  					sizeof(struct at91_pin_group),
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1346  					GFP_KERNEL);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1347  	if (!info->groups)
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1348  		return -ENOMEM;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1349  
a0b957f306fa4d Jean-Christophe PLAGNIOL-VILLARD 2015-01-16  1350  	dev_dbg(&pdev->dev, "nbanks = %d\n", gpio_banks);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1351  	dev_dbg(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1352  	dev_dbg(&pdev->dev, "ngroups = %d\n", info->ngroups);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1353  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1354  	i = 0;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1355  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1356  	for_each_child_of_node(np, child) {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1357  		if (of_device_is_compatible(child, gpio_compat))
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1358  			continue;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1359  		ret = at91_pinctrl_parse_functions(child, info, i++);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1360  		if (ret) {
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1361  			dev_err(&pdev->dev, "failed to parse function\n");
d94b986aa734ef Julia Lawall                     2015-10-24  1362  			of_node_put(child);
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1363  			return ret;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1364  		}
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1365  	}
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1366  
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1367  	return 0;
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1368  }
6732ae5cb47c4f Jean-Christophe PLAGNIOL-VILLARD 2012-07-12  1369  

:::::: The code at line 1305 was first introduced by commit
:::::: 6732ae5cb47c4f9a72727585956f2a5e069d1637 ARM: at91: add pinctrl support

:::::: TO: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
:::::: CC: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
