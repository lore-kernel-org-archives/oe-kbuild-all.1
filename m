Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5807D46B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 14:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743345074; cv=none; b=ln4WkORBU0ZdaAKg1xHGHeS3SLuOAoiLM7vufdB8lRCfW38gsfMNQr8YLlRjZiCM/oZpUH+TgZ9kwpIHNuDY54xXDKuwjG5RJwBSucUpOnx1PY6jT1Afqv9A7UMA4exxAg6uo6OAmIbfHBxeFVdM53TSFqJekJy6rUaZE467LIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743345074; c=relaxed/simple;
	bh=uehx8iRTfceKG+OAQ13H9wG2dVoWFEPcnqXKxz/wPI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jOc88GWNFM4ImIrTfrAoU3fNmOYBtlERNYm7sL8liL8YaVEPnUODAPjSXACKOLq3z1aS8CKc7ozMh1aIEg0Pb1Z7aBFmFr0AAHhlwC11aB5GvEUVV1/8fDN7zKx8AZCzc4T022kzWZfXJLAde7OY5pa/Abby3Ac4fe6ZFbW32VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVRBksqW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVRBksqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743345072; x=1774881072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uehx8iRTfceKG+OAQ13H9wG2dVoWFEPcnqXKxz/wPI8=;
  b=LVRBksqWuqCMSS0+hITKqsLjiiYKbdUSYUsW1cNMigD3P10ZHu+8+Dbg
   u3TAglwHOUk8jba0QIxbO4TfjN0M2fFxWnJXcxeRRZqq2mzgjwsAVVHSA
   pkL2AmI8s/tE+gXoj+HIYIBL18YRHCzu8EqTwH/t9dm4mmJyB1f6uYZFg
   i4ETVa1+1QtnHlX2QRqnGfRM6hlRYYS8aoYcdyB3bDkFNYwjBUni2u6FR
   XDzSF8SMMMKvOrExqn47hE8qHUYWHt1fYqAvYYDLozu1xA2pp6l9QnJCC
   m5JYNe/SLPQgltl8UnwZRTTcevcTetnf6TsbCvLldRGw8xjcFpd/r34d+
   A==;
X-CSE-ConnectionGUID: lNHpBAOWTyms6+56S6YdOw==
X-CSE-MsgGUID: PpbB1gkaRpeMYa06aBGutw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44806802"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="44806802"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 07:31:10 -0700
X-CSE-ConnectionGUID: aebUX673RSiV/QZzCd4bxw==
X-CSE-MsgGUID: w5OcWbi/R1uK+tXa+4amMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="125885188"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Mar 2025 07:31:08 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tytgn-0008kA-2u;
	Sun, 30 Mar 2025 14:31:05 +0000
Date: Sun, 30 Mar 2025 22:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2829/2829]
 drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:177:5: sparse: sparse:
 symbol 'txgbe_get_link_ksettings' was not declared. Should it be static?
