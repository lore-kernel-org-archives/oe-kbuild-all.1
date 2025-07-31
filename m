Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1213ED53C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 02:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753928335; cv=none; b=kIIX4gt07w+DmzS7aEu805CnCaE5x5jk07Cl6R0A44gpndNO2O+AVKrGx/O6v1zyiKD2n2uP/ojRlNVu/GigXKw1CI3Wi1UvrQ93MO1c9z8RS8428nFYgUGJpt2wJ5PuLpxSkeA8YZkriGAfhwJW0udv6ziGlLvoLGEXnvcNBX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753928335; c=relaxed/simple;
	bh=+UImLbvStv6hPU/X7GkycS3GPfpznBHVuxJlvm3HKdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mzntnhvCfUVVW+Vh2/6tHH5kwQ5zZKUxuUWYLJTEyu47xq4snIRDO3YrFiXPfP1i4vRh87fzpjJRkvqFIIZa6IhLxnyc1+MoNx6Y9pCWlkuhhU8dadLdV/tNVQi2+5Q1xKRhBzG8pbh83ygsp4wtxcWEwe/+cnGiHg8q2cUDeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMMFJCCj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMMFJCCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753928334; x=1785464334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+UImLbvStv6hPU/X7GkycS3GPfpznBHVuxJlvm3HKdY=;
  b=lMMFJCCj1dNEOp5v73aJodS3PQ7tOvgVv4eivlGas2/tTNYDrTrUrg4l
   Ze5FTd//WCYHDQ3Wg1PvE42e47/wV8i79/6d5pEm6GZKkGoZ2GvLcCDO9
   cLKUgVwK6eLosU3YQjQukDMTbvuceU1kARet5Cj+l/7kvk2koBmd/2r7k
   +XuZbW+NEvhvLqI2keqqk05Sss1WlBnoQ4ODlIZap5k1KrOjbhX03krj/
   3jh9b3JvkArCwITeCJ/fVd0Lnc5Lxh0uQFPesnpa98uHpVjMnXsXLdiaQ
   HCvhgJaQ6CPmUkthtem/1/+dMk5gpCwD8U3m8pv054diVdESuNl5p7wyU
   g==;
X-CSE-ConnectionGUID: F82xdebpTeCob7ZdEQYGHA==
X-CSE-MsgGUID: GtOKpBvtTlKKDD4q0g/NAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56205567"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56205567"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 19:18:54 -0700
X-CSE-ConnectionGUID: cNKjRPoyT6KhhK2pP6jIvg==
X-CSE-MsgGUID: jiAYnL4+TlKxm099aqjUqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="162404667"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 30 Jul 2025 19:18:52 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhIsb-0000tL-22;
	Thu, 31 Jul 2025 02:18:49 +0000
Date: Thu, 31 Jul 2025 04:18:45 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Stefan Agner <stefan@agner.ch>
Subject: arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: dcu@2ce0000
 (fsl,ls1021a-dcu): 'display', 'display@0' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202507310417.jtfECOhR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8d780dcd957d80725ad5dd00bab53b856429bc0
commit: 83e6769f80a1b8e1a97f8d1cecd8631b976fc009 dt-bindings: display: imx: convert fsl,dcu.txt to yaml format
date:   8 days ago
config: arm-randconfig-2051-20250730 (https://download.01.org/0day-ci/archive/20250731/202507310417.jtfECOhR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310417.jtfECOhR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310417.jtfECOhR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000 (fsl,vf610-sai): Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: dcu@2ce0000 (fsl,ls1021a-dcu): 'display', 'display@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: display-timings: 'mode0' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timing'
   	from schema $id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d10000 (fsl,etsec2): queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d10000 (fsl,etsec2): queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d10000 (fsl,etsec2): Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d50000 (fsl,etsec2): queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
