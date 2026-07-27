Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA743DAACB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 06:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785135352; cv=none; b=Usx1ajx8wGLg/iO4beHB8t3eewAYn6ZlnE2eUhMFlUdtu2wPJHL/7ZljGClmo2CxlM3f/QLlmnNSCc0+rRK5HbS5MTC38wY7swkmpjphM0dvz4EORCwpSEwg6tqReijpPrqqWokroFvrA8l70I2HOCln5d5A0vrpFGSZ5/1GZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785135352; c=relaxed/simple;
	bh=yf/wmBSvZ6rKWzfjbGGIl/bqQkl0fCjPvjAnw2NNjy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NX0HspHVRB5vcKt0dZ/q4KZws1qLcBiu3KQ1GTveCDIY/EuLA7rAg3PBlC8No3CSw1k6xMEJ0WvfWoxcmXfvOB2vaP4/mr/bjKsg3U8FYLpebQtuqPkQl4RBanKzr8H4LmM2gEv0AWL/EhyV7OXRXis7IZmsOqjOJXrJuhXAD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZzow/3S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZzow/3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785135350; x=1816671350;
  h=date:from:to:cc:subject:message-id;
  bh=yf/wmBSvZ6rKWzfjbGGIl/bqQkl0fCjPvjAnw2NNjy4=;
  b=YZzow/3SXXnCrsYJPMtbxdq1PIbypqMmBZOu325wB/FBd3a6hzzVXgb0
   w4fn0TkW8+Tobp3oQ/5YaDX2ItGsUVm0LeEHTl3l00DepEQXV1XkExN5z
   Txp97JgDlA2MQFMJ2ODn0HVY55ElonRL8t1Y0d3GfotqdB8vR4+3LkADs
   hc4LhSOm6grGTNTTsZfEnj+b9uggJt22g36YVwBB94++AuVa2MWERTBat
   e4BHUgZOiyLpUnZLvvt7bniA9UPe+tS3ozZyKV4cfaFDEXzmU58yBrPu8
   xejBhOm99zn6GuGfQs13mxRieAXB0mPV+GNEVghP+jOU7IwyK3iXXNqZF
   w==;
X-CSE-ConnectionGUID: 5SJuo5P3QnGitb8uC/r+AQ==
X-CSE-MsgGUID: 1xo0FEsbRJC0Ejd+qWFD1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85547576"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85547576"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 23:55:50 -0700
X-CSE-ConnectionGUID: yNX1QHqZSPW3EUERvoO/Aw==
X-CSE-MsgGUID: HosotmMQTh2J1XB76PZ4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="263621101"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Jul 2026 23:55:48 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woFFZ-000000001Xu-24aG;
	Mon, 27 Jul 2026 06:55:45 +0000
Date: Mon, 27 Jul 2026 08:55:16 +0200
From: kernel test robot <lkp@intel.com>
To: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Rohan G Thomas <rohan.g.thomas@altera.com>
Subject: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:759:40:
 error: 'struct plat_stmmacenet_data' has no member named 'has_xgmac'
Message-ID: <202607270831.Vtbf2KFv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/muhammad-nazim-amirul-nazle-asmade-altera-com/net-stmmac-Fix-E2E-delay-mechanism/20260727-102730
head:   e2c5d928bebc00f481da4c3b8ccfa884cb36faef
commit: e2c5d928bebc00f481da4c3b8ccfa884cb36faef net: stmmac: Fix E2E delay mechanism
date:   4 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260727/202607270831.Vtbf2KFv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607270831.Vtbf2KFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607270831.Vtbf2KFv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_hwtstamp_set':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:759:40: error: 'struct plat_stmmacenet_data' has no member named 'has_xgmac'
     759 |                             !priv->plat->has_xgmac)
         |                                        ^~


