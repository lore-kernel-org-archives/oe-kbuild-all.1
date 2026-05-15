Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DF43F0AA7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832097; cv=none; b=NYxhqoMdYbvwWT0DWIGQdu7sKrTZGWU4l9fRM8EmpqYSd/kp5N5eYp2JINdmiLM5XUcrms4kSOv/0AC5M2mOqA51rf4JGvG0WtyA0ZDSRumuD801oYkLaUf83maaLxwta9j7yFxopmLkFOF7rqoWKA+rtp9etnMm+zDSZRp+BRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832097; c=relaxed/simple;
	bh=uQz9qOuAJh7oNxwhQryppathOy8lCKLlSzcTl7cWXoI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kMURwSGk3qgB43YhRCe21XSai1SU2SWg414w5PNIN/PQUYj7u/eN1+oAnK3znQgqXh5lYFcrBNCmaU7ohMBViTXSKWUcsvk0O9tAiNjYCRqJOKfJlJZsF2Odzfr8yT61LQh7nw63nGD0SOIqM6rvhle47SNdGwJaNOWTn6NCOvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bf68bUOP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bf68bUOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778832094; x=1810368094;
  h=date:from:to:cc:subject:message-id;
  bh=uQz9qOuAJh7oNxwhQryppathOy8lCKLlSzcTl7cWXoI=;
  b=bf68bUOPkBLrAI+AzZ+QtG8aKvKDvApQZnPKwibU7LHkE3guyR5hESbK
   a+Ww8N8jcc2WJWrtWznv6yqvyF2YvQqHN9YdIo5A7NM2RwsBCtlsrcUNC
   KmgRInelmn/64eOFl65MliduBkPyOQM4Nx9t4VaIRLOBQNSmApxclEAJQ
   hyrs3H7JyvMXNdLtvakHTrsw93/5kS299EpR1m/CKdJptkcQo8Kqnpubw
   JqCnrOM46dp2JPrsxp+jTD5rQLcJge4moOTd090MRND1ZSaZbatqjTinp
   PYoCm4e6rr9nKSEK95aDkUtt2i0Cu1m9h592v9Gyr5U/fMjeF7MlqN99g
   A==;
X-CSE-ConnectionGUID: y1nzRS52RxGIAdrzqTmAOw==
X-CSE-MsgGUID: WVJVasadRg+ZKjpPnu46MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79827207"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79827207"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 01:01:34 -0700
X-CSE-ConnectionGUID: uFBE7U+WT1qNgsx4IIoAZA==
X-CSE-MsgGUID: iVceDa39T9i/V2jOFg1RfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="262385721"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2026 01:01:29 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNnTP-00000000193-2kB9;
	Fri, 15 May 2026 08:00:55 +0000
