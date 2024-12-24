Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534A311713
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 03:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735012466; cv=none; b=M5ibdA7FQRw2fCKmJEG3z+MrP+PJn4P4/RIZR4PMqU/0EkmniLEffdgVu+KYTIQvOlZI+pH60WC7YgnrzB0RGcULstoBlIgW9B21rL+QomCqfpc92nFjHgxKaKOG12L5dIF2FV65PslwUuuLqwfFIlClWJzVS9qHOwGz4iUbIWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735012466; c=relaxed/simple;
	bh=5Cqr8CF8d3FECX0W7h7bAtUVnL7p8GmqQf/bei8/zxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oL2QQYxqK0wMTcY5lPtJ3Bjd1O2uEoL8CTbAW0hALGK16K/gqfeNogncVOYNhzzzIm7KFOh5g5G7Kc4asCJcoK+GQSnqN8pZbJacCMjxuHQZTrHLpRchcTR9SCRd4CHhx3qOFQ78MK/YAqh+bNhf1436GUvwZ8i/nuNpYWoGk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm5jt+KT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm5jt+KT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735012464; x=1766548464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Cqr8CF8d3FECX0W7h7bAtUVnL7p8GmqQf/bei8/zxs=;
  b=Vm5jt+KTfNvx06IhG9JqMmnJ8ouITsNvZIPsMDT9V9DtmZ68ZrSvYGhW
   9V7AM6kSrtWaMKRwucYnS22g7TtJ8AEouE9oj7U1LXwJCisWpVBq65xW7
   KIqSpCD2KdOVr2v0sbplcXZT1PqlRGUH0jF83eA4WtxJG045FYekwguT9
   kI+cnYsUwi9nPXzJyfbMce1mGB89m5EUothmF4bnWZpi8ku90wKM5ACGN
   88DdS4mJ7hHuFuZCKCJiWS+biAQYxyKbfYrA0P0CtkN+xVNqIsVi8QW9s
   NCCmQJO/EiB+3zzOSLZLecTA+ZCKMXamxqjQaHt6zAKt/W/N9zf2apJ5w
   Q==;
X-CSE-ConnectionGUID: DcihmMnkRVmxPdkS3Tr63g==
X-CSE-MsgGUID: wJfQlJw1SOGXTekiQQsqdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35639592"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="35639592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 19:54:24 -0800
X-CSE-ConnectionGUID: 7yYwWGMXRWWbaG+Djm65gw==
X-CSE-MsgGUID: Tv4Exm0ARZCsoRFnNScY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99243890"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2024 19:54:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPvzw-0000nj-0v;
	Tue, 24 Dec 2024 03:54:20 +0000
Date: Tue, 24 Dec 2024 11:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: pinctrl@3500000:
 Unevaluated properties are not allowed ('cam_sensor_front_active',
 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active',
 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam...
Message-ID: <202412241126.Mhr0lukO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   8decd833dcf6e8e368c99562c3437b9113fcffad
commit: 51594ceda35aa53145e2d0e766c0432862b0ff21 [4/4] CHROMIUM: arm64: dts: qcom: sc7180: Include camera dtsi bits on homestar
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241224/202412241126.Mhr0lukO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412241126.Mhr0lukO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412241126.Mhr0lukO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: cam_smmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: soc@0: qcom,cam-res-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,ipe0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,bps: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,cam-req-mgr: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: soc@0: qcom,cam-icp: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: pinctrl@3500000: Unevaluated properties are not allowed ('cam_sensor_front_active', 'cam_sensor_front_suspend', 'cam_sensor_mclk0_active', 'cam_sensor_mclk0_suspend', 'cam_sensor_mclk1_active', 'cam_sensor_mclk1_suspend', 'cam_sensor_rear_active', 'cam_sensor_rear_suspend', 'cam_sensor_standby0_active', 'cam_sensor_standby0_suspend', 'cam_sensor_standby1_active', 'cam_sensor_standby1_suspend', 'cci0_active', 'cci0_suspend', 'cci1_active', 'cci1_suspend' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7180-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/qcom,sync: failed to match any schema with compatible: ['qcom,cam-sync']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/qcom,cam-req-mgr: failed to match any schema with compatible: ['qcom,cam-req-mgr']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu: failed to match any schema with compatible: ['qcom,msm-cam-smmu']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu/msm_cam_smmu_ife: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu/msm_cam_smmu_lrme: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu/msm_cam_smmu_jpeg: failed to match any schema with compatible: ['qcom,msm-cam-smmu-cb']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: /soc@0/cam_smmu/msm_cam_icp_fw: failed to match any schema with compatible: ['qcom,msm-cam-smmu-fw-dev']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
