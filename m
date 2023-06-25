Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2E7C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687679317; x=1719215317;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OIBQhpzUUlmsmHoWgBRiLWYa/X75I1oAyCX0J5hHYM8=;
  b=JCZB0TDbgt4iCIM+qZQW5bMYDHkWujZnq0n60rEUQ88hNxf2e7nfsfRQ
   LcTMzQxi6bfGzaNpTwL+SP7yku1NXXiexNVDwmPPObOV+ByOvNtHBLPP8
   yZX1adygzETfQ9VRYQtNhT9d4Fc3lnsxBcjub0ggGv2aWTKZHdGLZzyFC
   Q+xE4x+zDql8Z3JuPaLUaRe6zLCz9rtakQVXR7lyku+WKN2PbKEBGcawH
   hp3+ROCYaM25ToDY9bmx4qy1mwoxcxBuDzytt1oPtBp5WC8pfRsO+VwnN
   06OXxpOMk3RBRpidnZT5Gf5OyDaYEmpQGYD3+2ZzQFXyUph73ckqxACWC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="359906230"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="359906230"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 00:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="860334917"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="860334917"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2023 00:48:34 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDKU6-0009rx-09;
	Sun, 25 Jun 2023 07:48:34 +0000
Date: Sun, 25 Jun 2023 15:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 26336/26342]
 drivers/mmc/host/meson-gx-mmc.c:1272:17: error: label 'free_host' used but
 not defined
