Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65CC2045B5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 22:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174756; cv=none; b=gS38vEpVZ/okG8Jaoixv+uIJ74eMKmpWD1JPf+RSuutngL1FpjzpDZlWjqvOcbi3HsrLVX2WBUd7WTZkej/TRZHa3zNkusrnN5RWzOCWrAsqZDNjuJlUd2t/7YJ68roTQ/G18tX7LTWz9umF3kQGVLjXhqw9cFG0NuIqhgtY7VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174756; c=relaxed/simple;
	bh=fqeZJOEOY2aVWBB3599olrvu/ImNPnFHF5EeqlYBts8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/d+qmSW0lXnk993a7WR5QUldCR8/M46/BT6DgIDSuaBuQYv2Z1S/ioIHO2f3zAzWV0IQO+RKTa7DTybSLxL3T3scFUVkJmABjhv0gwqoyhC5ZTDVN6db06Q+QN69onsZ1ILTfGd/iFv1sCiVjC2JkVi+FfoRAWjgEqGKkb+p44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alIByoEJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alIByoEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747174753; x=1778710753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fqeZJOEOY2aVWBB3599olrvu/ImNPnFHF5EeqlYBts8=;
  b=alIByoEJ4gJ+nGskFVevvoBjqLH69anhLZLHqG003SBAoeAr4B0v9URJ
   S20iLfcz57FZfqDrpqw0a7syEv7bxHPtprR0zQxnyeSMXFKwbOBeooLm3
   zMKn2Fi2ze/ytsnmj5Y5KeoM3CMskDNnfuLW/fMPk3Es6QdCyNY+SB4je
   VbL/Fm4cFuywacVi/E/Aj8G9ct+Y3l3CxmVLgFPDxw9Pb98SMWacNZcmR
   8EuA5Lwy6SkuS2DxQ9f51KOSjvHSV6R/cOa5zo6dA0OWeLh+1JM1OSqml
   sJW4CB2VfY7eallWeHGwIRN7IeZy5T6AqTmHOF5x9hMNGxCWBjezg3IEV
   Q==;
X-CSE-ConnectionGUID: 2h8teC6zQkG8U4nvhMF45A==
X-CSE-MsgGUID: mRBYuUneSniqBzgIWiYxmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48156550"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48156550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 15:19:13 -0700
X-CSE-ConnectionGUID: VvTFqD7DS6qBfKMgls7JIw==
X-CSE-MsgGUID: mLGuGxC8TGm/YKdAHuzHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="138825627"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 15:19:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uExxs-000GRz-0m;
	Tue, 13 May 2025 22:19:08 +0000
Date: Wed, 14 May 2025 06:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Can Ayberk Demir <ayberkdemir@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <monstr@monstr.eu>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Can Ayberk DEMIR <ayberkdemir@gmail.com>
Subject: Re: [PATCH v2] drivers: net: axienet: safely drop oversized RX frames
Message-ID: <202505140618.dkbky4zD-lkp@intel.com>
References: <20250509063727.35560-1-ayberkdemir@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509063727.35560-1-ayberkdemir@gmail.com>

