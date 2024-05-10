Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C17414A63C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 05:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715318089; cv=none; b=TnzOQHCWSoITsfXz3zWa+zfh3PEyKUOCQaZzS7XClE7ZNIRhegQP3JEb6i21zoSdt8yBuUgp/vCNfV7G+Cd/zpvteMDK7BA1EC2WnTYOQu8fWbvgYwtM13WBK+dW9CZvCqNjf4qnwsYPOKBEJs0R+hvd71IF8VX4S/RIHggC/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715318089; c=relaxed/simple;
	bh=w7pGuYNb1wjUIp7h30yocHECKC+JDgC/7ip1xIc4JvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjKRblsFGxVO4qHEXx7z7bok52Vn6xFT3JRSbdBih68fbls3W8EtKdwIJLW4COCiFxeX+/h3IHgTGloa6OiMNfDvNBVHONtSj+dEhfebPduREsOjiqInvNpjeMAPI0ZgLyW4FdkabyOafsH1jfzFRuFinkBipOqvLZnM2s7trYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvzGcqwP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvzGcqwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715318087; x=1746854087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w7pGuYNb1wjUIp7h30yocHECKC+JDgC/7ip1xIc4JvU=;
  b=XvzGcqwPwiXAU2sViuve23Zlb9MDRa8b+GW0V30FluUz3KwpdDUWN1uk
   LHnLL7+L/LmBjlhaPfTy4gf1Jmkncr5d9V4BAuiJMcH8S9h4awMvfRiUz
   kgmgoiWKnk5mT4hVcf7BFhLUXXeM8pU/fuST4z8VHME75QrHRAV7GgQT4
   SeH3qyfTALqznyQPfFZFB/r+gNr2MRmQQbAV4UzTqEiEn8NxmYua9asQ2
   kRmgdfLKrneO2ohPTSsb6GSNjDizL3Cf5D6vTwj07T6sWdnUpzmzi3biI
   kKw8lbdSeurJsq4jO7H8zs1zES739+0xwcXY2yz6VawTnRpFXyT8B+vtM
   A==;
X-CSE-ConnectionGUID: zpKyZTJZTtWMFohtCxRC/g==
X-CSE-MsgGUID: 6LZrALyURf+0NRH785xIPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21952104"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="21952104"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 22:14:47 -0700
X-CSE-ConnectionGUID: 0n99MwRoSu6fLJtb8g4yYQ==
X-CSE-MsgGUID: NxXefiweTqOayGAohd8iUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="29453084"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 May 2024 22:14:45 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Iah-0005l5-1s;
	Fri, 10 May 2024 05:14:43 +0000
Date: Fri, 10 May 2024 13:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 98/104] dtbs_check:
 Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml:
 properties:#address-cells: 'maxItems' is not one of ['description',
 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf',
 'default', '$ref', 'oneOf']
Message-ID: <202405101308.u1CykYDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   cb75f24663df84986d5056df93e821564be6d886
commit: f294ca970899f99e9f8c2f8f25a31837eb99d55c [98/104] CHROMIUM: dt-bindings: media: mediatek: add isp7x camsys device
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
dtschema version: 2024.5.dev2+ged9190d
reproduce: (https://download.01.org/0day-ci/archive/20240510/202405101308.u1CykYDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101308.u1CykYDC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/socionext/uniphier.yaml: title: 'Socionext UniPhier platform device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml: title: 'Milbeaut platforms device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml: title: 'Qualcomm Global Clock & Reset Controller Binding for SC8180x' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml: properties:#address-cells: 'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml: properties:#size-cells: 'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml
   file: Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml
   Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml: title: 'i.MX SCU Client Device Node - Watchdog bindings based on SCU Message Protocol' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx1-clock.yaml: title: 'Clock bindings for Freescale i.MX1 CPUs' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml
   file: Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml
   Documentation/devicetree/bindings/sound/ti,src4xxx.yaml: title: 'Texas Instruments SRC4392 Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml: properties:#address-cells: 'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml: properties:#size-cells: 'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/media/mediatek,cam-yuv.yaml
   file: Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml
   Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml: title: 'NVIDIA Tegra194 & Tegra234 P2U binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx8ulp-pcc-clock.yaml: title: 'NXP i.MX8ULP Peripheral Clock Controller(PCC) Module Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/media/mediatek,cam-raw.yaml
   file: Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
   Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml: title: 'STMicroelectronics STM32 DAC bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.yaml: title: 'OLPC XO-1.75 Embedded Controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml
   file: Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml
   Documentation/devicetree/bindings/iio/dac/nxp,lpc1850-dac.yaml: title: 'NXP LPC1850 DAC bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml: title: 'Visionox model RM69299 Panels Device Tree Bindings.' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/fixed-clock.yaml: title: 'Binding for simple fixed-rate clock sources' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
