Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743561A2643
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 19:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995826; cv=none; b=JAUvAXJzAetdFzXOHNORokc5arpsC23Jo+NG+0SxWXZAk2iqj27laLdFC7/pErtP7TnsKldkugXBoveC3uWX+V/6noezr7WFyoUuigu8a9UgUvc5Dr5TQsMTf1iVn4y5J427lsNPQmkSE8A+uraLnYAhTI5/c4XdBrGc6FNm7HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995826; c=relaxed/simple;
	bh=zRLewKDyo55D7gqMMeaRvjqTZVAMQsoejFgeNGRZ8wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PtSooeZf8CjX5zbgx/W2G1v4md6lWNrBOBIRF7LFBuVfIPXKHiWjB6fLU57zA6SlYsL2C6sTnhuDn25jkXBsi3CBwLZwV6ZEudq/XSSV8SkDjzp0FWABFm/GAXtGuMBWqorBdcroX7blmoQRhA5+tjMiwVL3bSYo2bn2meaBOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmgkpsQd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmgkpsQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725995824; x=1757531824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zRLewKDyo55D7gqMMeaRvjqTZVAMQsoejFgeNGRZ8wc=;
  b=KmgkpsQdlpPdfClSV/+OSaY5qCbfs1cyy5iE4A3XLyn1k8OBZpsEEPn7
   a7n2cl+3JD7jWpQyuoJOzqk6xvqpx6otR0fB2uLnzp+7ocWv1E3oSzqbc
   o55nf8oh//z+wE5cDUuW6Kz2KwW8Sw7y6tGo8yjlq8ysUZg68RmR4EYOA
   tO33KhDnJ1mG2GIj5oCW2lYVaBSsmOZ2alLC551SWK1Xfl9yKecWKrz/e
   pQU9H8n455bmEiYDtuB3FZKmv8HrWHUTTMPy8Qbj9L4tqie4/UWvxER8h
   UjI9nvEfU0cuTeksK/AE+ta4pLzvoLizsaxUlNc0Dgo++j3kz5dZqPKWm
   Q==;
X-CSE-ConnectionGUID: n1O1RMzwSxSyQewk2JC/ZQ==
X-CSE-MsgGUID: mGKU/OrVSXaaFyS24klDuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50180657"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="50180657"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 12:17:02 -0700
X-CSE-ConnectionGUID: 0eUgRWEoTniWQ16KnMJgaA==
X-CSE-MsgGUID: Ffs/G5o8THWqbFOaQ1Ngug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="71892110"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2024 12:17:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so6ME-0002WC-1x;
	Tue, 10 Sep 2024 19:16:58 +0000
Date: Wed, 11 Sep 2024 03:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 98/103]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning
 (unit_address_vs_reg): /soc/i2c@11008000/sensor_sub: node has a reg or
 ranges property, but no unit name
