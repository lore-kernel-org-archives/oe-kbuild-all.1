Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7351A0B07
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720079804; cv=none; b=gXVzb4/RFJCXVavRDHZDwEWpjay5JZMqKvAyFHCn7smiWFSUVEEt8a4j9USBnNn4E8Ucre8ykACAIuvtWkuqp4/S5R1BYKx4WBCYo8bsq7xMewb+vi5lykL/XXNxV7LJEnHwGIDYruXKk8QeroyLEoBhke+M2ABn0PcNynxDhsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720079804; c=relaxed/simple;
	bh=8iGfkKkupkVtdArArJBy1e0ziM4522a9mw/ffDLDUzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJkHqLFOaTAveM/rnD6p7jlUz+ZHZv9F7KOhf4O5UxSa3VnWlwud1UxvuGGupHhGeboqkQTyu5CdbnXS2Df4AdQb+3ToWJukBM+exq0M5/Ttc6dOy/eE/zm/czOxs7zJiysn8vji2EB8aFiToppl71wQO8DE8hEO54UPeQGUBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzaElVhQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzaElVhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720079802; x=1751615802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8iGfkKkupkVtdArArJBy1e0ziM4522a9mw/ffDLDUzY=;
  b=EzaElVhQ2YxxFfkrgO8H/y2xBJhzC69VqPSxQmgIWibtuWHr3CC5CnQ8
   QxjB7Wq/mJzrX6KO3MqYiFOXVQv3U2ypozdoQt/DJk/0e68OgGGPnp9as
   1E4Xnjl0BO2JyGPdcKGtp0N/WU2RUK4q1sDvzlqvrz30Y3wkaTXnNdjHg
   Z68LIozRLhgLMjJfdWVK2EF+rbmwBDXdeY0txgwHezd9ohoKBMNxSUGEY
   NNavIuLak9BcsZkupVbzdOfZz8lKduxQgpnbKKQbYs+CxlIonYk/9GXN4
   My+xKj2731lqW0vtkb//3PZuicFHv9sK2tGurAS1OEaYKqz1N/90Ycxq+
   w==;
X-CSE-ConnectionGUID: lhQKkCy/QTii5u11fOYgLA==
X-CSE-MsgGUID: 3SreUM9QRHG3j5QWfHkMYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28738403"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="28738403"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 00:56:13 -0700
X-CSE-ConnectionGUID: sS7SETWBQeKhYkdD5sERUQ==
X-CSE-MsgGUID: De98GaL+S6Om9JXxxt2bDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="69706934"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2024 00:56:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPHK4-000Qj8-1p;
	Thu, 04 Jul 2024 07:56:08 +0000
Date: Thu, 4 Jul 2024 15:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Hugues Husson <phhusson@freebox.fr>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [qcom:arm64-for-6.11 265/269]
 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb:
 /soc@0/video-codec@cc00000: failed to match any schema with compatible:
 ['qcom,msm8998-venus']
Message-ID: <202407041503.PX9dQPOP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   968178e35e78e566f75dbb7fbfc4dd1436ce8309
commit: 1c6285e10d76b0cfb5b0384dc9c02e266a2ffd0a [265/269] arm64: dts: qcom: msm8998: add venus node
config: arm64-randconfig-051-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041503.PX9dQPOP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041503.PX9dQPOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041503.PX9dQPOP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: /extcon-usb: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: /extcon-usb: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: /extcon-usb: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: /extcon-usb: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2849.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2925.27-2980.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
   arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: wifi@18800000: 'qcom,no-msa-ready-indicator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
