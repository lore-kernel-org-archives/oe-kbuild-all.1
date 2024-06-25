Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4678BFF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 00:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719275200; cv=none; b=X5dM1oSjscUsN4NxDXe7/oyxIuZRK0aN3UoBoMtUckIV+YdBNAU5T7Nx3vcoSU9511BykZRMpTQqnWGBGq1QEzG2ORyxS0/EbRKniUyt4kBvS6PhBUDB9NgyOQLpu2f6s+AzLu2IVgpJVyYzTDj0QqWrYvIQ//EeTYIdaJ8v/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719275200; c=relaxed/simple;
	bh=TPcouhR3AQn4HPMyULB62+z/TgauBoDEXDNkxKWQFPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D9db6eYJGsxVJn8bA3VBF1SOxEWIroWaEgV8ixm4TaZHpY4H/6NpoL/OjVY/Pnm8W9EGKToVdA1gH9mZlE8kJlF+jzl5RZUnckQBeRSAJiZP7D2FtR9ODAOoNQQp/f0Udqhs4uuuydWBy64FEc50zLGPy0VT0dnAKWhCUYNeyvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENhXIAo8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENhXIAo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719275199; x=1750811199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPcouhR3AQn4HPMyULB62+z/TgauBoDEXDNkxKWQFPw=;
  b=ENhXIAo8QXYYo5AIeXhyq+RAFVpJ5ROIXw1M77MFHzxcsXMR4Ixu2JG3
   MWdOiVDbsmyDs1jfBPMXVqKmY2SQyo3ZKN6l/XiqjUORcV2fdMwc9lSBT
   NSmNaZ3rS0Zbmun1FWkklAkaLK2ZdW+kUZtHxzZz3ANhWNzkA+Tci+cwV
   qgy+VJyoBd3Yb/8825yb1rb7+/YVaXU9qicfhW3LVItdB7QwSdqW5ZHaM
   kUGol1AGo9dEC06/u/Hin1mLyYuR/lw4c2S+UIn0bDkIKkGajkHlWMOhq
   xuAuxaDfIac2ge9JRENYDZpqNBrKzQPjd3alaahA7Z0b7SpSGpanZJ39f
   g==;
X-CSE-ConnectionGUID: 00JlzJ5GSfmM0WZrby2sJw==
X-CSE-MsgGUID: TEfUHB2NSKm+Nod2SBCLhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20041752"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="20041752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 17:26:36 -0700
X-CSE-ConnectionGUID: zFoy3tIPSxSwOtkNzjiRsQ==
X-CSE-MsgGUID: tvvUl7VRT1WVrcKaUcwoDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="66689027"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jun 2024 17:26:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLu12-000Dqy-0A;
	Tue, 25 Jun 2024 00:26:32 +0000
Date: Tue, 25 Jun 2024 08:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: Teddy Engel <engel.teddy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 34/59]
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c:31:6: error: conflicting types
 for 'rtl92e_check_adapter'; have 'bool(struct pci_dev *, struct net_device
 *)' {aka '_Bool(struct pci_dev *, struct net_device *)'}
Message-ID: <202406250858.L8rJMHQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   921190437a4827667cceef10202b2150571ebe5c
commit: 7dff0b27d9c842f88149bf611cbc0b59be1dcd3c [34/59] staging: rtl8192e: Remove unnecessary pre-declaration of struct net_device
config: arm64-randconfig-001-20240625 (https://download.01.org/0day-ci/archive/20240625/202406250858.L8rJMHQm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250858.L8rJMHQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250858.L8rJMHQm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/staging/rtl8192e/rtl8192e/rtl_pci.c:10:
>> drivers/staging/rtl8192e/rtl8192e/rtl_pci.h:16:56: warning: 'struct net_device' declared inside parameter list will not be visible outside of this definition or declaration
      16 | bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev);
         |                                                        ^~~~~~~~~~
>> drivers/staging/rtl8192e/rtl8192e/rtl_pci.c:31:6: error: conflicting types for 'rtl92e_check_adapter'; have 'bool(struct pci_dev *, struct net_device *)' {aka '_Bool(struct pci_dev *, struct net_device *)'}
      31 | bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/rtl8192e/rtl8192e/rtl_pci.h:16:6: note: previous declaration of 'rtl92e_check_adapter' with type 'bool(struct pci_dev *, struct net_device *)' {aka '_Bool(struct pci_dev *, struct net_device *)'}
      16 | bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev);
         |      ^~~~~~~~~~~~~~~~~~~~


vim +31 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c

94a799425eee82 drivers/staging/rtl8192e/rtl_pci.c          Larry Finger       2011-08-23  30  
e250592ed93a12 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c Mateusz Kulikowski 2015-07-19 @31  bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)

:::::: The code at line 31 was first introduced by commit
:::::: e250592ed93a12eecc42ed590f5a8245a20ab994 staging: rtl8192e: Rename rtl8192_pci_findadapter

:::::: TO: Mateusz Kulikowski <mateusz.kulikowski@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