Date: Fri, 15 May 2026 16:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 147/154]
 as21xxx.c:(.text+0x1f8): multiple definition of `aeon_cl45_read';
 drivers/net/phy/as21xx_1.9.1/as21xxx.o:as21xxx.c:(.text+0x1f8): first defined
 here
Message-ID: <202605151630.IoVSnfkV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   767536110bfe28c94ae2e150c083d29f827655cf
commit: 1a140ff79b8bf1a9f5ddb079b6e2b404929f0a36 [147/154] net: phy: rename as21xx v1.9.1 like it's done for 1.9.2
config: powerpc64-randconfig-001-20260515 (https://download.01.org/0day-ci/archive/20260515/202605151630.IoVSnfkV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151630.IoVSnfkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151630.IoVSnfkV-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xxx.o:(.data+0x0): multiple definition of `custome_cfg'; drivers/net/phy/as21xx_1.9.1/as21xxx.o:(.data+0x0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xxx.o: in function `aeon_cl45_read':
>> as21xxx.c:(.text+0x1f8): multiple definition of `aeon_cl45_read'; drivers/net/phy/as21xx_1.9.1/as21xxx.o:as21xxx.c:(.text+0x1f8): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xxx.o: in function `aeon_cl45_write':
>> as21xxx.c:(.text+0x33c): multiple definition of `aeon_cl45_write'; drivers/net/phy/as21xx_1.9.1/as21xxx.o:as21xxx.c:(.text+0x374): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.o: in function `as21xxx_debugfs_init':
>> as21xx_debugfs.c:(.text+0x5128): multiple definition of `as21xxx_debugfs_init'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.o:as21xx_debugfs.c:(.text+0x3a78): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.o: in function `as21xxx_debugfs_remove':
>> as21xx_debugfs.c:(.text+0x5898): multiple definition of `as21xxx_debugfs_remove'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.o:as21xx_debugfs.c:(.text+0x40e8): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.o:(.data+0x0): multiple definition of `IMP_TYPE_STR'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.o:(.data+0x0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_cfg_param_direct':
>> as21xx_api.c:(.text+0x580): multiple definition of `aeon_ipc_cfg_param_direct'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xa7c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_pkt_chk_cfg':
>> as21xx_api.c:(.text+0x620): multiple definition of `aeon_pkt_chk_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xf44): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_auto_eee_cfg':
>> as21xx_api.c:(.text+0x66c): multiple definition of `aeon_auto_eee_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xf90): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_wait_eth_cfg':
>> as21xx_api.c:(.text+0x6b8): multiple definition of `aeon_sds_wait_eth_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xfdc): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_restart_an':
>> as21xx_api.c:(.text+0x708): multiple definition of `aeon_sds_restart_an'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x102c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds2nd_enable':
>> as21xx_api.c:(.text+0x744): multiple definition of `aeon_sds2nd_enable'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x10c0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds2nd_eq_cfg':
>> as21xx_api.c:(.text+0x788): multiple definition of `aeon_sds2nd_eq_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1104): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds2nd_mode_cfg':
>> as21xx_api.c:(.text+0x7d8): multiple definition of `aeon_sds2nd_mode_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1154): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_sync_parity':
>> as21xx_api.c:(.text+0x944): multiple definition of `aeon_ipc_sync_parity'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x51c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_pcs_set_cfg':
>> as21xx_api.c:(.text+0xfe4): multiple definition of `aeon_sds_pcs_set_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xdac): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_sds_txfir':
>> as21xx_api.c:(.text+0x1068): multiple definition of `aeon_ipc_sds_txfir'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x12f0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_auto_link_cfg':
>> as21xx_api.c:(.text+0x10f0): multiple definition of `aeon_ipc_auto_link_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1274): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_auto_link_ena':
>> as21xx_api.c:(.text+0x116c): multiple definition of `aeon_ipc_auto_link_ena'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x11f8): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_normal_retrain_cfg':
>> as21xx_api.c:(.text+0x11e8): multiple definition of `aeon_normal_retrain_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x11a0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_tx_power_lvl':
>> as21xx_api.c:(.text+0x1240): multiple definition of `aeon_ipc_set_tx_power_lvl'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1068): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_get_fw_version':
>> as21xx_api.c:(.text+0x1298): multiple definition of `aeon_ipc_get_fw_version'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x8cc): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_top_spd':
   as21xx_api.c:(.text+0x1334): multiple definition of `aeon_cu_an_set_top_spd'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xb20): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_restart':
   as21xx_api.c:(.text+0x1378): multiple definition of `aeon_cu_an_restart'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xb64): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_eee_spd':
   as21xx_api.c:(.text+0x13b8): multiple definition of `aeon_cu_an_set_eee_spd'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xba4): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_trd_swap':
   as21xx_api.c:(.text+0x13fc): multiple definition of `aeon_cu_an_set_trd_swap'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xbe8): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_ms_cfg':
   as21xx_api.c:(.text+0x1440): multiple definition of `aeon_cu_an_set_ms_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xc2c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_get_ms_cfg':
   as21xx_api.c:(.text+0x148c): multiple definition of `aeon_cu_an_get_ms_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xc78): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_cfr':
   as21xx_api.c:(.text+0x14f0): multiple definition of `aeon_cu_an_set_cfr'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xcdc): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_fast_retrain':
   as21xx_api.c:(.text+0x1534): multiple definition of `aeon_cu_an_set_fast_retrain'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xd20): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_enable_downshift':
   as21xx_api.c:(.text+0x157c): multiple definition of `aeon_cu_an_enable_downshift'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xd68): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_pma_set_cfg':
   as21xx_api.c:(.text+0x15c0): multiple definition of `aeon_sds_pma_set_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xe2c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_enable_aeon_oui':
   as21xx_api.c:(.text+0x1610): multiple definition of `aeon_cu_an_enable_aeon_oui'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xe7c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_eye_scan':
   as21xx_api.c:(.text+0x1654): multiple definition of `aeon_ipc_eye_scan'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0xec0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_temp_monitor':
   as21xx_api.c:(.text+0x1870): multiple definition of `aeon_ipc_temp_monitor'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1378): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_led_cfg':
   as21xx_api.c:(.text+0x18e8): multiple definition of `aeon_ipc_set_led_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x142c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_read_status':
   as21xx_api.c:(.text+0x196c): multiple definition of `aeon_read_status'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x14b4): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_sys_reboot':
   as21xx_api.c:(.text+0x1a8c): multiple definition of `aeon_ipc_set_sys_reboot'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x15d4): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_phy_enable_mode':
   as21xx_api.c:(.text+0x1acc): multiple definition of `aeon_ipc_phy_enable_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1614): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_ng_test_mode':
   as21xx_api.c:(.text+0x1b40): multiple definition of `aeon_ipc_ng_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x168c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_enable':
   as21xx_api.c:(.text+0x1b84): multiple definition of `aeon_cu_an_enable'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x16d0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_set_man_mdi':
   as21xx_api.c:(.text+0x1c00): multiple definition of `aeon_set_man_mdi'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1714): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_set_man_mdix':
   as21xx_api.c:(.text+0x1c48): multiple definition of `aeon_set_man_mdix'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x175c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_set_man_duplex':
   as21xx_api.c:(.text+0x1c8c): multiple definition of `aeon_set_man_duplex'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x17a0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ng_test_mode':
   as21xx_api.c:(.text+0x1cd8): multiple definition of `aeon_ng_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x17ec): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_1g_test_mode':
   as21xx_api.c:(.text+0x1e04): multiple definition of `aeon_1g_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1918): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_100m_test_mode':
   as21xx_api.c:(.text+0x1ec8): multiple definition of `aeon_100m_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1c40): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_wol':
   as21xx_api.c:(.text+0x1f40): multiple definition of `aeon_ipc_set_wol'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1d24): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_smi_command':
   as21xx_api.c:(.text+0x1f8c): multiple definition of `aeon_ipc_smi_command'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1d70): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_irq_en':
   as21xx_api.c:(.text+0x1fd0): multiple definition of `aeon_ipc_irq_en'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1db4): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_irq_clr':
   as21xx_api.c:(.text+0x204c): multiple definition of `aeon_ipc_irq_clr'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1e34): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_irq_query':
   as21xx_api.c:(.text+0x20c0): multiple definition of `aeon_ipc_irq_query'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1eac): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_tx_fullscale_delta':
   as21xx_api.c:(.text+0x215c): multiple definition of `aeon_ipc_set_tx_fullscale_delta'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1cc0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_get_tx_fullscale_delta':
   as21xx_api.c:(.text+0x21c0): multiple definition of `aeon_ipc_get_tx_fullscale_delta'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x1f4c): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_wdt':
   as21xx_api.c:(.text+0x2224): multiple definition of `aeon_ipc_set_wdt'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x2020): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_read_mem':
   as21xx_api.c:(.text+0x2264): multiple definition of `aeon_ipc_read_mem'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x2060): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_mac_cnt':
   as21xx_api.c:(.text+0x2304): multiple definition of `aeon_ipc_set_mac_cnt'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x2104): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_cable_diag':
   as21xx_api.c:(.text+0x23a0): multiple definition of `aeon_ipc_cable_diag'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x21a0): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_enable_cfg':
   as21xx_api.c:(.text+0x2434): multiple definition of `aeon_synce_enable_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x2218): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_mode_cfg':
   as21xx_api.c:(.text+0x24b0): multiple definition of `aeon_synce_mode_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x2294): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_user_bw':
   as21xx_api.c:(.text+0x252c): multiple definition of `aeon_synce_user_bw'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x2310): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_slave_output_ctrl_cfg':
   as21xx_api.c:(.text+0x2584): multiple definition of `aeon_synce_slave_output_ctrl_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x2368): first defined here
   powerpc64-linux-ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_parallel_det':
   as21xx_api.c:(.text+0x25dc): multiple definition of `aeon_parallel_det'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:as21xx_api.c:(.text+0x23c0): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
