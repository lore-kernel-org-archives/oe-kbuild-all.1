Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408E2D97AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 10:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560737; cv=none; b=X9FzMtQ7Fxrg9Ef5X7gjRLVNrrlKPkIFFBqiCH4QCQJa6aq0UC46V1mh4EEn8cREgxS5LuPUtZlh0WxV0bKH5EQnDpjx8CMiKPydmaqC+79IT4B0oyV+ijg4bv/hlYSGbmOzlCDwBhRSsChivX2TlYM5RdnnCoHKlAq+Na9mZKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560737; c=relaxed/simple;
	bh=wy+ydCnX51eYkk+Kgmc9ooJVvYGpMmbWHCLbM0aekfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sl1iDyfZQ9vL6UpDrlOERo0lOihnmoDIE6Erex4uGIi3sDx9MKjq9Ut6c5DgsmmiCpQpD8JjOkxpgyS1AGPfAAjUyDxCPmH2xx7xCPInQBFI592xdItgIs5Q9R+YXVNc7zqaaIAlESHamKIKvkSW15/Fq8wgcXtugjX5tnaQIs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwnisZIB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwnisZIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768560735; x=1800096735;
  h=date:from:to:cc:subject:message-id;
  bh=wy+ydCnX51eYkk+Kgmc9ooJVvYGpMmbWHCLbM0aekfw=;
  b=UwnisZIBgVtLKmThLNhNG1Ydy1gFkpIVGtDDCLvGvOzkuzl8CW66kT5W
   r75gs1iwPsal0ljBYZo/qTousiL5ZrTQ8MHYaiPaJskXSQwrYoPMOyKV8
   FqCaPxBE8UjzYF6bioL0ppCcVu8J3rEi8pI+S6c9/gAeEUOMOIFPQ3ARb
   BOp6pk3rlIwMzmSIH7uEGGVyqPFUulpFA0aZB2S4vehwxsUmdr548zmuj
   irYexvcwteTXw9WGwYfRgQ+r9z11F6rhxTP+R3jC9eSgbV+9mMw900aK0
   gAaI4o8q7flDLFymbWSzj8spW3dH+6HujHy6NrNF14ftGNGfp3HyvwGtx
   g==;
X-CSE-ConnectionGUID: C9m9p1r2RUy3XY3jW9XmdA==
X-CSE-MsgGUID: 2fuRIVx1TNyDVfAD+27YWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="57428153"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="57428153"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:52:15 -0800
X-CSE-ConnectionGUID: ANn+yqJvSmaeccDPNVjJXA==
X-CSE-MsgGUID: X9bnOu9HTbS5BxG0TbjZUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="209709023"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Jan 2026 02:52:13 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vghR4-000000001kr-3xgt;
	Fri, 16 Jan 2026 10:52:10 +0000
Date: Fri, 16 Jan 2026 11:51:25 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5634/6771]
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb:
 /bus@0/i2c@31e0000/audio-codec@1c: failed to match any schema with
 compatible: ['realtek,rt5640']
Message-ID: <202601161159.WBXj0R1F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
commit: bc5a847a80d45b1f77c60c738e05521f0dee453c [5634/6771] ASoC: dt-bindings: realtek,rt5640: Various fixes
config: arm64-randconfig-2055-20260115 (https://download.01.org/0day-ci/archive/20260116/202601161159.WBXj0R1F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161159.WBXj0R1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161159.WBXj0R1F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /bus@0/i2c@31e0000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
--
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /bus@0/i2c@31c0000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
--
   arch/arm64/boot/dts/rockchip/rk3368.dtsi:870.17-878.5: Warning (graph_child_address): /vop@ff930000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: /i2c@ff110000/rt5640@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
