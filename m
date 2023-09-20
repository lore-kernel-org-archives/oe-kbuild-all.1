Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EFA41200
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 20:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695240072; x=1726776072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hgf8mlIeG943OnKxgsr92EWCC+aiPFnq9FwDaYJ6LGE=;
  b=O00X2Iep31HkIdwZFZMPIS2V6kwHBRnnscRBTfLKZOnuwzUnlpNdVg9H
   Av7wxjserT4H+DJXC4Q2GVhbgbHbEY21+aJWe4dRp9Kb0xA/PyMaKKi6W
   GtrPQLcOo2rNAnohLBxPrTtaMYE93zppEDCfMQq68gANmFc39tdDPXB/i
   qTZhiwEp7i0QMbW5qFrJ7/j5v1GGFUwpewskX9gurL7ouvkvM1+HDWFmv
   PUgfaIP3ZfAe73YzpcgpKHktrM/PRglUPUqj1iNy0ovzNJN0lMt0eaTmU
   ehBn/aVGeH1b9AwO4NEpkEChiKnYZncafL4PIBD5LM8TETkpOnTDC9gNz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384161990"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="384161990"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 13:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862133056"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="862133056"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2023 13:01:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj3Nj-00095k-1b;
	Wed, 20 Sep 2023 20:01:07 +0000
Date: Thu, 21 Sep 2023 04:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 769/1365]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:705:31: warning: cast to
 pointer from integer of different size
Message-ID: <202309210320.Jv36HaLI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: 6e5e2904207eff583b017a2eb3dff5cbde8c54b6 [769/1365] net: axienet: Add support for 1588
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309210320.Jv36HaLI-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210320.Jv36HaLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210320.Jv36HaLI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_tx_hwtstamp':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:705:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     705 |                 skb_hwtstamps((struct sk_buff *)cur_p->ptp_tx_skb);
         |                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:767:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     767 |                 skb_pull((struct sk_buff *)cur_p->ptp_tx_skb,
         |                          ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:770:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     770 |         skb_tstamp_tx((struct sk_buff *)cur_p->ptp_tx_skb, shhwtstamps);
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:771:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     771 |         dev_kfree_skb_any((struct sk_buff *)cur_p->ptp_tx_skb);
         |                           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_start_xmit':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1102:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1102 |                                 cur_p->ptp_tx_skb = (phys_addr_t)skb_get(skb);
         |                                                     ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1171:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1171 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_dma_err_handler':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2367:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2367 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^


vim +705 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

   688	
   689	#ifdef CONFIG_XILINX_AXI_EMAC_HWTSTAMP
   690	/**
   691	 * axienet_tx_hwtstamp - Read tx timestamp from hw and update it to the skbuff
   692	 * @lp:		Pointer to axienet local structure
   693	 * @cur_p:	Pointer to the axi_dma current bd
   694	 *
   695	 * Return:	None.
   696	 */
   697	static void axienet_tx_hwtstamp(struct axienet_local *lp,
   698					struct axidma_bd *cur_p)
   699	{
   700		u32 sec = 0, nsec = 0, val;
   701		u64 time64;
   702		int err = 0;
   703		u32 count, len = lp->axienet_config->tx_ptplen;
   704		struct skb_shared_hwtstamps *shhwtstamps =
 > 705			skb_hwtstamps((struct sk_buff *)cur_p->ptp_tx_skb);
   706	
   707		val = axienet_txts_ior(lp, XAXIFIFO_TXTS_ISR);
   708		if (unlikely(!(val & XAXIFIFO_TXTS_INT_RC_MASK)))
   709			dev_info(lp->dev, "Did't get FIFO tx interrupt %d\n", val);
   710	
   711		/* Ensure to read Occupany register before accessing Length register */
   712		if (!axienet_txts_ior(lp, XAXIFIFO_TXTS_RFO)) {
   713			netdev_err(lp->ndev, "%s: TX Timestamp FIFO is empty", __func__);
   714			goto skb_exit;
   715		}
   716	
   717		/* If FIFO is configured in cut through Mode we will get Rx complete
   718		 * interrupt even one byte is there in the fifo wait for the full packet
   719		 */
   720		err = readl_poll_timeout_atomic(lp->tx_ts_regs + XAXIFIFO_TXTS_RLR, val,
   721						((val & XAXIFIFO_TXTS_RXFD_MASK) >=
   722						len), 0, 1000000);
   723		if (err) {
   724			netdev_err(lp->ndev, "%s: Didn't get the full timestamp packet",
   725				   __func__);
   726			goto skb_exit;
   727		}
   728	
   729		nsec = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   730		sec  = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   731		val = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   732		val = ((val & XAXIFIFO_TXTS_TAG_MASK) >> XAXIFIFO_TXTS_TAG_SHIFT);
   733		dev_dbg(lp->dev, "tx_stamp:[%04x] %04x %u %9u\n",
   734			cur_p->ptp_tx_ts_tag, val, sec, nsec);
   735	
   736		if (val != cur_p->ptp_tx_ts_tag) {
   737			count = axienet_txts_ior(lp, XAXIFIFO_TXTS_RFO);
   738			while (count) {
   739				nsec = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   740				sec  = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   741				val = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   742				val = ((val & XAXIFIFO_TXTS_TAG_MASK) >>
   743					XAXIFIFO_TXTS_TAG_SHIFT);
   744	
   745				dev_dbg(lp->dev, "tx_stamp:[%04x] %04x %u %9u\n",
   746					cur_p->ptp_tx_ts_tag, val, sec, nsec);
   747				if (val == cur_p->ptp_tx_ts_tag)
   748					break;
   749				count = axienet_txts_ior(lp, XAXIFIFO_TXTS_RFO);
   750			}
   751			if (val != cur_p->ptp_tx_ts_tag) {
   752				dev_info(lp->dev, "Mismatching 2-step tag. Got %x",
   753					 val);
   754				dev_info(lp->dev, "Expected %x\n",
   755					 cur_p->ptp_tx_ts_tag);
   756			}
   757		}
   758	
   759		if (lp->axienet_config->mactype != XAXIENET_10G_25G)
   760			val = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   761	
   762	skb_exit:
   763		time64 = sec * NS_PER_SEC + nsec;
   764		memset(shhwtstamps, 0, sizeof(struct skb_shared_hwtstamps));
   765		shhwtstamps->hwtstamp = ns_to_ktime(time64);
   766		if (lp->axienet_config->mactype != XAXIENET_10G_25G)
   767			skb_pull((struct sk_buff *)cur_p->ptp_tx_skb,
   768				 AXIENET_TS_HEADER_LEN);
   769	
   770		skb_tstamp_tx((struct sk_buff *)cur_p->ptp_tx_skb, shhwtstamps);
   771		dev_kfree_skb_any((struct sk_buff *)cur_p->ptp_tx_skb);
   772		cur_p->ptp_tx_skb = 0;
   773	}
   774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
