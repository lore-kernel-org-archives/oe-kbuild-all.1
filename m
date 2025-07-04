Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D7026D4C6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 23:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751672697; cv=none; b=cCeiBiNYM1fdyYez6vMDktqi0kFS4GjsmAFMWaTV9Da3VNZ2T3fa7+8VIaRYNrFKnxu/gED8okiEjEiAsAy3d60uQMHpGql7BaY4TDbEFw21Qa0CIlHGI9bDRynrLym4FDqGOnFuWn3gMENGM1pG38qzusA3h11KHNHePD/ME2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751672697; c=relaxed/simple;
	bh=qcEDtOZ6Pr1ydIBQ29L2sBs87kRejUvVMse8Ig+Ij60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d3aGqwjLn1UnsOwQp2U8ZcGoCZUed8GOi80rRAT1IW7Zz4eiXoY7wdQGXJwOtSelbWMZlo2iACQ8x5S/fexoa0tJsXYZsQ7hOiZnrImTNSOt4gdb2/zuLQhajdwJ306QRBo6LPAsJ9iEC9KmBawslsF+FeQE8C7hG2Li1fIxzL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMgoOYHY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMgoOYHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751672695; x=1783208695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qcEDtOZ6Pr1ydIBQ29L2sBs87kRejUvVMse8Ig+Ij60=;
  b=WMgoOYHYKWbI4hg56yyDtZgmlni/vi5xepyTMCho7ZT+WUYlL4dLZpls
   vGJ5pfikWVwHPqKnLOWYjkVv32mkG4upHHsRJjJn40NMeaEdaoZmNIZWJ
   l3Bi+bZjgMtUaouZF+CdryG4ncne2WMIPjyO8KlgazxS2sBeDhJ4R2Vca
   PaQXqw2eCeGwu9oBosfoxooguQZMjTP6IrpNP+jrmhsmT7PxSeizcZCEw
   ZNbvZr9UmhOP5dt9Dr/zcUK3+pZXScGXBBdNmwg2NAo2fj3RGbjccdJhd
   vL2soKouCBE7wIA5Xkb4l/vE1m1PwY5uDSz+mG406ZX4TORcC36w+MFPn
   w==;
X-CSE-ConnectionGUID: T3/gjjrNT2OY4Ep/dNFNgg==
X-CSE-MsgGUID: of5hDchFQcaTUrv4MlCAgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65053104"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="65053104"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 16:44:54 -0700
X-CSE-ConnectionGUID: XqxEh2rCTeirReuAEN+D5g==
X-CSE-MsgGUID: IveR3x57R6Oi9j4oulOalg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="178396014"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2025 16:44:53 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXq5L-000495-1b;
	Fri, 04 Jul 2025 23:44:51 +0000
