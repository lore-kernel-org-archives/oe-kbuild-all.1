Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D091803F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696181489; x=1727717489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Rb1j6PSJ20d63qK+8n61to8JvN4zdm3zlDXM5j4fkc=;
  b=MfoBCkEDSUQVEBd2eQyMq9cyS2AICun1jUkvQtzwoVlyn7XDe7ml2f6f
   RB7Tkaa8zenEF8RP9DcikLHZwpxM/cys39pBjDIqle9mCja2xdcWq2PRk
   YdY0QISHL0nt2yHGPX/FadkIaZaVjEeHvF1i2T+7lBU5R5Uv7RDVAaQHY
   h0hLjKisAcs4LNRTHMk5UGzrfakOf+yefcwBjD47ow3NeHze1Et6goPyN
   rMiOWsgzmRnGRZ3Tzq4L/fwEzQkkRJpBrCvYJ5cC8uhrNcO+hr4QKNViz
   wOLBJpUNMeOKaioqGscMZi6FiGsAWAkIw/jl5FrKh98DcbPxdQbjQX3ny
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="446693986"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="446693986"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 10:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="893943728"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="893943728"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2023 10:30:07 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn0Hr-0005HV-2g;
	Sun, 01 Oct 2023 17:31:23 +0000
Date: Mon, 2 Oct 2023 01:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hay <joshua.a.hay@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Alan Brady <alan.brady@intel.com>,
	Madhu Chittim <madhu.chittim@intel.com>,
	Phani Burra <phani.r.burra@intel.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Willem de Bruijn <willemb@google.com>,
	Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: [linux-next:master 4524/8790]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:2909:undefined reference to
 `tcp_gro_complete'
Message-ID: <202310020136.RIwZa52o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df964ce9ef9fea10cf131bf6bad8658fde7956f6
commit: a251eee62133774cf35ff829041377e721ef9c8c [4524/8790] idpf: add SRIOV support and other ndo_ops
config: loongarch-randconfig-r023-20230605 (https://download.01.org/0day-ci/archive/20231002/202310020136.RIwZa52o-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310020136.RIwZa52o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310020136.RIwZa52o-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/net/ethernet/intel/idpf/idpf_txrx.o: in function `idpf_rx_rsc':
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:2909:(.text+0x49cc): undefined reference to `tcp_gro_complete'


vim +2909 drivers/net/ethernet/intel/idpf/idpf_txrx.c

3a8845af66edb3 Alan Brady 2023-08-07  2845  
3a8845af66edb3 Alan Brady 2023-08-07  2846  /**
3a8845af66edb3 Alan Brady 2023-08-07  2847   * idpf_rx_rsc - Set the RSC fields in the skb
3a8845af66edb3 Alan Brady 2023-08-07  2848   * @rxq : Rx descriptor ring packet is being transacted on
3a8845af66edb3 Alan Brady 2023-08-07  2849   * @skb : pointer to current skb being populated
3a8845af66edb3 Alan Brady 2023-08-07  2850   * @rx_desc: Receive descriptor
3a8845af66edb3 Alan Brady 2023-08-07  2851   * @decoded: Decoded Rx packet type related fields
3a8845af66edb3 Alan Brady 2023-08-07  2852   *
3a8845af66edb3 Alan Brady 2023-08-07  2853   * Return 0 on success and error code on failure
3a8845af66edb3 Alan Brady 2023-08-07  2854   *
3a8845af66edb3 Alan Brady 2023-08-07  2855   * Populate the skb fields with the total number of RSC segments, RSC payload
3a8845af66edb3 Alan Brady 2023-08-07  2856   * length and packet type.
3a8845af66edb3 Alan Brady 2023-08-07  2857   */
3a8845af66edb3 Alan Brady 2023-08-07  2858  static int idpf_rx_rsc(struct idpf_queue *rxq, struct sk_buff *skb,
3a8845af66edb3 Alan Brady 2023-08-07  2859  		       struct virtchnl2_rx_flex_desc_adv_nic_3 *rx_desc,
3a8845af66edb3 Alan Brady 2023-08-07  2860  		       struct idpf_rx_ptype_decoded *decoded)
3a8845af66edb3 Alan Brady 2023-08-07  2861  {
3a8845af66edb3 Alan Brady 2023-08-07  2862  	u16 rsc_segments, rsc_seg_len;
3a8845af66edb3 Alan Brady 2023-08-07  2863  	bool ipv4, ipv6;
3a8845af66edb3 Alan Brady 2023-08-07  2864  	int len;
3a8845af66edb3 Alan Brady 2023-08-07  2865  
3a8845af66edb3 Alan Brady 2023-08-07  2866  	if (unlikely(!decoded->outer_ip))
3a8845af66edb3 Alan Brady 2023-08-07  2867  		return -EINVAL;
3a8845af66edb3 Alan Brady 2023-08-07  2868  
3a8845af66edb3 Alan Brady 2023-08-07  2869  	rsc_seg_len = le16_to_cpu(rx_desc->misc.rscseglen);
3a8845af66edb3 Alan Brady 2023-08-07  2870  	if (unlikely(!rsc_seg_len))
3a8845af66edb3 Alan Brady 2023-08-07  2871  		return -EINVAL;
3a8845af66edb3 Alan Brady 2023-08-07  2872  
3a8845af66edb3 Alan Brady 2023-08-07  2873  	ipv4 = IDPF_RX_PTYPE_TO_IPV(decoded, IDPF_RX_PTYPE_OUTER_IPV4);
3a8845af66edb3 Alan Brady 2023-08-07  2874  	ipv6 = IDPF_RX_PTYPE_TO_IPV(decoded, IDPF_RX_PTYPE_OUTER_IPV6);
3a8845af66edb3 Alan Brady 2023-08-07  2875  
3a8845af66edb3 Alan Brady 2023-08-07  2876  	if (unlikely(!(ipv4 ^ ipv6)))
3a8845af66edb3 Alan Brady 2023-08-07  2877  		return -EINVAL;
3a8845af66edb3 Alan Brady 2023-08-07  2878  
3a8845af66edb3 Alan Brady 2023-08-07  2879  	rsc_segments = DIV_ROUND_UP(skb->data_len, rsc_seg_len);
3a8845af66edb3 Alan Brady 2023-08-07  2880  	if (unlikely(rsc_segments == 1))
3a8845af66edb3 Alan Brady 2023-08-07  2881  		return 0;
3a8845af66edb3 Alan Brady 2023-08-07  2882  
3a8845af66edb3 Alan Brady 2023-08-07  2883  	NAPI_GRO_CB(skb)->count = rsc_segments;
3a8845af66edb3 Alan Brady 2023-08-07  2884  	skb_shinfo(skb)->gso_size = rsc_seg_len;
3a8845af66edb3 Alan Brady 2023-08-07  2885  
3a8845af66edb3 Alan Brady 2023-08-07  2886  	skb_reset_network_header(skb);
3a8845af66edb3 Alan Brady 2023-08-07  2887  	len = skb->len - skb_transport_offset(skb);
3a8845af66edb3 Alan Brady 2023-08-07  2888  
3a8845af66edb3 Alan Brady 2023-08-07  2889  	if (ipv4) {
3a8845af66edb3 Alan Brady 2023-08-07  2890  		struct iphdr *ipv4h = ip_hdr(skb);
3a8845af66edb3 Alan Brady 2023-08-07  2891  
3a8845af66edb3 Alan Brady 2023-08-07  2892  		skb_shinfo(skb)->gso_type = SKB_GSO_TCPV4;
3a8845af66edb3 Alan Brady 2023-08-07  2893  
3a8845af66edb3 Alan Brady 2023-08-07  2894  		/* Reset and set transport header offset in skb */
3a8845af66edb3 Alan Brady 2023-08-07  2895  		skb_set_transport_header(skb, sizeof(struct iphdr));
3a8845af66edb3 Alan Brady 2023-08-07  2896  
3a8845af66edb3 Alan Brady 2023-08-07  2897  		/* Compute the TCP pseudo header checksum*/
3a8845af66edb3 Alan Brady 2023-08-07  2898  		tcp_hdr(skb)->check =
3a8845af66edb3 Alan Brady 2023-08-07  2899  			~tcp_v4_check(len, ipv4h->saddr, ipv4h->daddr, 0);
3a8845af66edb3 Alan Brady 2023-08-07  2900  	} else {
3a8845af66edb3 Alan Brady 2023-08-07  2901  		struct ipv6hdr *ipv6h = ipv6_hdr(skb);
3a8845af66edb3 Alan Brady 2023-08-07  2902  
3a8845af66edb3 Alan Brady 2023-08-07  2903  		skb_shinfo(skb)->gso_type = SKB_GSO_TCPV6;
3a8845af66edb3 Alan Brady 2023-08-07  2904  		skb_set_transport_header(skb, sizeof(struct ipv6hdr));
3a8845af66edb3 Alan Brady 2023-08-07  2905  		tcp_hdr(skb)->check =
3a8845af66edb3 Alan Brady 2023-08-07  2906  			~tcp_v6_check(len, &ipv6h->saddr, &ipv6h->daddr, 0);
3a8845af66edb3 Alan Brady 2023-08-07  2907  	}
3a8845af66edb3 Alan Brady 2023-08-07  2908  
3a8845af66edb3 Alan Brady 2023-08-07 @2909  	tcp_gro_complete(skb);
3a8845af66edb3 Alan Brady 2023-08-07  2910  
3a8845af66edb3 Alan Brady 2023-08-07  2911  	u64_stats_update_begin(&rxq->stats_sync);
3a8845af66edb3 Alan Brady 2023-08-07  2912  	u64_stats_inc(&rxq->q_stats.rx.rsc_pkts);
3a8845af66edb3 Alan Brady 2023-08-07  2913  	u64_stats_update_end(&rxq->stats_sync);
3a8845af66edb3 Alan Brady 2023-08-07  2914  
3a8845af66edb3 Alan Brady 2023-08-07  2915  	return 0;
3a8845af66edb3 Alan Brady 2023-08-07  2916  }
3a8845af66edb3 Alan Brady 2023-08-07  2917  

:::::: The code at line 2909 was first introduced by commit
:::::: 3a8845af66edb340ba9210bb8a0da040c7d6e590 idpf: add RX splitq napi poll support

:::::: TO: Alan Brady <alan.brady@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
