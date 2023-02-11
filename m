Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2C02F41
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676124433; x=1707660433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmUwVqV+2AsqPZ0vF0lw6g+OKgZhzx69psqnt6nceb0=;
  b=DTvfnZRsXoHp2r57f88WwzlBn3LLABTLrAspKtjsxBqgkB2gO1Q2lj+3
   SvVpcfyLtkpKsdbuJluNpZF3CxBC7jU+3LaX8AFtLNTBVvW01pFtnfdVP
   jsk5qC32EB835CiE2Dc7BMl6/Q9VzjzMDCXLYSdcJrr2aI+ynvQge3GzN
   VFHeYH1/NWaD722G3TPD3LaWudANF/wvcA2Qhqe55a86253KATB68n/4z
   7W8oO+lopnxQ5wsIWXaUMHzRLkA59WuRc6LU3Sr76WUuZX/zjGzRjxecq
   vW1NiLndme8D9V8ViSCQSWOVl082qdYoRz553dpZ7sO2tGbcq0Em3eWXM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="318630333"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="318630333"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 06:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="737020698"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="737020698"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Feb 2023 06:07:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQqX0-0006Yv-2l;
	Sat, 11 Feb 2023 14:07:10 +0000
Date: Sat, 11 Feb 2023 22:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5958/12152]
 drivers/net/ethernet/mscc/ocelot_stats.c:534: undefined reference to
 `ethtool_aggregate_pause_stats'
Message-ID: <202302112118.N0NyxX8M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba8a227fd19d19779005fb66ad7562608e1df83
commit: ab3f97a9610a8d90dc9934517e82c3272d4e98a0 [5958/12152] net: mscc: ocelot: export ethtool MAC Merge stats for Felix VSC9959
config: arm64-randconfig-r035-20230210 (https://download.01.org/0day-ci/archive/20230211/202302112118.N0NyxX8M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ab3f97a9610a8d90dc9934517e82c3272d4e98a0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ab3f97a9610a8d90dc9934517e82c3272d4e98a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302112118.N0NyxX8M-lkp@intel.com/

Note: the linux-next/master HEAD 6ba8a227fd19d19779005fb66ad7562608e1df83 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_pause_stats':
>> drivers/net/ethernet/mscc/ocelot_stats.c:534: undefined reference to `ethtool_aggregate_pause_stats'
   drivers/net/ethernet/mscc/ocelot_stats.c:534:(.text+0x7fc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `ethtool_aggregate_pause_stats'
   aarch64-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_rmon_stats':
>> drivers/net/ethernet/mscc/ocelot_stats.c:636: undefined reference to `ethtool_aggregate_rmon_stats'
   drivers/net/ethernet/mscc/ocelot_stats.c:636:(.text+0xa04): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `ethtool_aggregate_rmon_stats'
   aarch64-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_eth_ctrl_stats':
>> drivers/net/ethernet/mscc/ocelot_stats.c:676: undefined reference to `ethtool_aggregate_ctrl_stats'
   drivers/net/ethernet/mscc/ocelot_stats.c:676:(.text+0xb4c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `ethtool_aggregate_ctrl_stats'
   aarch64-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_eth_mac_stats':
>> drivers/net/ethernet/mscc/ocelot_stats.c:775: undefined reference to `ethtool_aggregate_mac_stats'
   drivers/net/ethernet/mscc/ocelot_stats.c:775:(.text+0xc7c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `ethtool_aggregate_mac_stats'
   aarch64-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_eth_phy_stats':
>> drivers/net/ethernet/mscc/ocelot_stats.c:815: undefined reference to `ethtool_aggregate_phy_stats'
   drivers/net/ethernet/mscc/ocelot_stats.c:815:(.text+0xdbc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `ethtool_aggregate_phy_stats'


vim +534 drivers/net/ethernet/mscc/ocelot_stats.c

   516	
   517	void ocelot_port_get_pause_stats(struct ocelot *ocelot, int port,
   518					 struct ethtool_pause_stats *pause_stats)
   519	{
   520		struct net_device *dev;
   521	
   522		switch (pause_stats->src) {
   523		case ETHTOOL_MAC_STATS_SRC_EMAC:
   524			ocelot_port_stats_run(ocelot, port, pause_stats,
   525					      ocelot_port_pause_stats_cb);
   526			break;
   527		case ETHTOOL_MAC_STATS_SRC_PMAC:
   528			if (ocelot->mm_supported)
   529				ocelot_port_stats_run(ocelot, port, pause_stats,
   530						      ocelot_port_pmac_pause_stats_cb);
   531			break;
   532		case ETHTOOL_MAC_STATS_SRC_AGGREGATE:
   533			dev = ocelot->ops->port_to_netdev(ocelot, port);
 > 534			ethtool_aggregate_pause_stats(dev, pause_stats);
   535			break;
   536		}
   537	}
   538	EXPORT_SYMBOL_GPL(ocelot_port_get_pause_stats);
   539	
   540	void ocelot_port_get_mm_stats(struct ocelot *ocelot, int port,
   541				      struct ethtool_mm_stats *stats)
   542	{
   543		if (!ocelot->mm_supported)
   544			return;
   545	
   546		ocelot_port_stats_run(ocelot, port, stats, ocelot_port_mm_stats_cb);
   547	}
   548	EXPORT_SYMBOL_GPL(ocelot_port_get_mm_stats);
   549	
   550	static const struct ethtool_rmon_hist_range ocelot_rmon_ranges[] = {
   551		{   64,    64 },
   552		{   65,   127 },
   553		{  128,   255 },
   554		{  256,   511 },
   555		{  512,  1023 },
   556		{ 1024,  1526 },
   557		{ 1527, 65535 },
   558		{},
   559	};
   560	
   561	static void ocelot_port_rmon_stats_cb(struct ocelot *ocelot, int port, void *priv)
   562	{
   563		u64 *s = &ocelot->stats[port * OCELOT_NUM_STATS];
   564		struct ethtool_rmon_stats *rmon_stats = priv;
   565	
   566		rmon_stats->undersize_pkts = s[OCELOT_STAT_RX_SHORTS];
   567		rmon_stats->oversize_pkts = s[OCELOT_STAT_RX_LONGS];
   568		rmon_stats->fragments = s[OCELOT_STAT_RX_FRAGMENTS];
   569		rmon_stats->jabbers = s[OCELOT_STAT_RX_JABBERS];
   570	
   571		rmon_stats->hist[0] = s[OCELOT_STAT_RX_64];
   572		rmon_stats->hist[1] = s[OCELOT_STAT_RX_65_127];
   573		rmon_stats->hist[2] = s[OCELOT_STAT_RX_128_255];
   574		rmon_stats->hist[3] = s[OCELOT_STAT_RX_256_511];
   575		rmon_stats->hist[4] = s[OCELOT_STAT_RX_512_1023];
   576		rmon_stats->hist[5] = s[OCELOT_STAT_RX_1024_1526];
   577		rmon_stats->hist[6] = s[OCELOT_STAT_RX_1527_MAX];
   578	
   579		rmon_stats->hist_tx[0] = s[OCELOT_STAT_TX_64];
   580		rmon_stats->hist_tx[1] = s[OCELOT_STAT_TX_65_127];
   581		rmon_stats->hist_tx[2] = s[OCELOT_STAT_TX_128_255];
   582		rmon_stats->hist_tx[3] = s[OCELOT_STAT_TX_128_255];
   583		rmon_stats->hist_tx[4] = s[OCELOT_STAT_TX_256_511];
   584		rmon_stats->hist_tx[5] = s[OCELOT_STAT_TX_512_1023];
   585		rmon_stats->hist_tx[6] = s[OCELOT_STAT_TX_1024_1526];
   586	}
   587	
   588	static void ocelot_port_pmac_rmon_stats_cb(struct ocelot *ocelot, int port,
   589						   void *priv)
   590	{
   591		u64 *s = &ocelot->stats[port * OCELOT_NUM_STATS];
   592		struct ethtool_rmon_stats *rmon_stats = priv;
   593	
   594		rmon_stats->undersize_pkts = s[OCELOT_STAT_RX_PMAC_SHORTS];
   595		rmon_stats->oversize_pkts = s[OCELOT_STAT_RX_PMAC_LONGS];
   596		rmon_stats->fragments = s[OCELOT_STAT_RX_PMAC_FRAGMENTS];
   597		rmon_stats->jabbers = s[OCELOT_STAT_RX_PMAC_JABBERS];
   598	
   599		rmon_stats->hist[0] = s[OCELOT_STAT_RX_PMAC_64];
   600		rmon_stats->hist[1] = s[OCELOT_STAT_RX_PMAC_65_127];
   601		rmon_stats->hist[2] = s[OCELOT_STAT_RX_PMAC_128_255];
   602		rmon_stats->hist[3] = s[OCELOT_STAT_RX_PMAC_256_511];
   603		rmon_stats->hist[4] = s[OCELOT_STAT_RX_PMAC_512_1023];
   604		rmon_stats->hist[5] = s[OCELOT_STAT_RX_PMAC_1024_1526];
   605		rmon_stats->hist[6] = s[OCELOT_STAT_RX_PMAC_1527_MAX];
   606	
   607		rmon_stats->hist_tx[0] = s[OCELOT_STAT_TX_PMAC_64];
   608		rmon_stats->hist_tx[1] = s[OCELOT_STAT_TX_PMAC_65_127];
   609		rmon_stats->hist_tx[2] = s[OCELOT_STAT_TX_PMAC_128_255];
   610		rmon_stats->hist_tx[3] = s[OCELOT_STAT_TX_PMAC_128_255];
   611		rmon_stats->hist_tx[4] = s[OCELOT_STAT_TX_PMAC_256_511];
   612		rmon_stats->hist_tx[5] = s[OCELOT_STAT_TX_PMAC_512_1023];
   613		rmon_stats->hist_tx[6] = s[OCELOT_STAT_TX_PMAC_1024_1526];
   614	}
   615	
   616	void ocelot_port_get_rmon_stats(struct ocelot *ocelot, int port,
   617					struct ethtool_rmon_stats *rmon_stats,
   618					const struct ethtool_rmon_hist_range **ranges)
   619	{
   620		struct net_device *dev;
   621	
   622		*ranges = ocelot_rmon_ranges;
   623	
   624		switch (rmon_stats->src) {
   625		case ETHTOOL_MAC_STATS_SRC_EMAC:
   626			ocelot_port_stats_run(ocelot, port, rmon_stats,
   627					      ocelot_port_rmon_stats_cb);
   628			break;
   629		case ETHTOOL_MAC_STATS_SRC_PMAC:
   630			if (ocelot->mm_supported)
   631				ocelot_port_stats_run(ocelot, port, rmon_stats,
   632						      ocelot_port_pmac_rmon_stats_cb);
   633			break;
   634		case ETHTOOL_MAC_STATS_SRC_AGGREGATE:
   635			dev = ocelot->ops->port_to_netdev(ocelot, port);
 > 636			ethtool_aggregate_rmon_stats(dev, rmon_stats);
   637			break;
   638		}
   639	}
   640	EXPORT_SYMBOL_GPL(ocelot_port_get_rmon_stats);
   641	
   642	static void ocelot_port_ctrl_stats_cb(struct ocelot *ocelot, int port, void *priv)
   643	{
   644		u64 *s = &ocelot->stats[port * OCELOT_NUM_STATS];
   645		struct ethtool_eth_ctrl_stats *ctrl_stats = priv;
   646	
   647		ctrl_stats->MACControlFramesReceived = s[OCELOT_STAT_RX_CONTROL];
   648	}
   649	
   650	static void ocelot_port_pmac_ctrl_stats_cb(struct ocelot *ocelot, int port,
   651						   void *priv)
   652	{
   653		u64 *s = &ocelot->stats[port * OCELOT_NUM_STATS];
   654		struct ethtool_eth_ctrl_stats *ctrl_stats = priv;
   655	
   656		ctrl_stats->MACControlFramesReceived = s[OCELOT_STAT_RX_PMAC_CONTROL];
   657	}
   658	
   659	void ocelot_port_get_eth_ctrl_stats(struct ocelot *ocelot, int port,
   660					    struct ethtool_eth_ctrl_stats *ctrl_stats)
   661	{
   662		struct net_device *dev;
   663	
   664		switch (ctrl_stats->src) {
   665		case ETHTOOL_MAC_STATS_SRC_EMAC:
   666			ocelot_port_stats_run(ocelot, port, ctrl_stats,
   667					      ocelot_port_ctrl_stats_cb);
   668			break;
   669		case ETHTOOL_MAC_STATS_SRC_PMAC:
   670			if (ocelot->mm_supported)
   671				ocelot_port_stats_run(ocelot, port, ctrl_stats,
   672						      ocelot_port_pmac_ctrl_stats_cb);
   673			break;
   674		case ETHTOOL_MAC_STATS_SRC_AGGREGATE:
   675			dev = ocelot->ops->port_to_netdev(ocelot, port);
 > 676			ethtool_aggregate_ctrl_stats(dev, ctrl_stats);
   677			break;
   678		}
   679	}
   680	EXPORT_SYMBOL_GPL(ocelot_port_get_eth_ctrl_stats);
   681	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
