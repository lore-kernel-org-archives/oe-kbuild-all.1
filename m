Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7791518AF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 17:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689267785; x=1720803785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VPYfiUXc7xqo4hmJTkaoDQK0clXDLHPH4tDWXW0RulI=;
  b=N3I+yDHXP7hfEXx7q2vueJvQrQiTYi/MkGSA9k2UnF760F/osHYRW3kO
   vE3EsJEyGP6qXvhiyOf5Jtkyjnfx4BAntX211X52v7d5rByLprSn++YVg
   YL4/RJVsbaiUWNadOBqKcEgF4gMPSk58srEXbBRsHTEzAc3Mj5MedTnM/
   RGL2Y2ph/OnGS2kOkGFNrVMw+m/pyf3G1oCcNXCYjMUd0QBNBt3pVXSrs
   wKC3rOivojlh//oxygiGPA2NDw6GCwSXg1W7xHRm+iHnJ6sd+BEnZ3VEZ
   XFKIg/BqH0/Bd8f0UGeI3KDOiYQmztuy8AZpQO0SGhhqhwueaf5euSk6T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451616845"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="451616845"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 10:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792116509"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="792116509"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 10:02:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJzhb-0006mj-1M;
	Thu, 13 Jul 2023 17:02:03 +0000
Date: Fri, 14 Jul 2023 01:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 7/13] drivers/net/ethernet/ti/cpsw.c:910:22:
 warning: variable 'len' set but not used
Message-ID: <202307140043.TNdI1w82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   65bcc3fe777617e7f0d4d0e120e2e88d0f4ef646
commit: 04372d03b2e9cb84b5897b118b04fe3ef211d990 [7/13] HACK: net: ethernet: ti: cpsw: allow to configure min tx packet size
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230714/202307140043.TNdI1w82-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140043.TNdI1w82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140043.TNdI1w82-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/cpsw.c: In function 'cpsw_ndo_start_xmit':
>> drivers/net/ethernet/ti/cpsw.c:910:22: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     910 |         unsigned int len;
         |                      ^~~


vim +/len +910 drivers/net/ethernet/ti/cpsw.c

   901	
   902	static netdev_tx_t cpsw_ndo_start_xmit(struct sk_buff *skb,
   903					       struct net_device *ndev)
   904	{
   905		struct cpsw_priv *priv = netdev_priv(ndev);
   906		struct cpsw_common *cpsw = priv->cpsw;
   907		struct cpts *cpts = cpsw->cpts;
   908		struct netdev_queue *txq;
   909		struct cpdma_chan *txch;
 > 910		unsigned int len;
   911		int ret, q_idx;
   912	
   913		if (skb_put_padto(skb, tx_packet_min)) {
   914			cpsw_err(priv, tx_err, "packet pad failed\n");
   915			ndev->stats.tx_dropped++;
   916			return NET_XMIT_DROP;
   917		}
   918	
   919		len = skb->len < tx_packet_min ? tx_packet_min : skb->len;
   920	
   921		if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&
   922		    priv->tx_ts_enabled && cpts_can_timestamp(cpts, skb))
   923			skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
   924	
   925		q_idx = skb_get_queue_mapping(skb);
   926		if (q_idx >= cpsw->tx_ch_num)
   927			q_idx = q_idx % cpsw->tx_ch_num;
   928	
   929		txch = cpsw->txv[q_idx].ch;
   930		txq = netdev_get_tx_queue(ndev, q_idx);
   931		skb_tx_timestamp(skb);
   932		ret = cpdma_chan_submit(txch, skb, skb->data, skb->len,
   933					priv->emac_port + cpsw->data.dual_emac);
   934		if (unlikely(ret != 0)) {
   935			cpsw_err(priv, tx_err, "desc submit failed\n");
   936			goto fail;
   937		}
   938	
   939		/* If there is no more tx desc left free then we need to
   940		 * tell the kernel to stop sending us tx frames.
   941		 */
   942		if (unlikely(!cpdma_check_free_tx_desc(txch))) {
   943			netif_tx_stop_queue(txq);
   944	
   945			/* Barrier, so that stop_queue visible to other cpus */
   946			smp_mb__after_atomic();
   947	
   948			if (cpdma_check_free_tx_desc(txch))
   949				netif_tx_wake_queue(txq);
   950		}
   951	
   952		return NETDEV_TX_OK;
   953	fail:
   954		ndev->stats.tx_dropped++;
   955		netif_tx_stop_queue(txq);
   956	
   957		/* Barrier, so that stop_queue visible to other cpus */
   958		smp_mb__after_atomic();
   959	
   960		if (cpdma_check_free_tx_desc(txch))
   961			netif_tx_wake_queue(txq);
   962	
   963		return NETDEV_TX_BUSY;
   964	}
   965	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
