Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219BAFDB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 18:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681840893; x=1713376893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bzW37l++EUvW+sI5ZfRm71B0/przG2MTD2t7HUdIzxw=;
  b=TqEAc84UhHxC3ZoTi5HLdAx6xwjfZLvpydfJJ2J8/BKNsw0leU/0j4R6
   pk70yHfodBmf1xvtbDeO8vKfv+6//E58eQDu74lSIxdLPlFfpSJqx76rQ
   e84waHr2zwkNeBa2zTVpDtdaHwa6y7K/wfTCuo1ExZZ6tLCRHg1pD6Q0N
   3pochPk+RHoSNt9pGyQH9Vvx57B0bze4FoyK813OwMnBvmu9kXe7nfeMr
   C38LkZU3ODrOEA/pA38ZY/4OifvmTYRLHzZsCULiX9P787aHT75C/yFYc
   dL9YfQSo58BCTyCQZAgK2OxycOV+re1MyFQSotBqJ6ibbpaupv8LdCcos
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334054020"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="334054020"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 11:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="937339922"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="937339922"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Apr 2023 11:01:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1popdU-000dqY-09;
	Tue, 18 Apr 2023 18:01:00 +0000
Date: Wed, 19 Apr 2023 02:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kang Chen <void0red@hust.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [thermal:thermal/bleeding-edge 4/5]
 drivers/thermal/mediatek/auxadc_thermal.c:1249:37: warning: format '%d'
 expects argument of type 'int', but argument 3 has type 'struct clk *'
Message-ID: <202304190115.9R7Nc4C2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   fee74ed432f73548eec010f3fb4169e7fa7e19f5
commit: 8e85ba42efc850c3235c22b8a55ab16e1a99d762 [4/5] thermal/drivers/mediatek: Change clk_prepare_enable to devm_clk_get_enabled in mtk_thermal_probe
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304190115.9R7Nc4C2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/commit/?id=8e85ba42efc850c3235c22b8a55ab16e1a99d762
        git remote add thermal git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
        git fetch --no-tags thermal thermal/bleeding-edge
        git checkout 8e85ba42efc850c3235c22b8a55ab16e1a99d762
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/thermal/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190115.9R7Nc4C2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5,
                    from drivers/thermal/mediatek/auxadc_thermal.c:18:
   drivers/thermal/mediatek/auxadc_thermal.c: In function 'mtk_thermal_probe':
>> drivers/thermal/mediatek/auxadc_thermal.c:1249:37: warning: format '%d' expects argument of type 'int', but argument 3 has type 'struct clk *' [-Wformat=]
    1249 |                 dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", mt->clk_auxadc);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/thermal/mediatek/auxadc_thermal.c:1249:17: note: in expansion of macro 'dev_err'
    1249 |                 dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", mt->clk_auxadc);
         |                 ^~~~~~~
   drivers/thermal/mediatek/auxadc_thermal.c:1249:64: note: format string is defined here
    1249 |                 dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", mt->clk_auxadc);
         |                                                               ~^
         |                                                                |
         |                                                                int
   drivers/thermal/mediatek/auxadc_thermal.c:1255:37: warning: format '%d' expects argument of type 'int', but argument 3 has type 'struct clk *' [-Wformat=]
    1255 |                 dev_err(&pdev->dev, "Can't enable peri clk: %d\n", mt->clk_peri_therm);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/thermal/mediatek/auxadc_thermal.c:1255:17: note: in expansion of macro 'dev_err'
    1255 |                 dev_err(&pdev->dev, "Can't enable peri clk: %d\n", mt->clk_peri_therm);
         |                 ^~~~~~~
   drivers/thermal/mediatek/auxadc_thermal.c:1255:62: note: format string is defined here
    1255 |                 dev_err(&pdev->dev, "Can't enable peri clk: %d\n", mt->clk_peri_therm);
         |                                                             ~^
         |                                                              |
         |                                                              int


