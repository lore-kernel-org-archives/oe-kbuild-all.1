Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCA11DC1AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 00:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779932; cv=none; b=GLoEffKOg/ZXCeEQMffGNVB5Y6wHkycXLy346+NB/TRXPgauvwT3251ZZ8JrkIEGOiz8GN8mseF+EHhD9pNSc3YVdODhjcGIfHg7oYLaOr3s/6HKKhzGvAKH2jF9FY+VoaRWXRuj3ZQUYzxDwrFN8jWHvYAgHfghbjusj5DB/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779932; c=relaxed/simple;
	bh=Rkg+kfFmWW93w8HMxjXjhXwP8IioOVfhO1ko/A6fPCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q1f1Pad7De2GpXBZMmNML5Hj7w9mqYPzn0YQPtmevTytLkpHe7rFErpGK5nc2XGIQ9/M4A1ur89gCgAaMXhF/Ukv4VtH7U0q+U8KGPBKJ1ZTnbkpZ1vzatGS9UahyMHHgjK5kL/13zfEfGIFyH+6hVpIL/91TVYSAIdSXSJmiCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6WAC2W+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6WAC2W+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782779930; x=1814315930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rkg+kfFmWW93w8HMxjXjhXwP8IioOVfhO1ko/A6fPCA=;
  b=B6WAC2W+vfvZDW0nvEv3nioqUHBfw5v0DkD0GVuUssJT2dNq8+LWE/Pq
   WMvpu5NFSl0XcVfJ/me4g1pF4EjeJbd3y2wBOlY3d0uoP5fRN6lILA+XA
   10o3w6LO+ueVT2nu8cZ1XFxOsufAaf7QB770a40iexUVlXNanhd8TGjXL
   ruqOdcUEZgn94tCWzJTsa7BdvUiQ8bxmTE30yNi2i3Of0TOdQXjqNYCpR
   MnWpxUus5pcS+IkGY1I75+tWPUjoEjRmfct4dbrllh4yoboXAaXQmr6UA
   7BKdtV1f2TwyjGNt99YFZP9HtzGXrRqhtaOiBErFr6n25NA/9M6+YugTG
   w==;
X-CSE-ConnectionGUID: oiVkErbcSEO/KBxtpUrxXA==
X-CSE-MsgGUID: ovssH/OnT2m2cANrBmcQlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87399085"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87399085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 17:38:46 -0700
X-CSE-ConnectionGUID: 8IxpcWxbTV21Zu9kxC3bkg==
X-CSE-MsgGUID: YO1IVnZBQhOGZTVcvdu3Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="251704034"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Jun 2026 17:38:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weMUr-000000007tB-2OAf;
	Tue, 30 Jun 2026 00:38:41 +0000
