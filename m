Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BDE1FF1C2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 19:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739389119; cv=none; b=jojW8LtZUj/xJk8PHOb9BQHx7SQbB1zKuNbWe+OJ4hV2kbKEyy3HyUena4W/pWIzF+eBJvKUW+RlMCw+j7lOXgILPrEj1bx+Uyc4Evj8nTYZ0WgfNRmEBWyPCL5uuokgxoiFBydcrvjxzT2rMzd8IvHfrhDq4UKWIFFW9QifuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739389119; c=relaxed/simple;
	bh=D0QfaI4C/owGta7Gm1QPfvDAggkQ6wgh5Eu/ScKcpLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aw8o01hp49ddIi0IxPlgIN2teKvnx7trGd5USJHPae8GkN2ZeUztDf8P+iWnQe3oO8iDY+OKZXsSrDVnya2qw7NXrcuRxNtFKz+PoegC5UdOVYG/KGtcW8Pi56HI1bra22swlh+9DpTlwnBAjkg0wDeNkYqcBvVGMLxiy0DON7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKlq/unM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKlq/unM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739389117; x=1770925117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D0QfaI4C/owGta7Gm1QPfvDAggkQ6wgh5Eu/ScKcpLU=;
  b=ZKlq/unMy6UlJ3FOI4RU/0JX8ZnRRLRYb1uxfbw4NXejuprw5WzYmRup
   7GWfiS3j6dDz09lHEziAyXudh8Af0omlKHpWtuhu7cdvCVBYV8htFbm/V
   DnvAW4STAVxA8cZD7aQFhKsRlCL7NBtRRPXSdF6gkxW4yZvCLgV23LWKM
   Ekvlpo9sRm52BcWn7smk1eLCxpfusCSXJlc8iYWu1dKtmzznRQfECLDss
   Jw0bJtKa7cu1i5+ID8Gmi0ImetIqlRBLNVgYOyKEf8Mwc/3O0BiPvWXeW
   jV/sRDZfykngrNb+VoCyN1vjRzI1Z6xTmlis1sEpd8U3gGgrflN08eRQM
   g==;
X-CSE-ConnectionGUID: sjPcpNI/Sq6QSaH1qOAYfQ==
X-CSE-MsgGUID: OD1nfd8rQyW7L2k4JE3xwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50715170"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="50715170"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 11:38:36 -0800
X-CSE-ConnectionGUID: +wM18PmRTee9gsDqy509iA==
X-CSE-MsgGUID: jrD6LL3jQ0mGQz/rVqvuvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="112883296"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Feb 2025 11:38:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiIZ6-00163j-26;
	Wed, 12 Feb 2025 19:38:32 +0000
Date: Thu, 13 Feb 2025 03:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 253/253]
 arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:299.33-303.6: Warning
 (unit_address_vs_reg):
 /soc/thermal-zones/bulk-board-thermal/trips/trip-point@0: node has a unit
 name, but no reg or ranges property
Message-ID: <202502130323.D2AlMqcN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   93b41cad381ad306bf523ee7dbdc82329ae221db
commit: b74e1a5d2d7e4817954aea87d1f1abb0c7d0df5e [253/253] CHROMIUM: arm64: dts: mediatek: mt8196: navi: add thermal tuning
config: arm64-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250213/202502130323.D2AlMqcN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130323.D2AlMqcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130323.D2AlMqcN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2640.18-2642.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@457500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2644.18-2646.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@385000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt6363.dtsi:139.40-141.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/mt6363-efuse/mt6363_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:72.40-74.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/second_pmic@5/mt6373-efuse/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:8.25-76.4: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:65.21-67.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:68.19-70.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:71.21-74.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3151.10-3155.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3157.14-3161.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:299.33-303.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:304.30-308.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2601.32-2647.5: Warning (simple_bus_reg): /soc/opp-table-apu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2862.35-2868.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2870.35-2876.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4680.17-4686.5: Warning (simple_bus_reg): /soc/apusys-apummu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4688.16-4713.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4715.16-4741.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4743.38-4750.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4752.38-4759.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4761.8-4766.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property

vim +299 arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi

   290	
   291	&thermal_zones {
   292		bulk-board-thermal {
   293			polling-delay = <1000>;
   294			polling-delay-passive = <1000>;
   295			thermal-sensors = <&cros_ec 0>;
   296			sustainable-power = <3350>; /* estimated sustainable power when saturated */
   297	
   298			trips {
 > 299				bulk_threshold: trip-point@0 {
   300					temperature = <45000>; /* switch on temperature */
   301					hysteresis = <2000>;
   302					type = "passive";
   303				};
   304				bulk_target: trip-point@1 {
   305					temperature = <50000>; /* desired temperature */
   306					hysteresis = <2000>;
   307					type = "passive";
   308				};
   309			};
   310	
   311			cooling-maps {
   312				map0 {
   313					trip = <&bulk_target>;
   314					cooling-device =
   315						<&cpu0 THERMAL_NO_LIMIT 10>,
   316						<&cpu1 THERMAL_NO_LIMIT 10>,
   317						<&cpu2 THERMAL_NO_LIMIT 10>,
   318						<&cpu3 THERMAL_NO_LIMIT 10>;
   319					contribution = <2048>;
   320				};
   321				map1 {
   322					trip = <&bulk_target>;
   323					cooling-device =
   324						<&cpu4 THERMAL_NO_LIMIT 16>,
   325						<&cpu5 THERMAL_NO_LIMIT 16>,
   326						<&cpu6 THERMAL_NO_LIMIT 16>;
   327					contribution = <1024>;
   328				};
   329				map2 {
   330					trip = <&bulk_target>;
   331					cooling-device =
   332						<&cpu7 THERMAL_NO_LIMIT 19>;
   333					contribution = <768>;
   334				};
   335			};
   336		};
   337	};
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
