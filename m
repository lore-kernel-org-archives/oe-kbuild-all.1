Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2814B800
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708765297; cv=none; b=QXczB/NOr7hwZUlQqcJeSBoPN4FJb3nv8URFZWAb28GeyzccuV/bJ4cP89YOJ3aDMbcIOCGnFe+0Kc4faeQtSZgIXno3Qh18DIYU3B4Ki2JSiNjmi627akdZFoA7KGzmPk0QvzMK6lOmSVfvXsmIwPAWIMPSePTHCDWRjOenMdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708765297; c=relaxed/simple;
	bh=zHQJySSDCv3yHgN24taMavehI0RMe/IOthoyoHUb5z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pyyp7zCne+BZDXG4cr8PcGPb6bbDgszotuv9jCfnAtenTiLjUHiIkhTSlwsPaCqNikMS/LFuldrR3BWkJN2jtvnq7X/KYspw6TIpQ7XDbfR8eEoCURemI2qjIpon4f5P7cXGg4RLLykaDv/kyAJJwTP7aAcyQf2NOHpElsZcVdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNSM5OTh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNSM5OTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708765294; x=1740301294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zHQJySSDCv3yHgN24taMavehI0RMe/IOthoyoHUb5z4=;
  b=QNSM5OThZEQmu5DzZcWHyHsgKvagUMJol1/F1qYmSuxarzyE6osTQsSJ
   iJ+sIjs5z5HibgFEiCfx5bQHN4GOPVAJc7bD/ppp8Vd/2uzPZ+U9pMz84
   InPAgN68MftllMIMDVA5z/exSiDDwL+K64PpYRLBztQ1y0xaluP4j3qU5
   Zi7l6Hm+I7GJ4SfoU1kVGQLM+q7CiZOS2mCRLTZZrR8yF9u7SWwuxYEGE
   RudafA8vishR/Bfme+K9b0UlIsWEQS+EtxM/wQg91IDpXVkR9wmUKAcm1
   mqCUIYnB4d2uDSJNpLmwbW6PBRaS0NXD21glssRRjhEsgyLdrvRsy7D9k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2960928"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="2960928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 01:01:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6581035"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Feb 2024 01:01:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdnuT-0008Og-1K;
	Sat, 24 Feb 2024 09:01:29 +0000
Date: Sat, 24 Feb 2024 17:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Duanqiang Wen <duanqiangwen@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19778/30000]
 drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:113:5: sparse: sparse: symbol
 'ngbe_poll_for_msg' was not declared. Should it be static?