Message-ID: <202306251510.52Z8Mjgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   5f0e89d38f13fd84e835d6c7ca04617367d2f1e6
commit: bc1d3085f5e0820ece8dcd20b697bf9e3c151e8a [26336/26342] mmc: meson-gx: use devm_mmc_alloc_host
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230625/202306251510.52Z8Mjgj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251510.52Z8Mjgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251510.52Z8Mjgj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/meson-gx-mmc.c: In function 'meson_mmc_clk_init':
   drivers/mmc/host/meson-gx-mmc.c:514:32: error: implicit declaration of function 'dev_err_probe'; did you mean 'device_reprobe'? [-Werror=implicit-function-declaration]
     514 |                         return dev_err_probe(host->dev, PTR_ERR(clk),
         |                                ^~~~~~~~~~~~~
         |                                device_reprobe
   drivers/mmc/host/meson-gx-mmc.c: In function 'meson_mmc_probe':
>> drivers/mmc/host/meson-gx-mmc.c:1272:17: error: label 'free_host' used but not defined
    1272 |                 goto free_host;
         |                 ^~~~
   cc1: some warnings being treated as errors


vim +/free_host +1272 drivers/mmc/host/meson-gx-mmc.c

51c5d8447bd71b Kevin Hilman        2016-10-19  1220  
51c5d8447bd71b Kevin Hilman        2016-10-19  1221  static int meson_mmc_probe(struct platform_device *pdev)
51c5d8447bd71b Kevin Hilman        2016-10-19  1222  {
51c5d8447bd71b Kevin Hilman        2016-10-19  1223  	struct resource *res;
51c5d8447bd71b Kevin Hilman        2016-10-19  1224  	struct meson_host *host;
51c5d8447bd71b Kevin Hilman        2016-10-19  1225  	struct mmc_host *mmc;
75a08b9a0fcb5e Remi Pommarel       2019-01-11  1226  	int ret;
51c5d8447bd71b Kevin Hilman        2016-10-19  1227  
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1228  	mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(struct meson_host));
51c5d8447bd71b Kevin Hilman        2016-10-19  1229  	if (!mmc)
51c5d8447bd71b Kevin Hilman        2016-10-19  1230  		return -ENOMEM;
51c5d8447bd71b Kevin Hilman        2016-10-19  1231  	host = mmc_priv(mmc);
51c5d8447bd71b Kevin Hilman        2016-10-19  1232  	host->mmc = mmc;
51c5d8447bd71b Kevin Hilman        2016-10-19  1233  	host->dev = &pdev->dev;
51c5d8447bd71b Kevin Hilman        2016-10-19  1234  	dev_set_drvdata(&pdev->dev, host);
51c5d8447bd71b Kevin Hilman        2016-10-19  1235  
51c5d8447bd71b Kevin Hilman        2016-10-19  1236  	/* Get regulators and the supported OCR mask */
51c5d8447bd71b Kevin Hilman        2016-10-19  1237  	host->vqmmc_enabled = false;
51c5d8447bd71b Kevin Hilman        2016-10-19  1238  	ret = mmc_regulator_get_supply(mmc);
fa54f3e359d6d0 Wolfram Sang        2017-10-14  1239  	if (ret)
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1240  		return ret;
51c5d8447bd71b Kevin Hilman        2016-10-19  1241  
51c5d8447bd71b Kevin Hilman        2016-10-19  1242  	ret = mmc_of_parse(mmc);
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1243  	if (ret)
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1244  		return dev_err_probe(&pdev->dev, ret, "error parsing DT\n");
51c5d8447bd71b Kevin Hilman        2016-10-19  1245  
df06981514d43f Nan Li              2018-04-03  1246  	host->data = (struct meson_mmc_data *)
df06981514d43f Nan Li              2018-04-03  1247  		of_device_get_match_data(&pdev->dev);
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1248  	if (!host->data)
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1249  		return -EINVAL;
df06981514d43f Nan Li              2018-04-03  1250  
19c6beaa064c4b Jerome Brunet       2018-05-15  1251  	ret = device_reset_optional(&pdev->dev);
dfbfdf0be268f9 Krzysztof Kozlowski 2020-09-02  1252  	if (ret)
dfbfdf0be268f9 Krzysztof Kozlowski 2020-09-02  1253  		return dev_err_probe(&pdev->dev, ret, "device reset failed\n");
19c6beaa064c4b Jerome Brunet       2018-05-15  1254  
51c5d8447bd71b Kevin Hilman        2016-10-19  1255  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
51c5d8447bd71b Kevin Hilman        2016-10-19  1256  	host->regs = devm_ioremap_resource(&pdev->dev, res);
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1257  	if (IS_ERR(host->regs))
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1258  		return PTR_ERR(host->regs);
51c5d8447bd71b Kevin Hilman        2016-10-19  1259  
75a08b9a0fcb5e Remi Pommarel       2019-01-11  1260  	host->irq = platform_get_irq(pdev, 0);
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1261  	if (host->irq <= 0)
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1262  		return -EINVAL;
51c5d8447bd71b Kevin Hilman        2016-10-19  1263  
1e03331d6b4340 Jerome Brunet       2017-08-28  1264  	host->pinctrl = devm_pinctrl_get(&pdev->dev);
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1265  	if (IS_ERR(host->pinctrl))
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1266  		return PTR_ERR(host->pinctrl);
1e03331d6b4340 Jerome Brunet       2017-08-28  1267  
1e03331d6b4340 Jerome Brunet       2017-08-28  1268  	host->pins_default = pinctrl_lookup_state(host->pinctrl,
1e03331d6b4340 Jerome Brunet       2017-08-28  1269  						  PINCTRL_STATE_DEFAULT);
1e03331d6b4340 Jerome Brunet       2017-08-28  1270  	if (IS_ERR(host->pins_default)) {
1e03331d6b4340 Jerome Brunet       2017-08-28  1271  		ret = PTR_ERR(host->pins_default);
1e03331d6b4340 Jerome Brunet       2017-08-28 @1272  		goto free_host;
1e03331d6b4340 Jerome Brunet       2017-08-28  1273  	}
1e03331d6b4340 Jerome Brunet       2017-08-28  1274  
1e03331d6b4340 Jerome Brunet       2017-08-28  1275  	host->pins_clk_gate = pinctrl_lookup_state(host->pinctrl,
1e03331d6b4340 Jerome Brunet       2017-08-28  1276  						   "clk-gate");
1e03331d6b4340 Jerome Brunet       2017-08-28  1277  	if (IS_ERR(host->pins_clk_gate)) {
1e03331d6b4340 Jerome Brunet       2017-08-28  1278  		dev_warn(&pdev->dev,
1e03331d6b4340 Jerome Brunet       2017-08-28  1279  			 "can't get clk-gate pinctrl, using clk_stop bit\n");
1e03331d6b4340 Jerome Brunet       2017-08-28  1280  		host->pins_clk_gate = NULL;
1e03331d6b4340 Jerome Brunet       2017-08-28  1281  	}
1e03331d6b4340 Jerome Brunet       2017-08-28  1282  
51c5d8447bd71b Kevin Hilman        2016-10-19  1283  	host->core_clk = devm_clk_get(&pdev->dev, "core");
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1284  	if (IS_ERR(host->core_clk))
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1285  		return PTR_ERR(host->core_clk);
51c5d8447bd71b Kevin Hilman        2016-10-19  1286  
51c5d8447bd71b Kevin Hilman        2016-10-19  1287  	ret = clk_prepare_enable(host->core_clk);
51c5d8447bd71b Kevin Hilman        2016-10-19  1288  	if (ret)
bc1d3085f5e082 Heiner Kallweit     2023-02-04  1289  		return ret;
51c5d8447bd71b Kevin Hilman        2016-10-19  1290  
51c5d8447bd71b Kevin Hilman        2016-10-19  1291  	ret = meson_mmc_clk_init(host);
51c5d8447bd71b Kevin Hilman        2016-10-19  1292  	if (ret)
ce473d5b49d6ef Michał Zegan        2017-03-14  1293  		goto err_core_clk;
51c5d8447bd71b Kevin Hilman        2016-10-19  1294  
3c39e2ca88016f Jerome Brunet       2017-08-28  1295  	/* set config to sane default */
3c39e2ca88016f Jerome Brunet       2017-08-28  1296  	meson_mmc_cfg_init(host);
3c39e2ca88016f Jerome Brunet       2017-08-28  1297  
51c5d8447bd71b Kevin Hilman        2016-10-19  1298  	/* Stop execution */
51c5d8447bd71b Kevin Hilman        2016-10-19  1299  	writel(0, host->regs + SD_EMMC_START);
51c5d8447bd71b Kevin Hilman        2016-10-19  1300  
74858655cbff05 Jerome Brunet       2017-08-28  1301  	/* clear, ack and enable interrupts */
51c5d8447bd71b Kevin Hilman        2016-10-19  1302  	writel(0, host->regs + SD_EMMC_IRQ_EN);
74858655cbff05 Jerome Brunet       2017-08-28  1303  	writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
74858655cbff05 Jerome Brunet       2017-08-28  1304  	       host->regs + SD_EMMC_STATUS);
74858655cbff05 Jerome Brunet       2017-08-28  1305  	writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
74858655cbff05 Jerome Brunet       2017-08-28  1306  	       host->regs + SD_EMMC_IRQ_EN);
51c5d8447bd71b Kevin Hilman        2016-10-19  1307  
75a08b9a0fcb5e Remi Pommarel       2019-01-11  1308  	ret = request_threaded_irq(host->irq, meson_mmc_irq,
f9e6a18a44de06 Martin Blumenstingl 2019-02-09  1309  				   meson_mmc_irq_thread, IRQF_SHARED,
f9e6a18a44de06 Martin Blumenstingl 2019-02-09  1310  				   dev_name(&pdev->dev), host);
51c5d8447bd71b Kevin Hilman        2016-10-19  1311  	if (ret)
bd911ec467c674 Jerome Brunet       2017-08-28  1312  		goto err_init_clk;
51c5d8447bd71b Kevin Hilman        2016-10-19  1313  
e5e4a3eb131f79 Heiner Kallweit     2017-03-25  1314  	mmc->caps |= MMC_CAP_CMD23;
efe0b669716314 Heiner Kallweit     2017-02-07  1315  	mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
efe0b669716314 Heiner Kallweit     2017-02-07  1316  	mmc->max_req_size = mmc->max_blk_count * mmc->max_blk_size;
79ed05e329c34c Heiner Kallweit     2017-04-07  1317  	mmc->max_segs = SD_EMMC_DESC_BUF_LEN / sizeof(struct sd_emmc_desc);
79ed05e329c34c Heiner Kallweit     2017-04-07  1318  	mmc->max_seg_size = mmc->max_req_size;
efe0b669716314 Heiner Kallweit     2017-02-07  1319  
51c5d8447bd71b Kevin Hilman        2016-10-19  1320  	/* data bounce buffer */
4136fcb547d2ba Heiner Kallweit     2017-02-07  1321  	host->bounce_buf_size = mmc->max_req_size;
51c5d8447bd71b Kevin Hilman        2016-10-19  1322  	host->bounce_buf =
51c5d8447bd71b Kevin Hilman        2016-10-19  1323  		dma_alloc_coherent(host->dev, host->bounce_buf_size,
51c5d8447bd71b Kevin Hilman        2016-10-19  1324  				   &host->bounce_dma_addr, GFP_KERNEL);
51c5d8447bd71b Kevin Hilman        2016-10-19  1325  	if (host->bounce_buf == NULL) {
51c5d8447bd71b Kevin Hilman        2016-10-19  1326  		dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
51c5d8447bd71b Kevin Hilman        2016-10-19  1327  		ret = -ENOMEM;
75a08b9a0fcb5e Remi Pommarel       2019-01-11  1328  		goto err_free_irq;
51c5d8447bd71b Kevin Hilman        2016-10-19  1329  	}
51c5d8447bd71b Kevin Hilman        2016-10-19  1330  
79ed05e329c34c Heiner Kallweit     2017-04-07  1331  	host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
79ed05e329c34c Heiner Kallweit     2017-04-07  1332  		      &host->descs_dma_addr, GFP_KERNEL);
79ed05e329c34c Heiner Kallweit     2017-04-07  1333  	if (!host->descs) {
79ed05e329c34c Heiner Kallweit     2017-04-07  1334  		dev_err(host->dev, "Allocating descriptor DMA buffer failed\n");
79ed05e329c34c Heiner Kallweit     2017-04-07  1335  		ret = -ENOMEM;
79ed05e329c34c Heiner Kallweit     2017-04-07  1336  		goto err_bounce_buf;
79ed05e329c34c Heiner Kallweit     2017-04-07  1337  	}
79ed05e329c34c Heiner Kallweit     2017-04-07  1338  
51c5d8447bd71b Kevin Hilman        2016-10-19  1339  	mmc->ops = &meson_mmc_ops;
f5506e0bbb2510 Yang Yingliang      2022-11-08  1340  	ret = mmc_add_host(mmc);
f5506e0bbb2510 Yang Yingliang      2022-11-08  1341  	if (ret)
f5506e0bbb2510 Yang Yingliang      2022-11-08  1342  		goto err_free_irq;
51c5d8447bd71b Kevin Hilman        2016-10-19  1343  
51c5d8447bd71b Kevin Hilman        2016-10-19  1344  	return 0;
51c5d8447bd71b Kevin Hilman        2016-10-19  1345  
79ed05e329c34c Heiner Kallweit     2017-04-07  1346  err_bounce_buf:
79ed05e329c34c Heiner Kallweit     2017-04-07  1347  	dma_free_coherent(host->dev, host->bounce_buf_size,
79ed05e329c34c Heiner Kallweit     2017-04-07  1348  			  host->bounce_buf, host->bounce_dma_addr);
75a08b9a0fcb5e Remi Pommarel       2019-01-11  1349  err_free_irq:
75a08b9a0fcb5e Remi Pommarel       2019-01-11  1350  	free_irq(host->irq, host);
bd911ec467c674 Jerome Brunet       2017-08-28  1351  err_init_clk:
bd911ec467c674 Jerome Brunet       2017-08-28  1352  	clk_disable_unprepare(host->mmc_clk);
ce473d5b49d6ef Michał Zegan        2017-03-14  1353  err_core_clk:
51c5d8447bd71b Kevin Hilman        2016-10-19  1354  	clk_disable_unprepare(host->core_clk);
51c5d8447bd71b Kevin Hilman        2016-10-19  1355  	return ret;
51c5d8447bd71b Kevin Hilman        2016-10-19  1356  }
51c5d8447bd71b Kevin Hilman        2016-10-19  1357  

:::::: The code at line 1272 was first introduced by commit
:::::: 1e03331d6b4340461efefab8b1dee874009ad950 mmc: meson-gx: work around clk-stop issue

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
