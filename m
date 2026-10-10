Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6DE28B7EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 06:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615407; cv=none; b=LUOSJ84nPKhAUu8+TRnSSFaWJn1vNuv2QtS1rU+W77m+/AZgfwvOhFMYBspR7skrJGZSg/sY7s/8FO7Du0O2CkFAcOluq2XmyEfKuJSclT+Q3rFcNMPJ1689WxOSwY/O3kxS9iLAi06Qo2cYREeIzcwgag25z3k6PFmMZGfDEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615407; c=relaxed/simple;
	bh=xBwU2CZL/cPlrFWMb3zjtIIkzw5OJXdSsSGMp2+ha8E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pb8M/HohPRyJOv+BckEtNBe6qJUftvE+ej3jCgHj2Drl4dYyflt0BLOJWlFTpzvhyB8P92laSEZ6GMjbybHoQT9Ebrpj+A6tOtQmVG/SBdEyksfzgDEk6E2YepQosup0aTtVJD6YIgdVy2QdOaqt5E4jkbpwUtqJMTo55auKWGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZKpZAlp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZKpZAlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791615405; x=1823151405;
  h=date:from:to:cc:subject:message-id;
  bh=xBwU2CZL/cPlrFWMb3zjtIIkzw5OJXdSsSGMp2+ha8E=;
  b=QZKpZAlpkyigV6gVscBmo1zEEUsLQ5F+qQfHm1Hee632ER6Nmb22tfaa
   mS56njdLkUIXVvidOakNHLv2e/bKX9Pfl/OwmwLVD54GG/6Kf5CdAa+BF
   FX+CAGU0ZAgdMY7Ug1HCixUUBNElUeuL1PfDw+tqf2TjvcnRy5UHHHHT7
   JCjVncx5q94nYukMdDHoKzBDy+ChszWB3Aca+MYJlJ2zCVEXLDgcaest5
   is7XHt/tAlGR4mQoz25RSmyidjN4MtRxP+iGC0uaMeR5IxKf17kvuSp8V
   DdyL3N3ywVOg1rYmGe82SwUYDasSjnNs4wmIhBRQFlk3bjLvtviZbjTuG
   A==;
X-CSE-ConnectionGUID: HZ9e71ajTSCWh5QGpi0saw==
X-CSE-MsgGUID: PlGnAsqbTPqipp3T1x26rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="411204"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="411204"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 23:56:45 -0700
X-CSE-ConnectionGUID: An0NfTZkSGigGv4smcxxow==
X-CSE-MsgGUID: kqbO8zZVS1KYnw/oFakiUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="939098"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2026 23:56:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFR0a-000000007cN-3YSp;
	Sat, 10 Oct 2026 06:56:40 +0000
Date: Sat, 10 Oct 2026 08:56:24 +0200
From: kernel test robot <lkp@intel.com>
To: Cody Kang <codykang.hk@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Yixun Lan <dlan@kernel.org>
Subject: [spacemit-com:wip/k3-pm-v2.4 22/45]
 drivers/gpu/drm/spacemit/spacemit_inno_dp.c:1441: undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202610100857.JhGzsa2R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/spacemit-com/linux wip/k3-pm-v2.4
