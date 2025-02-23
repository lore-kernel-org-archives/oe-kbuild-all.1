Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE90208D0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 03:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740279707; cv=none; b=jV+bhyKxLPQ0VG8P29SCUQC4XHPOIRBXpzECoqOiFFAHogzNV66DHJO2qxTmDUO7ktR+bstFbkfmw9fozhy3oxlYyc8GMVADGEDeyhRoYyUVs5VfErFVrjClw3MCfpo5FQQPpN22q94J51h8L0s4ySygYet8byY6PvXmymlBFl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740279707; c=relaxed/simple;
	bh=5AGy6zEJJeL0xIiaIbn6qRSY5dWeTZG1rQ5q/dCniSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gWUDvbfTxaUdomz+9ePNNRdYwrOnFwlaas8u7VQsH0WicT35xamugPPdjokOg1XzYaUyB6bkvvt9qFgTzltzCEPuUmuPhOCKRAl4txL3WXp3qgecjyIXiyqiyM1Q0ot4muNf61+mP8tAlmpSYbl2d4CCTqWRtEfgzkR+K4RP11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgZ4Q0ui; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgZ4Q0ui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740279706; x=1771815706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5AGy6zEJJeL0xIiaIbn6qRSY5dWeTZG1rQ5q/dCniSo=;
  b=lgZ4Q0uixNRCNL4DJz3yD+CCzLyFhccUmXz9GbUCppXF5HwpSGaCJH/z
   5CfVU1vyToTnpQX4Mmg55bYOXaelBqd4Sg96dpzGvfpW40vFqqhDTrdNp
   NBZiASXYQ6qytl9A4GahpWLyX9X357/2BZv20b+fJa1vfG8BuRvw2n6NW
   N5RMqwzWgNMrD6NCWujYQCcGa6fAfMW+YZ+Hg1K4wV34iM9LiVH6lLkb4
   yjRzies+C0j2TsJKS+p2W4WGzs6DFNIy09wQTG2n0Ouw+ylenpcxPihLH
   mORtoMgpnOqps0vbSyhYezghmZeqeUtJzDMvPcmZj7NJHAWbPH34HJB/0
   A==;
X-CSE-ConnectionGUID: BYLwmxwySZuOMFyC4s85hA==
X-CSE-MsgGUID: 7TLIiIwRQQug/rlDTm75mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40937101"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40937101"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 19:01:43 -0800
X-CSE-ConnectionGUID: isLUtxE9Q3ukMuwtDoqGHQ==
X-CSE-MsgGUID: zueoz9GGRW2x4B4E7cGddQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115570099"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2025 19:01:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm2FP-00075d-1O;
	Sun, 23 Feb 2025 03:01:39 +0000
Date: Sun, 23 Feb 2025 11:00:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-lts 1/1]
 arch/arm64/boot/dts/mediatek/mt8173-evb.dtb:
 /soc/pwrap@1000d000/pmic/regulators: failed to match any schema with
 compatible: ['mediatek,mt6397-regulator']
Message-ID: <202502231047.gwvDFrAW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   100e5d54ced2ed22d23bb58d456bdf23c2f57ba7
commit: 4b14695a7bdaf09d9ec015f28ea197746aaab866 [1/1] arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
config: arm64-randconfig-052-20250220 (https://download.01.org/0day-ci/archive/20250223/202502231047.gwvDFrAW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231047.gwvDFrAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231047.gwvDFrAW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/syscfg_pctl_a@10005000: failed to match any schema with compatible: ['mediatek,mt8173-pctl-a-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pinctrl@1000b000: 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'spi0', 'usb_iddig_pull_down', 'usb_iddig_pull_up', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pwrap@1000d000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8173-thermal']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: syscon@14000000: 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