Message-ID: <202503302242.szHIIxdv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0e7e8faca7062a439fd0a56574c2c3860ceb2088
commit: 96c897d3a6cb76928d7981f60f832afba1bcc01b [2829/2829] openeuler: configs: delete txgbe/Kconfig, add txgbe_config to netswift/Kconfig
config: x86_64-randconfig-122-20250330 (https://download.01.org/0day-ci/archive/20250330/202503302242.szHIIxdv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503302242.szHIIxdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503302242.szHIIxdv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:177:5: sparse: sparse: symbol 'txgbe_get_link_ksettings' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:447:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:447:33: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:447:33: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1674:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1674:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1674:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1696:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1696:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1696:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1732:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1732:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1732:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1736:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1736:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:1736:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2089:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2089:25: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2089:25: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2424:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] psrc @@     got unsigned short [usertype] src_port @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2424:36: sparse:     expected restricted __be16 [usertype] psrc
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2424:36: sparse:     got unsigned short [usertype] src_port
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2425:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] psrc @@     got unsigned short [usertype] src_port @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2425:36: sparse:     expected restricted __be16 [usertype] psrc
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2425:36: sparse:     got unsigned short [usertype] src_port
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2426:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] pdst @@     got unsigned short [usertype] dst_port @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2426:36: sparse:     expected restricted __be16 [usertype] pdst
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2426:36: sparse:     got unsigned short [usertype] dst_port
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2427:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] pdst @@     got unsigned short [usertype] dst_port @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2427:36: sparse:     expected restricted __be16 [usertype] pdst
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2427:36: sparse:     got unsigned short [usertype] dst_port
>> drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2428:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4src @@     got unsigned int @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2428:38: sparse:     expected restricted __be32 [usertype] ip4src
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2428:38: sparse:     got unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2429:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4src @@     got unsigned int @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2429:38: sparse:     expected restricted __be32 [usertype] ip4src
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2429:38: sparse:     got unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2430:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4dst @@     got unsigned int @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2430:38: sparse:     expected restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2430:38: sparse:     got unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2431:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4dst @@     got unsigned int @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2431:38: sparse:     expected restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2431:38: sparse:     got unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2432:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] vlan_etype @@     got unsigned short [usertype] flex_bytes @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2432:31: sparse:     expected restricted __be16 [usertype] vlan_etype
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2432:31: sparse:     got unsigned short [usertype] flex_bytes
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2433:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] vlan_etype @@     got unsigned short [usertype] flex_bytes @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2433:31: sparse:     expected restricted __be16 [usertype] vlan_etype
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2433:31: sparse:     got unsigned short [usertype] flex_bytes
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2434:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2434:28: sparse:     expected restricted __be32
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2434:28: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2435:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned int [usertype] @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2435:28: sparse:     expected restricted __be32
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2435:28: sparse:     got unsigned int [usertype]
>> drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2703:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] ip4src @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2703:43: sparse:     expected unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2703:43: sparse:     got restricted __be32 [usertype] ip4src
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2704:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] ip4src @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2704:34: sparse:     expected unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2704:34: sparse:     got restricted __be32 [usertype] ip4src
>> drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2705:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] ip4dst @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2705:43: sparse:     expected unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2705:43: sparse:     got restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2706:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] ip4dst @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2706:34: sparse:     expected unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2706:34: sparse:     got restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2707:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] src_port @@     got restricted __be16 [usertype] psrc @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2707:42: sparse:     expected unsigned short [usertype] src_port
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2707:42: sparse:     got restricted __be16 [usertype] psrc
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2708:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] src_port @@     got restricted __be16 [usertype] psrc @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2708:33: sparse:     expected unsigned short [addressable] [assigned] [usertype] src_port
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2708:33: sparse:     got restricted __be16 [usertype] psrc
>> drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2709:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dst_port @@     got restricted __be16 [usertype] pdst @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2709:42: sparse:     expected unsigned short [usertype] dst_port
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2709:42: sparse:     got restricted __be16 [usertype] pdst
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2710:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] dst_port @@     got restricted __be16 [usertype] pdst @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2710:33: sparse:     expected unsigned short [addressable] [assigned] [usertype] dst_port
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2710:33: sparse:     got restricted __be16 [usertype] pdst
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2714:48: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2716:48: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2717:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] flex_bytes @@     got restricted __be16 [usertype] vlan_etype @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2717:52: sparse:     expected unsigned short [usertype] flex_bytes
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2717:52: sparse:     got restricted __be16 [usertype] vlan_etype
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2719:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] flex_bytes @@     got restricted __be16 [usertype] vlan_etype @@
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2719:43: sparse:     expected unsigned short [addressable] [assigned] [usertype] flex_bytes
   drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c:2719:43: sparse:     got restricted __be16 [usertype] vlan_etype
