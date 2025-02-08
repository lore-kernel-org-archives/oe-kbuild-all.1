Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C11854
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 04:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738987380; cv=none; b=Q14SwY4uA+fdOlARWiyb3amfd+8MGBSEsrdao+LXltjh6THaNR7elo+7/8zjHXNA2ielgMFZLIPQ72uVXZbwrPimgnVwpha8FDIdtGFdX7X8ynfpWXHEbeMkWcugbYzqyInzOWIP2AlZBmxaT74b/WoR1vSU/LHg+lL1IqRbieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738987380; c=relaxed/simple;
	bh=Gr0AI03PKB8fWRpk2lIwPnTtxlTKRtosUG3YijiUPK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JRT2OvX66CtTwykdMoafuiAI9hKPEl8JBFJzi+Fv2Uo1CLSSc4jlSCxQCeQ2gDRU5SjChmX2nGGdvGClpJTGAx/MZL5Pc5Ug/7Bb0O0Qtt8DTd1SquUbjgVdC3kWdjPs+BgCYOq+262qL9fl+sndqiHkcbMZzOG0nM3sXdxvyGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JF73pr9U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JF73pr9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738987379; x=1770523379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gr0AI03PKB8fWRpk2lIwPnTtxlTKRtosUG3YijiUPK4=;
  b=JF73pr9UQvWaSnkL+FquehFUWvSa22MxT4vT28Td+EWuYBJ7lDr7n2N+
   qYipztWDQl9Kkb5f3QXU9ucr+DxO8ivOtUO+EpTj+1OLm9fdOo0a4SaBC
   ig9rmF6Ia7L9pTVZ4xXHlqcbGtB4mmxDyjlrAgzUjfWmGvk3vn3oILbnU
   1ErY6LjqZplceBwKeJdB4jthIj9la1qQuDXjjPrEsvz3St4o891P2DFbd
   92j6PuVy1aLbGTG8N0TTfNRHqv7p/F98NC46RKTorSxSiRwcPUZc0QWl6
   PPCjn1rcMlQ0yEah4uzkYf/N31oDfcApofgNjaPoxrnC52JTvpR5tdJXP
   Q==;
X-CSE-ConnectionGUID: W5d1YPW4SgOUzedrMDPHGg==
X-CSE-MsgGUID: /r2MV6IzR6ePGkYrhipIAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57172346"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="57172346"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 20:02:57 -0800
X-CSE-ConnectionGUID: PTNzXNKHRZSyhzeTAtKNzQ==
X-CSE-MsgGUID: UQl0i53DQAi+Sb99W1rqRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="112214132"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2025 20:02:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgc3S-000zVO-1E;
	Sat, 08 Feb 2025 04:02:54 +0000
Date: Sat, 8 Feb 2025 12:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 211/211]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/nsmpu@1046f000: failed to
 match any schema with compatible: ['mediatek,smpu']
Message-ID: <202502081221.2a8Qi1yR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fd00cab3fe36e486cd2aaf166b98a6a5b943a097
commit: 3a41185f82d985856c99ad9c706c1434214d62b2 [211/211] CHROMIUM: arm64: dts: mt8196: add nsmpu, ssmpu, nkp, skp node
config: arm64-randconfig-051-20250207 (https://download.01.org/0day-ci/archive/20250208/202502081221.2a8Qi1yR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081221.2a8Qi1yR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081221.2a8Qi1yR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8196-cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8196-cksys-gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/pinctrl@1002d000: failed to match any schema with compatible: ['mediatek,mt8196-pinctrl']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/memory-controller@10236000: failed to match any schema with compatible: ['mediatek,mt8196-dramc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@102f3000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/nsmpu@1046f000: failed to match any schema with compatible: ['mediatek,smpu']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/ssmpu@1056f000: failed to match any schema with compatible: ['mediatek,smpu']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/nkp@1046f000: failed to match any schema with compatible: ['mediatek,smpu']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/skp@1056f000: failed to match any schema with compatible: ['mediatek,smpu']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@10613000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@10693000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@120a0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
