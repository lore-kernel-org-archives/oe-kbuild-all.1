Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AE8882F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 03:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTYtknMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697512329; x=1729048329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hMp2rCZbMAQqG/1g+S3yx/d9BPMwFmOYP/ySJOKo4Tc=;
  b=TTYtknMg6aCIxGwF/e6/ZwJq/zC2bHCVn/cnwutG2CBpWqJgQiKQPjLJ
   JLfcLrsqH1UjBrvXgDg65LBKqiLT8Sa3YnKsH45ZvqfynjeebJVrhE2ES
   M/QcYsa/XYkvTAmNL+vPHZQpfh1TaXCH2s5YMQf/nFdMn9GQzYx8JvvsT
   qGmJafsqH3DcXYEbLggDqqKHOqVY0X9d7ciWbmj8iTveVMuRfo95Lw88o
   Up8Yv2CxTkQrXmWDS6cMHkIiaJN6+Hv+VLp00azU8FGrciJnjgtMRlIkU
   lIc3PzTqWgmf9gKnJEkh5iv8sKKuwyHLA5o9xqSOjxDDBQO4JCt5cGba2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389559849"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="389559849"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 20:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="826266617"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="826266617"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2023 20:12:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsaV2-0008ui-37;
	Tue, 17 Oct 2023 03:12:04 +0000
Date: Tue, 17 Oct 2023 11:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 128/15768]
 sound/soc/fsl/fsl_xcvr.c:1367: undefined reference to `__udivdi3'
Message-ID: <202310171152.woY2AXBB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: bfefa84dbee3dacc0f5f16a91aeed0e8517212e7 [128/15768] MLK-25951-2: ASoC: fsl_xcvr: Add soc data of i.MX93
config: i386-randconfig-012-20231017 (https://download.01.org/0day-ci/archive/20231017/202310171152.woY2AXBB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171152.woY2AXBB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171152.woY2AXBB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/fsl/fsl_xcvr.o: in function `fsl_xcvr_runtime_resume':
>> sound/soc/fsl/fsl_xcvr.c:1367: undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +1367 sound/soc/fsl/fsl_xcvr.c

  1345	
  1346	static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
  1347	{
  1348		struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
  1349		int ret;
  1350		u64 rate, div;
  1351	
  1352		ret = reset_control_assert(xcvr->reset);
  1353		if (ret < 0) {
  1354			dev_err(dev, "Failed to assert M0+ reset: %d\n", ret);
  1355			return ret;
  1356		}
  1357	
  1358		ret = clk_prepare_enable(xcvr->ipg_clk);
  1359		if (ret) {
  1360			dev_err(dev, "failed to start IPG clock.\n");
  1361			return ret;
  1362		}
  1363	
  1364		/* set clk div for xcvr ip internal use */
  1365		if (xcvr->soc_data->spdif_only) {
  1366			rate = clk_get_rate(xcvr->ipg_clk);
> 1367			div = rate / 1000000 - 1;
  1368			ret = regmap_write(xcvr->regmap, FSL_XCVR_CLK_CTRL, div);
  1369			if (ret < 0) {
  1370				dev_err(dev, "Error while setting CLK_CTRL: %d\n", ret);
  1371				return ret;
  1372			}
  1373		}
  1374	
  1375		ret = clk_prepare_enable(xcvr->pll_ipg_clk);
  1376		if (ret) {
  1377			dev_err(dev, "failed to start PLL IPG clock.\n");
  1378			goto stop_ipg_clk;
  1379		}
  1380	
  1381		ret = clk_prepare_enable(xcvr->phy_clk);
  1382		if (ret) {
  1383			dev_err(dev, "failed to start PHY clock: %d\n", ret);
  1384			goto stop_pll_ipg_clk;
  1385		}
  1386	
  1387		ret = clk_prepare_enable(xcvr->spba_clk);
  1388		if (ret) {
  1389			dev_err(dev, "failed to start SPBA clock.\n");
  1390			goto stop_phy_clk;
  1391		}
  1392	
  1393		regcache_cache_only(xcvr->regmap, false);
  1394		regcache_mark_dirty(xcvr->regmap);
  1395		ret = regcache_sync(xcvr->regmap);
  1396	
  1397		if (ret) {
  1398			dev_err(dev, "failed to sync regcache.\n");
  1399			goto stop_spba_clk;
  1400		}
  1401	
  1402		if (xcvr->soc_data->spdif_only)
  1403			return 0;
  1404	
  1405		ret = reset_control_deassert(xcvr->reset);
  1406		if (ret) {
  1407			dev_err(dev, "failed to deassert M0+ reset.\n");
  1408			goto stop_spba_clk;
  1409		}
  1410	
  1411		ret = fsl_xcvr_load_firmware(xcvr);
  1412		if (ret) {
  1413			dev_err(dev, "failed to load firmware.\n");
  1414			goto stop_spba_clk;
  1415		}
  1416	
  1417		/* Release M0+ reset */
  1418		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
  1419					 FSL_XCVR_EXT_CTRL_CORE_RESET, 0);
  1420		if (ret < 0) {
  1421			dev_err(dev, "M0+ core release failed: %d\n", ret);
  1422			goto stop_spba_clk;
  1423		}
  1424	
  1425		/* Let M0+ core complete firmware initialization */
  1426		msleep(50);
  1427	
  1428		return 0;
  1429	
  1430	stop_spba_clk:
  1431		clk_disable_unprepare(xcvr->spba_clk);
  1432	stop_phy_clk:
  1433		clk_disable_unprepare(xcvr->phy_clk);
  1434	stop_pll_ipg_clk:
  1435		clk_disable_unprepare(xcvr->pll_ipg_clk);
  1436	stop_ipg_clk:
  1437		clk_disable_unprepare(xcvr->ipg_clk);
  1438	
  1439		return ret;
  1440	}
  1441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