Hi Can,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master v6.15-rc6 next-20250513]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Can-Ayberk-Demir/drivers-net-axienet-safely-drop-oversized-RX-frames/20250509-143942
base:   net/main
patch link:    https://lore.kernel.org/r/20250509063727.35560-1-ayberkdemir%40gmail.com
patch subject: [PATCH v2] drivers: net: axienet: safely drop oversized RX frames
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20250514/202505140618.dkbky4zD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140618.dkbky4zD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140618.dkbky4zD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_rx_poll':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1227:45: error: 'ndev' undeclared (first use in this function); did you mean 'cdev'?
    1227 |                                 netdev_warn(ndev,
         |                                             ^~~~
         |                                             cdev
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1227:45: note: each undeclared identifier is reported only once for each function it appears in


vim +1227 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  1184	
  1185	/**
  1186	 * axienet_rx_poll - Triggered by RX ISR to complete the BD processing.
  1187	 * @napi:	Pointer to NAPI structure.
  1188	 * @budget:	Max number of RX packets to process.
  1189	 *
  1190	 * Return: Number of RX packets processed.
  1191	 */
  1192	static int axienet_rx_poll(struct napi_struct *napi, int budget)
  1193	{
  1194		u32 length;
  1195		u32 csumstatus;
  1196		u32 size = 0;
  1197		int packets = 0;
  1198		dma_addr_t tail_p = 0;
  1199		struct axidma_bd *cur_p;
  1200		struct sk_buff *skb, *new_skb;
  1201		struct axienet_local *lp = container_of(napi, struct axienet_local, napi_rx);
  1202	
  1203		cur_p = &lp->rx_bd_v[lp->rx_bd_ci];
  1204	
  1205		while (packets < budget && (cur_p->status & XAXIDMA_BD_STS_COMPLETE_MASK)) {
  1206			dma_addr_t phys;
  1207	
  1208			/* Ensure we see complete descriptor update */
  1209			dma_rmb();
  1210	
  1211			skb = cur_p->skb;
  1212			cur_p->skb = NULL;
  1213	
  1214			/* skb could be NULL if a previous pass already received the
  1215			 * packet for this slot in the ring, but failed to refill it
  1216			 * with a newly allocated buffer. In this case, don't try to
  1217			 * receive it again.
  1218			 */
  1219			if (likely(skb)) {
  1220				length = cur_p->app4 & 0x0000FFFF;
  1221	
  1222				phys = desc_get_phys_addr(lp, cur_p);
  1223				dma_unmap_single(lp->dev, phys, lp->max_frm_size,
  1224						 DMA_FROM_DEVICE);
  1225	
  1226				if (unlikely(length > skb_tailroom(skb))) {
> 1227					netdev_warn(ndev,
  1228						    "Dropping oversized RX frame (len=%u, tailroom=%u)\n",
  1229						    length, skb_tailroom(skb));
  1230					dev_kfree_skb(skb);
  1231					skb = NULL;
  1232				} else {
  1233					skb_put(skb, length);
  1234					skb->protocol = eth_type_trans(skb, lp->ndev);
  1235					/*skb_checksum_none_assert(skb);*/
  1236					skb->ip_summed = CHECKSUM_NONE;
  1237	
  1238					/* if we're doing Rx csum offload, set it up */
  1239					if (lp->features & XAE_FEATURE_FULL_RX_CSUM) {
  1240						csumstatus = (cur_p->app2 &
  1241								XAE_FULL_CSUM_STATUS_MASK) >> 3;
  1242						if (csumstatus == XAE_IP_TCP_CSUM_VALIDATED ||
  1243						    csumstatus == XAE_IP_UDP_CSUM_VALIDATED) {
  1244							skb->ip_summed = CHECKSUM_UNNECESSARY;
  1245						}
  1246					} else if (lp->features & XAE_FEATURE_PARTIAL_RX_CSUM) {
  1247						skb->csum = be32_to_cpu(cur_p->app3 & 0xFFFF);
  1248						skb->ip_summed = CHECKSUM_COMPLETE;
  1249					}
  1250	
  1251					napi_gro_receive(napi, skb);
  1252	
  1253					size += length;
  1254					packets++;
  1255				}
  1256			}
  1257	
  1258			new_skb = napi_alloc_skb(napi, lp->max_frm_size);
  1259			if (!new_skb)
  1260				break;
  1261	
  1262			phys = dma_map_single(lp->dev, new_skb->data,
  1263					      lp->max_frm_size,
  1264					      DMA_FROM_DEVICE);
  1265			if (unlikely(dma_mapping_error(lp->dev, phys))) {
  1266				if (net_ratelimit())
  1267					netdev_err(lp->ndev, "RX DMA mapping error\n");
  1268				dev_kfree_skb(new_skb);
  1269				break;
  1270			}
  1271			desc_set_phys_addr(lp, phys, cur_p);
  1272	
  1273			cur_p->cntrl = lp->max_frm_size;
  1274			cur_p->status = 0;
  1275			cur_p->skb = new_skb;
  1276	
  1277			/* Only update tail_p to mark this slot as usable after it has
  1278			 * been successfully refilled.
  1279			 */
  1280			tail_p = lp->rx_bd_p + sizeof(*lp->rx_bd_v) * lp->rx_bd_ci;
  1281	
  1282			if (++lp->rx_bd_ci >= lp->rx_bd_num)
  1283				lp->rx_bd_ci = 0;
  1284			cur_p = &lp->rx_bd_v[lp->rx_bd_ci];
  1285		}
  1286	
  1287		u64_stats_update_begin(&lp->rx_stat_sync);
  1288		u64_stats_add(&lp->rx_packets, packets);
  1289		u64_stats_add(&lp->rx_bytes, size);
  1290		u64_stats_update_end(&lp->rx_stat_sync);
  1291	
  1292		if (tail_p)
  1293			axienet_dma_out_addr(lp, XAXIDMA_RX_TDESC_OFFSET, tail_p);
  1294	
  1295		if (packets < budget && napi_complete_done(napi, packets)) {
  1296			if (READ_ONCE(lp->rx_dim_enabled)) {
  1297				struct dim_sample sample = {
  1298					.time = ktime_get(),
  1299					/* Safe because we are the only writer */
  1300					.pkt_ctr = u64_stats_read(&lp->rx_packets),
  1301					.byte_ctr = u64_stats_read(&lp->rx_bytes),
  1302					.event_ctr = READ_ONCE(lp->rx_irqs),
  1303				};
  1304	
  1305				net_dim(&lp->rx_dim, &sample);
  1306			}
  1307	
  1308			/* Re-enable RX completion interrupts. This should
  1309			 * cause an immediate interrupt if any RX packets are
  1310			 * already pending.
  1311			 */
  1312			spin_lock_irq(&lp->rx_cr_lock);
  1313			axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, lp->rx_dma_cr);
  1314			spin_unlock_irq(&lp->rx_cr_lock);
  1315		}
  1316		return packets;
  1317	}
  1318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
