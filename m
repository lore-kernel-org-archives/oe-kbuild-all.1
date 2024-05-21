Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D1C1CA80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 16:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716309549; cv=none; b=flpj+QRybEvyzRbEXhTMkubJ7j0x93ZQSBXfYkUnNqhrDujFAoyLF8y/7S/ZxxbF/tKwiLwpdm73K5PW5tr1IIQxXpRkcLZKPOMhEPdPrI9tjgMZN1VNST5n74uU294qvGmp1t+RC75SyewncNMemgS9ak0OcJZJ3nN6QHWbv4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716309549; c=relaxed/simple;
	bh=ZxEDQDwNExtKaiL9M+cPCrdTFr9ztYBkVYnK6wrhDeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTR7h43f8tVHlbWQ7WE8kEGxiUodod6gLoTPGmPKynrj/eRXZ2VLOLpH0/N5lUbBBp+N9iPr44z6OI9oYCY3/sl+yobPcqJO3nWRmJniPmcnZJCnKqW44DG/gIukGjV9Fs0bZVCuyE/lYUv+O9QmCZTdKNam2afVVgZ6K06k4GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtrcWzh7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtrcWzh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716309547; x=1747845547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZxEDQDwNExtKaiL9M+cPCrdTFr9ztYBkVYnK6wrhDeY=;
  b=MtrcWzh7Rb4j1U1M9NSeQymosDg6CzaJWyVZT2LT7ZGLjAazEnU/511Q
   T105aQAKgt330qfVwluix8zo5J0SpTrcDDy8V7EXK7cDzw3usXDW2km/Q
   bd5Zc+52mYRUnexxsum2/J6BTcE8hK+W/Ffkn9YjrCfdWiKZIJmzJcYIZ
   tkgnxBef9vsARjleSwf3vbf7mC3Ac7ZxFm4WH1Lg2frVKo7+EDzjCEUUM
   ovNHEz2REO8R8FyJ06dsvI80wfHrCIKgQBFMeb8JVAwySDnsVQEtVkHkO
   2u4mTWbtLqxeT4b1p0BwsDK5/I/Np4AN9Cn1nC1LK/xqXEeZk9xRGJs3e
   Q==;
X-CSE-ConnectionGUID: FLwgU8BgQnennjvijL7pWQ==
X-CSE-MsgGUID: atFxeCN7Te2535JNIN227A==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="37896752"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="37896752"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 09:39:05 -0700
X-CSE-ConnectionGUID: cbg7bgA9T8+tBdC6pDjYng==
X-CSE-MsgGUID: TY1NfLROS5ecZhziDGyafQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="37479763"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2024 09:39:04 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9SVy-0000Xx-0S;
	Tue, 21 May 2024 16:39:02 +0000
Date: Wed, 22 May 2024 00:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-followups 3/4] net/ethernet/eth.c:158: warning:
 expecting prototype for eth_type_trans(). Prototype was for
 __eth_type_trans() instead
Message-ID: <202405220035.M66nO2KR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-followups
head:   0f40cc534bcda5e487aed96ab7cf01c08f841958
commit: dcbe6555d4a73807054ce4bca268b71d953deb8b [3/4] netkit: ...
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240522/202405220035.M66nO2KR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220035.M66nO2KR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220035.M66nO2KR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ethernet/eth.c:158: warning: expecting prototype for eth_type_trans(). Prototype was for __eth_type_trans() instead


vim +158 net/ethernet/eth.c

