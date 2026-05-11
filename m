Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C505636D500
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778498158; cv=none; b=ACdUtj1r+Mw5TBll+dAkgbDYxD+U5KiOsr6k1tOrO3V1zVB4ZCQI/1k9mi+p9N6mTx+E6Sk31oKMLLK3SqVsXAe7FFCJKWPQk1fRWQynz/d23uHEi1TeDphN3vD2aL/98DNvBzb+s6n/Ng0MZYBlzSodZTROVEAfGS9XlCJKZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778498158; c=relaxed/simple;
	bh=3A6U1GzFgY8iNUuJivdqq6TPJ5xPEOmrT6drdv7WCmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RazYaxVlFbkQLpgGFf08qMUALbhk2icqKTMGHNBv1Cqeqe7Yv3rM75IjyvPLwJP/IuALe68Bi6zE8SZBPamZstfzNcb2UL+Bo8qyZhZ92qZTmnmGcmUfhD0pQBWGGcXH6yEYRKWanExLwQc/uBMrDw34kWxaIG27CsSq8UJmjyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=En/WWnmR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="En/WWnmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778498155; x=1810034155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3A6U1GzFgY8iNUuJivdqq6TPJ5xPEOmrT6drdv7WCmw=;
  b=En/WWnmRkH+FYITs8nMUDBHdmE6vMM/SYBmyjoNoaWkRcjJPA05GJlQE
   ynahUbLuFICi99Q/qq8CKspF/f1oYw0K8SKxwZNLHshFLubULqHR7VpSi
   htv1T7Wr1hbYHeNpPtzyKgWTnSp8PrnCGDon6Db3bEYYRkae6O8XndC18
   qLEp3t/TDpWkm+6BT54ZrJpyK+4B7+ey2JgoW++rRj0EWy80FPsRJZZ+V
   8LewQgYadcK54u94pYx8FBAzN86osQp/3DeXbRSl4MtGpHgpeguHoCwB6
   bu7Xw27KpMzW0EHqXziKx/+PUA7f6Hl33aAR1I0bnpcdx18JaHXy5zi4h
   w==;
X-CSE-ConnectionGUID: qzbXft0KRR2NHbusPGo8jQ==
X-CSE-MsgGUID: p45Xae+SQyyyo4+bbw0B0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="102045263"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="102045263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:15:55 -0700
X-CSE-ConnectionGUID: Sw5OhJnhSVe7ZiUKC0b+1g==
X-CSE-MsgGUID: P+uv4Z2fSfugVJgytOptuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="233096073"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2026 04:15:53 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMOc3-000000000TH-1icm;
	Mon, 11 May 2026 11:15:51 +0000
