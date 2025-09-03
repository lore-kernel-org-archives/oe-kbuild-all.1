Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E494F5E0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 04:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756874102; cv=none; b=APLBEuZHHKFxg+ujR1djqZeTiQATB5s4RVIKwwtNo/Uc1tG6fhMuyUdEvY/Rre61pgzkgKZ5iZ1n9gRIIa4kFBPXf6l6PHjEiwl2rWi8vrJ1lHbnk8g7DM7DxVDE4eBvcR+ImfZuAHLSElNNxpoZ6KBCFbs4P6hjqXlvx6oneIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756874102; c=relaxed/simple;
	bh=7nhesVFcx8DuR+ShmyULl8SvHxS9nYXT86cGscO1QO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N0/dFrXJI0B0jJxzlEBtOL4wxtbjn1OYoyZQxXotZhVcLuP6WnT9dl9bnfXoiRkzptybaSTtqu5kqekEvnxbKdG0Kel6jfQa294RbPzt9iE36iL6mU+F/KBl95kheZ0viIp+SxfF5aZ3BFETeYzoFCpSlsCSBL+6tyVc0QrhmbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxPfiIth; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxPfiIth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756874091; x=1788410091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7nhesVFcx8DuR+ShmyULl8SvHxS9nYXT86cGscO1QO8=;
  b=ZxPfiIthygc2iSi9h4Hlz5OpxcGy2FVyvGVVlyjzRzmKeJ8+BZxMISLU
   hK/noAElmkKvhtcAo72yu7pnC+CgwT6OnyShaz1Mype4gh/F3++mAoJOq
   uyiNUz3L6MXtn7bC7vpIHmAIKLJHna8wCmtHv54MT4Z5xhfNawVw/h7qJ
   XH1zmnieYSjQ5LCtfFX65FFgRVDABLg5eqm7toS7OMiGGBuXiZ8+peEPw
   /ciicxTWXPRiW3jg7wO31vL94M8Ko7s37u8XV2+LloChFZjCH0iFKlJed
   5HCdKAZqODNo55HBgI3IY0bN94gYp3VxtcfjR6Juu8XYyZ0iEQt4LpvZW
   g==;
X-CSE-ConnectionGUID: ub9c+jxERSyn1+DAve3P3Q==
X-CSE-MsgGUID: e8JnELcuTuWT65UJW6+U5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69878728"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="69878728"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 21:34:51 -0700
X-CSE-ConnectionGUID: rHleguDtToCh0bl9IUF7Fg==
X-CSE-MsgGUID: nSUthyyGSgK8oBq4LHiGwg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 02 Sep 2025 21:34:49 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utfCp-0003OR-0h;
	Wed, 03 Sep 2025 04:34:47 +0000
Date: Wed, 3 Sep 2025 06:34:14 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: soc
 (simple-bus): emiisu: 'ranges' is a required property
