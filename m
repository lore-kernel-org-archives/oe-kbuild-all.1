Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4494E26AF3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 21:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717017404; cv=none; b=S51USaEJb3C3uUIClz9F9zzX2d9NKibxrnk3Q3PKvLcavSCRxPW67Anqg657hGC0S/NQh3fmGYC6WfkTjLUFaziPtAgrMv+4iHv2NhalXhrPXeYxfBSy/Efvmde3qALx8RehzZMpAdQj4RQmRhCCPaYxMigaLhSRrmF1wv+TBGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717017404; c=relaxed/simple;
	bh=uJe2QenGSNNkyDqmKiDgV5vp3nY7KD1vqMocFa40c18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dbPdPWdx6HIhdoOajLYD1zvJn0fg3e3PtOxMhsN8/odg/LQdywTOHrmwvrSJ1n8mvNViCZbk312xs+uK+enQWUn7/049IkkrsBmoKTlSgCIrhlp55UAVy8mKuHrimvuMQal6osTlW5QQoqwtl39X622ctogb7/i02q1bCNiXjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xj7vTWby; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xj7vTWby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717017402; x=1748553402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uJe2QenGSNNkyDqmKiDgV5vp3nY7KD1vqMocFa40c18=;
  b=Xj7vTWbyE+AI98YbxkLQU8zYU/avIf4sVyVcqkHoiMFa2eitbjpP2yya
   bC/Vkl7SK7IbMzeJTho2Qfcb5KP84BiyCWoAhEPzPmjpIYQ7866to7J0B
   E0h6NIWOcCHFHTxRewf+DsCPuMWQG3X+CqtAnOjPoYqyVawPCoLhHSXZg
   BCK14ra2s4G3I3GV2zj9vywXhWptU0R2Xs6FYjpTXmY1nd4Ux/tYsDLms
   2f6MWYfGGVM2FJ109RsvUK7ybDFjP/+nATlIcqYEEmw7FoBkDCt0Mbl5r
   V7KwdBtqhhP9CfugS9DAPdfKgVs9FDFLvFvmdVI1qd7zfuqH9Uu1Gw1MD
   A==;
X-CSE-ConnectionGUID: td8AkFE8QKqGo0Tf0BjPOQ==
X-CSE-MsgGUID: NAm3eBh6R8WAAegN+KAUzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24067628"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24067628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 14:16:42 -0700
X-CSE-ConnectionGUID: 925gcd/JQMS64/c/fIaMGA==
X-CSE-MsgGUID: LPQzClzxQNmGRxk46PIrOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35546947"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2024 14:16:40 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCQem-000EDV-0b;
	Wed, 29 May 2024 21:16:31 +0000
Date: Thu, 30 May 2024 05:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "gu.huiguang" <guhuiguang@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 4037/9792]
 drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6449:38: error: 'struct
 rnpm_tx_buffer' has no member named 'gso_need_padding'
