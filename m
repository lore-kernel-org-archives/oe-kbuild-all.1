Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900E19CD1B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727105257; cv=none; b=jPuvfluVs31ITRCGTQKgK7RFcv6JuS93V5SI/XDR29DN8EyUeHyjznAzomcm4SpeybtiVUmYv78giTfKNjJGK9S3keVygphrH3/B/777paKvcyYo80m1iexEf2fVVR2y3beITUDQQv8T84uZ9EAcf9Nh/Mp1JBO23OA+jYdp/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727105257; c=relaxed/simple;
	bh=If4cOtf68oXmojws/mU/2bq+xWWra5iuKuFDg7ScKaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BygqNu4rqqd9wwmjghYXW69EkmVqm2cliusqskmhehZG9gP/asXN9TAE4cvjETjrgnpzZIMtOUBODiD8YLXF5vR2fJRHaUWgTg/m53MJ5hg0n3vqhtULJtijlqN3KtWFuc6nH1jtKRxeSldCb/q1GGzZAFzCID620a0xSvGYOyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Po2tkGA6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Po2tkGA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727105255; x=1758641255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=If4cOtf68oXmojws/mU/2bq+xWWra5iuKuFDg7ScKaA=;
  b=Po2tkGA6EB+rvNsOeBO5jN7lrc8WfHKwitV5e9OYhXrX0AjrYBjMkb2r
   utKJ36T7bS3FBkcZokuXHSmUbb1J8Wec4zPKjojUmcSP6azNsOnSYb8jR
   Fh+1RN6W2XGhsalMl/FCAJWdL8G5bUAMvXOpKuDVTDhol8A35QSUPZoxK
   IaG6vQp99doLfwVUnmucBFv0ZXq5AkdMfF+Oli2XS1EqLfDbVSRaeo8IQ
   vPcsU7WueyZVnHtT9596Rsn0P5eLSNkbYUcRvG1hjbqU6c5KTzK23YRcV
   KUidPGcauMlWwZarJVUCRHS6suc/hYrmnH+J/ty2kW/U/frl7JYSTReSV
   A==;
X-CSE-ConnectionGUID: Ste2Q7IjQlGiIy2EUPhxGg==
X-CSE-MsgGUID: u32G9L+7SN6AIA9smiQQyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29947011"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="29947011"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 08:27:32 -0700
X-CSE-ConnectionGUID: B+pBW9z3TsS2UdBpfM4xrA==
X-CSE-MsgGUID: c2CpntMZRJmfVm/lixOjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="71371806"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2024 08:27:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sskyF-000HJq-1Z;
	Mon, 23 Sep 2024 15:27:27 +0000
Date: Mon, 23 Sep 2024 23:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2181/2441]
 drivers/usb/host/xhci-plat.c:476:40: error: 'xhci_plat_phytium_pe220x'
 undeclared here (not in a function)
Message-ID: <202409232311.wQ713GLR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 666b19bb8aeab2412d1cc496ef9fe000827cff86 [2181/2441] usb: xhci: xhci-plat: Support for Phytium Pe220x Add XHCI_RESET_ON_RESUME quirk for Phytium Pe220x Phytium Pe220x xHCI host controller does not have suspend/resume support. Therefore, use of the XHCI_RESET_ON_RESUME quirk is mandatory in order to avoid failures after resume.
config: x86_64-buildonly-randconfig-006-20240923 (https://download.01.org/0day-ci/archive/20240923/202409232311.wQ713GLR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409232311.wQ713GLR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409232311.wQ713GLR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/host/xhci-plat.c:476:40: error: 'xhci_plat_phytium_pe220x' undeclared here (not in a function)
     476 |         { "PHYT0039", (kernel_ulong_t)&xhci_plat_phytium_pe220x },
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]


vim +/xhci_plat_phytium_pe220x +476 drivers/usb/host/xhci-plat.c

   472	
   473	static const struct acpi_device_id usb_xhci_acpi_match[] = {
   474		/* XHCI-compliant USB Controller */
   475		{ "PNP0D10", },
 > 476		{ "PHYT0039", (kernel_ulong_t)&xhci_plat_phytium_pe220x },
   477		{ }
   478	};
   479	MODULE_DEVICE_TABLE(acpi, usb_xhci_acpi_match);
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
