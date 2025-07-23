Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1F2586EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261207; cv=none; b=X1QuslSjB6VxOt5AxchK7lsGRxAwZOLlms/2nsyI7cj0aXu/3SmmhbsBvOCInRXh4RyCuw9IUqA9gl88ZYhpMj82yG6WwrsPZPzp4w/SnZeGP1xpVti6WAOTZY8oWZ58mSCS/XL/K12BmKFdKI33ekJrvZl98G63Yk9OcHVSwCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261207; c=relaxed/simple;
	bh=lhYm156lmOyj5xzfozaI/vD9iiPbUqQa3cTUBHqzwq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jiNXACVVW+hmRI3VpQIWblziMSNPlyO23HzkupTR80eYrlahtsFmm1zf1aRYtOj/qZO74zr0E2w1fXUUE5e+6SOCEazcwFjfJezi9ocBqD8dRZzWcSW1SRhCTgEA2iwuun5oNXJJuGix9eZHNkgKuFEI75x7kGKFUFD2DmGm83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdyUcIeM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdyUcIeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753261205; x=1784797205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lhYm156lmOyj5xzfozaI/vD9iiPbUqQa3cTUBHqzwq8=;
  b=NdyUcIeMGV9tru4DmlhwoLhphi7HyyO9FWXF5xK85U/C3P4Ss3fLH1FM
   4/jtTIrAMp+n/tpLQUNhQRB57JkNHv+7idUXCF3Cvs07ALjYpGXvx6dE/
   3X3Wbm0BAX2o91pgHnWurWe0xkXTd07Z6OzFDKH+RUdtML8Lpnj6CQ7pq
   xnUMrRTgOuV9pFKstbF/SnEyVptN6HT8CJ+g2qYNhubUP5omvIAmFI7yo
   zGQp/WfULMRixKYXyzzXlyCsS3dc7L0Ua42kPeO8Zkc0fNn4jPp3xEP+q
   qBkJVN1sG1y5fW/eQ2+bH53KKKxjSvqUTiSB+xP2kR4lYV+F2VLDdNnLI
   w==;
X-CSE-ConnectionGUID: MZWG4Me3TSyAxOvENQhV+A==
X-CSE-MsgGUID: +IcZIaIBRfms/mxQQBINFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55478429"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55478429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 02:00:05 -0700
X-CSE-ConnectionGUID: VB9sNJ5SQ+G4/X4XOv6yxw==
X-CSE-MsgGUID: K0H5SoQ0RBioRK4wGXU3DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159051639"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jul 2025 02:00:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueVKU-000J9T-0X;
	Wed, 23 Jul 2025 09:00:02 +0000
Date: Wed, 23 Jul 2025 16:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 12/14] drivers/nfc/s3fwrn5/uart.c:99:46:
 error: 'dev' undeclared; did you mean 'cdev'?
Message-ID: <202507231635.XX4uBJDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   ec6a6b690caeb0e6a10757890c166bc226b799f5
commit: 58d9969b0cd7daa32f3f3d47fb4484a2b56ccf56 [12/14] nfc: s3fwrn5: convert to gpio descriptors
config: x86_64-buildonly-randconfig-001-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231635.XX4uBJDz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231635.XX4uBJDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231635.XX4uBJDz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
>> drivers/nfc/s3fwrn5/uart.c:99:46: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
      99 |         phy->common.gpio_en = devm_gpiod_get(dev, "en-gpios", GPIOD_OUT_HIGH);
         |                                              ^~~
         |                                              cdev
   drivers/nfc/s3fwrn5/uart.c:99:46: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nfc/s3fwrn5/uart.c:104:45: error: expected ')' before 'return'
     104 |         if (IS_ERR(phy->common.gpio_fw_wake)
         |            ~                                ^
         |                                             )
     105 |                 return PTR_ERR(phy->common.gpio_fw_wake);
         |                 ~~~~~~                       
>> drivers/nfc/s3fwrn5/uart.c:108:1: error: expected expression before '}' token
     108 | }
         | ^
>> drivers/nfc/s3fwrn5/uart.c:108:1: warning: control reaches end of non-void function [-Wreturn-type]
     108 | }
         | ^


vim +99 drivers/nfc/s3fwrn5/uart.c

    90	
    91	static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
    92	{
    93		struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
    94		struct device_node *np = serdev->dev.of_node;
    95	
    96		if (!np)
    97			return -ENODEV;
    98	
  > 99		phy->common.gpio_en = devm_gpiod_get(dev, "en-gpios", GPIOD_OUT_HIGH);
   100		if (IS_ERR(phy->common.gpio_en))
   101			return PTR_ERR(phy->common.gpio_en);
   102	
   103		phy->common.gpio_fw_wake = devm_gpiod_get(dev, "wake-gpios", GPIOD_OUT_LOW);
 > 104		if (IS_ERR(phy->common.gpio_fw_wake)
   105			return PTR_ERR(phy->common.gpio_fw_wake);
   106	
   107		return 0;
 > 108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
