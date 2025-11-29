Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FCF3A1CD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 04:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764389933; cv=none; b=rg05563AndJih2d9yH/KL3NRtKSdijbdz3v7e04wBhKvNkvUl/MbNWxAg2LhJBVRxPwhBt5/nOjclxbsFTp8xtQF7sJi4DX5951MGVR7YjG1BvZ/yGQtbEJjJ/D5lq3qk25MHxLfQoKdodOH6LOa+2xR5YlxHGwgunYLgMSAoqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764389933; c=relaxed/simple;
	bh=hOOFqpkQjdvp+JjkuD/LXe8lrwv8nUPWT/SpUkZfRRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwEhGwf9J5GBKclm2nERM51XDXsknCQAG+mmbogStbAiU6aLVE+Ilq0QPzAEW00+trF36BDM/YEnAdb0l4MxwJ2vgSQDvtHSDpxEOmTDFhuMsfoy2DzKYz6k5CaggVXRc4gZpEyjAMvoyaT7jf9ibWqVd4Km53zq897ofMxeVL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSmxWLBK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSmxWLBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764389930; x=1795925930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hOOFqpkQjdvp+JjkuD/LXe8lrwv8nUPWT/SpUkZfRRM=;
  b=PSmxWLBKnx2ZUjTjkpAZVmaRjmQ4CkDyE46YxF0mzXKtUUoVKuhFEEmC
   g4XDfR0dUU27JeOrC466WloKDq1zFQYqNtHfVEJ1zcuUwefZjZ3QNylES
   9ql8ad4lIHmwmN81+n4hoWy4qW4wAonLlUlagNjkb9UgclLskiloELMu6
   hpNGVLlqgIW7bC13qXYd/XKoQ1X8y0gny8tnGpCZGrW/RrhlrWsnGjn2Y
   TDCYNyeE4Z8givyJsPbIRFo7JW7cCdPf7o2lSAyJ8v2g16TX0ThuMq1JL
   Xiivf7enKibHcTQcqdW1yW6e+e/UFaH1hBu0swZg4s0/XgoXAlnNGJOoW
   Q==;
X-CSE-ConnectionGUID: lMo1JxJQQ2OpQDu1Znp9cQ==
X-CSE-MsgGUID: UWZ26IaUQwm+TkbSD4wnqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="91880558"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="91880558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 20:18:50 -0800
X-CSE-ConnectionGUID: /5ZCQeuiT2SgEplbZWRVqg==
X-CSE-MsgGUID: M8NMEcc9RDmrigsfGS0BnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="198703790"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Nov 2025 20:18:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPCQ1-000000006x5-0nHf;
	Sat, 29 Nov 2025 04:18:45 +0000
Date: Sat, 29 Nov 2025 12:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>, Kees Cook <kees@kernel.org>
Subject: drivers/net/ethernet/microchip/enc28j60.c:1120:20: warning: stack
 frame size (8920) exceeds limit (8192) in 'enc28j60_irq'
