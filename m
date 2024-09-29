Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C74B566A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 01:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727572030; cv=none; b=CX/VXYstq94lNQEmVJqwV4MAEj2+WDSLNbYJcGe97ZiBq2trfooxiLVOgJktc0vfsI3/Ok+IS/tHpRwAuIXulpicbeCkY6M9GYGFD93Z4ejCn2zgMSBTGIP7MLUHm6DOHvtfH6mq6T/jQGi4/NsRCt0ljvjlCN927hA8Vg60pwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727572030; c=relaxed/simple;
	bh=cHSkXuKoIN3mF0ScPQXh1MVltu8mFtWRQkkrNBNchUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FPraZhq6F5MUbaZ9VdKxF/3oqh7hh2zHJSBPiMELhXnzNLDpp4h17o1eIBEGQuQEHt7EhNxeD1jbUtyfRLMT2I9u1iVglJ8eUOuLegmIZj0IjxCRlGgcPCj7fO7eTmUOsOjEPhVJ7YrrzLiX/AQ5ihdLnMf/wQ43RTGUglxXSjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GifJg2+8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GifJg2+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727572029; x=1759108029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cHSkXuKoIN3mF0ScPQXh1MVltu8mFtWRQkkrNBNchUw=;
  b=GifJg2+8RoQ5tzrE8XHk8QdBSNz/dHuCdBV4irE3r78JWmDglU1tAlr4
   O9/wP36cYPYRxemZf6CTqJocwqc1ssfg5nBKKWe69YnCk944skT2arelX
   jlAckYzpiy1omxJKkkoiAEjel2vQ+UP7VPnj52IMtcrinnMh8UDqRGUZq
   xWK/zhpS/Ci12pgwKIprL66RuE4CZbPXT6bAva5netMjtoYqIPc2/kX5j
   moce7lp+XiKXhR9hJZDk/xILgpbmlFlPsCMIriCv0XsGDNCY3x6Dfd3vG
   0/XscEQjxrq3Ggi7MHu7Qs2i30BaNDIzPAJe+0CXoD1R8gmuIDeJd/p/4
   A==;
X-CSE-ConnectionGUID: LRaquzFeSiqeTTwZ03fx+w==
X-CSE-MsgGUID: ozrtJziRS+qbdhHShENVEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26862938"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26862938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 18:07:08 -0700
X-CSE-ConnectionGUID: yHYzmPtAQzmgARsd1IsCPA==
X-CSE-MsgGUID: WXwytLm9Q0e885teQNql7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72487319"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 18:07:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suiOu-000NnP-2H;
	Sun, 29 Sep 2024 01:07:04 +0000
Date: Sun, 29 Sep 2024 09:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 572/1001]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:724:31: warning: cast to
 pointer from integer of different size