Message-ID: <202409110306.bC6lMHtb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0a13d43106da40acd77a81f638b332bfdf4a82a1
commit: e248909b30d8e2b4c779e09b359a55f592e7e890 [98/103] Revert "CHROMIUM: arm64: dts: mt8183: fix I2C bus unit address format errors"
config: arm64-randconfig-001-20240910 (https://download.01.org/0day-ci/archive/20240911/202409110306.bC6lMHtb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110306.bC6lMHtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110306.bC6lMHtb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (unit_address_vs_reg): /soc/i2c@11008000/sensor_sub: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/sensor_main: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/camera_main_af: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1682.18-1688.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1689.18-1692.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (i2c_bus_reg): /soc/i2c@11008000/sensor_sub: I2C bus unit address format error, expected "3d"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (i2c_bus_reg): /soc/i2c@11009000/sensor_main: I2C bus unit address format error, expected "10"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (i2c_bus_reg): /soc/i2c@11009000/camera_main_af: I2C bus unit address format error, expected "c"
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1206.21-1216.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1983.28-1987.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2097.27-2101.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi:98.25-131.4: Warning (unit_address_vs_reg): /soc/i2c@11008000/sensor_sub: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi:75.33-81.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/camera_main_af: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-camera-gc5035.dtsi:9.27-37.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/sensor_main: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1682.18-1688.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1689.18-1692.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi:98.25-131.4: Warning (i2c_bus_reg): /soc/i2c@11008000/sensor_sub: I2C bus unit address format error, expected "3d"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi:75.33-81.4: Warning (i2c_bus_reg): /soc/i2c@11009000/camera_main_af: I2C bus unit address format error, expected "c"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-camera-gc5035.dtsi:9.27-37.4: Warning (i2c_bus_reg): /soc/i2c@11009000/sensor_main: I2C bus unit address format error, expected "37"
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1206.21-1216.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1983.28-1987.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2097.27-2101.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi:98.25-131.4: Warning (unit_address_vs_reg): /soc/i2c@11008000/sensor_sub: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi:75.33-81.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/camera_main_af: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-camera-ov5695.dtsi:9.27-38.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/sensor_main: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1682.18-1688.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1689.18-1692.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi:98.25-131.4: Warning (i2c_bus_reg): /soc/i2c@11008000/sensor_sub: I2C bus unit address format error, expected "3d"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi:75.33-81.4: Warning (i2c_bus_reg): /soc/i2c@11009000/camera_main_af: I2C bus unit address format error, expected "c"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-camera-ov5695.dtsi:9.27-38.4: Warning (i2c_bus_reg): /soc/i2c@11009000/sensor_main: I2C bus unit address format error, expected "36"
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1206.21-1216.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1983.28-1987.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2097.27-2101.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (unit_address_vs_reg): /soc/i2c@11008000/sensor_sub: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/sensor_main: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/camera_main_af: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1682.18-1688.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1689.18-1692.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts:20.31-30.4: Warning (i2c_bus_reg): /soc/i2c@11007000/touchscreen@5D: I2C bus unit address format error, expected "5d"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (i2c_bus_reg): /soc/i2c@11008000/sensor_sub: I2C bus unit address format error, expected "3d"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (i2c_bus_reg): /soc/i2c@11009000/sensor_main: I2C bus unit address format error, expected "10"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (i2c_bus_reg): /soc/i2c@11009000/camera_main_af: I2C bus unit address format error, expected "c"
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1206.21-1216.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1983.28-1987.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2097.27-2101.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi:143.25-176.4: Warning (unit_address_vs_reg): /soc/i2c@11008000/sensor_sub: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi:84.27-118.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/sensor_main: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi:120.33-126.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/camera_main_af: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1682.18-1688.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1689.18-1692.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi:143.25-176.4: Warning (i2c_bus_reg): /soc/i2c@11008000/sensor_sub: I2C bus unit address format error, expected "3d"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi:84.27-118.4: Warning (i2c_bus_reg): /soc/i2c@11009000/sensor_main: I2C bus unit address format error, expected "10"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi:120.33-126.4: Warning (i2c_bus_reg): /soc/i2c@11009000/camera_main_af: I2C bus unit address format error, expected "c"
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1206.21-1216.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1983.28-1987.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2097.27-2101.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:524.27-528.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:530.27-534.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (unit_address_vs_reg): /soc/i2c@11008000/sensor_sub: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/sensor_main: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/camera_main_af: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1682.18-1688.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1689.18-1692.6: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dts:19.31-29.4: Warning (i2c_bus_reg): /soc/i2c@11007000/touchscreen@5D: I2C bus unit address format error, expected "5d"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (i2c_bus_reg): /soc/i2c@11008000/sensor_sub: I2C bus unit address format error, expected "3d"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (i2c_bus_reg): /soc/i2c@11009000/sensor_main: I2C bus unit address format error, expected "10"
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (i2c_bus_reg): /soc/i2c@11009000/camera_main_af: I2C bus unit address format error, expected "c"
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1206.21-1216.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal-sensor@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1983.28-1987.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2097.27-2101.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)