Date: Tue, 30 Jun 2026 08:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/188 1/1] ld:
 =?us-ascii?Q?drivers/net/phy/as21xx=5F1.9.2/as21xxx.o:drivers/net/phy/as2?=
 =?us-ascii?Q?1xx=5F1.9.2/as21xxx.c:304:?= multiple definition of
 `custome_cfg';
 =?us-ascii?Q?drivers/net/phy/as21xx=5F1.9.1/as21xxx.o:drivers/net/phy/as2?=
 =?us-ascii?Q?1xx=5F1.9.1/as21xxx.c:304:?= first defined here
Message-ID: <202606300834.wWk1aQsT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/188
head:   616866fe35b03d003aa74b684a16a24a9e119e2a
commit: d35953f4687e0059a657274066a7dfbf1b6d4173 [1/1] net: phy: rename as21xx v1.9.1 like it's done for 1.9.2
config: i386-randconfig-r054-20260630 (https://download.01.org/0day-ci/archive/20260630/202606300834.wWk1aQsT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300834.wWk1aQsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300834.wWk1aQsT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/net/phy/as21xx_1.9.2/as21xxx.o:drivers/net/phy/as21xx_1.9.2/as21xxx.c:304: multiple definition of `custome_cfg'; drivers/net/phy/as21xx_1.9.1/as21xxx.o:drivers/net/phy/as21xx_1.9.1/as21xxx.c:304: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xxx.o: in function `aeon_cl45_read':
>> drivers/net/phy/as21xx_1.9.2/as21xxx.c:478: multiple definition of `aeon_cl45_read'; drivers/net/phy/as21xx_1.9.1/as21xxx.o:drivers/net/phy/as21xx_1.9.1/as21xxx.c:478: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xxx.o: in function `aeon_cl45_write':
>> drivers/net/phy/as21xx_1.9.2/as21xxx.c:504: multiple definition of `aeon_cl45_write'; drivers/net/phy/as21xx_1.9.1/as21xxx.o:drivers/net/phy/as21xx_1.9.1/as21xxx.c:504: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.o:drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:35: multiple definition of `IMP_TYPE_STR'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.c:64: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.o: in function `as21xxx_debugfs_init':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:3611: multiple definition of `as21xxx_debugfs_init'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.c:2695: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.o: in function `as21xxx_debugfs_remove':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_debugfs.c:3769: multiple definition of `as21xxx_debugfs_remove'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_debugfs.c:2819: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_cfg_param_direct':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:297: multiple definition of `aeon_ipc_cfg_param_direct'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:344: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_pkt_chk_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:514: multiple definition of `aeon_pkt_chk_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:722: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_auto_eee_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:527: multiple definition of `aeon_auto_eee_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:735: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_wait_eth_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:541: multiple definition of `aeon_sds_wait_eth_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:749: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_restart_an':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:554: multiple definition of `aeon_sds_restart_an'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:762: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds2nd_enable':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:574: multiple definition of `aeon_sds2nd_enable'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:782: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds2nd_eq_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:586: multiple definition of `aeon_sds2nd_eq_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:795: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds2nd_mode_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:601: multiple definition of `aeon_sds2nd_mode_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:810: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_sync_parity':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1130: multiple definition of `aeon_ipc_sync_parity'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:243: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_pcs_set_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:663: multiple definition of `aeon_sds_pcs_set_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:668: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_sds_txfir':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:648: multiple definition of `aeon_ipc_sds_txfir'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:857: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_auto_link_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:636: multiple definition of `aeon_ipc_auto_link_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:845: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_auto_link_ena':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:625: multiple definition of `aeon_ipc_auto_link_ena'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:834: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_normal_retrain_cfg':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:614: multiple definition of `aeon_normal_retrain_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:823: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_tx_power_lvl':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:563: multiple definition of `aeon_ipc_set_tx_power_lvl'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:771: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_get_fw_version':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1169: multiple definition of `aeon_ipc_get_fw_version'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:282: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_top_spd':
>> drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1185: multiple definition of `aeon_cu_an_set_top_spd'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:557: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_restart':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1196: multiple definition of `aeon_cu_an_restart'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:568: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_eee_spd':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1207: multiple definition of `aeon_cu_an_set_eee_spd'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:579: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_trd_swap':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1219: multiple definition of `aeon_cu_an_set_trd_swap'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:590: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_ms_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1232: multiple definition of `aeon_cu_an_set_ms_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:603: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_get_ms_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1246: multiple definition of `aeon_cu_an_get_ms_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:617: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_cfr':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1257: multiple definition of `aeon_cu_an_set_cfr'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:628: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_set_fast_retrain':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1270: multiple definition of `aeon_cu_an_set_fast_retrain'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:641: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_enable_downshift':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1284: multiple definition of `aeon_cu_an_enable_downshift'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:655: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_sds_pma_set_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1298: multiple definition of `aeon_sds_pma_set_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:682: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_enable_aeon_oui':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1313: multiple definition of `aeon_cu_an_enable_aeon_oui'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:697: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_eye_scan':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1325: multiple definition of `aeon_ipc_eye_scan'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:709: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_temp_monitor':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1389: multiple definition of `aeon_ipc_temp_monitor'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:874: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_led_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1405: multiple definition of `aeon_ipc_set_led_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:899: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_read_status':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1420: multiple definition of `aeon_read_status'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:916: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_sys_reboot':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1476: multiple definition of `aeon_ipc_set_sys_reboot'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:972: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_phy_enable_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1483: multiple definition of `aeon_ipc_phy_enable_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:979: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_ng_test_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1499: multiple definition of `aeon_ipc_ng_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1199: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_cu_an_enable':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1511: multiple definition of `aeon_cu_an_enable'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1211: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_set_man_mdi':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1522: multiple definition of `aeon_set_man_mdi'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1222: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_set_man_mdix':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1534: multiple definition of `aeon_set_man_mdix'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1234: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_set_man_duplex':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1546: multiple definition of `aeon_set_man_duplex'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1246: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ng_test_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1559: multiple definition of `aeon_ng_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1259: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_1g_test_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1586: multiple definition of `aeon_1g_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1286: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_100m_test_mode':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1606: multiple definition of `aeon_100m_test_mode'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1348: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_wol':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1621: multiple definition of `aeon_ipc_set_wol'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1381: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_smi_command':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1634: multiple definition of `aeon_ipc_smi_command'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1394: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_irq_en':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1645: multiple definition of `aeon_ipc_irq_en'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1405: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_irq_clr':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1666: multiple definition of `aeon_ipc_irq_clr'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1426: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_irq_query':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1684: multiple definition of `aeon_ipc_irq_query'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1444: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_tx_fullscale_delta':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1704: multiple definition of `aeon_ipc_set_tx_fullscale_delta'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1365: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_get_tx_fullscale_delta':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1721: multiple definition of `aeon_ipc_get_tx_fullscale_delta'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1464: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_wdt':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1733: multiple definition of `aeon_ipc_set_wdt'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1491: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_read_mem':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1744: multiple definition of `aeon_ipc_read_mem'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1502: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_set_mac_cnt':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1761: multiple definition of `aeon_ipc_set_mac_cnt'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1519: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_ipc_cable_diag':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1786: multiple definition of `aeon_ipc_cable_diag'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1544: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_enable_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1815: multiple definition of `aeon_synce_enable_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1573: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_mode_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1826: multiple definition of `aeon_synce_mode_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1584: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_user_bw':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1837: multiple definition of `aeon_synce_user_bw'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1595: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_synce_slave_output_ctrl_cfg':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1848: multiple definition of `aeon_synce_slave_output_ctrl_cfg'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1606: first defined here
   ld: drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.o: in function `aeon_parallel_det':
   drivers/net/phy/as21xx_1.9.2/as21xx_bbu_api/as21xx_api.c:1859: multiple definition of `aeon_parallel_det'; drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.o:drivers/net/phy/as21xx_1.9.1/as21xx_bbu_api/as21xx_api.c:1617: first defined here

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
