Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC5F377562
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 22:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772232459; cv=none; b=L+ZCs82yE9LXwuSmjPEJVOK2TOPuSXxl/72NF/L9Ikbo5Q+2S/LFERcvK1CZ1FbAEcGDCvSHBNHLsJ/crgLiV7Pt5YVUG5zY6/YsZUmmlj4DGHcaVqoxsBXFSsWFDhLeh0ksnVy+7R1AUqyZ4/+jNG/a5Wy9T8lBKM3RbryFkbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772232459; c=relaxed/simple;
	bh=iPX9L6xOnXUmYvm+DAQjZGEfC7TzpI0M3vFygoeX8Pc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nyNPwHUqBEAuzDNbe562FbTL42mb4FPu18iq+3mC/IXpS/D03e8wNlqf9rr1tjrVuOjH5YVS5o865Gl/xhp2RM3KgT5C6mH1hk7H74hn4+r1H7z9TBGbKuLin3R6w6NHLlaySYdFWXbe/3N/TLsfzMKHXSfr8b32gYljJoiulq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWu+U//k; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWu+U//k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772232458; x=1803768458;
  h=date:from:to:cc:subject:message-id;
  bh=iPX9L6xOnXUmYvm+DAQjZGEfC7TzpI0M3vFygoeX8Pc=;
  b=CWu+U//k9t5j5fyIpXX5msATYH1MQ4zzIoTvCCmPb/Pb+KPz7IEAL+IL
   0U+yQupfMLcEkpSAtkV+mSpa4INjObZMjhWDIYrlcGrOg8HChaGbgmY5w
   TGUkB+3lOvE6oHy1nOgp2yq85uepKOuzkPZ1eaAdDpoimi4HrKTd1nHbD
   DFEeiJXQOlTtprBl5nINSgPQpc8NU9gq5YxjaQND6l8FujoGtjvMuVV6P
   WB0Ut8eeNdeRWQ4ZhRzWG3PqMORaSvcQuO6vHbwMLKvacZWN5cVfo7LNN
   iSLZboABkmJjrDdODOvIEzaVPzEi1IKPO5/fkeywPQIGxUbtqLkOmRcB1
   g==;
X-CSE-ConnectionGUID: 7sH+8aNQRoStfxU3CTfZmQ==
X-CSE-MsgGUID: diPv6bOpSvKgpI8IYTGaKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="60897410"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="60897410"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 14:47:37 -0800
X-CSE-ConnectionGUID: ZE7jt3C8TPSfdjzh9yDwyQ==
X-CSE-MsgGUID: M9nCQrdcRXmh8tJdiOOuVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221533701"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Feb 2026 14:47:36 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw6cP-000000000dZ-0ooD;
	Fri, 27 Feb 2026 22:47:33 +0000
Date: Fri, 27 Feb 2026 23:47:16 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: vi@54080000
 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the
 regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
Message-ID: <202602272349.3hH2NOZM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   781b2c569af65bdd28b176733884d86c455b912e
commit: 6b670e53ac6ecd531d90324e9ef87a029d2c98b9 [3/3] dt-bindings: display: tegra: Move avdd-dsi-csi-supply from VI to CSI
config: arm64-randconfig-2053-20260226 (https://download.01.org/0day-ci/archive/20260227/202602272349.3hH2NOZM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602272349.3hH2NOZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272349.3hH2NOZM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: vi@54080000 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
--
   	'google,nyan-big-rev9' was expected
   	'google,nyan-big-rev6' was expected
   	'nvidia,tegra186' was expected
   	'nvidia,tegra194' was expected
   	'nvidia,tegra234' was expected
   	'nvidia,p3701-0008' was expected
   	'nvidia,p3834-0008' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /: failed to match any schema with compatible: ['nvidia,p3450-0000', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: vi@54080000 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
