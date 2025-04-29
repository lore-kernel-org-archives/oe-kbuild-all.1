Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E89E2D3A76
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936642; cv=none; b=b7E25Nr+gz6K1tON4GAiVwX7ckDQOnb0P693oEYgs2iTyM20rJ0eReP0B0zSbZgLxeTFuAbtjsDCoH2KEoYxhid1LpdZla9MvH04fxUcAmC4VJsZeXuR9VAFDGS43DDZOJDBsEp9CzbNNf4mvuEuPZQt1BHNIR24aziOV5wqTYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936642; c=relaxed/simple;
	bh=3QWx8SkXGzJWX7U3tGcyG77hUsMzMxisD537jzmTqV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JdT2g9eoEeZKKVWbJhuiKZcTg62kbyRId3PhJrZoq7GALJZLZrEdK8Sc0uWsXYFp2RRUHFzU6+mVDSTZLM4NHyFVQcbyPOK125b5iItL6q0PjPH7WJ21dtmOOeyh2n9taTRfE/ME8yFcOAfWO2wzzKoHUs4Mdwnhqf8u74D9PdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUVSAntk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUVSAntk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745936640; x=1777472640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3QWx8SkXGzJWX7U3tGcyG77hUsMzMxisD537jzmTqV0=;
  b=HUVSAntk8LyZ3APJRUGagLwKs18zmx1pWEB3+cZ+9QafGDotjaAZUHmg
   PflYtutFeJkg0glGDn/qRQ9ky1uCx+XgGtvOuIoTtCdxhMeY9C4jXuUvc
   YHLy6dyxOW2fofwk8up3EfIBAfxW2Sn1nE6MBZ4JlAGIklcQjWELW6CDe
   3xMde8JXUhxhlhV8KOE5TaLQKBT1GEdQOmyEodGTNuLvC7PKHMjFrO7v4
   WncNV/9SpDFz+O12aTaCkD0/nrTn+TUf2O+NkEb1nh6XNVtGOtZMyYn3M
   3+d2goPA1S+mPPlcG1zcau23aHbeU2kRT7SjZt2a/QRO8D6qL89oWemlU
   w==;
X-CSE-ConnectionGUID: Fh4S6zVnTge3n8PhGPHU9Q==
X-CSE-MsgGUID: xlPAWVjVQ86QytAZNZVc4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51229169"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="51229169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:23:59 -0700
X-CSE-ConnectionGUID: Ox5raAr5Re2zXa2BAjsGHA==
X-CSE-MsgGUID: bt/Qo6d8Qfeyi9+f+Jkb8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138644872"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 07:23:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9lsJ-0000m7-1P;
	Tue, 29 Apr 2025 14:23:55 +0000
Date: Tue, 29 Apr 2025 22:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [linux-next:master 5289/6719]
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed00000
 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names',
 'renesas,vspx', 'reset-names' do not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202504292245.a28xohIm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33035b665157558254b3c21c3f049fd728e72368
