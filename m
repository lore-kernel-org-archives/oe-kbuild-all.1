Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A230F523
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784383709; cv=none; b=sCPTywq0lnIUTh9Ro40jth4n0Y+r0Pfe1JFcyDbe7ue/nbI3ycZIOs/wBxShBQ0XddxDKGXXNM6v0i4Ws0g2d9Ak3G5eMdcMR2em+Furl9if+uvzpqGsc03hwoKxlldBCucfRBk+QIgw3qbM0MvMeFHm1B1QdbAJMbvvUisivAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784383709; c=relaxed/simple;
	bh=jPCI3qzkv08MfBNilTO0JknLK/X0BzxXvqyLxs1KpP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m3s+bPCkRy8AYSv65zPsTQSyyinP8z4AnFy8n/54ntztUg6THART9W6ZpqZvD+fDifJacoDz0Oe+ob5ldocE/IkuMBEzX9CfcP2D2vyytbwawH+f5p1peQ2354gJCYJqWVsey6+RWelh1lfjOXGdQzmv6iiNdU9oTJy8eCwFWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgxPHoAA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgxPHoAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784383707; x=1815919707;
  h=date:from:to:cc:subject:message-id;
  bh=jPCI3qzkv08MfBNilTO0JknLK/X0BzxXvqyLxs1KpP4=;
  b=UgxPHoAAIcQTRBIZcoqpjQfxreIifwM016PORr92thyY4SESQgQgTrZ1
   qfZQ7O281Hxx2gkFX7Tdr65dfuI9k6OOJPIdrkUI5c1ypLw3mPVP0kvRf
   yXODDSUu3Fwdb4U0ndKi76pUyBAn0DkWmZ4VS4QudZ9PSWQA529MRSmuJ
   uOPw3sMhWcJABqxRMbtW6u1oE6KkDAldEDJgnAhYpWL0o5Yo/ksJ69Y9H
   V0lC3BobNsVKQ/xe3Jvm94GJF3q2SFYGzfP+KeDRy+SCND0lgiWQi3pzz
   P5R8Ee47UkThQ9kJ0YKW71FeXRZzF6oujdZzbtFDlTXZS4/e+Bg+MD1pD
   Q==;
X-CSE-ConnectionGUID: HZ/mWcEITcej3a/FCnhMpg==
X-CSE-MsgGUID: 9LdlqeOtRVSEflV8gfGpxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="88851812"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="88851812"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 07:08:25 -0700
X-CSE-ConnectionGUID: giDU0WHgQWyZoHDcvNp5DQ==
X-CSE-MsgGUID: nha8buVvTYK9NDCyRn2qXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="257667120"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Jul 2026 07:08:25 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl5iI-000000005q1-103V;
	Sat, 18 Jul 2026 14:08:22 +0000
Date: Sat, 18 Jul 2026 16:07:27 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/105] htmldocs: Warning:
 drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't
 exist:
 file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
Message-ID: <202607181638.yhMkMW7H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi nebula_matrix_driver,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   4f8a6ab0f5f0b5f85efcae83321abf317723182d
commit: c7c64c09fe63f588a04810463284fca7e4961929 [0/105] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260718/202607181638.yhMkMW7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181638.yhMkMW7H-lkp@intel.com/

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
