Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142C61A0BE0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764408850; cv=none; b=TIjGO4sSJEPLDr0WY6aaYHcWru4NoeM4WC3w2gLT8CdfC8IwhnkD6e7PpK/y0Gx+tE1zzESTDj325hDm2VDDIRMfgbikT2bHRGp/iedVBRMmIR4EpghKAFegxg7MteR7qwgKM1uL4SWf2Wl+lvQb+BeMl3wh1PlBwsm57oMyBk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764408850; c=relaxed/simple;
	bh=ocS5jTnT8stxoT5v3yOd5Pc1SW0cBfNyYQ5zHu+xKbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F2BxNQsnf2DUADv6JB4O8tMMrMDuVd1IT4ik1FvNu9GOM6SXcobCl9yXQAtVCI7b3euUk9XzP9rWACkpTsykt7I8f15jNUSYoKb0LmrC/xpAmaSgwInbtpqC0SaywK7PLbtkd/ri6G9iLmFWsydKimMpbFqEC8rOJdCW11qxiWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBl6f50h; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBl6f50h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764408849; x=1795944849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ocS5jTnT8stxoT5v3yOd5Pc1SW0cBfNyYQ5zHu+xKbc=;
  b=mBl6f50hgTkpqsPFDQTFDik+Lv0j0TOBs5Fl13dV1i8JgdZWC+3qWChy
   UyYIVerYF4ryavp9DxvmepyvTecorZG9VF3uRPSJq/BJvTfnjzRV9lwFo
   VG5LqGFWYagPB8utIOoaOLWOtS2Ee0o+0hXhPqIL+6YPT+2TuZ5c0ttZi
   F9Gc9nzL4BjxhZ3J8I3IXbNgsxoEeFKqRdiqRkaK9DRhUlEETwRXGikDv
   xe/PDw57sA97hCeZJprW70HVMbGa/PGauUqb/0lF/LASZkBHeLeZjK1KE
   crpW7b2NaOPNplWsxaBSR5yr+yDsqpyZbWDvfQB+hDuqpdbc0YoZk1TPz
   A==;
X-CSE-ConnectionGUID: ATEXpXisSIKvCrYu/LCXow==
X-CSE-MsgGUID: +HhPMNlqTguhURY3aklY+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66580130"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="66580130"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 01:34:09 -0800
X-CSE-ConnectionGUID: EhwmdOJzT/uvb7ZJQ8o9Vg==
X-CSE-MsgGUID: n+PJlvsST0eIojF702qL7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="193292052"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Nov 2025 01:34:07 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPHLA-000000002ID-2oXF;
	Sat, 29 Nov 2025 09:34:04 +0000
Date: Sat, 29 Nov 2025 10:33:10 +0100
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 11922/12740]
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: remoteproc@5c00000
 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply'
 was unexpected)
Message-ID: <202511291050.Tvu0iocr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
commit: 3d447dcdae53b13b5d7df32c4d1d35971d460008 [11922/12740] dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain
config: arm64-randconfig-2052-20251128 (https://download.01.org/0day-ci/archive/20251129/202511291050.Tvu0iocr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291050.Tvu0iocr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291050.Tvu0iocr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts:602.10-643.4: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pmic@66 (maxim,max77705): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): $nodename:0: 'i2c21' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@60' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
