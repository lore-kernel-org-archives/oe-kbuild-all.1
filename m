Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BFD2941C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 03:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724815838; cv=none; b=HrZKSyaWkROjwemS+lwE9Yw5r4Bcg8Rft8ogO2yCU/qxENCHuW1+4oEgA4sOKpipV/2TIclr+PUXQ6Gc7IZOBhDfNgnhaio/SUzjRFU2mHVgGZevEhNLvdSXPpaHi+wAI+R4FFuYeYbTZSYaH6RDx67kBuahgi+xpTPZjJVxyjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724815838; c=relaxed/simple;
	bh=UozoTUxp/qDFi7gN2Q5QmztzptnIiXd/EZ36z8SZCLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cx30fZj1ntVo66X9Z+H8HZwfmjAJZxOgE0rlF6xKvx0Nv9PclrckSyVZtBxYVjGNhbh7DcgTOMY0cmJrL/l6bsxkD5vl/uiIT5QQkXEidZ2HDDqaBNFYE0RGdL4LO2Qf1p56b+tqGIK34saXpqHnUShCPbb4nvXY8C68UuGsNhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0QBA41c; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0QBA41c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724815836; x=1756351836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UozoTUxp/qDFi7gN2Q5QmztzptnIiXd/EZ36z8SZCLk=;
  b=B0QBA41cHhlHDyfNNiJTRab9IqSuTb+7oFyxEv6LWv598LxUJJFTY+Lh
   IlCk+0Myn0Y73AEnRaNHJxOcRqIT7URw7hXtqjKONNKIwU7V6DmdSW4OJ
   4u63qh5s+aRDQkZRpbMuvlKNW6jx5LjvXdou7kY/NmiA/XXtZnibMoJer
   XrGUACR4U6SFcH5N/Zx5OSHQvxzF51sq8xP05TWvVHKT1S143B2EHhBEY
   lz1U+cR6hLRk/nsErmBZptWaumtkwag9QbRCIuHMZdpPAWClkTZTZu+xD
   Lz2nMWxHlZ51ueeLWDZHVPLQbSpjBXZsSloG9CuRmPtwpa/QQLsWHOYRf
   A==;
X-CSE-ConnectionGUID: tMGcZD9OTH6M9rj0noBChg==
X-CSE-MsgGUID: V9dNMFlGRdmEwhQYMQdV/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40826898"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="40826898"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 20:30:35 -0700
X-CSE-ConnectionGUID: OUrV18bpQ3q2SgmO8Fyn+w==
X-CSE-MsgGUID: q2ZaDpV/TeSzXNod5CyFrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="62737908"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2024 20:30:34 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj9OB-000KQk-1i;
	Wed, 28 Aug 2024 03:30:31 +0000
Date: Wed, 28 Aug 2024 11:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yue Haibing <yuehaibing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29634/30000] net/wireless/nl80211.c:692:62:
 error: initializing 'struct netlink_range_validation *' with an expression
 of type 'const struct netlink_range_validation *' discards qualifiers
Message-ID: <202408281103.NN6DJ2d4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   3e3bb79c307826ef516265644ccc984250795495
commit: 591481cccbad338e0c98905d08ffd0e454886a70 [29634/30000] wifi: cfg80211: restrict NL80211_ATTR_TXQ_QUANTUM values
config: x86_64-buildonly-randconfig-001-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281103.NN6DJ2d4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281103.NN6DJ2d4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281103.NN6DJ2d4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/wireless/nl80211.c:692:62: error: initializing 'struct netlink_range_validation *' with an expression of type 'const struct netlink_range_validation *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     692 |         [NL80211_ATTR_TXQ_QUANTUM] = NLA_POLICY_FULL_RANGE(NLA_U32, &q_range),
         |                                                                     ^~~~~~~~
   include/net/netlink.h:407:11: note: expanded from macro 'NLA_POLICY_FULL_RANGE'
     407 |         .range = _range,                                \
         |                  ^~~~~~
   1 error generated.


