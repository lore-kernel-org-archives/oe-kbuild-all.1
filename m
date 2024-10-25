Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B91F7551
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729860134; cv=none; b=KvhbIukzgSFEnTFpHZgp9oV+y9LNHpTwOpcvrXGyHSR5xAvCZhI1NrwMyWAPRKH3edQ1EaMNgA32IqPidyw/EZgkq2GOJQhBCAonmqP8lzcE/4XnsyBGDH/FyC7JycfLpq63ITlgoC82sXY4Bh/oaDuWfmtUGO5xPcYFjPlbpAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729860134; c=relaxed/simple;
	bh=4qC8VeQFiv8AcyfaDtxTy4ZO3PMC7CmNZApUdznbTAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SAdmSgQdad1VhIwTddCJnOEfEssEz+lsWlxPcpHgsHI+GAjn5wj5TVOaUrNg78Fs+gHxNTr5H3KZ4FtXsx8+1CkSsOyMX+puvvPkYKDab9FAbC+fzzQcIx/nvWMbeEzkExk/2ipfKHGhcVEg3U8Dne1muqONmsakAzunjaxCRfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAOtF1vt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAOtF1vt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729860128; x=1761396128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4qC8VeQFiv8AcyfaDtxTy4ZO3PMC7CmNZApUdznbTAc=;
  b=SAOtF1vtJ0wFREy8mYyHIr02FN2ectgLmMSyvJIP6gmHk5xK0W+xbFuS
   56aDdKeSWG94g9CvCrdtyThRGZGmHKHD1qxY83u2fFEQ1Ud18eLmdNUAR
   kz5zd+9VORwSEfl6NMbihxcnWmKJrEZgi7LRosah5ygZHYz2rlwbkOTje
   BaP3fAtTMIUAaYYYCtjiLtweEawJ9pFQMjEWl7M/LqSLn36vNvF6J0fFS
   d6lpfWf6/vjCJmxhQF53ISAOqskz46HSGXkunY4HgU9Mo8+8/TTKrOdT9
   EKzqSDaxtgK2uCmKqjmtG4fp13PApXLZsYesuz0QpS/KgBTc7WVAnUgyO
   A==;
X-CSE-ConnectionGUID: 1/VWqWt0QrC3a4U6jlbwQQ==
X-CSE-MsgGUID: CNXKWSJHR/e2ktK+azMMOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46992158"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46992158"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:42:07 -0700
X-CSE-ConnectionGUID: fbdYlGDbTYCRjEp3B1OcQw==
X-CSE-MsgGUID: 81in2H+VS8KlnKcMjZ3ZTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80921681"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Oct 2024 05:42:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Jdi-000YGG-2W;
	Fri, 25 Oct 2024 12:42:02 +0000
Date: Fri, 25 Oct 2024 20:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 5065/6766]
 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb:
 clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not
 allow 2
Message-ID: <202410252030.8B2JoTuq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
commit: 0fcd58492f066ad0b0d2a82ce0e3466dd3d1f981 [5065/6766] dt-bindings: clock: ti: Convert divider.txt to json-schema
config: arm-randconfig-054-20241023 (https://download.01.org/0day-ci/archive/20241025/202410252030.8B2JoTuq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252030.8B2JoTuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252030.8B2JoTuq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-apll-pcie-in-clk-mux-7@4ae06118: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@14c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@18c/clock@23: failed to match any schema with compatible: ['ti,mux-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy2-always-on-clk32k-8@688: failed to match any schema with compatible: ['ti,gate-clock']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