Message-ID: <202509030654.znLCotUb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   815b7f84c23bfa95fad38f9f70984c3febcb429b
commit: d5ed050aad8992d3fe969d48bef74f995fd1714c [443/443] CHROMIUM: arm64: dts: mt8189-skywalker-obiwan: Initial DTS for obiwan
config: arm64-randconfig-2051-20250823 (https://download.01.org/0day-ci/archive/20250903/202509030654.znLCotUb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030654.znLCotUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030654.znLCotUb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku131072', 'google,obiwan-sku131074', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:1: 'lm' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:2: 'rb0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:3: 'rb1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:4: 'bm0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:5: 'bm1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwm@1100e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11010800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ec@0 (google,cros-ec-spi): typec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: typec (google,cros-ec-ucsi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11011800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ec@0 (google,cros-ec-fp): 'spi-cs-setup-delay-ns' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:2: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:3: 'axi_s' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names: ['spi', 'sf', 'axi_f', 'axi_h', 'axi_p'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): clocks: [[33, 72], [29, 73], [29, 74], [29, 75], [29, 76]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spi@11018000: failed to match any schema with compatible: ['mediatek,mt8189-nor', 'mediatek,mt8186-nor']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: adc@11019000 (mediatek,mt8189-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc'] is too long
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: usb@11210000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pcie@112f0000 (mediatek,mt8189-pcie): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: pcie@112f0000 (mediatek,mt8189-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pcie@112f0000: failed to match any schema with compatible: ['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: t-phy@11b00000 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
--
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[139], [140], [141]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[147, 133], [147, 134], [147, 135], [147, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[158, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[147, 143], [147, 144], [147, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[171, 1], [171, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: audio-codec (realtek,rt1019p): 'enable-gpios', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   	'google,chinchou' was expected
   	'google,chinchou-sku17' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku131073', 'google,obiwan-sku131075', 'google,obiwan-sku131076', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku131073', 'google,obiwan-sku131075', 'google,obiwan-sku131076', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku131073', 'google,obiwan-sku131075', 'google,obiwan-sku131076', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku131073', 'google,obiwan-sku131075', 'google,obiwan-sku131076', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
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
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spi@11018000: failed to match any schema with compatible: ['mediatek,mt8189-nor', 'mediatek,mt8186-nor']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: adc@11019000 (mediatek,mt8189-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc'] is too long
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11210000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11210000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/usb@11220000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mmc@11230000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg', 'crypto'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mmc@11230000 (mediatek,mt8189-mmc): clocks: [[33, 15], [29, 61], [29, 60], [33, 14], [29, 64], [29, 63], [33, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11260000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11260000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/usb@11260000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: usb@11270000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
--
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[170, 1], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:1: 'lm' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:3: 'rb1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:4: 'bm0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:5: 'bm1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spi@11018000: failed to match any schema with compatible: ['mediatek,mt8189-nor', 'mediatek,mt8186-nor']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: adc@11019000 (mediatek,mt8189-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc'] is too long
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11210000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11210000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/usb@11210000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11220000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11220000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/usb@11220000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mmc@11230000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg', 'crypto'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mmc@11230000 (mediatek,mt8189-mmc): clocks: [[33, 15], [29, 61], [29, 60], [33, 14], [29, 64], [29, 63], [33, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11260000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/usb@11260000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11270000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: usb@11270000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/usb@11270000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
--
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[170, 0], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[170, 1], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   	'google,chinchou' was expected
   	'google,chinchou-sku17' was expected
   	'google,elm-rev3' was expected
   	'google,chinchou-sku20' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196609', 'google,obiwan-sku196610', 'google,obiwan-sku196615', 'google,obiwan-sku196616', 'google,obiwan', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
--
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/emichn@10235000: failed to match any schema with compatible: ['mediatek,common-emichn']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@10270000: failed to match any schema with compatible: ['mediatek,mt8189-emicfg-ao-mem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@10274000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/lvts@10315000: failed to match any schema with compatible: ['mediatek,mt8189-lvts']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/mt8189-afe-pcm@11050000: failed to match any schema with compatible: ['mediatek,mt8189-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8189-rt5682s-sound']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clock-names: ['main', 'mm', 'pwm_src'] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ec@0 (google,cros-ec-fp): 'spi-cs-setup-delay-ns' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11012800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11013800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:2: 'axi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names:3: 'axi_s' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): clock-names: ['spi', 'sf', 'axi_f', 'axi_h', 'axi_p'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): clocks: [[33, 72], [29, 73], [29, 74], [29, 75], [29, 76]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11210000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11210000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11260000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11260000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/usb@11260000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: usb@11270000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
--
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pcie@112f0000 (mediatek,mt8189-pcie): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: pcie@112f0000 (mediatek,mt8189-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
--
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[157, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[146, 143], [146, 144], [146, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[170, 0], [170, 3]] is too long
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: audio-codec (realtek,rt1019p): 'enable-gpios', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   	'google,tentacruel-sku262144' was expected
   	'google,tentacruel-sku262148' was expected
   	'google,spherion-rev0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196612', 'google,obiwan-sku196613', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196612', 'google,obiwan-sku196613', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196612', 'google,obiwan-sku196613', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:3: 'rb1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:4: 'bm0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:5: 'bm1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
--
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): clocks: [[29, 10], [33, 25], [33, 178]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pwm@1100e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spi@11010800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ec@0 (google,cros-ec-spi): typec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: typec (google,cros-ec-ucsi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spi@11011800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: spi@11018000 (mediatek,mt8189-nor): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-nor', 'mediatek,mt8186-nor'] is too long
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8173-nor', 'mediatek,mt8186-nor', 'mediatek,mt8192-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt2701-nor', 'mediatek,mt2712-nor', 'mediatek,mt7622-nor', 'mediatek,mt7623-nor', 'mediatek,mt7629-nor', 'mediatek,mt8195-nor']
   	'mediatek,mt8189-nor' is not one of ['mediatek,mt8188-nor']
   	'mediatek,mt8173-nor' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spi@11018000: failed to match any schema with compatible: ['mediatek,mt8189-nor', 'mediatek,mt8186-nor']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: adc@11019000 (mediatek,mt8189-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
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
--
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: usb@11270000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/usb@11270000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pcie@112f0000 (mediatek,mt8189-pcie): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: pcie@112f0000 (mediatek,mt8189-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/t-phy@11b00000: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: xs-phy@11b10000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
   	'mediatek,mt8192-mali' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/ccorr@1400c000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[157, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-jpgdec'] is too short
   	'mediatek,mt8189-jpgdec' is not one of ['mediatek,mt8173-jpgdec', 'mediatek,mt2701-jpgdec']
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): iommus: [[146, 143], [146, 144], [146, 145]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: iommu@19010000 (mediatek,mt8189-iommu-apu): 'mediatek,larbs' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-main', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1a001000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1a002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1a00c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
--
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[170, 0], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[170, 1], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: audio-codec (realtek,rt1019p): 'enable-gpios', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /: failed to match any schema with compatible: ['google,obiwan-sku196614', 'google,obiwan', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/cpuhvfs@100a00: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: performance-controller@108d68 (mediatek,cpufreq-hw): 'reg-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@d01a000: failed to match any schema with compatible: ['mediatek,mt8189-dbg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/soc-dbg-error-flag@d01a000: failed to match any schema with compatible: ['mediatek, soc-dbg-error-flag']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: soc-dbg-error-flag@d01a000 (mediatek, soc-dbg-error-flag): compatible:0: 'mediatek, soc-dbg-error-flag' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@d0a0000: failed to match any schema with compatible: ['mediatek,mt8189-dem', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8189-topckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8189-infra-ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): 'aud-gpio-ap-dmic-off', 'aud-gpio-ap-dmic-on', 'aud-gpio-ap-dmic1-off', 'aud-gpio-ap-dmic1-on', 'aud-gpio-i2sin0-off', 'aud-gpio-i2sin0-on', 'aud-gpio-i2sin1-off', 'aud-gpio-i2sin1-on', 'aud-gpio-i2sout0-off', 'aud-gpio-i2sout0-on', 'aud-gpio-i2sout1-off', 'aud-gpio-i2sout1-on', 'aud-gpio-pcm-off', 'aud-gpio-pcm-on', 'audio_spk_en_pins', 'gsc-ap-int-odl' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): bt-pins: 'pin-bt-kill' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:0: 'base' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:1: 'lm' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:2: 'rb0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:3: 'rb1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:4: 'bm0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:5: 'bm1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:6: 'bm2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:7: 'lt0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:8: 'lt1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:9: 'rt' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:10: 'eint0' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:11: 'eint1' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:12: 'eint2' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:13: 'eint3' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pinctrl@10005000 (mediatek,mt8189-pinctrl): reg-names:14: 'eint4' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8189-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@10207000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/emicen@10219000: failed to match any schema with compatible: ['mediatek,mt8189-emicen']
--
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pwm@1100e000 (mediatek,mt8189-disp-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8189-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/pwm@1100e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-pwm', 'mediatek,mt8183-disp-pwm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11010800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ec@0 (google,cros-ec-spi): typec:compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: typec (google,cros-ec-ucsi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,cros-ec-ucsi'] is too short
   	'google,cros-ec-typec' was expected
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11011800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ec@0 (google,cros-ec-fp): 'spi-cs-setup-delay-ns' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^pinctrl-[0-9]+$', '^regulator@[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11012800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11013800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11014800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11015800: failed to match any schema with compatible: ['mediatek,mt8189-spi']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: spi@11018000 (mediatek,mt8189-nor): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spi@11018000: failed to match any schema with compatible: ['mediatek,mt8189-nor', 'mediatek,mt8186-nor']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: adc@11019000 (mediatek,mt8189-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc'] is too long
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt8189-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/adc@11019000: failed to match any schema with compatible: ['mediatek,mt8189-auxadc', 'mediatek,mt8173-auxadc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@11020000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11036000: failed to match any schema with compatible: ['mediatek,mt8189-peri-ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11036000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11050000: failed to match any schema with compatible: ['mediatek,mt8189-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11200000 (mediatek,mt8189-xhci): 'reset-names' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11200000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11200000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11230000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg', 'crypto'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11230000 (mediatek,mt8189-mmc): clocks: [[33, 15], [29, 61], [29, 60], [33, 14], [29, 64], [29, 63], [33, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11240000 (mediatek,mt8189-mmc): clock-names: ['source', 'hclk', 'source_cg', 'bus_clk', 'pclk_cg', 'axi_cg'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mmc@11240000 (mediatek,mt8189-mmc): clocks: [[33, 18], [29, 66], [29, 65], [33, 19], [29, 68], [29, 67]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11260000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11260000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/usb@11260000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11270000 (mediatek,mt8189-xhci): compatible:0: 'mediatek,mt8189-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: usb@11270000 (mediatek,mt8189-xhci): mediatek,syscon-wakeup:0:2: 110 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/usb@11270000: failed to match any schema with compatible: ['mediatek,mt8189-xhci', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'ufs_fde', 'ufs_mbist', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_phy_sap', 'phy_top_ahb_s_bus', 'ufshci_ufs', 'ufshci_aes', 'ufshci_ufs_ahb', 'ufshci_aes_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): clocks: [[33, 42], [2], [33, 173], [33, 41], [33, 43], [93, 0], [93, 1], [93, 2], [93, 3], [93, 4], [93, 5], [94, 0], [94, 1], [94, 2], [94, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: ufshci@112b0000 (mediatek,mt8183-ufshci): Unevaluated properties are not allowed ('mediatek,ufs-broken-vcc', 'mediatek,ufs-disable-mcq', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@112b8000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-ao', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@112b8000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@112bb000: failed to match any schema with compatible: ['mediatek,mt8189-ufscfg-pdn', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@112bb000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pcie@112f0000 (mediatek,mt8189-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt8189-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie', 'mediatek,mt8196-pcie']
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pcie@112f0000 (mediatek,mt8189-pcie): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: pcie@112f0000 (mediatek,mt8189-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/pcie@112f0000: failed to match any schema with compatible: ['mediatek,mt8189-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: t-phy@11b00000 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: audio-codec@1a (realtek,rt5682s): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
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
--
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[138], [139], [140]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
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
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/ccorr@1400d000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/aal@1400e000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/aal@1400f000: failed to match any schema with compatible: ['mediatek,mt8189-disp-aal']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gamma@14010000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/gamma@14011000: failed to match any schema with compatible: ['mediatek,mt8189-disp-gamma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dither@14012000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dither@14013000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dither']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dsc@14014000: failed to match any schema with compatible: ['mediatek,mt8189-disp-dsc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/merge@14015000: failed to match any schema with compatible: ['mediatek,mt8189-disp-merge']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dsi@14016000: failed to match any schema with compatible: ['mediatek,mt8189-dsi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dvo@14017000: failed to match any schema with compatible: ['mediatek,mt8189-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/dvo@14018000: failed to match any schema with compatible: ['mediatek,mt8189-dp-dvo']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1401c000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1401d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1502e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1502f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@15820000: failed to match any schema with compatible: ['mediatek,mt8189-imgsys2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1582e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/video-codec@16000000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1602e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1602f000: failed to match any schema with compatible: ['mediatek,mt8189-vdec-core', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@17000000: failed to match any schema with compatible: ['mediatek,mt8189-venc', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@17010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/video-codec@17020000: failed to match any schema with compatible: ['mediatek,mt8189-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): compatible: ['mediatek,mt8189-jpgenc'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-encoder@17030000 (mediatek,mt8189-jpgenc): iommus: [[146, 133], [146, 134], [146, 135], [146, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): 'mediatek,larb' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names:0: 'jpgdec-smi' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clock-names: ['jpgdec'] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): clocks: [[157, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: jpeg-decoder@17040000 (mediatek,mt8189-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1a00d000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1a00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1a010000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1a04f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawa', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1a06f000: failed to match any schema with compatible: ['mediatek,mt8189-camsys-rawb', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1b000000: failed to match any schema with compatible: ['mediatek,mt8189-ipesys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1b00e000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1b10f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1b00f000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1c000000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ao-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/power-controller@1c001000: failed to match any schema with compatible: ['mediatek,mt8189-scpsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1c00c000: failed to match any schema with compatible: ['mediatek,mt8189-vlpcfg-reg-bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1c00f000: failed to match any schema with compatible: ['mediatek,mt8189-dvfsrc-top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
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
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e980000 (mediatek,mt8189-gce): clock-names: ['gce0', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e980000 (mediatek,mt8189-gce): clocks: [[170, 0], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e9800f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-d', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e990000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names:0: 'gce' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e990000 (mediatek,mt8189-gce): clock-names: ['gce1', 'gce-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e990000 (mediatek,mt8189-gce): clocks: [[170, 1], [170, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e9900f0: failed to match any schema with compatible: ['mediatek,mt8189-gce-m', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1f000000: failed to match any schema with compatible: ['mediatek,mt8189-mdpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/larb@1f002000: failed to match any schema with compatible: ['mediatek,mt8189-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/emiisu: failed to match any schema with compatible: ['mediatek,common-emiisu']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: audio-codec (realtek,rt1019p): 'enable-gpios', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
