Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EDC3A1BA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 00:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751589405; cv=none; b=Bq8r9xfQ/u12iEpF2l90fzFxO+yXhKTzJ3WpIto5INBwtgH9v8BXy4HArJSNgkvqxQlDBqRVRQuxc2O7P9qtaTm8mETfGAx/vO4FDtgleXiOHxlrDDHayOP2gk+OAzPgzlaLk+sFmZVa4ufZgLI7e7YqpLazn+02l1p23Lk2sNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751589405; c=relaxed/simple;
	bh=qKqRr8XOiD2e7T8SAAf3yTnFYBlydVXjU3KdDqaPvfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MgZvL16YNz0EY6ynUcQKNlKi7WVQzJhHRSMipJxrRNWowUb/Sc8JKf5NFNfPEKlWbo0CNap2jNfDeNudLTcE29iC6a/GsgdS22QXGZ2GKTWrhgR+iFR7pn+6FSsQTmzYjtGCDwMC2V1pfY6SsGIV3flBSUT3dfDagcAxTnu8YD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LghT5j7q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LghT5j7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751589403; x=1783125403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qKqRr8XOiD2e7T8SAAf3yTnFYBlydVXjU3KdDqaPvfE=;
  b=LghT5j7qdDTzHtabRb7B3guWDIIutWkK22jqV9o/KN8Nfy8NW+ujnLfp
   6zOV44acfOjUsup8NxciuPGzul4GYZZafLmN2MfANfH9qiLnLAw1Mes22
   h06dnBdjjN2HFl0ZhBmYdYIuExm7QxB6z9/e8aMA8HhYn4+FP6TYdsqOi
   H1lDdqM4kHfcMdozcsAVCpReV9YX7aHxLJHcf5gjgJasXIla8aMe3PniT
   VYElxtyUp58ms6MpePa31jI7GS3xd4CX7rVJbgZ/bODFWJ1E+5XuE0Zd4
   un7ODVn/VfV7vE1WDhnWR5dI9yF5L6eFSLHKh7uXyLG3VYTNrtlaDaMWB
   g==;
X-CSE-ConnectionGUID: uYylbW2CRVWo8qx22aCXTw==
X-CSE-MsgGUID: 3G1WJGFDQjygwsF1OYAuDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="41554110"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="41554110"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 17:36:42 -0700
X-CSE-ConnectionGUID: JMO6k481SsC/TaW3IJ91fA==
X-CSE-MsgGUID: 33jTdom3RWyy/70j16eN6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="155075575"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jul 2025 17:36:41 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXUPv-00039V-0h;
	Fri, 04 Jul 2025 00:36:39 +0000
Date: Fri, 4 Jul 2025 08:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shi Jing <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2455/2455]
 drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:1268:29: warning:
 'speed ' directive output may be truncated writing 6 bytes into a region of
 size between 1 and 128
