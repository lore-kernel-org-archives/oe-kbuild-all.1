Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4825740
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717839754; cv=none; b=L1YTzx7HKGwOEEdytpcKlJJtK+yrVu+ajNZhwDzPdUFuF+vV0cXxvnPifZwA8Fa0YOjvEqaFgd3+dacn1MHR69GlwtTfBIlDMaxsm+xJ1rWP8sJVtaBZuDNwRxrlQP1khFkpvD9TLhFptGl7sg5O6deYGA8bUVYS9W/UE1ETNtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717839754; c=relaxed/simple;
	bh=HgF+nzlGDP3m45lyUH9fXhKp8y1Dm4/PvKZ2wHq5fww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCjDWMjtzWsUCzMtY6bSFJF+XdK4vctQoRm8srQ1bFMjUj7trAz7UA6CTGf7q+rto9s+uSEynJo7vUuVW1+5xCPxQuXNYrEz+LGG9dx7fhZWUS7vMTEPUf0sVKsCUYH392ej7hB4wfsGI9YiBWNjZbEgXaNWfYoMm+iEtargR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWw5EDWf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWw5EDWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717839753; x=1749375753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HgF+nzlGDP3m45lyUH9fXhKp8y1Dm4/PvKZ2wHq5fww=;
  b=HWw5EDWffntJ2X1bcO2qiCWmBH2Cdo0Yn+AqQaMJY/4TAjd90O+mKKMD
   +7KhrEs53Ib67b1cnR05FNfMMEap9JMPRwmGaNJtKfncaPJk0AEnAYpRK
   ojVq6a+vCilVMi1HTyMptP74SM/Tx+sXfmO2+UoIPBzcax19aC01jAUx/
   TpqCJdorCpEfgmfSSO4LIoLGW/7xzms+nxf5xUOwYpFMNas66SWTG4Pzt
   rFrNa7eWJgc2edgyax/GXlZ2YRqX3tmUUzyozxdyx+6Zyb7sJstYPb05G
   YE//aJF7PMU4gpaywXi/3L2oxrU200UBLpWrUb+NLvmHdQ3gi2rrlZBqy
   w==;
X-CSE-ConnectionGUID: vTYhhu2zTQm0T3fW0jcn5w==
X-CSE-MsgGUID: XqcgP92/Q0+Xbnu+of1f1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25967530"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25967530"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 02:42:31 -0700
X-CSE-ConnectionGUID: G1DCnzQLTBiTXgGAQOGvNQ==
X-CSE-MsgGUID: 1qwM8OhiS3GyPyDaUDipSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="43124862"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 02:42:30 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFsai-0001OA-0U;
	Sat, 08 Jun 2024 09:42:28 +0000
Date: Sat, 8 Jun 2024 17:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pcie-fix-series 3/10] dtbs_check:
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: pcie@2000000000:
 reg-names:1: 'bridge' was expected
Message-ID: <202406081700.txy9hyT1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pcie-fix-series
head:   91793dfd9508b4d9d7b2922cf1d76012848a7f58
commit: c5fcdfdb688d399d144f70de7c92d97c87870037 [3/10] dt-bindings: PCI: microchip,pcie-host: fix reg properties
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce: (https://download.01.org/0day-ci/archive/20240608/202406081700.txy9hyT1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081700.txy9hyT1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: pcie@2000000000: reg: [[32, 0, 0, 134217728], [0, 1124073472, 0, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: pcie@2000000000: reg-names:1: 'bridge' was expected
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: pcie@2000000000: reg-names: ['cfg', 'apb'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: pcie@2000000000: Unevaluated properties are not allowed ('reg', 'reg-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
--
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: pcie@2000000000: reg: [[32, 0, 0, 134217728], [0, 1124073472, 0, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: pcie@2000000000: reg-names:1: 'bridge' was expected
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: pcie@2000000000: reg-names: ['cfg', 'apb'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
