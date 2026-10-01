Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21C44E77F4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850527; cv=none; b=KjLwJ/sdq7EKRDGYnM6D6aRfxIcUgX0JPrfqwNeO8Nb3KGBtaAOOwR/ibC2FQ0FEkeKGeQ9EsvvUfeBMg2OAHWyxHQjxfH0mTCSQ86ZaIBElLua6NPpgK2d5vumyLDlu2gIjsbs3KXOaDM/tosxIPEwIXaPHEstd86fhsepW/TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850527; c=relaxed/simple;
	bh=RNKha8v345VBjn4RfEdCLNVkMiMjvUGZXGZmrkOImrw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pr6pKxKQIY7mLSRm5CUzxvgRX4xt+OBgkJ/aAQeg8/Nk0f7jYYyiDwerMY9vivAfkZkw9pqvxEluzQrJVIhVB0dTXVSHE7aUpKXgdSIc1dE6ONyEVSkXaOTJ/LvJf7EBRkZXHy1i8yLeb0JLv3O6wiv/rJZyNbNrhRwd2UxH3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eb0xN/77; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb0xN/77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790850525; x=1822386525;
  h=date:from:to:cc:subject:message-id;
  bh=RNKha8v345VBjn4RfEdCLNVkMiMjvUGZXGZmrkOImrw=;
  b=eb0xN/77VynzU0HRlADGo1ynF7LBnwBNBw9QGP0TNbjq93vR0ON5PUle
   XzKhl/XpsmM7nY0nLBLsEE568axPeFPkJ6ePATKRmsBJXe+YkRCb2o3ri
   S0QRS5FhjoziFAdKn/Gyj+1EyPMkJ3h3uD5d+Glc4UFCKPLCcoKURYN4X
   waVUlSqBqwvUBt5rOBmevtdbnVF7JBEuLKmDN6JSGOhkaVr5BxtzFFUAd
   j8KXQumYB+bnwJvDENQgxK1dR+rWU9B/nCw85719vax4wnWcQk07g43d0
   kHE2EB9FlZ0ucvsG91R7cu5i5gtdgzgNy2rJop9ibVX46FFYJ4oCOFGSb
   g==;
X-CSE-ConnectionGUID: zvUzS/m5SSKx7epxQrSkCQ==
X-CSE-MsgGUID: Z930qjyMQJCMNSg6tEVgAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91465089"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="91465089"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 03:28:44 -0700
X-CSE-ConnectionGUID: swJiIm70TBSmV5YG62LfsA==
X-CSE-MsgGUID: 6ssUfKE1SzKQOcu6pDi8eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275163204"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2026 03:28:42 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCE1n-0000000002r-1QqG;
	Thu, 01 Oct 2026 10:28:39 +0000
Date: Thu, 01 Oct 2026 12:27:44 +0200
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 9435/12559]
 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dtb:
 clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required
 property
Message-ID: <202610011244.Y6tJFpMR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
commit: 55388f587b3301dffdb30074d00f069d80d29341 [9435/12559] dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
config: arm64-randconfig-2404-20260927 (https://download.01.org/0day-ci/archive/20261001/202610011244.Y6tJFpMR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011244.Y6tJFpMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011244.Y6tJFpMR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi:45.37-52.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9c000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:2011.27-2066.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dtb: clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml
--
   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi:45.37-52.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9c000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:2011.27-2066.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
