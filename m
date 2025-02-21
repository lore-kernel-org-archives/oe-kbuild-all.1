Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7947A254AFC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 21:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740174128; cv=none; b=f6pMOlTsay3Sj8zqtTxJr6SYbupl2TknlS0Tg2Ll1wD/i7zt8SrcfEO83x+7XYpzltuH8DhEG5G0AwT/hv4otdcfr5tZDmkt5rhHmFe2QT7udfAkIBZk7ml01LZwHc4LYXAC/Vb1q/87TiDYOkocf2zQNo8FXGPUQrvYgDyLP+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740174128; c=relaxed/simple;
	bh=P1RzDAm57yJqI9+QxdwieaKWPvTelntN5/pMrq2cqVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eShrkey1h3i+qh6SgVYtTX2nBr616tZ31nP8MXuXgkIKu4M5gbYPhU8ABWAZ0z/ew2m2dnwumzQqn2EOC8vbiUQETwgLdL2q8+o45UUvFPZhTAaE6ahkcPSiHSMNG/BqdpSCzycrdQDzQHFdRNsAIhTSv6L9i/fPLWxtBrkR3fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPD/8utL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPD/8utL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740174125; x=1771710125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P1RzDAm57yJqI9+QxdwieaKWPvTelntN5/pMrq2cqVQ=;
  b=IPD/8utL0jMBKJc0M3fOJx3+xICzmlAAW4wd1uiYx+8ohM4nh0pqr8ub
   H45i/hlYV1S7ki2gP9+DoXA3Ua0IKEHavMhUPJYawBM4OBN5P2Hv6z4mW
   d/BrP6bUkKh08VvvN2az7OVrviudIWZRHUC/0ABD7Kjx/gQrBonYwuwtM
   VcYmTVfH1SFsQHKKQB1adCZ28OHCI0F3CH0/IsGOI0Np1A8112ZwZaOCk
   Euu2F62P2irtsi/+/mLjqsulk9xSggUR9KrhOYd9OkvRgEP4oqH0ZByWH
   lRD5+u7phcd2Ep45YRqQBi/KF44VPdLIVZusl1k8o3EGK8u0MZyEHlICc
   w==;
X-CSE-ConnectionGUID: 55KhlMa+QCSHqj9gGc3EwA==
X-CSE-MsgGUID: uliFbQdoSbqLNKzcbPFNPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="66372200"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="66372200"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 13:42:05 -0800
X-CSE-ConnectionGUID: K03AtDmuSOS61CaIdU3Rqg==
X-CSE-MsgGUID: ph1yg61iR5i3Nbp/V0Cw+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="138711287"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2025 13:42:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlamO-00062r-1s;
	Fri, 21 Feb 2025 21:41:53 +0000
Date: Sat, 22 Feb 2025 05:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 4/4]
 arch/arm64/boot/dts/mediatek/mt6363.dtsi:143.41-145.7: Warning
 (unit_address_vs_reg):
 /soc/spmi@1c01a000/pmic@4/efuse/nvmem-layout/mt6363_e_data: node has a reg
 or ranges property, but no unit name
