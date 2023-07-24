Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D941A1094E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 21:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690235512; x=1721771512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8R3JwV7vltsgw0ptBPIAXkrQCq+zq1YEajT/2OH35/U=;
  b=D4PHgItngYmZXdf1MTjXsWNKAyLyvHtQDx62+upvyuOl3wcPUkWeG+9T
   2DdWQl0CS6v0GY8VfdRkpkMN97CQDUQSF47iCiTYwnQg3vkqvZHGD2Ld+
   9j+5G6IZfXAehjJ5LWao4vdrku1yHeMBnGz2Nl5nF3e4XVJGuhESvC73T
   694gqWZyz/8W8wUhy3eWy4YiY1pKo5Ay8hRkTy78XYUhJuqF5SZxs60St
   jwtw9yB9VlkgOfMumqMbKdlNYq7c+zphKIQCxy0cENERmBuHRxO1xRzoJ
   1wzWpVmLOPrp9CaXiUGwqHNuW47Omfm+Qj3N0hIY/q2ZUs8g0sEjCW+x4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="371164155"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="371164155"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 14:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="703045070"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="703045070"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Jul 2023 14:51:50 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO3T2-000A3Y-2g;
	Mon, 24 Jul 2023 21:51:48 +0000
Date: Tue, 25 Jul 2023 05:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>, Minda Chen <minda.chen@starfivetech.com>
Subject: [phy:next 50/55] ERROR: modpost: "devm_platform_ioremap_resource"
 [drivers/phy/starfive/phy-jh7110-dphy-rx.ko] undefined!
Message-ID: <202307250509.oeudxG28-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   486392f44dd96aeb34bbbc1b119bc5d332f1164f
commit: f8aa660841bca12aed51c967ed9bdaf1d97996ed [50/55] phy: starfive: Add mipi dphy rx support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230725/202307250509.oeudxG28-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250509.oeudxG28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250509.oeudxG28-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_dh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_nq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_twos.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_ftp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_pe_sip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_defrag_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_reject_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/xfrm4_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_defrag_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_reject_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/xfrm6_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/mip6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ip6_udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ar9331.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_brcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_dsa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_gswip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_hellcreek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ksz.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_lan9303.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_mtk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_none.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot_8021q.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_qca.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl4_a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl8_4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rzn1_a5psw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_sja1105.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_trailer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_xrs700x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xdp/xsk_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_crypto_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_token_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/nf_conntrack_bridge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtables.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_broute.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_filter.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/sunrpc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/auth_rpcgss.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/rpcsec_gss_krb5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/kcm/kcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_usb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/6lowpan/ieee802154_6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/ieee802154_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nfc_digital.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/vmw_vsock/vsock_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/hsr/hsr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/cio/ccwgroup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/cio/vfio_ccw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/block/dasd_diag_mod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/block/dasd_eckd_mod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/block/dasd_fba_mod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/block/dcssblk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/char/raw3270.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/char/con3270.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/char/fs3270.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/net/lcs.o
>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/phy/starfive/phy-jh7110-dphy-rx.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
WARNING: modpost: suppressed 13 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
