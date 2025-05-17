Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B310154426
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747493026; cv=none; b=tfLFEno4pYYwOVIeOBAe5pTCqf3qsLuqInnL2v5mncn6Ch14SVgVCiG81ZmgA8HiNaHo/g6NnmRSa9lgfQanhAmaxi1RoIWr8qeFBry4oPmWSyalsM60yUS8x71kynegiaw2eHkmROF18i5WDb+O0ZTRr7T/Ngkj2c0bklJAW60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747493026; c=relaxed/simple;
	bh=0JbvxxRzC8MslIUDPM7ytzsU4Oxl0h6KpWI+WaEpYAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I6gAH5lnuxcfg71Xo0BP/FVHZ6TB5ZFTYlkgCvWfTA/OUWh8m29Wayh9zNOqjRSb6E7L/0jQ0/fp3f/gWa7jYW1DnmAXPpqqd5NJoesdVlfj6ZHjlfmnFKtNEARul7Xv6jqYj/A7KRjtFtHyigyAV2Kih5ffe8hoQNTmZRWGBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIh7977q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIh7977q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747493024; x=1779029024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0JbvxxRzC8MslIUDPM7ytzsU4Oxl0h6KpWI+WaEpYAs=;
  b=DIh7977q7XR6uipmOgjicGrXlCAO992qriAPfbpMtRshaNgjURWPdybl
   Y3xgMdOIN0oS77OzKNBfZrVW7JE1lLp+qQ15mRlXJRf8WkZMAFYiTm+rw
   sHPTDKr82jbcOefNeikgcDJlzW8+ZV+TL9CA+geX4iUrU9TDPSrGVvA1l
   eOkV1cn15PCPiozYJqkSo+g+/kyzBHzKFOTSKO5mxrLzTfluLsiAHtJiG
   QByKxILxOb0dh+Zg8wnbtIZnKv4Lm8mXKWSXBr7wc215r13zeEOJSV+hr
   IEfIFZtfI6YdRP9ayg6Rpdrc5gkOTzBUuGjHC9D7UfgEjZWfjqBrFqbVI
   g==;
X-CSE-ConnectionGUID: pEz0tcZDR/OJR/CEm5+ivQ==
X-CSE-MsgGUID: rjbWs44aRiKNGLXR6kGGKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="53123467"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="53123467"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 07:43:44 -0700
X-CSE-ConnectionGUID: IPKd3dzdTI+e6HAMW3RHug==
X-CSE-MsgGUID: iHqWuYHITm+UEJmSy74hHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="169999700"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 May 2025 07:43:42 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGIlI-0000YR-0s;
	Sat, 17 May 2025 14:43:40 +0000
Date: Sat, 17 May 2025 22:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 Documentation/devicetree/bindings/reserved-memory/google,open-dice.yaml:
 title: 'Open Profile for DICE Device Tree Bindings' should not be valid
 under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202505172205.R2Y0oEc6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0caacc39200ed39c9449b0b8da1ffc26e2402876
commit: e286af39577dee7443c6ec85a449175e2124cfb7 [1/1] FROMLIST: dt-bindings: reserved-memory: Open Profile for DICE
config: arm-randconfig-2052-20250516 (https://download.01.org/0day-ci/archive/20250517/202505172205.R2Y0oEc6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505172205.R2Y0oEc6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505172205.R2Y0oEc6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml: title: 'Tegra210 I2S Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/crypto/intel,keembay-ocs-aes.yaml: title: 'Intel Keem Bay OCS AES Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml: title: 'Microchip 48l640 (and similar) serial EERAM bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/reserved-memory/google,open-dice.yaml: title: 'Open Profile for DICE Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/crypto/st,stm32-crc.yaml: title: 'STMicroelectronics STM32 CRC bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/bcm/brcm,bcm4908.yaml: title: 'Broadcom BCM4908 device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml: title: 'Mediatek MT6779 Pin Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
