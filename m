Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE06A8D2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731150949; cv=none; b=AMkBEL0heYIxyN1Bl0XeJOvv1PWjJnr1Qa/uXPleu4ORUjyBfBx0QzqZqKyMxFnbRMfLGDPkK7OBH5/49iAwaWQQtLPSMA63tubc9lBatRqvmMnJT80q7KRkZteF9v6yG9GPI55QdzpMrpsqs1waNJqmP7dXnCkHtyVo2MsX2Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731150949; c=relaxed/simple;
	bh=2P9U5q2qAhv5MpksIiWtB2yfyneNO1jMhvvr3J31zTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZncGo+8Z71tTMvIStf7b9R5n8dUsFYD0z0OLUq8FanI2Dk9ubqjQ3y0cBFLJtxskDYmbVHs9nCkbGzNmDWQSXsJmXDuMk5p9yS4m2jhcyquU1fVglWLpx/yhNve53dUK1cncaq9Q7Qs2SSspySGZLV4vTtSosdxAGpnYN9cYuJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGd5+EgH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGd5+EgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731150946; x=1762686946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2P9U5q2qAhv5MpksIiWtB2yfyneNO1jMhvvr3J31zTk=;
  b=RGd5+EgHeVs0FWuRm14TsMqwLXwXG3zfe6lCIQ9Cd/8cudW4HcuZpWQn
   dk4AlbcigYm3E8dzbJggomzrgbZpnsLnk+J/tSjN5uM1Q/9Vzbj/YEirs
   qU1nckd+Xtu+mMW0VUjH9f6aJT3vGy0OoAA/93+qCKCjyCcAnIWDYiQwQ
   DZXw9ArsiifHCeXldhpR4w4sr2cM20cXNo07oQx5fNJKebhEBq2ja1KW+
   g8KAVQxmPTEWsCj9NfVe7rCaDoemDSctWVnmdqJnW96mezCsZzSuW1Q5Q
   /7OUsoDryaD89ftHmwgTdQFAtXSVIUhSS+ifA3PfHY/Ar8Q0ZpaitfcQR
   w==;
X-CSE-ConnectionGUID: xGMajwS7R8W6nuxphi6mXw==
X-CSE-MsgGUID: hQbIY73rT2GJjBbSUr8YHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31184334"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31184334"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 03:15:46 -0800
X-CSE-ConnectionGUID: tqhe33JsSK6L6NwrhCrc4A==
X-CSE-MsgGUID: 2YD2wXBbS4mDsi8Qd+ZLbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="90536775"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Nov 2024 03:15:43 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9jRM-000sJ4-0j;
	Sat, 09 Nov 2024 11:15:40 +0000
Date: Sat, 9 Nov 2024 19:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/net/ethernet/pensando/ionic/ionic_dev.h:25:1: sparse: sparse: static
 assertion failed: "sizeof(union ionic_dev_regs) == 4096"
Message-ID: <202411091911.niTmiL5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: fbfb8031533c924c2f3fef73759b4cf75a0e6aa7 [1/1] ionic: Add hardware init and device commands
config: x86_64-randconfig-123-20241028 (https://download.01.org/0day-ci/archive/20241109/202411091911.niTmiL5j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091911.niTmiL5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091911.niTmiL5j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/pensando/ionic/ionic_main.c: note: in included file (through drivers/net/ethernet/pensando/ionic/ionic.h):
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:25:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_regs) == 4096"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:27:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_cmd_regs) == 2048"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:43:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:44:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:45:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:55:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_port_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:65:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:66:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:67:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:69:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_q_init_cmd) == 64"
--
   drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c: note: in included file (through drivers/net/ethernet/pensando/ionic/ionic.h):
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:25:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_regs) == 4096"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:27:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_cmd_regs) == 2048"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:43:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:44:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:45:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:55:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_port_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:65:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:66:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:67:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:69:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_q_init_cmd) == 64"
--
   drivers/net/ethernet/pensando/ionic/ionic_devlink.c: note: in included file (through drivers/net/ethernet/pensando/ionic/ionic.h):
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:25:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_regs) == 4096"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:27:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_cmd_regs) == 2048"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:43:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:44:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:45:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:55:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_port_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:65:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:66:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:67:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:69:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_q_init_cmd) == 64"
--
   drivers/net/ethernet/pensando/ionic/ionic_dev.c: note: in included file (through drivers/net/ethernet/pensando/ionic/ionic.h):
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:25:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_regs) == 4096"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:27:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_cmd_regs) == 2048"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:43:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:44:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:45:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:55:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_port_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:65:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:66:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:67:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:69:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_q_init_cmd) == 64"
--
   drivers/net/ethernet/pensando/ionic/ionic_debugfs.c: note: in included file (through drivers/net/ethernet/pensando/ionic/ionic.h):
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:25:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_regs) == 4096"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:27:1: sparse: sparse: static assertion failed: "sizeof(union ionic_dev_cmd_regs) == 2048"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:43:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:44:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:45:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_dev_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:55:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_port_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:65:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_getattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:66:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_cmd) == 64"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:67:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_lif_setattr_comp) == 16"
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:69:1: sparse: sparse: static assertion failed: "sizeof(struct ionic_q_init_cmd) == 64"