vim +692 net/wireless/nl80211.c

   409	
   410	static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
   411		[0] = { .strict_start_type = NL80211_ATTR_HE_OBSS_PD },
   412		[NL80211_ATTR_WIPHY] = { .type = NLA_U32 },
   413		[NL80211_ATTR_WIPHY_NAME] = { .type = NLA_NUL_STRING,
   414					      .len = 20-1 },
   415		[NL80211_ATTR_WIPHY_TXQ_PARAMS] = { .type = NLA_NESTED },
   416	
   417		[NL80211_ATTR_WIPHY_FREQ] = { .type = NLA_U32 },
   418		[NL80211_ATTR_WIPHY_CHANNEL_TYPE] = { .type = NLA_U32 },
   419		[NL80211_ATTR_WIPHY_EDMG_CHANNELS] = NLA_POLICY_RANGE(NLA_U8,
   420							NL80211_EDMG_CHANNELS_MIN,
   421							NL80211_EDMG_CHANNELS_MAX),
   422		[NL80211_ATTR_WIPHY_EDMG_BW_CONFIG] = NLA_POLICY_RANGE(NLA_U8,
   423							NL80211_EDMG_BW_CONFIG_MIN,
   424							NL80211_EDMG_BW_CONFIG_MAX),
   425	
   426		[NL80211_ATTR_CHANNEL_WIDTH] = { .type = NLA_U32 },
   427		[NL80211_ATTR_CENTER_FREQ1] = { .type = NLA_U32 },
   428		[NL80211_ATTR_CENTER_FREQ1_OFFSET] = NLA_POLICY_RANGE(NLA_U32, 0, 999),
   429		[NL80211_ATTR_CENTER_FREQ2] = { .type = NLA_U32 },
   430	
   431		[NL80211_ATTR_WIPHY_RETRY_SHORT] = NLA_POLICY_MIN(NLA_U8, 1),
   432		[NL80211_ATTR_WIPHY_RETRY_LONG] = NLA_POLICY_MIN(NLA_U8, 1),
   433		[NL80211_ATTR_WIPHY_FRAG_THRESHOLD] = { .type = NLA_U32 },
   434		[NL80211_ATTR_WIPHY_RTS_THRESHOLD] = { .type = NLA_U32 },
   435		[NL80211_ATTR_WIPHY_COVERAGE_CLASS] = { .type = NLA_U8 },
   436		[NL80211_ATTR_WIPHY_DYN_ACK] = { .type = NLA_FLAG },
   437	
   438		[NL80211_ATTR_IFTYPE] = NLA_POLICY_MAX(NLA_U32, NL80211_IFTYPE_MAX),
   439		[NL80211_ATTR_IFINDEX] = { .type = NLA_U32 },
   440		[NL80211_ATTR_IFNAME] = { .type = NLA_NUL_STRING, .len = IFNAMSIZ-1 },
   441	
   442		[NL80211_ATTR_MAC] = NLA_POLICY_EXACT_LEN_WARN(ETH_ALEN),
   443		[NL80211_ATTR_PREV_BSSID] = NLA_POLICY_EXACT_LEN_WARN(ETH_ALEN),
   444	
   445		[NL80211_ATTR_KEY] = { .type = NLA_NESTED, },
   446		[NL80211_ATTR_KEY_DATA] = { .type = NLA_BINARY,
   447					    .len = WLAN_MAX_KEY_LEN },
   448		[NL80211_ATTR_KEY_IDX] = NLA_POLICY_MAX(NLA_U8, 7),
   449		[NL80211_ATTR_KEY_CIPHER] = { .type = NLA_U32 },
   450		[NL80211_ATTR_KEY_DEFAULT] = { .type = NLA_FLAG },
   451		[NL80211_ATTR_KEY_SEQ] = { .type = NLA_BINARY, .len = 16 },
   452		[NL80211_ATTR_KEY_TYPE] =
   453			NLA_POLICY_MAX(NLA_U32, NUM_NL80211_KEYTYPES),
   454	
   455		[NL80211_ATTR_BEACON_INTERVAL] = { .type = NLA_U32 },
   456		[NL80211_ATTR_DTIM_PERIOD] = { .type = NLA_U32 },
   457		[NL80211_ATTR_BEACON_HEAD] =
   458			NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_beacon_head,
   459					       IEEE80211_MAX_DATA_LEN),
   460		[NL80211_ATTR_BEACON_TAIL] =
   461			NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_ie_attr,
   462					       IEEE80211_MAX_DATA_LEN),
   463		[NL80211_ATTR_STA_AID] =
   464			NLA_POLICY_RANGE(NLA_U16, 1, IEEE80211_MAX_AID),
   465		[NL80211_ATTR_STA_FLAGS] = { .type = NLA_NESTED },
   466		[NL80211_ATTR_STA_LISTEN_INTERVAL] = { .type = NLA_U16 },
   467		[NL80211_ATTR_STA_SUPPORTED_RATES] = { .type = NLA_BINARY,
   468						       .len = NL80211_MAX_SUPP_RATES },
   469		[NL80211_ATTR_STA_PLINK_ACTION] =
   470			NLA_POLICY_MAX(NLA_U8, NUM_NL80211_PLINK_ACTIONS - 1),
   471		[NL80211_ATTR_STA_TX_POWER_SETTING] =
   472			NLA_POLICY_RANGE(NLA_U8,
   473					 NL80211_TX_POWER_AUTOMATIC,
   474					 NL80211_TX_POWER_FIXED),
   475		[NL80211_ATTR_STA_TX_POWER] = { .type = NLA_S16 },
   476		[NL80211_ATTR_STA_VLAN] = { .type = NLA_U32 },
   477		[NL80211_ATTR_MNTR_FLAGS] = { /* NLA_NESTED can't be empty */ },
   478		[NL80211_ATTR_MESH_ID] = { .type = NLA_BINARY,
   479					   .len = IEEE80211_MAX_MESH_ID_LEN },
   480		[NL80211_ATTR_MPATH_NEXT_HOP] = NLA_POLICY_ETH_ADDR_COMPAT,
   481	
   482		/* allow 3 for NUL-termination, we used to declare this NLA_STRING */
   483		[NL80211_ATTR_REG_ALPHA2] = NLA_POLICY_RANGE(NLA_BINARY, 2, 3),
   484		[NL80211_ATTR_REG_RULES] = { .type = NLA_NESTED },
   485	
   486		[NL80211_ATTR_BSS_CTS_PROT] = { .type = NLA_U8 },
   487		[NL80211_ATTR_BSS_SHORT_PREAMBLE] = { .type = NLA_U8 },
   488		[NL80211_ATTR_BSS_SHORT_SLOT_TIME] = { .type = NLA_U8 },
   489		[NL80211_ATTR_BSS_BASIC_RATES] = { .type = NLA_BINARY,
   490						   .len = NL80211_MAX_SUPP_RATES },
   491		[NL80211_ATTR_BSS_HT_OPMODE] = { .type = NLA_U16 },
   492	
   493		[NL80211_ATTR_MESH_CONFIG] = { .type = NLA_NESTED },
   494		[NL80211_ATTR_SUPPORT_MESH_AUTH] = { .type = NLA_FLAG },
   495	
   496		[NL80211_ATTR_HT_CAPABILITY] = NLA_POLICY_EXACT_LEN_WARN(NL80211_HT_CAPABILITY_LEN),
   497	
   498		[NL80211_ATTR_MGMT_SUBTYPE] = { .type = NLA_U8 },
   499		[NL80211_ATTR_IE] = NLA_POLICY_VALIDATE_FN(NLA_BINARY,
   500							   validate_ie_attr,
   501							   IEEE80211_MAX_DATA_LEN),
   502		[NL80211_ATTR_SCAN_FREQUENCIES] = { .type = NLA_NESTED },
   503		[NL80211_ATTR_SCAN_SSIDS] = { .type = NLA_NESTED },
   504	
   505		[NL80211_ATTR_SSID] = { .type = NLA_BINARY,
   506					.len = IEEE80211_MAX_SSID_LEN },
   507		[NL80211_ATTR_AUTH_TYPE] = { .type = NLA_U32 },
   508		[NL80211_ATTR_REASON_CODE] = { .type = NLA_U16 },
   509		[NL80211_ATTR_FREQ_FIXED] = { .type = NLA_FLAG },
   510		[NL80211_ATTR_TIMED_OUT] = { .type = NLA_FLAG },
   511		[NL80211_ATTR_USE_MFP] = NLA_POLICY_RANGE(NLA_U32,
   512							  NL80211_MFP_NO,
   513							  NL80211_MFP_OPTIONAL),
   514		[NL80211_ATTR_STA_FLAGS2] = {
   515			.len = sizeof(struct nl80211_sta_flag_update),
   516		},
   517		[NL80211_ATTR_CONTROL_PORT] = { .type = NLA_FLAG },
   518		[NL80211_ATTR_CONTROL_PORT_ETHERTYPE] = { .type = NLA_U16 },
   519		[NL80211_ATTR_CONTROL_PORT_NO_ENCRYPT] = { .type = NLA_FLAG },
   520		[NL80211_ATTR_CONTROL_PORT_OVER_NL80211] = { .type = NLA_FLAG },
   521		[NL80211_ATTR_PRIVACY] = { .type = NLA_FLAG },
   522		[NL80211_ATTR_STATUS_CODE] = { .type = NLA_U16 },
   523		[NL80211_ATTR_CIPHER_SUITE_GROUP] = { .type = NLA_U32 },
   524		[NL80211_ATTR_WPA_VERSIONS] = { .type = NLA_U32 },
   525		[NL80211_ATTR_PID] = { .type = NLA_U32 },
   526		[NL80211_ATTR_4ADDR] = { .type = NLA_U8 },
   527		[NL80211_ATTR_PMKID] = NLA_POLICY_EXACT_LEN_WARN(WLAN_PMKID_LEN),
   528		[NL80211_ATTR_DURATION] = { .type = NLA_U32 },
   529		[NL80211_ATTR_COOKIE] = { .type = NLA_U64 },
   530		[NL80211_ATTR_TX_RATES] = { .type = NLA_NESTED },
   531		[NL80211_ATTR_FRAME] = { .type = NLA_BINARY,
   532					 .len = IEEE80211_MAX_DATA_LEN },
   533		[NL80211_ATTR_FRAME_MATCH] = { .type = NLA_BINARY, },
   534		[NL80211_ATTR_PS_STATE] = NLA_POLICY_RANGE(NLA_U32,
   535							   NL80211_PS_DISABLED,
   536							   NL80211_PS_ENABLED),
   537		[NL80211_ATTR_CQM] = { .type = NLA_NESTED, },
   538		[NL80211_ATTR_LOCAL_STATE_CHANGE] = { .type = NLA_FLAG },
   539		[NL80211_ATTR_AP_ISOLATE] = { .type = NLA_U8 },
   540		[NL80211_ATTR_WIPHY_TX_POWER_SETTING] = { .type = NLA_U32 },
   541		[NL80211_ATTR_WIPHY_TX_POWER_LEVEL] = { .type = NLA_U32 },
   542		[NL80211_ATTR_FRAME_TYPE] = { .type = NLA_U16 },
   543		[NL80211_ATTR_WIPHY_ANTENNA_TX] = { .type = NLA_U32 },
   544		[NL80211_ATTR_WIPHY_ANTENNA_RX] = { .type = NLA_U32 },
   545		[NL80211_ATTR_MCAST_RATE] = { .type = NLA_U32 },
   546		[NL80211_ATTR_OFFCHANNEL_TX_OK] = { .type = NLA_FLAG },
   547		[NL80211_ATTR_KEY_DEFAULT_TYPES] = { .type = NLA_NESTED },
   548		[NL80211_ATTR_WOWLAN_TRIGGERS] = { .type = NLA_NESTED },
   549		[NL80211_ATTR_STA_PLINK_STATE] =
   550			NLA_POLICY_MAX(NLA_U8, NUM_NL80211_PLINK_STATES - 1),
   551		[NL80211_ATTR_MEASUREMENT_DURATION] = { .type = NLA_U16 },
   552		[NL80211_ATTR_MEASUREMENT_DURATION_MANDATORY] = { .type = NLA_FLAG },
   553		[NL80211_ATTR_MESH_PEER_AID] =
   554			NLA_POLICY_RANGE(NLA_U16, 1, IEEE80211_MAX_AID),
   555		[NL80211_ATTR_SCHED_SCAN_INTERVAL] = { .type = NLA_U32 },
   556		[NL80211_ATTR_REKEY_DATA] = { .type = NLA_NESTED },
   557		[NL80211_ATTR_SCAN_SUPP_RATES] = { .type = NLA_NESTED },
   558		[NL80211_ATTR_HIDDEN_SSID] =
   559			NLA_POLICY_RANGE(NLA_U32,
   560					 NL80211_HIDDEN_SSID_NOT_IN_USE,
   561					 NL80211_HIDDEN_SSID_ZERO_CONTENTS),
   562		[NL80211_ATTR_IE_PROBE_RESP] =
   563			NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_ie_attr,
   564					       IEEE80211_MAX_DATA_LEN),
   565		[NL80211_ATTR_IE_ASSOC_RESP] =
   566			NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_ie_attr,
   567					       IEEE80211_MAX_DATA_LEN),
   568		[NL80211_ATTR_ROAM_SUPPORT] = { .type = NLA_FLAG },
   569		[NL80211_ATTR_SCHED_SCAN_MATCH] = { .type = NLA_NESTED },
   570		[NL80211_ATTR_TX_NO_CCK_RATE] = { .type = NLA_FLAG },
   571		[NL80211_ATTR_TDLS_ACTION] = { .type = NLA_U8 },
   572		[NL80211_ATTR_TDLS_DIALOG_TOKEN] = { .type = NLA_U8 },
   573		[NL80211_ATTR_TDLS_OPERATION] = { .type = NLA_U8 },
   574		[NL80211_ATTR_TDLS_SUPPORT] = { .type = NLA_FLAG },
   575		[NL80211_ATTR_TDLS_EXTERNAL_SETUP] = { .type = NLA_FLAG },
   576		[NL80211_ATTR_TDLS_INITIATOR] = { .type = NLA_FLAG },
   577		[NL80211_ATTR_DONT_WAIT_FOR_ACK] = { .type = NLA_FLAG },
   578		[NL80211_ATTR_PROBE_RESP] = { .type = NLA_BINARY,
   579					      .len = IEEE80211_MAX_DATA_LEN },
   580		[NL80211_ATTR_DFS_REGION] = { .type = NLA_U8 },
   581		[NL80211_ATTR_DISABLE_HT] = { .type = NLA_FLAG },
   582		[NL80211_ATTR_HT_CAPABILITY_MASK] = {
   583			.len = NL80211_HT_CAPABILITY_LEN
   584		},
   585		[NL80211_ATTR_NOACK_MAP] = { .type = NLA_U16 },
   586		[NL80211_ATTR_INACTIVITY_TIMEOUT] = { .type = NLA_U16 },
   587		[NL80211_ATTR_BG_SCAN_PERIOD] = { .type = NLA_U16 },
   588		[NL80211_ATTR_WDEV] = { .type = NLA_U64 },
   589		[NL80211_ATTR_USER_REG_HINT_TYPE] = { .type = NLA_U32 },
   590	
   591		/* need to include at least Auth Transaction and Status Code */
   592		[NL80211_ATTR_AUTH_DATA] = NLA_POLICY_MIN_LEN(4),
   593	
   594		[NL80211_ATTR_VHT_CAPABILITY] = NLA_POLICY_EXACT_LEN_WARN(NL80211_VHT_CAPABILITY_LEN),
   595		[NL80211_ATTR_SCAN_FLAGS] = { .type = NLA_U32 },
   596		[NL80211_ATTR_P2P_CTWINDOW] = NLA_POLICY_MAX(NLA_U8, 127),
   597		[NL80211_ATTR_P2P_OPPPS] = NLA_POLICY_MAX(NLA_U8, 1),
   598		[NL80211_ATTR_LOCAL_MESH_POWER_MODE] =
   599			NLA_POLICY_RANGE(NLA_U32,
   600					 NL80211_MESH_POWER_UNKNOWN + 1,
   601					 NL80211_MESH_POWER_MAX),
   602		[NL80211_ATTR_ACL_POLICY] = {. type = NLA_U32 },
   603		[NL80211_ATTR_MAC_ADDRS] = { .type = NLA_NESTED },
   604		[NL80211_ATTR_STA_CAPABILITY] = { .type = NLA_U16 },
   605		[NL80211_ATTR_STA_EXT_CAPABILITY] = { .type = NLA_BINARY, },
   606		[NL80211_ATTR_SPLIT_WIPHY_DUMP] = { .type = NLA_FLAG, },
   607		[NL80211_ATTR_DISABLE_VHT] = { .type = NLA_FLAG },
   608		[NL80211_ATTR_VHT_CAPABILITY_MASK] = {
   609			.len = NL80211_VHT_CAPABILITY_LEN,
   610		},
   611		[NL80211_ATTR_MDID] = { .type = NLA_U16 },
   612		[NL80211_ATTR_IE_RIC] = { .type = NLA_BINARY,
   613					  .len = IEEE80211_MAX_DATA_LEN },
   614		[NL80211_ATTR_CRIT_PROT_ID] = { .type = NLA_U16 },
   615		[NL80211_ATTR_MAX_CRIT_PROT_DURATION] =
   616			NLA_POLICY_MAX(NLA_U16, NL80211_CRIT_PROTO_MAX_DURATION),
   617		[NL80211_ATTR_PEER_AID] =
   618			NLA_POLICY_RANGE(NLA_U16, 1, IEEE80211_MAX_AID),
   619		[NL80211_ATTR_CH_SWITCH_COUNT] = { .type = NLA_U32 },
   620		[NL80211_ATTR_CH_SWITCH_BLOCK_TX] = { .type = NLA_FLAG },
   621		[NL80211_ATTR_CSA_IES] = { .type = NLA_NESTED },
   622		[NL80211_ATTR_CNTDWN_OFFS_BEACON] = { .type = NLA_BINARY },
   623		[NL80211_ATTR_CNTDWN_OFFS_PRESP] = { .type = NLA_BINARY },
   624		[NL80211_ATTR_STA_SUPPORTED_CHANNELS] = NLA_POLICY_MIN_LEN(2),
   625		/*
   626		 * The value of the Length field of the Supported Operating
   627		 * Classes element is between 2 and 253.
   628		 */
   629		[NL80211_ATTR_STA_SUPPORTED_OPER_CLASSES] =
   630			NLA_POLICY_RANGE(NLA_BINARY, 2, 253),
   631		[NL80211_ATTR_HANDLE_DFS] = { .type = NLA_FLAG },
   632		[NL80211_ATTR_OPMODE_NOTIF] = { .type = NLA_U8 },
   633		[NL80211_ATTR_VENDOR_ID] = { .type = NLA_U32 },
   634		[NL80211_ATTR_VENDOR_SUBCMD] = { .type = NLA_U32 },
   635		[NL80211_ATTR_VENDOR_DATA] = { .type = NLA_BINARY },
   636		[NL80211_ATTR_QOS_MAP] = NLA_POLICY_RANGE(NLA_BINARY,
   637							  IEEE80211_QOS_MAP_LEN_MIN,
   638							  IEEE80211_QOS_MAP_LEN_MAX),
   639		[NL80211_ATTR_MAC_HINT] = NLA_POLICY_EXACT_LEN_WARN(ETH_ALEN),
   640		[NL80211_ATTR_WIPHY_FREQ_HINT] = { .type = NLA_U32 },
   641		[NL80211_ATTR_TDLS_PEER_CAPABILITY] = { .type = NLA_U32 },
   642		[NL80211_ATTR_SOCKET_OWNER] = { .type = NLA_FLAG },
   643		[NL80211_ATTR_CSA_C_OFFSETS_TX] = { .type = NLA_BINARY },
   644		[NL80211_ATTR_USE_RRM] = { .type = NLA_FLAG },
   645		[NL80211_ATTR_TSID] = NLA_POLICY_MAX(NLA_U8, IEEE80211_NUM_TIDS - 1),
   646		[NL80211_ATTR_USER_PRIO] =
   647			NLA_POLICY_MAX(NLA_U8, IEEE80211_NUM_UPS - 1),
   648		[NL80211_ATTR_ADMITTED_TIME] = { .type = NLA_U16 },
   649		[NL80211_ATTR_SMPS_MODE] = { .type = NLA_U8 },
   650		[NL80211_ATTR_OPER_CLASS] = { .type = NLA_U8 },
   651		[NL80211_ATTR_MAC_MASK] = NLA_POLICY_EXACT_LEN_WARN(ETH_ALEN),
   652		[NL80211_ATTR_WIPHY_SELF_MANAGED_REG] = { .type = NLA_FLAG },
   653		[NL80211_ATTR_NETNS_FD] = { .type = NLA_U32 },
   654		[NL80211_ATTR_SCHED_SCAN_DELAY] = { .type = NLA_U32 },
   655		[NL80211_ATTR_REG_INDOOR] = { .type = NLA_FLAG },
   656		[NL80211_ATTR_PBSS] = { .type = NLA_FLAG },
   657		[NL80211_ATTR_BSS_SELECT] = { .type = NLA_NESTED },
   658		[NL80211_ATTR_STA_SUPPORT_P2P_PS] =
   659			NLA_POLICY_MAX(NLA_U8, NUM_NL80211_P2P_PS_STATUS - 1),
   660		[NL80211_ATTR_MU_MIMO_GROUP_DATA] = {
   661			.len = VHT_MUMIMO_GROUPS_DATA_LEN
   662		},
   663		[NL80211_ATTR_MU_MIMO_FOLLOW_MAC_ADDR] = NLA_POLICY_EXACT_LEN_WARN(ETH_ALEN),
   664		[NL80211_ATTR_NAN_MASTER_PREF] = NLA_POLICY_MIN(NLA_U8, 1),
   665		[NL80211_ATTR_BANDS] = { .type = NLA_U32 },
   666		[NL80211_ATTR_NAN_FUNC] = { .type = NLA_NESTED },
   667		[NL80211_ATTR_FILS_KEK] = { .type = NLA_BINARY,
   668					    .len = FILS_MAX_KEK_LEN },
   669		[NL80211_ATTR_FILS_NONCES] = NLA_POLICY_EXACT_LEN_WARN(2 * FILS_NONCE_LEN),
   670		[NL80211_ATTR_MULTICAST_TO_UNICAST_ENABLED] = { .type = NLA_FLAG, },
   671		[NL80211_ATTR_BSSID] = NLA_POLICY_EXACT_LEN_WARN(ETH_ALEN),
   672		[NL80211_ATTR_SCHED_SCAN_RELATIVE_RSSI] = { .type = NLA_S8 },
   673		[NL80211_ATTR_SCHED_SCAN_RSSI_ADJUST] = {
   674			.len = sizeof(struct nl80211_bss_select_rssi_adjust)
   675		},
   676		[NL80211_ATTR_TIMEOUT_REASON] = { .type = NLA_U32 },
   677		[NL80211_ATTR_FILS_ERP_USERNAME] = { .type = NLA_BINARY,
   678						     .len = FILS_ERP_MAX_USERNAME_LEN },
   679		[NL80211_ATTR_FILS_ERP_REALM] = { .type = NLA_BINARY,
   680						  .len = FILS_ERP_MAX_REALM_LEN },
   681		[NL80211_ATTR_FILS_ERP_NEXT_SEQ_NUM] = { .type = NLA_U16 },
   682		[NL80211_ATTR_FILS_ERP_RRK] = { .type = NLA_BINARY,
   683						.len = FILS_ERP_MAX_RRK_LEN },
   684		[NL80211_ATTR_FILS_CACHE_ID] = NLA_POLICY_EXACT_LEN_WARN(2),
   685		[NL80211_ATTR_PMK] = { .type = NLA_BINARY, .len = PMK_MAX_LEN },
   686		[NL80211_ATTR_PMKR0_NAME] = NLA_POLICY_EXACT_LEN(WLAN_PMK_NAME_LEN),
   687		[NL80211_ATTR_SCHED_SCAN_MULTI] = { .type = NLA_FLAG },
   688		[NL80211_ATTR_EXTERNAL_AUTH_SUPPORT] = { .type = NLA_FLAG },
   689	
   690		[NL80211_ATTR_TXQ_LIMIT] = { .type = NLA_U32 },
   691		[NL80211_ATTR_TXQ_MEMORY_LIMIT] = { .type = NLA_U32 },
 > 692		[NL80211_ATTR_TXQ_QUANTUM] = NLA_POLICY_FULL_RANGE(NLA_U32, &q_range),
   693		[NL80211_ATTR_HE_CAPABILITY] =
   694			NLA_POLICY_RANGE(NLA_BINARY,
   695					 NL80211_HE_MIN_CAPABILITY_LEN,
   696					 NL80211_HE_MAX_CAPABILITY_LEN),
   697		[NL80211_ATTR_FTM_RESPONDER] =
   698			NLA_POLICY_NESTED(nl80211_ftm_responder_policy),
   699		[NL80211_ATTR_TIMEOUT] = NLA_POLICY_MIN(NLA_U32, 1),
   700		[NL80211_ATTR_PEER_MEASUREMENTS] =
   701			NLA_POLICY_NESTED(nl80211_pmsr_attr_policy),
   702		[NL80211_ATTR_AIRTIME_WEIGHT] = NLA_POLICY_MIN(NLA_U16, 1),
   703		[NL80211_ATTR_SAE_PASSWORD] = { .type = NLA_BINARY,
   704						.len = SAE_PASSWORD_MAX_LEN },
   705		[NL80211_ATTR_TWT_RESPONDER] = { .type = NLA_FLAG },
   706		[NL80211_ATTR_HE_OBSS_PD] = NLA_POLICY_NESTED(he_obss_pd_policy),
   707		[NL80211_ATTR_VLAN_ID] = NLA_POLICY_RANGE(NLA_U16, 1, VLAN_N_VID - 2),
   708		[NL80211_ATTR_HE_BSS_COLOR] = NLA_POLICY_NESTED(he_bss_color_policy),
   709		[NL80211_ATTR_TID_CONFIG] =
   710			NLA_POLICY_NESTED_ARRAY(nl80211_tid_config_attr_policy),
   711		[NL80211_ATTR_CONTROL_PORT_NO_PREAUTH] = { .type = NLA_FLAG },
   712		[NL80211_ATTR_PMK_LIFETIME] = NLA_POLICY_MIN(NLA_U32, 1),
   713		[NL80211_ATTR_PMK_REAUTH_THRESHOLD] = NLA_POLICY_RANGE(NLA_U8, 1, 100),
   714		[NL80211_ATTR_RECEIVE_MULTICAST] = { .type = NLA_FLAG },
   715		[NL80211_ATTR_WIPHY_FREQ_OFFSET] = NLA_POLICY_RANGE(NLA_U32, 0, 999),
   716		[NL80211_ATTR_SCAN_FREQ_KHZ] = { .type = NLA_NESTED },
   717		[NL80211_ATTR_HE_6GHZ_CAPABILITY] =
   718			NLA_POLICY_EXACT_LEN(sizeof(struct ieee80211_he_6ghz_capa)),
   719		[NL80211_ATTR_FILS_DISCOVERY] =
   720			NLA_POLICY_NESTED(nl80211_fils_discovery_policy),
   721		[NL80211_ATTR_UNSOL_BCAST_PROBE_RESP] =
   722			NLA_POLICY_NESTED(nl80211_unsol_bcast_probe_resp_policy),
   723		[NL80211_ATTR_S1G_CAPABILITY] =
   724			NLA_POLICY_EXACT_LEN(IEEE80211_S1G_CAPABILITY_LEN),
   725		[NL80211_ATTR_S1G_CAPABILITY_MASK] =
   726			NLA_POLICY_EXACT_LEN(IEEE80211_S1G_CAPABILITY_LEN),
   727	};
   728	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
