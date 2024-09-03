Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF45126BFF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403667; cv=none; b=Q8tTb7KQSMAWopyz5A/ME8xYjtmIRAPLv75Ht4FNif6Y3TzvwKYXhGM1MmP0HIJXICNBv0DFHfh0O3d7d7a6E1v6xxX6oSdi2gPntE/pjXUCnsazWGy2f/A9cIZh/1xg5k9yNPalQrU68LFXHHIEW3+zudJnQBFFXvCs8mORFMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403667; c=relaxed/simple;
	bh=7u630TqIQRF2hhYfY40UXuRrgMR22ZwnnyXkn5pXOUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2VVimEiE3byEMyLyFsoaPl/FZrN2ZwFTU/KLbhtskutJ+DNLlf+TgIFNcNij/RbaxQs5BL15Khx/r/q8LmbxVWT7YVHBHmM7YlLrisWlnZUycP+o/q/aQTPWMjsuIqWukucIw1zbHn6HZUYilO/Qrhjma4wsXT2RayNUex66Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFXpuKBr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFXpuKBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725403662; x=1756939662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7u630TqIQRF2hhYfY40UXuRrgMR22ZwnnyXkn5pXOUs=;
  b=NFXpuKBrIguTxowTkM5QC6iKoKX0n4ll7J2sCo//E9DXPB4S12p8dliO
   NqxK7Oqb5K29q6TMfGm0u3Yj+833jDCX9oxq4cZaJTm2SSZYCC7jbezq7
   lp8FN0cD8qFCz82Y4Dm95t7IOOtt74lu0NfGh2H1yRV9jRhPFxuAYpdl3
   d8EJ3HEttT3psbSPK1GESFrmhz8pp/OLapgU+uGMKZiH6LrYvjxhKH5T7
   KDof7F1IbS5KXKF4EbrK+lV2GAWZprRpkzdD17V8loMadHGiJ6JNeMiw7
   MPwC+Io/YgvnPBxFlNj1Nijcx1WeR6ZS41FqZDiDq6bkHIvimvgL1OMcm
   g==;
X-CSE-ConnectionGUID: meEmbCAwSEmOrgeTDEaQ/Q==
X-CSE-MsgGUID: JlREbt03R4OVFXRXjk358Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23911656"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="23911656"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 15:47:41 -0700
X-CSE-ConnectionGUID: 7ITnHn7xTnuNdvGJcltTRw==
X-CSE-MsgGUID: B8uRoWWvQMWNsmNMzX4zwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="95865164"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Sep 2024 15:47:39 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slcJE-0007JM-03;
	Tue, 03 Sep 2024 22:47:36 +0000
Date: Wed, 4 Sep 2024 06:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 7200/8795]
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: pcie-ep@33800000: reg:
 [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576],
 [867172352, 1048576]] is too long
Message-ID: <202409040609.Om8GX6Ue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6804f0edbe7747774e6ae60f20cec4ee3ad7c187
commit: a39758af7714661e62b04a248c93e748f19cd185 [7200/8795] arm64: dts: imx8mp: Add dbi2 and atu reg for i.MX8MP PCIe EP
config: arm64-randconfig-055-20240902 (https://download.01.org/0day-ci/archive/20240904/202409040609.Om8GX6Ue-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040609.Om8GX6Ue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040609.Om8GX6Ue-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: /soc@0/bus@30800000/mmc@30b40000/wifi@1: failed to match any schema with compatible: ['marvell,sd8997']
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: typec@3d: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/extcon/extcon-ptn5150.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: /extcon-usb0: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: panel-lvds: 'panel-timing' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: sensor@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: sensor@10: 'VDDL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: pcie-ep@33800000: reg: [[864026624, 1048576], [402653184, 134217728], [865075200, 1048576], [867172352, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space', 'dbi2', 'atu'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
