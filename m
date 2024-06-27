Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A334A1A2FA2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719530210; cv=none; b=hP77zp7p3ZLB4aK3loWKpEOE48oNaybHu+UJTNBPg66p6KJMyDAvAAqgKZMQ0yB31zO94hBjIlCAw6ASlP3qztCrbHIztv2EErCrTWg46RHBc6Mn9zYIkxp9TeIWhzTujkH54ITTlU6RFdnDH6Jv1Aa7l30zu+zJUfQ6qIoLPUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719530210; c=relaxed/simple;
	bh=pMiwQ/g1BYpFE+owJ8inO3FWdKXoVlSc2ptKP/3vUb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VjqZKryT+UN6pb7wGs7iHCJkpaiRSriimhNPD87hcg+hcKpZWnDI7PbV3gjHRuet7L8/fVWSS7j7ISr6jrS7jwKUKYVldfhzOJWCYR1UNaiIq+bc9YNchPqFILp7aNqpRuOlAzHM/ZlvGWMp9O6N7LmLEySvMZopglmjpJGPIic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yzjly346; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yzjly346"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719530208; x=1751066208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMiwQ/g1BYpFE+owJ8inO3FWdKXoVlSc2ptKP/3vUb0=;
  b=Yzjly346GFQh03VQ515Qy/CQApeF6s8Zr1vUmZf/n5/OOm/9yMYEconQ
   lrGeU6GVmYcKhb+pYMaIK59O9aQvA67Z61gJu2NRwhZClbB9Y1AJLUS0p
   gahHV/1GXtM9rilt1n4fNl7yIscjT6nIHpeuSo+iE4mBTgjlsF20l47uk
   pezqguk4GjF/qVjdl2w4tufyCWC8XgbgvrIcKhMR8BIq7mU5RBuJuXrAt
   RD3c2EVsGNoFFgzFtnjdKoOL+5KA8AXVeKHYFNaFO6YgRPpOSgIoPXGE9
   mWWvru9WmnfgXowSqIA2eLd02ZPFxyBs5gZxVyQPPxz1C7sQzt/x/n/Y5
   A==;
X-CSE-ConnectionGUID: UBStyjfgSpeCsY8wn5bnJQ==
X-CSE-MsgGUID: yAv0sOuMRGSf15z2h80p9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="42113334"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="42113334"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 16:16:48 -0700
X-CSE-ConnectionGUID: OI21hnFhSGaKG5FwEzF+Qw==
X-CSE-MsgGUID: ipQX6IMxQWiZqOtSzPOynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="45186146"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jun 2024 16:16:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMyM7-000GcU-2g;
	Thu, 27 Jun 2024 23:16:43 +0000
Date: Fri, 28 Jun 2024 07:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [linux-next:master 8329/9027]
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /pcie-ep@fe150000:
 failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
Message-ID: <202406280710.UM3PNqsz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
commit: 2fe9fe4e54f5763b8b681478dda9ac61fd42ecaf [8329/9027] arm64: dts: rockchip: Add PCIe endpoint mode support
config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280710.UM3PNqsz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280710.UM3PNqsz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280710.UM3PNqsz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1244.7-1252.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: regulator@42: Unevaluated properties are not allowed ('rockchip,suspend-voltage-selector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: pmic@0: Unevaluated properties are not allowed ('regulators' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: codec@1b: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5616.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: sound: 'simple-audio-card,hp-pin-name' does not match any of the regexes: '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: vcc3v3-sd-s0-regulator: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /extcon-usb3: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: pmic@0: Unevaluated properties are not allowed ('regulators' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
