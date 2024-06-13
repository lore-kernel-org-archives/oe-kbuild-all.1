Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44883CB9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 02:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718245650; cv=none; b=bjXu59rS59SOdfIN8xCCxUhmiIGvCpBDief3GageYmfdmSrTcIqL17dMA7QzuSexCOllBg+0A1Kku+YknL/hVEeyrh67YZqFmeBwSieHqXb4R3M/X1v/6ITk1BB1zgfU6oUnalcFkhDwMUpoWSX7taTpoURBUhoVee1DlJXUe7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718245650; c=relaxed/simple;
	bh=MyitdAs5w/1SdP26W9R94YJNxmj8FpYKEuUoh3KiQQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ydjx7zhnN/Qdsi06Q+zGuksV3WThxNfYQf8LazNYYoak7MveKZKDrA3L6xhd6sUsEGFIRs1+MmW56e0yKkmVu9z9BYuFVFPNI2EEX4FuHt5SWPVeSjmiaTIXDauJw5Kzcj6CcaTyck9RSgmFt3QRx0FBu4qfFQD5zl6U1f4/cyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GojyD2fG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GojyD2fG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718245649; x=1749781649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MyitdAs5w/1SdP26W9R94YJNxmj8FpYKEuUoh3KiQQo=;
  b=GojyD2fG+SNO9FqmvYhas5GGcNqsQXWxRSmYxFYjbe2DCJBMCemgQT+G
   QSvQGYihmPpG5PzT7FMLRo7WxZ9mH398CsNT8ZkDUAuEztaGy1GDgHwt/
   0wJ6ZT35YozfqoWck8IS3NWuSEbrv92hU1drs4LAsOVscDxeFaCJtXcPR
   X54pk8XxAqe8AtUdq9r0D7sdJUNc403GqRsLXSAM8625GOpWxd/EWZGtC
   vSxi5v/pme0d/HGHXantXtyPnByxoTG23VxQR9JfUerzIgj0nWiVbmqmG
   RXERdhVvS7CLNm0uPFwEEgu/KiyIAKgrwQZ7Vs0fAakL0F+uStQROGmjN
   A==;
X-CSE-ConnectionGUID: neVI7kAtR4WWfDAzrkVoYw==
X-CSE-MsgGUID: Oao5+LwZQB+HUfMFiNGAJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="37559260"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="37559260"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 19:27:28 -0700
X-CSE-ConnectionGUID: 5oLI2+0HS/6QFZdpCsZB8A==
X-CSE-MsgGUID: TXidP5QqRvaIu9QSx+vAJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40089612"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jun 2024 19:27:27 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHaBP-00027o-2y;
	Thu, 13 Jun 2024 02:27:23 +0000
Date: Thu, 13 Jun 2024 10:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 2/67] arch/arm64/boot/dts/ti/k3-am69-sk.dtb:
 pcie@2900000: device-id:0:0: 45074 is not one of [45069, 45071, 45072,
 45075]
Message-ID: <202406131046.2agFK8tq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   7e02c8fab1601d4c2cc7664e26d93fce2e5228cc
commit: 3d8a27b48060505e8c538d4343df3fd5b39c5f80 [2/67] arm64: dts: ti: k3-j784s4-main: Add PCIe nodes
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240613/202406131046.2agFK8tq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131046.2agFK8tq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131046.2agFK8tq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pcie@2900000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pcie@2910000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pcie@2920000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: pcie@2930000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pcie@2900000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pcie@2910000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pcie@2920000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pcie@2930000: device-id:0:0: 45074 is not one of [45069, 45071, 45072, 45075]
   	from schema $id: http://devicetree.org/schemas/pci/ti,j721e-pci-host.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
