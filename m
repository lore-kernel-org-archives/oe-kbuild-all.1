Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8414A89
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 06:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708064899; cv=none; b=ACLUoiHeVdRATSQYpCEPMG3AZ1fbdXhQrQqCKCpysaK7esJemOc4ySHehvc+k2XlclHRIAyb9U0uEN0vih9D4bTjRQrT41bbrvdZwAhTWjU1nvUEb3xthH+EddGD6487DA9GZx/Y2QHYJcLS1SvKtKc6UIbc2kGjLdGL6FNnc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708064899; c=relaxed/simple;
	bh=PbeeG3h44jrQVBOQd8KCaxyLJls+aXY1LijLCw2zZW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGPRMzXEVEGCwkUkT0NwzK9qAMblKRtwIf8g28190gK/mCPA+22XGmMqMOglGNikdB05zu8wWOXUr3EL+MvxJUBzLbkG/W0U0aqS40XpbciYqaSHCZCapq7BtVmTXKyeeVNlNxPpjERJ/XQG1BrXjKmkolGZQlHhdcuf4TlMfQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrUrTK51; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrUrTK51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708064897; x=1739600897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PbeeG3h44jrQVBOQd8KCaxyLJls+aXY1LijLCw2zZW0=;
  b=IrUrTK51bEF8LyWeC5H0KHGQWzBojK3HIvmD56f3lWGjsjehaehC9HJI
   K1+HEdYG427xZRBJSc6O8gmQSzOpNKhzgq59I+0ZcADEUDTqvDEhhNF7n
   JsFIGstqh9/KYeAyoCM71u74mEVtzxCeu3Zx7F+bu1BCDtQlEuNm2pEse
   ZnKNT5sTK64mbQFevBtgSm8TnO46gjWLLUWSTWQY8UDuhqHddrgbt7k7R
   mNwU/Udm8FwApek68BRNdeCprr3jPgotgqTfRZaMQKE0HoJi5ZsboZbH7
   0N5DqkmDAqt9QChtJ12Ca4ANd8haJpd2BfJu8FFQg5ma3mLx8X6HyI2GR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2093839"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2093839"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 22:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="3842396"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Feb 2024 22:28:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rarhY-00012W-24;
	Fri, 16 Feb 2024 06:28:05 +0000
Date: Fri, 16 Feb 2024 14:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 287/382] cdns-csi2rx.c:(.text+0xc8):
 relocation truncated to fit: R_NIOS2_CALL26 against
 `phy_mipi_dphy_get_default_config_for_hsclk'
Message-ID: <202402161444.pzZB0eHe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   bdebf4319d95b46edd39be72d937d1e0086865fe
commit: f892c1ab1a9175a9d59ecd6e62654014937e72a5 [287/382] media: cadence: csi2rx: Add external DPHY support
config: nios2-randconfig-r111-20240215 (https://download.01.org/0day-ci/archive/20240216/202402161444.pzZB0eHe-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402161444.pzZB0eHe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161444.pzZB0eHe-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/media/platform/cadence/cdns-csi2rx.o: in function `csi2rx_configure_external_dphy':
   cdns-csi2rx.c:(.text+0xc8): undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'
>> cdns-csi2rx.c:(.text+0xc8): relocation truncated to fit: R_NIOS2_CALL26 against `phy_mipi_dphy_get_default_config_for_hsclk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
