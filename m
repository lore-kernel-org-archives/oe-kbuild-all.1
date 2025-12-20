Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE3D2C15A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241979; cv=none; b=dKJXqzDSWFX/dWwFav8F1urfEUrnjeosccKWHALjLp0P+E6nSw4V0S8ELuPJRDpDlo2sLpbe0dkNEAkyt667xnPzfc5ZLjWEj5zcKUhXo6bV95hv+1Bf3ffSSuACjqJxDuOe5M8Dn+IUMzhss4YZYktMhP6w6+taSxKuPejWWZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241979; c=relaxed/simple;
	bh=7sPc6t6iWZD6rnzhwAUPzB3YUHamikgz+UP13JRRUWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5MGcTDPYsPWwgJYXGyeIavltPCO92dzUwWztDIpbbv7qQpXUpEr8AnYfccQWt9ayqBlAyYSGntNRwYIeEka45mZahS0biWHv2CTZug/aCHpVjujzKivMShQtZWi6GKFeDF+O5oGpDrFNo7jK9Z3iGzHZCKhb0+REVm9iNS14NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckOp/Boc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckOp/Boc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241976; x=1797777976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7sPc6t6iWZD6rnzhwAUPzB3YUHamikgz+UP13JRRUWI=;
  b=ckOp/BockRcHEQiXVj3G0jR11uxNKPikxSAzBUoSxNIr6XScVOf17F1p
   1nmwpxY9MusDjXP06ORySAL6ivI7HGzRo+D0hpFOHeG+f3MHFToSXk4ZD
   Mzw2QLi20gX86OHXGrskh6h8B3F9PHMajOgK7CUXjxh1n/sRtnuPzuzjB
   OdXJeAJcvFBvPY7lNJq2XD0lggU5LFeMHye/xBohRCmylVh/io/WZRja8
   X6yr5Z44r0EAUU/cDjgYyu2oi60wFmFD0m5e5KjI5E5DphYK5TjEO5unF
   szmLBtnWJaZFHqawGb8OXZSjcCuIsRXli70D2wftaTdyyJ9GnoU4W77eK
   Q==;
X-CSE-ConnectionGUID: 4aEB47MJQ0Cvpd9VuKv8Xw==
X-CSE-MsgGUID: k/f7x2bCRQe/PA6Q9p/jqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79294964"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79294964"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:46:11 -0800
X-CSE-ConnectionGUID: rKA0eyNvROi+N7nYlPMiWQ==
X-CSE-MsgGUID: XP1BPapGR+WqgsWHkspzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199986991"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 06:46:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyDf-000000004g9-2DMa;
	Sat, 20 Dec 2025 14:46:07 +0000
Date: Sat, 20 Dec 2025 22:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547]
 drivers/net/ethernet/huawei/hinic/hinic_qp.c:49:26: sparse: sparse: cast to
 restricted __be32