Date: Mon, 11 May 2026 19:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 152/162]
 drivers/net/phy/as21xx_1.9.2/as21xxx.c:478: multiple definition of
 `aeon_cl45_read';
 =?us-ascii?Q?drivers/net/phy/as21xx=5F1.9.1/as21xxx.o:drivers/net/phy/as2?=
 =?us-ascii?Q?1xx=5F1.9.1/as21xxx.c:478:?= first defined here
Message-ID: <202605111903.1Kuwk3Db-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   12aaea139e45ed0d826a63a866c1ce03d352fea6
commit: 3b3c9c1c9610d3d9dc993bcdd5e1228369cdb213 [152/162] net: phy: rename as21xx v1.9.1 like it's done for 1.9.2
config: powerpc-randconfig-002-20260510 (https://download.01.org/0day-ci/archive/20260511/202605111903.1Kuwk3Db-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111903.1Kuwk3Db-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111903.1Kuwk3Db-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xxx.o:(.data+0xf30): multiple definition of `custome_cfg'; drivers/net/phy/as21xx_1.9.1/as21xxx.o:(.data+0xf30): first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xxx.o: in function `aeon_cl45_read':
>> drivers/net/phy/as21xx_1.9.2/as21xxx.c:478: multiple definition of `aeon_cl45_read'; drivers/net/phy/as21xx_1.9.1/as21xxx.o:drivers/net/phy/as21xx_1.9.1/as21xxx.c:478: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xxx.o: in function `aeon_cl45_write':
>> drivers/net/phy/as21xx_1.9.2/as21xxx.c:504: multiple definition of `aeon_cl45_write'; drivers/net/phy/as21xx_1.9.1/as21xxx.o:drivers/net/phy/as21xx_1.9.1/as21xxx.c:504: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.o: in function `as21xxx_debugfs_init':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:3611: multiple definition of `as21xxx_debugfs_init'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.c:2695: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.o: in function `as21xxx_debugfs_remove':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:3769: multiple definition of `as21xxx_debugfs_remove'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.c:2819: first defined here
>> powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.o:(.data+0x0): multiple definition of `IMP_TYPE_STR'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.o:(.data+0x0): first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_cfg_param_direct':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:297: multiple definition of `aeon_ipc_cfg_param_direct'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:344: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_pkt_chk_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:514: multiple definition of `aeon_pkt_chk_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:722: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_auto_eee_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:527: multiple definition of `aeon_auto_eee_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:735: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_wait_eth_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:541: multiple definition of `aeon_sds_wait_eth_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:749: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_restart_an':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:554: multiple definition of `aeon_sds_restart_an'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:762: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds2nd_enable':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:574: multiple definition of `aeon_sds2nd_enable'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:782: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds2nd_eq_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:586: multiple definition of `aeon_sds2nd_eq_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:795: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds2nd_mode_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:601: multiple definition of `aeon_sds2nd_mode_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:810: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_sync_parity':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1130: multiple definition of `aeon_ipc_sync_parity'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:243: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_tx_power_lvl':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:563: multiple definition of `aeon_ipc_set_tx_power_lvl'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:771: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_normal_retrain_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:614: multiple definition of `aeon_normal_retrain_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:823: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_auto_link_ena':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:625: multiple definition of `aeon_ipc_auto_link_ena'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:834: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_auto_link_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:636: multiple definition of `aeon_ipc_auto_link_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:845: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_sds_txfir':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:648: multiple definition of `aeon_ipc_sds_txfir'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:857: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_pcs_set_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:663: multiple definition of `aeon_sds_pcs_set_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:668: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_get_fw_version':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1169: multiple definition of `aeon_ipc_get_fw_version'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:282: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_top_spd':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1185: multiple definition of `aeon_cu_an_set_top_spd'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:557: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_restart':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1196: multiple definition of `aeon_cu_an_restart'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:568: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_eee_spd':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1207: multiple definition of `aeon_cu_an_set_eee_spd'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:579: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_trd_swap':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1219: multiple definition of `aeon_cu_an_set_trd_swap'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:590: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_ms_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1232: multiple definition of `aeon_cu_an_set_ms_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:603: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_get_ms_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1246: multiple definition of `aeon_cu_an_get_ms_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:617: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_cfr':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1257: multiple definition of `aeon_cu_an_set_cfr'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:628: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_fast_retrain':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1270: multiple definition of `aeon_cu_an_set_fast_retrain'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:641: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_enable_downshift':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1284: multiple definition of `aeon_cu_an_enable_downshift'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:655: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_pma_set_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1298: multiple definition of `aeon_sds_pma_set_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:682: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_enable_aeon_oui':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1313: multiple definition of `aeon_cu_an_enable_aeon_oui'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:697: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_eye_scan':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1325: multiple definition of `aeon_ipc_eye_scan'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:709: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_temp_monitor':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1389: multiple definition of `aeon_ipc_temp_monitor'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:874: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_led_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1405: multiple definition of `aeon_ipc_set_led_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:899: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_read_status':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1420: multiple definition of `aeon_read_status'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:916: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_sys_reboot':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1476: multiple definition of `aeon_ipc_set_sys_reboot'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:972: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_phy_enable_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1483: multiple definition of `aeon_ipc_phy_enable_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:979: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_ng_test_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1499: multiple definition of `aeon_ipc_ng_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1199: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_enable':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1511: multiple definition of `aeon_cu_an_enable'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1211: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_set_man_mdi':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1522: multiple definition of `aeon_set_man_mdi'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1222: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_set_man_mdix':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1534: multiple definition of `aeon_set_man_mdix'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1234: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_set_man_duplex':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1546: multiple definition of `aeon_set_man_duplex'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1246: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ng_test_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1559: multiple definition of `aeon_ng_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1259: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_1g_test_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1586: multiple definition of `aeon_1g_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1286: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_100m_test_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1606: multiple definition of `aeon_100m_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1348: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_wol':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1621: multiple definition of `aeon_ipc_set_wol'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1381: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_smi_command':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1634: multiple definition of `aeon_ipc_smi_command'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1394: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_irq_en':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1645: multiple definition of `aeon_ipc_irq_en'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1405: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_irq_clr':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1666: multiple definition of `aeon_ipc_irq_clr'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1426: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_irq_query':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1684: multiple definition of `aeon_ipc_irq_query'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1444: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_tx_fullscale_delta':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1704: multiple definition of `aeon_ipc_set_tx_fullscale_delta'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1365: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_get_tx_fullscale_delta':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1721: multiple definition of `aeon_ipc_get_tx_fullscale_delta'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1464: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_wdt':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1733: multiple definition of `aeon_ipc_set_wdt'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1491: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_read_mem':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1744: multiple definition of `aeon_ipc_read_mem'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1502: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_mac_cnt':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1761: multiple definition of `aeon_ipc_set_mac_cnt'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1519: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_cable_diag':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1786: multiple definition of `aeon_ipc_cable_diag'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1544: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_enable_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1815: multiple definition of `aeon_synce_enable_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1573: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_mode_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1826: multiple definition of `aeon_synce_mode_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1584: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_user_bw':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1837: multiple definition of `aeon_synce_user_bw'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1595: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_slave_output_ctrl_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1848: multiple definition of `aeon_synce_slave_output_ctrl_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1606: first defined here
   powerpc-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_parallel_det':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1859: multiple definition of `aeon_parallel_det'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1617: first defined here


