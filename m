Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EBE72628
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746755423; cv=none; b=mr/vvyr99V7yttuZWguCBpfluPauURLxrKB5yJX4CSjchxEtdPrtxeP2DAfWUB5mAFUaPqP2Y+aWB142/lEpqRrGgcgMDVYnIsBuBsQeToSd9l/pZPc2aSLUKO4VLqTbXEd1S0MdPf0HqaDh0vA0S3LVk7qPmQmh2GcRTzxCbPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746755423; c=relaxed/simple;
	bh=e+VdOoN+NVbzuwKz/wt+NUD0okznmptptOoWsgYdeaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9DekJNJG4jdwgmJzLC8Tt34mn6fYJTgyC5SELpoHGph9od99moQ8KQ5qOKiJveoQU88UUKovj5NcRYak6LjZ9bbnOodnPOi9V3jw45t/T/jlBbUYmr5W9+pPs3E4CggS4tWKXdyb7AmiryspZELnGKjU+1kl5scGFzxgfLOh1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsBb9VST; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsBb9VST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746755422; x=1778291422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e+VdOoN+NVbzuwKz/wt+NUD0okznmptptOoWsgYdeaM=;
  b=SsBb9VSTaOp7quSc8y4bHFSLy/UMRKc+crVpXAegJ4kdsnHtvi3uJEJe
   MsYqwcTWzYk6eBv+++Obt17nEoIsvlG2//WzYJ+I07g56JmUZBh5URvF3
   zqvChnyHelnrbWT6g94K+XT/thHuIJsIUxJzeYbdeglPyyZbx3Jp94wBN
   xVxHrxR8EzuQjxO7EXNotp0w+2WnB2WGY67Elwasvtqtudzb/fhqFpAU3
   vAGRvva1FxC1ZfAmmSmHHq9A51O8cPu3YqF81vWe/2xr/81u+dZQk36K9
   7eKabctabhsdwuppgPAbUqnTUI7OF8nx15VRGaRKOasynnjCw4UbUghgT
   Q==;
X-CSE-ConnectionGUID: +ABwDrCnRI+cQVfTDG9VuA==
X-CSE-MsgGUID: KPbrB2yMSjmMUuubPFk70Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48724139"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48724139"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 18:50:07 -0700
X-CSE-ConnectionGUID: 3Jc0YmH9T96p8bPGWyZNfA==
X-CSE-MsgGUID: Lsk8Ll+GRKywmBlDk0Xf7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136406135"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 18:49:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDCrL-000BXx-0T;
	Fri, 09 May 2025 01:49:07 +0000
Date: Fri, 9 May 2025 09:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 63/63]
 arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning
 (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0:
 node has a unit name, but no reg or ranges property
Message-ID: <202505090912.TXPJF8yc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0df15b2007c16153a62fd4bfaa4b4ba8a7669d04
commit: b70293563f602ebc621c9c897798dc3501a351df [63/63] CHROMIUM: arm64: dts: mediatek: mt8196: hylia: Add thermistors
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250509/202505090912.TXPJF8yc-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090912.TXPJF8yc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090912.TXPJF8yc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2638.18-2641.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@530000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2643.18-2646.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@457500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2648.18-2651.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@385000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt6363.dtsi:143.41-145.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/efuse/nvmem-layout/mt6363_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3153.10-3157.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3159.14-3163.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:689.31-693.6: Warning (unit_address_vs_reg): /soc/thermal-zones/reg-5v-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:703.34-707.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:717.32-721.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:731.32-735.6: Warning (unit_address_vs_reg): /soc/thermal-zones/ambient-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2595.32-2652.5: Warning (simple_bus_reg): /soc/opp-table-apu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2867.35-2873.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2875.35-2881.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4681.17-4687.5: Warning (simple_bus_reg): /soc/apusys-apummu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4689.16-4716.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4718.16-4746.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4758.38-4765.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4767.38-4774.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4776.8-4781.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4783.16-4791.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property

vim +689 arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi

   681	
   682	&thermal_zones {
   683		reg-5v-thermal {
   684			polling-delay = <0>;
   685			polling-delay-passive = <0>;
   686			thermal-sensors = <&cros_ec 0>;
   687	
   688			trips {
 > 689				reg_5v_trip0: trip-point@0 {
   690					temperature = <65000>;
   691					hysteresis = <2000>;
   692					type = "hot";
   693				};
   694			};
   695		};
   696	
   697		cpu-board-thermal {
   698			polling-delay = <0>;
   699			polling-delay-passive = <0>;
   700			thermal-sensors = <&cros_ec 1>;
   701	
   702			trips {
 > 703				cpu_board_trip0: trip-point@0 {
   704					temperature = <75000>;
   705					hysteresis = <2000>;
   706					type = "hot";
   707				};
   708			};
   709		};
   710	
   711		charger-thermal {
   712			polling-delay = <0>;
   713			polling-delay-passive = <0>;
   714			thermal-sensors = <&cros_ec 2>;
   715	
   716			trips {
 > 717				charger_trip0: trip-point@0 {
   718					temperature = <75000>;
   719					hysteresis = <2000>;
   720					type = "hot";
   721				};
   722			};
   723		};
   724	
   725		ambient-thermal {
   726			polling-delay = <0>;
   727			polling-delay-passive = <0>;
   728			thermal-sensors = <&cros_ec 3>;
   729	
   730			trips {
 > 731				ambient_trip0: trip-point@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
