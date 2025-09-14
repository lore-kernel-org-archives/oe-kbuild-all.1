Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88441E515
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757888085; cv=none; b=dF99FIHLCJSksqgCAmOthHCL+EA+OsnjIC2qPD3TqjxFSKKKuYQwX/YDVjZnzQmdUxqS3B0b0q8UBh7e1Z+z+Jl5vfOgcr89FYPFGFcNQkWWA52t90hQnC+4GmCMBQDNNVtRpXcs5DxeHKmYGdO+Q6SqYXG65k2b+awYx5oP3EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757888085; c=relaxed/simple;
	bh=px1huRXbzxUgVXjYDtiKCXxQMb8bHfkFH2vFoUhF9Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3ZK9dDFcEUOotZNJIsyoPj0Q+AxTKtq7Zf4DY7Z6FubV/rdMNRwl4Y3zwmNvOyOu5tkX/fQ62w61HDvPzi25rXwzbckflMBwI0sy1lqoBbqF7pYHgVNlHvWvZd0jtbRibMTeCmZBlJa+c56wFwr9uifXLQGzk50pMSrhlHZA1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXGvgUfe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXGvgUfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757888084; x=1789424084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=px1huRXbzxUgVXjYDtiKCXxQMb8bHfkFH2vFoUhF9Cs=;
  b=WXGvgUfepBfKjKKG+HB54AzIH1+Hnq87Irup4Z1dEDaK//puHAWwgQrr
   KztOWZEfwSZYXa+E/c1/O/1fbhfC37ppW4JsEQc+u16ImLUN4SOMTawBu
   AEpX77cec/Yhzbc1aDhdg7E4iFolj+y45lreQrH5c88l0vFzdoCVbVinJ
   dMaPWJkH9p3+JCgBsWEZRYPZMPA2IekOQJBMG3i3e72oK+iPm2IJNqdpw
   tTzxnDFqLlbYr/l7SMmdbb0tUD1gNXJUI494jHCCSLinHIhSUwyIOkfXt
   BoikL8EGivEiT5IhxDLWNfbWbTMhuFIfW5wL2B/vKuXVhMNOV7eGCmQAj
   A==;
X-CSE-ConnectionGUID: yE86+6hOQKGHU5ikAd5NQg==
X-CSE-MsgGUID: rfwi1pNYSbWoSugzvHyWcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60011425"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="60011425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 15:14:43 -0700
X-CSE-ConnectionGUID: VHS4WEsJRwWA53Hbhun4vg==
X-CSE-MsgGUID: iWDrI95uRo2mWWorVpSWtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="178815767"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2025 15:14:42 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxuzX-000000001sz-3pzE;
	Sun, 14 Sep 2025 22:14:39 +0000
Date: Mon, 15 Sep 2025 00:14:07 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000
 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed
 ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode',
 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx...
Message-ID: <202509150052.83cSS7X0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8e86454f068ad3187350cd9fb81aca87249d02c1
commit: e93230d0597a2736f1123cd7790a4e549f3049a8 [1/1] arm64: dts: qcom: sa8775p: Add interconnects for ethernet
config: arm64-randconfig-2051-20250906 (https://download.01.org/0day-ci/archive/20250915/202509150052.83cSS7X0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ffbd6162103041697ce7387029f321d3a466ca34)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509150052.83cSS7X0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509150052.83cSS7X0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a4f8800 (qcom,sa8775p-dwc3): interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a4f8800 (qcom,sa8775p-dwc3): interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
