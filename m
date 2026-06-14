Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1953770B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 06:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781418813; cv=none; b=qISIMymCWfeKjhOBnTRy1+yUK4reRwg5M9IA1Anarqa1ySg7kAfd2kNJ8RJN4mgJuWcqOO4bEjOvPGmjK/b9KF4IIq51XBWfs5IIJ0souJpS2ZzPiH9WATmma7SzCXcM+54ly5lPyVKzahOfOS46UsWynIRO6+eZcoPc27r+in8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781418813; c=relaxed/simple;
	bh=JXm7b914IBQ1WDeRTh5JC66eo+kA+7rFUxuAnjPIBRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AE70OuRmOqAgSYp2zxjsUKtNGzLqCJzqPO6lI3i5xAc/XkjkKIKklnK/zRny1EWOGcZqdOfGma28NPOI9UvWVfxeHQwVQ/Yo6X2PAFT0pdZl8S6v4hIeIhAgxdJwCMY6JSp9VwZAr1NMIFHotMo8DpTv4aBGrBUHqeeiQ6D9lbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ls6a+pAD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ls6a+pAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781418812; x=1812954812;
  h=date:from:to:cc:subject:message-id;
  bh=JXm7b914IBQ1WDeRTh5JC66eo+kA+7rFUxuAnjPIBRw=;
  b=Ls6a+pAD3AANjvLB/RCHuDT1sS7Njrw+T87kucRYzKxxxhiM8LB2c9n9
   1P3OINdjTyLYNPmzY8Gs1nc5Omz95fi0zMamUC6TzUvrVthTMRXDksqdk
   y2G4YnU4lLV0+AhyqDBPbi8VUxUVt7qi+Ev9v5pOMl2nJG566//uu3jH+
   r8/UtlQSS/IccYSyWM7KDDzYyQySSWjxnMjs0GecAcY7UZImCHzNm/7WV
   axkWWz2cbVuoR0uzdaBzTR19o6ezMmt8wnZ2TLBx8vNjU0hF1pFshm1MK
   S+kIo9XUzWyQ53A8GQ/lPUbMciRwuqVi96iF2iaPqLZe+YFY38adSp28Q
   g==;
X-CSE-ConnectionGUID: KyuravmxQB277Lcyxqe+VQ==
X-CSE-MsgGUID: Um21HJY4RbiaH7OtPinnNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="92514446"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="92514446"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 23:33:31 -0700
X-CSE-ConnectionGUID: oWqW8beFStW4V6a0Cj0Ntw==
X-CSE-MsgGUID: FjkjObKBQaCOmFev+8K7AQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2026 23:33:30 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYePP-000000004e9-2wBT;
	Sun, 14 Jun 2026 06:33:27 +0000
Date: Sun, 14 Jun 2026 08:32:44 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/17] htmldocs: Warning:
 drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't
 exist:
 file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
Message-ID: <202606140847.6RM5MLes-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   32202562935a0f31664867f324729f0e461080ca
commit: c7c64c09fe63f588a04810463284fca7e4961929 [0/17] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260614/202606140847.6RM5MLes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140847.6RM5MLes-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
