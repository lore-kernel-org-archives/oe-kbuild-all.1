Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2A6FC5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 01:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674237; cv=none; b=NQ/JVOg0rp6LMe42KQLWni+c1EDdutR8dNYUBVina+RBviYXFxGLUlZ8ZJVw0/raAIm4QnP7YKhqjYQMPazN/oVV2vkxZOq3zw7/LymWYcwHiG4innYO7mq8pGcXO/qh+Foh9T8VYkz4RNuLFrp+3dA/goJVqoMwb4uVmv5ph40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674237; c=relaxed/simple;
	bh=/xOcypORm4W2zvrLzgozjYsvYgo+3T3jpS91OiIkm1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bqmZeg1ccR6EWg1NetgbuYUVmjjolklOOBSzJ3PjqGb5eGRh5M6pVK+MjrwQlKnOCEb1V06aqZVAKsFxH6/vy2roMT1vc+qu+o2mLpo4XeeUkw6FbexdaN8YP6tVZHM4sqRRj7Jk+fxB/J8JceCWbA1YRkOWFAzQybDo8QWUJas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JctSXcMw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JctSXcMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772674236; x=1804210236;
  h=date:from:to:cc:subject:message-id;
  bh=/xOcypORm4W2zvrLzgozjYsvYgo+3T3jpS91OiIkm1U=;
  b=JctSXcMwB/epd/Vk/HE3aX7n+uXB8D2yLTzYKMJkK5U37p3411k/Ls15
   /ZtGdlQ8T48lVE4lhtoh8HM8Yk+/BE6bQ+y89lg2MAVJ8iOU7BXVq+Nu8
   hBVIj8cmqoH7/DXravwohYDmFjdM1MAo9g4U1ODv05/l7POzJeitCbH0J
   KtivUhtGvWtMKdndcDPrIAMHPSMpLRJVIu/Ugyt/WJyn5WorD34RrUFcb
   shqPkHy7RjhGSyITafk4tje2Gkcql78o194pP4N1cWs0MK2frFa+1w5hs
   asuf94HGo5j9WDzJee0fPmkg1mL8jrmmkf+cKElt0jSQBSehaPFt6Hkqf
   Q==;
X-CSE-ConnectionGUID: MNeseJwjRpKFc9Ygw8RL1Q==
X-CSE-MsgGUID: 5IFnVg0KRAGe7RrCGzl8dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73796316"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73796316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 17:30:36 -0800
X-CSE-ConnectionGUID: cwmPWxUMSVK3chi1Cd80NQ==
X-CSE-MsgGUID: yid+EMkZSuGF3MRGePS7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218641977"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Mar 2026 17:30:36 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxxXt-000000001oj-071n;
	Thu, 05 Mar 2026 01:30:33 +0000
Date: Thu, 05 Mar 2026 02:29:50 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1487/3989]
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb:
 /soc/bus@80000000/memory-controller@83fda000/fpga-bus@0,0/syscon@10000/wdt:
 failed to match any schema with compatible: ['technologic,ts4800-wdt']
Message-ID: <202603050211.IS8teSSo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
commit: cf1215fd56cfe552f4d7df17fb995f52a88a2181 [1487/3989] ARM: dts: imx51-ts4800: rename fpga@0 to fpga@0,0
config: arm-randconfig-2051-20260301 (https://download.01.org/0day-ci/archive/20260305/202603050211.IS8teSSo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050211.IS8teSSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050211.IS8teSSo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: syscon@10000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: /soc/bus@80000000/memory-controller@83fda000/fpga-bus@0,0/syscon@10000/wdt: failed to match any schema with compatible: ['technologic,ts4800-wdt']
>> arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: /soc/bus@80000000/memory-controller@83fda000/fpga-bus@0,0/touchscreen@12000: failed to match any schema with compatible: ['technologic,ts4800-ts']
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: /soc/bus@80000000/nand-controller@83fdb000: failed to match any schema with compatible: ['fsl,imx51-nand']
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: nand-controller@83fdb000 (fsl,imx51-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: disp1 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
