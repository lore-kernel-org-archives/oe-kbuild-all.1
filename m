Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018981CA84
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 03:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731986361; cv=none; b=FOyZxe/fFPGMQguFamnDOWstP9C2DGQSOME4xFmN1apyTNyF9iKOM9D7DETN/HcYYws3qzvU9rSb/7TBdrVjd53kCJ+EpoZd9rzHpp/JHT72fOWW+1TwPaHOI8UZLgMRuyLO6zEhswhlXwyxwWnfFe+WWYLalJSbwE2LzvDIb6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731986361; c=relaxed/simple;
	bh=l5PrIL239MsnMz+JVz1iXFCCrM7rY62RKgIBD/GIAZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VziyViuY2CSX2tk9pVQ8k7R/E3ymeff1Q+tiHLwqcDQNgOZ/hmLt43z91YRqivSQeAZjSuN/YzbJNaQhvv8IVLM1DP2h0MM4JEzpPwltBQsZI2aLsQkitiVaUn3M6cr47lwrm6LGFHpKJlPTYA38E8xPnnyuvkWP9sqOqqC9K5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHTENFGd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHTENFGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731986359; x=1763522359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5PrIL239MsnMz+JVz1iXFCCrM7rY62RKgIBD/GIAZQ=;
  b=DHTENFGd1If7ks4XKG/BV0Lz0oOWJud6oG7SFkt0/+5nH43xfFE8DfM7
   0P8GAXhUBseq5miqPCbx+sSc9z5LluZOZQA2eRlGbkihUHNtzbEmAV/vn
   Le6P5xa9X0nT92Xj7lVlWIFDBDLYq4OFJd4nrpR76fG0iyXh19HAoj4G6
   KXB5nTNlNmgjB7fNQInuYHMdp2imgBGCAdZWjUGmGNU3EY5lfcDobmUU0
   WtkNes6HqXJaawBRt59vMcmDwuqvoNgJg/HOMS0UfycuKEyQTSLEPMIB2
   NY4rkoOBcJ99cnqMoDqsn7ptJIqkcdAcfrBVaus/c4K+21aDhFXIFipEi
   w==;
X-CSE-ConnectionGUID: zW0aD3nVSgSbvTRq9fvf3Q==
X-CSE-MsgGUID: Cfd+ld8tQxOzMxH7bO/ZJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43038403"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="43038403"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 19:19:15 -0800
X-CSE-ConnectionGUID: 4kbida9iSjKwl1Pzqy4W1A==
X-CSE-MsgGUID: oHZiZDpYS4qeZDUWFZPs9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="93493320"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2024 19:19:13 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDElR-00005O-1f;
	Tue, 19 Nov 2024 03:19:00 +0000
Date: Tue, 19 Nov 2024 11:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wen Zhiwei <wenzhiwei@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484]
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: hdmi@ff3c0000: Unevaluated
 properties are not allowed ('#sound-dai-cells' was unexpected)
Message-ID: <202411191127.ObKwERZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8a039651010897592567f5751c4e706ab794e9c0
commit: 64795309e27dbacfe680b214a21e54192fdc8739 [1484/1484] arm64: dts: rockchip: Remove hdmi's 2nd interrupt on rk3328
config: arm64-randconfig-051-20241119 (https://download.01.org/0day-ci/archive/20241119/202411191127.ObKwERZI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191127.ObKwERZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191127.ObKwERZI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:704.17-712.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: pwm@ff1b0030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: hdmi@ff3c0000: Unevaluated properties are not allowed ('#sound-dai-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: /phy@ff430000: failed to match any schema with compatible: ['rockchip,rk3328-hdmi-phy']
   arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: ethernet@ff550000: Unevaluated properties are not allowed ('assigned-clock-rate', 'snps,txpbl' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:704.17-712.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: pwm@ff1b0030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: hdmi@ff3c0000: Unevaluated properties are not allowed ('#sound-dai-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: /phy@ff430000: failed to match any schema with compatible: ['rockchip,rk3328-hdmi-phy']
   arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: ethernet@ff540000: Unevaluated properties are not allowed ('snps,pbl', 'snps,txpbl' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:704.17-712.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: pwm@ff1b0030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: hdmi@ff3c0000: Unevaluated properties are not allowed ('#sound-dai-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: /phy@ff430000: failed to match any schema with compatible: ['rockchip,rk3328-hdmi-phy']
   arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: ethernet@ff540000: Unevaluated properties are not allowed ('snps,txpbl' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:704.17-712.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: pwm@ff1b0030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: hdmi@ff3c0000: Unevaluated properties are not allowed ('#sound-dai-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: /phy@ff430000: failed to match any schema with compatible: ['rockchip,rk3328-hdmi-phy']
   arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: ethernet@ff540000: Unevaluated properties are not allowed ('snps,rxpbl', 'snps,txpbl' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:704.17-712.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: pwm@ff1b0030: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/pwm-rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: hdmi@ff3c0000: Unevaluated properties are not allowed ('#sound-dai-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: /phy@ff430000: failed to match any schema with compatible: ['rockchip,rk3328-hdmi-phy']
   arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: ethernet@ff540000: Unevaluated properties are not allowed ('snps,rxpbl', 'snps,txpbl' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
