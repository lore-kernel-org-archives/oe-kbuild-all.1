Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BBC185B67
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889173; cv=none; b=H2CUn/7vP86R6/F2eLQwdUqnwdfMxv+Gy+CZzJpiV6X8747xt1XIy2Nt0xT2KPS6iJgNzNkIn7ZmAJR25DoH0nUxE9bzOWjMsrcCeu5mfP1BTDDozRl0XeCL9Zl1vOtayn74Wvu20DIg6a8RiIo0UBolAXtmMCY9Alzh4vYwDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889173; c=relaxed/simple;
	bh=myh4Fpes6jGziiNKl01FIBeXIf3Sqjr1L4KHsoEvJyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2xETlM5QJwsSz5knoKTDlI+nL9u0+kXnC7XPmlNInRRJcEXD9b+2ULslnPZLpO2Qlj9bHe+EpH/pq/aUoA2d252vGDOidK2G+Z1z+OVjAwg6aBD8BCc96hpVnYJhp/flf8/gBKy7L/8DROIviV6ShBk//bS4yEpE4LZDkWDdTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R16viWP8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R16viWP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744889171; x=1776425171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=myh4Fpes6jGziiNKl01FIBeXIf3Sqjr1L4KHsoEvJyk=;
  b=R16viWP8T4AnF5hUXjAsg3yafWLOAp1nbzdBKcZEpLKb6K0iFsvjGroN
   +og62lpPojvZAw3zZobxNdYzhApGJJVNwDXS+VgHH3Zk7Sw8xZ81HPa6a
   uowCdeg/SaWvN6NshkHkiMcYaRxve7BpSGF/+NUrUQG86GFP14Y4hAN+f
   dzDZlqJ3QGHYH6E0NzmqY70tlHbOgrbwgxtZPChfiOGBhj9gXvV32gkHW
   H1D5NEQNW4Sg9fJnuaAa0wsbI/GTtmDQKPOwTYOK0PmRAKU/j0WlRxyvO
   f66dpQIYvz5u4yVYq7TxE7FRr9XN6ODZipMzMrkFJBbw+UE2heUYK0h6p
   g==;
X-CSE-ConnectionGUID: tBIECaiBSdScI8Uk89PHzw==
X-CSE-MsgGUID: nq2rnvhbRpyez20EKUNDiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46560781"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46560781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:26:10 -0700
X-CSE-ConnectionGUID: i+jkrbPrRlCTBrjcK3Fe6g==
X-CSE-MsgGUID: bTakEtK8Re2npggZUtI82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131757569"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2025 04:26:10 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5NNf-000MX6-0H;
	Thu, 17 Apr 2025 11:26:07 +0000
Date: Thu, 17 Apr 2025 19:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/5]
 drivers/net/wireless/intel/iwlwifi/mld/d3.c:1759: warning: ignoring '#pragma
 clang loop'
Message-ID: <202504171907.rC9vLAxQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   a0f1077117096dee114d530a959a44ee68704ecc
commit: 5737edf385416dc1c725a6a2cc59bcbfcc4cd8e3 [0/5] ANDROID: mld: temporary workaround to fortify break
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250417/202504171907.rC9vLAxQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171907.rC9vLAxQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171907.rC9vLAxQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/mld/d3.c: In function 'iwl_mld_send_proto_offload':
>> drivers/net/wireless/intel/iwlwifi/mld/d3.c:1759: warning: ignoring '#pragma clang loop' [-Wunknown-pragmas]
    1759 | #pragma clang loop unroll(disable)
         | 


