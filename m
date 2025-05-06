Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F1F27FB31
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533430; cv=none; b=IpLCehhO9Xeyq8/uiDQMDUtwPCByLTh0OcxSYw9WIng9wFyGtF+/lBWU/Pdj8hYhvOgqShBNJVfDyGhELiyQddcHBT7tZLPhD7ZqbmpuFqb66Sy8wZJ9qHRECWA3cMvM+Ib3zKPiPGIL7xNBF1vWZM7o9vx+j5sU5kZjwaxUrhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533430; c=relaxed/simple;
	bh=o9mbiliR+fdCyJQ7Ntcd/9m9LfwGScok90AEEn5DaWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kE6pAmND2kVRAcQdfuFry8ggqKWd8mjoOu0khT7JL5h2m2NFp2kPxe4MJcVXYuiIcOls8UN9QeQ0moyGYyU/H/x7JGZtXZ461h8MA3L8tkGLdhgIRQ16pD7w5kzlBAMdUTY/p0pzUQVQ8wp79dn2W6n3QoJYk8OhoEZzC1QICSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aS2wQWqH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aS2wQWqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746533428; x=1778069428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o9mbiliR+fdCyJQ7Ntcd/9m9LfwGScok90AEEn5DaWE=;
  b=aS2wQWqHCB9AsDG8Y8mK9LsCQGRusXnJubZ0XGFtNKrC0dYXlXJltN5C
   csC8efgkIeT6qFJRzbIJRlgmDqg6FXFBr67i5RKo8kudksrD0+2WfiZ+t
   nWirNMru127MS614JXCGkD/kT6nZMKdnfzSZHcG2DgMEUUf9sw+PwYE1r
   lCZyNKbwf7jKXn5nOKOxsuGl2pt6CO1xNjwFuvhPeUphiob3+Nxd+i7gQ
   wFfEo0LJxf1XjDMXrFBOnAN9FKKWP/ICmKktq5c3kadcqY1w4wkAbCV/d
   XuEX80ODE5A15OSN+RLiSyhnizn5Xlx4Mx63vAfsmmMayZnX5c8jIKWCd
   Q==;
X-CSE-ConnectionGUID: vXGGCqFpRnilU38lrzvdxw==
X-CSE-MsgGUID: ZRQ36BcbSeuPs+V9cyIZ7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47455339"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="47455339"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 05:10:27 -0700
X-CSE-ConnectionGUID: 193ijaujSya8ioEPGx4sMg==
X-CSE-MsgGUID: 11YY19TOR9W5MbC3B1E4dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136098146"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2025 05:10:26 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCH7v-00003G-1E;
	Tue, 06 May 2025 12:10:23 +0000
Date: Tue, 6 May 2025 20:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb:
 pinctrl@3500000 (qcom,sc7180-pinctrl): 'cam_sensor_front_active',
 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active',
 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1...
Message-ID: <202505062032.4qrj3yKy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   30abd607a3ae1471331390c09e0379cac9b65ebf
commit: 068cbf3c8211ea8f048b5009bc8ece7b0592bcbd [1/1] CHROMIUM: arm64: dts: qcom: Restore camera bits on quackingstick/wormdingler
config: arm64-randconfig-2051-20250505 (https://download.01.org/0day-ci/archive/20250506/202505062032.4qrj3yKy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505062032.4qrj3yKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505062032.4qrj3yKy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: soc@0 (simple-bus): qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: soc@0 (simple-bus): qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: soc@0 (simple-bus): qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: bluetooth (qcom,wcn3991-bt): 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: pinctrl@3500000 (qcom,sc7180-pinctrl): 'cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): '#address-cells', '#size-cells', 'dp-phy@88ea200', 'ranges', 'usb3-phy@88e9200' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:3: 'usb3_pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): reg: [[0, 143560704, 0, 396], [0, 143556608, 0, 60], [0, 143564800, 0, 396]] is too long
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: soc@0 (simple-bus): qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: soc@0 (simple-bus): cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: soc@0 (simple-bus): qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: bluetooth (qcom,wcn3991-bt): 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: pinctrl@3500000 (qcom,sc7180-pinctrl): 'cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): '#address-cells', '#size-cells', 'dp-phy@88ea200', 'ranges', 'usb3-phy@88e9200' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:3: 'usb3_pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): reg: [[0, 143560704, 0, 396], [0, 143556608, 0, 60], [0, 143564800, 0, 396]] is too long
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: soc@0 (simple-bus): qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: soc@0 (simple-bus): qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: soc@0 (simple-bus): qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: bluetooth (qcom,wcn3991-bt): 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: pinctrl@3500000 (qcom,sc7180-pinctrl): 'cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): '#address-cells', '#size-cells', 'dp-phy@88ea200', 'ranges', 'usb3-phy@88e9200' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:3: 'usb3_pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): reg: [[0, 143560704, 0, 396], [0, 143556608, 0, 60], [0, 143564800, 0, 396]] is too long
--
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: soc@0 (simple-bus): qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: soc@0 (simple-bus): qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: soc@0 (simple-bus): cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: bluetooth (qcom,wcn3991-bt): 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: pinctrl@3500000 (qcom,sc7180-pinctrl): 'cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): '#address-cells', '#size-cells', 'dp-phy@88ea200', 'ranges', 'usb3-phy@88e9200' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:3: 'usb3_pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): reg: [[0, 143560704, 0, 396], [0, 143556608, 0, 60], [0, 143564800, 0, 396]] is too long
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0 (simple-bus): qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0 (simple-bus): qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0 (simple-bus): qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: bluetooth (qcom,wcn3991-bt): 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000 (qcom,sc7180-pinctrl): 'cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): '#address-cells', '#size-cells', 'dp-phy@88ea200', 'ranges', 'usb3-phy@88e9200' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:3: 'usb3_pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): reg: [[0, 143560704, 0, 396], [0, 143556608, 0, 60], [0, 143564800, 0, 396]] is too long
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0 (simple-bus): qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0 (simple-bus): qcom,sync: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0 (simple-bus): qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: bluetooth (qcom,wcn3991-bt): 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000 (qcom,sc7180-pinctrl): 'cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): '#address-cells', '#size-cells', 'dp-phy@88ea200', 'ranges', 'usb3-phy@88e9200' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): clock-names:3: 'usb3_pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: phy-wrapper@88e9000 (qcom,sc7180-qmp-usb3-dp-phy): reg: [[0, 143560704, 0, 396], [0, 143556608, 0, 60], [0, 143564800, 0, 396]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
