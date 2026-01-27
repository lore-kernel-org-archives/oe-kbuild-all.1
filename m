Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC9E2E1F02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507076; cv=none; b=dUjRghTC6oTCHyTNjgqipEP1Y6M4ynn2kZy9n+SCujEWdh2vOHj4QcUWnO+VSJZuefl2ih5QjAAQsUh6Tmnu5Wk6T1cj7g1d0quTp/bl3A+Nn6vOPQEU6QkXgVYpdfHKprUv54rWnx6cobwZ55lRELOKlgAH4mDgIpYEJ4xohwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507076; c=relaxed/simple;
	bh=cDAWmX/j5GmyfyPIjMFTwEhaAf8lCxovKyIorD5rzoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q4w4rqOYGzdQkqHRT67jXoiGe3ZH4nZ7zqGFG4zvwElLQkAh0YeKP4FtlcSxXUqrBi/+biaq8YeYxZOm5jKUNzE6FRxMOVvmWTa79M99FahHELBqjWJ3mk0XRhd2vgsCBj1/SV/GP78J3DFp5+0dMSa74YbU8XnKSjdSKKh/9cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbA7s1+v; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbA7s1+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769507074; x=1801043074;
  h=date:from:to:cc:subject:message-id;
  bh=cDAWmX/j5GmyfyPIjMFTwEhaAf8lCxovKyIorD5rzoA=;
  b=NbA7s1+v5NBwe6+B8mvsOzKypuCyX8s8QZgVAyKjk5+Y26X7IeBMGquD
   3JIfarE1ISQcEZE0VhsCYgy/AeVMAla7zHJImY1L0K8AAXXz4bsRMTJPM
   hoF6EyyStkijGrCYaYgqlrUJgoEgcmJXYUpbmo2brgKYxOKN94Lc4YjqY
   on0Y/oCMjPAgGqZ1OGclDtJOlxfUWPKHo2nq2yxD36PXH//8nlOqkd4gx
   uLfaDQ0OAfGHnMBWW2SW55VwmhW8oQ5vkrPpEShU5jDMOl8X1eDg8khEF
   sjQtM+9Bso3VadKD2XL9eP4lRu9fRBS2Y1LPuulwSZlWEiR50zl/fweOq
   A==;
X-CSE-ConnectionGUID: Oaq0g63DTGSF69QUo+kpUw==
X-CSE-MsgGUID: zotYE7DBRoSklFczMbn+8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88275916"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88275916"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:44:34 -0800
X-CSE-ConnectionGUID: BdjgLrkgQRepjBS8GEv1fw==
X-CSE-MsgGUID: BTO8/63jQG+nNr7flz5LMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212046750"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 27 Jan 2026 01:44:31 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkfcb-000000001l3-05Qk;
	Tue, 27 Jan 2026 09:44:29 +0000
Date: Tue, 27 Jan 2026 10:44:24 +0100
From: kernel test robot <lkp@intel.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 6400/9596]
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000
 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' does
 not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202601271054.JWq5ff8o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   615aad0f61e0c7a898184a394dc895c610100d4f
commit: dfa93788dd8b2f9c59adf45ecf592082b1847b7b [6400/9596] arm64: tegra: smaug: Add usb-role-switch support
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260127/202601271054.JWq5ff8o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271054.JWq5ff8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271054.JWq5ff8o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