Message-ID: <202512202204.UJ7VQphR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [3547/3547] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: x86_64-randconfig-123-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202204.UJ7VQphR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202204.UJ7VQphR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202204.UJ7VQphR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/hinic/hinic_qp.c:49:26: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:62:28: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:70:18: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_qp.c:85:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] status @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:85:21: sparse:     expected unsigned int [usertype] status
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:85:21: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:96:20: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:107:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:114:23: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:122:23: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:191:33: sparse: sparse: cast to restricted __be32
--
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:102:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:102:24: sparse:     expected unsigned short
   drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:102:24: sparse:     got restricted __be16 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:161:22: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:158:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:158:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:158:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:160:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:160:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:160:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:195:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:195:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:195:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:197:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:197:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:197:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:233:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:233:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:233:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:235:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:235:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:235:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:271:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:271:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:271:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:273:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:273:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:273:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:274:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] csr_write_data_h @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:274:35: sparse:     expected unsigned int [assigned] [usertype] csr_write_data_h
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:274:35: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:275:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] csr_write_data_l @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:275:35: sparse:     expected unsigned int [assigned] [usertype] csr_write_data_l
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:275:35: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:68:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] index @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:68:20: sparse:     expected unsigned int [usertype] index
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:68:20: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:56:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:56:21: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:56:21: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:84:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] index @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:84:24: sparse:     expected unsigned int [usertype] index
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:84:24: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:87:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:87:26: sparse:     expected unsigned int
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:87:26: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:88:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:88:26: sparse:     expected unsigned int
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:88:26: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:56:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:56:21: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/huawei/hinic/hinic_sml_lt.c:56:21: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:28:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:28:23: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:28:23: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:41:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:41:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:41:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:44:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ctr_id @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:44:21: sparse:     expected unsigned int [usertype] ctr_id
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:44:21: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:58:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:58:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:58:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:61:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ctr_id @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:61:21: sparse:     expected unsigned int [usertype] ctr_id
   drivers/net/ethernet/huawei/hinic/hinic_sml_counter.c:61:21: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse:     expected unsigned int val
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:592:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base @@     got void *cfg_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:592:29: sparse:     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:592:29: sparse:     got void *cfg_reg_base
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:593:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base @@     got void *intr_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:593:30: sparse:     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:593:30: sparse:     got void *intr_reg_base
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:596:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *db_base @@     got void *db_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:596:23: sparse:     expected unsigned char [noderef] [usertype] __iomem *db_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:596:23: sparse:     got void *db_base
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
--
>> drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:205:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] *cmd @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:205:51: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:205:51: sparse:     got unsigned char [usertype] *cmd
>> drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:219:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *ack @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:219:44: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:219:44: sparse:     got void *ack
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:270:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] *cmd @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:270:51: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:270:51: sparse:     got unsigned char [usertype] *cmd
>> drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:375:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct pf_dev_info *dev_info @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:375:37: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:375:37: sparse:     got struct pf_dev_info *dev_info
>> drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:394:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct ffm_record_info *ffm_rd @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:394:37: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:394:37: sparse:     got struct ffm_record_info *ffm_rd
>> drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:459:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *buf_in @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:459:54: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:459:54: sparse:     got void *buf_in
>> drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:480:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned short [usertype] *out_size @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:480:44: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:480:44: sparse:     got unsigned short [usertype] *out_size
>> drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:487:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *buf_out @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:487:44: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:487:44: sparse:     got void *buf_out
>> drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:548:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:548:37: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:548:37: sparse:     got void *
--
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:362:6: sparse: sparse: symbol 'hinic_qp_prepare_cmdq_header' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:395:24: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:381:6: sparse: sparse: symbol 'hinic_sq_prepare_ctxt' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:457:24: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:443:6: sparse: sparse: symbol 'hinic_rq_prepare_ctxt' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:897:16: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:967:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] db_info @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:967:23: sparse:     expected unsigned int [addressable] [usertype] db_info
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:967:23: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:971:31: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:971:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:971:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:971:31: sparse:     got unsigned long long [usertype] *
>> drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:1028:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:1028:27: sparse:     expected unsigned short [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_io.c:1028:27: sparse:     got restricted __be16 [usertype]
--
>> drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:629:6: sparse: sparse: symbol 'comm_ppf_to_pf_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:647:5: sparse: sparse: symbol 'hinic_nic_ppf_mbox_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:656:6: sparse: sparse: symbol 'hinic_nic_ppf_to_pf_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.c:665:5: sparse: sparse: symbol 'hinic_register_slave_ppf' was not declared. Should it be static?
--
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:161:31: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:244:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:244:20: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:244:20: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:305:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] desc @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:305:20: sparse:     expected unsigned long long [usertype] desc
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:305:20: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:355:20: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:359:25: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:419:31: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:783:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_cmd_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:783:41: sparse:     expected unsigned long long [usertype] hw_cmd_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:783:41: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:789:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_cmd_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:789:42: sparse:     expected unsigned long long [usertype] hw_cmd_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:789:42: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:816:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_wb_resp_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:816:37: sparse:     expected unsigned long long [usertype] hw_wb_resp_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:816:37: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:894:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] next_cell_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:894:43: sparse:     expected unsigned long long [usertype] next_cell_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:894:43: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:937:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] next_cell_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:937:31: sparse:     expected unsigned long long [usertype] next_cell_paddr
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:937:31: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1001:46: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1001:46: sparse:     expected unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1001:46: sparse:     got restricted gfp_t
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:522:17: sparse: sparse: context imbalance in 'api_cmd' - different lock contexts for basic block
--
>> drivers/net/ethernet/huawei/hinic/hinic_wq.c:206:54: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/huawei/hinic/hinic_wq.c:206:54: sparse:     expected unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_wq.c:206:54: sparse:     got restricted gfp_t
>> drivers/net/ethernet/huawei/hinic/hinic_wq.c:212:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_wq.c:212:24: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_wq.c:212:24: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_wq.c:583:16: sparse: sparse: cast to restricted __be64
--
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:369:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] db_info @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:369:20: sparse:     expected unsigned int [addressable] [usertype] db_info
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:369:20: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:372:28: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:372:28: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:372:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:372:28: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:513:31: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:519:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:519:40: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:519:40: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:533:21: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1124:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1196:25: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1262:37: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1297:31: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1367:26: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1367:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *db_base @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1367:23: sparse:     expected unsigned char [noderef] [usertype] __iomem *db_base
   drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1367:23: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/huawei/hinic/hinic_cmdq.c:1384:5: sparse: sparse: symbol 'hinic_set_cmdq_ctxts' was not declared. Should it be static?
