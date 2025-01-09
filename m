Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F138A1FFC7F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415041; cv=none; b=V70qan/QZQS68Q4sr24T9qFe3WrdQMTEtq7P5u7wBNHhAhVoqRPhZa7Dz1bnP5knYVScMvKyC0fKtWQVT9FooDy996cxAuulF4mCNSaSLwWb0yYKVWtOMLSaeJ6wCfpsUPWFph4YXQFJ7q0v6HsfMU8Qi+KlL4kspQhkjbOyoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415041; c=relaxed/simple;
	bh=jRY0i2GlRElsOxA4tenPZx8ID8XhaEdaJ3k8zYV+mz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MWzSDI1hd7XRBeU+KDo+TrfLHe1sxiv87m6gsMWGCRxRFEKd646WuF4FXSSZAlqLjS0AD2TX0DrwvTQtpUTUTMwIBcXwLjLjnRXnmnJOaPE8thfwGdMN3YzUg51tPRz4UOWkILm+xsekUD9hXzx5tYkB/Gn9kkhCKy71tWrB39Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eii3uJmt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eii3uJmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736415040; x=1767951040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRY0i2GlRElsOxA4tenPZx8ID8XhaEdaJ3k8zYV+mz0=;
  b=Eii3uJmtKtzWCqhqyU/r52uq05UcIHm4fVdVHmAccWt5SBr1MOeKmA2y
   5FIzUxYtBAs3UtqaEmj46DiunmD+jJMRaO6tBb0UAKnXDk61+GCrm/uTh
   +VWiiH4ZSH25+Ku6YbwYaRgn/eXkzFCCHrw/nDhJIKDWjf2gYmKff9QFM
   1zUyLFWzw1isrUDI8Lr7V3xX19efX0MOB72n85mrWtZIMk17X0SEPwOwG
   GiigQSQav1sLO57+Vip+/Tgawi8dxbnZKRgUYMeEok9+U5mEZQybFz4AA
   90/eqU6kQgtmPv6SJKdbtEUKFnhbXkiPekALqnoxFv+Emm6ADAa4wLQVr
   g==;
X-CSE-ConnectionGUID: 0joLrSraSFStyCqqpqLi/g==
X-CSE-MsgGUID: PJgMrT4hRa+tt0pr0Jx3rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36825372"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36825372"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:30:39 -0800
X-CSE-ConnectionGUID: oXRKi45rQT+FCWIzUPJHcw==
X-CSE-MsgGUID: TSwlqq+ISNCO/N2xyOX+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107968883"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jan 2025 01:30:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVos8-000HJT-0O;
	Thu, 09 Jan 2025 09:30:36 +0000
Date: Thu, 9 Jan 2025 17:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 6394/7509]
 arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sysmgr@ffd12000:
 cpu1-start-addr: False schema does not allow 4291846704
Message-ID: <202501091748.L2W2RwE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
commit: 456f3000f82571697d23c255c451cfcfb5c9ae75 [6394/7509] dt-bindings: soc: altera: convert socfpga-system.txt to yaml
config: arm64-randconfig-051-20250108 (https://download.01.org/0day-ci/archive/20250109/202501091748.L2W2RwE5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091748.L2W2RwE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091748.L2W2RwE5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: rstmgr@ffd11000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,stratix10-rst-mgr'] is too short
   	'altr,rst-mgr' was expected
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: rstmgr@ffd11000: altr,modrst-offset: False schema does not allow 32
   	from schema $id: http://devicetree.org/schemas/reset/altr,rst-mgr.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sysmgr@ffd12000: cpu1-start-addr: False schema does not allow 4291846704
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sysmgr@ffd12000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/eccmgr: failed to match any schema with compatible: ['altr,socfpga-s10-ecc-manager', 'altr,socfpga-a10-ecc-manager']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/eccmgr: failed to match any schema with compatible: ['altr,socfpga-s10-ecc-manager', 'altr,socfpga-a10-ecc-manager']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-s10']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/eccmgr/ocram-ecc@ff8cc000: failed to match any schema with compatible: ['altr,socfpga-s10-ocram-ecc', 'altr,socfpga-a10-ocram-ecc']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/eccmgr/ocram-ecc@ff8cc000: failed to match any schema with compatible: ['altr,socfpga-s10-ocram-ecc', 'altr,socfpga-a10-ocram-ecc']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/eccmgr/usb0-ecc@ff8c4000: failed to match any schema with compatible: ['altr,socfpga-s10-usb-ecc', 'altr,socfpga-usb-ecc']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/eccmgr/usb0-ecc@ff8c4000: failed to match any schema with compatible: ['altr,socfpga-s10-usb-ecc', 'altr,socfpga-usb-ecc']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/eccmgr/emac0-rx-ecc@ff8c0000: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: /soc@0/eccmgr/emac0-rx-ecc@ff8c0000: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
