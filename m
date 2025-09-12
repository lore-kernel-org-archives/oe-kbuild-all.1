Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A248A4C81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757713806; cv=none; b=KbRwE/mfo422pDOsvRQL7GcX81gMhnK38fI6kJ7YttzHkj/c8A64Zo+apLTxf14i9zdMlu7CSvKQbGLEid+B6NZu4jWOe2vWBSST6tKkk/r1IWyBqB4ON49fMAwAIXDA59Zj+lktwqsaJbs+xjMTtYDvU0A+rZFGKTb8H6zsDIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757713806; c=relaxed/simple;
	bh=WLo+BaNkBBPF+Il4BE2b5F/FzameBn1ZPj+2FqHdV10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KuKPun69A1z8ySIvOZzfK0/qRpqZhXyIzwxgi+NVA9KkyrRyomACrUZMkdOdDShxc8GUyo6TfG7PCQrcBGjQ7daXoYBzzxU88MN/tF6BmoiDe+lyGIS2MydyU6hYSdxU2cwqv2Kqmf35r5+qlWxDc7S5Nl0LBvKZSvoSq4ktFqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrvFpaum; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrvFpaum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757713802; x=1789249802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WLo+BaNkBBPF+Il4BE2b5F/FzameBn1ZPj+2FqHdV10=;
  b=BrvFpaum2f31K6dvLGBNaOO1AGRhGTnE+CgSZAaNTTeMFPBObFUnimbu
   F8pKpGeXhYTgjkch8wwMvWKfxHKrXhR+RDeQ9RSP4vznQGmdg0tlZe+1z
   E/b/j34KKf4U8uGiwyRYGYQs9E6QAKn7CMYTg4ZxDix7h6a8osnYI0S5n
   N0beJQtYf3dmPXX6Ts4XN3vv5eqJaFumd0S2GmdAzlSZ5OpkslwFdb3cu
   KgSoJLVzA7/UFPvFBjuVbDTqibQyrjbINYvkRf9VAA8gHcIhTMOFOnmK9
   lvBj6KEyQmBl106OSpFXx4bjPROT7AaJ/rT1SfUdO6SYFsrW0FWmac+Nb
   w==;
X-CSE-ConnectionGUID: dH2wd5nhSzyqb0REwdbn3A==
X-CSE-MsgGUID: JT/hel9LTWukMydovfLLdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60137005"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="60137005"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 14:50:02 -0700
X-CSE-ConnectionGUID: 8DOuz4nMS52cQsbdsTx79A==
X-CSE-MsgGUID: bYXwtzQKRde2woqSk6ueFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="173382460"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 12 Sep 2025 14:50:01 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxBeX-0001Dw-2i;
	Fri, 12 Sep 2025 21:49:57 +0000
Date: Sat, 13 Sep 2025 05:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 494/494]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/sound:
 failed to match any schema with compatible:
 ['mediatek,mt8189-rt5682s-sound']
Message-ID: <202509130542.9dPpIlLL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   15bc3ff9aab69a530285260f4a2e6f121b233a29
commit: 9f07dd811120e9e37f0232becba4ecedadc454f0 [494/494] CHROMIUM: dts: mt8189-skywalker-baze: fix audio no function
config: arm64-randconfig-051-20250910 (https://download.01.org/0day-ci/archive/20250913/202509130542.9dPpIlLL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509130542.9dPpIlLL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509130542.9dPpIlLL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: audio-codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: audio-codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: audio-codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: audio-codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: audio-codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: audio-codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: audio-codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: audio-codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
