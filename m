Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF7A49
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 00:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686357301; x=1717893301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vvb6gUSIUYBwprze7kGefBzMsxuF3//Cd5U0dV+0DlI=;
  b=eG4aP2GTEIAowuhF/FNtUdULbf8r15zrZvTSAaMuVnOuSYMAudSiZwSE
   kPTrNV29nb9EMmKfuaEnkVomzQYmVxXlnpOkLiLgfeLWMdnlQiYmfGK7a
   hm7FEh06/pD9cCCt69WmHkzAsuddVotJazS1TGTiq316wN/DLVnQ2N5FC
   4nKr9Y49SE4iR1xRWFEjwvGkXcsahfwKJCP7JnVvDHGbGhY9gQfqd3J/H
   5kkp0hch+2t6keNpMDN8PgIws+tpz8nGvXWBuDRES41clW6liX9BvYBQ0
   6whsVFU+TNfs6vpiORo4D60uJS/rOWRgItrJhjvNBVzt8rlRn2eL/3oeZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="423591700"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="423591700"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="704728700"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="704728700"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Jun 2023 17:34:59 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7mZG-0009Xy-32;
	Sat, 10 Jun 2023 00:34:58 +0000
Date: Sat, 10 Jun 2023 08:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 20/20]
 drivers/gpu/drm/panel/panel-novatek-nt36523.c:752:34: error: array type has
 incomplete element type 'struct of_device_id'