commit: c1f22633c28f347f1933e75ffe1635adf7f4f30e [5289/6719] arm64: dts: renesas: r8a779g0: Add ISP core function block
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250429/202504292245.a28xohIm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292245.a28xohIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292245.a28xohIm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1364.12-1374.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1393.12-1403.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1422.12-1432.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1451.12-1461.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1480.12-1490.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1509.12-1519.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1538.12-1548.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1567.12-1577.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2298.12-2308.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): clocks: [[8, 1, 613], [8, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): interrupts: [[0, 474, 4], [0, 476, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): resets: [[8, 613], [8, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1364.12-1374.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1393.12-1403.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1422.12-1432.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1451.12-1461.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1480.12-1490.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1509.12-1519.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1538.12-1548.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1567.12-1577.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2298.12-2308.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed00000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed00000 (renesas,r8a779g0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed00000 (renesas,r8a779g0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed00000 (renesas,r8a779g0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed00000 (renesas,r8a779g0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed20000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed20000 (renesas,r8a779g0-isp): clocks: [[8, 1, 613], [8, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed20000 (renesas,r8a779g0-isp): interrupts: [[0, 474, 4], [0, 476, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed20000 (renesas,r8a779g0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: isp@fed20000 (renesas,r8a779g0-isp): resets: [[8, 613], [8, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1364.12-1374.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1393.12-1403.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1422.12-1432.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1451.12-1461.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1480.12-1490.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1509.12-1519.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1538.12-1548.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1567.12-1577.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2298.12-2308.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): clocks: [[8, 1, 613], [8, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): interrupts: [[0, 474, 4], [0, 476, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): resets: [[8, 613], [8, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
   	'renesas,r8a779g3' is not one of ['renesas,r9a09g057h41', 'renesas,r9a09g057h42', 'renesas,r9a09g057h44', 'renesas,r9a09g057h45', 'renesas,r9a09g057h46', 'renesas,r9a09g057h48']
   	'renesas,r9a09g057h48' was expected
   	'renesas,r9a07g043' was expected
   	'renesas,r9a07g044' was expected
   	'renesas,r9a07g054' was expected
   	'renesas,r8a779g0' is not one of ['renesas,r9a09g047e27', 'renesas,r9a09g047e28', 'renesas,r9a09g047e37', 'renesas,r9a09g047e38', 'renesas,r9a09g047e47', 'renesas,r9a09g047e48', 'renesas,r9a09g047e57', 'renesas,r9a09g047e58']
   	'renesas,r9a09g056' was expected
   	'renesas,r9a09g057' was expected
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: /: failed to match any schema with compatible: ['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0']
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed00000 (renesas,r8a779g0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): clocks: [[8, 1, 613], [8, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): interrupts: [[0, 474, 4], [0, 476, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: isp@fed20000 (renesas,r8a779g0-isp): resets: [[8, 613], [8, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1364.12-1374.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1393.12-1403.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1422.12-1432.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1451.12-1461.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1480.12-1490.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1509.12-1519.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1538.12-1548.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1567.12-1577.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2298.12-2308.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed00000 (renesas,r8a779g0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): clocks: [[8, 1, 613], [8, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): interrupts: [[0, 474, 4], [0, 476, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: isp@fed20000 (renesas,r8a779g0-isp): resets: [[8, 613], [8, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): clocks: [[8, 1, 613], [8, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): interrupts: [[0, 474, 4], [0, 476, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): resets: [[8, 613], [8, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): clocks: [[8, 1, 613], [8, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): interrupts: [[0, 474, 4], [0, 476, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): resets: [[8, 613], [8, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
   	'renesas,r8a779g3' is not one of ['renesas,r9a09g057h41', 'renesas,r9a09g057h42', 'renesas,r9a09g057h44', 'renesas,r9a09g057h45', 'renesas,r9a09g057h46', 'renesas,r9a09g057h48']
   	'renesas,r9a09g057h48' was expected
   	'renesas,r9a07g043' was expected
   	'renesas,r9a07g044' was expected
   	'renesas,r9a07g054' was expected
   	'renesas,r8a779g0' is not one of ['renesas,r9a09g047e27', 'renesas,r9a09g047e28', 'renesas,r9a09g047e37', 'renesas,r9a09g047e38', 'renesas,r9a09g047e47', 'renesas,r9a09g047e48', 'renesas,r9a09g047e57', 'renesas,r9a09g047e58']
   	'renesas,r9a09g056' was expected
   	'renesas,r9a09g057' was expected
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: /: failed to match any schema with compatible: ['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0']
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed00000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed00000 (renesas,r8a779g0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed00000 (renesas,r8a779g0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed00000 (renesas,r8a779g0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed00000 (renesas,r8a779g0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed20000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed20000 (renesas,r8a779g0-isp): clocks: [[8, 1, 613], [8, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed20000 (renesas,r8a779g0-isp): interrupts: [[0, 474, 4], [0, 476, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed20000 (renesas,r8a779g0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: isp@fed20000 (renesas,r8a779g0-isp): resets: [[8, 613], [8, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed00000 (renesas,r8a779g0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): clocks: [[8, 1, 613], [8, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): interrupts: [[0, 474, 4], [0, 476, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: isp@fed20000 (renesas,r8a779g0-isp): resets: [[8, 613], [8, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
