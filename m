Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0EF18028
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725343248; cv=none; b=e7x8hs/X8jLyYhcZ6fV3CayrfrVD4khDidTJihIYW+Q0OYkkXgppqUt/X8WkoW7gD4TjHgbYY+hsArbxnTRlT22tSJuxWq2yZlSOjvkWQHqcqk6mGZgYRuiZMEKQq3ULw0P+/5hDyyUb6tlNAnMYJZDqR2kLbaiWV3jLyNd0pbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725343248; c=relaxed/simple;
	bh=9ipdvlQr4p7eJq+oIykN9xk0BhOXck2o+dxXKkxaE9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b/DjMUV4pTjdPctIQ+HwQHtuRsOHM9z1uNtRDOAK3oCMhUX81xJu/yltDSQSFIwVN1/mqHH+32qIH84W9EEzhPCIe6mhaLSMxiwrpnXVQb42cZLgEN2V1vexpopLg9qFTi6sPHNY2js6H+3JkUgaasU1uUiADY5e/N/AkMFeC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7MfN/UB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7MfN/UB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725343245; x=1756879245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ipdvlQr4p7eJq+oIykN9xk0BhOXck2o+dxXKkxaE9A=;
  b=C7MfN/UBJHOL9OemMGH8v4dWt7WO03WoTwbubJGIZHHZPzNrWofGRe9s
   UB2EFNzRJwGH8OrZMy28nJdnXyaxF2pQ8YzV8twarUIZetWLFagy/TKxn
   fofxgcUEynxu7E8auZWaDVkocgy85mwmtTcaPsyDSf+PFkaenjQtKi0Bp
   gOwtT1PuB7hhd1jS6Fp2jGPwDc1xaT+YS+woOODz0h/kxeG4vj/+Bp51C
   Vxw7yD35Ts84y22Sar95HkQ8XDeC94Qx076zBpnj16FzPfb95Js/zhkmg
   S7qey78DmVmW/xVQJ5kBFElGTLe4Yvc1aoc58YVaNiZhF8R/wrWOgdHaR
   A==;
X-CSE-ConnectionGUID: lX+pRWbVQ+625oUJBcQvBA==
X-CSE-MsgGUID: kuSN2f/7QjyN5NWwj67g+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34528415"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="34528415"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 23:00:44 -0700
X-CSE-ConnectionGUID: QEBBcmtURkWC3+VO42DUKg==
X-CSE-MsgGUID: tQnHSc4zQUqgCPCm6079Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="65297884"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 23:00:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slMam-0006HO-25;
	Tue, 03 Sep 2024 06:00:40 +0000
Date: Tue, 3 Sep 2024 14:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>, Marek Vasut <marex@denx.de>
Subject: [linux-next:master 5762/8400]
 arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: ads7846@0:
 ti,keep-vref-on: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202409031302.xp1kb3Tl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
commit: 45d6486d2a5ad4310c1379071fc39d02d6784cbe [5762/8400] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
config: arm-randconfig-054-20240902 (https://download.01.org/0day-ci/archive/20240903/202409031302.xp1kb3Tl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031302.xp1kb3Tl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031302.xp1kb3Tl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vusb1v8: failed to match any schema with compatible: ['ti,twl4030-vusb1v8']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vusb3v1: failed to match any schema with compatible: ['ti,twl4030-vusb3v1']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vpll1: failed to match any schema with compatible: ['ti,twl4030-vpll1']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vpll2: failed to match any schema with compatible: ['ti,twl4030-vpll2']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vsim: failed to match any schema with compatible: ['ti,twl4030-vsim']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: ads7846@0: ti,keep-vref-on: 'oneOf' conditional failed, one must be fixed:
   	1 is not of type 'boolean'
   	True was expected
   	1 is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: ads7846@0: Unevaluated properties are not allowed ('ti,keep-vref-on' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/wdt@48314000: failed to match any schema with compatible: ['ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/mcbsp@49022000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vusb1v8: failed to match any schema with compatible: ['ti,twl4030-vusb1v8']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vusb3v1: failed to match any schema with compatible: ['ti,twl4030-vusb3v1']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vpll1: failed to match any schema with compatible: ['ti,twl4030-vpll1']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vpll2: failed to match any schema with compatible: ['ti,twl4030-vpll2']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vsim: failed to match any schema with compatible: ['ti,twl4030-vsim']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: ads7846@0: ti,keep-vref-on: 'oneOf' conditional failed, one must be fixed:
   	1 is not of type 'boolean'
   	True was expected
   	1 is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: ads7846@0: Unevaluated properties are not allowed ('ti,keep-vref-on' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/wdt@48314000: failed to match any schema with compatible: ['ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/mcbsp@49022000: failed to match any schema with compatible: ['ti,omap3-mcbsp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