Message-ID: <202502220541.gySnnhuV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b17b52e8ec6ada4a6a6fd7ee9bc5f6c9d3188cb8
commit: f1918d36e1f6440b62d4e448b9cb716f05707faf [4/4] CHROMIMU: arm64: dts: mt8196: Modify PMIC node name be generic
config: arm64-randconfig-001-20250221 (https://download.01.org/0day-ci/archive/20250222/202502220541.gySnnhuV-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220541.gySnnhuV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220541.gySnnhuV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2600.19-2602.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2604.19-2606.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1450000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2608.19-2610.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1300000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2612.19-2614.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1115000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2616.18-2618.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@930000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2620.18-2622.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@730000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2624.18-2626.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@630000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2628.18-2630.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@530000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2632.18-2634.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@457500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2636.18-2638.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@385000000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt6363.dtsi:143.41-145.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/efuse/nvmem-layout/mt6363_e_data: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3146.10-3150.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3152.14-3156.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:45.27-52.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2593.32-2639.5: Warning (simple_bus_reg): /soc/opp-table-apu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2854.35-2860.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2862.35-2868.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4676.17-4682.5: Warning (simple_bus_reg): /soc/apusys-apummu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4684.16-4709.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4711.16-4737.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4739.38-4746.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2600.19-2602.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2604.19-2606.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1450000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2608.19-2610.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1300000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2612.19-2614.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1115000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2616.18-2618.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@930000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2620.18-2622.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@730000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2624.18-2626.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@630000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2628.18-2630.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@530000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2632.18-2634.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@457500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2636.18-2638.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@385000000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt6363.dtsi:143.41-145.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/efuse/nvmem-layout/mt6363_e_data: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3146.10-3150.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3152.14-3156.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:281.33-285.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:286.30-290.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2593.32-2639.5: Warning (simple_bus_reg): /soc/opp-table-apu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2854.35-2860.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2862.35-2868.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4676.17-4682.5: Warning (simple_bus_reg): /soc/apusys-apummu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4684.16-4709.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4711.16-4737.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2600.19-2602.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2604.19-2606.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1450000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2608.19-2610.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1300000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2612.19-2614.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1115000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2616.18-2618.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@930000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2620.18-2622.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@730000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2624.18-2626.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@630000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2628.18-2630.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@530000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2632.18-2634.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@457500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2636.18-2638.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@385000000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt6363.dtsi:143.41-145.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/efuse/nvmem-layout/mt6363_e_data: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3146.10-3150.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3152.14-3156.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2593.32-2639.5: Warning (simple_bus_reg): /soc/opp-table-apu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2854.35-2860.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2862.35-2868.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4676.17-4682.5: Warning (simple_bus_reg): /soc/apusys-apummu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4684.16-4709.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4711.16-4737.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4739.38-4746.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4748.38-4755.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2600.19-2602.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2604.19-2606.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1450000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2608.19-2610.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1300000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2612.19-2614.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@1115000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2616.18-2618.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@930000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2620.18-2622.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@730000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2624.18-2626.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@630000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2628.18-2630.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@530000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2632.18-2634.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@457500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2636.18-2638.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@385000000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt6363.dtsi:143.41-145.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/efuse/nvmem-layout/mt6363_e_data: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3146.10-3150.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3152.14-3156.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2593.32-2639.5: Warning (simple_bus_reg): /soc/opp-table-apu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2854.35-2860.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2862.35-2868.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4676.17-4682.5: Warning (simple_bus_reg): /soc/apusys-apummu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4684.16-4709.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4711.16-4737.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4739.38-4746.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4748.38-4755.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property

vim +143 arch/arm64/boot/dts/mediatek/mt6363.dtsi

20943b200aa83b Xavier Chang 2024-07-02    7  
20943b200aa83b Xavier Chang 2024-07-02    8  &spmi {
20943b200aa83b Xavier Chang 2024-07-02    9  	main_pmic: pmic@4 {
20943b200aa83b Xavier Chang 2024-07-02   10  		compatible = "mediatek,mt6363";
20943b200aa83b Xavier Chang 2024-07-02   11  		reg = <0x4 SPMI_USID>;
f1918d36e1f644 Lu Tang      2025-02-17   12  		interrupts = <0x4 IRQ_TYPE_NONE>;
20943b200aa83b Xavier Chang 2024-07-02   13  		#address-cells = <0>;
20943b200aa83b Xavier Chang 2024-07-02   14  		interrupt-controller;
20943b200aa83b Xavier Chang 2024-07-02   15  		#interrupt-cells = <2>;
20943b200aa83b Xavier Chang 2024-07-02   16  
f1918d36e1f644 Lu Tang      2025-02-17   17  		pmic_adc: adc {
20943b200aa83b Xavier Chang 2024-07-02   18  			compatible = "mediatek,mt6363-auxadc";
20943b200aa83b Xavier Chang 2024-07-02   19  			#io-channel-cells = <1>;
20943b200aa83b Xavier Chang 2024-07-02   20  
20943b200aa83b Xavier Chang 2024-07-02   21  			batadc {
20943b200aa83b Xavier Chang 2024-07-02   22  				channel = <AUXADC_BATADC>;
20943b200aa83b Xavier Chang 2024-07-02   23  				resistance-ratio = <4 1>;
20943b200aa83b Xavier Chang 2024-07-02   24  				avg-num = <64>;
20943b200aa83b Xavier Chang 2024-07-02   25  			};
20943b200aa83b Xavier Chang 2024-07-02   26  
20943b200aa83b Xavier Chang 2024-07-02   27  			bat-temp {
20943b200aa83b Xavier Chang 2024-07-02   28  				channel = <AUXADC_BAT_TEMP>;
20943b200aa83b Xavier Chang 2024-07-02   29  				resistance-ratio = <3 2>;
20943b200aa83b Xavier Chang 2024-07-02   30  			};
20943b200aa83b Xavier Chang 2024-07-02   31  
20943b200aa83b Xavier Chang 2024-07-02   32  			chip-temp {
20943b200aa83b Xavier Chang 2024-07-02   33  				channel = <AUXADC_CHIP_TEMP>;
20943b200aa83b Xavier Chang 2024-07-02   34  			};
20943b200aa83b Xavier Chang 2024-07-02   35  
20943b200aa83b Xavier Chang 2024-07-02   36  			vcore-temp {
20943b200aa83b Xavier Chang 2024-07-02   37  				channel = <AUXADC_VCORE_TEMP>;
20943b200aa83b Xavier Chang 2024-07-02   38  			};
20943b200aa83b Xavier Chang 2024-07-02   39  
20943b200aa83b Xavier Chang 2024-07-02   40  			vproc-temp {
20943b200aa83b Xavier Chang 2024-07-02   41  				channel = <AUXADC_VPROC_TEMP>;
20943b200aa83b Xavier Chang 2024-07-02   42  			};
20943b200aa83b Xavier Chang 2024-07-02   43  
20943b200aa83b Xavier Chang 2024-07-02   44  			vgpu-temp {
20943b200aa83b Xavier Chang 2024-07-02   45  				channel = <AUXADC_VGPU_TEMP>;
20943b200aa83b Xavier Chang 2024-07-02   46  			};
20943b200aa83b Xavier Chang 2024-07-02   47  
20943b200aa83b Xavier Chang 2024-07-02   48  			vtref {
20943b200aa83b Xavier Chang 2024-07-02   49  				channel = <AUXADC_VTREF>;
20943b200aa83b Xavier Chang 2024-07-02   50  				resistance-ratio = <3 2>;
20943b200aa83b Xavier Chang 2024-07-02   51  			};
20943b200aa83b Xavier Chang 2024-07-02   52  
20943b200aa83b Xavier Chang 2024-07-02   53  			vsyssns {
20943b200aa83b Xavier Chang 2024-07-02   54  				channel = <AUXADC_VSYSSNS>;
20943b200aa83b Xavier Chang 2024-07-02   55  				resistance-ratio = <3 1>;
20943b200aa83b Xavier Chang 2024-07-02   56  				avg-num = <64>;
20943b200aa83b Xavier Chang 2024-07-02   57  			};
20943b200aa83b Xavier Chang 2024-07-02   58  
20943b200aa83b Xavier Chang 2024-07-02   59  			imp {
20943b200aa83b Xavier Chang 2024-07-02   60  				channel = <AUXADC_IMP>;
20943b200aa83b Xavier Chang 2024-07-02   61  				resistance-ratio = <4 1>;
20943b200aa83b Xavier Chang 2024-07-02   62  			};
20943b200aa83b Xavier Chang 2024-07-02   63  
20943b200aa83b Xavier Chang 2024-07-02   64  			vin1-100k {
20943b200aa83b Xavier Chang 2024-07-02   65  				channel = <AUXADC_VIN1>;
20943b200aa83b Xavier Chang 2024-07-02   66  				pures = <ADC_PURES_100K>;
20943b200aa83b Xavier Chang 2024-07-02   67  			};
20943b200aa83b Xavier Chang 2024-07-02   68  
20943b200aa83b Xavier Chang 2024-07-02   69  			vin1-open {
20943b200aa83b Xavier Chang 2024-07-02   70  				channel = <AUXADC_VIN1>;
20943b200aa83b Xavier Chang 2024-07-02   71  				pures = <ADC_PURES_OPEN>;
20943b200aa83b Xavier Chang 2024-07-02   72  			};
20943b200aa83b Xavier Chang 2024-07-02   73  
20943b200aa83b Xavier Chang 2024-07-02   74  			vin2-100k {
20943b200aa83b Xavier Chang 2024-07-02   75  				channel = <AUXADC_VIN2>;
20943b200aa83b Xavier Chang 2024-07-02   76  				pures = <ADC_PURES_100K>;
20943b200aa83b Xavier Chang 2024-07-02   77  			};
20943b200aa83b Xavier Chang 2024-07-02   78  
20943b200aa83b Xavier Chang 2024-07-02   79  			vin2-open {
20943b200aa83b Xavier Chang 2024-07-02   80  				channel = <AUXADC_VIN2>;
20943b200aa83b Xavier Chang 2024-07-02   81  				pures = <ADC_PURES_OPEN>;
20943b200aa83b Xavier Chang 2024-07-02   82  			};
20943b200aa83b Xavier Chang 2024-07-02   83  
20943b200aa83b Xavier Chang 2024-07-02   84  			vin3-100k {
20943b200aa83b Xavier Chang 2024-07-02   85  				channel = <AUXADC_VIN3>;
20943b200aa83b Xavier Chang 2024-07-02   86  				pures = <ADC_PURES_100K>;
20943b200aa83b Xavier Chang 2024-07-02   87  			};
20943b200aa83b Xavier Chang 2024-07-02   88  
20943b200aa83b Xavier Chang 2024-07-02   89  			vin3-open {
20943b200aa83b Xavier Chang 2024-07-02   90  				channel = <AUXADC_VIN3>;
20943b200aa83b Xavier Chang 2024-07-02   91  				pures = <ADC_PURES_OPEN>;
20943b200aa83b Xavier Chang 2024-07-02   92  			};
20943b200aa83b Xavier Chang 2024-07-02   93  
20943b200aa83b Xavier Chang 2024-07-02   94  			vin4-100k {
20943b200aa83b Xavier Chang 2024-07-02   95  				channel = <AUXADC_VIN4>;
20943b200aa83b Xavier Chang 2024-07-02   96  				pures = <ADC_PURES_100K>;
20943b200aa83b Xavier Chang 2024-07-02   97  			};
20943b200aa83b Xavier Chang 2024-07-02   98  
20943b200aa83b Xavier Chang 2024-07-02   99  			vin4-open {
20943b200aa83b Xavier Chang 2024-07-02  100  				channel = <AUXADC_VIN4>;
20943b200aa83b Xavier Chang 2024-07-02  101  				pures = <ADC_PURES_OPEN>;
20943b200aa83b Xavier Chang 2024-07-02  102  			};
20943b200aa83b Xavier Chang 2024-07-02  103  
20943b200aa83b Xavier Chang 2024-07-02  104  			vin5-100k {
20943b200aa83b Xavier Chang 2024-07-02  105  				channel = <AUXADC_VIN5>;
20943b200aa83b Xavier Chang 2024-07-02  106  				pures = <ADC_PURES_100K>;
20943b200aa83b Xavier Chang 2024-07-02  107  			};
20943b200aa83b Xavier Chang 2024-07-02  108  
20943b200aa83b Xavier Chang 2024-07-02  109  			vin5-open {
20943b200aa83b Xavier Chang 2024-07-02  110  				channel = <AUXADC_VIN5>;
20943b200aa83b Xavier Chang 2024-07-02  111  				pures = <ADC_PURES_OPEN>;
20943b200aa83b Xavier Chang 2024-07-02  112  			};
20943b200aa83b Xavier Chang 2024-07-02  113  
20943b200aa83b Xavier Chang 2024-07-02  114  			vin6-100k {
20943b200aa83b Xavier Chang 2024-07-02  115  				channel = <AUXADC_VIN6>;
20943b200aa83b Xavier Chang 2024-07-02  116  				pures = <ADC_PURES_100K>;
20943b200aa83b Xavier Chang 2024-07-02  117  			};
20943b200aa83b Xavier Chang 2024-07-02  118  
20943b200aa83b Xavier Chang 2024-07-02  119  			vin6-open {
20943b200aa83b Xavier Chang 2024-07-02  120  				channel = <AUXADC_VIN6>;
20943b200aa83b Xavier Chang 2024-07-02  121  				pures = <ADC_PURES_OPEN>;
20943b200aa83b Xavier Chang 2024-07-02  122  			};
20943b200aa83b Xavier Chang 2024-07-02  123  
20943b200aa83b Xavier Chang 2024-07-02  124  			vin7-100k {
20943b200aa83b Xavier Chang 2024-07-02  125  				channel = <AUXADC_VIN7>;
20943b200aa83b Xavier Chang 2024-07-02  126  				pures = <ADC_PURES_100K>;
20943b200aa83b Xavier Chang 2024-07-02  127  			};
20943b200aa83b Xavier Chang 2024-07-02  128  
20943b200aa83b Xavier Chang 2024-07-02  129  			vin7-open {
20943b200aa83b Xavier Chang 2024-07-02  130  				channel = <AUXADC_VIN7>;
20943b200aa83b Xavier Chang 2024-07-02  131  				pures = <ADC_PURES_OPEN>;
20943b200aa83b Xavier Chang 2024-07-02  132  			};
20943b200aa83b Xavier Chang 2024-07-02  133  		};
20943b200aa83b Xavier Chang 2024-07-02  134  
f1918d36e1f644 Lu Tang      2025-02-17  135  		mt6363efuse: efuse {
20943b200aa83b Xavier Chang 2024-07-02  136  			compatible = "mediatek,mt6363-efuse";
f1918d36e1f644 Lu Tang      2025-02-17  137  
f1918d36e1f644 Lu Tang      2025-02-17  138  			nvmem-layout {
f1918d36e1f644 Lu Tang      2025-02-17  139  				compatible = "fixed-layout";
20943b200aa83b Xavier Chang 2024-07-02  140  				#address-cells = <1>;
20943b200aa83b Xavier Chang 2024-07-02  141  				#size-cells = <1>;
f1918d36e1f644 Lu Tang      2025-02-17  142  
20943b200aa83b Xavier Chang 2024-07-02 @143  				mt6363_thermal_efuse: mt6363_e_data {

:::::: The code at line 143 was first introduced by commit
:::::: 20943b200aa83bffe9cfc3637024785802e306b0 CHROMIUM: arm64: dts: mt8196: Add spmi/pmic device node

:::::: TO: Xavier Chang <xavier.chang@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
