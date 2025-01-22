Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8931494A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 03:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737515601; cv=none; b=dVtVk6fy7hNLYNaAKrC3ENy7rC0/0Sz7LiJrKPFF48pIwBVBzDW11n1a2jaqH1Px0MY7dP6u3W4c3J1TKJlJe3mOlEcXbw5u7yNsWVMJSoymKvaek7r71IEalySLFOGlKlxaaitIUAhfOX2oxYOrE3ymFFNsIEFYHYjOKxfQs00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737515601; c=relaxed/simple;
	bh=peekYWbot7qn2hurf3QLohPbudJlbW88JPa6jWphci8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IejAddQznXrfHbM55vpg/NpdKf6+lmtZ7QDDY7wt0TxjT7qw4qanYaAa2wP2H6yAygM46JNLOs2lZGGZfuzE2eANnHKtSQli4bjINIHp5RHmoNWvL/gpgh9RHdoU1DN89awtsiACE9F+E1QRjuX8wD9wt47mj+HPoCyKSUOT+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMoAUbQ5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMoAUbQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737515600; x=1769051600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=peekYWbot7qn2hurf3QLohPbudJlbW88JPa6jWphci8=;
  b=ZMoAUbQ5u1ocay6Zm2YqcI7HExQ9o8MyPQMUo5AzBamC/kQZvL6fibdk
   GYS2qQq7koTT7znohG1MIlZ58OIY9Aryzeopb3sJlB4LFBgNtIbM1MKFi
   P846EJaEXuXzcSiVOFt82ArOvMij1C/b4DS1nitTbY0Uqlwg0ioJcHc/A
   VgYQLDWxIZlOnbyWS48H7VAT3c3eGNyEnIBat0Y96iR4R0erfeDYO4qNQ
   ux9kxx2V59zYtFzS1n3TDt3WlEqGFavXi1m8vwp+mMlPg+aNrRt2qx64X
   KAi0G9JrwDYHr0fcrGGcMUXGumqOJACoyJU8ad3RqghCcRIOgfnUdNyuG
   g==;
X-CSE-ConnectionGUID: mNxK6kcMQ/Saw1qrtBL4nw==
X-CSE-MsgGUID: VBuu2sq3R7Cdg6nBqL6hEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55372860"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="55372860"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 19:13:19 -0800
X-CSE-ConnectionGUID: Uc01EmtvQQWJJYaYoa4oHw==
X-CSE-MsgGUID: c+jqK8pATxS6lBWnlgDtDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="137827621"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jan 2025 19:13:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taRB5-000ZNh-18;
	Wed, 22 Jan 2025 03:13:15 +0000
Date: Wed, 22 Jan 2025 11:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:87:21: sparse: sparse:
 symbol 'g_cdev_set' was not declared. Should it be static?
Message-ID: <202501221109.65gRQ9hH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: 0b6609ecfba8575f870350666ab13e25accc8d14 [1834/1834] Huawei BMA: Adding Huawei BMA driver: host_cdev_drv
config: x86_64-randconfig-121-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221109.65gRQ9hH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221109.65gRQ9hH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221109.65gRQ9hH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:246:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:258:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:264:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:313:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:323:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:349:9: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:87:21: sparse: sparse: symbol 'g_cdev_set' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:151:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:151:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:151:17: sparse:     got unsigned int ( * )( ... )
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:147:30: sparse: sparse: symbol 'g_bma_cdev_fops' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:185:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:196:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:208:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:213:17: sparse: sparse: Using plain integer as NULL pointer

vim +/g_cdev_set +87 drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c

    78	
    79	static int cdev_open(struct inode *inode, struct file *filp);
    80	static int cdev_release(struct inode *inode, struct file *filp);
    81	static unsigned int cdev_poll(struct file *file, poll_table *wait);
    82	static ssize_t cdev_read(struct file *filp, char __user  *data, size_t count,
    83				 loff_t *ppos);
    84	static ssize_t cdev_write(struct file *filp, const char __user *data,
    85				  size_t count, loff_t *ppos);
    86	
  > 87	struct cdev_dev_set g_cdev_set;
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
