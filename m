Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6842114
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 02:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737339517; cv=none; b=UFq93IjNSNwuo5TplpOIhlEPgOU6TM36zmUEg6aiToy6Cs9b5FdHFSfX0IBv2NHsevftO6TGxtR0npIHJrjRNFwmhgvfqCPM9t3QGqNTI4NlO3O4Co8Kj0NyDdD9bOXqOHqmoMNn/5V7UrpKR/7Jo2nNytshn20AkL39UZbuxgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737339517; c=relaxed/simple;
	bh=B1vYqCyuJSjylZZYPkdma9J/H8hiCmxWfa0pZmBJiAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvRWzzCxqr+4vpEkfROTGhgEOdi96X/ttK/ZbIwmGMXYbeL6xVbwCykjxI1ORg1y4SonlyNN/uxK0Xc3dm8nbcOR7r3jDBIDlba4yQP7XUanilqyx+h5zP2Xn4Eme5bF6nFaUjCczlC2YtgmORapUct6YtkkGRnsaL8fWgfBDDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KP2FSxKA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KP2FSxKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737339514; x=1768875514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1vYqCyuJSjylZZYPkdma9J/H8hiCmxWfa0pZmBJiAU=;
  b=KP2FSxKA/CFOAEj4L12DtgcvBxpuhxz4v6PyzJJlNQdf8D23nxxdi4Rg
   tNzQkdHjvmrO3fc0KCUjTKQAYFJ4UM4dj5aKUjfmr0wTSDegvV9nyTB0v
   SaRJcCV3QFGHTYv4su0n7B0Wt1j97YT1FX81x/o3AwRBvTLkMV4CnIKDJ
   nRk7tsjhpGTi6Y4C1HkAkL0plHaG0GddgLzeDep9MTKwuOT2/GKhiEDC9
   WvCoFoDV4eLoGIUt4lGTa1aRwh5fije3CzWpVE32RoXDQbnfgV/AeBPBK
   /Igto3qroJ4XgtBWHDQKrAXVTG46OR2bqhyzexQv76TPsvgjnVU/dq0hc
   A==;
X-CSE-ConnectionGUID: 0SoB5+YrROCFHUkDVIvJJA==
X-CSE-MsgGUID: JkV03OlrTSSkF+86+sLVSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41620623"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41620623"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 18:18:33 -0800
X-CSE-ConnectionGUID: jLmqXhTJT7m8yYesxsZ5ew==
X-CSE-MsgGUID: /X7+53vLT/6mIArpp0gHFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111442782"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2025 18:18:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZhMz-000W4f-20;
	Mon, 20 Jan 2025 02:18:29 +0000
Date: Mon, 20 Jan 2025 10:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: WARNING: modpost: EXPORT symbol "csum_partial_copy_generic"
 [vmlinux] version generation failed, symbol will not be versioned.
Message-ID: <202501201054.RURSBreX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: ff3f78607998274460f1742a7dfd853c6124d34a um: Use the x86 checksum implementation on 32-bit
date:   1 year, 5 months ago
config: um-randconfig-r053-20231219 (https://download.01.org/0day-ci/archive/20250120/202501201054.RURSBreX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201054.RURSBreX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201054.RURSBreX-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/mdio_devres.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/bcm87xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/mdio/mdio-bitbang.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ethernet/qualcomm/rmnet/rmnet.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/brcmfmac-wcc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/brcmfmac-cyw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/brcmfmac-bca.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wlcore/wlcore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ti/wl18xx/wl18xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ipvlan/ipvtap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/tap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/bsd_comp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_synctty.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/slip/slip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/slip/slhc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/netdevsim/netdevsim.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/atmel-sha204a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-evision.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-razer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-waltop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/core/dev_addr_lists_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/core/selftests.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/stp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/garp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_htb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_hfsc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_gred.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_netem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_skbprio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_choke.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_qfq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netlink/netlink_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack_netlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack_broadcast.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_tables.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nft_fib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nft_chain_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_wrr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_wlc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblcr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_dh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_nq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_twos.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_defrag_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_defrag_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_reject_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xdp/xsk_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/nf_conntrack_bridge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/kcm/kcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/6lowpan/ieee802154_6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/ieee802154_socket.o
WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "csum_partial_copy_generic" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial_copy_generic" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "csum_partial" [lib/checksum_kunit.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/netfilter/ipvs/ip_vs.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv4/netfilter/nf_nat_snmp_basic.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv6/netfilter/nf_defrag_ipv6.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv6/netfilter/nf_reject_ipv6.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv6/netfilter/ip6t_NPT.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/wireless/cfg80211.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/bridge/bridge.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/mac80211/mac80211.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/openvswitch/openvswitch.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/nsh/nsh.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
