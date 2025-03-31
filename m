Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEF62033A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 05:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743399655; cv=none; b=SwDlDeuslDtOSAeaYd+S0ydI3QNHnk3HMd6+jI5QZvK5Ledh9OLDAiPi6pNARBaYyRB2/+LgJAXJSgAVCDSPyC5vEpVl8rMe8jSAkcyrylnZmIzepEB3UaT2i6z3ejbD/DSsH7K/hT1NE8po1Fp3WRuzFJNrB0s/Hydm+lZhFII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743399655; c=relaxed/simple;
	bh=HORMEaGDec22uaOUxplqvERKPHKAn6cfyi7Sh/BVaWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9EELzfG7EZBm2uzM9ervS8a0VVM4qQizYHpuLMWd4GgVI3pwwuqjiggF7l6s4OuSodklZnXI6BJY0bS53DC4VoBKN591g0GPkoZCCZ/4uU16aplmg/7LO6+WP9BVnrXu8rCkf6RmQW/qxg4c1KBNVWwUpInyhHylGV1WzCSukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R58CF0Tm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R58CF0Tm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743399648; x=1774935648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HORMEaGDec22uaOUxplqvERKPHKAn6cfyi7Sh/BVaWY=;
  b=R58CF0TmrvWEixiQ6FRVdiCWmA2C1meGCRZ4kPABiQQVXk4Nr9ri8FbG
   5z6KnUYPSBzlmjjR4MMA7WMhI+D74nfX35eV/LlJPm/Ykl+mUDlfbdVwE
   KwYMhGaysSIrxrOHbME8T45eJBDmgbVkL8FWPgSgf+0DLlrVrOt0IixfV
   NdDik3rzzJHC2mNrMB/O7d2ampCBB7iGncbLArXvfSkYiPc5AvJ1/TRth
   eXmGDs38XEevgL1d4+us3rXj+tAXkccSWCS39LY2PTWJIKHX4bMn0fuYj
   eZ8IEDPTSdT0l0NUacrLixH2BCE69nCaJ3KImnTZiHvf/RTWGCKAXqfBB
   g==;
X-CSE-ConnectionGUID: +hhapgqKQHCsZVFoO+w7xw==
X-CSE-MsgGUID: cJW+5XQPTr+M+mE6Jn/dpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44835215"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44835215"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 22:40:47 -0700
X-CSE-ConnectionGUID: ZY6xH34wQNGA0kTlBT83Ew==
X-CSE-MsgGUID: MiPv/QWYS4SDGca+Lr5MJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="125999563"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Mar 2025 22:40:45 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz7t4-00094c-2U;
	Mon, 31 Mar 2025 05:40:42 +0000
Date: Mon, 31 Mar 2025 13:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 309/309]
 arch/arm64/boot/dts/qcom/sc7180-idp.dtb: dsi@ae94000: compatible:0:
 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl',
 'qcom,dsi-ctrl-6g-qcm2290']
Message-ID: <202503311352.Da4efkFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7277b856946dacef8402589e193e7d945922310f
commit: 0260175d7dcca87fdcde45024b89089d8b7c4805 [309/309] arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
config: arm64-randconfig-051-20250327 (https://download.01.org/0day-ci/archive/20250331/202503311352.Da4efkFY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311352.Da4efkFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311352.Da4efkFY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-idp.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: panel@0: 'ports', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: panel@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-idp.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: thermal-zones: '5v-choke-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: panel@0: 'avee-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: panel@0: 'avee-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: dsi@ae94000: 'opp-table', 'panel@0', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: panel@0: 'ports', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: phy@88e3000: qcom,preemphasis-width: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: phy@88e3000: qcom,hsdisc-trim-value: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: phy@88e3000: 'qcom,bias-ctrl-value', 'qcom,charge-ctrl-value', 'qcom,hsdisc-trim-value', 'qcom,imp-res-offset-value', 'qcom,preemphasis-level', 'qcom,preemphasis-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: video-codec@aa00000: 'operating-points-v2', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7180-venus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: mdss@ae00000: 'displayport-controller@ae90000', 'dsi-phy@ae94400', 'dsi@ae94000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: dsi@ae94000: compatible:0: 'qcom,sc7180-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: dsi@ae94000: compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: dsi@ae94000: 'opp-table', 'vdda-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /soc@0/mdss@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc7180-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /soc@0/wifi@18800000: failed to match any schema with compatible: ['qcom,wcn3990-wifi']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: lpass@62d87000: 'hdmi@5', 'mi2s@0', 'mi2s@1' do not match any of the regexes: '^dai-link@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: /audio-codec-0: failed to match any schema with compatible: ['maxim,max98360a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
