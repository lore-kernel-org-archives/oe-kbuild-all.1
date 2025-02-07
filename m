Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB440C03
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 04:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738901166; cv=none; b=iiyWXuzWoKao2TeUbFBkiucxBeZCBTeQdPEk5Rb/DwyknjwYrxtSCU+3HYLdmlrhL+G6msNqM6UQLj/RnkyriPpxVWUh5Vcv8b14+gtUKNDvBMvT21rB8std8/ZO/h226qvEFtOaZG2NOI5f0PTSQVCvGi8mOzFyYOB3clLrRDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738901166; c=relaxed/simple;
	bh=FNTbU3QkmSWeOtIvEN+4ldWKl1NJnCGuJq9nnV078lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZGiki1Lyotsnme04VYdZo7nsk3vFIY2xRcWnQ5PK8EJFYQ6cEoOd4USXFjgv7CG/azzI6DlZbFN9PYJ+VdWcg2KSv6U9TX8P46NQKuN7OyD4si0osbs4eAY5oNKvMzacOicUSvGXHSRaEJx/AyLUlv17pd6iH8wHfrIu1XwxbJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARORSHBw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARORSHBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738901161; x=1770437161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNTbU3QkmSWeOtIvEN+4ldWKl1NJnCGuJq9nnV078lk=;
  b=ARORSHBwSB3voyYBIdT2Mch0uoiD0fHI9pM2AR5z9D3kFd+c/2hPraDu
   sLrmHfJZgRDAFavfVfbCpQ57Pux8bUv6adn2GM3G7dMtgG/VVN23Ibtwz
   OR5jVSSdjKWL3gz4WeOUV9xVUd6F7GN2v80EaljnyzgvicEa2AvSEWqac
   5ulv8xaB3buiWreYBbTgwHHfKZJWmp3I0gyFXWi6rChxUj3ITsNFKNGhm
   RpDo6ZMPcXNxQLmHr+frc003uTrzYSBKHmt+AnWFm1EvB8KRUxImxTRAk
   23iweLIrdA4PmPg62K/jB4e0Uj8Tw2QFN638E0zzFs4l79qtNmNR95RyV
   g==;
X-CSE-ConnectionGUID: UXBQMJp+RC24Lp8ORlANzg==
X-CSE-MsgGUID: ekGqVq9gSUeZTjZI5VXVAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56951947"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="56951947"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 20:06:01 -0800
X-CSE-ConnectionGUID: NychEF05Q5WFTKPKfNkUdA==
X-CSE-MsgGUID: /17fY7vMRmuLXXenVljRNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111609496"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2025 20:05:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgFcq-000xjL-2b;
	Fri, 07 Feb 2025 04:05:56 +0000
Date: Fri, 7 Feb 2025 12:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: scmi: 'protocol@80' does not
 match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502071227.Dme8URVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71
commit: 519d40b68a563eb5b4397797a33214ad8b9910c9 [170/170] CHROMIUM: arm64: dts: mediatek: mt8196: add scmi device node
config: arm64-randconfig-051-20250204 (https://download.01.org/0day-ci/archive/20250207/202502071227.Dme8URVO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071227.Dme8URVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071227.Dme8URVO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /firmware/mtk-svp-heap: failed to match any schema with compatible: ['mediatek,secure-heap']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: scmi: 'protocol@80' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/adsp-mem-region@90000000: failed to match any schema with compatible: ['mediatek,adsp-reserved-memory']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5: failed to match any schema with compatible: ['mediatek,mt6373']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/mt6373-auxadc: failed to match any schema with compatible: ['mediatek,mt6373-auxadc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/mt6373-efuse: failed to match any schema with compatible: ['mediatek,mt6373-efuse']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/mt6373-consys: failed to match any schema with compatible: ['mediatek,mt6373-consys']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/mt6373-pinctrl: failed to match any schema with compatible: ['mediatek,mt6373-pinctrl']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/second_pmic@5/regulators: failed to match any schema with compatible: ['mediatek,mt6373-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6685_mfd: failed to match any schema with compatible: ['mediatek,mt6685']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6685_mfd/mt6685-clkbuf: failed to match any schema with compatible: ['mediatek,mt6685-clkbuf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc: failed to match any schema with compatible: ['mediatek,mt6685-rtc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@1c032000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30020000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30021000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@30040000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'mboxes', 'mediatek,gce-events' do not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