Message-ID: <202409290908.xIPS08JW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 26eb9e9afad9c46a6d22072ab2b4f22a3b52613b [572/1001] net: axienet: Add support for 1588
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240929/202409290908.xIPS08JW-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290908.xIPS08JW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290908.xIPS08JW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_tx_hwtstamp':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:724:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     724 |                 skb_hwtstamps((struct sk_buff *)cur_p->ptp_tx_skb);
         |                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:786:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     786 |                 skb_pull((struct sk_buff *)cur_p->ptp_tx_skb,
         |                          ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:789:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     789 |         skb_tstamp_tx((struct sk_buff *)cur_p->ptp_tx_skb, shhwtstamps);
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:790:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     790 |         dev_kfree_skb_any((struct sk_buff *)cur_p->ptp_tx_skb);
         |                           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_start_xmit':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1121:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1121 |                                 cur_p->ptp_tx_skb = (phys_addr_t)skb_get(skb);
         |                                                     ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1190:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1190 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_dma_err_handler':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2409:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2409 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^


vim +724 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

   707	
   708	#ifdef CONFIG_XILINX_AXI_EMAC_HWTSTAMP
   709	/**
   710	 * axienet_tx_hwtstamp - Read tx timestamp from hw and update it to the skbuff
   711	 * @lp:		Pointer to axienet local structure
   712	 * @cur_p:	Pointer to the axi_dma current bd
   713	 *
   714	 * Return:	None.
   715	 */
   716	static void axienet_tx_hwtstamp(struct axienet_local *lp,
   717					struct axidma_bd *cur_p)
   718	{
   719		u32 sec = 0, nsec = 0, val;
   720		u64 time64;
   721		int err = 0;
   722		u32 count, len = lp->axienet_config->tx_ptplen;
   723		struct skb_shared_hwtstamps *shhwtstamps =
 > 724			skb_hwtstamps((struct sk_buff *)cur_p->ptp_tx_skb);
   725	
   726		val = axienet_txts_ior(lp, XAXIFIFO_TXTS_ISR);
   727		if (unlikely(!(val & XAXIFIFO_TXTS_INT_RC_MASK)))
   728			dev_info(lp->dev, "Did't get FIFO tx interrupt %d\n", val);
   729	
   730		/* Ensure to read Occupany register before accessing Length register */
   731		if (!axienet_txts_ior(lp, XAXIFIFO_TXTS_RFO)) {
   732			netdev_err(lp->ndev, "%s: TX Timestamp FIFO is empty", __func__);
   733			goto skb_exit;
   734		}
   735	
   736		/* If FIFO is configured in cut through Mode we will get Rx complete
   737		 * interrupt even one byte is there in the fifo wait for the full packet
   738		 */
   739		err = readl_poll_timeout_atomic(lp->tx_ts_regs + XAXIFIFO_TXTS_RLR, val,
   740						((val & XAXIFIFO_TXTS_RXFD_MASK) >=
   741						len), 0, 1000000);
   742		if (err) {
   743			netdev_err(lp->ndev, "%s: Didn't get the full timestamp packet",
   744				   __func__);
   745			goto skb_exit;
   746		}
   747	
   748		nsec = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   749		sec  = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   750		val = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   751		val = ((val & XAXIFIFO_TXTS_TAG_MASK) >> XAXIFIFO_TXTS_TAG_SHIFT);
   752		dev_dbg(lp->dev, "tx_stamp:[%04x] %04x %u %9u\n",
   753			cur_p->ptp_tx_ts_tag, val, sec, nsec);
   754	
   755		if (val != cur_p->ptp_tx_ts_tag) {
   756			count = axienet_txts_ior(lp, XAXIFIFO_TXTS_RFO);
   757			while (count) {
   758				nsec = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   759				sec  = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   760				val = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   761				val = ((val & XAXIFIFO_TXTS_TAG_MASK) >>
   762					XAXIFIFO_TXTS_TAG_SHIFT);
   763	
   764				dev_dbg(lp->dev, "tx_stamp:[%04x] %04x %u %9u\n",
   765					cur_p->ptp_tx_ts_tag, val, sec, nsec);
   766				if (val == cur_p->ptp_tx_ts_tag)
   767					break;
   768				count = axienet_txts_ior(lp, XAXIFIFO_TXTS_RFO);
   769			}
   770			if (val != cur_p->ptp_tx_ts_tag) {
   771				dev_info(lp->dev, "Mismatching 2-step tag. Got %x",
   772					 val);
   773				dev_info(lp->dev, "Expected %x\n",
   774					 cur_p->ptp_tx_ts_tag);
   775			}
   776		}
   777	
   778		if (lp->axienet_config->mactype != XAXIENET_10G_25G)
   779			val = axienet_txts_ior(lp, XAXIFIFO_TXTS_RXFD);
   780	
   781	skb_exit:
   782		time64 = sec * NS_PER_SEC + nsec;
   783		memset(shhwtstamps, 0, sizeof(struct skb_shared_hwtstamps));
   784		shhwtstamps->hwtstamp = ns_to_ktime(time64);
   785		if (lp->axienet_config->mactype != XAXIENET_10G_25G)
   786			skb_pull((struct sk_buff *)cur_p->ptp_tx_skb,
   787				 AXIENET_TS_HEADER_LEN);
   788	
   789		skb_tstamp_tx((struct sk_buff *)cur_p->ptp_tx_skb, shhwtstamps);
   790		dev_kfree_skb_any((struct sk_buff *)cur_p->ptp_tx_skb);
   791		cur_p->ptp_tx_skb = 0;
   792	}
   793	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
