Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF21E9B38
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737482029; cv=none; b=g5ECu6rtXt4U9RxOeUEl5BhxXeQArfvGUFwrmT6IBALQ9tct3Ba8cebBwzVz9TxBbUzMGbD4Zjd9KP4hTcE5whYlifkoojhQYFpp7KWUUkz1HteibLTlihGojiKoQAwDBMbs+rMVV7i7T7kliZLzGGOxWLfY8smxhRPaYB4GhWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737482029; c=relaxed/simple;
	bh=39w4jjHVF9TCXbtwoQQcEk2cBUBNqpa8o+Kto8MXKwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TBtShvfvHTVUErv8D6e/fgMDgcshyIDYAlG+1ZQko0N2olulJfhzWhBqw4duSMVn8oDq2u3NR6+ikcbDxGY0UjBK+Ec+7YW4jaVWsLgv/GEOcG315+IPVaYiPdXYjWzaBsw2t3+mcLYSBZ9d199BixgIRRSrisgXSHZdK/7JYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ne24dxwl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ne24dxwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737482027; x=1769018027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=39w4jjHVF9TCXbtwoQQcEk2cBUBNqpa8o+Kto8MXKwA=;
  b=ne24dxwlXEMmwqqcJPZN75tcZynkrecX5ehFGwoEl3fv3aZhDrxicVHK
   oTHYemj7evZ1lSMbLvW8NpBEhjekyiwqQ9hbwTvhLyrED6N2wwOhwUcqS
   htL8Ii1B2wdjCuPl5FQSMt2Mf72Ey+sG8yl4QaI5AGx8grcU6xBX0idlZ
   NezltuDvI05GuKwOyI9iARtST6bVws96IV86mYrgr3gYiZbZghBP9iBbq
   lv/UGRvKCNZafTNknoVfrPK3l/pB1iAN45JjFqjrurzWfJcVI6DFdm5oU
   c1TvrOmyaHIbI4enKfMRbErhhHGgr9Idl3nBmaYhE/cU5v4iR+DO253DA
   w==;
X-CSE-ConnectionGUID: 7tLAhF6KTQSRgqndgqvFLA==
X-CSE-MsgGUID: qr1eqwXQSrO+ehxNAKcqWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37932584"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="37932584"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 09:53:45 -0800
X-CSE-ConnectionGUID: 16L7Yi7pRb6aFMCZW5Wb4Q==
X-CSE-MsgGUID: IyakbBPCTyuZPvR71dzOIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="106661238"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jan 2025 09:53:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taIRZ-000YOa-1f;
	Tue, 21 Jan 2025 17:53:41 +0000
Date: Wed, 22 Jan 2025 01:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1411/1411]
 drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5164:6: warning: unused
 variable 'len'
