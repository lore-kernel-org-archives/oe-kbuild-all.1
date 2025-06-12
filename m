Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF779D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 00:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749686629; cv=none; b=q40sQPTsTiIBZB3vY3s46A/E8Fbf4W8+/NFz7BsvwtseU8PwEnHnrMsIyuPhub1m0/lOz3jEVyrgAguVfMbWodx/Nyk9nwixmBs8wSJOiJclLiLBYwRYT2/KwStHOKv5GPgaN/tsVXNlPiN1L7kEVyD8K/qo//MyDi47gi6eeuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749686629; c=relaxed/simple;
	bh=3Ag2qE5E4LC/3hZte987IY6BPgmTClSNaK+u2toeUQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uf8r6xez1T+He/zQvqQ9giFeZ59ZD2e76IRxK8VAJy4ElgHOw8+DmIqh9O9ZSkQix43EcHZW3kIveM8knnjaaQPHemitjkXTOrHA/SOyBf6BQlO5kU/iRoYzAmSRq4czWhp+O74sTHz8gsm/LwPT/4bon6qkGiKCqpAKuOm79Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAo3k3/5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAo3k3/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749686628; x=1781222628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Ag2qE5E4LC/3hZte987IY6BPgmTClSNaK+u2toeUQA=;
  b=dAo3k3/5r+EvrMaot36I2eT0mme65G7/rtVKmedcqu8ZJdF+ZmrlkTLo
   V2pmWZfFPxMHC5+La5y2Jvtu+ATZUCU4zvoljdqNx30T900660GJww7kr
   fHE65C46YyDWCO0OIfK9MRgTdSo+hTV3dcYapkUlVbk5//2dtfMIwurcK
   nAja9JXzJtl5FfTFhJluZ6XH5jwcJcbwj4PvKplGnIRn2UsbH410XIVMc
   x8nRJ9sPxyWgksVgOKdY7NB3mQqU9idwfkikWjcJJI0GA+xFt068D0uqp
   Tvfi2ijcfozMRvi1GKZwfCjc+X+HQUxkduWY3KN1ag+lzVKwdpccUUJRb
   w==;
X-CSE-ConnectionGUID: brgwxppLRuCOS9PSVvfOmg==
X-CSE-MsgGUID: uakWAgd/TxC9Zk0HYuAX+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51838908"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51838908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 17:03:47 -0700
X-CSE-ConnectionGUID: X0I/nmHOTaOro7x/ks4Iyg==
X-CSE-MsgGUID: UFm7yGfeQiGIb+c/QyyJag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147246001"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2025 17:03:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPVQ0-000Awg-0k;
	Thu, 12 Jun 2025 00:03:44 +0000
Date: Thu, 12 Jun 2025 08:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb Connolly <caleb@connolly.tech>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 1447/1841]
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0
 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202506120728.z4ASess3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   19a60293b9925080d97f22f122aca3fc46dadaf9
commit: 9c59059fcf27ccd93d7dddc99727fd2c9deca309 [1447/1841] dt-bindings: display: visionox-rm69299: document new compatible string
config: arm64-randconfig-051-20250611 (https://download.01.org/0day-ci/archive/20250612/202506120728.z4ASess3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120728.z4ASess3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120728.z4ASess3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts:477.10-498.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4762.27-4813.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1221.44-1224.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/geniqup@8c0000/i2c@894000/touchscreen@38: failed to match any schema with compatible: ['focaltech,fts8719']
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