--
>> drivers/net/ethernet/huawei/hinic/hinic_rx.c:149:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_high @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:149:44: sparse:     expected unsigned int [usertype] addr_high
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:149:44: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_rx.c:151:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_low @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:151:43: sparse:     expected unsigned int [usertype] addr_low
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:151:43: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_rx.c:171:6: sparse: sparse: symbol 'hinic_rx_free_buffers' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:533:24: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_rx.c:560:6: sparse: sparse: symbol 'rx_pass_super_cqe' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:633:26: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:641:28: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:642:28: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:662:46: sparse: sparse: cast to restricted __be32
--
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:551:35: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:552:35: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:553:35: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:913:5: sparse: sparse: symbol 'hinic_setup_tx_wqe' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:1100:5: sparse: sparse: symbol 'hinic_stop_sq' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:112:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] hi_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:112:28: sparse:     expected unsigned int [usertype] hi_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:112:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:113:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] lo_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:113:28: sparse:     expected unsigned int [usertype] lo_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:113:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:114:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:114:25: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:114:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:112:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] hi_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:112:28: sparse:     expected unsigned int [usertype] hi_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:112:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:113:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] lo_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:113:28: sparse:     expected unsigned int [usertype] lo_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:113:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:114:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:114:25: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:114:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:112:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] hi_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:112:28: sparse:     expected unsigned int [usertype] hi_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:112:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:113:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] lo_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:113:28: sparse:     expected unsigned int [usertype] lo_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:113:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:114:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:114:25: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:114:25: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:796:5: sparse: sparse: symbol 'set_vf_mbox_random_id' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:872:21: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:846:6: sparse: sparse: symbol 'check_vf_mbox_random_id' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:951:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:951:54: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:951:54: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:974:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:974:58: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:974:58: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1009:6: sparse: sparse: symbol 'dump_mox_reg' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1024:22: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1567:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *data @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1567:25: sparse:     expected unsigned char [usertype] *data
   drivers/net/ethernet/huawei/hinic/hinic_mbox.c:1567:25: sparse:     got unsigned char [noderef] [usertype] __iomem *
