Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4248F7D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 04:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719981085; cv=none; b=jtv7/C3cGsryUAdI0UDN90ZHzKpi6z02jAn4UxVDGJnW2Haed+IGbelSTmuLw4JjQn3rGXCw9/wT5T8DPV7a3tCWURw1oS5PQ3sSBtV9I9J5MyVkwbUQpFCxqBgdzTxl5SOOhkaTc4zQNjCDnNny4hqHCw0T8KT3vBs5EMZ++rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719981085; c=relaxed/simple;
	bh=dtc/Jur9evhzKymTAj3SP9oruNlvKj75Vk4L5IlcQgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6OmQgEEPj8FG/A7BiU61UwTGKFclFVVM19MtJIAHMxEfZH+WK0fyn3sTPS98eajY0DN5dHlDhG/lgKSpkPbwUVTxRO5s0JHWFy4nPqBC+h5d+GFm4y+x7qoQ2fRtujIrpqqvNJDsCx8a5piuRWDyAZHzs3tzecDqredKaYJ8F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0nkan/i; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0nkan/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719981082; x=1751517082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dtc/Jur9evhzKymTAj3SP9oruNlvKj75Vk4L5IlcQgE=;
  b=i0nkan/iP3UWfjEfngYZSQrDcEt3xU6r441TucZj997sza+y100MWyVM
   p80pCYJUghi4nAYk7z4WoOnp/ESGGNWvOUHwN3REeydnKtKCfxydZVeIz
   08l16gmRLKEimGGKjjTMS/vZPQb5UwdVmfA9HhNci4bPkrxEeIOfLRVcT
   Bit6zODEJbRPJ/b7cKqVnDAqQSl7Ct1CDmDu5RW2TKlnbAWfaam7N3apm
   s8v2q/JVdIfsA6STDa4+q0EDbxz/PEEecBop9rMyso2KpHXXAitb8qKSu
   Ia0Cf4j13r/xkj9NF6FX1M8YOAOI4OghEHKl/Lek5he6JP1RotGDS1WzZ
   Q==;
X-CSE-ConnectionGUID: oUcmsYRZRWqc+w2S8lwp9w==
X-CSE-MsgGUID: gJUcJ66WQ2ebD/GHN5mVWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="42616490"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="42616490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 21:31:21 -0700
X-CSE-ConnectionGUID: +gyTAjbWRla1W5jzIh16OQ==
X-CSE-MsgGUID: dBAuoQ5GT3mHaOUb6rR46Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="46865054"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2024 21:31:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOreH-000PGf-05;
	Wed, 03 Jul 2024 04:31:17 +0000
Date: Wed, 3 Jul 2024 12:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [morimoto:renesas-bsp/v6.1.96-2024-07-02-GrayHawk-sound 3/748]
 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: codec@1a:
 'DBVDD-supply' is a required property
Message-ID: <202407031257.nPgF1puL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.96-2024-07-02-GrayHawk-sound
head:   81053a0e5dcf4074a02bae68d1cdfa5996887e89
commit: cd08631d34a6708f3d1f28058245ff7b09c18a03 [3/748] ASoC: dt-bindings: realtek,rt5682s: Add DBVDD and LDO1-IN supplies
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240703/202407031257.nPgF1puL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031257.nPgF1puL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031257.nPgF1puL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: codec@1a: 'VBAT-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi5-cs-gpio: {'pinmux': {'pins': ['gpio25', 'gpio26', 'gpio27'], 'function': ['qup05']}, 'pinmux-cs': {'pins': ['gpio28'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi6-cs-gpio: {'phandle': [[93]], 'pinmux': {'pins': ['gpio59', 'gpio60', 'gpio61'], 'function': ['qup10']}, 'pinmux-cs': {'pins': ['gpio62'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio59', 'gpio60', 'gpio61', 'gpio62'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: soc@0: opp-table-qspi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: codec@1a: 'VBAT-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi5-cs-gpio: {'pinmux': {'pins': ['gpio25', 'gpio26', 'gpio27'], 'function': ['qup05']}, 'pinmux-cs': {'pins': ['gpio28'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi6-cs-gpio: {'phandle': [[92]], 'pinmux': {'pins': ['gpio59', 'gpio60', 'gpio61'], 'function': ['qup10']}, 'pinmux-cs': {'pins': ['gpio62'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio59', 'gpio60', 'gpio61', 'gpio62'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: codec@1a: 'VBAT-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi5-cs-gpio: {'pinmux': {'pins': ['gpio25', 'gpio26', 'gpio27'], 'function': ['qup05']}, 'pinmux-cs': {'pins': ['gpio28'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi6-cs-gpio: {'phandle': [[84]], 'pinmux': {'pins': ['gpio59', 'gpio60', 'gpio61'], 'function': ['qup10']}, 'pinmux-cs': {'pins': ['gpio62'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio59', 'gpio60', 'gpio61', 'gpio62'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: codec@1a: 'VBAT-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: codec@1a: 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi5-cs-gpio: {'pinmux': {'pins': ['gpio25', 'gpio26', 'gpio27'], 'function': ['qup05']}, 'pinmux-cs': {'pins': ['gpio28'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi6-cs-gpio: {'phandle': [[84]], 'pinmux': {'pins': ['gpio59', 'gpio60', 'gpio61'], 'function': ['qup10']}, 'pinmux-cs': {'pins': ['gpio62'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio59', 'gpio60', 'gpio61', 'gpio62'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
