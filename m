Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8499175D53
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 02:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777430109; cv=none; b=j2PxyD7fwVx6/s9o3DAcocBafGTUKQdo0q4kW5OLivvZWtHCIijCXiVMoTL+wXrVx0rAYCPmhcbzim1U+TXLqItKM9VOMuALOkBr5ZJ/p+gY573jXy4KSI/LqXSWsZZ8Ign65tQ9P1aSkhOOjdp8fUkuJFPMblKPyJSpqNuBoHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777430109; c=relaxed/simple;
	bh=kyxERN46Y0YX6tkUSpdPN+OGiGarZJ/1onjjVFNzfMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FrYtEvh076nbavhH395I2/XL2Ww+/fDXwv7q1A9xKR4tZefdGTbrrRUfszgSNLvXdJwAtRraPek7v0w6QaaYshgbcg5tzxHWaH/dVMIzm/M+cxhq2p+fxc09mna0cpjWdZr0Bkc+lupjTiNGlgEtNBoReGW9hmMEMz7zXPygrBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zmyz+EhB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zmyz+EhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777430108; x=1808966108;
  h=date:from:to:cc:subject:message-id;
  bh=kyxERN46Y0YX6tkUSpdPN+OGiGarZJ/1onjjVFNzfMM=;
  b=Zmyz+EhBuhigPn49Q66DWCebHsFkwQPAQ8hEemTXQQMOLXYEtDfPgtcc
   RD75sU1GGtKOnVkaHg0Q2CejdJzepcLkaZ2oVwZedrv9h7QSlUwZAS+bP
   d/Bi51JEcmnalG8H5VgrnFKLmz9Tnzwbx48HC1DGttCTnToaTJyIFUHOT
   0u50V3ZahkQJhxH80FKryrwdeQcyPILBr3VIfoabrm3L4VdN5nqL6aNta
   iIzn+O+rqpDyHTb0R1zKm/wJjOyGsDer+4OlBUKHwpZAMRNeYkqycpEpT
   Bba0nMCEji857P5mk7SL8Cn3K+EWLTB7prtKClIvDVf7Zf3QIdpnCT4Cc
   w==;
X-CSE-ConnectionGUID: CZN/mQfXSaCRqzPP1MGYtw==
X-CSE-MsgGUID: 8nROT+r6TymI0qZqJeAk+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="77519940"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="77519940"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 19:35:07 -0700
X-CSE-ConnectionGUID: HO7EhV9UTCmnpF9ObCex0w==
X-CSE-MsgGUID: 8rd+wcW6SJOz4x3urafAlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="233105776"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2026 19:35:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHulT-000000004OP-1OZr;
	Wed, 29 Apr 2026 02:35:03 +0000
Date: Wed, 29 Apr 2026 04:34:50 +0200
From: kernel test robot <lkp@intel.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: [linux-next:master 914/1887]
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0
 (amlogic,t7-peripherals-clkc): clock-names:14: 'ext_rmii' was expected
Message-ID: <202604290443.OLNAOxQD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9974969c14031a097d6b45bcb7a06bb4aa525c40
commit: cba0da6d0c2a28384e8fca2e6679932c524b5267 [914/1887] arm64: dts: amlogic: t7: Add clock controller nodes
config: arm64-randconfig-2055-20260427 (https://download.01.org/0day-ci/archive/20260429/202604290443.OLNAOxQD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604290443.OLNAOxQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604290443.OLNAOxQD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:308.34-556.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:308.34-556.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:14: 'ext_rmii' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
--
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:308.34-556.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:308.34-556.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:14: 'ext_rmii' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
