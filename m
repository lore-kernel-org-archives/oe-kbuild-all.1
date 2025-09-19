Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A834BA29
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758245971; cv=none; b=AHE7ys9kZz8MLzI5pxrjT+NAwM3e+8mRTRDVHIakv/s/Xv4QcIbMRRB1CJVoPi+50B0Du3+Vgq2/O/wOUcuZAb92PluwBoqNGQuyBgXWC+XvbMUl+ByrFucttWVhLHFpzO0w0JKglP9cScjGorvaAsXsDzpFf1YHFZu2b1wg61Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758245971; c=relaxed/simple;
	bh=kpMA0OUfhGvDlPvTEfyUisP6lMMvKoVWEIgMEGMrXBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZJvyAw0mljuSW0mikR5Q+hLaGhynvowfymv1S3GMJr0DwouboH+PIQIJNX/01yoPRA423BpaTOnOeE8uVUtWqW1GaNAQ2tY5C+Ci2lCNW6jfEqP90IefxC+R/hbkcKH5o7hwe9dAiYAaFFMC18ZJdbTJTqsdHf0INxaCJgfPk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqVtKSw0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqVtKSw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758245970; x=1789781970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpMA0OUfhGvDlPvTEfyUisP6lMMvKoVWEIgMEGMrXBI=;
  b=CqVtKSw0VwlOZKrRNFBmuuF0krjLVwYXFt6LGLWFSsY8ngJ4glbk4/Kp
   nuzsB148gnfeSVARRc5GnM91VCZzQfs+CRmO99qtIdq+4hz1K3uFD5no7
   w3KgYLeVzVfeZWOwVYYRIYxhppHkb0DyNAQ0y4CE0tcajl0m8UvRj7coS
   rjJ0gYvSNnj9CGYUQ1AX/usQp2rida/epdsZ12r6AmG+6fRV05ikfMsp1
   xTv34f2cvXqW6/yru9gDhnWv+Km3G1q9+iVEL8Gl4hGz0THfNOfuQvDFy
   piL45qrQUSRrvozHvTBE4leOFhQ9Sy9h+ebeXgoMb2vCGhY/r5ljk+rh4
   w==;
X-CSE-ConnectionGUID: NRzewQFqQbCq924jlr0LOA==
X-CSE-MsgGUID: Y8SxnAXzQXSFLRZZPb4kTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="70839645"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="70839645"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 18:39:29 -0700
X-CSE-ConnectionGUID: a/bzvC3+S6esUt2u9RTjmQ==
X-CSE-MsgGUID: 8nMM98JxSTSvbduFt8ZU/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="180988131"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Sep 2025 18:39:27 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzQ5t-0003t1-0i;
	Fri, 19 Sep 2025 01:39:25 +0000
Date: Fri, 19 Sep 2025 09:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 7404/10189]
 arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: i2c-mux-2 (i2c-mux-gpio):
 Unevaluated properties are not allowed ('i2c2mux@1', 'i2c2mux@2' were
 unexpected)
Message-ID: <202509190923.UgSxMzx5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
commit: 688dc0342532464239de99197583ccc9f9d3c64c [7404/10189] ARM: dts: imx6: rename i2c<n>mux i2c-mux-<n>
config: arm-randconfig-052-20250912 (https://download.01.org/0day-ci/archive/20250919/202509190923.UgSxMzx5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509190923.UgSxMzx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509190923.UgSxMzx5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: /soc/bus@2100000/i2c@21a8000/touchscreen@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: /soc/bus@2100000/i2c@21a8000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: i2c-mux-2 (i2c-mux-gpio): Unevaluated properties are not allowed ('i2c2mux@1', 'i2c2mux@2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-gpio.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: i2c-mux-3 (i2c-mux-gpio): Unevaluated properties are not allowed ('i2c3mux@1' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-gpio.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: panel-lcd (okaya,rs800480t-7x0gp): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: panel-lvds0 (hannstar,hsd100pxn1): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: panel-lvds1 (hannstar,hsd100pxn1): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: /soc/bus@2100000/i2c@21a8000/touchscreen@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: /soc/bus@2100000/i2c@21a8000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: i2c-mux-2 (i2c-mux-gpio): Unevaluated properties are not allowed ('i2c2mux@1', 'i2c2mux@2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-gpio.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: i2c-mux-3 (i2c-mux-gpio): Unevaluated properties are not allowed ('i2c3mux@1' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-gpio.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: panel-lcd (okaya,rs800480t-7x0gp): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: panel-lvds0 (hannstar,hsd100pxn1): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_max.dtb: panel-lvds1 (hannstar,hsd100pxn1): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
