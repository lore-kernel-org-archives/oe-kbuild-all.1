Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963422DAFBB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900932; cv=none; b=BcAUFkyuoxWg7FsfsM37xt0lhFnF3BgGrms+sM/zaTKKjp/Er/7wZ08cv/FfWnWvJlHkMnowG5hpARkkp0NgiyWblsNTSQIcbtjD9BTMxng82q6VEFbglkRFCzJDHb2Bzf49vTJEcfMkias4hSiUgwNZelX2pYWEpYmmoSamZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900932; c=relaxed/simple;
	bh=obcIynk8A9gARzRVyRPgsa6K4w5/uexlQ14GooF/rrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9oOBjUv8S3Ipr7mo3yW0ASZkKej5JqKxphsmTbA66mt8HOKSTyCmmDot1k7ZsxTklN+BEz+F2A9Aobu1IZYkNH6i+4IbbxSMgEIQxIs5C2TtcnxU1m+Xl8X8KDVdjawG6ASqpT6Fs/y6iFyHVfjp4xmd4Ff+7sHvRQjrDFSnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwbr+vIa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwbr+vIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754900929; x=1786436929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=obcIynk8A9gARzRVyRPgsa6K4w5/uexlQ14GooF/rrE=;
  b=kwbr+vIaY36TNBPn06jDumpZkn0UnhjL9FwPfJW3BED9QLtwtrF6sUVL
   Du/SBFy27cC6zOsRkCXGbsj5hkoTHSkBYkOA8fIUzijzbfbWvDR6ECvA3
   Una8e9WKTm+kVIs92NQ2eugSuLUdk0YvBKlLOnl6dFj2tMe91TynfAxVJ
   ZbJv459B4i/jpw1okZ62phPXfzSMEEj3bs6aeOpoRIc2ZBVfC9eAKYymm
   +rlczmrEpJDtemDTr+y3TNdCkS9YDfry5sllyDcwXNW5Ytr4cX6oNoD1V
   x5dh8YzEellLbze5t8Nw27okNAdj99zLH2M+PhiB1zFeDZzTeXNnlwwWh
   A==;
X-CSE-ConnectionGUID: 3/KeKZnES4i0j+joS4AxAg==
X-CSE-MsgGUID: P70wdYRoRzmTmqU1ee/KgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67416810"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67416810"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 01:28:49 -0700
X-CSE-ConnectionGUID: VXORWnd0QZ6wApI8jHmvsg==
X-CSE-MsgGUID: 5HJrAhTlSrWnFtQx9694Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="171103154"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 11 Aug 2025 01:28:47 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulNtd-00032J-1C;
	Mon, 11 Aug 2025 08:28:45 +0000
Date: Mon, 11 Aug 2025 10:28:12 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, ZhangPeng <zhangpeng362@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2666/2666] drivers/usb/dwc3/core.c:1174:16:
 warning: variable 'hw_mode' set but not used
Message-ID: <202508111054.kROi2W5N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   09d0a2e6b14e15a741ad6b479c7dced36608a9ff
commit: 381994c39e251eeb2cecf06200ff200fdd5e06ff [2666/2666] usb: dwc3: core: Prevent phy suspend during init
config: x86_64-buildonly-randconfig-2004-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111054.kROi2W5N-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111054.kROi2W5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111054.kROi2W5N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/dwc3/core.c:24:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/usb/dwc3/core.c:1174:16: warning: variable 'hw_mode' set but not used [-Wunused-but-set-variable]
    1174 |         unsigned int            hw_mode;
         |                                 ^
   2 warnings generated.


vim +/hw_mode +1174 drivers/usb/dwc3/core.c