--
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:524:29: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:544:37: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:603:24: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:902:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:902:25: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:902:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:920:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] desc @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:920:28: sparse:     expected unsigned int [usertype] desc
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:920:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1435:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:1453:17: sparse: sparse: cast to restricted __be32
--
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:115:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *in_buff @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:115:43: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:115:43: sparse:     got void *in_buff
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:182:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:182:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:182:32: sparse:     got void *out_buf
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:698:5: sparse: sparse: symbol 'get_pfc_info' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:720:5: sparse: sparse: symbol 'set_pfc_control' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:752:5: sparse: sparse: symbol 'set_ets' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:827:5: sparse: sparse: symbol 'get_support_up' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:855:5: sparse: sparse: symbol 'get_support_tc' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:875:5: sparse: sparse: symbol 'get_ets_info' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:893:5: sparse: sparse: symbol 'set_pfc_priority' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1386:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1386:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1386:32: sparse:     got void *out_buf
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1468:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1468:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1468:32: sparse:     got void *out_buf
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1714:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1714:35: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1714:35: sparse:     got void *
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:2068:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:2068:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:2068:32: sparse:     got void *out_buf
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:2157:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:2157:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:2157:32: sparse:     got void *out_buf
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:2294:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:2294:38: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:2294:38: sparse:     got void *
--
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:38:6: sparse: sparse: symbol 'g_rdma_mtts_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:39:6: sparse: sparse: symbol 'g_rdma_qps_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:40:6: sparse: sparse: symbol 'g_rdma_mpts_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:41:6: sparse: sparse: symbol 'g_vfs_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:55:6: sparse: sparse: symbol 'g_test_qpc_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:56:6: sparse: sparse: symbol 'g_test_qpc_resvd_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:57:6: sparse: sparse: symbol 'g_test_pagesize_reorder' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:58:6: sparse: sparse: symbol 'g_test_xid_alloc_mode' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:59:6: sparse: sparse: symbol 'g_test_gpa_check_enable' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:60:6: sparse: sparse: symbol 'g_test_qpc_alloc_mode' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:61:6: sparse: sparse: symbol 'g_test_scqc_alloc_mode' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:62:6: sparse: sparse: symbol 'g_test_max_conn' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:63:6: sparse: sparse: symbol 'g_test_max_cache_conn' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:64:6: sparse: sparse: symbol 'g_test_scqc_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:65:6: sparse: sparse: symbol 'g_test_mpt_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:66:6: sparse: sparse: symbol 'g_test_mpt_resvd' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:67:6: sparse: sparse: symbol 'g_test_scq_resvd' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:68:6: sparse: sparse: symbol 'g_test_hash_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:69:6: sparse: sparse: symbol 'g_test_reorder_num' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1823:5: sparse: sparse: symbol 'cfg_set_func_sf_en' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1866:5: sparse: sparse: symbol 'cfg_get_func_sf_en' was not declared. Should it be static?
--
>> drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:1858:6: sparse: sparse: symbol 'hinic_lp_test' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:2271:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:2271:54: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:2271:54: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:133:1: sparse: sparse: symbol 'g_hinic_chip_list' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:447:6: sparse: sparse: symbol 'hinic_init_syncfw_timer' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:462:6: sparse: sparse: symbol 'hinic_destroy_syncfw_timer' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:505:31: sparse: sparse: symbol 'ver_incompat_table' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:550:5: sparse: sparse: symbol 'hinic_version_cmp' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:744:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] manufacture_id @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:744:29: sparse:     expected unsigned int [usertype] manufacture_id
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:744:29: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:745:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] resp_code @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:745:24: sparse:     expected unsigned short [usertype] resp_code
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:745:24: sparse:     got restricted __be16 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:746:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] reason_code @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:746:26: sparse:     expected unsigned short [usertype] reason_code
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:746:26: sparse:     got restricted __be16 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:1139:6: sparse: sparse: symbol 'hinic_get_ppf_hwdev_by_pdev' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:1448:19: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:1785:57: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:1896:6: sparse: sparse: symbol 'hinic_event_process' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:1950:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *cfg_reg_base @@     got void [noderef] __iomem *cfg_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1950:53: sparse:     expected void *cfg_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1950:53: sparse:     got void [noderef] __iomem *cfg_reg_base
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:2381:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] cfg_reg_base @@     got void [noderef] __iomem *cfg_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2381:32: sparse:     expected void *[assigned] cfg_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2381:32: sparse:     got void [noderef] __iomem *cfg_reg_base
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:2382:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] intr_reg_base @@     got void [noderef] __iomem *intr_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2382:33: sparse:     expected void *[assigned] intr_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2382:33: sparse:     got void [noderef] __iomem *intr_reg_base
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:2383:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] db_base @@     got void [noderef] __iomem *db_base @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2383:27: sparse:     expected void *[assigned] db_base
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2383:27: sparse:     got void [noderef] __iomem *db_base
--
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:98:28: sparse: sparse: symbol 'nic_cmd_support_vf' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:531:5: sparse: sparse: symbol 'hinic_hiovs_set_cpath_vlan' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:557:5: sparse: sparse: symbol 'hinic_hiovs_del_cpath_vlan' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1740:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] group_index @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1740:30: sparse:     expected unsigned int [usertype] group_index
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1740:30: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1743:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1743:23: sparse:     expected unsigned int [usertype] size
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1743:23: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1745:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ctx @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1745:22: sparse:     expected unsigned int [usertype] ctx
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1745:22: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1942:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] group_index @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1942:32: sparse:     expected unsigned int [usertype] group_index
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1942:32: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1949:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1949:31: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1949:31: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1956:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1956:25: sparse:     expected unsigned int [usertype] size
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1956:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1968:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] offset @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1968:27: sparse:     expected unsigned int [usertype] offset
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1968:27: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1969:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1969:25: sparse:     expected unsigned int [usertype] size
   drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:1969:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:2622:5: sparse: sparse: symbol 'nic_pf_mbox_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_nic_cfg.c:3623:5: sparse: sparse: symbol 'hw_speed_convert' was not declared. Should it be static?
