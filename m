Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682B33997
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 04:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737346991; cv=none; b=dT6mEeH3xFHTsv5yzynfC/BTDYyUZ2sLftA9Gs0rGCBVl9hLyUt8dHsZod/3sFakCXdaSRrYlTUCo7g3DUbAT6v+Bl4oAVrcztDGykMOfSMatXUhkkQdQAyfsBRHeMUGH3J6SuZGfWQeIfcVfGmskeg0fBMSvpRqfywo/Z7e3uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737346991; c=relaxed/simple;
	bh=0IwdHidqVLu+bWVTD8sld0qJmdFl6gN2pR55Z4q01tY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CaHkAdLQPj3wdm4HWlFoiCHgSBQH487aPigNy9pKBZ+cr9M2QP5RrbcgfzZj6fB6IAErwKquNixMgAc2aHBM2qmZFdAh0pW5uLonkQQeaJ3PJ0ICrzG5fnckEmHTLga12YvJaiXujCUtmHqLoUP1gLmYg5A2CugL9s/RUpUd70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGcLuIMb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGcLuIMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737346989; x=1768882989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IwdHidqVLu+bWVTD8sld0qJmdFl6gN2pR55Z4q01tY=;
  b=oGcLuIMbY9P9rHROAnb/Nsu5bFpEGwdL7VNVfg7meb98qiL2s6F0tH3Y
   2557nbqOA19w+MsO9ZDINOzTOEm+4z9bFzTvun4LNyUsVAWtRVyUKZGJt
   Y0Zi7UWB6p0dmFO3AIbiu0fnkO0lZu5ihOcU0sNNZvBjGF0nifvtGIHQZ
   j2Kz85R4eStBOS7c6Bh6pAbk40QOiCdDNzJbQ6LtXPQw9LV0Xq3q1bm9Z
   8VM6DZSyFphvo/dvNVYlAVhENg02tnT0RUTnNvtlkA8s5ow7h2vxLxBKU
   RaeXtZmkauwJP8++CIYtG5v2tXGeg+shFWOovCHkZLzStflrlxFN0c4wd
   Q==;
X-CSE-ConnectionGUID: MZnGVDybSzSc4xNPJW75ww==
X-CSE-MsgGUID: 5XSheId3QaGCYyFDyiVvTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="40513160"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="40513160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 20:23:08 -0800
X-CSE-ConnectionGUID: lwT8tthjR2aALhE4tXPNKQ==
X-CSE-MsgGUID: eBZhGEBbThW9qIYX2YRiPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107258072"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jan 2025 20:23:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZjJZ-000WBL-09;
	Mon, 20 Jan 2025 04:23:05 +0000
Date: Mon, 20 Jan 2025 12:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 333/333]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/pinctrl@1002d000: failed
 to match any schema with compatible: ['mediatek,mt8196-pinctrl']
Message-ID: <202501201225.FX2AphHb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   57406f61d18c1c4fd302b7f258dbf947062f55c9
commit: 22882fd26feeb6888a2a57d59992753756dcfcd3 [333/333] CHROMIUM: arm64: dts: mt8196: Add mediatek pinctrl dts
config: arm64-randconfig-052-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201225.FX2AphHb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201225.FX2AphHb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201225.FX2AphHb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8196-cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8196-cksys-gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8196-infracfg-ao', 'mediatek,mt8196-infracfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8196-infracfg-ao', 'mediatek,mt8196-infracfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/pinctrl@1002d000: failed to match any schema with compatible: ['mediatek,mt8196-pinctrl']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@120a0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
