Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEC013B588
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 20:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726517429; cv=none; b=YhuqFn0LZ+grK32VfZDN6g13zt2MZQX3tEg8ZmYKGHtmsX+zylXQMPPXqmDnx8jN1rtVZW/wlQaXGiVv3flR9fY5fmx3+PH9n3cOIHchBE25+vqrz9TULbeLAgzf0paKGyhSzK/7NaRgKEa8DQUEHe/IVjp+OH/GuIYGLCPoUfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726517429; c=relaxed/simple;
	bh=LKgTlbtyqYTN2yC2lGd9HqjJVyJYVH//iH9uUu5ffD4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YOU2kIFx/qVD6gJXPSBlXUTAiFwNaU+p/wSLT6p49958cLS92bC9uGGYDlubVaO+ppSGOPCBLOIrgkrJJWZY5Ib3tKmG9AJPD4Ocqo+GEbnVj8pJnlHBKjSyLn4xJBu8e22o5rfhgYS/GEN5sEwQRq/C4ab00hp1Mb8KiaCzgM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYbFgTi8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYbFgTi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726517427; x=1758053427;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LKgTlbtyqYTN2yC2lGd9HqjJVyJYVH//iH9uUu5ffD4=;
  b=OYbFgTi8waBB8LG8FIuBQ4r7k0vhJE3kDKFaIQTdVjsNjJaVV3q9cKPH
   Lc1DcoTtchcZ6s3NX8ZKWFktCFNPrNKrPGOl7YqKXJVcoioOkaZ561uGT
   HQ0pTI7lC2chojFg2eASLR8IWGcq1Md7bKTN24omyPeaKGi/LTeIweVyk
   qUUPozj98UBhk45k4eQXD2yoJNgqKx6KlHUWMdCnkHWdh5ZrbBya/+NE4
   vMFE8ufaetY4PHyJn7i+AdZ8oGEnHXpomm9QwzoVQxap1rIjPGOmpPgFF
   ByyTz7wh1MpqdYH1HfsR5315s+i39gitpFDFCdIgmUp3+ygfVgb2FhVBb
   w==;
X-CSE-ConnectionGUID: twxXEvjORUGqLzEO/rnlZw==
X-CSE-MsgGUID: HdOOPKM6TH6RchB4W6mJdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29144919"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="29144919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 13:10:27 -0700
X-CSE-ConnectionGUID: +qgd8/1uQnKtt2wPjAHujw==
X-CSE-MsgGUID: tx7DWuciQP6x5/xqwDRLUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="69745561"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Sep 2024 13:10:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqI3D-000AT8-2O;
	Mon, 16 Sep 2024 20:10:23 +0000
Date: Tue, 17 Sep 2024 04:09:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_NSP_GPIO
Message-ID: <202409170451.fT1p8jgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   96b0ebd82722d16e9ab646cd3a73080e6f790747
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: nios2-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_NSP_GPIO-0-0 (https://download.01.org/0day-ci/archive/20240917/202409170451.fT1p8jgJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240917/202409170451.fT1p8jgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170451.fT1p8jgJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_NSP_GPIO
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_NSP_GPIO [=y] && PINCTRL [=y] && OF_GPIO [=y] && (ARCH_BCM_NSP || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