Message-ID: <202402241626.MnVH3cCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4fee6fdef7d687d6ce43289fd7e7f96fde039af0
commit: a5961b4bc6ce09a70902686ecc848a47493a9251 [19778/30000] openeuler: net: ngbe: add ngbe module support
config: x86_64-randconfig-122-20240218 (https://download.01.org/0day-ci/archive/20240224/202402241626.MnVH3cCn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241626.MnVH3cCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241626.MnVH3cCn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:113:5: sparse: sparse: symbol 'ngbe_poll_for_msg' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:143:5: sparse: sparse: symbol 'ngbe_poll_for_ack' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:244:5: sparse: sparse: symbol 'ngbe_read_v2p_mailbox' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:262:5: sparse: sparse: symbol 'ngbe_check_for_bit_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:278:5: sparse: sparse: symbol 'ngbe_check_for_msg_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:298:5: sparse: sparse: symbol 'ngbe_check_for_ack_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:318:5: sparse: sparse: symbol 'ngbe_check_for_rst_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:337:5: sparse: sparse: symbol 'ngbe_obtain_mbx_lock_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:365:5: sparse: sparse: symbol 'ngbe_write_mbx_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:403:5: sparse: sparse: symbol 'ngbe_read_mbx_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:461:5: sparse: sparse: symbol 'ngbe_check_for_bit_pf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:481:5: sparse: sparse: symbol 'ngbe_check_for_msg_pf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:501:5: sparse: sparse: symbol 'ngbe_check_for_ack_pf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:521:5: sparse: sparse: symbol 'ngbe_check_for_rst_pf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:544:5: sparse: sparse: symbol 'ngbe_obtain_mbx_lock_pf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:572:5: sparse: sparse: symbol 'ngbe_write_mbx_pf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:612:5: sparse: sparse: symbol 'ngbe_read_mbx_pf' was not declared. Should it be static?
--
>> drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:818:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:818:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:818:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:1268:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:1268:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:1268:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:1297:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:1297:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:1297:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:474:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:474:25: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:474:25: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:474:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:474:25: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:474:25: sparse:    int
--
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:16:6: sparse: sparse: symbol 'ngbe_check_reset_blocked' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:33:5: sparse: sparse: symbol 'ngbe_phy_read_reg' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:56:5: sparse: sparse: symbol 'ngbe_phy_write_reg' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:74:5: sparse: sparse: symbol 'ngbe_check_internal_phy_id' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:273:5: sparse: sparse: symbol 'ngbe_check_mdi_phy_id' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:337:6: sparse: sparse: symbol 'ngbe_validate_phy_addr' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:353:5: sparse: sparse: symbol 'ngbe_check_yt_phy_id' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1242:5: sparse: sparse: symbol 'ngbe_phy_get_advertised_pause' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1279:5: sparse: sparse: symbol 'ngbe_phy_get_lp_advertised_pause' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1324:5: sparse: sparse: symbol 'ngbe_phy_set_pause_advertisement' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1450:5: sparse: sparse: symbol 'ngbe_phy_setup' was not declared. Should it be static?
--
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:399:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:399:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:399:9: sparse:    int
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:752:6: sparse: sparse: symbol 'ngbe_add_uc_addr' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:885:6: sparse: sparse: symbol 'ngbe_set_mta' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:1937:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:1937:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:1937:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2082:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2082:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2082:9: sparse:    int
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2186:5: sparse: sparse: symbol 'ngbe_setup_mac_link_hostif' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2222:5: sparse: sparse: symbol 'ngbe_crc16_ccitt' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2897:23: sparse: sparse: symbol 'ngbe_ptype_lookup' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3296:5: sparse: sparse: symbol 'ngbe_get_copper_link_capabilities' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3456:5: sparse: sparse: symbol 'ngbe_reset_misc' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3751:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3751:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3751:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3753:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3753:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3753:17: sparse:    int
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3910:5: sparse: sparse: symbol 'ngbe_read_ee_hostif_data' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3981:5: sparse: sparse: symbol 'ngbe_phy_led_oem_chk' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4066:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4066:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4066:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4148:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4148:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4148:9: sparse:    int
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4163:5: sparse: sparse: symbol 'ngbe_read_ee_hostif_data32' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4208:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4208:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4208:17: sparse:    int
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4225:5: sparse: sparse: symbol 'ngbe_write_ee_hostif_data' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4264:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4264:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4264:17: sparse:    int
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4282:5: sparse: sparse: symbol 'ngbe_write_ee_hostif_data32' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4320:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4320:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4320:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4365:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4365:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4365:9: sparse:    int
--
>> drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:128:5: sparse: sparse: symbol 'ngbe_get_link_ksettings' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1548:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1548:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1548:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1570:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1570:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1570:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1607:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1607:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1607:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1611:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1611:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:1611:9: sparse:    int
--
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:139:6: sparse: sparse: symbol 'ngbe_service_event_schedule' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:888:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] vlan_proto @@     got unsigned short [usertype] @@
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:888:57: sparse:     expected restricted __be16 [usertype] vlan_proto
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:888:57: sparse:     got unsigned short [usertype]
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2458:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2458:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2458:17: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2507:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2507:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2507:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3155:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3155:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3155:9: sparse:    int
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3159:6: sparse: sparse: symbol 'ngbe_configure_isb' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3173:6: sparse: sparse: symbol 'ngbe_configure_port' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3541:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3541:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3541:9: sparse:    int
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3644:5: sparse: sparse: symbol 'ngbe_init_shared_code' was not declared. Should it be static?
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3751:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3751:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3751:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4298:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4298:17: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4298:17: sparse:    int
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5193:40: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5219:37: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5242:40: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5791:5: sparse: sparse: symbol 'ngbe_skb_pad_nonzero' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5833:30: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] protocol @@     got restricted __be16 [usertype] protocol @@
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5833:30: sparse:     expected unsigned short [usertype] protocol
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5833:30: sparse:     got restricted __be16 [usertype] protocol
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5870:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] protocol @@     got restricted __be16 [usertype] h_vlan_encapsulated_proto @@
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5870:26: sparse:     expected unsigned short [usertype] protocol
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5870:26: sparse:     got restricted __be16 [usertype] h_vlan_encapsulated_proto
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5871:29: sparse: sparse: cast from restricted __be16
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6192:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] type @@     got restricted __be16 [usertype] protocol @@
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6192:26: sparse:     expected unsigned short [usertype] type
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6192:26: sparse:     got restricted __be16 [usertype] protocol
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6206:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] type @@     got restricted __be16 [usertype] h_vlan_encapsulated_proto @@
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6206:22: sparse:     expected unsigned short [usertype] type
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6206:22: sparse:     got restricted __be16 [usertype] h_vlan_encapsulated_proto
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6232:35: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different base types)) @@     expected int ( *ndo_vlan_rx_add_vid )( ... ) @@     got int ( * )( ... ) @@
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6232:35: sparse:     expected int ( *ndo_vlan_rx_add_vid )( ... )
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6232:35: sparse:     got int ( * )( ... )
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6233:35: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different base types)) @@     expected int ( *ndo_vlan_rx_kill_vid )( ... ) @@     got int ( * )( ... ) @@
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6233:35: sparse:     expected int ( *ndo_vlan_rx_kill_vid )( ... )
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6233:35: sparse:     got int ( * )( ... )
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6237:35: sparse: sparse: incorrect type in initializer (incompatible argument 5 (different base types)) @@     expected int ( *ndo_set_vf_vlan )( ... ) @@     got int ( * )( ... ) @@
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6237:35: sparse:     expected int ( *ndo_set_vf_vlan )( ... )
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6237:35: sparse:     got int ( * )( ... )
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6400:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6400:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6400:9: sparse:    int
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6490:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6490:9: sparse:    void
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6490:9: sparse:    int

