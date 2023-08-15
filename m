Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21F1FA8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 03:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692071325; x=1723607325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kXXN30uR+cCHNxPjyF1LT52Knly4i39i453uuSma/XY=;
  b=ETiR83vIZJroppPZkHn9SH++uRkbNkfre+zE1x3hnV7c4b9RZetSCQsJ
   rZiqUBMl0YNY3nPVMQm14PwgxZHVeH4eb+3HelnYf3W/E5qHakHtXj/o9
   R4rMHs7Y6dll57CRNw1ekAHnFQSypVjzJ9Y3njfXuu2EfvzvZq4lPS3OZ
   wJqedK9JrZsqwQMwWWHJ5JJ70qOlBoypQuwh0bnY2Cn4X74q1cXvybsYZ
   Q7DfTXHZcfsML3sydy2PVNO3/73CJb5T80Honlw1J1gmZ3NsFJ/+kz1Tj
   qk/+bdzyOafK8Qej5IvMiv3gBQD2ILjiHtQf0byDykwBmMvKci1gzz7ww
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372191428"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="372191428"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 20:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980253316"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="980253316"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 20:48:42 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVl2w-0000dc-0Y;
	Tue, 15 Aug 2023 03:48:42 +0000
Date: Tue, 15 Aug 2023 11:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:net-queue 148/150]
 drivers/net/ethernet/freescale/fman/fman_memac.c:622:37: error: unknown type
 name 'phy_interface_mode_t'; did you mean 'phy_interface_t'?
Message-ID: <202308151137.HZ3zaCBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git net-queue
head:   03803420a3d37404e9c80180bc74ddd5dc8cc50d
commit: 2ccb88b541e048b419f12867bceef538cb343538 [148/150] net: fman: convert to .mac_get_caps()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230815/202308151137.HZ3zaCBJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151137.HZ3zaCBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151137.HZ3zaCBJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/fman/fman_memac.c:622:37: error: unknown type name 'phy_interface_mode_t'; did you mean 'phy_interface_t'?
     622 |                                     phy_interface_mode_t interface)
         |                                     ^~~~~~~~~~~~~~~~~~~~
         |                                     phy_interface_t
>> drivers/net/ethernet/freescale/fman/fman_memac.c:778:25: error: 'memac_get_caps' undeclared here (not in a function)
     778 |         .mac_get_caps = memac_get_caps,
         |                         ^~~~~~~~~~~~~~


