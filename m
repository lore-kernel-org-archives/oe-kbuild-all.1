Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89218375F97
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534261; cv=none; b=ud8iCwJlbRzlja5fdenPDt1e2hsbQd4igGCOJ/hvyFjvYWwyK5O3xn6XnQR1sBYddLnBKAqTSXdgUj6KL38HQ4vSl0Fvr/aF76XkqPEjrMUY47I74815tGCs775MoeiglP78eVED979I2nxtOznLt/9UKKe+zTkOUBK5Wh64UVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534261; c=relaxed/simple;
	bh=FIX9utmkiCgRhFxT/uujvyhKYqvPU32Yk6idJ5A3BxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QZkvD2aF3UDyk5kCli3ku1BTOTygSq/N+gcfDl30wKKdcrOt0l92KAzwZ6+sSzr5v3EOX2rb/+6xMJHhOpRNYR16AZTDwj9gpzW/RYpnF8jstleaoxGIfVu2IvPl6XPacavQoj1E508qCSVfgZlLWKWuHtTWBDkyu29SoANTcHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOOUAFzD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOOUAFzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534259; x=1807070259;
  h=date:from:to:cc:subject:message-id;
  bh=FIX9utmkiCgRhFxT/uujvyhKYqvPU32Yk6idJ5A3BxA=;
  b=fOOUAFzDbqq7SNualSAFx1+oAV7G3lCoMWqM3mgSsQlU+GS4IF7A4sme
   gfsSFqhrvXsGgcCCh7+hInlTadMA7j9g9CnvEDFCBQfko4888kI+LVU7m
   CZYyh0BY6mSUWStz+1bFaGrk/49e2cQZFyAdwkJI1N/ngm0MDjHRrf+Yg
   ET0fx4aIDEOcCkRJo2PAqCLpziCEHegc2hJxBHlDvcGZmstAqC5oFgPq8
   7///RSAuyZZLyIrT4dEoTGMd89pxCO9vuAxU79O3qwNrox5xKFXd/byl8
   SOxQTyXaHEsPEjaWw+uIdxHDjf8JMfitY8ux5N9xToTp/qrB+KPL0q73b
   A==;
X-CSE-ConnectionGUID: prcaEwzzTxqI6gqmlzSwAA==
X-CSE-MsgGUID: yQIezA0ASSmei37gpvFknQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80380285"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80380285"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:57:39 -0700
X-CSE-ConnectionGUID: m+8fh8LZTd2uPNMddqgHVA==
X-CSE-MsgGUID: OLil6dRYQ3+E/JShR0NAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="229720976"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Apr 2026 20:57:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xZE-0000000005b-442k;
	Tue, 07 Apr 2026 03:57:32 +0000
Date: Tue, 07 Apr 2026 11:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Willi <martin@strongswan.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>
Subject: net/core/dev.c:4776:21: warning: 'ether_addr_equal_64bits'
 reading 8 bytes from a region of size 6
