Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F025B080
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 23:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779579661; cv=none; b=VIzm+ONsqoJtNk2EEKGkAx8dklX1SGILnS/om2G6M8pv/hfCMksWww7/h+opeKOFXGbz+Y2MCh6ItQi+XN1+xvbMpZltfKKCFP6h4hFda1cpWil4xusZzzWmA9/IZIo1u0/lLT8V3amJIfLUgsLeFsDFqggZoIogTkN+LzE1LnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779579661; c=relaxed/simple;
	bh=5ioMsOZAvG0MT45S0Rpju/DGC0uDxJkgQDkCyxO/f58=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pu0IYPhEnRwigFI5zRPnV/cM0LIS6457smgTtUzEu3KvmXKIpWhrGE7kz2ZaY8PA/fwe1hL7lL0tlWxStt5PmkbocoENuJUQOh1SRf1A3sHwdU53BZlcpt00hIcr/n4HYKg9192+3qEOyZME01FZiAuqleSa1AKbNH/w0cpxFyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYexL5e+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYexL5e+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779579659; x=1811115659;
  h=date:from:to:cc:subject:message-id;
  bh=5ioMsOZAvG0MT45S0Rpju/DGC0uDxJkgQDkCyxO/f58=;
  b=IYexL5e+qHSv2d7lxe496XSwBTGXCKPJUbSEWba2SkcaYD0DlYqDSwxk
   mEbX42N+YacgPQ8hGYXTRv20BCm0bTD57Fu6W4Y4eR0Q+cop5PdXMazoS
   G6tbnUhwJ+ASbvufPMIent2LZzFYn4qmFvxZlKWQVTSwBGVtwz+o+sK9S
   iz/P7vJj0VQw/+eMdwwtrITukTjh2UZ0udUkRoyzHdDZhlIeW48iYCHrW
   p0GXr0lHxzNOJu+v7apNMGdCHd6AejQ6n0yyqjLaM8KCoWe+irsrI5w8x
   pQak2mewflmcja09rX2ymN5Y9rG9k6CSxH1x/gu/y86LNYCz40npDN69g
   g==;
X-CSE-ConnectionGUID: mBvuJX3cQZiXWSGH6SIgjg==
X-CSE-MsgGUID: vgMoFJGuQguisKOSEE97Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="105920136"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="105920136"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 16:40:59 -0700
X-CSE-ConnectionGUID: rRkO/OhBRLWVHctLBxsacQ==
X-CSE-MsgGUID: 09qlZNbBRF2xc85l4SsagQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="241110018"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2026 16:40:57 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQvxe-000000000Pt-3BEz;
	Sat, 23 May 2026 23:40:54 +0000
Date: Sun, 24 May 2026 07:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 6898/8157]
 drivers/net/dsa/netc/netc_main.c:1334:undefined reference to
 `ntmp_bpt_update_entry'
Message-ID: <202605240706.EuGmnrz5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c1ecb239fa3456529a32255359fc78b69eb9d847
commit: a5ccb7f5e067eae23707a61e4fc5d6214b0e4777 [6898/8157] net: dsa: netc: initialize buffer pool table and implement flow-control
config: openrisc-randconfig-r111-20260523 (https://download.01.org/0day-ci/archive/20260524/202605240706.EuGmnrz5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240706.EuGmnrz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240706.EuGmnrz5-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
   `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_mac_link_up':
