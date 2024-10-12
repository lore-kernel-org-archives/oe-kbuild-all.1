Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA13BA49
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 01:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728695572; cv=none; b=Cx+OgcKFWO1L64OzxjvT/lt2EkBDPcegGYj1ATlw0CPD14QIFYEbb+ofWl9ILJdc1D/4dDLdT8XjiuGbxv7ULazkOATUO4EF2/mUt20NE/2XUgTrw4l3nIGvTomLz47dqp+CMnyNaWDtj8nMfjBNitYg0FdJAvSVhgYhG96STq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728695572; c=relaxed/simple;
	bh=skU5Ae3Qm0/gDYUkkP/TKQsagnQEb7nS2tsQ840nTOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DKozsAXWFDxaWdrYvaEBL4n9opSaLb2pw99X4EUZoe+i//02qBUnths3hgyHeuF4TpktBmuqU5xXIkI5Qa3cDBDXw5B+oJJJnuH5arHswWBQiSM36HK3VkbCEGrT86UEmcLswabbKAMrG0Md9noL1eN7C+1ga4cIzuHLzBYB024=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEVovpxZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEVovpxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728695570; x=1760231570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=skU5Ae3Qm0/gDYUkkP/TKQsagnQEb7nS2tsQ840nTOE=;
  b=dEVovpxZNKQJuNCApu9Z6e6GargwA2ZW3BxuFFyE9PVTCwd323Gd117K
   AcHfyNqt2I72E0BwJqlOw3Ntv5RyRtO0MMdtEDu1YhaNKWr9GtGI3xSmd
   9aaWTPCWV6jk69+W3ZEmpiHoL/SjBNJTH9SB9BBGSXYsDCsuOIGjQSfQu
   UDubXZQZPU81sYfbX4acEX5QG11ZqOe/v98zH/Z9MV8SVODd4uMX+VfzS
   Q+nZouX4XWWn7vWR+3Fa67wOg+p9hIROMq1SNJaadCHxvGimaFKFutf16
   +ju+bJFI9VMsGfN6jHzZ0OelmurvlegxF6xfDh/r6B4WY7xw7C4AASDK1
   Q==;
X-CSE-ConnectionGUID: SNX8+8+5RvqZhr4OLyKZag==
X-CSE-MsgGUID: j0rbxgCLReeLhqJd+mmSJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39486712"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="39486712"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 18:12:47 -0700
X-CSE-ConnectionGUID: Kscb8qzAT6ilYvyrALaFsw==
X-CSE-MsgGUID: ZTIXN0/dTQWBz6tnjpBDnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="81887356"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Oct 2024 18:12:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szQgV-000Cuv-13;
	Sat, 12 Oct 2024 01:12:43 +0000
Date: Sat, 12 Oct 2024 09:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 3035/4143]
 arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel: compatible:0:
 'sharp,lq150x1lg11' is not one of ['admatec,9904379', 'auo,b101ew05',
 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2',
 'hydis,hv070wx2-1e0', 'jenson,bl-jt600...
Message-ID: <202410120908.gXjy3Ya3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 15bda06bc93fca828e5f11ca6b773fed19e45b8e [3035/4143] dt-bindings: display: panel-lvds: Add compatible for Jenson BL-JT60050-01A
config: arm-randconfig-052-20241011 (https://download.01.org/0day-ci/archive/20241012/202410120908.gXjy3Ya3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120908.gXjy3Ya3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120908.gXjy3Ya3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel: compatible: ['sharp,lq150x1lg11', 'panel-lvds'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/sharp,lq150x1lg11.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel: 'data-mapping', 'height-mm', 'panel-timing', 'port', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/sharp,lq150x1lg11.yaml#
>> arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel: compatible:0: 'sharp,lq150x1lg11' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel-timing: clock-frequency: 'anyOf' conditional failed, one must be fixed:
   	[50000000, 65000000, 80000000] is not of type 'integer'
   	size is 32, expected 64
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
