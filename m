Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB9F2D94A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752838211; cv=none; b=QENuWRKtr/GtR0Om1zgLxPMrRsVzzyPSQlzIzuEZHnBuSYSn1ko39wdHQ5RavfHDitvn6lOVRqWlOtZQXVQqVmAWpnyxrT2YNVZWXlMKQGF2u0WPjs1Jsg0sqLNeGxz6lPCPXVyygZAXZ0pi079u8mFAklZF9VNQGsxpPK/7UEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752838211; c=relaxed/simple;
	bh=BPbUAlJeerYAkvNnFfFDxbLSy0A5GgWirYFA+ufRVTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZaXGPaYl7/zFn8awampS+eq67Aha/15r5L+woOdCL/BA3g4eUHnEPXAfCAe5uuq9Ua9/KuNMPEmKINaRlZAyh3oeeVRzthyRAFnvZsMohqY6PuON4T1QI4u2UniMsxDxkpjIgj17UqXjcJm07ywxPPrS/ubFYBPGZYcxmeUzWzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLoHWp7H; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLoHWp7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752838209; x=1784374209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BPbUAlJeerYAkvNnFfFDxbLSy0A5GgWirYFA+ufRVTI=;
  b=LLoHWp7HLw5NfV9zCe9W3ye4PsJyt6CzqUwmPwuTtwIbEaOZs0HcQd3m
   TCG7u84kGRRDVvNMz7j02Olh2EIicnMC29OZj8tm3o1Q/337F63ILY7nF
   x/70MT0aWn/09ig9U84VfDL3e5crlFoIb/577gTcQEP6WpvxiDWOc0fen
   CRTyI6xNP2trBQBUL5R4fUuh3AFPlz7y4WXqXR2NrnE9f8wJ6JycyqNvK
   cJ5eBoZ2JJjm5wVGvCjh8h3/9gXviZHZg5yPQ4lkBr5DwdG1MuHpona3S
   bU7f8o0qzbt3fcwmT5L6/dleU4E9ERE/98ABnANiUyBeP+fZUyENNiWMX
   A==;
X-CSE-ConnectionGUID: yyRT+KZXRgKq/WawCQkFXw==
X-CSE-MsgGUID: nyzxnvptTA6Cqs2LxDG6Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66478352"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="66478352"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 04:30:09 -0700
X-CSE-ConnectionGUID: Bui3AihmRYi8vrjFolEpkA==
X-CSE-MsgGUID: MulrBua6QJC3Pv9WIYM1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="162353319"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jul 2025 04:30:07 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucjHx-0000tR-1H;
	Fri, 18 Jul 2025 11:30:05 +0000
Date: Fri, 18 Jul 2025 13:29:45 +0200
From: kernel test robot <lkp@intel.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>
Subject: [linux-next:master 7295/10823]
 arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff802000
 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed
 ('phy-addr' was unexpected)
Message-ID: <202507181318.Tjt1juG6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 8a00a173d1a43362ec11e47c09fc5c0b1aa92091 [7295/10823] dt-bindings: net: altr,socfpga-stmmac.yaml: add minItems to iommus
config: arm64-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250718/202507181318.Tjt1juG6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181318.Tjt1juG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181318.Tjt1juG6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:581.10-630.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: cb-intosc-hs-div2-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: cb-intosc-ls-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: f2s-free-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): altr,modrst-offset: False schema does not allow 32
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: rstmgr@ffd11000 (altr,stratix10-rst-mgr): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,stratix10-rst-mgr'] is too short
   	'altr,rst-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sysmgr@ffd12000 (altr,sys-mgr-s10): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