vim +759 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

   630	
   631	/**
   632	 *  stmmac_hwtstamp_set - control hardware timestamping.
   633	 *  @dev: device pointer.
   634	 *  @config: the timestamping configuration.
   635	 *  @extack: netlink extended ack structure for error reporting.
   636	 *  Description:
   637	 *  This function configures the MAC to enable/disable both outgoing(TX)
   638	 *  and incoming(RX) packets time stamping based on user input.
   639	 *  Return Value:
   640	 *  0 on success and an appropriate -ve integer on failure.
   641	 */
   642	static int stmmac_hwtstamp_set(struct net_device *dev,
   643				       struct kernel_hwtstamp_config *config,
   644				       struct netlink_ext_ack *extack)
   645	{
   646		struct stmmac_priv *priv = netdev_priv(dev);
   647		u32 ptp_v2 = 0;
   648		u32 tstamp_all = 0;
   649		u32 ptp_over_ipv4_udp = 0;
   650		u32 ptp_over_ipv6_udp = 0;
   651		u32 ptp_over_ethernet = 0;
   652		u32 snap_type_sel = 0;
   653		u32 ts_master_en = 0;
   654		u32 ts_event_en = 0;
   655	
   656		if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
   657			NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
   658			priv->hwts_tx_en = 0;
   659			priv->hwts_rx_en = 0;
   660	
   661			return -EOPNOTSUPP;
   662		}
   663	
   664		if (!netif_running(dev)) {
   665			NL_SET_ERR_MSG_MOD(extack,
   666					   "Cannot change timestamping configuration while down");
   667			return -ENODEV;
   668		}
   669	
   670		netdev_dbg(priv->dev, "%s config flags:0x%x, tx_type:0x%x, rx_filter:0x%x\n",
   671			   __func__, config->flags, config->tx_type, config->rx_filter);
   672	
   673		if (config->tx_type != HWTSTAMP_TX_OFF &&
   674		    config->tx_type != HWTSTAMP_TX_ON)
   675			return -ERANGE;
   676	
   677		if (priv->adv_ts) {
   678			switch (config->rx_filter) {
   679			case HWTSTAMP_FILTER_NONE:
   680				/* time stamp no incoming packet at all */
   681				config->rx_filter = HWTSTAMP_FILTER_NONE;
   682				break;
   683	
   684			case HWTSTAMP_FILTER_PTP_V1_L4_EVENT:
   685				/* PTP v1, UDP, any kind of event packet */
   686				config->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
   687				/* 'xmac' hardware can support Sync, Pdelay_Req and
   688				 * Pdelay_resp by setting bit14 and bits17/16 to 01
   689				 * This leaves Delay_Req timestamps out.
   690				 * Enable all events *and* general purpose message
   691				 * timestamping
   692				 */
   693				snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
   694				ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
   695				ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
   696				break;
   697	
   698			case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
   699				/* PTP v1, UDP, Sync packet */
   700				config->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_SYNC;
   701				/* take time stamp for SYNC messages only */
   702				ts_event_en = PTP_TCR_TSEVNTENA;
   703	
   704				ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
   705				ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
   706				break;
   707	
   708			case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
   709				/* PTP v1, UDP, Delay_req packet */
   710				config->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ;
   711				/* take time stamp for Delay_Req messages only */
   712				ts_master_en = PTP_TCR_TSMSTRENA;
   713				ts_event_en = PTP_TCR_TSEVNTENA;
   714	
   715				ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
   716				ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
   717				break;
   718	
   719			case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
   720				/* PTP v2, UDP, any kind of event packet */
   721				config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_EVENT;
   722				ptp_v2 = PTP_TCR_TSVER2ENA;
   723				/* take time stamp for all event messages */
   724				snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
   725	
   726				ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
   727				ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
   728				break;
   729	
   730			case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
   731				/* PTP v2, UDP, Sync packet */
   732				config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_SYNC;
   733				ptp_v2 = PTP_TCR_TSVER2ENA;
   734				/* take time stamp for SYNC messages only */
   735				ts_event_en = PTP_TCR_TSEVNTENA;
   736	
   737				ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
   738				ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
   739				break;
   740	
   741			case HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ:
   742				/* PTP v2, UDP, Delay_req packet */
   743				config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ;
   744				ptp_v2 = PTP_TCR_TSVER2ENA;
   745				/* take time stamp for Delay_Req messages only */
   746				ts_master_en = PTP_TCR_TSMSTRENA;
   747				ts_event_en = PTP_TCR_TSEVNTENA;
   748	
   749				ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
   750				ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
   751				break;
   752	
   753			case HWTSTAMP_FILTER_PTP_V2_EVENT:
   754				/* PTP v2/802.AS1 any layer, any kind of event packet */
   755				config->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
   756				ptp_v2 = PTP_TCR_TSVER2ENA;
   757				snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
   758				if (priv->synopsys_id < DWMAC_CORE_3_70 &&
 > 759				    !priv->plat->has_xgmac)
   760					ts_event_en = PTP_TCR_TSEVNTENA;
   761				ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
   762				ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
   763				ptp_over_ethernet = PTP_TCR_TSIPENA;
   764				break;
   765	
   766			case HWTSTAMP_FILTER_PTP_V2_SYNC:
   767				/* PTP v2/802.AS1, any layer, Sync packet */
   768				config->rx_filter = HWTSTAMP_FILTER_PTP_V2_SYNC;
   769				ptp_v2 = PTP_TCR_TSVER2ENA;
   770				/* take time stamp for SYNC messages only */
   771				ts_event_en = PTP_TCR_TSEVNTENA;
   772	
   773				ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
   774				ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
   775				ptp_over_ethernet = PTP_TCR_TSIPENA;
   776				break;
   777	
   778			case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
   779				/* PTP v2/802.AS1, any layer, Delay_req packet */
   780				config->rx_filter = HWTSTAMP_FILTER_PTP_V2_DELAY_REQ;
   781				ptp_v2 = PTP_TCR_TSVER2ENA;
   782				/* take time stamp for Delay_Req messages only */
   783				ts_master_en = PTP_TCR_TSMSTRENA;
   784				ts_event_en = PTP_TCR_TSEVNTENA;
   785	
   786				ptp_over_ipv4_udp = PTP_TCR_TSIPV4ENA;
   787				ptp_over_ipv6_udp = PTP_TCR_TSIPV6ENA;
   788				ptp_over_ethernet = PTP_TCR_TSIPENA;
   789				break;
   790	
   791			case HWTSTAMP_FILTER_NTP_ALL:
   792			case HWTSTAMP_FILTER_ALL:
   793				/* time stamp any incoming packet */
   794				config->rx_filter = HWTSTAMP_FILTER_ALL;
   795				tstamp_all = PTP_TCR_TSENALL;
   796				break;
   797	
   798			default:
   799				return -ERANGE;
   800			}
   801		} else {
   802			switch (config->rx_filter) {
   803			case HWTSTAMP_FILTER_NONE:
   804				config->rx_filter = HWTSTAMP_FILTER_NONE;
   805				break;
   806			default:
   807				/* PTP v1, UDP, any kind of event packet */
   808				config->rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
   809				break;
   810			}
   811		}
   812		priv->hwts_rx_en = config->rx_filter != HWTSTAMP_FILTER_NONE;
   813		priv->hwts_tx_en = config->tx_type == HWTSTAMP_TX_ON;
   814	
   815		priv->systime_flags = STMMAC_HWTS_ACTIVE;
   816		if (!priv->tsfupdt_coarse)
   817			priv->systime_flags |= PTP_TCR_TSCFUPDT;
   818	
   819		if (priv->hwts_tx_en || priv->hwts_rx_en) {
   820			priv->systime_flags |= tstamp_all | ptp_v2 |
   821					       ptp_over_ethernet | ptp_over_ipv6_udp |
   822					       ptp_over_ipv4_udp | ts_event_en |
   823					       ts_master_en | snap_type_sel;
   824		}
   825	
   826		stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
   827	
   828		priv->tstamp_config = *config;
   829	
   830		return 0;
   831	}
   832	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
