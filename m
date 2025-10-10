Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC021ABAC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 17:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760116689; cv=none; b=iZUogkGj+S0hSDv3VdXND70oiNGL/iCoZuN5KFaSbQHF6Zdj68SWmth6oLkDbm/vPosHBwKzGiYurkYLn8i6haN0BuleLF0oRzXzFtug5RsREf1Xxn2nowlwOgAWUC3GOpgj6Z3GfxdR9uleypXvPwFEa7WloEwNgsgxXEOV2pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760116689; c=relaxed/simple;
	bh=fhNuZ6zmxv4cOL7z1u5Ygo50MDsuQrVu0hqe7AO5Eu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o0+LNAFYTuYjB9sRAw3WiXRve4uiF7MJ3Y8SNuzeT1Ng8JfV8LD7GmI0d2uWm36EIP0ESUU9BSbvByssIRtINKaUNk9sV95wCbkL/ZHn1YI2LhTc9mfIOvGLBHOyiRsNwNUpQOIFO8x+EcgRAAww2UupqwHbGNHDc0tZAcw+7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWj/WejE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWj/WejE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760116687; x=1791652687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fhNuZ6zmxv4cOL7z1u5Ygo50MDsuQrVu0hqe7AO5Eu8=;
  b=ZWj/WejEW1X3CeTcGlVaMEPqaQN85GKEoRiNHT9ek5U/sJavytUtd//B
   WZ5x8rmw7GWv7wpyP7ZGx+5iL9bdtSDKDSsST39+cKtwQBVywJegPZ9Eq
   BveW8e+vDGLDf6XS0Ym0iiCxh3xtle1dalLcyaiPEoYkYh+gJZvfkvXxe
   BkC2caWg8xdrqkc2BppDLJ7TtKINsX7RcUw2Hj3WvUwIs/kLnd8MY1itS
   2DRyyRinReJoNdF39xDExJpqH5krdHDWbsUYVDLmc3bA3ii5YXmI/lB5D
   jdzXvSZGS/aadgABmHkHTn73lgyYkZN/uXRfxiCsUKdM6vJsWTuUD5lI0
   w==;
X-CSE-ConnectionGUID: 88jXQuOgRkmk+KjkccxKSw==
X-CSE-MsgGUID: cqh4KLmKQFGLASiihxDXZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61371960"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="61371960"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 10:18:05 -0700
X-CSE-ConnectionGUID: Xx/gmJnzQIObh1YRkRw7NQ==
X-CSE-MsgGUID: dzNiHgIVQAmZm9BSQe+YgQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Oct 2025 10:18:03 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Gkj-000307-1u;
	Fri, 10 Oct 2025 17:18:01 +0000
Date: Sat, 11 Oct 2025 01:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kael D'Alcamo <dev@kael-k.io>
Cc: oe-kbuild-all@lists.linux.dev,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 13456/13643]
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: i2c@8b10000
 (hisilicon,hix5hd2-i2c): Unevaluated properties are not allowed ('label' was
 unexpected)
Message-ID: <202510110109.hIUbuESQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b763d4652393c90eaa771a5164502ec9dd965ae
commit: eb4faf6343889fcd7edba3deeae49fc5a06531fd [13456/13643] dt-bindings: i2c: hisilicon,hix5hd2: convert to DT schema
config: arm64-randconfig-051-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110109.hIUbuESQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110109.hIUbuESQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110109.hIUbuESQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/clock-reset-controller@8a22000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-crg', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/clock-reset-controller@8a22000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/system-controller@8000000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-sysctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: pinconf@8a21000 (pinconf-single): $nodename:0: 'pinconf@8a21000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: i2c@8b10000 (hisilicon,hix5hd2-i2c): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/hisilicon,hix5hd2-i2c.yaml#
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: i2c@8b12000 (hisilicon,hix5hd2-i2c): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/hisilicon,hix5hd2-i2c.yaml#
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: spi@8b1a000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: gpio@8b29000 (arm,pl061): gpio-ranges:1: [11, 71, 1] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml#
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ir@8001000: failed to match any schema with compatible: ['hisilicon,hix5hd2-ir']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
