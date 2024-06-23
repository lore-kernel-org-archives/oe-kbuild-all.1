Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02343D518
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 04:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719117705; cv=none; b=Jlu9mKmCj6vVau5h/lJktbym/uNj0Q/fv4DSTXvebl2OiWjIfPJdo0+6BKWEJr2RakGPieiR6JiA7Yj+p9zN7Jg4FAoLZ8NnjUd91Vkx73cK3u5/HbDTRu/lO/LAFrcsLVI8dBYCkVag3Cdw9kWRr/ahxL7gAETsQ2W6ZJV9iL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719117705; c=relaxed/simple;
	bh=AMr4ZaJOpOpHj3ic/+JF0HPPubZq51F1PM2HJcDtWZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4e2nzHdy8XbML+ckAYiJGZx/eZDk6OVavCd/vf2C0KlYVPE8YE+/P5v8/wJzCPHsB7jc5boHo7Vh0pyI5ZzLdGjnVrfbkjC3jezJl1vAU/UiJ7Uhnd18wamePbzvAumrXZsFIzgHCK4h9UW/H1a0Kcog91sOi/QdO4Iyr+BcEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/zJ+UNb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/zJ+UNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719117703; x=1750653703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AMr4ZaJOpOpHj3ic/+JF0HPPubZq51F1PM2HJcDtWZc=;
  b=m/zJ+UNbJSM1sxc2p+xn4oZEQkIsEd6uiYX8Hb4/Tep+ddtw3dx/JtCd
   M9ssxE63Msxhaz1dW/TXuuFZq0GxjPLt9fQWBzp+GvgYSfcC8SKvIK4vU
   Lkuneu+0ZrrCfAQC7g53xynaFmdqDrKlE9RL45IWPMH7ZLA/dpzcAJdM4
   K7oz5ycBD31KYQB2igrN+IqC4Q6hB6nb7dZNGAFmgd8XJkoxEJoytrCBD
   w3ft23OsHw1DWfRqKPuxrSNfMJXWuRp83GO3riExQP8UFABgYisrCVWnZ
   HkxwoK22Kt3nkzfbdrPgqdgqVvuzbtvZ0d0YllnxgtgAu02CLWRVsptkb
   A==;
X-CSE-ConnectionGUID: CnfuEu0RQy+gJQHhXFQ1dQ==
X-CSE-MsgGUID: weSf8NvQQ3uAJ+rXt/KQcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="27525062"
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="27525062"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 21:41:42 -0700
X-CSE-ConnectionGUID: ED9q7rpnTpe51ndIP4lPAA==
X-CSE-MsgGUID: vUeqCSpFSP2sYzE/Xa8fWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="43650092"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2024 21:41:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLF2n-000AGA-3D;
	Sun, 23 Jun 2024 04:41:38 +0000
Date: Sun, 23 Jun 2024 12:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Vidya Sagar <vidyas@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [morimoto:renesas-bsp/v6.1.94-2024-06-18-2 344/663]
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@140a0000: reg: [[0,
 336199680, 0, 131072], [0, 704643072, 0, 262144], [0, 704905216, 0, 262144],
 [0, 705167360, 0, 262144]] is too short
