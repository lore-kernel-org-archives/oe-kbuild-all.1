Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90DB32F76C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 00:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756773267; cv=none; b=U0J2kb2afNuSye8JCd9wUdxm39eMADTThL4a/zH21I7A48oNR53FmuPbVWOCQ7DM6J2qu5My/O2dvErwbFx3CvZaeNRuzdvFR6OMNOOfscQ9HPPSwYtyou8i+vN+YiHujrfqik7/q5FMO+bJmdVx73AUjAm8rQZgWzQ+NrTyPgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756773267; c=relaxed/simple;
	bh=uzMHniPvjp8APAjQVC2/cFbetU05NrY6v2oRXpY/VcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PbmgNVQWNygNtd34PrEQsO/8bUYRwhvci3yXXAtG8508npRSXDTPHDIfJwGU6LSxtHlmfxAntxxL8die+vs8Re27hK7woH44ZHRIlduscMnJ2q4Zuik9Y6PAowFE4ru1z0zmNrYsHMOvIvf+nYkWhGZFY5vLQDBg0mu08tofMnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrngT3+v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrngT3+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756773257; x=1788309257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzMHniPvjp8APAjQVC2/cFbetU05NrY6v2oRXpY/VcI=;
  b=YrngT3+vSayQThGPxfYlJcCh9KlvW+l+om9KDZN+T9h/i8YVNiSMNhG2
   nQocj4Qazu+7Z2d1iuWZOOYEfkvaQrHsGXzlMFn4Wwf7gL73WwKRsUM2t
   yT8jnJs6T5XLN9Ntu/zrq24XQrpecNg1ls4cmUZonOePcBPaMPaw4IZ98
   xqPrWxWyrndjhe1kyDBuBFHgbpwJKije/vWKRUSf4CUwLM6vDAqHd1DK0
   xv5LL8CKf+jm/DtHL8AuJ89X+IRurrP3gT66sgAWHTG//V9tWlVsjv8pg
   p/0SlxX5xGRTepx0HMoKmWDVEoKzGNPXhgk+CkK5xznI8bMo6W8NTl+qT
   Q==;
X-CSE-ConnectionGUID: V5peDk8+Q6m5qByfSj6SgQ==
X-CSE-MsgGUID: BqE9f7mhTsS0MwUZ58eSow==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81611422"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81611422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 17:34:15 -0700
X-CSE-ConnectionGUID: Vh3KO/YLQBWV53A+fPGTfg==
X-CSE-MsgGUID: RT9rMfZ1TRmVeKNPnQyoIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170403987"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 01 Sep 2025 17:34:13 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utEyQ-0003ER-1S;
	Tue, 02 Sep 2025 00:34:10 +0000
Date: Tue, 2 Sep 2025 02:34:06 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb:
 pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was
 expected
