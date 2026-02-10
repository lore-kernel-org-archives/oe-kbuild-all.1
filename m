Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EC238A9A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 17:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744625; cv=none; b=VlGllgLKDWvmlV0bfSS44qxmwcLIv5GRpxEufqS3MLZA1jOoIMs+8rMebqRbX/QjH8lDLJoaXuXQFEeSl9gWzLTJT1q0Nff3odmAHQJMyxRRxHLbWk/HjKdlgYhIT95+fbloxufIrYRCZDFXGr9uT0Fg7Vg+0wE5O37YboDl92g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744625; c=relaxed/simple;
	bh=LjwCPdamqFzkCBIFuRpLDCeCBT/D3iz+t9RAca3/P6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=snoVrDKSWvPtguyAcJA6nkZ10yCqUJLsEeJGfWTnlXu3MYBeIRmswx8Yt4DBtgHu+qiCsYa4Rb6d7WbyWGl7Hn+vDqwWF+zPR5BaNgDXMO6AOO9+bWgqpeEGP73v4Gm89KkEysHoFGZ3+ACQSOxXBfotuqAOSJl1+jasWiSwkWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ay5e+gXH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ay5e+gXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770744624; x=1802280624;
  h=date:from:to:cc:subject:message-id;
  bh=LjwCPdamqFzkCBIFuRpLDCeCBT/D3iz+t9RAca3/P6s=;
  b=ay5e+gXHhB9Dr1xZeSOhLMOjF1gvs1qTwL5sPTMC8vU3erRH9RH3pe6Z
   ktIdEU/tzjoQec8CMNu9S/Cq2CXkOH157nl9mAn+yIYA3lKyfSPyvqhT4
   vOH3F50bKCsDaPUyEIMjlJfq8+87Y965xu93eBk/zZmMAo6CjYV+RJ75B
   50ksipe7y0ASlEDszkSj0syL7RhXzNhKkHXGtnc3+xvjZXraP47IOkJX6
   FrfJpKH/Jy1fQsfvdKs08QJB9VFGoAgs2el9hDADHjIru5w6zu+qxQkCy
   pyfbK7ovhjOWm5ZFc/z9iqYXKJ+NWIz6Kl6pdZZE5IOiLwmLhg9s3hTjs
   w==;
X-CSE-ConnectionGUID: eQpm/U3+RamknVcmxKTKyg==
X-CSE-MsgGUID: 9pOtzUsgTkOt3OlOdanMQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75506429"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75506429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 09:30:23 -0800
X-CSE-ConnectionGUID: dkSdJwxVTvaN1ODWLFK+jg==
X-CSE-MsgGUID: Fe9aBRVIT8yleFEQFH2IDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211083766"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 10 Feb 2026 09:30:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vprZ1-000000000sj-0GHr;
	Tue, 10 Feb 2026 17:30:15 +0000
Date: Tue, 10 Feb 2026 18:30:08 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [linux-next:master 11110/12313]
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dtb: led-controller@36
 (ti,lm3697): led@1: Unevaluated properties are not allowed ('default-trigger'
 was unexpected)
Message-ID: <202602101833.tGMRIzaT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   132737e360b4c0daa7f473faf0f55cb04ee3e15c
commit: b2c87f5e98cd88095dbc6802197526703d5e4e48 [11110/12313] dt-bindings: leds: Convert ti,lm3697 to DT schema
config: arm64-randconfig-2052-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101833.tGMRIzaT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101833.tGMRIzaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101833.tGMRIzaT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1066.27-1116.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1496.11-1506.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dtb: led-controller@36 (ti,lm3697): led@1: Unevaluated properties are not allowed ('default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,lm3697.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
