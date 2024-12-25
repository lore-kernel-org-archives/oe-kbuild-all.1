Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F6425949A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735165476; cv=none; b=tfDRaKG3r0wS8Rx1YBHALLxsvSHZdeiZYlDsHhIXFSE9O6UP6FicKYDNdXlCwNZWUY/QmvMS8aZ7rLgnUhrn4TGrHLOHgNx31s+zpqkSBZkwmUE0LO1ek0h53ePt/DsSpp7rh0kU0oSr4GDu7H4gvGEFlH7OuMa+iXqJ2wn+lDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735165476; c=relaxed/simple;
	bh=wA+gkKAIPnct+XfDxtthRdFNQ+IWcXAJO2hrRpK8mEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QrUhSe+Go5+xjq7uON/c41KibPi7BsSVV56F2slMiwgw6MgRduSiH/x/mZ9IxO8HJ9BEZ967TFjKcaJehpKOMaeQ2V/uEG5iR+uPwhYw3KL6FL0+/iuh5J8WT/MAetI328F2vz8tqbV2sFsY6YE5jCzmiaPdI0xsActLmYJHv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJYKnER6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJYKnER6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735165474; x=1766701474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wA+gkKAIPnct+XfDxtthRdFNQ+IWcXAJO2hrRpK8mEk=;
  b=gJYKnER6j+SeeNWQP33iW/qViY/QcHv/ImtxridTzemcendfBMbh0lev
   EBGTaQcQto6TvlFl8GR5E+l2NN/oW6Fpv7XcL5AjvCXv6o/CNDrbva3R8
   TnFsdGZ2i496A5NRlHvd3qSxkuxpNIw6qwiP5aemooQPqU3vDrTvIR4IO
   IUyY3FjQA04ObdqUuFMBrCcNGjwr+dYDSu0nI/ibX2l/0maeZJ+tGCtY2
   D51Fdg2ZHYkQ1sjLNP0LNIygcgAyylpl5suFB5eHXtU6ge2FQO8JYFvaZ
   jkoK1HiNUcZc2AHET2GmV1+5a9oKl1OE/t2ZJoyQPlO3GeetCTlMdgZHY
   g==;
X-CSE-ConnectionGUID: ZElfA4GiQbeALcr55bxy0Q==
X-CSE-MsgGUID: QaqvQlYwR624BWbIGafzFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35732343"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35732343"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 14:24:33 -0800
X-CSE-ConnectionGUID: 99hSZGtySqy0kJhshqIeqw==
X-CSE-MsgGUID: P1gY7vz+RNS5zicZesnESw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103865723"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Dec 2024 14:24:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQZnq-0002By-1W;
	Wed, 25 Dec 2024 22:24:30 +0000
Date: Thu, 26 Dec 2024 06:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c:
 Unevaluated properties are not allowed ('hpd-gpios', 'interrupts',
 'no-laneswap', 'port' were unexpected)
Message-ID: <202412260634.U7liSps6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   811e48e07be5a00b2472cecba280dd56c8c200ef
commit: a5f8fb56761362c50e56e27932041138cff8d5d2 [4/4] CHROMIUM: arm64: dts: mt8183: Add kakadu rev1
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241226/202412260634.U7liSps6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260634.U7liSps6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260634.U7liSps6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
