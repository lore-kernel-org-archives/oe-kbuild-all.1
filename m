Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F9B77104
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 18:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891386; cv=none; b=V1CC94XADwqhKuE9edJcstbi+UOg3Zvz+AFB2qdSO+uNzfLjImrx806cbIIreT8McUIqVgtFwTsyUbIqGLDwHRkA59qmw39QbUHgagYTgEGjtlxJ4ZErFmdVugHkPGEX0F/5DR4OkhdQe3rWKpstJ6Joa8/C0S0uSMu6+GfjCIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891386; c=relaxed/simple;
	bh=xb28xrHzOplD9qOWZ1XukNkFa0QRhCEZCHUgWHbChW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G1flmrWiCaP4OIjRyjkFZWeW5JWedAcSmjjO0lMQvFszTPVtaIJQ/p+xRzl0ZY2ayp4zWxlBrRJ2wA6YEgmwbyvqOwelmfgafPYJadhjiABhILS4LRm2WU+Q0e2Q66C/k5/3tndRRvigx6CBz3QsplaVyejd4y3ClCGbRMmAk+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0UYK66H; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0UYK66H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741891385; x=1773427385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xb28xrHzOplD9qOWZ1XukNkFa0QRhCEZCHUgWHbChW8=;
  b=l0UYK66H9VPi+psTuxR8p6rFRGXq8neMlgFUORvHhQGN9M4RgbmIp7AU
   2ajWcDudpoYbzzOfjDqGzhaz2oBxWVfHWDh1Rx9C9UrJX3SCiCuiFPNwq
   rry4Ua178xyC3lIoFfBKwvfl2EHmJKahP+gZbs2MCHdltTbsyZwImV6LL
   cMzLZV1+91gAs1bOMItHHT5kVdDPuRBEiBLQF5UWAj3AVimXHbaV6qHBo
   q5v+QHrQVDCeTtb65JZ0RgTRgxKSsKGGP4P8VyRjqEzb9cwl/Y5PszbOE
   OBk8ivbicgB/nAQ7almKsT42Yf6a9jN1F3sGBiXMpeFLC5Yd//vgbVi6K
   w==;
X-CSE-ConnectionGUID: TixDhr/XTtOJmBJfn+RpNQ==
X-CSE-MsgGUID: E6fiOQamRo28EtMHxt/BzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53234111"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="53234111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 11:43:04 -0700
X-CSE-ConnectionGUID: biN76YGXRkakck58T/y68Q==
X-CSE-MsgGUID: a8ITIGlgS0iDNchrSmXxOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="121543338"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Mar 2025 11:43:03 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsnWG-0009lg-1P;
	Thu, 13 Mar 2025 18:43:00 +0000
Date: Fri, 14 Mar 2025 02:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 8547/11005]
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb:
 /soc@0/geniqup@ac0000/i2c@a98000/charger@69: failed to match any schema with
 compatible: ['maxim,max77705-charger']
Message-ID: <202503140249.8s50Hvyt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   613af589b566093ce7388bf3202fca70d742c166
commit: 7a88a931d09564b3ae84e7abd5cd412af1dd5280 [8547/11005] arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC
config: arm64-randconfig-051-20250313 (https://download.01.org/0day-ci/archive/20250314/202503140249.8s50Hvyt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503140249.8s50Hvyt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503140249.8s50Hvyt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts:434.10-475.4: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4690.27-4741.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4762.27-4813.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1221.44-1224.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: failed to match any schema with compatible: ['maxim,max77705']
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66/leds: failed to match any schema with compatible: ['maxim,max77705-rgb']
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66/haptic: failed to match any schema with compatible: ['maxim,max77705-haptic']
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/charger@69: failed to match any schema with compatible: ['maxim,max77705-charger']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