Message-ID: <202501220126.4njU5YRX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fdf62dff2537450d438667d817333e17ec71148a
commit: d4353bc94d9a5d1fb044185ee8162f0cc3e48f90 [1411/1411] net: wangxun: fix resolving ipv6 pakets extension header errors
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250122/202501220126.4njU5YRX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220126.4njU5YRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220126.4njU5YRX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_main.c:38:
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:170:6: warning: no previous prototype for function 'ngbe_service_event_schedule' [-Wmissing-prototypes]
     170 | void ngbe_service_event_schedule(struct ngbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     170 | void ngbe_service_event_schedule(struct ngbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:433:7: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     433 |         bool real_tx_hang = false;
         |              ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3223:6: warning: no previous prototype for function 'ngbe_configure_isb' [-Wmissing-prototypes]
    3223 | void ngbe_configure_isb(struct ngbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3223 | void ngbe_configure_isb(struct ngbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3233:6: warning: no previous prototype for function 'ngbe_configure_port' [-Wmissing-prototypes]
    3233 | void ngbe_configure_port(struct ngbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3233 | void ngbe_configure_port(struct ngbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3592:6: warning: no previous prototype for function 'ngbe_disable_device' [-Wmissing-prototypes]
    3592 | void ngbe_disable_device(struct ngbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3592:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3592 | void ngbe_disable_device(struct ngbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3693:5: warning: no previous prototype for function 'ngbe_init_shared_code' [-Wmissing-prototypes]
    3693 | s32 ngbe_init_shared_code(struct ngbe_hw *hw)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3693:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3693 | s32 ngbe_init_shared_code(struct ngbe_hw *hw)
         | ^
         | static 
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5164:6: warning: unused variable 'len' [-Wunused-variable]
    5164 |         u32 len = 0;
         |             ^~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5833:5: warning: no previous prototype for function 'ngbe_skb_pad_nonzero' [-Wmissing-prototypes]
    5833 | int ngbe_skb_pad_nonzero(struct sk_buff *skb, int pad)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5833:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5833 | int ngbe_skb_pad_nonzero(struct sk_buff *skb, int pad)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6033:6: warning: variable 'prtad' set but not used [-Wunused-but-set-variable]
    6033 |         int prtad, devad, ret = 0;
         |             ^
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6033:13: warning: variable 'devad' set but not used [-Wunused-but-set-variable]
    6033 |         int prtad, devad, ret = 0;
         |                    ^
   11 warnings generated.
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:257: warning: Function parameter or member 'quiet' not described in 'ngbe_read_reg'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1644: warning: Function parameter or member 'queues' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1644: warning: Function parameter or member 'flush' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2035: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_msi_and_legacy'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2449: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_bridge_mode'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2913: warning: Function parameter or member 'pool' not described in 'ngbe_write_uc_addr_list'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3722: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4583: warning: Function parameter or member 'adapter' not described in 'ngbe_check_hang_subtask'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4648: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_update_link_status'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4744: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_up'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4789: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_down'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4856: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_flush_tx'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4928: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_subtask'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4957: warning: Function parameter or member 't' not described in 'ngbe_service_timer'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4957: warning: Excess function parameter 'data' description in 'ngbe_service_timer'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6066: warning: Function parameter or member 'dev' not described in 'ngbe_setup_tc'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6066: warning: Excess function parameter 'netdev' description in 'ngbe_setup_tc'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6320: warning: Excess function parameter 'device_id' description in 'ngbe_wol_supported'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6320: warning: Excess function parameter 'subdev_id' description in 'ngbe_wol_supported'


vim +/len +5164 drivers/net/ethernet/netswift/ngbe/ngbe_main.c

  5154	
  5155	static ngbe_dptype encode_tx_desc_ptype(const struct ngbe_tx_buffer *first)
  5156	{
  5157		struct sk_buff *skb = first->skb;
  5158		u8 tun_prot = 0;
  5159		u8 l4_prot = 0;
  5160		u8 ptype = 0;
  5161		unsigned char *exthdr;
  5162		unsigned char *l4_hdr;
  5163		__be16 frag_off;
> 5164		u32 len = 0;
  5165	
  5166		if (skb->encapsulation) {
  5167			union network_header hdr;
  5168	
  5169			switch (first->protocol) {
  5170			case __constant_htons(ETH_P_IP):
  5171				tun_prot = ip_hdr(skb)->protocol;
  5172				if (ip_hdr(skb)->frag_off & htons(IP_MF | IP_OFFSET))
  5173					goto encap_frag;
  5174				ptype = NGBE_PTYPE_TUN_IPV4;
  5175				break;
  5176			case htons(ETH_P_IPV6):
  5177				l4_hdr = skb_transport_header(skb);
  5178				exthdr = skb_network_header(skb) +
  5179							sizeof(struct ipv6hdr);
  5180				tun_prot = ipv6_hdr(skb)->nexthdr;
  5181				if (l4_hdr != exthdr)
  5182					ipv6_skip_exthdr(skb, exthdr - skb->data,
  5183							 &tun_prot, &frag_off);
  5184	
  5185				if (tun_prot == NEXTHDR_FRAGMENT)
  5186					goto encap_frag;
  5187				ptype = NGBE_PTYPE_TUN_IPV6;
  5188				break;
  5189			default:
  5190				goto exit;
  5191			}
  5192	
  5193			if (tun_prot == IPPROTO_IPIP ||
  5194			    tun_prot == IPPROTO_IPV6) {
  5195				hdr.raw = (void *)inner_ip_hdr(skb);
  5196				ptype |= NGBE_PTYPE_PKT_IPIP;
  5197			} else if (tun_prot == IPPROTO_UDP) {
  5198				hdr.raw = (void *)inner_ip_hdr(skb);
  5199			} else {
  5200				goto exit;
  5201			}
  5202	
  5203			switch (hdr.ipv4->version) {
  5204			case IPVERSION:
  5205				l4_prot = hdr.ipv4->protocol;
  5206				if (hdr.ipv4->frag_off & htons(IP_MF | IP_OFFSET)) {
  5207					ptype |= NGBE_PTYPE_TYP_IPFRAG;
  5208					goto exit;
  5209				}
  5210				break;
  5211			case 6:
  5212				l4_hdr = skb_inner_transport_header(skb);
  5213				exthdr = skb_inner_network_header(skb) +
  5214							sizeof(struct ipv6hdr);
  5215				l4_prot = inner_ipv6_hdr(skb)->nexthdr;
  5216				if (l4_hdr != exthdr)
  5217					ipv6_skip_exthdr(skb, exthdr - skb->data,
  5218							 &l4_prot, &frag_off);
  5219	
  5220				ptype |= NGBE_PTYPE_PKT_IPV6;
  5221				if (l4_prot == NEXTHDR_FRAGMENT) {
  5222					ptype |= NGBE_PTYPE_TYP_IPFRAG;
  5223					goto exit;
  5224				}
  5225				break;
  5226			default:
  5227				goto exit;
  5228			}
  5229		} else {
  5230	encap_frag:
  5231			switch (first->protocol) {
  5232			case __constant_htons(ETH_P_IP):
  5233				l4_prot = ip_hdr(skb)->protocol;
  5234				ptype = NGBE_PTYPE_PKT_IP;
  5235				if (ip_hdr(skb)->frag_off & htons(IP_MF | IP_OFFSET)) {
  5236					ptype |= NGBE_PTYPE_TYP_IPFRAG;
  5237					goto exit;
  5238				}
  5239				break;
  5240	#ifdef NETIF_F_IPV6_CSUM
  5241			case htons(ETH_P_IPV6):
  5242				l4_hdr = skb_transport_header(skb);
  5243				exthdr = skb_network_header(skb) +
  5244							sizeof(struct ipv6hdr);
  5245				l4_prot = ipv6_hdr(skb)->nexthdr;
  5246				if (l4_hdr != exthdr)
  5247					ipv6_skip_exthdr(skb, exthdr - skb->data,
  5248							 &l4_prot, &frag_off);
  5249	
  5250				ptype = NGBE_PTYPE_PKT_IP | NGBE_PTYPE_PKT_IPV6;
  5251				if (l4_prot == NEXTHDR_FRAGMENT) {
  5252					ptype |= NGBE_PTYPE_TYP_IPFRAG;
  5253					goto exit;
  5254				}
  5255				break;
  5256	#endif /* NETIF_F_IPV6_CSUM */
  5257			case __constant_htons(ETH_P_1588):
  5258				ptype = NGBE_PTYPE_L2_TS;
  5259				goto exit;
  5260			case __constant_htons(ETH_P_FIP):
  5261				ptype = NGBE_PTYPE_L2_FIP;
  5262				goto exit;
  5263			case __constant_htons(NGBE_ETH_P_LLDP):
  5264				ptype = NGBE_PTYPE_L2_LLDP;
  5265				goto exit;
  5266			case __constant_htons(NGBE_ETH_P_CNM):
  5267				ptype = NGBE_PTYPE_L2_CNM;
  5268				goto exit;
  5269			case __constant_htons(ETH_P_PAE):
  5270				ptype = NGBE_PTYPE_L2_EAPOL;
  5271				goto exit;
  5272			case __constant_htons(ETH_P_ARP):
  5273				ptype = NGBE_PTYPE_L2_ARP;
  5274				goto exit;
  5275			default:
  5276				ptype = NGBE_PTYPE_L2_MAC;
  5277				goto exit;
  5278			}
  5279		}
  5280	
  5281		switch (l4_prot) {
  5282		case IPPROTO_TCP:
  5283			ptype |= NGBE_PTYPE_TYP_TCP;
  5284			break;
  5285		case IPPROTO_UDP:
  5286			ptype |= NGBE_PTYPE_TYP_UDP;
  5287			break;
  5288		case IPPROTO_SCTP:
  5289			ptype |= NGBE_PTYPE_TYP_SCTP;
  5290			break;
  5291		default:
  5292			ptype |= NGBE_PTYPE_TYP_IP;
  5293			break;
  5294		}
  5295	
  5296	exit:
  5297		return ngbe_decode_ptype(ptype);
  5298	}
  5299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