>> drivers/net/dsa/netc/netc_main.c:1334:(.text+0x580): undefined reference to `ntmp_bpt_update_entry'
>> drivers/net/dsa/netc/netc_main.c:1334:(.text+0x580): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_bpt_update_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_fdb_dump':
   drivers/net/dsa/netc/netc_main.c:1067:(.text+0x72c): undefined reference to `ntmp_fdbt_search_port_entry'
   drivers/net/dsa/netc/netc_main.c:1067:(.text+0x72c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_fdbt_search_port_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_remove_all_cbdrs':
   drivers/net/dsa/netc/netc_main.c:323:(.text+0x944): undefined reference to `ntmp_free_cbdr'
   drivers/net/dsa/netc/netc_main.c:323:(.text+0x944): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_free_cbdr'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:323:(.text+0x95c): undefined reference to `ntmp_free_cbdr'
   drivers/net/dsa/netc/netc_main.c:323:(.text+0x95c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_free_cbdr'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_fdb_del':
   drivers/net/dsa/netc/netc_main.c:602:(.text+0xab0): undefined reference to `ntmp_fdbt_update_entry'
   drivers/net/dsa/netc/netc_main.c:602:(.text+0xab0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_fdbt_update_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:611:(.text+0xad4): undefined reference to `ntmp_fdbt_delete_entry'
   drivers/net/dsa/netc/netc_main.c:611:(.text+0xad4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_fdbt_delete_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_init_all_ports':
   drivers/net/dsa/netc/netc_main.c:138:(.text+0x12b4): undefined reference to `enetc_hw_alloc'
   drivers/net/dsa/netc/netc_main.c:138:(.text+0x12b4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `enetc_hw_alloc'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:148:(.text+0x12f8): undefined reference to `enetc_mdio_read_c22'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:148:(.text+0x12fc): undefined reference to `enetc_mdio_read_c22'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:149:(.text+0x1304): undefined reference to `enetc_mdio_write_c22'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:149:(.text+0x1308): undefined reference to `enetc_mdio_write_c22'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:150:(.text+0x1310): undefined reference to `enetc_mdio_read_c45'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:150:(.text+0x1314): undefined reference to `enetc_mdio_read_c45'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:151:(.text+0x131c): undefined reference to `enetc_mdio_write_c45'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:151:(.text+0x1320): undefined reference to `enetc_mdio_write_c45'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_set_host_flood':
   drivers/net/dsa/netc/netc_main.c:1158:(.text+0x1a44): undefined reference to `ntmp_ipft_add_entry'
   drivers/net/dsa/netc/netc_main.c:1158:(.text+0x1a44): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_ipft_add_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:1181:(.text+0x1ae8): undefined reference to `ntmp_ipft_delete_entry'
   drivers/net/dsa/netc/netc_main.c:1181:(.text+0x1ae8): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_ipft_delete_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_set_fdb_entry.constprop.0':
   drivers/net/dsa/netc/netc_main.c:509:(.text+0x1d34): undefined reference to `ntmp_fdbt_add_entry'
   drivers/net/dsa/netc/netc_main.c:509:(.text+0x1d34): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_fdbt_add_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:559:(.text+0x1de0): undefined reference to `ntmp_fdbt_update_entry'
   drivers/net/dsa/netc/netc_main.c:559:(.text+0x1de0): additional relocation overflows omitted from the output
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_setup':
   drivers/net/dsa/netc/netc_main.c:304:(.text+0x2024): undefined reference to `ntmp_init_cbdr'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:313:(.text+0x2070): undefined reference to `ntmp_free_cbdr'
>> or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:714:(.text+0x2234): undefined reference to `ntmp_bpt_update_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:475:(.text+0x23d8): undefined reference to `ntmp_vft_add_entry'
   `.exit.text' referenced in section `__jump_table' of drivers/media/common/siano/smscoreapi.o: defined in discarded section `.exit.text' of drivers/media/common/siano/smscoreapi.o
   `.exit.text' referenced in section `__jump_table' of drivers/media/common/siano/smscoreapi.o: defined in discarded section `.exit.text' of drivers/media/common/siano/smscoreapi.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NXP_NTMP
   Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=n]
   Selected by [y]:
   - NET_DSA_NETC_SWITCH [=y] && NETDEVICES [=y] && (ARM64 || COMPILE_TEST [=y]) && NET_DSA [=y] && PCI [=y]
   WARNING: unmet direct dependencies detected for NXP_NETC_LIB
   Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=n]
   Selected by [y]:
   - NET_DSA_NETC_SWITCH [=y] && NETDEVICES [=y] && (ARM64 || COMPILE_TEST [=y]) && NET_DSA [=y] && PCI [=y]
   WARNING: unmet direct dependencies detected for FSL_ENETC_MDIO
   Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=n] && PCI [=y] && PHYLIB [=y]
   Selected by [y]:
   - NET_DSA_NETC_SWITCH [=y] && NETDEVICES [=y] && (ARM64 || COMPILE_TEST [=y]) && NET_DSA [=y] && PCI [=y]


vim +1334 drivers/net/dsa/netc/netc_main.c

  1309	
  1310	static void netc_port_set_tx_pause(struct netc_port *np, bool tx_pause)
  1311	{
  1312		struct netc_switch *priv = np->switch_priv;
  1313		int port = np->dp->index;
  1314		int i, j, num_bp;
  1315	
  1316		num_bp = priv->num_bp / priv->info->num_ports;
  1317		for (i = 0, j = port * num_bp; i < num_bp; i++, j++) {
  1318			struct bpt_cfge_data *cfge = &priv->bpt_list[j];
  1319			struct bpt_cfge_data old_cfge = *cfge;
  1320	
  1321			if (tx_pause) {
  1322				cfge->fc_on_thresh = cpu_to_le16(NETC_FC_THRESH_ON);
  1323				cfge->fc_off_thresh = cpu_to_le16(NETC_FC_THRESH_OFF);
  1324				cfge->fccfg_sbpen = FIELD_PREP(BPT_FC_CFG,
  1325							       BPT_FC_CFG_EN_BPFC);
  1326				cfge->fc_ports = cpu_to_le32(BIT(port));
  1327			} else {
  1328				cfge->fc_on_thresh = cpu_to_le16(0);
  1329				cfge->fc_off_thresh = cpu_to_le16(0);
  1330				cfge->fccfg_sbpen = 0;
  1331				cfge->fc_ports = cpu_to_le32(0);
  1332			}
  1333	
> 1334			if (ntmp_bpt_update_entry(&priv->ntmp, j, cfge)) {
  1335				*cfge = old_cfge;
  1336				dev_warn(priv->dev,
  1337					 "Failed to %s TX pause of buffer pool %d (swp%d)\n",
  1338					 tx_pause ? "enable" : "disable", j, port);
  1339			}
  1340		}
  1341	}
  1342	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