--
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:62:6: sparse: sparse: symbol 'hinic_dcb_config_init' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:95:6: sparse: sparse: symbol 'hinic_init_ieee_settings' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:258:6: sparse: sparse: symbol 'hinic_set_prio_tc_map' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1201:4: sparse: sparse: symbol 'hinic_dcbnl_set_all' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1601:5: sparse: sparse: symbol '__set_cos_up_map' was not declared. Should it be static?
--
>> drivers/net/ethernet/huawei/hinic/hinic_main.c:182:5: sparse: sparse: symbol 'hinic_netdev_event' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_main.c:230:1: sparse: sparse: symbol 'g_hinic_netdev_notifiers_mutex' was not declared. Should it be static?
--
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:227:5: sparse: sparse: symbol 'hinic_hw_rx_buf_size' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:583:28: sparse: sparse: symbol 'hw_cmd_support_vf' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1061:5: sparse: sparse: symbol 'hinic_msg_to_mgmt_no_ack' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1153:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1153:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1153:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1175:24: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1978:5: sparse: sparse: symbol 'comm_pf_mbox_handler' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2749:5: sparse: sparse: symbol 'hinic_ppf_ht_gpa_init' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2795:6: sparse: sparse: symbol 'hinic_ppf_ht_gpa_deinit' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4581:5: sparse: sparse: symbol '_set_led_status' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4667:5: sparse: sparse: symbol 'hinic_get_phy_init_status' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4928:23: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4934:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4934:21: sparse:     expected unsigned int [addressable] [assigned] [usertype] val
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4934:21: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4987:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4991:13: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4994:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] udp_port @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4994:18: sparse:     expected unsigned int [usertype] udp_port
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4994:18: sparse:     got restricted __be32 [usertype]

vim +49 drivers/net/ethernet/huawei/hinic/hinic_qp.c

    33	
    34	void hinic_prepare_sq_ctrl(struct hinic_sq_ctrl *ctrl, u32 queue_info,
    35				   int nr_descs, u8 owner)
    36	{
    37		u32 ctrl_size, task_size, bufdesc_size;
    38	
    39		ctrl_size = SIZE_8BYTES(sizeof(struct hinic_sq_ctrl));
    40		task_size = SIZE_8BYTES(sizeof(struct hinic_sq_task));
    41		bufdesc_size = BUF_DESC_SIZE(nr_descs);
    42	
    43		ctrl->ctrl_fmt = SQ_CTRL_SET(bufdesc_size, BUFDESC_SECT_LEN) |
    44				SQ_CTRL_SET(task_size, TASKSECT_LEN)	|
    45				SQ_CTRL_SET(SQ_NORMAL_WQE, DATA_FORMAT)	|
    46				SQ_CTRL_SET(ctrl_size, LEN)		|
    47				SQ_CTRL_SET(owner, OWNER);
    48	
  > 49		ctrl->ctrl_fmt = be32_to_cpu(ctrl->ctrl_fmt);
    50	
    51		ctrl->queue_info = queue_info;
    52		ctrl->queue_info |= SQ_CTRL_QUEUE_INFO_SET(1U, UC);
    53	
    54		if (!SQ_CTRL_QUEUE_INFO_GET(ctrl->queue_info, MSS)) {
    55			ctrl->queue_info |= SQ_CTRL_QUEUE_INFO_SET(TX_MSS_DEFAULT, MSS);
    56		} else if (SQ_CTRL_QUEUE_INFO_GET(ctrl->queue_info, MSS) < TX_MSS_MIN) {
    57			/* mss should not less than 80 */
    58			ctrl->queue_info = SQ_CTRL_QUEUE_INFO_CLEAR(ctrl->queue_info,
    59								    MSS);
    60			ctrl->queue_info |= SQ_CTRL_QUEUE_INFO_SET(TX_MSS_MIN, MSS);
    61		}
    62		ctrl->queue_info = be32_to_cpu(ctrl->queue_info);
    63	}
    64	
    65	int hinic_get_rx_done(struct hinic_rq_cqe *cqe)
    66	{
    67		u32 status;
    68		int rx_done;
    69	
    70		status = be32_to_cpu(cqe->status);
    71	
    72		rx_done = RQ_CQE_STATUS_GET(status, RXDONE);
    73		if (!rx_done)
    74			return 0;
    75	
    76		return 1;
    77	}
    78	
    79	void hinic_clear_rx_done(struct hinic_rq_cqe *cqe, u32 status_old)
    80	{
    81		u32 status;
    82	
    83		status = RQ_CQE_STATUS_CLEAR(status_old, RXDONE);
    84	
  > 85		cqe->status = cpu_to_be32(status);
    86	
    87		/* Make sure Rxdone has been set */
    88		wmb();
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