vim +159 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi

    85	
    86	&i2c2 {
    87		pinctrl-names = "default";
    88		pinctrl-0 = <&i2c2_pins>;
    89		status = "okay";
    90		clock-frequency = <400000>;
    91		vbus-supply = <&mt6358_vcamio_reg>;
    92	
    93		eeprom@58 {
    94			compatible = "atmel,24c32";
    95			reg = <0x58>;
    96			pagesize = <32>;
    97			vcc-supply = <&mt6358_vcama2_reg>;
    98		};
    99	
 > 100		sensor_main: sensor_main {
   101			status = "okay";
   102			compatible = "ovti,ov8856";
   103			reg = <0x10>;
   104	
   105			clocks = <&topckgen CLK_TOP_MUX_CAMTG>,
   106				 <&topckgen CLK_TOP_UNIVP_192M_D8>;
   107			clock-names = "xvclk", "freq_mux";
   108			clock-frequency = <19200000>;
   109	
   110			assigned-clocks = <&topckgen CLK_TOP_MUX_CAMTG>,
   111					  <&topckgen CLK_TOP_UNIVP_192M_D8>;
   112			assigned-clock-parents = <&topckgen CLK_TOP_UNIVP_192M_D8>;
   113			assigned-clock-rates = <0>, <24000000>;
   114	
   115			reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
   116			pinctrl-names = "default";
   117			pinctrl-0 = <&camera_pins_cam0>;
   118	
   119			avdd-supply = <&mt6358_vcama2_reg>;
   120			dvdd-supply = <&mt6358_vcamd_reg>;
   121			dovdd-supply = <&mt6358_vcamio_reg>;
   122	
   123			lens-focus = <&camera_main_af>;
   124	
   125			port {
   126				ov8856_endpoint: endpoint {
   127					clock-lanes = <0>;
   128					clock-noncontinuous;
   129					data-lanes = <1 2 3 4>;
   130					link-frequencies = /bits/ 64 <360000000 180000000>;
   131					remote-endpoint = <&seninf_port0_endpoint>;
   132				};
   133			};
   134		};
   135	
 > 136		camera_main_af: camera_main_af {
   137			compatible = "dongwoon,dw9768";
   138			reg = <0x0c>;
   139	
   140			vin-supply = <&mt6358_vcamio_reg>;
   141			vdd-supply = <&mt6358_vcama2_reg>;
   142		};
   143	};
   144	
   145	&i2c4 {
   146		pinctrl-names = "default";
   147		pinctrl-0 = <&i2c4_pins>;
   148		status = "okay";
   149		clock-frequency = <400000>;
   150		vbus-supply = <&mt6358_vcn18_reg>;
   151	
   152		eeprom@50 {
   153			compatible = "atmel,24c32";
   154			reg = <0x50>;
   155			pagesize = <32>;
   156			vcc-supply = <&mt6358_vcn18_reg>;
   157		};
   158	
 > 159		sensor_sub: sensor_sub {
   160			status = "okay";
   161			compatible = "ovti,ov02a10";
   162			reg = <0x3d>;
   163	
   164			clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
   165				 <&topckgen CLK_TOP_UNIVP_192M_D8>;
   166			clock-names = "eclk", "freq_mux";
   167			clock-frequency = <24000000>;
   168			rotation = <180>;
   169	
   170			assigned-clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
   171					  <&topckgen CLK_TOP_UNIVP_192M_D8>;
   172			assigned-clock-parents = <&topckgen CLK_TOP_UNIVP_192M_D8>;
   173			assigned-clock-rates = <0>, <24000000>;
   174	
   175			powerdown-gpios = <&pio 107 GPIO_ACTIVE_HIGH>;
   176			reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
   177			pinctrl-names = "default";
   178			pinctrl-0 = <&camera_pins_cam1>;
   179	
   180			avdd-supply = <&mt6358_vcama1_reg>;
   181			dvdd-supply = <&mt6358_vcn18_reg>;
   182			dovdd-supply = <&mt6358_vcamio_reg>;
   183	
   184			port {
   185				ov02a10_endpoint: endpoint {
   186					data-lanes = <1>;
   187					ovti,mipi-clock-voltage = <3>;
   188					link-frequencies = /bits/ 64 <390000000>;
   189					remote-endpoint = <&seninf_port1_endpoint>;
   190				};
   191			};
   192		};
   193	};
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