vim +622 drivers/net/ethernet/freescale/fman/fman_memac.c

   620	
   621	static unsigned long memac_get_caps(struct phylink_config *config,
 > 622					    phy_interface_mode_t interface)
   623	{
   624		struct fman_mac *memac = fman_config_to_mac(config)->fman_mac;
   625		unsigned long caps = config->mac_capabilities;
   626	
   627		if (phy_interface_mode_is_rgmii(interface) &&
   628		    memac->rgmii_no_half_duplex)
   629			caps &= ~(MAC_10HD | MAC_100HD);
   630	
   631		return caps;
   632	}
   633	
   634	/**
   635	 * memac_if_mode() - Convert an interface mode into an IF_MODE config
   636	 * @interface: A phy interface mode
   637	 *
   638	 * Return: A configuration word, suitable for programming into the lower bits
   639	 *         of %IF_MODE.
   640	 */
   641	static u32 memac_if_mode(phy_interface_t interface)
   642	{
   643		switch (interface) {
   644		case PHY_INTERFACE_MODE_MII:
   645			return IF_MODE_MII;
   646		case PHY_INTERFACE_MODE_RGMII:
   647		case PHY_INTERFACE_MODE_RGMII_ID:
   648		case PHY_INTERFACE_MODE_RGMII_RXID:
   649		case PHY_INTERFACE_MODE_RGMII_TXID:
   650			return IF_MODE_GMII | IF_MODE_RGMII;
   651		case PHY_INTERFACE_MODE_SGMII:
   652		case PHY_INTERFACE_MODE_1000BASEX:
   653		case PHY_INTERFACE_MODE_QSGMII:
   654			return IF_MODE_GMII;
   655		case PHY_INTERFACE_MODE_10GBASER:
   656			return IF_MODE_10G;
   657		default:
   658			WARN_ON_ONCE(1);
   659			return 0;
   660		}
   661	}
   662	
   663	static struct phylink_pcs *memac_select_pcs(struct phylink_config *config,
   664						    phy_interface_t iface)
   665	{
   666		struct fman_mac *memac = fman_config_to_mac(config)->fman_mac;
   667	
   668		switch (iface) {
   669		case PHY_INTERFACE_MODE_SGMII:
   670		case PHY_INTERFACE_MODE_1000BASEX:
   671			return memac->sgmii_pcs;
   672		case PHY_INTERFACE_MODE_QSGMII:
   673			return memac->qsgmii_pcs;
   674		case PHY_INTERFACE_MODE_10GBASER:
   675			return memac->xfi_pcs;
   676		default:
   677			return NULL;
   678		}
   679	}
   680	
   681	static int memac_prepare(struct phylink_config *config, unsigned int mode,
   682				 phy_interface_t iface)
   683	{
   684		struct fman_mac *memac = fman_config_to_mac(config)->fman_mac;
   685	
   686		switch (iface) {
   687		case PHY_INTERFACE_MODE_SGMII:
   688		case PHY_INTERFACE_MODE_1000BASEX:
   689		case PHY_INTERFACE_MODE_QSGMII:
   690		case PHY_INTERFACE_MODE_10GBASER:
   691			return phy_set_mode_ext(memac->serdes, PHY_MODE_ETHERNET,
   692						iface);
   693		default:
   694			return 0;
   695		}
   696	}
   697	
   698	static void memac_mac_config(struct phylink_config *config, unsigned int mode,
   699				     const struct phylink_link_state *state)
   700	{
   701		struct mac_device *mac_dev = fman_config_to_mac(config);
   702		struct memac_regs __iomem *regs = mac_dev->fman_mac->regs;
   703		u32 tmp = ioread32be(&regs->if_mode);
   704	
   705		tmp &= ~(IF_MODE_MASK | IF_MODE_RGMII);
   706		tmp |= memac_if_mode(state->interface);
   707		if (phylink_autoneg_inband(mode))
   708			tmp |= IF_MODE_RGMII_AUTO;
   709		iowrite32be(tmp, &regs->if_mode);
   710	}
   711	
   712	static void memac_link_up(struct phylink_config *config, struct phy_device *phy,
   713				  unsigned int mode, phy_interface_t interface,
   714				  int speed, int duplex, bool tx_pause, bool rx_pause)
   715	{
   716		struct mac_device *mac_dev = fman_config_to_mac(config);
   717		struct fman_mac *memac = mac_dev->fman_mac;
   718		struct memac_regs __iomem *regs = memac->regs;
   719		u32 tmp = memac_if_mode(interface);
   720		u16 pause_time = tx_pause ? FSL_FM_PAUSE_TIME_ENABLE :
   721				 FSL_FM_PAUSE_TIME_DISABLE;
   722	
   723		memac_set_tx_pause_frames(memac, 0, pause_time, 0);
   724		memac_accept_rx_pause_frames(memac, rx_pause);
   725	
   726		if (duplex == DUPLEX_HALF)
   727			tmp |= IF_MODE_HD;
   728	
   729		switch (speed) {
   730		case SPEED_1000:
   731			tmp |= IF_MODE_RGMII_1000;
   732			break;
   733		case SPEED_100:
   734			tmp |= IF_MODE_RGMII_100;
   735			break;
   736		case SPEED_10:
   737			tmp |= IF_MODE_RGMII_10;
   738			break;
   739		}
   740		iowrite32be(tmp, &regs->if_mode);
   741	
   742		/* TODO: EEE? */
   743	
   744		if (speed == SPEED_10000) {
   745			if (memac->fm_rev_info.major == 6 &&
   746			    memac->fm_rev_info.minor == 4)
   747				tmp = TX_FIFO_SECTIONS_TX_AVAIL_SLOW_10G;
   748			else
   749				tmp = TX_FIFO_SECTIONS_TX_AVAIL_10G;
   750			tmp |= TX_FIFO_SECTIONS_TX_EMPTY_DEFAULT_10G;
   751		} else {
   752			tmp = TX_FIFO_SECTIONS_TX_AVAIL_1G |
   753			      TX_FIFO_SECTIONS_TX_EMPTY_DEFAULT_1G;
   754		}
   755		iowrite32be(tmp, &regs->tx_fifo_sections);
   756	
   757		mac_dev->update_speed(mac_dev, speed);
   758	
   759		tmp = ioread32be(&regs->command_config);
   760		tmp |= CMD_CFG_RX_EN | CMD_CFG_TX_EN;
   761		iowrite32be(tmp, &regs->command_config);
   762	}
   763	
   764	static void memac_link_down(struct phylink_config *config, unsigned int mode,
   765				    phy_interface_t interface)
   766	{
   767		struct fman_mac *memac = fman_config_to_mac(config)->fman_mac;
   768		struct memac_regs __iomem *regs = memac->regs;
   769		u32 tmp;
   770	
   771		/* TODO: graceful */
   772		tmp = ioread32be(&regs->command_config);
   773		tmp &= ~(CMD_CFG_RX_EN | CMD_CFG_TX_EN);
   774		iowrite32be(tmp, &regs->command_config);
   775	}
   776	
   777	static const struct phylink_mac_ops memac_mac_ops = {
 > 778		.mac_get_caps = memac_get_caps,
   779		.mac_select_pcs = memac_select_pcs,
   780		.mac_prepare = memac_prepare,
   781		.mac_config = memac_mac_config,
   782		.mac_link_up = memac_link_up,
   783		.mac_link_down = memac_link_down,
   784	};
   785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
