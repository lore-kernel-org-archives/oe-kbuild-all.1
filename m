Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286A937E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 01:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691457210; x=1722993210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gANOSAnjDt9GCL+J3LGz5/b/o53fCavwkgzqliKY3gw=;
  b=YHmHbQdNKPWY2F8tNwM0Cumk+DiX3AYg3UxLqU4HiUFvNwbF0p39UfAI
   FkChWnV9dhD5SedNbDI5EGsEHlwK4mBqvgj8h+n/f+BzumqLt8SDAIry9
   +fyzUig/wNj3RP28fEEgrNJ99I8FkYtsJZC95+S3nsTpttO6OdNGKiqvk
   wW3M620NlxvJC6/KVqneMNMufLB0dEqZb/NPkrmSXrPvpzFPG6qMk7tqY
   tPotXLVhPNdaqenUNQUAIvp3VT+2iSm95FQxI/HxK9vFtO1oN3Ja6Fvou
   /DX6rjCowv78cFMRQlVOP6pJefSmyDjxV1mRkRC0YA60lYnDPvQeDOGoS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374362940"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="374362940"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 18:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801149701"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="801149701"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Aug 2023 18:13:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTBHp-0004zx-30;
	Tue, 08 Aug 2023 01:13:25 +0000
Date: Tue, 8 Aug 2023 09:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Albert Huang <huangjie.albert@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 Optimizing veth xsk performance 5/9] veth: use send
 queue tx napi to xmit xsk tx desc
Message-ID: <202308080815.HZ2PuG9x-lkp@intel.com>
References: <20230807122447.85725-1-huangjie.albert@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230807122447.85725-1-huangjie.albert@bytedance.com>

Hi Albert,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230807]
[also build test ERROR on v6.5-rc5]
[cannot apply to linus/master v6.5-rc5 v6.5-rc4 v6.5-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Albert-Huang/xsk-add-dma_check_skip-for-skipping-dma-check/20230807-211548
base:   next-20230807
patch link:    https://lore.kernel.org/r/20230807122447.85725-1-huangjie.albert%40bytedance.com
patch subject: [RFC v2 Optimizing veth xsk performance 5/9] veth: use send queue tx napi to xmit xsk tx desc
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230808/202308080815.HZ2PuG9x-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080815.HZ2PuG9x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080815.HZ2PuG9x-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/veth.c: In function 'veth_xsk_tx_xmit':
>> drivers/net/veth.c:1118:25: error: implicit declaration of function 'xsk_tx_completed_addr'; did you mean 'xsk_tx_completed'? [-Werror=implicit-function-declaration]
    1118 |                         xsk_tx_completed_addr(xsk_pool, desc.addr);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         xsk_tx_completed
   cc1: some warnings being treated as errors


vim +1118 drivers/net/veth.c

  1080	
  1081	static int veth_xsk_tx_xmit(struct veth_sq *sq, struct xsk_buff_pool *xsk_pool, int budget)
  1082	{
  1083		struct veth_priv *priv, *peer_priv;
  1084		struct net_device *dev, *peer_dev;
  1085		struct veth_stats stats = {};
  1086		struct sk_buff *skb = NULL;
  1087		struct veth_rq *peer_rq;
  1088		struct xdp_desc desc;
  1089		int done = 0;
  1090	
  1091		dev = sq->dev;
  1092		priv = netdev_priv(dev);
  1093		peer_dev = priv->peer;
  1094		peer_priv = netdev_priv(peer_dev);
  1095	
  1096		/* todo: queue index must set before this */
  1097		peer_rq = &peer_priv->rq[sq->queue_index];
  1098	
  1099		/* set xsk wake up flag, to do: where to disable */
  1100		if (xsk_uses_need_wakeup(xsk_pool))
  1101			xsk_set_tx_need_wakeup(xsk_pool);
  1102	
  1103		while (budget-- > 0) {
  1104			unsigned int truesize = 0;
  1105			struct page *page;
  1106			void *vaddr;
  1107			void *addr;
  1108	
  1109			if (!xsk_tx_peek_desc(xsk_pool, &desc))
  1110				break;
  1111	
  1112			addr = xsk_buff_raw_get_data(xsk_pool, desc.addr);
  1113	
  1114			/* can not hold all data in a page */
  1115			truesize =  SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
  1116			truesize += desc.len + xsk_pool->headroom;
  1117			if (truesize > PAGE_SIZE) {
> 1118				xsk_tx_completed_addr(xsk_pool, desc.addr);
  1119				stats.xdp_drops++;
  1120				break;
  1121			}
  1122	
  1123			page = dev_alloc_page();
  1124			if (!page) {
  1125				xsk_tx_completed_addr(xsk_pool, desc.addr);
  1126				stats.xdp_drops++;
  1127				break;
  1128			}
  1129			vaddr = page_to_virt(page);
  1130	
  1131			memcpy(vaddr + xsk_pool->headroom, addr, desc.len);
  1132			xsk_tx_completed_addr(xsk_pool, desc.addr);
  1133	
  1134			skb = veth_build_skb(vaddr, xsk_pool->headroom, desc.len, PAGE_SIZE);
  1135			if (!skb) {
  1136				put_page(page);
  1137				stats.xdp_drops++;
  1138				break;
  1139			}
  1140			skb->protocol = eth_type_trans(skb, peer_dev);
  1141			napi_gro_receive(&peer_rq->xdp_napi, skb);
  1142	
  1143			stats.xdp_bytes += desc.len;
  1144			done++;
  1145		}
  1146	
  1147		/* release, move consumer，and wakeup the producer */
  1148		if (done) {
  1149			napi_schedule(&peer_rq->xdp_napi);
  1150			xsk_tx_release(xsk_pool);
  1151		}
  1152	
  1153		u64_stats_update_begin(&sq->stats.syncp);
  1154		sq->stats.vs.xdp_packets += done;
  1155		sq->stats.vs.xdp_bytes += stats.xdp_bytes;
  1156		sq->stats.vs.xdp_drops += stats.xdp_drops;
  1157		u64_stats_update_end(&sq->stats.syncp);
  1158	
  1159		return done;
  1160	}
  1161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