Message-ID: <202306100855.MvyZ80Sp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: 3118a5812ec5b3b83ca38f2d1c4162ccda268c0d [20/20] of: header cleanups
config: openrisc-randconfig-r033-20230609 (https://download.01.org/0day-ci/archive/20230610/202306100855.MvyZ80Sp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/gpu/drm/panel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100855.MvyZ80Sp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-novatek-nt36523.c: In function 'nt36523_probe':
>> drivers/gpu/drm/panel/panel-novatek-nt36523.c:703:23: error: implicit declaration of function 'of_device_get_match_data' [-Werror=implicit-function-declaration]
     703 |         pinfo->desc = of_device_get_match_data(dev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-novatek-nt36523.c:703:21: warning: assignment to 'const struct panel_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     703 |         pinfo->desc = of_device_get_match_data(dev);
         |                     ^
>> drivers/gpu/drm/panel/panel-novatek-nt36523.c:718:17: error: implicit declaration of function 'of_node_put' [-Werror=implicit-function-declaration]
     718 |                 of_node_put(dsi1);
         |                 ^~~~~~~~~~~
   drivers/gpu/drm/panel/panel-novatek-nt36523.c: At top level:
>> drivers/gpu/drm/panel/panel-novatek-nt36523.c:752:34: error: array type has incomplete element type 'struct of_device_id'
     752 | static const struct of_device_id nt36523_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-novatek-nt36523.c:752:34: warning: 'nt36523_of_match' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +752 drivers/gpu/drm/panel/panel-novatek-nt36523.c

0993234a00451e Jianhua Lu 2023-03-13  681  
0993234a00451e Jianhua Lu 2023-03-13  682  static int nt36523_probe(struct mipi_dsi_device *dsi)
0993234a00451e Jianhua Lu 2023-03-13  683  {
0993234a00451e Jianhua Lu 2023-03-13  684  	struct device *dev = &dsi->dev;
0993234a00451e Jianhua Lu 2023-03-13  685  	struct device_node *dsi1;
0993234a00451e Jianhua Lu 2023-03-13  686  	struct mipi_dsi_host *dsi1_host;
0993234a00451e Jianhua Lu 2023-03-13  687  	struct panel_info *pinfo;
0993234a00451e Jianhua Lu 2023-03-13  688  	const struct mipi_dsi_device_info *info;
0993234a00451e Jianhua Lu 2023-03-13  689  	int i, ret;
0993234a00451e Jianhua Lu 2023-03-13  690  
0993234a00451e Jianhua Lu 2023-03-13  691  	pinfo = devm_kzalloc(dev, sizeof(*pinfo), GFP_KERNEL);
0993234a00451e Jianhua Lu 2023-03-13  692  	if (!pinfo)
0993234a00451e Jianhua Lu 2023-03-13  693  		return -ENOMEM;
0993234a00451e Jianhua Lu 2023-03-13  694  
0993234a00451e Jianhua Lu 2023-03-13  695  	pinfo->vddio = devm_regulator_get(dev, "vddio");
0993234a00451e Jianhua Lu 2023-03-13  696  	if (IS_ERR(pinfo->vddio))
0993234a00451e Jianhua Lu 2023-03-13  697  		return dev_err_probe(dev, PTR_ERR(pinfo->vddio), "failed to get vddio regulator\n");
0993234a00451e Jianhua Lu 2023-03-13  698  
0993234a00451e Jianhua Lu 2023-03-13  699  	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
0993234a00451e Jianhua Lu 2023-03-13  700  	if (IS_ERR(pinfo->reset_gpio))
0993234a00451e Jianhua Lu 2023-03-13  701  		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio), "failed to get reset gpio\n");
0993234a00451e Jianhua Lu 2023-03-13  702  
0993234a00451e Jianhua Lu 2023-03-13 @703  	pinfo->desc = of_device_get_match_data(dev);
0993234a00451e Jianhua Lu 2023-03-13  704  	if (!pinfo->desc)
0993234a00451e Jianhua Lu 2023-03-13  705  		return -ENODEV;
0993234a00451e Jianhua Lu 2023-03-13  706  
0993234a00451e Jianhua Lu 2023-03-13  707  	/* If the panel is dual dsi, register DSI1 */
0993234a00451e Jianhua Lu 2023-03-13  708  	if (pinfo->desc->is_dual_dsi) {
0993234a00451e Jianhua Lu 2023-03-13  709  		info = &pinfo->desc->dsi_info;
0993234a00451e Jianhua Lu 2023-03-13  710  
0993234a00451e Jianhua Lu 2023-03-13  711  		dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
0993234a00451e Jianhua Lu 2023-03-13  712  		if (!dsi1) {
0993234a00451e Jianhua Lu 2023-03-13  713  			dev_err(dev, "cannot get secondary DSI node.\n");
0993234a00451e Jianhua Lu 2023-03-13  714  			return -ENODEV;
0993234a00451e Jianhua Lu 2023-03-13  715  		}
0993234a00451e Jianhua Lu 2023-03-13  716  
0993234a00451e Jianhua Lu 2023-03-13  717  		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
0993234a00451e Jianhua Lu 2023-03-13 @718  		of_node_put(dsi1);
0993234a00451e Jianhua Lu 2023-03-13  719  		if (!dsi1_host)
0993234a00451e Jianhua Lu 2023-03-13  720  			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
0993234a00451e Jianhua Lu 2023-03-13  721  
0993234a00451e Jianhua Lu 2023-03-13  722  		pinfo->dsi[1] = mipi_dsi_device_register_full(dsi1_host, info);
0993234a00451e Jianhua Lu 2023-03-13  723  		if (!pinfo->dsi[1]) {
0993234a00451e Jianhua Lu 2023-03-13  724  			dev_err(dev, "cannot get secondary DSI device\n");
0993234a00451e Jianhua Lu 2023-03-13  725  			return -ENODEV;
0993234a00451e Jianhua Lu 2023-03-13  726  		}
0993234a00451e Jianhua Lu 2023-03-13  727  	}
0993234a00451e Jianhua Lu 2023-03-13  728  
0993234a00451e Jianhua Lu 2023-03-13  729  	pinfo->dsi[0] = dsi;
0993234a00451e Jianhua Lu 2023-03-13  730  	mipi_dsi_set_drvdata(dsi, pinfo);
0993234a00451e Jianhua Lu 2023-03-13  731  	drm_panel_init(&pinfo->panel, dev, &nt36523_panel_funcs, DRM_MODE_CONNECTOR_DSI);
0993234a00451e Jianhua Lu 2023-03-13  732  
0993234a00451e Jianhua Lu 2023-03-13  733  	ret = drm_panel_of_backlight(&pinfo->panel);
0993234a00451e Jianhua Lu 2023-03-13  734  	if (ret)
0993234a00451e Jianhua Lu 2023-03-13  735  		return dev_err_probe(dev, ret, "failed to get backlight\n");
0993234a00451e Jianhua Lu 2023-03-13  736  
0993234a00451e Jianhua Lu 2023-03-13  737  	drm_panel_add(&pinfo->panel);
0993234a00451e Jianhua Lu 2023-03-13  738  
0993234a00451e Jianhua Lu 2023-03-13  739  	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
0993234a00451e Jianhua Lu 2023-03-13  740  		pinfo->dsi[i]->lanes = pinfo->desc->lanes;
0993234a00451e Jianhua Lu 2023-03-13  741  		pinfo->dsi[i]->format = pinfo->desc->format;
0993234a00451e Jianhua Lu 2023-03-13  742  		pinfo->dsi[i]->mode_flags = pinfo->desc->mode_flags;
0993234a00451e Jianhua Lu 2023-03-13  743  
0993234a00451e Jianhua Lu 2023-03-13  744  		ret = mipi_dsi_attach(pinfo->dsi[i]);
0993234a00451e Jianhua Lu 2023-03-13  745  		if (ret < 0)
0993234a00451e Jianhua Lu 2023-03-13  746  			return dev_err_probe(dev, ret, "cannot attach to DSI%d host.\n", i);
0993234a00451e Jianhua Lu 2023-03-13  747  	}
0993234a00451e Jianhua Lu 2023-03-13  748  
0993234a00451e Jianhua Lu 2023-03-13  749  	return 0;
0993234a00451e Jianhua Lu 2023-03-13  750  }
0993234a00451e Jianhua Lu 2023-03-13  751  
0993234a00451e Jianhua Lu 2023-03-13 @752  static const struct of_device_id nt36523_of_match[] = {
0993234a00451e Jianhua Lu 2023-03-13  753  	{
0993234a00451e Jianhua Lu 2023-03-13  754  		.compatible = "xiaomi,elish-boe-nt36523",
0993234a00451e Jianhua Lu 2023-03-13  755  		.data = &elish_boe_desc,
0993234a00451e Jianhua Lu 2023-03-13  756  	},
0993234a00451e Jianhua Lu 2023-03-13  757  	{
0993234a00451e Jianhua Lu 2023-03-13  758  		.compatible = "xiaomi,elish-csot-nt36523",
0993234a00451e Jianhua Lu 2023-03-13  759  		.data = &elish_csot_desc,
0993234a00451e Jianhua Lu 2023-03-13  760  	},
0993234a00451e Jianhua Lu 2023-03-13  761  	{},
0993234a00451e Jianhua Lu 2023-03-13  762  };
0993234a00451e Jianhua Lu 2023-03-13  763  MODULE_DEVICE_TABLE(of, nt36523_of_match);
0993234a00451e Jianhua Lu 2023-03-13  764  

:::::: The code at line 752 was first introduced by commit
:::::: 0993234a00451e0a5c3e47d8b0f2e01dac6cedbf drm/panel: Add driver for Novatek NT36523

:::::: TO: Jianhua Lu <lujianhua000@gmail.com>
:::::: CC: Neil Armstrong <neil.armstrong@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