Message-ID: <202405300505.GzvBHBcM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c0b6b4438dc70167c4c16f6436499cde257f782a
commit: 5deaf74c4b3edcf88f67f18aa352690deb9dc212 [4037/9792] drivers: initial support for rnpm drivers from Mucse Technology
config: loongarch-randconfig-002-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300505.GzvBHBcM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300505.GzvBHBcM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300505.GzvBHBcM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:256:6: warning: no previous prototype for 'rnpm_pf_service_event_schedule' [-Wmissing-prototypes]
     256 | void rnpm_pf_service_event_schedule(struct rnpm_pf_adapter *pf_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1137:5: warning: no previous prototype for 'rnpm_rx_ring_reinit' [-Wmissing-prototypes]
    1137 | int rnpm_rx_ring_reinit(struct rnpm_adapter *adapter, struct rnpm_ring *rx_ring)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_clean_rx_irq':
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2015:14: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    2015 |         bool xdp_xmit = false;
         |              ^~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: At top level:
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2207:6: warning: no previous prototype for 'rnpm_write_eitr' [-Wmissing-prototypes]
    2207 | void rnpm_write_eitr(struct rnpm_q_vector *q_vector, bool is_rxframe)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3013:5: warning: no previous prototype for 'rnpm_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3013 | int rnpm_xmit_nop_frame_ring(struct rnpm_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3037:5: warning: no previous prototype for 'rnpm_xmit_nop_frame_ring_temp' [-Wmissing-prototypes]
    3037 | int rnpm_xmit_nop_frame_ring_temp(struct rnpm_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3909:6: warning: no previous prototype for 'rnpm_vlan_stags_flag' [-Wmissing-prototypes]
    3909 | void rnpm_vlan_stags_flag(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4031:6: warning: no previous prototype for 'control_mac_rx' [-Wmissing-prototypes]
    4031 | void control_mac_rx(struct rnpm_adapter *adapter, bool on)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5803:6: warning: no previous prototype for 'rnpm_pf_service_timer' [-Wmissing-prototypes]
    5803 | void rnpm_pf_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5821:6: warning: no previous prototype for 'rnpm_service_timer' [-Wmissing-prototypes]
    5821 | void rnpm_service_timer(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5962:21: warning: no previous prototype for 'wait_all_port_resetting' [-Wmissing-prototypes]
    5962 | __maybe_unused void wait_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5974:21: warning: no previous prototype for 'clean_all_port_resetting' [-Wmissing-prototypes]
    5974 | __maybe_unused void clean_all_port_resetting(struct rnpm_pf_adapter *pf_adapter)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6185:5: warning: no previous prototype for 'rnpm_check_mc_addr' [-Wmissing-prototypes]
    6185 | int rnpm_check_mc_addr(struct rnpm_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6211:6: warning: no previous prototype for 'update_pf_vlan' [-Wmissing-prototypes]
    6211 | void update_pf_vlan(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6262:6: warning: no previous prototype for 'rnpm_pf_service_task' [-Wmissing-prototypes]
    6262 | void rnpm_pf_service_task(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_tso':
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6449:38: error: 'struct rnpm_tx_buffer' has no member named 'gso_need_padding'
    6449 |                                 first->gso_need_padding = !!gso_need_pad;
         |                                      ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: In function 'rnpm_tx_csum':
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6517:30: error: 'struct rnpm_tx_buffer' has no member named 'gso_need_padding'
    6517 |                         first->gso_need_padding = true;
         |                              ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: At top level:
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7528:6: warning: no previous prototype for 'rnpm_clear_udp_tunnel_port' [-Wmissing-prototypes]
    7528 | void rnpm_clear_udp_tunnel_port(struct rnpm_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7692:6: warning: no previous prototype for 'rnpm_assign_netdev_ops' [-Wmissing-prototypes]
    7692 | void rnpm_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7785:6: warning: no previous prototype for 'rnpm_fix_queue_number' [-Wmissing-prototypes]
    7785 | void rnpm_fix_queue_number(struct rnpm_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8760:5: warning: no previous prototype for 'rnpm_can_rpu_start' [-Wmissing-prototypes]
    8760 | int rnpm_can_rpu_start(struct rnpm_pf_adapter *pf_adapter)
         |     ^~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c: In function 'rnpm_maybe_tx_ctxtdesc':
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1008:35: error: 'struct rnpm_tx_buffer' has no member named 'gso_need_padding'
    1008 |                         if (!first->gso_need_padding)
         |                                   ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1010:30: error: 'struct rnpm_tx_buffer' has no member named 'gso_need_padding'
    1010 |                         first->gso_need_padding = false;
         |                              ^~
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c: At top level:
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1185:6: warning: no previous prototype for 'rnpm_setup_layer2_remapping' [-Wmissing-prototypes]
    1185 | void rnpm_setup_layer2_remapping(struct rnpm_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1209:6: warning: no previous prototype for 'rnpm_setup_tuple5_remapping' [-Wmissing-prototypes]
    1209 | void rnpm_setup_tuple5_remapping(struct rnpm_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1280:6: warning: no previous prototype for 'rnpm_setup_tuple5_remapping_tcam' [-Wmissing-prototypes]
    1280 | void rnpm_setup_tuple5_remapping_tcam(struct rnpm_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +6449 drivers/net/ethernet/mucse/rnpm/rnpm_main.c

  6309	
  6310	static int rnpm_tso(struct rnpm_ring *tx_ring, struct rnpm_tx_buffer *first,
  6311			    u8 *hdr_len)
  6312	{
  6313		struct rnpm_adapter *adapter = netdev_priv(tx_ring->netdev);
  6314		struct sk_buff *skb = first->skb;
  6315		union {
  6316			struct iphdr *v4;
  6317			struct ipv6hdr *v6;
  6318			unsigned char *hdr;
  6319		} ip;
  6320		union {
  6321			struct tcphdr *tcp;
  6322			struct udphdr *udp;
  6323			unsigned char *hdr;
  6324		} l4;
  6325		u32 paylen, l4_offset;
  6326		int err;
  6327		u8 *inner_mac;
  6328		u16 gso_segs, gso_size;
  6329		u16 gso_need_pad;
  6330	
  6331		if (skb->ip_summed != CHECKSUM_PARTIAL)
  6332			return 0;
  6333	
  6334		if (!skb_is_gso(skb))
  6335			return 0;
  6336	
  6337		err = skb_cow_head(skb, 0);
  6338		if (err < 0)
  6339			return err;
  6340	
  6341		inner_mac = skb->data;
  6342		ip.hdr = skb_network_header(skb);
  6343		l4.hdr = skb_transport_header(skb);
  6344	
  6345		first->tx_flags |=
  6346			RNPM_TXD_FLAG_TSO | RNPM_TXD_IP_CSUM | RNPM_TXD_L4_CSUM;
  6347	
  6348		/* initialize outer IP header fields */
  6349		if (ip.v4->version == 4) {
  6350			/* IP header will have to cancel out any data that
  6351			 * is not a part of the outer IP header
  6352			 */
  6353			ip.v4->check = 0x0000;
  6354		} else {
  6355			ip.v6->payload_len = 0;
  6356		}
  6357	#ifdef HAVE_ENCAP_TSO_OFFLOAD
  6358		if (skb_shinfo(skb)->gso_type &
  6359		    (SKB_GSO_GRE |
  6360	#ifdef NETIF_F_GSO_PARTIAL
  6361		     SKB_GSO_GRE_CSUM |
  6362	#endif
  6363		     SKB_GSO_UDP_TUNNEL | SKB_GSO_UDP_TUNNEL_CSUM)) {
  6364	#ifndef NETIF_F_GSO_PARTIAL
  6365			if (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_TUNNEL_CSUM) {
  6366	#else
  6367			if (!(skb_shinfo(skb)->gso_type & SKB_GSO_PARTIAL) &&
  6368			    (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_TUNNEL_CSUM)) {
  6369	#endif
  6370			}
  6371			/* we should always do this */
  6372			inner_mac = skb_inner_mac_header(skb);
  6373	
  6374			first->tunnel_hdr_len = (inner_mac - skb->data);
  6375			if (skb_shinfo(skb)->gso_type &
  6376			    (SKB_GSO_UDP_TUNNEL | SKB_GSO_UDP_TUNNEL_CSUM)) {
  6377				first->tx_flags |= RNPM_TXD_TUNNEL_VXLAN;
  6378				l4.udp->check = 0;
  6379				tx_dbg("set outer l4.udp to 0\n");
  6380			} else {
  6381				first->tx_flags |= RNPM_TXD_TUNNEL_NVGRE;
  6382			}
  6383	
  6384			/* reset pointers to inner headers */
  6385			ip.hdr = skb_inner_network_header(skb);
  6386			l4.hdr = skb_inner_transport_header(skb);
  6387		}
  6388	
  6389	#endif /* HAVE_ENCAP_TSO_OFFLOAD */
  6390		if (ip.v4->version == 4) {
  6391			/* IP header will have to cancel out any data that
  6392			 * is not a part of the outer IP header
  6393			 */
  6394			ip.v4->check = 0x0000;
  6395	
  6396		} else {
  6397			ip.v6->payload_len = 0;
  6398			/* set ipv6 type */
  6399	
  6400			first->tx_flags |= (RNPM_TXD_FLAG_IPv6);
  6401		}
  6402	
  6403		/* determine offset of inner transport header */
  6404		l4_offset = l4.hdr - skb->data;
  6405	
  6406		paylen = skb->len - l4_offset;
  6407		tx_dbg("before l4 checksum is %x\n", l4.tcp->check);
  6408	
  6409		// csum_replace_by_diff(&l4.tcp->check, htonl(paylen));
  6410	
  6411		tx_dbg("l4 checksum is %x\n", l4.tcp->check);
  6412	
  6413		if (skb->csum_offset == offsetof(struct tcphdr, check)) {
  6414			tx_dbg("tcp before l4 checksum is %x\n", l4.tcp->check);
  6415			// first->tx_flags |= RNP_TXD_L4_TYPE_TCP;
  6416			first->tx_flags |= RNPM_TXD_L4_TYPE_TCP;
  6417			/* compute length of segmentation header */
  6418			*hdr_len = (l4.tcp->doff * 4) + l4_offset;
  6419			csum_replace_by_diff(&l4.tcp->check,
  6420					     (__force __wsum)htonl(paylen));
  6421			tx_dbg("tcp l4 checksum is %x\n", l4.tcp->check);
  6422			// we should clear tcp.flags.push flas
  6423			l4.tcp->psh = 0;
  6424		} else {
  6425			tx_dbg("paylen is %x\n", paylen);
  6426			// first->tx_flags |= RNP_TXD_L4_TYPE_UDP;
  6427			first->tx_flags |= RNPM_TXD_L4_TYPE_UDP;
  6428			/* compute length of segmentation header */
  6429			tx_dbg("udp before l4 checksum is %x\n", l4.udp->check);
  6430			*hdr_len = sizeof(*l4.udp) + l4_offset;
  6431			csum_replace_by_diff(&l4.udp->check,
  6432					     (__force __wsum)htonl(paylen));
  6433			tx_dbg("udp l4 checksum is %x\n", l4.udp->check);
  6434		}
  6435	
  6436		first->mac_ip_len = l4.hdr - ip.hdr;
  6437		first->mac_ip_len |= (ip.hdr - inner_mac) << 9;
  6438		/* pull values out of skb_shinfo */
  6439		gso_size = skb_shinfo(skb)->gso_size;
  6440		gso_segs = skb_shinfo(skb)->gso_segs;
  6441	
  6442		if (adapter->priv_flags & RNPM_PRIV_FLAG_TX_PADDING) {
  6443			gso_need_pad = (first->skb->len - *hdr_len) % gso_size;
  6444			if (gso_need_pad) {
  6445				if ((gso_need_pad + *hdr_len) <=
  6446				    tx_ring->gso_padto_bytes) {
  6447					gso_need_pad = tx_ring->gso_padto_bytes -
  6448						       (gso_need_pad + *hdr_len);
> 6449					first->gso_need_padding = !!gso_need_pad;
  6450				}
  6451			}
  6452		}
  6453		/* update gso size and bytecount with header size */
  6454		/* to fix tx status */
  6455		first->gso_segs = gso_segs;
  6456		first->bytecount += (first->gso_segs - 1) * *hdr_len;
  6457	
  6458		first->mss_len_vf_num |= (gso_size | ((l4.tcp->doff * 4) << 24));
  6459		// rnpm_tx_ctxtdesc(tx_ring,skb_shinfo(skb)->gso_size ,l4len, 0, 0,
  6460		// type_tucmd);
  6461	
  6462		first->ctx_flag = true;
  6463		return 1;
  6464	}
  6465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
