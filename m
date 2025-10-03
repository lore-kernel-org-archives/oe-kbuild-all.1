Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785863987D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 20:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759524662; cv=none; b=ly6345QCmyrO4EpuMuVJiIk5CBtUJ4sOQSWmj9S/FjSib8ML376sErkI85DT7rXgVuKusgpTr0e6eRItrighwoq0/jlj4pqLNow3ksHjbbjRJw6kwRoKZsu1tu+QNRpn/2ps+52WZ9WxtqJGZ0QUJ2XO3aKio8GtlJcj6qP991c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759524662; c=relaxed/simple;
	bh=yZBi6ZOqQK8HjYNj6Y5xtCI2XfLy8fR0heAO36ACFKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RtnVoJ/ruaUqwt7z4SGQuwOMHs58M+uSXPKvylUnJMoCoGORnNcVtz+P3xBANSbEWl1ei3gONPiluxCJNLIc+spHE+4maCpaIFP0IbUT6dIAvhMXmdFP41f4U1SHUa6RElMnBBOytupo3ACqn5fdfBepyfdx59Wj5WSylXI67y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qni7S7H8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qni7S7H8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759524660; x=1791060660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZBi6ZOqQK8HjYNj6Y5xtCI2XfLy8fR0heAO36ACFKo=;
  b=Qni7S7H8g79luZtW9/M+KnxHuZ106RfGLSI2+cvoj0Q3LKVQsiWiB3Io
   XSlBvzqV4Zi0kBINZ4VfGJgdW0JE29g03Hq0Z1UIEI5PiD/uFMdXJ8JwW
   VNhCpuOVq0mY6XZHx1JQwFTkf6OkwiG/a90iGDplPUHbJJkdepzViUqKf
   7QXQYx4vKMBYX7Uy9mJwsA7SWrSTMBk+Vqby7CMqInS9fTyzqNu6fvQeP
   /dHq+GgGQZLIoYSXRyF4ngTcipk9S3S83/t19AWZlOpNQLm3sSCVo9tR6
   z46r7FcstML+NjSNsejW0cDwyyj2r3zL6rQ6duuraB8oH/ZwqRiHTzWKj
   A==;
X-CSE-ConnectionGUID: u5oA5/AGRQmgl7mZmDGpIA==
X-CSE-MsgGUID: VpmEhOF/RqqtRdkYLPAHbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="84434894"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="84434894"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 13:50:59 -0700
X-CSE-ConnectionGUID: JsPEL8JDR2KC/Emc5clWlQ==
X-CSE-MsgGUID: DiI2g0w1SiuYVHM2UFBLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="179299111"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2025 13:50:58 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4mjw-0004sr-15;
	Fri, 03 Oct 2025 20:50:56 +0000
Date: Sat, 4 Oct 2025 04:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13240/13363]
 arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kr-g-revA.dtb:
 spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202510040434.KzlnjhdR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47a8d4b89844f5974f634b4189a39d5ccbacd81c
commit: 5a329d89d777c398d013bb2f3be76cd5425d67b8 [13240/13363] Merge branch 'for-linus' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
config: arm64-randconfig-051-20251003 (https://download.01.org/0day-ci/archive/20251004/202510040434.KzlnjhdR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040434.KzlnjhdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040434.KzlnjhdR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kr-g-revA.dtb: gpio@11 (dlg,slg7xl45106): 'label' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kr-g-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kr-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kr-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kr-g-revA.dtb: gpio@11 (dlg,slg7xl45106): 'label' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kr-g-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kr-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kr-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kr-g-revB.dtb: gpio@11 (dlg,slg7xl45106): 'label' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kr-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kr-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kr-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB.dtb: gpio@11 (dlg,slg7xl45106): 'label' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kd-g-revA.dtb: gpio@11 (dlg,slg7xl45106): 'label' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kd-g-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kd-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kd-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA.dtb: gpio@11 (dlg,slg7xl45106): 'label' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kv-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kv-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kr-g-revB.dtb: gpio@11 (dlg,slg7xl45106): 'label' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kr-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kr-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA-sck-kr-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kr-g-revB.dtb: gpio@11 (dlg,slg7xl45106): 'label' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kr-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kr-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA-sck-kr-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