56193d1bce2b275 Alexander Duyck          2014-09-05  145  
d3e01f71863da30 Stephen Hemminger        2006-08-17  146  /**
d3e01f71863da30 Stephen Hemminger        2006-08-17  147   * eth_type_trans - determine the packet's protocol ID.
d3e01f71863da30 Stephen Hemminger        2006-08-17  148   * @skb: received socket data
d3e01f71863da30 Stephen Hemminger        2006-08-17  149   * @dev: receiving network device
dcbe6555d4a7380 Daniel Borkmann          2024-05-21  150   * @pkt_type: set packet type based on dst mac
d3e01f71863da30 Stephen Hemminger        2006-08-17  151   *
d3e01f71863da30 Stephen Hemminger        2006-08-17  152   * The rule here is that we
^1da177e4c3f415 Linus Torvalds           2005-04-16  153   * assume 802.3 if the type field is short enough to be a length.
^1da177e4c3f415 Linus Torvalds           2005-04-16  154   * This is normal practice and works for any 'now in use' protocol.
^1da177e4c3f415 Linus Torvalds           2005-04-16  155   */
dcbe6555d4a7380 Daniel Borkmann          2024-05-21  156  __be16 __eth_type_trans(struct sk_buff *skb, struct net_device *dev,
dcbe6555d4a7380 Daniel Borkmann          2024-05-21  157  			const bool pkt_type)
^1da177e4c3f415 Linus Torvalds           2005-04-16 @158  {
0864c158836c2d0 Eric Dumazet             2014-01-16  159  	unsigned short _service_access_point;
0864c158836c2d0 Eric Dumazet             2014-01-16  160  	const unsigned short *sap;
0864c158836c2d0 Eric Dumazet             2014-01-16  161  	const struct ethhdr *eth;
^1da177e4c3f415 Linus Torvalds           2005-04-16  162  
4c13eb6657fe9ef Arnaldo Carvalho de Melo 2007-04-25  163  	skb->dev = dev;
459a98ed881802d Arnaldo Carvalho de Melo 2007-03-19  164  	skb_reset_mac_header(skb);
610986e7262624e Alexander Duyck          2015-04-30  165  
610986e7262624e Alexander Duyck          2015-04-30  166  	eth = (struct ethhdr *)skb->data;
47d29646a2c1c14 David S. Miller          2010-05-02  167  	skb_pull_inline(skb, ETH_HLEN);
^1da177e4c3f415 Linus Torvalds           2005-04-16  168  
dcbe6555d4a7380 Daniel Borkmann          2024-05-21  169  	if (pkt_type)
6e159fd653d7ebf Rahul Rameshbabu         2024-04-23  170  		eth_skb_pkt_type(skb, dev);
^1da177e4c3f415 Linus Torvalds           2005-04-16  171  
cf85d08fdf4548e Lennert Buytenhek        2008-10-07  172  	/*
cf85d08fdf4548e Lennert Buytenhek        2008-10-07  173  	 * Some variants of DSA tagging don't have an ethertype field
cf85d08fdf4548e Lennert Buytenhek        2008-10-07  174  	 * at all, so we check here whether one of those tagging
cf85d08fdf4548e Lennert Buytenhek        2008-10-07  175  	 * variants has been configured on the receiving interface,
cf85d08fdf4548e Lennert Buytenhek        2008-10-07  176  	 * and if so, set skb->protocol without looking at the packet.
cf85d08fdf4548e Lennert Buytenhek        2008-10-07  177  	 */
edac6f6332d96aa Vladimir Oltean          2021-07-26  178  	if (unlikely(netdev_uses_dsa(dev)))
3e8a72d1dae374c Florian Fainelli         2014-08-27  179  		return htons(ETH_P_XDSA);
cf85d08fdf4548e Lennert Buytenhek        2008-10-07  180  
2c7a88c252bf338 Alexander Duyck          2015-05-04  181  	if (likely(eth_proto_is_802_3(eth->h_proto)))
^1da177e4c3f415 Linus Torvalds           2005-04-16  182  		return eth->h_proto;
^1da177e4c3f415 Linus Torvalds           2005-04-16  183  
^1da177e4c3f415 Linus Torvalds           2005-04-16  184  	/*
^1da177e4c3f415 Linus Torvalds           2005-04-16  185  	 *      This is a magic hack to spot IPX packets. Older Novell breaks
^1da177e4c3f415 Linus Torvalds           2005-04-16  186  	 *      the protocol design and runs IPX over 802.3 without an 802.2 LLC
^1da177e4c3f415 Linus Torvalds           2005-04-16  187  	 *      layer. We look for FFFF which isn't a used 802.2 SSAP/DSAP. This
^1da177e4c3f415 Linus Torvalds           2005-04-16  188  	 *      won't work for fault tolerant netware but does for the rest.
^1da177e4c3f415 Linus Torvalds           2005-04-16  189  	 */
0864c158836c2d0 Eric Dumazet             2014-01-16  190  	sap = skb_header_pointer(skb, 0, sizeof(*sap), &_service_access_point);
0864c158836c2d0 Eric Dumazet             2014-01-16  191  	if (sap && *sap == 0xFFFF)
^1da177e4c3f415 Linus Torvalds           2005-04-16  192  		return htons(ETH_P_802_3);
^1da177e4c3f415 Linus Torvalds           2005-04-16  193  
^1da177e4c3f415 Linus Torvalds           2005-04-16  194  	/*
^1da177e4c3f415 Linus Torvalds           2005-04-16  195  	 *      Real 802.2 LLC
^1da177e4c3f415 Linus Torvalds           2005-04-16  196  	 */
^1da177e4c3f415 Linus Torvalds           2005-04-16  197  	return htons(ETH_P_802_2);
^1da177e4c3f415 Linus Torvalds           2005-04-16  198  }
dcbe6555d4a7380 Daniel Borkmann          2024-05-21  199  EXPORT_SYMBOL(__eth_type_trans);
^1da177e4c3f415 Linus Torvalds           2005-04-16  200  

:::::: The code at line 158 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