vim +478 drivers/net/phy/as21xx_1.9.2/as21xxx.c

657b088cd0f209f Bo-Cun Chen 2026-01-28  475  
657b088cd0f209f Bo-Cun Chen 2026-01-28  476  int aeon_cl45_read(struct phy_device *phydev, int dev_addr,
657b088cd0f209f Bo-Cun Chen 2026-01-28  477  		   unsigned int phy_reg)
657b088cd0f209f Bo-Cun Chen 2026-01-28 @478  {
657b088cd0f209f Bo-Cun Chen 2026-01-28  479  	int ret = 0;
657b088cd0f209f Bo-Cun Chen 2026-01-28  480  	struct mii_bus *bus = phydev->mdio.bus;
657b088cd0f209f Bo-Cun Chen 2026-01-28  481  	int phy_addr = phydev->mdio.addr;
657b088cd0f209f Bo-Cun Chen 2026-01-28  482  
657b088cd0f209f Bo-Cun Chen 2026-01-28  483  	if (!bus) {
657b088cd0f209f Bo-Cun Chen 2026-01-28  484  		phydev_err(phydev, "MDIO bus is NULL\r\n");
657b088cd0f209f Bo-Cun Chen 2026-01-28  485  		return -ENODEV;
657b088cd0f209f Bo-Cun Chen 2026-01-28  486  	}
657b088cd0f209f Bo-Cun Chen 2026-01-28  487  
657b088cd0f209f Bo-Cun Chen 2026-01-28  488  	if (phy_addr >= PHY_MAX_ADDR) {
657b088cd0f209f Bo-Cun Chen 2026-01-28  489  		phydev_err(phydev, "Invaild PHY address: %d", phy_addr);
657b088cd0f209f Bo-Cun Chen 2026-01-28  490  		return -EINVAL;
657b088cd0f209f Bo-Cun Chen 2026-01-28  491  	}
657b088cd0f209f Bo-Cun Chen 2026-01-28  492  
657b088cd0f209f Bo-Cun Chen 2026-01-28  493  	mutex_lock(&bus->mdio_lock);
657b088cd0f209f Bo-Cun Chen 2026-01-28  494  	ret = __mdiobus_c45_read(bus, phy_addr, dev_addr, phy_reg);
657b088cd0f209f Bo-Cun Chen 2026-01-28  495  	mutex_unlock(&bus->mdio_lock);
657b088cd0f209f Bo-Cun Chen 2026-01-28  496  	aeon_mdio_patch(phydev);
657b088cd0f209f Bo-Cun Chen 2026-01-28  497  
657b088cd0f209f Bo-Cun Chen 2026-01-28  498  	return ret;
657b088cd0f209f Bo-Cun Chen 2026-01-28  499  }
657b088cd0f209f Bo-Cun Chen 2026-01-28  500  EXPORT_SYMBOL(aeon_cl45_read);
657b088cd0f209f Bo-Cun Chen 2026-01-28  501  
657b088cd0f209f Bo-Cun Chen 2026-01-28  502  void aeon_cl45_write(struct phy_device *phydev, int dev_addr,
657b088cd0f209f Bo-Cun Chen 2026-01-28  503  		     unsigned int phy_reg, unsigned short phy_data)
657b088cd0f209f Bo-Cun Chen 2026-01-28 @504  {
657b088cd0f209f Bo-Cun Chen 2026-01-28  505  	struct mii_bus *bus = phydev->mdio.bus;
657b088cd0f209f Bo-Cun Chen 2026-01-28  506  	int phy_addr = phydev->mdio.addr;
657b088cd0f209f Bo-Cun Chen 2026-01-28  507  
657b088cd0f209f Bo-Cun Chen 2026-01-28  508  	if (!bus) {
657b088cd0f209f Bo-Cun Chen 2026-01-28  509  		phydev_err(phydev, "MDIO bus is NULL\r\n");
657b088cd0f209f Bo-Cun Chen 2026-01-28  510  		return;
657b088cd0f209f Bo-Cun Chen 2026-01-28  511  	}
657b088cd0f209f Bo-Cun Chen 2026-01-28  512  
657b088cd0f209f Bo-Cun Chen 2026-01-28  513  	if (phy_addr >= PHY_MAX_ADDR) {
657b088cd0f209f Bo-Cun Chen 2026-01-28  514  		phydev_err(phydev, "Invaild PHY address: %d", phy_addr);
657b088cd0f209f Bo-Cun Chen 2026-01-28  515  		return;
657b088cd0f209f Bo-Cun Chen 2026-01-28  516  	}
657b088cd0f209f Bo-Cun Chen 2026-01-28  517  
657b088cd0f209f Bo-Cun Chen 2026-01-28  518  	mutex_lock(&bus->mdio_lock);
657b088cd0f209f Bo-Cun Chen 2026-01-28  519  	__mdiobus_c45_write(bus, phy_addr, dev_addr, phy_reg, phy_data);
657b088cd0f209f Bo-Cun Chen 2026-01-28  520  	mutex_unlock(&bus->mdio_lock);
657b088cd0f209f Bo-Cun Chen 2026-01-28  521  	aeon_mdio_patch(phydev);
657b088cd0f209f Bo-Cun Chen 2026-01-28  522  }
657b088cd0f209f Bo-Cun Chen 2026-01-28  523  EXPORT_SYMBOL(aeon_cl45_write);
657b088cd0f209f Bo-Cun Chen 2026-01-28  524  

:::::: The code at line 478 was first introduced by commit
:::::: 657b088cd0f209f0e854466b0beb68911b6ed836 net: phy: as21xxx: update driver to v1.9.2

:::::: TO: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