Message-ID: <202507040829.NhLVmauM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9b85bcf0e6357841885264f42859bec05c9073f4
commit: 0bf0c942a09ba92e1d22e6960464b628dd4408fa [2455/2455] net/hinic3: Synchronize new NIC features and bug fixes
config: x86_64-buildonly-randconfig-006-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040829.NhLVmauM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040829.NhLVmauM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040829.NhLVmauM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:356:5: warning: no previous prototype for 'hinic3_rx_queue_stat_pack' [-Wmissing-prototypes]
     356 | int hinic3_rx_queue_stat_pack(struct hinic3_show_item *item,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:369:5: warning: no previous prototype for 'hinic3_tx_queue_stat_pack' [-Wmissing-prototypes]
     369 | int hinic3_tx_queue_stat_pack(struct hinic3_show_item *item,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c: In function 'hinic3_set_settings_to_hw':
>> drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:1268:29: warning: 'speed ' directive output may be truncated writing 6 bytes into a region of size between 1 and 128 [-Wformat-truncation=]
    1268 |                          "%sspeed %u ", link_info, speed);
         |                             ^~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:1267:17: note: 'snprintf' output between 9 and 145 bytes into a destination of size 128
    1267 |                 snprintf(set_link_str, sizeof(set_link_str),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1268 |                          "%sspeed %u ", link_info, speed);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:621:6: warning: no previous prototype for 'print_port_info' [-Wmissing-prototypes]
     621 | void print_port_info(struct hinic3_nic_io *nic_io,
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:803:6: warning: no previous prototype for 'hinic3_notify_vf_bond_status' [-Wmissing-prototypes]
     803 | void hinic3_notify_vf_bond_status(struct hinic3_nic_io *nic_io,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:833:6: warning: no previous prototype for 'hinic3_notify_all_vfs_bond_changed' [-Wmissing-prototypes]
     833 | void hinic3_notify_all_vfs_bond_changed(void *hwdev, u8 bond_status)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1671:5: warning: no previous prototype for 'set_fecparam' [-Wmissing-prototypes]
    1671 | int set_fecparam(void *hwdev, u8 fecparam)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1699:5: warning: no previous prototype for 'get_fecparam' [-Wmissing-prototypes]
    1699 | int get_fecparam(void *hwdev, u8 *advertised_fec, u8 *supported_fec)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c: In function 'get_port_temperature_power':
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:548:52: warning: ', rx power: ' directive output may be truncated writing 12 bytes into a region of size between 1 and 512 [-Wformat-truncation=]
     548 |                 snprintf(str, CAP_INFO_MAX_LEN, "%s, rx power: %uuW, tx power: %uuW",
         |                                                    ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:548:17: note: 'snprintf' output between 31 and 560 bytes into a destination of size 512
     548 |                 snprintf(str, CAP_INFO_MAX_LEN, "%s, rx power: %uuW, tx power: %uuW",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     549 |                          cap_info, info->power[0x0], info->power[0x1]);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:544:53: warning: ', rx power: ' directive output may be truncated writing 12 bytes into a region of size between 1 and 512 [-Wformat-truncation=]
     544 |                 snprintf(str,  CAP_INFO_MAX_LEN, "%s, rx power: %uuw %uuW %uuW %uuW",
         |                                                     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:544:17: note: 'snprintf' output between 28 and 575 bytes into a destination of size 512
     544 |                 snprintf(str,  CAP_INFO_MAX_LEN, "%s, rx power: %uuw %uuW %uuW %uuW",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     545 |                          cap_info, info->power[0x0], info->power[0x1],
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     546 |                          info->power[0x2], info->power[0x3]);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1268 drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c

  1250	
  1251	static int hinic3_set_settings_to_hw(struct hinic3_nic_dev *nic_dev,
  1252					     u32 set_settings, u8 autoneg, u32 speed)
  1253	{
  1254		struct net_device *netdev = nic_dev->netdev;
  1255		struct hinic3_link_ksettings settings = { 0 };
  1256		int speed_level = 0;
  1257		char set_link_str[HINIC_SET_LINK_STR_LEN] = {0};
  1258		char link_info[HINIC_SET_LINK_STR_LEN] = {0};
  1259		int err = 0;
  1260	
  1261		snprintf(link_info, sizeof(link_info), "%s",
  1262			 (bool)(set_settings & HILINK_LINK_SET_AUTONEG) ?
  1263			 ((bool)autoneg ? "autong enable " : "autong disable ") : "");
  1264	
  1265		if (set_settings & HILINK_LINK_SET_SPEED) {
  1266			speed_level = hinic3_ethtool_to_hw_speed_level(speed);
  1267			snprintf(set_link_str, sizeof(set_link_str),
> 1268				 "%sspeed %u ", link_info, speed);
  1269		}
  1270	
  1271		settings.valid_bitmap = set_settings;
  1272		settings.autoneg = (bool)autoneg ? PORT_CFG_AN_ON : PORT_CFG_AN_OFF;
  1273		settings.speed = (u8)speed_level;
  1274	
  1275		err = hinic3_set_link_settings(nic_dev->hwdev, &settings);
  1276		if (err)
  1277			nicif_err(nic_dev, drv, netdev, "Set %sfailed\n", set_link_str);
  1278		else
  1279			nicif_info(nic_dev, drv, netdev, "Set %ssuccess\n",
  1280				   set_link_str);
  1281	
  1282		return err;
  1283	}
  1284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