Message-ID: <202509020244.lipWP2Yh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   9aa69a4a326c92e706db5880070c5489ff6739c9
commit: d5ed050aad8992d3fe969d48bef74f995fd1714c [443/443] CHROMIUM: arm64: dts: mt8189-skywalker-obiwan: Initial DTS for obiwan
config: arm64-randconfig-2052-20250823 (https://download.01.org/0day-ci/archive/20250902/202509020244.lipWP2Yh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020244.lipWP2Yh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020244.lipWP2Yh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwm@1100e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11010800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ec@0 (google,cros-ec-spi): typec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ec@0 (google,cros-ec-fp): 'spi-cs-setup-delay-ns' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11012800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11013800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:2: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:3: 'axi_s' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names: ['spi', 'sf', 'axi_f', 'axi_h', 'axi_p'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): clocks: [[33, 72], [29, 73], [29, 74], [29, 75], [29, 76]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
--
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11210000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11210000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/usb@11210000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11220000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
--
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/usb@11220000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mmc@11230000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg', 'crypto'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mmc@11230000 (mediatek,mt8189-mmc): clocks: [[33, 15], [29, 61], [29, 60], [33, 14], [29, 64], [29, 63], [33, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11260000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11260000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/usb@11260000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11270000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11270000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/usb@11270000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pcie@112f0000 (mediatek,mt8189-pcie): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pcie@112f0000 (mediatek,mt8189-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pcie@112f0000: failed to match any schema with compatible: ['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: t-phy@11b00000 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
--
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[139], [140], [141]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[147, 133], [147, 134], [147, 135], [147, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[158, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[147, 143], [147, 144], [147, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[171, 0], [171, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   	'google,chinchou-sku21' was expected
   	'google,steelix-rev1-sku196608' was expected
   	'google,tentacruel-sku262144' was expected
   	'google,tentacruel-sku262148' was expected
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou' was expected
   	'google,chinchou-sku17' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku131073', 'google,obiwan-sku131075', 'google,obiwan-sku131076', 'google,obiwan', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku131073', 'google,obiwan-sku131075', 'google,obiwan-sku131076', 'google,obiwan', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku131073', 'google,obiwan-sku131075', 'google,obiwan-sku131076', 'google,obiwan', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku131073', 'google,obiwan-sku131075', 'google,obiwan-sku131076', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:1: 'lm' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:2: 'rb0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:3: 'rb1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:4: 'bm0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:5: 'bm1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spi@11010800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: ec@0 (google,cros-ec-spi): typec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: typec (google,cros-ec-ucsi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spi@11011800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: ec@0 (google,cros-ec-fp): 'spi-cs-setup-delay-ns' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spi@11012800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spi@11013800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:2: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:3: 'axi_s' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names: ['spi', 'sf', 'axi_f', 'axi_h', 'axi_p'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: spi@11018000 (mediatek,mt8189-nor): clocks: [[33, 72], [29, 73], [29, 74], [29, 75], [29, 76]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spi@11018000: failed to match any schema with compatible: ['mediatek,mt8189-nor', 'mediatek,mt8186-nor']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: adc@11019000 (mediatek,mt8189-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc'] is too long
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
--
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pcie@112f0000 (mediatek,mt8189-pcie): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pcie@112f0000 (mediatek,mt8189-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/pcie@112f0000: failed to match any schema with compatible: ['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: t-phy@11b00000 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[157, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[146, 143], [146, 144], [146, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[170, 0], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
--
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:1: 'lm' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:2: 'rb0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:3: 'rb1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:4: 'bm0' was expected
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:5: 'bm1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
--
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/pwm@1100e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spi@11010800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ec@0 (google,cros-ec-spi): 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ec@0 (google,cros-ec-spi): typec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: typec (google,cros-ec-ucsi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spi@11011800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ec@0 (google,cros-ec-fp): 'spi-cs-setup-delay-ns' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spi@11012800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spi@11013800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spi@11018000: failed to match any schema with compatible: ['mediatek,mt8189-nor', 'mediatek,mt8186-nor']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: adc@11019000 (mediatek,mt8189-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc'] is too long
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11210000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11210000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11260000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/usb@11260000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11270000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11270000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/usb@11270000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pcie@112f0000 (mediatek,mt8189-pcie): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
--
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[157, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[146, 143], [146, 144], [146, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[170, 0], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[170, 1], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: audio-codec (realtek,rt1019p): 'enable-gpios', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:1: 'lm' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:2: 'rb0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:3: 'rb1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:4: 'bm0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:5: 'bm1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
--
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ec@0 (google,cros-ec-spi): typec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: typec (google,cros-ec-ucsi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11011800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ec@0 (google,cros-ec-fp): 'spi-cs-setup-delay-ns' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11012800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11013800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:2: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:3: 'axi_s' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names: ['spi', 'sf', 'axi_f', 'axi_h', 'axi_p'] is too long
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11018000: failed to match any schema with compatible: ['mediatek,mt8189-nor', 'mediatek,mt8186-nor']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: adc@11019000 (mediatek,mt8189-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc'] is too long
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/usb@11210000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11220000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11220000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/usb@11220000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11230000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg', 'crypto'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11230000 (mediatek,mt8189-mmc): clocks: [[33, 15], [29, 61], [29, 60], [33, 14], [29, 64], [29, 63], [33, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11260000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11260000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
--
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/usb@11270000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
--
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
--
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[157, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[146, 143], [146, 144], [146, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[170, 0], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[170, 1], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: audio-codec (realtek,rt1019p): 'enable-gpios', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   	'google,elm-rev5' was expected
   	'google,hana-rev3' was expected
   	'google,chinchou-sku5' was expected
   	'google,chinchou-sku7' was expected
   	'google,chinchou-sku21' was expected
   	'google,steelix-rev1-sku196608' was expected
   	'google,tentacruel-sku262144' was expected
   	'google,tentacruel-sku262148' was expected
   	'google,spherion-rev0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196612', 'google,obiwan-sku196613', 'google,obiwan', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196612', 'google,obiwan-sku196613', 'google,obiwan', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196612', 'google,obiwan-sku196613', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spi@11012800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spi@11013800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:2: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:3: 'axi_s' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names: ['spi', 'sf', 'axi_f', 'axi_h', 'axi_p'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: spi@11018000 (mediatek,mt8189-nor): clocks: [[33, 72], [29, 73], [29, 74], [29, 75], [29, 76]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
--
   	['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc'] is too long
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11210000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11210000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/usb@11210000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11220000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11220000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/usb@11220000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mmc@11230000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg', 'crypto'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mmc@11230000 (mediatek,mt8189-mmc): clocks: [[33, 15], [29, 61], [29, 60], [33, 14], [29, 64], [29, 63], [33, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11260000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pcie@112f0000 (mediatek,mt8189-pcie): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pcie@112f0000 (mediatek,mt8189-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pcie@112f0000: failed to match any schema with compatible: ['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: t-phy@11b00000 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
--
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[157, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[146, 143], [146, 144], [146, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
--
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[170, 0], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[170, 1], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: audio-codec (realtek,rt1019p): 'enable-gpios', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   	'google,chinchou-sku19' was expected
   	'google,steelix-rev0-sku196608' was expected
   	'google,starmie-sku3' was expected
   	'google,starmie' was expected
   	'google,tentacruel-sku262145' was expected
   	'google,tentacruel-sku262149' was expected
   	'google,spherion-rev1' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196614', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196614', 'google,obiwan', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:1: 'lm' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:2: 'rb0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:3: 'rb1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:4: 'bm0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:5: 'bm1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11012800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11013800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:2: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:3: 'axi_s' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names: ['spi', 'sf', 'axi_f', 'axi_h', 'axi_p'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: spi@11018000 (mediatek,mt8189-nor): clocks: [[33, 72], [29, 73], [29, 74], [29, 75], [29, 76]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11210000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11210000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/usb@11210000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11220000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11220000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/usb@11220000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11230000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg', 'crypto'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11230000 (mediatek,mt8189-mmc): clocks: [[33, 15], [29, 61], [29, 60], [33, 14], [29, 64], [29, 63], [33, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11260000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pcie@112f0000 (mediatek,mt8189-pcie): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pcie@112f0000 (mediatek,mt8189-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/pcie@112f0000: failed to match any schema with compatible: ['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: t-phy@11b00000 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[157, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[146, 143], [146, 144], [146, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[170, 0], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[170, 1], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: audio-codec (realtek,rt1019p): 'enable-gpios', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