Message-ID: <202604050634.aMvcQA8p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Martin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3aae9383f42f687221c011d7ee87529398e826b3
commit: 22b6034323fd736f260e00b9ea85c634abeb3446 net, xdp: Update pkt_type if generic XDP changes unicast MAC
date:   4 years, 11 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260405/202604050634.aMvcQA8p-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050634.aMvcQA8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 22b6034323fd ("net, xdp: Update pkt_type if generic XDP changes unicast MAC")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050634.aMvcQA8p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/dev.c: In function 'netif_receive_generic_xdp':
>> net/core/dev.c:4776:21: warning: 'ether_addr_equal_64bits' reading 8 bytes from a region of size 6 [-Wstringop-overread]
    4776 |         orig_host = ether_addr_equal_64bits(eth->h_dest, skb->dev->dev_addr);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:4776:21: note: referencing argument 1 of type 'const u8[8]' {aka 'const unsigned char[8]'}
   net/core/dev.c:4776:21: note: referencing argument 2 of type 'const u8[8]' {aka 'const unsigned char[8]'}
   In file included from net/core/dev.c:91:
   include/linux/etherdevice.h:355:20: note: in a call to function 'ether_addr_equal_64bits'
     355 | static inline bool ether_addr_equal_64bits(const u8 addr1[6+2],
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:4777:22: warning: 'is_multicast_ether_addr_64bits' reading 8 bytes from a region of size 6 [-Wstringop-overread]
    4777 |         orig_bcast = is_multicast_ether_addr_64bits(eth->h_dest);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:4777:22: note: referencing argument 1 of type 'const u8[8]' {aka 'const unsigned char[8]'}
   include/linux/etherdevice.h:130:20: note: in a call to function 'is_multicast_ether_addr_64bits'
     130 | static inline bool is_multicast_ether_addr_64bits(const u8 addr[6+2])
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:4804:27: warning: 'ether_addr_equal_64bits' reading 8 bytes from a region of size 6 [-Wstringop-overread]
    4804 |             (orig_host != ether_addr_equal_64bits(eth->h_dest,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4805 |                                                   skb->dev->dev_addr)) ||
         |                                                   ~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:4804:27: note: referencing argument 1 of type 'const u8[8]' {aka 'const unsigned char[8]'}
   net/core/dev.c:4804:27: note: referencing argument 2 of type 'const u8[8]' {aka 'const unsigned char[8]'}
   include/linux/etherdevice.h:355:20: note: in a call to function 'ether_addr_equal_64bits'
     355 | static inline bool ether_addr_equal_64bits(const u8 addr1[6+2],
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:4806:28: warning: 'is_multicast_ether_addr_64bits' reading 8 bytes from a region of size 6 [-Wstringop-overread]
    4806 |             (orig_bcast != is_multicast_ether_addr_64bits(eth->h_dest))) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:4806:28: note: referencing argument 1 of type 'const u8[8]' {aka 'const unsigned char[8]'}
   include/linux/etherdevice.h:130:20: note: in a call to function 'is_multicast_ether_addr_64bits'
     130 | static inline bool is_multicast_ether_addr_64bits(const u8 addr[6+2])
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ether_addr_equal_64bits +4776 net/core/dev.c

  4718	
  4719	static u32 netif_receive_generic_xdp(struct sk_buff *skb,
  4720					     struct xdp_buff *xdp,
  4721					     struct bpf_prog *xdp_prog)
  4722	{
  4723		void *orig_data, *orig_data_end, *hard_start;
  4724		struct netdev_rx_queue *rxqueue;
  4725		u32 metalen, act = XDP_DROP;
  4726		bool orig_bcast, orig_host;
  4727		u32 mac_len, frame_sz;
  4728		__be16 orig_eth_type;
  4729		struct ethhdr *eth;
  4730		int off;
  4731	
  4732		/* Reinjected packets coming from act_mirred or similar should
  4733		 * not get XDP generic processing.
  4734		 */
  4735		if (skb_is_redirected(skb))
  4736			return XDP_PASS;
  4737	
  4738		/* XDP packets must be linear and must have sufficient headroom
  4739		 * of XDP_PACKET_HEADROOM bytes. This is the guarantee that also
  4740		 * native XDP provides, thus we need to do it here as well.
  4741		 */
  4742		if (skb_cloned(skb) || skb_is_nonlinear(skb) ||
  4743		    skb_headroom(skb) < XDP_PACKET_HEADROOM) {
  4744			int hroom = XDP_PACKET_HEADROOM - skb_headroom(skb);
  4745			int troom = skb->tail + skb->data_len - skb->end;
  4746	
  4747			/* In case we have to go down the path and also linearize,
  4748			 * then lets do the pskb_expand_head() work just once here.
  4749			 */
  4750			if (pskb_expand_head(skb,
  4751					     hroom > 0 ? ALIGN(hroom, NET_SKB_PAD) : 0,
  4752					     troom > 0 ? troom + 128 : 0, GFP_ATOMIC))
  4753				goto do_drop;
  4754			if (skb_linearize(skb))
  4755				goto do_drop;
  4756		}
  4757	
  4758		/* The XDP program wants to see the packet starting at the MAC
  4759		 * header.
  4760		 */
  4761		mac_len = skb->data - skb_mac_header(skb);
  4762		hard_start = skb->data - skb_headroom(skb);
  4763	
  4764		/* SKB "head" area always have tailroom for skb_shared_info */
  4765		frame_sz = (void *)skb_end_pointer(skb) - hard_start;
  4766		frame_sz += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
  4767	
  4768		rxqueue = netif_get_rxqueue(skb);
  4769		xdp_init_buff(xdp, frame_sz, &rxqueue->xdp_rxq);
  4770		xdp_prepare_buff(xdp, hard_start, skb_headroom(skb) - mac_len,
  4771				 skb_headlen(skb) + mac_len, true);
  4772	
  4773		orig_data_end = xdp->data_end;
  4774		orig_data = xdp->data;
  4775		eth = (struct ethhdr *)xdp->data;
> 4776		orig_host = ether_addr_equal_64bits(eth->h_dest, skb->dev->dev_addr);
  4777		orig_bcast = is_multicast_ether_addr_64bits(eth->h_dest);
  4778		orig_eth_type = eth->h_proto;
  4779	
  4780		act = bpf_prog_run_xdp(xdp_prog, xdp);
  4781	
  4782		/* check if bpf_xdp_adjust_head was used */
  4783		off = xdp->data - orig_data;
  4784		if (off) {
  4785			if (off > 0)
  4786				__skb_pull(skb, off);
  4787			else if (off < 0)
  4788				__skb_push(skb, -off);
  4789	
  4790			skb->mac_header += off;
  4791			skb_reset_network_header(skb);
  4792		}
  4793	
  4794		/* check if bpf_xdp_adjust_tail was used */
  4795		off = xdp->data_end - orig_data_end;
  4796		if (off != 0) {
  4797			skb_set_tail_pointer(skb, xdp->data_end - xdp->data);
  4798			skb->len += off; /* positive on grow, negative on shrink */
  4799		}
  4800	
  4801		/* check if XDP changed eth hdr such SKB needs update */
  4802		eth = (struct ethhdr *)xdp->data;
  4803		if ((orig_eth_type != eth->h_proto) ||
  4804		    (orig_host != ether_addr_equal_64bits(eth->h_dest,
  4805							  skb->dev->dev_addr)) ||
  4806		    (orig_bcast != is_multicast_ether_addr_64bits(eth->h_dest))) {
  4807			__skb_push(skb, ETH_HLEN);
  4808			skb->pkt_type = PACKET_HOST;
  4809			skb->protocol = eth_type_trans(skb, skb->dev);
  4810		}
  4811	
  4812		switch (act) {
  4813		case XDP_REDIRECT:
  4814		case XDP_TX:
  4815			__skb_push(skb, mac_len);
  4816			break;
  4817		case XDP_PASS:
  4818			metalen = xdp->data - xdp->data_meta;
  4819			if (metalen)
  4820				skb_metadata_set(skb, metalen);
  4821			break;
  4822		default:
  4823			bpf_warn_invalid_xdp_action(act);
  4824			fallthrough;
  4825		case XDP_ABORTED:
  4826			trace_xdp_exception(skb->dev, xdp_prog, act);
  4827			fallthrough;
  4828		case XDP_DROP:
  4829		do_drop:
  4830			kfree_skb(skb);
  4831			break;
  4832		}
  4833	
  4834		return act;
  4835	}
  4836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