0a0e16cf4375dc Stanley Chang             2023-12-03  1165  
941f918ecfa757 Felipe Balbi              2016-10-14  1166  /**
941f918ecfa757 Felipe Balbi              2016-10-14  1167   * dwc3_core_init - Low-level initialization of DWC3 Core
941f918ecfa757 Felipe Balbi              2016-10-14  1168   * @dwc: Pointer to our controller context structure
941f918ecfa757 Felipe Balbi              2016-10-14  1169   *
941f918ecfa757 Felipe Balbi              2016-10-14  1170   * Returns 0 on success otherwise negative errno.
941f918ecfa757 Felipe Balbi              2016-10-14  1171   */
941f918ecfa757 Felipe Balbi              2016-10-14  1172  static int dwc3_core_init(struct dwc3 *dwc)
941f918ecfa757 Felipe Balbi              2016-10-14  1173  {
9ba3aca8fe8231 Thinh Nguyen              2019-08-09 @1174  	unsigned int		hw_mode;
941f918ecfa757 Felipe Balbi              2016-10-14  1175  	u32			reg;
941f918ecfa757 Felipe Balbi              2016-10-14  1176  	int			ret;
941f918ecfa757 Felipe Balbi              2016-10-14  1177  
9ba3aca8fe8231 Thinh Nguyen              2019-08-09  1178  	hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
9ba3aca8fe8231 Thinh Nguyen              2019-08-09  1179  
941f918ecfa757 Felipe Balbi              2016-10-14  1180  	/*
941f918ecfa757 Felipe Balbi              2016-10-14  1181  	 * Write Linux Version Code to our GUID register so it's easy to figure
941f918ecfa757 Felipe Balbi              2016-10-14  1182  	 * out which kernel version a bug was found.
941f918ecfa757 Felipe Balbi              2016-10-14  1183  	 */
941f918ecfa757 Felipe Balbi              2016-10-14  1184  	dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
941f918ecfa757 Felipe Balbi              2016-10-14  1185  
98112041bcca16 Roger Quadros             2018-02-12  1186  	ret = dwc3_phy_setup(dwc);
941f918ecfa757 Felipe Balbi              2016-10-14  1187  	if (ret)
d2f197822d5807 Johan Hovold              2023-04-04  1188  		return ret;
941f918ecfa757 Felipe Balbi              2016-10-14  1189  
98112041bcca16 Roger Quadros             2018-02-12  1190  	if (!dwc->ulpi_ready) {
98112041bcca16 Roger Quadros             2018-02-12  1191  		ret = dwc3_core_ulpi_init(dwc);
63130462c919ec Ferry Toth                2022-12-05  1192  		if (ret) {
63130462c919ec Ferry Toth                2022-12-05  1193  			if (ret == -ETIMEDOUT) {
63130462c919ec Ferry Toth                2022-12-05  1194  				dwc3_core_soft_reset(dwc);
63130462c919ec Ferry Toth                2022-12-05  1195  				ret = -EPROBE_DEFER;
63130462c919ec Ferry Toth                2022-12-05  1196  			}
d2f197822d5807 Johan Hovold              2023-04-04  1197  			return ret;
63130462c919ec Ferry Toth                2022-12-05  1198  		}
98112041bcca16 Roger Quadros             2018-02-12  1199  		dwc->ulpi_ready = true;
98112041bcca16 Roger Quadros             2018-02-12  1200  	}
4878a02898bab1 Sebastian Andrzej Siewior 2011-10-31  1201  
98112041bcca16 Roger Quadros             2018-02-12  1202  	if (!dwc->phys_ready) {
98112041bcca16 Roger Quadros             2018-02-12  1203  		ret = dwc3_core_get_phy(dwc);
f54edb539c1167 Felipe Balbi              2017-06-05  1204  		if (ret)
d2f197822d5807 Johan Hovold              2023-04-04  1205  			goto err_exit_ulpi;
98112041bcca16 Roger Quadros             2018-02-12  1206  		dwc->phys_ready = true;
98112041bcca16 Roger Quadros             2018-02-12  1207  	}
98112041bcca16 Roger Quadros             2018-02-12  1208  
1d72fab476567a Johan Hovold              2023-04-04  1209  	ret = dwc3_phy_init(dwc);
1d72fab476567a Johan Hovold              2023-04-04  1210  	if (ret)
1d72fab476567a Johan Hovold              2023-04-04  1211  		goto err_exit_ulpi;
8cfac9a6744fcb Li Jun                    2021-09-08  1212  
98112041bcca16 Roger Quadros             2018-02-12  1213  	ret = dwc3_core_soft_reset(dwc);
98112041bcca16 Roger Quadros             2018-02-12  1214  	if (ret)
1d72fab476567a Johan Hovold              2023-04-04  1215  		goto err_exit_phy;
f54edb539c1167 Felipe Balbi              2017-06-05  1216  
941f918ecfa757 Felipe Balbi              2016-10-14  1217  	dwc3_core_setup_global_control(dwc);
c499ff71ff2a28 Felipe Balbi              2016-05-16  1218  	dwc3_core_num_eps(dwc);
0ffcaf3798bfd8 Felipe Balbi              2013-12-19  1219  
3497b9a5c8c3d4 Li Jun                    2022-06-07  1220  	/* Set power down scale of suspend_clk */
3497b9a5c8c3d4 Li Jun                    2022-06-07  1221  	dwc3_set_power_down_clk_scale(dwc);
3497b9a5c8c3d4 Li Jun                    2022-06-07  1222  
c499ff71ff2a28 Felipe Balbi              2016-05-16  1223  	/* Adjust Frame Length */
c499ff71ff2a28 Felipe Balbi              2016-05-16  1224  	dwc3_frame_length_adjustment(dwc);
c499ff71ff2a28 Felipe Balbi              2016-05-16  1225  
7bee3188388901 Balaji Prakash J          2021-08-31  1226  	/* Adjust Reference Clock Period */
7bee3188388901 Balaji Prakash J          2021-08-31  1227  	dwc3_ref_clk_period(dwc);
7bee3188388901 Balaji Prakash J          2021-08-31  1228  
d9612c2f0449e2 Pengbo Mu                 2018-07-23  1229  	dwc3_set_incr_burst_type(dwc);
d9612c2f0449e2 Pengbo Mu                 2018-07-23  1230  
8018018d9c5647 Dan Carpenter             2023-05-04  1231  	ret = dwc3_phy_power_on(dwc);
1d72fab476567a Johan Hovold              2023-04-04  1232  	if (ret)
1d72fab476567a Johan Hovold              2023-04-04  1233  		goto err_exit_phy;
c499ff71ff2a28 Felipe Balbi              2016-05-16  1234  
c499ff71ff2a28 Felipe Balbi              2016-05-16  1235  	ret = dwc3_event_buffers_setup(dwc);
c499ff71ff2a28 Felipe Balbi              2016-05-16  1236  	if (ret) {
c499ff71ff2a28 Felipe Balbi              2016-05-16  1237  		dev_err(dwc->dev, "failed to setup event buffers\n");
1d72fab476567a Johan Hovold              2023-04-04  1238  		goto err_power_off_phy;
c499ff71ff2a28 Felipe Balbi              2016-05-16  1239  	}
c499ff71ff2a28 Felipe Balbi              2016-05-16  1240  
06281d460fc5d8 John Youn                 2016-08-22  1241  	/*
06281d460fc5d8 John Youn                 2016-08-22  1242  	 * ENDXFER polling is available on version 3.10a and later of
06281d460fc5d8 John Youn                 2016-08-22  1243  	 * the DWC_usb3 controller. It is NOT available in the
06281d460fc5d8 John Youn                 2016-08-22  1244  	 * DWC_usb31 controller.
06281d460fc5d8 John Youn                 2016-08-22  1245  	 */
9af21dd6faeba5 Thinh Nguyen              2020-04-11  1246  	if (DWC3_VER_IS_WITHIN(DWC3, 310A, ANY)) {
06281d460fc5d8 John Youn                 2016-08-22  1247  		reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
06281d460fc5d8 John Youn                 2016-08-22  1248  		reg |= DWC3_GUCTL2_RST_ACTBITLATER;
06281d460fc5d8 John Youn                 2016-08-22  1249  		dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
06281d460fc5d8 John Youn                 2016-08-22  1250  	}
06281d460fc5d8 John Youn                 2016-08-22  1251  
63d7f9810a3810 Piyush Mehta              2022-09-20  1252  	/*
63d7f9810a3810 Piyush Mehta              2022-09-20  1253  	 * When configured in HOST mode, after issuing U3/L2 exit controller
63d7f9810a3810 Piyush Mehta              2022-09-20  1254  	 * fails to send proper CRC checksum in CRC5 feild. Because of this
63d7f9810a3810 Piyush Mehta              2022-09-20  1255  	 * behaviour Transaction Error is generated, resulting in reset and
63d7f9810a3810 Piyush Mehta              2022-09-20  1256  	 * re-enumeration of usb device attached. All the termsel, xcvrsel,
63d7f9810a3810 Piyush Mehta              2022-09-20  1257  	 * opmode becomes 0 during end of resume. Enabling bit 10 of GUCTL1
63d7f9810a3810 Piyush Mehta              2022-09-20  1258  	 * will correct this problem. This option is to support certain
63d7f9810a3810 Piyush Mehta              2022-09-20  1259  	 * legacy ULPI PHYs.
63d7f9810a3810 Piyush Mehta              2022-09-20  1260  	 */
63d7f9810a3810 Piyush Mehta              2022-09-20  1261  	if (dwc->resume_hs_terminations) {
63d7f9810a3810 Piyush Mehta              2022-09-20  1262  		reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
63d7f9810a3810 Piyush Mehta              2022-09-20  1263  		reg |= DWC3_GUCTL1_RESUME_OPMODE_HS_HOST;
63d7f9810a3810 Piyush Mehta              2022-09-20  1264  		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
63d7f9810a3810 Piyush Mehta              2022-09-20  1265  	}
63d7f9810a3810 Piyush Mehta              2022-09-20  1266  
9af21dd6faeba5 Thinh Nguyen              2020-04-11  1267  	if (!DWC3_VER_IS_PRIOR(DWC3, 250A)) {
65db7a0c981637 William Wu                2017-04-19  1268  		reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
65db7a0c981637 William Wu                2017-04-19  1269  
0bb39ca1ad8758 John Youn                 2016-10-12  1270  		/*
65db7a0c981637 William Wu                2017-04-19  1271  		 * Enable hardware control of sending remote wakeup
65db7a0c981637 William Wu                2017-04-19  1272  		 * in HS when the device is in the L1 state.
0bb39ca1ad8758 John Youn                 2016-10-12  1273  		 */
9af21dd6faeba5 Thinh Nguyen              2020-04-11  1274  		if (!DWC3_VER_IS_PRIOR(DWC3, 290A))
0bb39ca1ad8758 John Youn                 2016-10-12  1275  			reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
65db7a0c981637 William Wu                2017-04-19  1276  
843714bb37d9a3 Jack Pham                 2021-08-12  1277  		/*
843714bb37d9a3 Jack Pham                 2021-08-12  1278  		 * Decouple USB 2.0 L1 & L2 events which will allow for
843714bb37d9a3 Jack Pham                 2021-08-12  1279  		 * gadget driver to only receive U3/L2 suspend & wakeup
843714bb37d9a3 Jack Pham                 2021-08-12  1280  		 * events and prevent the more frequent L1 LPM transitions
843714bb37d9a3 Jack Pham                 2021-08-12  1281  		 * from interrupting the driver.
843714bb37d9a3 Jack Pham                 2021-08-12  1282  		 */
843714bb37d9a3 Jack Pham                 2021-08-12  1283  		if (!DWC3_VER_IS_PRIOR(DWC3, 300A))
843714bb37d9a3 Jack Pham                 2021-08-12  1284  			reg |= DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT;
843714bb37d9a3 Jack Pham                 2021-08-12  1285  
65db7a0c981637 William Wu                2017-04-19  1286  		if (dwc->dis_tx_ipgap_linecheck_quirk)
65db7a0c981637 William Wu                2017-04-19  1287  			reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
65db7a0c981637 William Wu                2017-04-19  1288  
7ba6b09fda5e0c Neil Armstrong            2020-02-21  1289  		if (dwc->parkmode_disable_ss_quirk)
7ba6b09fda5e0c Neil Armstrong            2020-02-21  1290  			reg |= DWC3_GUCTL1_PARKMODE_DISABLE_SS;
7ba6b09fda5e0c Neil Armstrong            2020-02-21  1291  
d21a797a3eeb2b Stanley Chang             2023-04-19  1292  		if (dwc->parkmode_disable_hs_quirk)
d21a797a3eeb2b Stanley Chang             2023-04-19  1293  			reg |= DWC3_GUCTL1_PARKMODE_DISABLE_HS;
d21a797a3eeb2b Stanley Chang             2023-04-19  1294  
62b20e6e0dde8d Bin Yang                  2022-02-28  1295  		if (DWC3_VER_IS_WITHIN(DWC3, 290A, ANY) &&
62b20e6e0dde8d Bin Yang                  2022-02-28  1296  		    (dwc->maximum_speed == USB_SPEED_HIGH ||
62b20e6e0dde8d Bin Yang                  2022-02-28  1297  		     dwc->maximum_speed == USB_SPEED_FULL))
62b20e6e0dde8d Bin Yang                  2022-02-28  1298  			reg |= DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK;
62b20e6e0dde8d Bin Yang                  2022-02-28  1299  
0bb39ca1ad8758 John Youn                 2016-10-12  1300  		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
0bb39ca1ad8758 John Youn                 2016-10-12  1301  	}
0bb39ca1ad8758 John Youn                 2016-10-12  1302  
0a0e16cf4375dc Stanley Chang             2023-12-03  1303  	dwc3_config_threshold(dwc);
938a5ad1d3055c Thinh Nguyen              2018-03-16  1304  
72246da40f3719 Felipe Balbi              2011-08-19  1305  	return 0;
72246da40f3719 Felipe Balbi              2011-08-19  1306  
1d72fab476567a Johan Hovold              2023-04-04  1307  err_power_off_phy:
1d72fab476567a Johan Hovold              2023-04-04  1308  	dwc3_phy_power_off(dwc);
1d72fab476567a Johan Hovold              2023-04-04  1309  err_exit_phy:
1d72fab476567a Johan Hovold              2023-04-04  1310  	dwc3_phy_exit(dwc);
d2f197822d5807 Johan Hovold              2023-04-04  1311  err_exit_ulpi:
98112041bcca16 Roger Quadros             2018-02-12  1312  	dwc3_ulpi_exit(dwc);
98112041bcca16 Roger Quadros             2018-02-12  1313  
72246da40f3719 Felipe Balbi              2011-08-19  1314  	return ret;
72246da40f3719 Felipe Balbi              2011-08-19  1315  }
72246da40f3719 Felipe Balbi              2011-08-19  1316  

:::::: The code at line 1174 was first introduced by commit
:::::: 9ba3aca8fe82318805709036bd50bee64570088b usb: dwc3: Disable phy suspend after power-on reset

:::::: TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