Message-ID: <202406231230.qAMJJTdR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.94-2024-06-18-2
head:   5e7236cba4333897587247b8cb1c26e5e90fb4c0
commit: f5d934942234a2b4e8f309914bf183317328d2b8 [344/663] dt-bindings: PCI: tegra234: Add ECAM support
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240623/202406231230.qAMJJTdR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406231230.qAMJJTdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406231230.qAMJJTdR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ahub@2900800: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: /bus@0/pwm@3280000: failed to match any schema with compatible: ['nvidia,tegra194-pwm', 'nvidia,tegra186-pwm']
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: /bus@0/pwm@3280000: failed to match any schema with compatible: ['nvidia,tegra194-pwm', 'nvidia,tegra186-pwm']
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: hda@3510000: clock-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: hda@3510000: reset-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@140a0000: reg: [[0, 336199680, 0, 131072], [0, 704643072, 0, 262144], [0, 704905216, 0, 262144], [0, 705167360, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@140a0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@140c0000: reg: [[0, 336330752, 0, 131072], [0, 738197504, 0, 262144], [0, 738459648, 0, 262144], [0, 738721792, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@140c0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@140e0000: reg: [[0, 336461824, 0, 131072], [0, 771751936, 0, 262144], [0, 772014080, 0, 262144], [0, 772276224, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@140e0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14100000: reg: [[0, 336592896, 0, 131072], [0, 805306368, 0, 262144], [0, 805568512, 0, 262144], [0, 805830656, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14100000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14120000: reg: [[0, 336723968, 0, 131072], [0, 838860800, 0, 262144], [0, 839122944, 0, 262144], [0, 839385088, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14120000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14140000: reg: [[0, 336855040, 0, 131072], [0, 872415232, 0, 262144], [0, 872677376, 0, 262144], [0, 872939520, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14140000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14160000: reg: [[0, 336986112, 0, 131072], [0, 905969664, 0, 262144], [0, 906231808, 0, 262144], [0, 906493952, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14160000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14180000: reg: [[0, 337117184, 0, 131072], [0, 939524096, 0, 262144], [0, 939786240, 0, 262144], [0, 940048384, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@14180000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@141a0000: reg: [[0, 337248256, 0, 131072], [0, 973078528, 0, 262144], [0, 973340672, 0, 262144], [0, 973602816, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@141a0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@141c0000: reg: [[0, 337379328, 0, 131072], [0, 1006632960, 0, 262144], [0, 1006895104, 0, 262144], [0, 1007157248, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@141c0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@141e0000: reg: [[0, 337510400, 0, 131072], [0, 1040187392, 0, 262144], [0, 1040449536, 0, 262144], [0, 1040711680, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: pcie@141e0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: spi@3270000: Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/nvidia,tegra210-quad.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /bus@0/pwm@3280000: failed to match any schema with compatible: ['nvidia,tegra194-pwm', 'nvidia,tegra186-pwm']
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /bus@0/pwm@3280000: failed to match any schema with compatible: ['nvidia,tegra194-pwm', 'nvidia,tegra186-pwm']
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: hda@3510000: clock-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: hda@3510000: reset-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000: phy-mode: ['10gbase-r'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@140a0000: reg: [[0, 336199680, 0, 131072], [0, 704643072, 0, 262144], [0, 704905216, 0, 262144], [0, 705167360, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@140a0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@140c0000: reg: [[0, 336330752, 0, 131072], [0, 738197504, 0, 262144], [0, 738459648, 0, 262144], [0, 738721792, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@140c0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@140e0000: reg: [[0, 336461824, 0, 131072], [0, 771751936, 0, 262144], [0, 772014080, 0, 262144], [0, 772276224, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@140e0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14100000: reg: [[0, 336592896, 0, 131072], [0, 805306368, 0, 262144], [0, 805568512, 0, 262144], [0, 805830656, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14100000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14120000: reg: [[0, 336723968, 0, 131072], [0, 838860800, 0, 262144], [0, 839122944, 0, 262144], [0, 839385088, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14120000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14140000: reg: [[0, 336855040, 0, 131072], [0, 872415232, 0, 262144], [0, 872677376, 0, 262144], [0, 872939520, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14140000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14160000: reg: [[0, 336986112, 0, 131072], [0, 905969664, 0, 262144], [0, 906231808, 0, 262144], [0, 906493952, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14160000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14180000: reg: [[0, 337117184, 0, 131072], [0, 939524096, 0, 262144], [0, 939786240, 0, 262144], [0, 940048384, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@14180000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@141a0000: reg: [[0, 337248256, 0, 131072], [0, 973078528, 0, 262144], [0, 973340672, 0, 262144], [0, 973602816, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@141a0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@141c0000: reg: [[0, 337379328, 0, 131072], [0, 1006632960, 0, 262144], [0, 1006895104, 0, 262144], [0, 1007157248, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@141c0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@141e0000: reg: [[0, 337510400, 0, 131072], [0, 1040187392, 0, 262144], [0, 1040449536, 0, 262144], [0, 1040711680, 0, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: pcie@141e0000: reg-names: ['appl', 'config', 'atu_dma', 'dbi'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra194-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: regulator-vdd-12v-pcie: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
