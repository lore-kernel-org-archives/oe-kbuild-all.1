Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5885F35972
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 16:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779553769; cv=none; b=FUlH3FL2637YwqaCDyddteiivTHjEOL5OE3Z7lbON6NmqJD206gLCd5aEfEEj9L3acEfysj93+DVYxz3gQ/5/pJ95U0JvAT59UY7rcgs18ceiFrfM2TZ59/vgXKoxIE3qupynRTrRmUMCB+vRAOX3Qjpi5fvEULqUZu8xDJEfQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779553769; c=relaxed/simple;
	bh=Omy3IzerX5G3LyrdGMswu7zSCST5OiQYoavtkFjZCNk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ac2CnFdJfKKF+8m+ue4N5R9QxP8ojrUw764Tx83U5cMvW4y68138odB18xX7IYTxI7dSL2744YxjQ9SPqfbL9LNOnOIAD/WfjQhfcT+rbgEHn3lif0bKddYfYeRKc+9X9EE1kWHjKkGrE1WPG+If7Me5qs0JP2/TULtYlJd00gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/GLJ+nE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/GLJ+nE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779553767; x=1811089767;
  h=date:from:to:cc:subject:message-id;
  bh=Omy3IzerX5G3LyrdGMswu7zSCST5OiQYoavtkFjZCNk=;
  b=F/GLJ+nEcaeTY4HcAlVyUlCtU/Dpok6rZZZsakLuKcMeTJO0MPP9WZHy
   5b51NBY7EV2JdcFfjypgKztqyegoz5quM7WmEV/ksES4RUtORltAfYhaa
   vCVtj4Px80aRP/LWkYG6hw0BJHR97jIy9fVKlSXYw+8KQ0ekkTUbiI/PL
   KK0betdUGn3xLQ/dR/jPAlH6yf57bVwtofyxapEePSLsb2Th6kJna2yV6
   jMug2844Dz81DxnN7IWPqxkW4pz7i+nBPHdYqIKqdDBAiTkTMr36JAMd1
   7UFxbzbuoud5h+xgpCCOcLntdRAXaPvNrQ1Akzmi3vHD+N8d6rXjvwBcJ
   w==;
X-CSE-ConnectionGUID: VI7XmMFtShuh59gZ1Dmqsw==
X-CSE-MsgGUID: AaC4Ojc0TyaBYfAkxRLsrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91920325"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="91920325"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 09:29:27 -0700
X-CSE-ConnectionGUID: jhl3qScKQsqVcqJqWuZT5A==
X-CSE-MsgGUID: lY2YSq7pSJiix6qiQHpeGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="242999407"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2026 09:29:25 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQpE2-000000000AL-0h8w;
	Sat, 23 May 2026 16:29:22 +0000
