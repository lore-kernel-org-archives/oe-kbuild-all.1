Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68927482E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715760168; cv=none; b=QZXH3Zay8TtVJEkVdEaUiUV5c8hDEsXkc2Lusiw4G2LGNSITfOpfePCjbb8Nv7oaOhN/3VNixU9Pu+RZ6j1A1jUu5buinRIMLYO5n6N0UPyufDHuXcsctZn732zPd3cxDNzJzbW1ZlgOhLGs4AGJeI4bcMy5nreX+QB45Btg0zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715760168; c=relaxed/simple;
	bh=+2y16YllFEbuTlxVpBtd6ND7KTuiSQc02W5vPBpNGac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLWuRRud4ycB4hX8nnr5frkRtdTbVq5FzbRq8OsgovtFb2d3V7r41Cc9n6WxDlnCsUWcChyNzoQdvZ5AN/gqSKCc6jiIiBEhUnEzVC11MIvGti4Iz4tL+uL1eDSZHdyfH1ozC7U4FKpgvQCtL13bmZ/CbB7tQcoFyQBEKCuU8Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E1+RfO2X; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1+RfO2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715760166; x=1747296166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2y16YllFEbuTlxVpBtd6ND7KTuiSQc02W5vPBpNGac=;
  b=E1+RfO2X7qeOARduB/lWlI6R/ffnf5Gq0PdZQjaPrc8QHxyAj2H6dxXJ
   esqMSHz+UaQfyMLQEaqFClrOf5wHFmiHA63+Gj8ZFvkGSVejXCul5ZrJq
   M+rnxlqheIv3uZ+fbZqWXXJSg3Sm/dcc3q5jz0TygKDTsUUeBMhjJOZYM
   rRzK6vnEzNWEICit4c+zvqQSp8N/+SjS8dRb83lxleZUzM0ubQeEzO6vM
   Bvc7qsVQYdUrPRAbyB6XBK2OmVezvHSK1a/qodIVAruDE9LJwgeHRv+JK
   Vu2MhmqtHxXlpZ4xBfNh2pDxxpV+/KjAqzW/mwY7dGDAg6H4TBHtqA9Vi
   A==;
X-CSE-ConnectionGUID: +HW8L+S2Sl6HGozyZdGPlw==
X-CSE-MsgGUID: alMg2MaWR1GPuIVTHsSWhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23191757"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="23191757"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 01:02:45 -0700
X-CSE-ConnectionGUID: fmleiT/nSVeyAwzEGq6YJQ==
X-CSE-MsgGUID: 4HL5MP9iRFCRD5Tw63kKjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="30973398"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2024 01:02:36 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s79ao-000Cbv-0e;
	Wed, 15 May 2024 08:02:30 +0000
Date: Wed, 15 May 2024 16:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3971/9610]
 drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202405151557.G5fbOVUN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c6c7d83d2bc788cd9aef8983afa59eae25e148e
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [3971/9610] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: arm64-randconfig-r132-20240515 (https://download.01.org/0day-ci/archive/20240515/202405151557.G5fbOVUN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240515/202405151557.G5fbOVUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151557.G5fbOVUN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:592:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base @@     got void *cfg_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:592:29: sparse:     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:592:29: sparse:     got void *cfg_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:593:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base @@     got void *intr_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:593:30: sparse:     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:593:30: sparse:     got void *intr_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:596:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *db_base @@     got void *db_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:596:23: sparse:     expected unsigned char [noderef] [usertype] __iomem *db_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:596:23: sparse:     got void *db_base
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:597:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *dwqe_mapping @@     got void *dwqe_mapping @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:597:28: sparse:     expected void [noderef] __iomem *dwqe_mapping
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:597:28: sparse:     got void *dwqe_mapping
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:64: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:679:64: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:984:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:993:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false

vim +46 drivers/net/ethernet/huawei/hinic/hinic_hwif.c

    42	
    43	/* For UEFI driver, this function can only write BAR0 */
    44	void hinic_hwif_write_reg(struct hinic_hwif *hwif, u32 reg, u32 val)
    45	{
  > 46		writel(cpu_to_be32(val), hwif->cfg_regs_base + reg);
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
