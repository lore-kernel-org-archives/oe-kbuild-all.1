Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ACC86AD6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708547414; cv=none; b=rMItWB/OaI1Po8kCSAjo3ihSW/ADcXlZYb7cnngb/nD6MFeQ7Muy5M2WELBIEVtQEeQ4/3ZJPKTMlOnsUZQkIF3WFPvfQy0A8IeFAUgeFGbJE/xs+CxpFf7lY4TqYa5SUJvwlhwWKGSojCOw/+5fgRwoV1Xk80tBd5RMouSAB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708547414; c=relaxed/simple;
	bh=EW8yqopBBLiUom33uR5+h2b8ve+J9TjBE9nhN7aXAsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JH8E8PAV+p9wN1s476MSIk2YGnlB9cc79BodtTqtQVWmbXqVzBE+rJaT4qIHF1GMDq7UF/6szLBcUow7fYoiHhgL55A/jDLMmi/r8kSx2NKgvtmhQ3D/GUWRdy73abFf4lS76cwImf5ADSGrtKPAc4L152J9ZGY2aOwYtQcTUUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrbyaeZX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrbyaeZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708547412; x=1740083412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EW8yqopBBLiUom33uR5+h2b8ve+J9TjBE9nhN7aXAsU=;
  b=lrbyaeZXJ8qpyJeZKTzg73hWdJ6ucd4SB8ck0Cfw268MjOhraKBBJxrK
   6kWhYQJYHQaMS/F4ZzHtZYGhL1Ho1szfowe4R2eZpclszHUwtd5hyU7z3
   CLFKTewPNOIV1pGO/5Aen93bYj2p0YBQQoxTgd5AlKXPJtHSEuwHik4zR
   sFZJ6dDZGBm2NaUW+87vDe4lD8gELJGOfkB0+dzcEJ2Y5A125z141LgnJ
   CRd4lmz9DXg2S4DZ90JE2uOEwmROQiq5sV3kEhCGemhvmITZya8us9jK9
   cyqlbN/BYeOQN/4hebK/jVWtKBTvibRUNGhbNfff/16oE/WeKtn1uAuWM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2609424"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2609424"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 12:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5267645"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Feb 2024 12:30:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rctEE-0005h0-0i;
	Wed, 21 Feb 2024 20:30:06 +0000
Date: Thu, 22 Feb 2024 04:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 15/41]
 drivers/usb/host/xhci-plat.c:476:40: error: 'xhci_plat_phytium_pe220x'
 undeclared here (not in a function)
Message-ID: <202402220456.8UDluPVi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.phytium
head:   974a90e098c75ef0e62d4bbbde4535368a61f98b
commit: ec4353dd415a5c35870ed32c31421574f45da511 [15/41] usb: xhci: xhci-plat: Support for Phytium Pe220x Add XHCI_RESET_ON_RESUME quirk for Phytium Pe220x Phytium Pe220x xHCI host controller does not have suspend/resume support. Therefore, use of the XHCI_RESET_ON_RESUME quirk is mandatory in order to avoid failures after resume.
config: x86_64-buildonly-randconfig-003-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220456.8UDluPVi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220456.8UDluPVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220456.8UDluPVi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/host/xhci-plat.c:476:40: error: 'xhci_plat_phytium_pe220x' undeclared here (not in a function)
     476 |         { "PHYT0039", (kernel_ulong_t)&xhci_plat_phytium_pe220x },
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~


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