vim +1249 drivers/thermal/mediatek/auxadc_thermal.c

  1173	
  1174	static int mtk_thermal_probe(struct platform_device *pdev)
  1175	{
  1176		int ret, i, ctrl_id;
  1177		struct device_node *auxadc, *apmixedsys, *np = pdev->dev.of_node;
  1178		struct mtk_thermal *mt;
  1179		u64 auxadc_phys_base, apmixed_phys_base;
  1180		struct thermal_zone_device *tzdev;
  1181		void __iomem *apmixed_base, *auxadc_base;
  1182	
  1183		mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
  1184		if (!mt)
  1185			return -ENOMEM;
  1186	
  1187		mt->conf = of_device_get_match_data(&pdev->dev);
  1188	
  1189		mt->thermal_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
  1190		if (IS_ERR(mt->thermal_base))
  1191			return PTR_ERR(mt->thermal_base);
  1192	
  1193		ret = mtk_thermal_get_calibration_data(&pdev->dev, mt);
  1194		if (ret)
  1195			return ret;
  1196	
  1197		mutex_init(&mt->lock);
  1198	
  1199		mt->dev = &pdev->dev;
  1200	
  1201		auxadc = of_parse_phandle(np, "mediatek,auxadc", 0);
  1202		if (!auxadc) {
  1203			dev_err(&pdev->dev, "missing auxadc node\n");
  1204			return -ENODEV;
  1205		}
  1206	
  1207		auxadc_base = devm_of_iomap(&pdev->dev, auxadc, 0, NULL);
  1208		if (IS_ERR(auxadc_base)) {
  1209			of_node_put(auxadc);
  1210			return PTR_ERR(auxadc_base);
  1211		}
  1212	
  1213		auxadc_phys_base = of_get_phys_base(auxadc);
  1214	
  1215		of_node_put(auxadc);
  1216	
  1217		if (auxadc_phys_base == OF_BAD_ADDR) {
  1218			dev_err(&pdev->dev, "Can't get auxadc phys address\n");
  1219			return -EINVAL;
  1220		}
  1221	
  1222		apmixedsys = of_parse_phandle(np, "mediatek,apmixedsys", 0);
  1223		if (!apmixedsys) {
  1224			dev_err(&pdev->dev, "missing apmixedsys node\n");
  1225			return -ENODEV;
  1226		}
  1227	
  1228		apmixed_base = devm_of_iomap(&pdev->dev, apmixedsys, 0, NULL);
  1229		if (IS_ERR(apmixed_base)) {
  1230			of_node_put(apmixedsys);
  1231			return PTR_ERR(apmixed_base);
  1232		}
  1233	
  1234		apmixed_phys_base = of_get_phys_base(apmixedsys);
  1235	
  1236		of_node_put(apmixedsys);
  1237	
  1238		if (apmixed_phys_base == OF_BAD_ADDR) {
  1239			dev_err(&pdev->dev, "Can't get auxadc phys address\n");
  1240			return -EINVAL;
  1241		}
  1242	
  1243		ret = device_reset_optional(&pdev->dev);
  1244		if (ret)
  1245			return ret;
  1246	
  1247		mt->clk_auxadc = devm_clk_get_enabled(&pdev->dev, "auxadc");
  1248		if (IS_ERR(mt->clk_auxadc)) {
> 1249			dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", mt->clk_auxadc);
  1250			return PTR_ERR(mt->clk_auxadc);
  1251		}
  1252	
  1253		mt->clk_peri_therm = devm_clk_get_enabled(&pdev->dev, "therm");
  1254		if (IS_ERR(mt->clk_peri_therm)) {
  1255			dev_err(&pdev->dev, "Can't enable peri clk: %d\n", mt->clk_peri_therm);
  1256			return PTR_ERR(mt->clk_peri_therm);
  1257		}
  1258	
  1259		mtk_thermal_turn_on_buffer(mt, apmixed_base);
  1260	
  1261		if (mt->conf->version != MTK_THERMAL_V2)
  1262			mtk_thermal_release_periodic_ts(mt, auxadc_base);
  1263	
  1264		if (mt->conf->version == MTK_THERMAL_V1)
  1265			mt->raw_to_mcelsius = raw_to_mcelsius_v1;
  1266		else if (mt->conf->version == MTK_THERMAL_V2)
  1267			mt->raw_to_mcelsius = raw_to_mcelsius_v2;
  1268		else
  1269			mt->raw_to_mcelsius = raw_to_mcelsius_v3;
  1270	
  1271		for (ctrl_id = 0; ctrl_id < mt->conf->num_controller ; ctrl_id++)
  1272			for (i = 0; i < mt->conf->num_banks; i++)
  1273				mtk_thermal_init_bank(mt, i, apmixed_phys_base,
  1274						      auxadc_phys_base, ctrl_id);
  1275	
  1276		platform_set_drvdata(pdev, mt);
  1277	
  1278		/* Delay for thermal banks to be ready */
  1279		msleep(30);
  1280	
  1281		tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
  1282						      &mtk_thermal_ops);
  1283		if (IS_ERR(tzdev))
  1284			return PTR_ERR(tzdev);
  1285	
  1286		ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
  1287		if (ret)
  1288			dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
  1289	
  1290		return 0;
  1291	}
  1292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
