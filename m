Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59082285041
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648665; cv=none; b=S+c4LRN68L99wOZLAfV36ot4BIX3/e5cDbUWXGoRB+W5unKlNPOS0v+VLDVxkr/wikAny2URD9rZxiOIgU8AAw9OC+PU6Y0fANDqx7/rVyt+cybOnY8K1valBJa4mQWY7knwoB6v22/AOqPl0BfWahiFhujj7I0gBXsn4B0aulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648665; c=relaxed/simple;
	bh=c3e191X+F9J3GQOvihnzUjHXLQF9Jtp4w1WOHDonzfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ftMa3spe/ByW9veN4Tg6f+7tvZ3ueiu5P86T2+eO/AFsa2FQLthYQd3Ggu+vIHBfD5K2sJVyQGntC2Cu4j/IclpM2ndHveCDqWj6EmK6QaKBL7no7lA5W81LkOinBoiPvR7mJCRdFmuDxP0VZTSJyUjQ5KxcKcRjJKkcUNLV+8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mP/obmDV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mP/obmDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787648664; x=1819184664;
  h=date:from:to:cc:subject:message-id;
  bh=c3e191X+F9J3GQOvihnzUjHXLQF9Jtp4w1WOHDonzfY=;
  b=mP/obmDViQeyq45B2zGkPdnSjI7UUZ3T/5LmtF5BGLHdoFZyQpWvbmLs
   SKqA6tM3G1agtcrN008dlIgnyWkmWI45uI+jt+1FSvXr5jtySfWuIj7cB
   d/fhwmOb32In5kvKfGRU9XCWuNbe6eYEHnLECA1DLsfbMu4kHnyFlEqar
   EZoV1OroM7DN7/1ULdeFEf6xu5+sHkF+ct3GKGeOrLJnWLLSwOcIOoE1x
   GzOUrB0G0KqO+0uzsVt6DtFechmv6zTpIo42f6q406BM7DyTc6DnGGHOm
   gRa+2Tu9W+Xtvrilrzfi1IUig4kHhgsuzvHqJb2Guo55yCEtXvdMis86r
   A==;
X-CSE-ConnectionGUID: ZgkpbrUtQwqqJE0s501uTg==
X-CSE-MsgGUID: k7cN29MQSkGqnTkuNzylww==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88165248"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88165248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:04:24 -0700
X-CSE-ConnectionGUID: WUHybMU+TWybG0U93Vo1uA==
X-CSE-MsgGUID: BCm5Sr/ASPCTP3ax1wnOdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="267283613"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2026 02:04:23 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyn4s-000000005Mr-1dZz;
	Tue, 25 Aug 2026 09:04:18 +0000
Date: Tue, 25 Aug 2026 17:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 drivers/usb/typec/tcpm/tcpm.c:1685:18: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202608251646.maAL5DQd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   108028936ad167fb2d330e9151ce744f363fb538
commit: 19fa58626d0aaa0440aa17f36ca216e23293b383 [0/2] FROMGIT: usb: typec: tcpm: Add support for Battery Cap response message
config: i386-randconfig-063-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251646.maAL5DQd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251646.maAL5DQd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251646.maAL5DQd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/tcpm/tcpm.c:1685:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] vid @@     got int @@
   drivers/usb/typec/tcpm/tcpm.c:1685:18: sparse:     expected restricted __le16 [usertype] vid
   drivers/usb/typec/tcpm/tcpm.c:1685:18: sparse:     got int

vim +1685 drivers/usb/typec/tcpm/tcpm.c

  1638	
  1639	static int tcpm_pd_send_batt_cap(struct tcpm_port *port)
  1640	{
  1641		u16 design_cap = BATTERY_PROPERTY_UNKNOWN;
  1642		u16 charge_cap = BATTERY_PROPERTY_UNKNOWN;
  1643		u32 batt_id = port->batt_request_id;
  1644		union power_supply_propval val;
  1645		struct batt_cap_ext_msg bcdb;
  1646		struct power_supply *batt;
  1647		bool invalid_ref = true;
  1648		struct pd_message msg;
  1649		u8 data_obj_cnt;
  1650		int ret, vol;
  1651	
  1652		tcpm_get_fixed_batt(port);
  1653		memset(&msg, 0, sizeof(msg));
  1654	
  1655		if (batt_id >= port->fixed_batt_cnt || batt_id >= MAX_NUM_FIXED_BATT)
  1656			goto send_cap;
  1657	
  1658		invalid_ref = false;
  1659		batt = port->fixed_batt[batt_id];
  1660		ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG,
  1661						&val);
  1662		if (!ret) {
  1663			vol = val.intval;
  1664			ret = power_supply_get_property(batt,
  1665							POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
  1666							&val);
  1667			if (!ret)
  1668				design_cap = tcpm_charge_to_energy(val.intval, vol);
  1669	
  1670			ret = power_supply_get_property(batt,
  1671							POWER_SUPPLY_PROP_CHARGE_FULL,
  1672							&val);
  1673			if (!ret)
  1674				charge_cap = tcpm_charge_to_energy(val.intval, vol);
  1675		}
  1676	
  1677	send_cap:
  1678	
  1679		/*
  1680		 * As per the USB PD Rev3.1 v1.8 spec, if a battery VID (assigned by the
  1681		 * USB-IF) does not exist or an invalid battery reference is made by the
  1682		 * requestor, then set the VID field to 0xffff. If the VID field is
  1683		 * 0xffff, set the PID field to 0.
  1684		 */
> 1685		bcdb.vid = BATTERY_PROPERTY_UNKNOWN;
  1686		bcdb.pid = 0;
  1687		bcdb.batt_design_cap = cpu_to_le16(design_cap);
  1688		bcdb.batt_last_chg_cap = cpu_to_le16(charge_cap);
  1689		bcdb.batt_type = invalid_ref ? BATT_CAP_BATT_TYPE_INVALID_REF : 0;
  1690		memcpy(msg.ext_msg.data, &bcdb, sizeof(bcdb));
  1691		msg.ext_msg.header = PD_EXT_HDR_LE(sizeof(bcdb),
  1692						   0, /* Denotes if request chunk */
  1693						   0, /* Chunk number */
  1694						   1  /* Chunked */);
  1695	
  1696		data_obj_cnt = count_chunked_data_objs(sizeof(bcdb));
  1697		msg.header = PD_HEADER_EXT_LE(PD_EXT_BATT_CAP, port->pwr_role,
  1698					      port->data_role, port->negotiated_rev,
  1699					      port->message_id, data_obj_cnt);
  1700	
  1701		return tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
  1702	}
  1703	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
