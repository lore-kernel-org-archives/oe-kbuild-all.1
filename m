Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE312B8A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707121252; cv=none; b=uPOCFsuGsmT3Yl89DH68ka0JiecnBTuNesTSB/3QVrARHBi0jtj8UtriaXF/uKJn6rxbaAl3e3rD4Nn0uGMpqQ4sw2ckS9UuIOHWf2UH19TIsoAIYnn/r/X0Ug6xhj5AOE/0aZ19CdgXABBu4yVQEO02TxNYo44M43HveHesdLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707121252; c=relaxed/simple;
	bh=JlFn9CJ7RDWWOyiBhDjPA4aDEzAmL2kV8yKA8wswF+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yf90nHQfSGohJJz37/1uy9axegWhx648t3oLJVzK+hs8rckr6DwOGs4EXYyD+YsXKgTE8yICfOhYJsn7r8LzID7y94ZXVkEP30p4JJpi+iyG+ZBdoigAPNLeHEsJiIkxsdeMKRrbRedNE1aWZN6ztGhJpELWYTBlJTkhHV8Kbe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdaY3V9x; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdaY3V9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707121250; x=1738657250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JlFn9CJ7RDWWOyiBhDjPA4aDEzAmL2kV8yKA8wswF+M=;
  b=CdaY3V9xWREmuaKLmVK5BaU3nG7O2a3J7DOxNuBwJIa2yvR6hxrrIE+Y
   6eQGHnVsMCAWgqYerUfL/J563Pb59dfY6a+SFZ4zlrBYqenZe2GsXyxzU
   I+hL6LKmZlFMo3us3tZ2oVSjn3XXH8/Ay1P/tdy0PZRw+zkkUNfLPpl7S
   GvNTaX8lJQg4iU8qMJK/y/lqOtadvLNQSF380egmKlNLnZZVoWH4VRvPJ
   hw+Pmgrfa9Rs8Txi3zWSZ5mfKPuTzHSTo8xTrXu+P1+lN6MUoJzGy+8rI
   r2vyTF5xgjtCuqq+QY6dKFyig9GkImquTwg5RB9r6nv21zMVdMPd5T0iW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="3431926"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="3431926"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 00:20:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5274022"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2024 00:20:17 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWuD9-0000H2-1W;
	Mon, 05 Feb 2024 08:20:15 +0000
Date: Mon, 5 Feb 2024 16:19:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15490/21614]
 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o: warning: objtool:
 missing symbol for section .init.text
Message-ID: <202402051617.IGJJud2F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5bc2c7cbdcbc5c8e5bbe65d3542ec2fccbc61492
commit: ea190d90c609e9909f37afa0d1a19f938ffb95d3 [15490/21614] Huawei BMA: Adding Huawei BMA driver: host_edma_drv
config: x86_64-buildonly-randconfig-001-20240203 (https://download.01.org/0day-ci/archive/20240205/202402051617.IGJJud2F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051617.IGJJud2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051617.IGJJud2F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:67:5: warning: no previous prototype for 'edma_param_get_statics' [-Wmissing-prototypes]
      67 | int edma_param_get_statics(char *buf, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:142:5: warning: no previous prototype for '__atu_config_H' [-Wmissing-prototypes]
     142 | s32 __atu_config_H(struct pci_dev *pdev, unsigned int region,
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:328:5: warning: no previous prototype for 'pme_pci_enable_msi' [-Wmissing-prototypes]
     328 | int pme_pci_enable_msi(struct pci_dev *pdev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:354:5: warning: no previous prototype for 'pci_device_init' [-Wmissing-prototypes]
     354 | int pci_device_init(struct pci_dev *pdev, struct bma_pci_dev_s *bma_pci_dev)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:383:5: warning: no previous prototype for 'pci_device_config' [-Wmissing-prototypes]
     383 | int pci_device_config(struct pci_dev *pdev)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:505:12: warning: no previous prototype for 'bma_pci_init' [-Wmissing-prototypes]
     505 | int __init bma_pci_init(void)
         |            ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:518:13: warning: no previous prototype for 'bma_pci_cleanup' [-Wmissing-prototypes]
     518 | void __exit bma_pci_cleanup(void)
         |             ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