--
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:132:5: sparse: sparse: symbol 'txgbe_poll_for_msg' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:162:5: sparse: sparse: symbol 'txgbe_poll_for_ack' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:185:5: sparse: sparse: symbol 'txgbe_check_for_bit_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:205:5: sparse: sparse: symbol 'txgbe_check_for_msg_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:227:5: sparse: sparse: symbol 'txgbe_check_for_ack_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:249:5: sparse: sparse: symbol 'txgbe_check_for_rst_pf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:274:5: sparse: sparse: symbol 'txgbe_obtain_mbx_lock_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:303:5: sparse: sparse: symbol 'txgbe_write_mbx_pf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:346:5: sparse: sparse: symbol 'txgbe_read_mbx_pf' was not declared. Should it be static?
--
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:170:6: sparse: sparse: symbol 'txgbe_service_event_schedule' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:930:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] vlan_proto @@     got unsigned short [usertype] @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:930:40: sparse:     expected restricted __be16 [usertype] vlan_proto
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:930:40: sparse:     got unsigned short [usertype]
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2632:6: sparse: sparse: symbol 'txgbe_disable_tx_queue' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2777:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2777:25: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2777:25: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2781:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2781:25: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2781:25: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2792:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2792:25: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2792:25: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2796:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2796:25: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2796:25: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2858:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2858:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2858:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2913:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2913:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2913:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3297:5: sparse: sparse: symbol 'txgbe_add_cloud_switcher' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3312:5: sparse: sparse: symbol 'txgbe_del_cloud_switcher' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3632:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3632:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3632:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3662:6: sparse: sparse: symbol 'txgbe_configure_isb' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3672:6: sparse: sparse: symbol 'txgbe_configure_port' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3921:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3921:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3921:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4227:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4227:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4227:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4292:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4292:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4292:17: sparse:    int
>> drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4310:5: sparse: sparse: symbol 'txgbe_init_shared_code' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4392:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4392:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4392:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4821:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4821:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4821:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4953:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4953:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4953:17: sparse:    int
>> drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5952:40: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5974:36: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5978:67: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5988:32: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5989:36: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5993:67: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6007:37: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6031:40: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6643:33: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6643:33: sparse:    left side has type unsigned short
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6643:33: sparse:    right side has type restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6645:33: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6645:33: sparse:    left side has type unsigned short
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6645:33: sparse:    right side has type restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6647:38: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6648:25: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6648:25: sparse:    left side has type unsigned short
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6648:25: sparse:    right side has type restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6652:27: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6652:27: sparse:    left side has type unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6652:27: sparse:    right side has type restricted __be32
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6662:27: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6662:27: sparse:    left side has type unsigned int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6662:27: sparse:    right side has type restricted __be32
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6682:5: sparse: sparse: symbol 'txgbe_skb_pad_nonzero' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6724:30: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] protocol @@     got restricted __be16 [usertype] protocol @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6724:30: sparse:     expected unsigned short [usertype] protocol
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6724:30: sparse:     got restricted __be16 [usertype] protocol
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6770:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] protocol @@     got restricted __be16 [usertype] h_vlan_encapsulated_proto @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6770:26: sparse:     expected unsigned short [usertype] protocol
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6770:26: sparse:     got restricted __be16 [usertype] h_vlan_encapsulated_proto
>> drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6771:29: sparse: sparse: cast from restricted __be16
>> drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6804:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] h_vlan_TCI @@     got unsigned short [usertype] @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6804:42: sparse:     expected restricted __be16 [usertype] h_vlan_TCI
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6804:42: sparse:     got unsigned short [usertype]
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7209:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] port @@     got restricted __be16 [usertype] port @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7209:25: sparse:     expected unsigned short [usertype] port
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7209:25: sparse:     got restricted __be16 [usertype] port
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7275:46: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7277:37: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7285:47: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7287:37: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7379:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] type @@     got restricted __be16 [usertype] protocol @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7379:26: sparse:     expected unsigned short [usertype] type
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7379:26: sparse:     got restricted __be16 [usertype] protocol
>> drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7395:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] type @@     got restricted __be16 [usertype] h_vlan_encapsulated_proto @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7395:22: sparse:     expected unsigned short [usertype] type
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7395:22: sparse:     got restricted __be16 [usertype] h_vlan_encapsulated_proto
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7422:35: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different base types)) @@     expected int ( *ndo_vlan_rx_add_vid )( ... ) @@     got int ( * )( ... ) @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7422:35: sparse:     expected int ( *ndo_vlan_rx_add_vid )( ... )
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7422:35: sparse:     got int ( * )( ... )
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7423:35: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different base types)) @@     expected int ( *ndo_vlan_rx_kill_vid )( ... ) @@     got int ( * )( ... ) @@
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7423:35: sparse:     expected int ( *ndo_vlan_rx_kill_vid )( ... )
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7423:35: sparse:     got int ( * )( ... )
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7583:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7583:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7583:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7786:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7786:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7786:17: sparse:    int
--
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:645:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:645:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:645:9: sparse:    int
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:1042:6: sparse: sparse: symbol 'txgbe_add_uc_addr' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:1186:6: sparse: sparse: symbol 'txgbe_set_mta' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2699:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2699:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2699:9: sparse:    int
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2806:5: sparse: sparse: symbol 'txgbe_setup_mac_link_hostif' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2845:5: sparse: sparse: symbol 'txgbe_crc16_ccitt' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3297:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3297:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3297:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3342:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3342:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3342:17: sparse:    int
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4238:5: sparse: sparse: symbol 'txgbe_enable_rx_adapter' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4259:5: sparse: sparse: symbol 'txgbe_set_sgmii_an37_ability' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4833:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4833:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4833:9: sparse:    int
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:5239:5: sparse: sparse: symbol 'txgbe_reset_misc' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6345:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6345:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6345:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6347:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6347:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6347:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6520:5: sparse: sparse: symbol 'txgbe_read_ee_hostif_data' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6572:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6572:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6572:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6656:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6656:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6656:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6669:5: sparse: sparse: symbol 'txgbe_write_ee_hostif_data' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6712:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6712:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6712:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6757:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6757:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6757:9: sparse:    int

