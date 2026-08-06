Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE9838B157
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 05:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994183; cv=none; b=I4bEQYaHFi1qe2cZ1p1HTkuoyIxQLGePzx/e26vrN8LK1JVelaPblLw0UXcX8ecmKB04tHh2u5QsDGHCcDII9WQup08T7dgi1uR72rtkW9iuClFGKtIoOgLCE+DajWtmgN8f+Hx79Mvlf+jVAm6F2Isqct5GYiXboOFq2XujLqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994183; c=relaxed/simple;
	bh=Fovh6bD5AqyWdBfql5Js6S58p2kVwKnI+PZxSD/xajQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YnFSLVgJ7pyREGwVlZWRC2ZmntRV0gswOGbExAACzx3wwM3u2Q5TcdNVyy2ab9FaYQuayaYLa3lgNSEWwk2iAa0AOjnaE/BLPH+t8znn2I29vPcziK58txcWqF5JfEnAg6QZXkd89vaJfoaTPSEL3iB45zZNL3IgadxA5q55d2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkktA+vT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkktA+vT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785994181; x=1817530181;
  h=date:from:to:cc:subject:message-id;
  bh=Fovh6bD5AqyWdBfql5Js6S58p2kVwKnI+PZxSD/xajQ=;
  b=TkktA+vTyPFF12FBgGIEESh/B8IYIc1Uk61Myd36GuzXMVkEdSkPC33h
   iM1cgcw/FPILgYmuSOKC+ddtyCvDlyL4vgu9BMsJEhoOYqQCvzWJ2qkSh
   73YsuWq2whNVOwk+O+krrxpicjLEl4RC3MmDzlMwKK6SF5xwAxJvBaz5/
   zUKqE7/TBqZSw9vVa4n/4aiz9HVgDQp27Te4eNdrTDczZMD6aR7gIv6OI
   kDMFZRQVIHMV31HFO115AHVcfSVIG2+UTZK8Eh/yTIRvDnMcmbYq2Oclx
   Bg9+nFpi0TqaeP8HAOgEAJ8OmWiNf1e6kNn45aSeS9LsFLqMUOFv7BlzL
   Q==;
X-CSE-ConnectionGUID: wyY1mKjeSaiktCKYZlnKOw==
X-CSE-MsgGUID: 1tzfQxXBQ1etR2zfG7HmnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86432755"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86432755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 22:29:40 -0700
X-CSE-ConnectionGUID: qGmabeXeTYOkT1B/Ta3Ejg==
X-CSE-MsgGUID: qoDXfeMYTnS3zLNo4fWBsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="265844539"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Aug 2026 22:29:39 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrqfd-000000004Yw-2OVh;
	Thu, 06 Aug 2026 05:29:33 +0000
Date: Thu, 06 Aug 2026 07:29:11 +0200
From: kernel test robot <lkp@intel.com>
To: xiane <sangch.go@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.2.y 21/58]
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: lcd: lcd-rst-gpio:
 {'rockchip,pins': [[2, 22, 0, 180]], 'phandle': 86} is not of type 'array'
Message-ID: <202608060716.QcwxCnQs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   d2521cc718fa5ae45bdc48f40517b76d2753a185
commit: 7ab68102b150b3a92c03aec7e7651d42796a5d3d [21/58] ODROID-M1: arm64/dtbs: update mipi dsi stuffs
config: arm64-randconfig-2054-20260803 (https://download.01.org/0day-ci/archive/20260806/202608060716.QcwxCnQs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060716.QcwxCnQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060716.QcwxCnQs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts:274.11-278.6: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts:709.27-723.4: Warning (i2c_bus_reg): /i2c@fe5d0000/touchscreen: missing or empty reg property
   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:1351.21-1362.4: Warning (avoid_unnecessary_addr_size): /i2c@fe5d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: lcd: lcd-rst-gpio: {'rockchip,pins': [[2, 22, 0, 180]], 'phandle': 86} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: lcd: touch-gpios: {'rockchip,pins': [[4, 8, 0, 182], [0, 20, 0, 182]], 'phandle': 130} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