Date: Sat, 5 Jul 2025 07:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2464/2464]
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:5611:11: warning: default
 initialization of an object of type 'const u8[6]' (aka 'const unsigned
 char[6]') leaves the object uninitialized
Message-ID: <202507050704.uDK4BfSC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   016a2eb38be5e29bea5011bd5fed627886f59f65
commit: eba3cbcfeafedc65b74eea8faf68aae00aebd5b6 [2464/2464] drivers: initial support for rnpgbe drivers from Mucse Technology
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250705/202507050704.uDK4BfSC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050704.uDK4BfSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050704.uDK4BfSC-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                   ^
   In file included from drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:35:
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |              ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |                       ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |             ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |                       ^
   In file included from drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:40:
   In file included from include/net/vxlan.h:7:
   In file included from include/net/udp_tunnel.h:5:
   In file included from include/net/ip_tunnels.h:19:
   In file included from include/net/dst_cache.h:8:
   include/net/ip6_fib.h:269:10: warning: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     269 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:126:3: note: expanded from macro 'time_after'
     126 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:271:6: warning: no previous prototype for function 'rnpgbe_disable_eee_mode' [-Wmissing-prototypes]
     271 | void rnpgbe_disable_eee_mode(struct rnpgbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:271:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     271 | void rnpgbe_disable_eee_mode(struct rnpgbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:730:5: warning: no previous prototype for function 'rnpgbe_rx_ring_reinit' [-Wmissing-prototypes]
     730 | int rnpgbe_rx_ring_reinit(struct rnpgbe_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:730:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     730 | int rnpgbe_rx_ring_reinit(struct rnpgbe_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:1933:7: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1933 |         bool xdp_xmit = false;
         |              ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2170:6: warning: no previous prototype for function 'rnpgbe_write_eitr_rx' [-Wmissing-prototypes]
    2170 | void rnpgbe_write_eitr_rx(struct rnpgbe_q_vector *q_vector)
         |      ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2170 | void rnpgbe_write_eitr_rx(struct rnpgbe_q_vector *q_vector)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2350:6: warning: variable 'cleaned_total' set but not used [-Wunused-but-set-variable]
    2350 |         int cleaned_total = 0;
         |             ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2893:6: warning: variable 'rxctrl' set but not used [-Wunused-but-set-variable]
    2893 |         u32 rxctrl = 0, dma_axi_ctl;
         |             ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3209:6: warning: no previous prototype for function 'rnpgbe_vlan_stags_flag' [-Wmissing-prototypes]
    3209 | void rnpgbe_vlan_stags_flag(struct rnpgbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3209 | void rnpgbe_vlan_stags_flag(struct rnpgbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3314:6: warning: no previous prototype for function 'rnpgbe_reinit_locked' [-Wmissing-prototypes]
    3314 | void rnpgbe_reinit_locked(struct rnpgbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3314:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3314 | void rnpgbe_reinit_locked(struct rnpgbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3487:5: warning: no previous prototype for function 'rnpgbe_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3487 | int rnpgbe_xmit_nop_frame_ring(struct rnpgbe_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3487:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3487 | int rnpgbe_xmit_nop_frame_ring(struct rnpgbe_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3503:6: warning: no previous prototype for function 'print_status' [-Wmissing-prototypes]
    3503 | void print_status(struct rnpgbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3503:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3503 | void print_status(struct rnpgbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4624:6: warning: no previous prototype for function 'rnpgbe_eee_init' [-Wmissing-prototypes]
    4624 | bool rnpgbe_eee_init(struct rnpgbe_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4624:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4624 | bool rnpgbe_eee_init(struct rnpgbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4651:5: warning: no previous prototype for function 'rnpgbe_phy_init_eee' [-Wmissing-prototypes]
    4651 | int rnpgbe_phy_init_eee(struct rnpgbe_adapter *adapter)
         |     ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4651:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4651 | int rnpgbe_phy_init_eee(struct rnpgbe_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:5611:11: warning: default initialization of an object of type 'const u8[6]' (aka 'const unsigned char[6]') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    5611 |         const u8 target_addr[ETH_ALEN];
         |                  ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6132:6: warning: no previous prototype for function 'rnpgbe_assign_netdev_ops' [-Wmissing-prototypes]
    6132 | void rnpgbe_assign_netdev_ops(struct net_device *dev)
         |      ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6132:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6132 | void rnpgbe_assign_netdev_ops(struct net_device *dev)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6166:29: warning: unused function 'rnpgbe_tso_features' [-Wunused-function]
    6166 | static inline unsigned long rnpgbe_tso_features(struct rnpgbe_hw *hw)
         |                             ^~~~~~~~~~~~~~~~~~~
   26 warnings generated.


vim +5611 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c

  5598	
  5599	/**
  5600	 * rnpgbe_set_mac - Change the Ethernet Address of the NIC
  5601	 * @netdev: network interface device structure
  5602	 * @p: pointer to an address structure
  5603	 *
  5604	 * Returns 0 on success, negative on failure
  5605	 **/
  5606	static int rnpgbe_set_mac(struct net_device *netdev, void *p)
  5607	{
  5608		struct rnpgbe_adapter *adapter = netdev_priv(netdev);
  5609		struct rnpgbe_hw *hw = &adapter->hw;
  5610		struct sockaddr *addr = p;
> 5611		const u8 target_addr[ETH_ALEN];
  5612		bool sriov_flag = !!(adapter->flags & RNP_FLAG_SRIOV_ENABLED);
  5613	
  5614		memcpy((void *)target_addr, addr->sa_data, netdev->addr_len);
  5615	
  5616		if (!is_valid_ether_addr(target_addr))
  5617			return -EADDRNOTAVAIL;
  5618	
  5619		eth_hw_addr_set(netdev, target_addr);
  5620		memcpy(hw->mac.addr, addr->sa_data, netdev->addr_len);
  5621		hw->ops.set_mac(hw, hw->mac.addr, sriov_flag);
  5622		/* reset veb table */
  5623		rnpgbe_configure_virtualization(adapter);
  5624	
  5625		return 0;
  5626	}
  5627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