Message-ID: <202511291220.iPdPZlZh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   19eef1d98eeda3745df35839190b7d4a4adea656
commit: 315ad8780a129e82e2c5c65ee6e970d91a577acb kbuild: Add AutoFDO support for Clang build
date:   1 year, 1 month ago
config: x86_64-randconfig-r122-20251129 (https://download.01.org/0day-ci/archive/20251129/202511291220.iPdPZlZh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291220.iPdPZlZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291220.iPdPZlZh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/microchip/enc28j60.c:20:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/ethernet/microchip/enc28j60.c:1120:20: warning: stack frame size (8920) exceeds limit (8192) in 'enc28j60_irq' [-Wframe-larger-than]
    1120 | static irqreturn_t enc28j60_irq(int irq, void *dev_id)
         |                    ^
   2 warnings generated.


vim +/enc28j60_irq +1120 drivers/net/ethernet/microchip/enc28j60.c

3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1119  
995585ecdf42c1 drivers/net/ethernet/microchip/enc28j60.c Philipp Rosenberger 2023-05-09 @1120  static irqreturn_t enc28j60_irq(int irq, void *dev_id)
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1121  {
995585ecdf42c1 drivers/net/ethernet/microchip/enc28j60.c Philipp Rosenberger 2023-05-09  1122  	struct enc28j60_net *priv = dev_id;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1123  	struct net_device *ndev = priv->netdev;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1124  	int intflags, loop;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1125  
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1126  	/* disable further interrupts */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1127  	locked_reg_bfclr(priv, EIE, EIE_INTIE);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1128  
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1129  	do {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1130  		loop = 0;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1131  		intflags = locked_regb_read(priv, EIR);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1132  		/* DMA interrupt handler (not currently used) */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1133  		if ((intflags & EIR_DMAIF) != 0) {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1134  			loop++;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1135  			if (netif_msg_intr(priv))
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1136  				netdev_printk(KERN_DEBUG, ndev, "intDMA(%d)\n",
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1137  					      loop);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1138  			locked_reg_bfclr(priv, EIR, EIR_DMAIF);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1139  		}
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1140  		/* LINK changed handler */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1141  		if ((intflags & EIR_LINKIF) != 0) {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1142  			loop++;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1143  			if (netif_msg_intr(priv))
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1144  				netdev_printk(KERN_DEBUG, ndev, "intLINK(%d)\n",
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1145  					      loop);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1146  			enc28j60_check_link_status(ndev);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1147  			/* read PHIR to clear the flag */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1148  			enc28j60_phy_read(priv, PHIR);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1149  		}
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1150  		/* TX complete handler */
373819ec391de0 drivers/net/ethernet/microchip/enc28j60.c Sergio Valverde     2016-07-01  1151  		if (((intflags & EIR_TXIF) != 0) &&
373819ec391de0 drivers/net/ethernet/microchip/enc28j60.c Sergio Valverde     2016-07-01  1152  		    ((intflags & EIR_TXERIF) == 0)) {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1153  			bool err = false;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1154  			loop++;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1155  			if (netif_msg_intr(priv))
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1156  				netdev_printk(KERN_DEBUG, ndev, "intTX(%d)\n",
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1157  					      loop);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1158  			priv->tx_retry_count = 0;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1159  			if (locked_regb_read(priv, ESTAT) & ESTAT_TXABRT) {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1160  				if (netif_msg_tx_err(priv))
35b60f37363b1a drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1161  					netdev_err(ndev, "Tx Error (aborted)\n");
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1162  				err = true;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1163  			}
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1164  			if (netif_msg_tx_done(priv)) {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1165  				u8 tsv[TSV_SIZE];
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1166  				enc28j60_read_tsv(priv, tsv);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1167  				enc28j60_dump_tsv(priv, "Tx Done", tsv);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1168  			}
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1169  			enc28j60_tx_clear(ndev, err);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1170  			locked_reg_bfclr(priv, EIR, EIR_TXIF);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1171  		}
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1172  		/* TX Error handler */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1173  		if ((intflags & EIR_TXERIF) != 0) {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1174  			u8 tsv[TSV_SIZE];
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1175  
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1176  			loop++;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1177  			if (netif_msg_intr(priv))
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1178  				netdev_printk(KERN_DEBUG, ndev, "intTXErr(%d)\n",
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1179  					      loop);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1180  			locked_reg_bfclr(priv, ECON1, ECON1_TXRTS);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1181  			enc28j60_read_tsv(priv, tsv);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1182  			if (netif_msg_tx_err(priv))
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1183  				enc28j60_dump_tsv(priv, "Tx Error", tsv);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1184  			/* Reset TX logic */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1185  			mutex_lock(&priv->lock);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1186  			nolock_reg_bfset(priv, ECON1, ECON1_TXRST);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1187  			nolock_reg_bfclr(priv, ECON1, ECON1_TXRST);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1188  			nolock_txfifo_init(priv, TXSTART_INIT, TXEND_INIT);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1189  			mutex_unlock(&priv->lock);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1190  			/* Transmit Late collision check for retransmit */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1191  			if (TSV_GETBIT(tsv, TSV_TXLATECOLLISION)) {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1192  				if (netif_msg_tx_err(priv))
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1193  					netdev_printk(KERN_DEBUG, ndev,
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1194  						      "LateCollision TXErr (%d)\n",
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1195  						      priv->tx_retry_count);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1196  				if (priv->tx_retry_count++ < MAX_TX_RETRYCOUNT)
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1197  					locked_reg_bfset(priv, ECON1,
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1198  							   ECON1_TXRTS);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1199  				else
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1200  					enc28j60_tx_clear(ndev, true);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1201  			} else
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1202  				enc28j60_tx_clear(ndev, true);
373819ec391de0 drivers/net/ethernet/microchip/enc28j60.c Sergio Valverde     2016-07-01  1203  			locked_reg_bfclr(priv, EIR, EIR_TXERIF | EIR_TXIF);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1204  		}
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1205  		/* RX Error handler */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1206  		if ((intflags & EIR_RXERIF) != 0) {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1207  			loop++;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1208  			if (netif_msg_intr(priv))
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1209  				netdev_printk(KERN_DEBUG, ndev, "intRXErr(%d)\n",
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1210  					      loop);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1211  			/* Check free FIFO space to flag RX overrun */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1212  			if (enc28j60_get_free_rxfifo(priv) <= 0) {
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1213  				if (netif_msg_rx_err(priv))
c93a0f2a7fc4b9 drivers/net/ethernet/microchip/enc28j60.c Andy Shevchenko     2019-03-19  1214  					netdev_printk(KERN_DEBUG, ndev, "RX Overrun\n");
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1215  				ndev->stats.rx_dropped++;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1216  			}
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1217  			locked_reg_bfclr(priv, EIR, EIR_RXERIF);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1218  		}
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1219  		/* RX handler */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1220  		if (enc28j60_rx_interrupt(ndev))
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1221  			loop++;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1222  	} while (loop);
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1223  
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1224  	/* re-enable interrupts */
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1225  	locked_reg_bfset(priv, EIE, EIE_INTIE);
995585ecdf42c1 drivers/net/ethernet/microchip/enc28j60.c Philipp Rosenberger 2023-05-09  1226  
995585ecdf42c1 drivers/net/ethernet/microchip/enc28j60.c Philipp Rosenberger 2023-05-09  1227  	return IRQ_HANDLED;
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1228  }
3ec9c11da03342 drivers/net/enc28j60.c                    Claudio Lanconelli  2008-01-14  1229  

:::::: The code at line 1120 was first introduced by commit
:::::: 995585ecdf42c14fbd4d9d12ca73bf54358581c6 net: enc28j60: Use threaded interrupt instead of workqueue

:::::: TO: Philipp Rosenberger <p.rosenberger@kunbus.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