head:   6f866f6a11e33b4cdfc71149681779041dbc310d
commit: 235aa8563eedc5843429bac4aa7596b6ddac7665 [22/45] drm/spacemit: add Innosilicon DP/eDP controller bridge driver
config: arm-randconfig-r2302-20261009 (https://download.01.org/0day-ci/archive/20261010/202610100857.JhGzsa2R-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100857.JhGzsa2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100857.JhGzsa2R-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/spacemit/spacemit_inno_dp.o: in function `spacemit_dp_bridge_atomic_enable':
>> drivers/gpu/drm/spacemit/spacemit_inno_dp.c:1441: undefined reference to `__aeabi_uldivmod'


vim +1441 drivers/gpu/drm/spacemit/spacemit_inno_dp.c

  1396	
  1397	static void spacemit_dp_bridge_atomic_enable(struct drm_bridge *bridge,
  1398						     struct drm_atomic_commit *state)
  1399	{
  1400		struct spacemit_dp_dev *dp = container_of(bridge,
  1401							  struct spacemit_dp_dev,
  1402							  bridge);
  1403		struct drm_bridge_state *new_bridge_state =
  1404			drm_atomic_get_new_bridge_state(state, bridge);
  1405		struct spacemit_dp_bridge_state *st =
  1406				to_spacemit_dp_bridge_state(new_bridge_state);
  1407		struct drm_connector_state *conn_state =
  1408			drm_atomic_get_new_connector_state(state, dp->connector);
  1409		struct drm_crtc_state *crtc_state =
  1410			drm_atomic_get_new_crtc_state(state, conn_state->crtc);
  1411		struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
  1412		const struct spacemit_dp_link_config *cfg;
  1413		bool trained;
  1414		u64 clk_val;
  1415		u64 set_clk_val;
  1416		u32 req_bw;
  1417		u32 hpd;
  1418		int start;
  1419		int bpp;
  1420		int i;
  1421	
  1422		guard(mutex)(&dp->mode_lock);
  1423		drm_mode_copy(&dp->mode, adjusted_mode);
  1424	
  1425		/* Enable-time retry for the caps .detect() could not read. */
  1426		if (!dp->link.max_rate || !dp->link.max_num_lanes)
  1427			spacemit_dp_hw_read_sink_caps(dp);
  1428	
  1429		if (dp->use_ext_pixel_clock && dp->pxclk) {
  1430			set_clk_val = adjusted_mode->clock * 1000;
  1431			if (set_clk_val) {
  1432				set_clk_val = clk_round_rate(dp->pxclk, set_clk_val);
  1433				clk_val = clk_get_rate(dp->pxclk);
  1434				if (clk_val != set_clk_val) {
  1435					clk_set_rate(dp->pxclk, set_clk_val);
  1436					dev_dbg(dp->dev, "set dp pxclk=%lld\n",
  1437						set_clk_val);
  1438				}
  1439			}
  1440			clk_val = clk_get_rate(dp->pxclk);
> 1441			dp->pixel_clock = clk_val / 1000;
  1442		}
  1443	
  1444		bpp = spacemit_dp_get_bpp(dp, st->color_format);
  1445		req_bw = spacemit_dp_calc_required_bw(adjusted_mode, bpp);
  1446	
  1447		/*
  1448		 * Start where atomic_check() left off, but keep the upgrade walk as
  1449		 * fallback.
  1450		 */
  1451		start = st->link_cfg_idx >= 0 ? st->link_cfg_idx : 0;
  1452	
  1453		for (trained = false, i = start;
  1454		     i < ARRAY_SIZE(spacemit_dp_link_priority_table); i++) {
  1455			u32 capacity;
  1456	
  1457			cfg = &spacemit_dp_link_priority_table[i];
  1458	
  1459			/* Source and sink limits */
  1460			if (cfg->rate > dp->link.max_rate || cfg->lanes > dp->link.max_num_lanes)
  1461				continue;
  1462	
  1463			/* Bandwidth requirement */
  1464			capacity = spacemit_dp_calc_link_capacity(cfg->rate,
  1465								  cfg->lanes);
  1466			if (capacity < req_bw)
  1467				continue;
  1468	
  1469			dev_dbg(dp->dev, "trying link config: rate %d lanes %d (capacity %d, required %d)\n",
  1470				cfg->rate, cfg->lanes, capacity, req_bw);
  1471	
  1472			spacemit_dp_link_disable(dp);
  1473	
  1474			/* Apply Hardware Settings */
  1475			if (spacemit_dp_set_plls(dp, cfg->rate,
  1476						 dp->use_ext_pixel_clock ? dp->pixel_clock
  1477									 : adjusted_mode->clock))
  1478				continue;
  1479	
  1480			if (spacemit_dp_phy_set_lanes(dp, cfg->lanes))
  1481				continue;
  1482	
  1483			if (spacemit_dp_phy_on(dp))
  1484				continue;
  1485	
  1486			/*
  1487			 * Debounce: the transmitter was power-cycled just now and a
  1488			 * sink may legitimately drop HPD across a link-down. eDP is
  1489			 * hardwired and noisy.
  1490			 */
  1491			if (!dp->edp_mode &&
  1492			    regmap_read_poll_timeout(dp->regs, DP_HPD_INTERRUPT_STATUS, hpd,
  1493						     hpd & DP_HPD_IN_STATUS,
  1494						     SPACEMIT_DP_HPD_POLL_US,
  1495						     SPACEMIT_DP_HPD_DEBOUNCE_US)) {
  1496				dev_warn(dp->dev,
  1497					 "sink is not asserting HPD; not training\n");
  1498				break;
  1499			}
  1500	
  1501			if (dp->edp_mode) {
  1502				regmap_write_bits(dp->regs, DP_CORE_CONTROL,
  1503						  DP_ENABLE_EDP,
  1504						  FIELD_PREP(DP_ENABLE_EDP, 0x1));
  1505				regmap_write_bits(dp->regs, DP_VIDEO_VSAMPLE_REG,
  1506						  DP_STREAM_ENC_EN,
  1507						  FIELD_PREP(DP_STREAM_ENC_EN, 0x1));
  1508				update_edp_config(dp, true);
  1509			}
  1510	
  1511			/* Execute Link Training */
  1512			if (spacemit_dp_link_train(dp, cfg->rate, cfg->lanes) == 0) {
  1513				dev_dbg(dp->dev,
  1514					"link training succeeded: rate %d lanes %d\n",
  1515					cfg->rate, cfg->lanes);
  1516				trained = true;
  1517				break;
  1518			}
  1519	
  1520			dev_warn(dp->dev, "link training failed: rate %d lanes %d, trying next config\n",
  1521				 cfg->rate, cfg->lanes);
  1522		}
  1523	
  1524		/*
  1525		 * The DPU's pixel clock comes from the PHY PLL, so scanning out into an
  1526		 * untrained link never reaches CFG_RDY and wedges the CRTC on
  1527		 * flip_done.
  1528		 */
  1529		if (!trained) {
  1530			dev_err(dp->dev,
  1531				"no usable link config; leaving video disabled (%u kHz x%u lanes)\n",
  1532				dp->link.max_rate, dp->link.max_num_lanes);
  1533			/*
  1534			 * The caps may be from a sink that has since been swapped out.
  1535			 */
  1536			dp->link.max_rate = 0;
  1537			dp->link.max_num_lanes = 0;
  1538	
  1539			/*
  1540			 * Deferred: we are inside the commit and hold the modeset
  1541			 * locks.
  1542			 */
  1543			schedule_work(&dp->modeset_retry_work);
  1544			return;
  1545		}
  1546	
  1547		spacemit_dp_hw_set_msa_and_enable_video(dp, adjusted_mode,
  1548							dp->link_rate, dp->lane_count,
  1549							st->color_format);
  1550	}
  1551	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
