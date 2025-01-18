Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247D27468
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737192771; cv=none; b=q1L1A6488qR4PyUzXmWcjVYMC1j58+MQID/b7t1f8XZLMszbxryu13FvfBuuIg7OOZPeG4IuhkA4cdz5ffGV6KeVVM+qrTiT7V1LOi2U5LJamBpU92ydnQAQ0uAPp142WpMJF6bfRTaCCKGucMvPFIeQ/2oQJ2BD6CFPzffI844=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737192771; c=relaxed/simple;
	bh=+Ed0DCG9VIoCBnZb0l8CX7LDZKt0fW1uKxksN0MxNOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+IM8rA/8T7deTqrOhM46QINfZwImbBAApb6+IMDxrPJs6lXQ7IEuVumjjee7qH1S4cT9cJrtmiPqotES3DRmVR4ppCc0ua+Hk5MPinXgAfRZafnU53JTZp9ttRqpMcCfSCYoEMCapz8NqNxtoLlCGlR2Bampxju8P5cVcfvCGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItGheDjB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItGheDjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737192770; x=1768728770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Ed0DCG9VIoCBnZb0l8CX7LDZKt0fW1uKxksN0MxNOA=;
  b=ItGheDjBz7MtQIRvGHWqbv4K7/Zq2nyD0hVpVUSA68tS6PiRwhyLHClu
   i4HLIRdjqHp5ipIciRUc8nq390tr9jfHm8fuuvhaellTTwdQtedh4PjV8
   7FY5wGQXKox54lRaUQiGMe+fmHPEgRLWViD+5M2sOir8Y32ejjmCDqSNJ
   ZcXrZVbssyDcWwT8mRCxppxJwruJni4sET/8wcNFhlPJ20sI7jsIaha/2
   4HkrvY9h0LCq7MFpXMaM3BkG8waN1yiEpulbOQ+cvp+PexqmJl8YTYuTe
   ouBwhzj5dKDpq2kPZBwcKymglv4c2IVa5L/3zKiVBPpuTDH8WjskE7Awc
   w==;
X-CSE-ConnectionGUID: yFvW7lenSnGl0bw55I5Iwg==
X-CSE-MsgGUID: g9o+tiZhSxaFAa8CplkyuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="55180393"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="55180393"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 01:32:49 -0800
X-CSE-ConnectionGUID: J7UzZS+4ROKVnLtxSWpBuQ==
X-CSE-MsgGUID: 8U/QJ5QsQyaMywX67xIxhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110088746"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jan 2025 01:32:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ5CA-000UGt-09;
	Sat, 18 Jan 2025 09:32:46 +0000
Date: Sat, 18 Jan 2025 17:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 8913/9563]
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks:
 [[27, 87], [27, 36], [27, 35], [27, 88], [62, 0]] is too long
Message-ID: <202501181731.keaGucEM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: 041375bd32561cabcf457b5ed91ddd2965de79ac [8913/9563] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
config: arm64-randconfig-052-20250116 (https://download.01.org/0day-ci/archive/20250118/202501181731.keaGucEM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181731.keaGucEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181731.keaGucEM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [62, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [62, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
