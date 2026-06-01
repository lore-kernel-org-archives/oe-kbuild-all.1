Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E1514A8B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 05:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292297; cv=none; b=BN2lOiERlcK/n368kaSslpVUg4Q21QeINhqm6evcjJ0fwMNAKrZP6rOiQNjpEEkazWNiEKSUu9kHU4N0+fwcqBnDBFq1hgVTzsFUzeW7PRhSU42UT3JSy1iUi2GlmIfsXMH0ODx6izRPozfWT30bqyj1qPQ+j2Ja35ajmrZRukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292297; c=relaxed/simple;
	bh=jBMLXuXf43EVf1rqeox5xLMkBCsWg97Uq2RI3U7o2fA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dHvL0Rk+hFlgce5uKHZY+kOIUXmvAG3psdvWj99c0EPCWhsSSVKgZlLLeFScU1OSzaBp0G5aIsFwhMc1eR7D2racv5kDbn0J/MrtmLZ16U01B6QhPhLwsPPnolOfrtJuR3utaNgQnBqIJP1GiTlNKktKGk1Mf64CRxbIViQPkZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0Oxxaac; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0Oxxaac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780292296; x=1811828296;
  h=date:from:to:cc:subject:message-id;
  bh=jBMLXuXf43EVf1rqeox5xLMkBCsWg97Uq2RI3U7o2fA=;
  b=T0OxxaacR4QFt3+mTqAY+Nfimy+/SbGFLMxvuhLMxx6T/rwPOxAM4caK
   NV9sNChoMsnywy4vY8SjEmns979uFjlGCxRkfvbOWqB6CaAnyRT1gN9T3
   R+zfh9Fi5gPHyr2n2nZcKS647KAhaM6BoIf01y7AtkAXIfJpleoJORimY
   taQxO7VGpxUku7YQw+lryuOPtqo1fQ9abUGrx5uShvxeHZvpst6SYn1ny
   kHfWxFEtdx4OG0hWKZAK9Qj+K5MI70cY4TMIU/84T50PzuIIUZH+mSMGb
   EZBPsZR5Hk/vltqpvDh181NM+bM9w1iABdCwnzUmyC21MCItTexOUOWHA
   Q==;
X-CSE-ConnectionGUID: z23OciidT7SJmuNsE+ZXJA==
X-CSE-MsgGUID: GuQ1+HN1ToGxWBc+apMayA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80893134"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="80893134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 22:38:15 -0700
X-CSE-ConnectionGUID: EAl0oGJhRyietC1Ny80LJQ==
X-CSE-MsgGUID: KqA6Zl5/QMeE1CX3fL/Wrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="267348657"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 May 2026 22:38:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTvLm-00000000ADS-32Y3;
	Mon, 01 Jun 2026 05:38:10 +0000
Date: Mon, 01 Jun 2026 13:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 6166/9870]
 drivers/net/dsa/netc/netc_main.c:978: undefined reference to
 `ntmp_fdbt_search_port_entry'
Message-ID: <202606011303.ZHFMTjWT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 46d6407692c80b258ecba3af831130a6f6e2feea [6166/9870] net: dsa: netc: add FDB, STP, MTU, port setup and host flooding support
config: arm-randconfig-r072-20260601 (https://download.01.org/0day-ci/archive/20260601/202606011303.ZHFMTjWT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011303.ZHFMTjWT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606011303.ZHFMTjWT-lkp@intel.com/

Note: the linux-next/master HEAD 7da7f07112610a520567421dd2ffcb51beaefbcc builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_fdb_dump':
>> drivers/net/dsa/netc/netc_main.c:978: undefined reference to `ntmp_fdbt_search_port_entry'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_remove_all_cbdrs':
   drivers/net/dsa/netc/netc_main.c:320: undefined reference to `ntmp_free_cbdr'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:320: undefined reference to `ntmp_free_cbdr'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_del_fdb_entry':
>> drivers/net/dsa/netc/netc_main.c:590: undefined reference to `ntmp_fdbt_update_entry'
>> arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:599: undefined reference to `ntmp_fdbt_delete_entry'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_remove_host_flood':
>> drivers/net/dsa/netc/netc_main.c:1092: undefined reference to `ntmp_ipft_delete_entry'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_add_host_flood_rule':
>> drivers/net/dsa/netc/netc_main.c:1069: undefined reference to `ntmp_ipft_add_entry'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_add_fdb_entry':
>> drivers/net/dsa/netc/netc_main.c:497: undefined reference to `ntmp_fdbt_add_entry'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_set_fdb_entry':
   drivers/net/dsa/netc/netc_main.c:547: undefined reference to `ntmp_fdbt_update_entry'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_port_create_emdio_bus':
   drivers/net/dsa/netc/netc_main.c:138: undefined reference to `enetc_hw_alloc'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_init_all_cbdrs':
   drivers/net/dsa/netc/netc_main.c:301: undefined reference to `ntmp_init_cbdr'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:310: undefined reference to `ntmp_free_cbdr'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_add_standalone_vlan_entry':
>> drivers/net/dsa/netc/netc_main.c:463: undefined reference to `ntmp_vft_add_entry'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_remove_all_cbdrs':
   drivers/net/dsa/netc/netc_main.c:320: undefined reference to `ntmp_free_cbdr'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:320: undefined reference to `ntmp_free_cbdr'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.o: in function `netc_setup':
   drivers/net/dsa/netc/netc_main.c:687: undefined reference to `enetc_mdio_read_c22'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:687: undefined reference to `enetc_mdio_read_c45'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:687: undefined reference to `enetc_mdio_write_c45'
   arm-linux-gnueabi-ld: drivers/net/dsa/netc/netc_main.c:687: undefined reference to `enetc_mdio_write_c22'

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
