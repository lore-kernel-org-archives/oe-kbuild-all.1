Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D395236B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 01:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731201550; cv=none; b=DBjmhRoWpjsZEbXmKtYM1uGw5sS1vAK5fe8Hgv3YzyIzh21ONEEZv0jjKimS+WOXynCVt5cLCDW4s7PoHLIHZVyl3ViWTCJ2GgKHf+vh5/Hi4TaBwXJtSkqtWQrVHfWk3g9/YeXk2UH0oaqGM0IWDCLhFoqURwfTPFkV81rRuFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731201550; c=relaxed/simple;
	bh=QiDpiyiWRAi6gccX+jCOqS0lwXFafr0X7dbAsupjJi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P6aQMTJN/X2hjCIGKg+TUhoCixJUId2o7WTt0Wp1o+KpC4eT2tCheT/3Uz0GB8mcj2KSGbw6wRQiKJaqkWhFhHtYtLNlQV9mdn4LnlzqOnz5nuPg6wEMFZ1kPaoNgZ7i2CN2g2LblrItJUnzmdDoJ6zlpMc2E3P6XXy4gBDNCeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHt1bn3b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHt1bn3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731201548; x=1762737548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QiDpiyiWRAi6gccX+jCOqS0lwXFafr0X7dbAsupjJi0=;
  b=EHt1bn3bTYBhAiYhvt+EnAJr1bw3CvVu7tbLxy9fOkwvISrAgyrsTk0X
   u4goBtv+hWPb4JFrph3xPpynZYvcJIWaba24sHo9orTKaqiTAhAlQEQO+
   QoxLUoYfGPCzgUWaaCd0AS78jbTFFyBU0hr2DgsCnLmbDWgVi4FESTO0b
   rNkoJv3isSIssjOHmIekadj3zGBXEfhFfbT8KkbmTdZupogFkSPT+1BtB
   JnhJ65o1NzhxR1FQJs7Jngf6OcclfsOXlUX4VXz4+cwtVs3mcHGh0qKeq
   rWWaFtyvc8dGwbD0bcVMlD5gK4dlNPc9MJWRkw+sjN+BJ9KGMvA+WZ0BI
   Q==;
X-CSE-ConnectionGUID: 58Ll1c93TSSPTUHCCYK4SA==
X-CSE-MsgGUID: HmtKNndhQnWyGgBL9sVEJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34737528"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34737528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 17:19:07 -0800
X-CSE-ConnectionGUID: YOHYbmbORiy5BT5sHLIr3A==
X-CSE-MsgGUID: FlT/la+uR/KnipcK9Hv1eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="91118910"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2024 17:19:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9wbY-000soI-0q;
	Sun, 10 Nov 2024 01:19:04 +0000
Date: Sun, 10 Nov 2024 09:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb:
 regulators: vrf18: Unevaluated properties are not allowed ('compatible' was
 unexpected)
Message-ID: <202411100926.G5CMqAYD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   213f014f54af1757a6058da8cb226e8168dc9ec5
commit: f99ae53d82d287e60e236395ffa09d77106292fc [1/1] CHROMIUM: arm64: dts: mediatek: mt8186: support early corsola devices
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241110/202411100926.G5CMqAYD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100926.G5CMqAYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100926.G5CMqAYD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,elm' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: regulators: vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