Date: Sun, 24 May 2026 00:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 6897/8157]
 drivers/net/dsa/netc/netc_main.c:978:undefined reference to
 `ntmp_fdbt_search_port_entry'
Message-ID: <202605240046.8MvKuOMg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c1ecb239fa3456529a32255359fc78b69eb9d847
commit: 46d6407692c80b258ecba3af831130a6f6e2feea [6897/8157] net: dsa: netc: add FDB, STP, MTU, port setup and host flooding support
config: openrisc-randconfig-r111-20260523 (https://download.01.org/0day-ci/archive/20260524/202605240046.8MvKuOMg-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240046.8MvKuOMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240046.8MvKuOMg-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
   `.exit.text' referenced in section `__jump_table' of drivers/mtd/maps/pcmciamtd.o: defined in discarded section `.exit.text' of drivers/mtd/maps/pcmciamtd.o
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_fdb_dump':
>> drivers/net/dsa/netc/netc_main.c:978:(.text+0x4c4): undefined reference to `ntmp_fdbt_search_port_entry'
>> drivers/net/dsa/netc/netc_main.c:978:(.text+0x4c4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_fdbt_search_port_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_remove_all_cbdrs':
   drivers/net/dsa/netc/netc_main.c:320:(.text+0x6dc): undefined reference to `ntmp_free_cbdr'
   drivers/net/dsa/netc/netc_main.c:320:(.text+0x6dc): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_free_cbdr'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:320:(.text+0x6f4): undefined reference to `ntmp_free_cbdr'
   drivers/net/dsa/netc/netc_main.c:320:(.text+0x6f4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_free_cbdr'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_fdb_del':
>> drivers/net/dsa/netc/netc_main.c:590:(.text+0x900): undefined reference to `ntmp_fdbt_update_entry'
>> drivers/net/dsa/netc/netc_main.c:590:(.text+0x900): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_fdbt_update_entry'
>> or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:599:(.text+0x924): undefined reference to `ntmp_fdbt_delete_entry'
>> drivers/net/dsa/netc/netc_main.c:599:(.text+0x924): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_fdbt_delete_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_init_all_ports':
   drivers/net/dsa/netc/netc_main.c:138:(.text+0x1058): undefined reference to `enetc_hw_alloc'
   drivers/net/dsa/netc/netc_main.c:138:(.text+0x1058): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `enetc_hw_alloc'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:148:(.text+0x109c): undefined reference to `enetc_mdio_read_c22'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:148:(.text+0x10a0): undefined reference to `enetc_mdio_read_c22'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:149:(.text+0x10a8): undefined reference to `enetc_mdio_write_c22'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:149:(.text+0x10ac): undefined reference to `enetc_mdio_write_c22'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:150:(.text+0x10b4): undefined reference to `enetc_mdio_read_c45'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:150:(.text+0x10b8): undefined reference to `enetc_mdio_read_c45'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:151:(.text+0x10c0): undefined reference to `enetc_mdio_write_c45'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:151:(.text+0x10c4): undefined reference to `enetc_mdio_write_c45'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_set_host_flood':
>> drivers/net/dsa/netc/netc_main.c:1069:(.text+0x17e8): undefined reference to `ntmp_ipft_add_entry'
>> drivers/net/dsa/netc/netc_main.c:1069:(.text+0x17e8): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_ipft_add_entry'
>> or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:1092:(.text+0x188c): undefined reference to `ntmp_ipft_delete_entry'
>> drivers/net/dsa/netc/netc_main.c:1092:(.text+0x188c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_ipft_delete_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_set_fdb_entry.constprop.0':
>> drivers/net/dsa/netc/netc_main.c:497:(.text+0x1ad8): undefined reference to `ntmp_fdbt_add_entry'
>> drivers/net/dsa/netc/netc_main.c:497:(.text+0x1ad8): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_fdbt_add_entry'
>> or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:547:(.text+0x1b84): undefined reference to `ntmp_fdbt_update_entry'
   drivers/net/dsa/netc/netc_main.c:547:(.text+0x1b84): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ntmp_fdbt_update_entry'
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_setup':
   drivers/net/dsa/netc/netc_main.c:301:(.text+0x1da4): undefined reference to `ntmp_init_cbdr'
   drivers/net/dsa/netc/netc_main.c:301:(.text+0x1da4): additional relocation overflows omitted from the output
   or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:310:(.text+0x1df0): undefined reference to `ntmp_free_cbdr'
>> or1k-linux-ld: drivers/net/dsa/netc/netc_main.c:463:(.text+0x1fa4): undefined reference to `ntmp_vft_add_entry'
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


vim +978 drivers/net/dsa/netc/netc_main.c

   954	
   955	static int netc_port_fdb_dump(struct dsa_switch *ds, int port,
   956				      dsa_fdb_dump_cb_t *cb, void *data)
   957	{
   958		struct netc_switch *priv = ds->priv;
   959		u32 resume_eid = NTMP_NULL_ENTRY_ID;
   960		struct fdbt_entry_data *entry;
   961		struct fdbt_keye_data *keye;
   962		struct fdbt_cfge_data *cfge;
   963		u32 cfg, cnt = 0;
   964		bool is_static;
   965		int err;
   966		u16 vid;
   967	
   968		entry = kmalloc_obj(*entry);
   969		if (!entry)
   970			return -ENOMEM;
   971	
   972		keye = &entry->keye;
   973		cfge = &entry->cfge;
   974		mutex_lock(&priv->fdbt_lock);
   975	
   976		do {
   977			memset(entry, 0, sizeof(*entry));
 > 978			err = ntmp_fdbt_search_port_entry(&priv->ntmp, port,
   979							  &resume_eid, entry);
   980			if (err || entry->entry_id == NTMP_NULL_ENTRY_ID)
   981				break;
   982	
   983			cfg = le32_to_cpu(cfge->cfg);
   984			is_static = (cfg & FDBT_DYNAMIC) ? false : true;
   985			vid = le16_to_cpu(keye->fid);
   986	
   987			err = cb(keye->mac_addr, vid, is_static, data);
   988			if (err)
   989				break;
   990	
   991			/* To prevent hardware malfunctions from causing an
   992			 * infinite loop.
   993			 */
   994			if (++cnt >= priv->htmcapr_num_words)
   995				break;
   996		} while (resume_eid != NTMP_NULL_ENTRY_ID);
   997	
   998		mutex_unlock(&priv->fdbt_lock);
   999		kfree(entry);
  1000	
  1001		return err;
  1002	}
  1003	
  1004	static int netc_port_mdb_add(struct dsa_switch *ds, int port,
  1005				     const struct switchdev_obj_port_mdb *mdb,
  1006				     struct dsa_db db)
  1007	{
  1008		return netc_port_fdb_add(ds, port, mdb->addr, mdb->vid, db);
  1009	}
  1010	
  1011	static int netc_port_mdb_del(struct dsa_switch *ds, int port,
  1012				     const struct switchdev_obj_port_mdb *mdb,
  1013				     struct dsa_db db)
  1014	{
  1015		return netc_port_fdb_del(ds, port, mdb->addr, mdb->vid, db);
  1016	}
  1017	
  1018	static int netc_port_add_host_flood_rule(struct netc_port *np,
  1019						 bool uc, bool mc)
  1020	{
  1021		const u8 dmac_mask[ETH_ALEN] = {0x1, 0, 0, 0, 0, 0};
  1022		struct netc_switch *priv = np->switch_priv;
  1023		struct ipft_entry_data *host_flood;
  1024		struct ipft_keye_data *keye;
  1025		struct ipft_cfge_data *cfge;
  1026		u16 src_port;
  1027		u32 cfg;
  1028		int err;
  1029	
  1030		if (!uc && !mc) {
  1031			/* Disable ingress port filter table lookup */
  1032			netc_port_wr(np, NETC_PIPFCR, 0);
  1033			np->uc = false;
  1034			np->mc = false;
  1035	
  1036			return 0;
  1037		}
  1038	
  1039		host_flood = kzalloc_obj(*host_flood);
  1040		if (!host_flood)
  1041			return -ENOMEM;
  1042	
  1043		keye = &host_flood->keye;
  1044		cfge = &host_flood->cfge;
  1045	
  1046		src_port = FIELD_PREP(IPFT_SRC_PORT, np->dp->index);
  1047		src_port |= IPFT_SRC_PORT_MASK;
  1048		keye->src_port = cpu_to_le16(src_port);
  1049	
  1050		/* If either only unicast or only multicast need to be flooded
  1051		 * to the host, we always set the mask that tests the first MAC
  1052		 * DA octet. The value should be 0 for the first bit (if unicast
  1053		 * has to be flooded) or 1 (if multicast). If both unicast and
  1054		 * multicast have to be flooded, we leave the key mask empty, so
  1055		 * it matches everything.
  1056		 */
  1057		if (uc && !mc)
  1058			ether_addr_copy(keye->dmac_mask, dmac_mask);
  1059	
  1060		if (!uc && mc) {
  1061			ether_addr_copy(keye->dmac, dmac_mask);
  1062			ether_addr_copy(keye->dmac_mask, dmac_mask);
  1063		}
  1064	
  1065		cfg = FIELD_PREP(IPFT_FLTFA, IPFT_FLTFA_REDIRECT);
  1066		cfg |= FIELD_PREP(IPFT_HR, NETC_HR_HOST_FLOOD);
  1067		cfge->cfg = cpu_to_le32(cfg);
  1068	
> 1069		err = ntmp_ipft_add_entry(&priv->ntmp, host_flood);
  1070		if (err) {
  1071			kfree(host_flood);
  1072			return err;
  1073		}
  1074	
  1075		np->uc = uc;
  1076		np->mc = mc;
  1077		np->host_flood = host_flood;
  1078		/* Enable ingress port filter table lookup */
  1079		netc_port_wr(np, NETC_PIPFCR, PIPFCR_EN);
  1080	
  1081		return 0;
  1082	}
  1083	
  1084	static void netc_port_remove_host_flood(struct netc_port *np,
  1085						struct ipft_entry_data *host_flood)
  1086	{
  1087		struct netc_switch *priv = np->switch_priv;
  1088	
  1089		if (!host_flood)
  1090			return;
  1091	
> 1092		ntmp_ipft_delete_entry(&priv->ntmp, host_flood->entry_id);
  1093		kfree(host_flood);
  1094	}
  1095	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