vim +25 drivers/net/ethernet/pensando/ionic/ionic_dev.h

    22	
    23	static_assert(sizeof(struct ionic_doorbell) == 8);
    24	static_assert(sizeof(struct ionic_intr_status) == 8);
  > 25	static_assert(sizeof(union ionic_dev_regs) == 4096);
    26	static_assert(sizeof(union ionic_dev_info_regs) == 2048);
  > 27	static_assert(sizeof(union ionic_dev_cmd_regs) == 2048);
    28	static_assert(sizeof(struct ionic_lif_stats) == 1024);
    29	
    30	static_assert(sizeof(struct ionic_admin_cmd) == 64);
    31	static_assert(sizeof(struct ionic_admin_comp) == 16);
    32	static_assert(sizeof(struct ionic_nop_cmd) == 64);
    33	static_assert(sizeof(struct ionic_nop_comp) == 16);
    34	
    35	/* Device commands */
    36	static_assert(sizeof(struct ionic_dev_identify_cmd) == 64);
    37	static_assert(sizeof(struct ionic_dev_identify_comp) == 16);
    38	static_assert(sizeof(struct ionic_dev_init_cmd) == 64);
    39	static_assert(sizeof(struct ionic_dev_init_comp) == 16);
    40	static_assert(sizeof(struct ionic_dev_reset_cmd) == 64);
    41	static_assert(sizeof(struct ionic_dev_reset_comp) == 16);
    42	static_assert(sizeof(struct ionic_dev_getattr_cmd) == 64);
  > 43	static_assert(sizeof(struct ionic_dev_getattr_comp) == 16);
  > 44	static_assert(sizeof(struct ionic_dev_setattr_cmd) == 64);
  > 45	static_assert(sizeof(struct ionic_dev_setattr_comp) == 16);
    46	
    47	/* Port commands */
    48	static_assert(sizeof(struct ionic_port_identify_cmd) == 64);
    49	static_assert(sizeof(struct ionic_port_identify_comp) == 16);
    50	static_assert(sizeof(struct ionic_port_init_cmd) == 64);
    51	static_assert(sizeof(struct ionic_port_init_comp) == 16);
    52	static_assert(sizeof(struct ionic_port_reset_cmd) == 64);
    53	static_assert(sizeof(struct ionic_port_reset_comp) == 16);
    54	static_assert(sizeof(struct ionic_port_getattr_cmd) == 64);
  > 55	static_assert(sizeof(struct ionic_port_getattr_comp) == 16);
    56	static_assert(sizeof(struct ionic_port_setattr_cmd) == 64);
    57	static_assert(sizeof(struct ionic_port_setattr_comp) == 16);
    58	
    59	/* LIF commands */
    60	static_assert(sizeof(struct ionic_lif_init_cmd) == 64);
    61	static_assert(sizeof(struct ionic_lif_init_comp) == 16);
    62	static_assert(sizeof(struct ionic_lif_reset_cmd) == 64);
    63	static_assert(sizeof(ionic_lif_reset_comp) == 16);
    64	static_assert(sizeof(struct ionic_lif_getattr_cmd) == 64);
  > 65	static_assert(sizeof(struct ionic_lif_getattr_comp) == 16);
  > 66	static_assert(sizeof(struct ionic_lif_setattr_cmd) == 64);
  > 67	static_assert(sizeof(struct ionic_lif_setattr_comp) == 16);
    68	
  > 69	static_assert(sizeof(struct ionic_q_init_cmd) == 64);
    70	static_assert(sizeof(struct ionic_q_init_comp) == 16);
    71	static_assert(sizeof(struct ionic_q_control_cmd) == 64);
    72	static_assert(sizeof(ionic_q_control_comp) == 16);
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
