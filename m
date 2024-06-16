Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F83D6B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 02:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718504955; cv=none; b=ntj1Jbx0Y6O3XegBvY/CrKXOXXuWt/rZyDiyENxldtE5mgZMDf/ERM0iP7XcnHk1GzO6WmngOTy++CQb1AUVwCqSZbeCWMZPw3PBUab6jmuOeFbAaYAZ1dVh0qhec2dY3EDbgaUgcK7HJ44aNmjKH9IaJo/VKtq0voRaoIhirZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718504955; c=relaxed/simple;
	bh=m5AiUN72w711i0d3xoNygH9eaG4kWVOnisuCjaiUiCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/VS3CMFJ/WlwIDQEZeuqPq8s63xeEIIlbYy7psrCSXwSVaZ8xxGPl4Nl8OSOQWnfY0h/7e2dHyqyB8a33IIBb4Kd3e8aTVUOMOTd/g2TAAGYhcod8QUXgx8mBqEyv1bYZXdmkbrUf9w+DTnRwoPsNmOlXyMHRy4QL1RUhFrcTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEmpoHQS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEmpoHQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718504952; x=1750040952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5AiUN72w711i0d3xoNygH9eaG4kWVOnisuCjaiUiCI=;
  b=cEmpoHQSHDqpp8CjF8k31+FoCZHP8up8/BzMYFI8HOliwY4RxyLurNvL
   fYKZJpJyN9eZYN4FgRhONOnAwRs2qJF2Ee20+vrIYEAFJG4F3hI9xCp7q
   wddCdxT/OYmIRjiO3YHG06qRw1zuDg+Z4LhTs+Z7JKvaTdKbjddAkWqia
   aXt7I5SLApnE1GhtPI462OZfr+5ITl+7oGPEwSwwijfjMjoEUBuQMKZGQ
   GfT7bFn6h+aoWAxHaEiBnhj+SxJmmKY9ymTiwcWT9mQ5PvdqG7ARq4RlC
   E5TIrx3720McBv9iokkHJPWSQqPEDkWwa7gjI/R3dfsvxypWKNEOdHxjG
   g==;
X-CSE-ConnectionGUID: Kb3S4P0CSZ+xd6v4ALORSA==
X-CSE-MsgGUID: qpS42eX3QjyQl1US2lKCKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15513499"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15513499"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 19:29:11 -0700
X-CSE-ConnectionGUID: 4hWzBMzOTtitvfnyyTydOw==
X-CSE-MsgGUID: JZxEqKCIQw6+IAkAHX45wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45818917"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jun 2024 19:29:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIfdj-0000kU-2h;
	Sun, 16 Jun 2024 02:29:07 +0000
Date: Sun, 16 Jun 2024 10:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 2/67] arch/arm64/boot/dts/ti/k3-am69-sk.dtb:
 pcie@2900000: device-id:0:0: 45074 is not one of [45069, 45071, 45072,
 45075]
Message-ID: <202406161049.9lykezj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   8086474caf5dc2570a947669acf226d319cd0651
commit: 3d8a27b48060505e8c538d4343df3fd5b39c5f80 [2/67] arm64: dts: ti: k3-j784s4-main: Add PCIe nodes
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240616/202406161049.9lykezj9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161049.9lykezj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161049.9lykezj9-lkp@intel.com/

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