vim +/txgbe_get_link_ksettings +177 drivers/net/ethernet/netswift/txgbe/txgbe_ethtool.c

a493f74ade8fe6 zhenpengzheng 2021-07-13  176  
a493f74ade8fe6 zhenpengzheng 2021-07-13 @177  int txgbe_get_link_ksettings(struct net_device *netdev,
a493f74ade8fe6 zhenpengzheng 2021-07-13  178  							 struct ethtool_link_ksettings *cmd)
a493f74ade8fe6 zhenpengzheng 2021-07-13  179  {
a493f74ade8fe6 zhenpengzheng 2021-07-13  180  	struct txgbe_adapter *adapter = netdev_priv(netdev);
a493f74ade8fe6 zhenpengzheng 2021-07-13  181  	struct txgbe_hw *hw = &adapter->hw;
a493f74ade8fe6 zhenpengzheng 2021-07-13  182  	u32 supported_link;
a493f74ade8fe6 zhenpengzheng 2021-07-13  183  	u32 link_speed = 0;
a493f74ade8fe6 zhenpengzheng 2021-07-13  184  	bool autoneg = false;
a493f74ade8fe6 zhenpengzheng 2021-07-13  185  	u32 supported, advertising;
a493f74ade8fe6 zhenpengzheng 2021-07-13  186  	bool link_up;
a493f74ade8fe6 zhenpengzheng 2021-07-13  187  
a493f74ade8fe6 zhenpengzheng 2021-07-13  188  	ethtool_convert_link_mode_to_legacy_u32(&supported,
a493f74ade8fe6 zhenpengzheng 2021-07-13  189  											cmd->link_modes.supported);
a493f74ade8fe6 zhenpengzheng 2021-07-13  190  
a493f74ade8fe6 zhenpengzheng 2021-07-13  191  	TCALL(hw, mac.ops.get_link_capabilities, &supported_link, &autoneg);
a493f74ade8fe6 zhenpengzheng 2021-07-13  192  
a493f74ade8fe6 zhenpengzheng 2021-07-13  193  	if ((hw->subsystem_device_id & 0xF0) == TXGBE_ID_KR_KX_KX4)
a493f74ade8fe6 zhenpengzheng 2021-07-13  194  		autoneg = adapter->backplane_an ? 1:0;
a493f74ade8fe6 zhenpengzheng 2021-07-13  195  	else if ((hw->subsystem_device_id & 0xF0) == TXGBE_ID_MAC_SGMII)
a493f74ade8fe6 zhenpengzheng 2021-07-13  196  		autoneg = adapter->an37?1:0;
a493f74ade8fe6 zhenpengzheng 2021-07-13  197  
a493f74ade8fe6 zhenpengzheng 2021-07-13  198  	/* set the supported link speeds */
a493f74ade8fe6 zhenpengzheng 2021-07-13  199  	if (supported_link & TXGBE_LINK_SPEED_10GB_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  200  		supported |= (txgbe_isbackplane(hw->phy.media_type)) ?
a493f74ade8fe6 zhenpengzheng 2021-07-13  201  			txgbe_backplane_type(hw) : SUPPORTED_10000baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  202  	if (supported_link & TXGBE_LINK_SPEED_1GB_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  203  		supported |= (txgbe_isbackplane(hw->phy.media_type)) ?
a493f74ade8fe6 zhenpengzheng 2021-07-13  204  			SUPPORTED_1000baseKX_Full : SUPPORTED_1000baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  205  	if (supported_link & TXGBE_LINK_SPEED_100_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  206  		supported |= SUPPORTED_100baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  207  	if (supported_link & TXGBE_LINK_SPEED_10_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  208  		supported |= SUPPORTED_10baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  209  
a493f74ade8fe6 zhenpengzheng 2021-07-13  210  	/* default advertised speed if phy.autoneg_advertised isn't set */
a493f74ade8fe6 zhenpengzheng 2021-07-13  211  	advertising = supported;
a493f74ade8fe6 zhenpengzheng 2021-07-13  212  
a493f74ade8fe6 zhenpengzheng 2021-07-13  213  	/* set the advertised speeds */
a493f74ade8fe6 zhenpengzheng 2021-07-13  214  	if (hw->phy.autoneg_advertised) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  215  		if (hw->phy.autoneg_advertised & TXGBE_LINK_SPEED_100_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  216  			advertising |= ADVERTISED_100baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  217  		if (hw->phy.autoneg_advertised & TXGBE_LINK_SPEED_10GB_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  218  			advertising |= (supported & ADVERTISED_MASK_10G);
a493f74ade8fe6 zhenpengzheng 2021-07-13  219  		if (hw->phy.autoneg_advertised & TXGBE_LINK_SPEED_1GB_FULL) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  220  			if (supported & SUPPORTED_1000baseKX_Full)
a493f74ade8fe6 zhenpengzheng 2021-07-13  221  				advertising |= ADVERTISED_1000baseKX_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  222  			else
a493f74ade8fe6 zhenpengzheng 2021-07-13  223  				advertising |= ADVERTISED_1000baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  224  		}
a493f74ade8fe6 zhenpengzheng 2021-07-13  225  		if (hw->phy.autoneg_advertised & TXGBE_LINK_SPEED_10_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  226  			advertising |= ADVERTISED_10baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  227  	} else {
a493f74ade8fe6 zhenpengzheng 2021-07-13  228  		/* default modes in case phy.autoneg_advertised isn't set */
a493f74ade8fe6 zhenpengzheng 2021-07-13  229  		if (supported_link & TXGBE_LINK_SPEED_10GB_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  230  			advertising |= ADVERTISED_10000baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  231  		if (supported_link & TXGBE_LINK_SPEED_1GB_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  232  			advertising |= ADVERTISED_1000baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  233  		if (supported_link & TXGBE_LINK_SPEED_100_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  234  			advertising |= ADVERTISED_100baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  235  		if (hw->phy.multispeed_fiber && !autoneg) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  236  			if (supported_link & TXGBE_LINK_SPEED_10GB_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  237  				advertising = ADVERTISED_10000baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  238  		}
a493f74ade8fe6 zhenpengzheng 2021-07-13  239  		if (supported_link & TXGBE_LINK_SPEED_10_FULL)
a493f74ade8fe6 zhenpengzheng 2021-07-13  240  			advertising |= ADVERTISED_10baseT_Full;
a493f74ade8fe6 zhenpengzheng 2021-07-13  241  	}
a493f74ade8fe6 zhenpengzheng 2021-07-13  242  
a493f74ade8fe6 zhenpengzheng 2021-07-13  243  	if (autoneg) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  244  		supported |= SUPPORTED_Autoneg;
a493f74ade8fe6 zhenpengzheng 2021-07-13  245  		advertising |= ADVERTISED_Autoneg;
a493f74ade8fe6 zhenpengzheng 2021-07-13  246  		cmd->base.autoneg = AUTONEG_ENABLE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  247  	} else
a493f74ade8fe6 zhenpengzheng 2021-07-13  248  		cmd->base.autoneg = AUTONEG_DISABLE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  249  
a493f74ade8fe6 zhenpengzheng 2021-07-13  250  	/* Determine the remaining settings based on the PHY type. */
a493f74ade8fe6 zhenpengzheng 2021-07-13  251  	switch (adapter->hw.phy.type) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  252  	case txgbe_phy_tn:
a493f74ade8fe6 zhenpengzheng 2021-07-13  253  	case txgbe_phy_aq:
a493f74ade8fe6 zhenpengzheng 2021-07-13  254  	case txgbe_phy_cu_unknown:
a493f74ade8fe6 zhenpengzheng 2021-07-13  255  		supported |= SUPPORTED_TP;
a493f74ade8fe6 zhenpengzheng 2021-07-13  256  		advertising |= ADVERTISED_TP;
a493f74ade8fe6 zhenpengzheng 2021-07-13  257  		cmd->base.port = PORT_TP;
a493f74ade8fe6 zhenpengzheng 2021-07-13  258  		break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  259  	case txgbe_phy_qt:
a493f74ade8fe6 zhenpengzheng 2021-07-13  260  		supported |= SUPPORTED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  261  		advertising |= ADVERTISED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  262  		cmd->base.port = PORT_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  263  		break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  264  	case txgbe_phy_nl:
a493f74ade8fe6 zhenpengzheng 2021-07-13  265  	case txgbe_phy_sfp_passive_tyco:
a493f74ade8fe6 zhenpengzheng 2021-07-13  266  	case txgbe_phy_sfp_passive_unknown:
a493f74ade8fe6 zhenpengzheng 2021-07-13  267  	case txgbe_phy_sfp_ftl:
a493f74ade8fe6 zhenpengzheng 2021-07-13  268  	case txgbe_phy_sfp_avago:
a493f74ade8fe6 zhenpengzheng 2021-07-13  269  	case txgbe_phy_sfp_intel:
a493f74ade8fe6 zhenpengzheng 2021-07-13  270  	case txgbe_phy_sfp_unknown:
a493f74ade8fe6 zhenpengzheng 2021-07-13  271  		switch (adapter->hw.phy.sfp_type) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  272  			/* SFP+ devices, further checking needed */
a493f74ade8fe6 zhenpengzheng 2021-07-13  273  		case txgbe_sfp_type_da_cu:
a493f74ade8fe6 zhenpengzheng 2021-07-13  274  		case txgbe_sfp_type_da_cu_core0:
a493f74ade8fe6 zhenpengzheng 2021-07-13  275  		case txgbe_sfp_type_da_cu_core1:
a493f74ade8fe6 zhenpengzheng 2021-07-13  276  			supported |= SUPPORTED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  277  			advertising |= ADVERTISED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  278  			cmd->base.port = PORT_DA;
a493f74ade8fe6 zhenpengzheng 2021-07-13  279  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  280  		case txgbe_sfp_type_sr:
a493f74ade8fe6 zhenpengzheng 2021-07-13  281  		case txgbe_sfp_type_lr:
a493f74ade8fe6 zhenpengzheng 2021-07-13  282  		case txgbe_sfp_type_srlr_core0:
a493f74ade8fe6 zhenpengzheng 2021-07-13  283  		case txgbe_sfp_type_srlr_core1:
a493f74ade8fe6 zhenpengzheng 2021-07-13  284  		case txgbe_sfp_type_1g_sx_core0:
a493f74ade8fe6 zhenpengzheng 2021-07-13  285  		case txgbe_sfp_type_1g_sx_core1:
a493f74ade8fe6 zhenpengzheng 2021-07-13  286  		case txgbe_sfp_type_1g_lx_core0:
a493f74ade8fe6 zhenpengzheng 2021-07-13  287  		case txgbe_sfp_type_1g_lx_core1:
a493f74ade8fe6 zhenpengzheng 2021-07-13  288  			supported |= SUPPORTED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  289  			advertising |= ADVERTISED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  290  			cmd->base.port = PORT_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  291  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  292  		case txgbe_sfp_type_not_present:
a493f74ade8fe6 zhenpengzheng 2021-07-13  293  			supported |= SUPPORTED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  294  			advertising |= ADVERTISED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  295  			cmd->base.port = PORT_NONE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  296  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  297  		case txgbe_sfp_type_1g_cu_core0:
a493f74ade8fe6 zhenpengzheng 2021-07-13  298  		case txgbe_sfp_type_1g_cu_core1:
a493f74ade8fe6 zhenpengzheng 2021-07-13  299  			supported |= SUPPORTED_TP;
a493f74ade8fe6 zhenpengzheng 2021-07-13  300  			advertising |= ADVERTISED_TP;
a493f74ade8fe6 zhenpengzheng 2021-07-13  301  			cmd->base.port = PORT_TP;
a493f74ade8fe6 zhenpengzheng 2021-07-13  302  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  303  		case txgbe_sfp_type_unknown:
a493f74ade8fe6 zhenpengzheng 2021-07-13  304  		default:
a493f74ade8fe6 zhenpengzheng 2021-07-13  305  			supported |= SUPPORTED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  306  			advertising |= ADVERTISED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  307  			cmd->base.port = PORT_OTHER;
a493f74ade8fe6 zhenpengzheng 2021-07-13  308  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  309  		}
a493f74ade8fe6 zhenpengzheng 2021-07-13  310  		break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  311  	case txgbe_phy_xaui:
a493f74ade8fe6 zhenpengzheng 2021-07-13  312  		supported |= SUPPORTED_TP;
a493f74ade8fe6 zhenpengzheng 2021-07-13  313  		advertising |= ADVERTISED_TP;
a493f74ade8fe6 zhenpengzheng 2021-07-13  314  		cmd->base.port = PORT_TP;
a493f74ade8fe6 zhenpengzheng 2021-07-13  315  		break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  316  	case txgbe_phy_unknown:
a493f74ade8fe6 zhenpengzheng 2021-07-13  317  	case txgbe_phy_generic:
a493f74ade8fe6 zhenpengzheng 2021-07-13  318  	case txgbe_phy_sfp_unsupported:
a493f74ade8fe6 zhenpengzheng 2021-07-13  319  	default:
a493f74ade8fe6 zhenpengzheng 2021-07-13  320  		supported |= SUPPORTED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  321  		advertising |= ADVERTISED_FIBRE;
a493f74ade8fe6 zhenpengzheng 2021-07-13  322  		cmd->base.port = PORT_OTHER;
a493f74ade8fe6 zhenpengzheng 2021-07-13  323  		break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  324  	}
a493f74ade8fe6 zhenpengzheng 2021-07-13  325  
a493f74ade8fe6 zhenpengzheng 2021-07-13  326  	if (!in_interrupt()) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  327  		TCALL(hw, mac.ops.check_link, &link_speed, &link_up, false);
a493f74ade8fe6 zhenpengzheng 2021-07-13  328  	} else {
a493f74ade8fe6 zhenpengzheng 2021-07-13  329  		/*
a493f74ade8fe6 zhenpengzheng 2021-07-13  330  		 * this case is a special workaround for RHEL5 bonding
a493f74ade8fe6 zhenpengzheng 2021-07-13  331  		 * that calls this routine from interrupt context
a493f74ade8fe6 zhenpengzheng 2021-07-13  332  		 */
a493f74ade8fe6 zhenpengzheng 2021-07-13  333  		link_speed = adapter->link_speed;
a493f74ade8fe6 zhenpengzheng 2021-07-13  334  		link_up = adapter->link_up;
a493f74ade8fe6 zhenpengzheng 2021-07-13  335  	}
a493f74ade8fe6 zhenpengzheng 2021-07-13  336  
a493f74ade8fe6 zhenpengzheng 2021-07-13  337  	supported |= SUPPORTED_Pause;
a493f74ade8fe6 zhenpengzheng 2021-07-13  338  
a493f74ade8fe6 zhenpengzheng 2021-07-13  339  	switch (hw->fc.requested_mode) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  340  	case txgbe_fc_full:
a493f74ade8fe6 zhenpengzheng 2021-07-13  341  		advertising |= ADVERTISED_Pause;
a493f74ade8fe6 zhenpengzheng 2021-07-13  342  		break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  343  	case txgbe_fc_rx_pause:
a493f74ade8fe6 zhenpengzheng 2021-07-13  344  		advertising |= ADVERTISED_Pause |
a493f74ade8fe6 zhenpengzheng 2021-07-13  345  					   ADVERTISED_Asym_Pause;
a493f74ade8fe6 zhenpengzheng 2021-07-13  346  		break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  347  	case txgbe_fc_tx_pause:
a493f74ade8fe6 zhenpengzheng 2021-07-13  348  		advertising |= ADVERTISED_Asym_Pause;
a493f74ade8fe6 zhenpengzheng 2021-07-13  349  		break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  350  	default:
a493f74ade8fe6 zhenpengzheng 2021-07-13  351  		advertising &= ~(ADVERTISED_Pause |
a493f74ade8fe6 zhenpengzheng 2021-07-13  352  						 ADVERTISED_Asym_Pause);
a493f74ade8fe6 zhenpengzheng 2021-07-13  353  	}
a493f74ade8fe6 zhenpengzheng 2021-07-13  354  
a493f74ade8fe6 zhenpengzheng 2021-07-13  355  	if (link_up) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  356  		switch (link_speed) {
a493f74ade8fe6 zhenpengzheng 2021-07-13  357  		case TXGBE_LINK_SPEED_10GB_FULL:
a493f74ade8fe6 zhenpengzheng 2021-07-13  358  			cmd->base.speed = SPEED_10000;
a493f74ade8fe6 zhenpengzheng 2021-07-13  359  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  360  		case TXGBE_LINK_SPEED_1GB_FULL:
a493f74ade8fe6 zhenpengzheng 2021-07-13  361  			cmd->base.speed = SPEED_1000;
a493f74ade8fe6 zhenpengzheng 2021-07-13  362  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  363  		case TXGBE_LINK_SPEED_100_FULL:
a493f74ade8fe6 zhenpengzheng 2021-07-13  364  			cmd->base.speed = SPEED_100;
a493f74ade8fe6 zhenpengzheng 2021-07-13  365  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  366  		case TXGBE_LINK_SPEED_10_FULL:
a493f74ade8fe6 zhenpengzheng 2021-07-13  367  			cmd->base.speed = SPEED_10;
a493f74ade8fe6 zhenpengzheng 2021-07-13  368  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  369  		default:
a493f74ade8fe6 zhenpengzheng 2021-07-13  370  			break;
a493f74ade8fe6 zhenpengzheng 2021-07-13  371  		}
a493f74ade8fe6 zhenpengzheng 2021-07-13  372  		cmd->base.duplex = DUPLEX_FULL;
a493f74ade8fe6 zhenpengzheng 2021-07-13  373  	} else {
a493f74ade8fe6 zhenpengzheng 2021-07-13  374  		cmd->base.speed = -1;
a493f74ade8fe6 zhenpengzheng 2021-07-13  375  		cmd->base.duplex = -1;
a493f74ade8fe6 zhenpengzheng 2021-07-13  376  	}
a493f74ade8fe6 zhenpengzheng 2021-07-13  377  
a493f74ade8fe6 zhenpengzheng 2021-07-13  378  	ethtool_convert_legacy_u32_to_link_mode(cmd->link_modes.supported,
a493f74ade8fe6 zhenpengzheng 2021-07-13  379  						supported);
a493f74ade8fe6 zhenpengzheng 2021-07-13  380  	ethtool_convert_legacy_u32_to_link_mode(cmd->link_modes.advertising,
a493f74ade8fe6 zhenpengzheng 2021-07-13  381  						advertising);
a493f74ade8fe6 zhenpengzheng 2021-07-13  382  	return 0;
a493f74ade8fe6 zhenpengzheng 2021-07-13  383  }
a493f74ade8fe6 zhenpengzheng 2021-07-13  384  

:::::: The code at line 177 was first introduced by commit
:::::: a493f74ade8fe69f3446a65ddf7627fdf34c183c net: txgbe: Add support for Netswift 10G NIC

:::::: TO: zhenpengzheng <zhenpengzheng@net-swift.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