vim +/ngbe_poll_for_msg +113 drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c

   105	
   106	/**
   107	 *  ngbe_poll_for_msg - Wait for message notification
   108	 *  @hw: pointer to the HW structure
   109	 *  @mbx_id: id of mailbox to write
   110	 *
   111	 *  returns SUCCESS if it successfully received a message notification
   112	 **/
 > 113	int ngbe_poll_for_msg(struct ngbe_hw *hw, u16 mbx_id)
   114	{
   115		struct ngbe_mbx_info *mbx = &hw->mbx;
   116		int countdown = mbx->timeout;
   117	
   118		if (!countdown || !mbx->ops.check_for_msg)
   119			goto out;
   120	
   121		while (countdown && TCALL(hw, mbx.ops.check_for_msg, mbx_id)) {
   122			countdown--;
   123			if (!countdown)
   124				break;
   125			udelay(mbx->udelay);
   126		}
   127	
   128		if (countdown == 0)
   129			ERROR_REPORT2(NGBE_ERROR_POLLING,
   130				   "Polling for VF%d mailbox message timedout", mbx_id);
   131	
   132	out:
   133		return countdown ? 0 : NGBE_ERR_MBX;
   134	}
   135	
   136	/**
   137	 *  ngbe_poll_for_ack - Wait for message acknowledngbeent
   138	 *  @hw: pointer to the HW structure
   139	 *  @mbx_id: id of mailbox to write
   140	 *
   141	 *  returns SUCCESS if it successfully received a message acknowledngbeent
   142	 **/
 > 143	int ngbe_poll_for_ack(struct ngbe_hw *hw, u16 mbx_id)
   144	{
   145		struct ngbe_mbx_info *mbx = &hw->mbx;
   146		int countdown = mbx->timeout;
   147	
   148		if (!countdown || !mbx->ops.check_for_ack)
   149			goto out;
   150	
   151		while (countdown && TCALL(hw, mbx.ops.check_for_ack, mbx_id)) {
   152			countdown--;
   153			if (!countdown)
   154				break;
   155			udelay(mbx->udelay);
   156		}
   157	
   158		if (countdown == 0)
   159			ERROR_REPORT2(NGBE_ERROR_POLLING,
   160				     "Polling for VF%d mailbox ack timedout", mbx_id);
   161	
   162	out:
   163		return countdown ? 0 : NGBE_ERR_MBX;
   164	}
   165	
   166	/**
   167	 *  ngbe_read_posted_mbx - Wait for message notification and receive message
   168	 *  @hw: pointer to the HW structure
   169	 *  @msg: The message buffer
   170	 *  @size: Length of buffer
   171	 *  @mbx_id: id of mailbox to write
   172	 *
   173	 *  returns SUCCESS if it successfully received a message notification and
   174	 *  copied it into the receive buffer.
   175	 **/
   176	int ngbe_read_posted_mbx(struct ngbe_hw *hw, u32 *msg, u16 size, u16 mbx_id)
   177	{
   178		struct ngbe_mbx_info *mbx = &hw->mbx;
   179		int err = NGBE_ERR_MBX;
   180	
   181		if (!mbx->ops.read)
   182			goto out;
   183	
   184		err = ngbe_poll_for_msg(hw, mbx_id);
   185	
   186		/* if ack received read message, otherwise we timed out */
   187		if (!err)
   188			err = TCALL(hw, mbx.ops.read, msg, size, mbx_id);
   189	out:
   190		return err;
   191	}
   192	
   193	/**
   194	 *  ngbe_write_posted_mbx - Write a message to the mailbox, wait for ack
   195	 *  @hw: pointer to the HW structure
   196	 *  @msg: The message buffer
   197	 *  @size: Length of buffer
   198	 *  @mbx_id: id of mailbox to write
   199	 *
   200	 *  returns SUCCESS if it successfully copied message into the buffer and
   201	 *  received an ack to that message within delay * timeout period
   202	 **/
   203	int ngbe_write_posted_mbx(struct ngbe_hw *hw, u32 *msg, u16 size,
   204				   u16 mbx_id)
   205	{
   206		struct ngbe_mbx_info *mbx = &hw->mbx;
   207		int err;
   208	
   209		/* exit if either we can't write or there isn't a defined timeout */
   210		if (!mbx->timeout)
   211			return NGBE_ERR_MBX;
   212	
   213		/* send msg */
   214		err = TCALL(hw, mbx.ops.write, msg, size, mbx_id);
   215	
   216		/* if msg sent wait until we receive an ack */
   217		if (!err)
   218			err = ngbe_poll_for_ack(hw, mbx_id);
   219	
   220		return err;
   221	}
   222	
   223	/**
   224	 *  ngbe_init_mbx_ops - Initialize MB function pointers
   225	 *  @hw: pointer to the HW structure
   226	 *
   227	 *  Setups up the mailbox read and write message function pointers
   228	 **/
   229	void ngbe_init_mbx_ops(struct ngbe_hw *hw)
   230	{
   231		struct ngbe_mbx_info *mbx = &hw->mbx;
   232	
   233		mbx->ops.read_posted = ngbe_read_posted_mbx;
   234		mbx->ops.write_posted = ngbe_write_posted_mbx;
   235	}
   236	
   237	/**
   238	 *  ngbe_read_v2p_mailbox - read v2p mailbox
   239	 *  @hw: pointer to the HW structure
   240	 *
   241	 *  This function is used to read the v2p mailbox without losing the read to
   242	 *  clear status bits.
   243	 **/
 > 244	u32 ngbe_read_v2p_mailbox(struct ngbe_hw *hw)
   245	{
   246		u32 v2p_mailbox = rd32(hw, NGBE_VXMAILBOX);
   247	
   248		v2p_mailbox |= hw->mbx.v2p_mailbox;
   249		hw->mbx.v2p_mailbox |= v2p_mailbox & NGBE_VXMAILBOX_R2C_BITS;
   250	
   251		return v2p_mailbox;
   252	}
   253	
   254	/**
   255	 *  ngbe_check_for_bit_vf - Determine if a status bit was set
   256	 *  @hw: pointer to the HW structure
   257	 *  @mask: bitmask for bits to be tested and cleared
   258	 *
   259	 *  This function is used to check for the read to clear bits within
   260	 *  the V2P mailbox.
   261	 **/
 > 262	int ngbe_check_for_bit_vf(struct ngbe_hw *hw, u32 mask)
   263	{
   264		u32 mailbox = ngbe_read_v2p_mailbox(hw);
   265	
   266		hw->mbx.v2p_mailbox &= ~mask;
   267	
   268		return (mailbox & mask ? 0 : NGBE_ERR_MBX);
   269	}
   270	
   271	/**
   272	 *  ngbe_check_for_msg_vf - checks to see if the PF has sent mail
   273	 *  @hw: pointer to the HW structure
   274	 *  @mbx_id: id of mailbox to check
   275	 *
   276	 *  returns SUCCESS if the PF has set the Status bit or else ERR_MBX
   277	 **/
 > 278	int ngbe_check_for_msg_vf(struct ngbe_hw *hw, u16 __always_unused mbx_id)
   279	{
   280		int err = NGBE_ERR_MBX;
   281	
   282		/* read clear the pf sts bit */
   283		if (!ngbe_check_for_bit_vf(hw, NGBE_VXMAILBOX_PFSTS)) {
   284			err = 0;
   285			hw->mbx.stats.reqs++;
   286		}
   287	
   288		return err;
   289	}
   290	
   291	/**
   292	 *  ngbe_check_for_ack_vf - checks to see if the PF has ACK'd
   293	 *  @hw: pointer to the HW structure
   294	 *  @mbx_id: id of mailbox to check
   295	 *
   296	 *  returns SUCCESS if the PF has set the ACK bit or else ERR_MBX
   297	 **/
 > 298	int ngbe_check_for_ack_vf(struct ngbe_hw *hw, u16 __always_unused mbx_id)
   299	{
   300		int err = NGBE_ERR_MBX;
   301	
   302		/* read clear the pf ack bit */
   303		if (!ngbe_check_for_bit_vf(hw, NGBE_VXMAILBOX_PFACK)) {
   304			err = 0;
   305			hw->mbx.stats.acks++;
   306		}
   307	
   308		return err;
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
