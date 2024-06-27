Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9FE556
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 03:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719457844; cv=none; b=ePzIh6BcfiuS9Gt/E5oCOmk0Zk/o/aV4eLpsn8p2CgJsA9NWcNlynITYJNnM697PcDYreZ1C+h36SqXNuxUwOO87zamNEMtUc51Iv6UELQMkLf+g2XckIrOpJfw3ftQlyR0TjIKeA0a3vpOJOmZJtCOMh+cJZnQtKPK0jA9L/zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719457844; c=relaxed/simple;
	bh=2rNCEzzJFfF9acRu64HNwgq6hM3XBSjN+M3kHVzV0H8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uEhC4e5Dw6oXohYqpVgkGwkvlvVtVc2LDJKh8OB47av+aRWG/6vQB5OKbi4z5+AA6i+JNdk1rXaIMWpJgUZnjubSY0itMYozXdZZReWEG0uSzu4zJ2He0+wj7y/bRgozaHzyl/pK7eqrkld1mw3N8xaAw+kOgMrxufD5qMGWkzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fmp+wtWf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fmp+wtWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719457842; x=1750993842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2rNCEzzJFfF9acRu64HNwgq6hM3XBSjN+M3kHVzV0H8=;
  b=Fmp+wtWfOazDN/NUo+VseLpKYINfGelGcjQvqQSF7ALsaZbKrmQ2xPhR
   OgdXAd7zi9LNf+8FGfv1ss1X8oEK0JqDlmkcJCB6LgXcDzwlv1CK3ViVq
   ugliPq5aJ/OFfLkjL6oesGOs0OYC5BYg0NT8bnB3TKHB+M42/aqoVnnnq
   JI9VTgUr8r73j/ibdZsIjI/6Ew0F5JP2p9Ber3y4ly0XhBD2Gvbw3C1x8
   tSCuJXZY+Hr4rPnuhango8ANmHe8qfqk3OcXVY8HE6x+vKOBfm3DJWS60
   dncExSI+LK2tcqkNCrNup2/FRxG5N7Xc6go3ZQR0EuDD0zobPRPPBSFAW
   g==;
X-CSE-ConnectionGUID: DpySPSODRN2b6Esj2oYjYw==
X-CSE-MsgGUID: Wu0+GnW8TuuFfUzWeF3GFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16307508"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="16307508"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 20:10:38 -0700
X-CSE-ConnectionGUID: gFAMGk4nSEyIZY+0LLMMkQ==
X-CSE-MsgGUID: jt7o59TYR/m8w0AB8FFi3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="44288215"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jun 2024 20:10:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMfWs-000Fp6-22;
	Thu, 27 Jun 2024 03:10:34 +0000
Date: Thu, 27 Jun 2024 11:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8626/8719]
 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dtb: gpu@1c00000:
 clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem',
 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
Message-ID: <202406271056.h9TqVfq7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: e83cacc76a7abc2b3c114926a89f2e6d9cb365b3 [8626/8719] Merge branch 'msm-next' of https://gitlab.freedesktop.org/drm/msm.git
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271056.h9TqVfq7-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271056.h9TqVfq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271056.h9TqVfq7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:574.27-577.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:594.25-597.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:604.27-607.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)
   arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dtb: display-controller@1a01000: clock-names: 'oneOf' conditional failed, one must be fixed:
   	['iface', 'bus', 'core', 'vsync', 'tbu', 'tbu_rt'] is too long
   	'iommu' was expected
   	'lut' was expected
   	'vsync' was expected
   	'tbu' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,mdp5.yaml#
>> arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dtb: pmic@3: 'pwm@b000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dtb: pwm@b000: 'reg' does not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
   arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dtb: /soc@0/sram@8600000: failed to match any schema with compatible: ['qcom,msm8976-imem', 'syscon', 'simple-mfd']
--
   arch/arm64/boot/dts/qcom/msm8976.dtsi:574.27-577.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:594.25-597.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:604.27-607.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)
   arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dtb: display-controller@1a01000: clock-names: 'oneOf' conditional failed, one must be fixed:
   	['iface', 'bus', 'core', 'vsync', 'tbu', 'tbu_rt'] is too long
   	'iommu' was expected
   	'lut' was expected
   	'vsync' was expected
   	'tbu' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,mdp5.yaml#
>> arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dtb: pmic@3: 'pwm@b000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dtb: pwm@b000: 'reg' does not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
   arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dtb: /soc@0/sram@8600000: failed to match any schema with compatible: ['qcom,msm8976-imem', 'syscon', 'simple-mfd']
--
   arch/arm64/boot/dts/qcom/msm8953.dtsi:910.27-960.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1328.11-1338.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: iommu@1c48000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8953-iommu' is not one of ['qcom,msm8976-iommu']
   	'qcom,msm-iommu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
   arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: pmic@3: 'pwm@b000' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dtb: pwm@b000: 'reg' does not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
