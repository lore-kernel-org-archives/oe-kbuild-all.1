Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C92BE043
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 20:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382667; cv=none; b=KSsAyAV7/kqkFTQha5tFSXG0WZTDbC19MOn+kpTElqaXp95jOdg/irItKYrgDY5qAdDLGPt47CWCbgLNMOpRGmektj3PxQToVmQRdhWGYa1Nn2akqHBnMF/z246/yqjP5F3E8m6nIAmtLhjEXdHOKekgnjQvBcluIPMnkKBa9ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382667; c=relaxed/simple;
	bh=Z//ytOSsVDMmCZ87vQZDERcCtt7v4s9O8/uF8s0qkWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MAKpuANlyjllMZjIsPPqM3DSf3zqkkXef7bhzSTBBWRS3WFboSyuymK5axHph4oRMug95nedBzJQWuRVWCwfTZM1Zjr1zDODSuBUhzzHqLhgf/QGddSFGu6kH/idOlo/iPPgO0LYh8CEc20z5pHRZJro4C8kMvGi5xd2jtwYTJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dn0SGTo0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dn0SGTo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774382666; x=1805918666;
  h=date:from:to:cc:subject:message-id;
  bh=Z//ytOSsVDMmCZ87vQZDERcCtt7v4s9O8/uF8s0qkWs=;
  b=Dn0SGTo0VsD5zNIuUcxXo9rEnyLwN6ZqCkR3npHCmD546sbM8FnZG47+
   q6b2EihmR6EfeTIqu3CRZv9Ct+zSDPnMtaCvgAuvzM9BQIgh/9jPOnhtg
   Yvr+XHQ6KDecZPbH7aly8E6x6scaiGE+oOY3sJ8JQYk6GfLrFeKBR94Mk
   E5mt/PeaOlhw+061/mej5mYN5Mf+Vx6cFWuw0NkNeFaX+U1B7s4WMNePh
   kNl88o52nhkON0QIkQKol8ZKlGyi1EYtm6vS+D2bq9rTfncH2vlCk0PE6
   eh3ywQnQbPItJmPOjtTRO579MwhbOZ+g2+CErce+1oqZvHjE0BpE5iJmN
   g==;
X-CSE-ConnectionGUID: JolRQyExQf24mddhkh4NXQ==
X-CSE-MsgGUID: /za5KV3IRJWyjgkA1f9YJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86488412"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86488412"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 13:04:25 -0700
X-CSE-ConnectionGUID: s8F+WA4xTr2G++7NMSvDGQ==
X-CSE-MsgGUID: 45bS0IdSTvCO/uOSoMLEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224720575"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Mar 2026 13:04:23 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w57zA-000000006wz-3tpz;
	Tue, 24 Mar 2026 20:04:20 +0000
Date: Tue, 24 Mar 2026 21:04:17 +0100
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 6410/8611]
 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000
 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202603242134.b1Jbh8LK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
commit: 0d248e0696a7b7398a8567e1cbb207778db467d2 [6410/8611] dt-bindings: phy: tegra-xusb: Document Type C support
config: arm64-randconfig-2055-20260323 (https://download.01.org/0day-ci/archive/20260324/202603242134.b1Jbh8LK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242134.b1Jbh8LK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242134.b1Jbh8LK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'oneOf' conditional failed, one must be fixed:
   	'connector' is a required property
   	'port' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
--
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'oneOf' conditional failed, one must be fixed:
   	'connector' is a required property
   	'port' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
