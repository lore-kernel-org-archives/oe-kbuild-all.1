Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C287D198B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693508345; x=1725044345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qlg8O8ucxVpeVihk2vmkBoJXmRYvSXL+0wn8F+sOQbc=;
  b=EaBUcnQSVH3L7YSCECbwygg3tjjVxcRmrTUMoBERvD5Ul8wWUgX1J1m4
   BFOCnGpjQ5QETioe3x0cBFZQhEExHhvHGdBEDZhEQB79huaAtW1JY3XdE
   jXZSpZtDbAW4H4JZ5jUY8bzJnuUuzntMaLRmMSBMHtWO2VbLeyRKJ2ZxM
   A9LTBtv0NugKgDvJFd2Ptixi3J1UpD3geGm1DJAdvu6lyHqNt58SGZe4j
   xerqWI5mP3GWMBANaSW7ZC4lVXzt5Qp7mrHL6ywD4rgYlUykgu7iKTo8G
   3G6f07NWVmSndJbos5SMqQYzTAZ1A25PVUiQv5I5nUsDkl5pzGMQYXM2k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355533846"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="355533846"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863247275"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="863247275"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2023 11:59:03 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbmse-0000Sg-35;
	Thu, 31 Aug 2023 18:59:00 +0000
Date: Fri, 1 Sep 2023 02:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 14597/24603] sound/soc/fsl/fsl_xcvr.c:1364:
 undefined reference to `__udivdi3'
Message-ID: <202309010205.AHiAxLFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: e8119d420e52befc919c1dbe609d467436382a13 [14597/24603] MLK-25951-2: ASoC: fsl_xcvr: Add soc data of i.MX93
config: i386-randconfig-002-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010205.AHiAxLFd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010205.AHiAxLFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010205.AHiAxLFd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: sound/soc/fsl/fsl_xcvr.o: in function `fsl_xcvr_runtime_resume':
>> sound/soc/fsl/fsl_xcvr.c:1364: undefined reference to `__udivdi3'


vim +1364 sound/soc/fsl/fsl_xcvr.c

  1342	
  1343	static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
  1344	{
  1345		struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
  1346		int ret;
  1347		u64 rate, div;
  1348	
  1349		ret = reset_control_assert(xcvr->reset);
  1350		if (ret < 0) {
  1351			dev_err(dev, "Failed to assert M0+ reset: %d\n", ret);
  1352			return ret;
  1353		}
  1354	
  1355		ret = clk_prepare_enable(xcvr->ipg_clk);
  1356		if (ret) {
  1357			dev_err(dev, "failed to start IPG clock.\n");
  1358			return ret;
  1359		}
  1360	
  1361		/* set clk div for xcvr ip internal use */
  1362		if (xcvr->soc_data->spdif_only) {
  1363			rate = clk_get_rate(xcvr->ipg_clk);
> 1364			div = rate / 1000000 - 1;
  1365			ret = regmap_write(xcvr->regmap, FSL_XCVR_CLK_CTRL, div);
  1366			if (ret < 0) {
  1367				dev_err(dev, "Error while setting CLK_CTRL: %d\n", ret);
  1368				return ret;
  1369			}
  1370		}
  1371	
  1372		ret = clk_prepare_enable(xcvr->pll_ipg_clk);
  1373		if (ret) {
  1374			dev_err(dev, "failed to start PLL IPG clock.\n");
  1375			goto stop_ipg_clk;
  1376		}
  1377	
  1378		ret = clk_prepare_enable(xcvr->phy_clk);
  1379		if (ret) {
  1380			dev_err(dev, "failed to start PHY clock: %d\n", ret);
  1381			goto stop_pll_ipg_clk;
  1382		}
  1383	
  1384		ret = clk_prepare_enable(xcvr->spba_clk);
  1385		if (ret) {
  1386			dev_err(dev, "failed to start SPBA clock.\n");
  1387			goto stop_phy_clk;
  1388		}
  1389	
  1390		regcache_cache_only(xcvr->regmap, false);
  1391		regcache_mark_dirty(xcvr->regmap);
  1392		ret = regcache_sync(xcvr->regmap);
  1393	
  1394		if (ret) {
  1395			dev_err(dev, "failed to sync regcache.\n");
  1396			goto stop_spba_clk;
  1397		}
  1398	
  1399		if (xcvr->soc_data->spdif_only)
  1400			return 0;
  1401	
  1402		ret = reset_control_deassert(xcvr->reset);
  1403		if (ret) {
  1404			dev_err(dev, "failed to deassert M0+ reset.\n");
  1405			goto stop_spba_clk;
  1406		}
  1407	
  1408		ret = fsl_xcvr_load_firmware(xcvr);
  1409		if (ret) {
  1410			dev_err(dev, "failed to load firmware.\n");
  1411			goto stop_spba_clk;
  1412		}
  1413	
  1414		/* Release M0+ reset */
  1415		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
  1416					 FSL_XCVR_EXT_CTRL_CORE_RESET, 0);
  1417		if (ret < 0) {
  1418			dev_err(dev, "M0+ core release failed: %d\n", ret);
  1419			goto stop_spba_clk;
  1420		}
  1421	
  1422		/* Let M0+ core complete firmware initialization */
  1423		msleep(50);
  1424	
  1425		return 0;
  1426	
  1427	stop_spba_clk:
  1428		clk_disable_unprepare(xcvr->spba_clk);
  1429	stop_phy_clk:
  1430		clk_disable_unprepare(xcvr->phy_clk);
  1431	stop_pll_ipg_clk:
  1432		clk_disable_unprepare(xcvr->pll_ipg_clk);
  1433	stop_ipg_clk:
  1434		clk_disable_unprepare(xcvr->ipg_clk);
  1435	
  1436		return ret;
  1437	}
  1438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