vim +1759 drivers/net/wireless/intel/iwlwifi/mld/d3.c

  1707	
  1708	static int
  1709	iwl_mld_send_proto_offload(struct iwl_mld *mld,
  1710				   struct ieee80211_vif *vif,
  1711				   u8 ap_sta_id)
  1712	{
  1713		struct iwl_proto_offload_cmd_v4 *cmd __free(kfree);
  1714		struct iwl_host_cmd hcmd = {
  1715			.id = PROT_OFFLOAD_CONFIG_CMD,
  1716			.dataflags[0] = IWL_HCMD_DFL_NOCOPY,
  1717			.len[0] = sizeof(*cmd),
  1718		};
  1719		u32 enabled = 0;
  1720	
  1721		cmd = kzalloc(hcmd.len[0], GFP_KERNEL);
  1722	
  1723	#if IS_ENABLED(CONFIG_IPV6)
  1724		struct iwl_mld_vif *mld_vif = iwl_mld_vif_from_mac80211(vif);
  1725		struct iwl_mld_wowlan_data *wowlan_data = &mld_vif->wowlan_data;
  1726		struct iwl_ns_config *nsc;
  1727		struct iwl_targ_addr *addrs;
  1728		int n_nsc, n_addrs;
  1729		int i, c;
  1730		int num_skipped = 0;
  1731	
  1732		nsc = cmd->ns_config;
  1733		n_nsc = IWL_PROTO_OFFLOAD_NUM_NS_CONFIG_V3L;
  1734		addrs = cmd->targ_addrs;
  1735		n_addrs = IWL_PROTO_OFFLOAD_NUM_IPV6_ADDRS_V3L;
  1736	
  1737		/* For each address we have (and that will fit) fill a target
  1738		 * address struct and combine for NS offload structs with the
  1739		 * solicited node addresses.
  1740		 */
  1741		for (i = 0, c = 0;
  1742			i < wowlan_data->num_target_ipv6_addrs &&
  1743			i < n_addrs && c < n_nsc; i++) {
  1744			int j;
  1745			struct in6_addr solicited_addr;
  1746	
  1747			/* Because ns is offloaded skip tentative address to avoid
  1748			 * violating RFC4862.
  1749			 */
  1750			if (test_bit(i, wowlan_data->tentative_addrs)) {
  1751				num_skipped++;
  1752				continue;
  1753			}
  1754	
  1755			addrconf_addr_solict_mult(&wowlan_data->target_ipv6_addrs[i],
  1756						  &solicited_addr);
  1757	
  1758	/* TODO(b/411091992): remove pragma workaround once issue is resolved. */
> 1759	#pragma clang loop unroll(disable)
  1760			for (j = 0; j < c; j++)
  1761				if (ipv6_addr_cmp(&nsc[j].dest_ipv6_addr,
  1762						  &solicited_addr) == 0)
  1763					break;
  1764			if (j == c)
  1765				c++;
  1766			addrs[i].addr = wowlan_data->target_ipv6_addrs[i];
  1767			addrs[i].config_num = cpu_to_le32(j);
  1768			nsc[j].dest_ipv6_addr = solicited_addr;
  1769			memcpy(nsc[j].target_mac_addr, vif->addr, ETH_ALEN);
  1770		}
  1771	
  1772		if (wowlan_data->num_target_ipv6_addrs - num_skipped)
  1773			enabled |= IWL_D3_PROTO_IPV6_VALID;
  1774	
  1775		cmd->num_valid_ipv6_addrs = cpu_to_le32(i - num_skipped);
  1776		if (enabled & IWL_D3_PROTO_IPV6_VALID)
  1777			enabled |= IWL_D3_PROTO_OFFLOAD_NS;
  1778	#endif
  1779	
  1780		if (vif->cfg.arp_addr_cnt) {
  1781			enabled |= IWL_D3_PROTO_OFFLOAD_ARP | IWL_D3_PROTO_IPV4_VALID;
  1782			cmd->common.host_ipv4_addr = vif->cfg.arp_addr_list[0];
  1783			ether_addr_copy(cmd->common.arp_mac_addr, vif->addr);
  1784		}
  1785	
  1786		enabled |= IWL_D3_PROTO_OFFLOAD_BTM;
  1787		cmd->common.enabled = cpu_to_le32(enabled);
  1788		cmd->sta_id = cpu_to_le32(ap_sta_id);
  1789		hcmd.data[0] = cmd;
  1790		return iwl_mld_send_cmd(mld, &hcmd);
  1791	}
  1792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
