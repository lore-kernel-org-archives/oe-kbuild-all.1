Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35301D7E31
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 04:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750221120; cv=none; b=MvZ3bcAnc9z6QpXY/Grb86jK/x408HT5ooopoUFmBfi1AOaA/LAMB40USdrwi+vyJ3sr7RInF8B/w/ugmiEAo3GgsFYvfG8cdBA5ZxELnKHQ4WE6UZpsv6vlKBfpgddn8JP45Bx/OUAM1nFbtVTLLh3K2c+leEOYAiloE9gHybw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750221120; c=relaxed/simple;
	bh=eGdGqUlXSy1wIjHUtFe8r747Z1SeaKKVzoYr0hfFGKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ULr5frbHjk6xjFRMsBwmIDnX9heREs9Q4ZcfNM3aDFG9ZYZxv6qZPvdx0IU4nF7wgAKuQr43JvAOmAEBviWiUJKKA+CMR/RWXvzgm51BVx/aiIxiSleMYy0DspDkRRNA+b7YKXOtFAHyXcgM1NKlrLUApZBLdMTv8e8yUtr2Whw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlZ5BN1y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlZ5BN1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750221119; x=1781757119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eGdGqUlXSy1wIjHUtFe8r747Z1SeaKKVzoYr0hfFGKQ=;
  b=IlZ5BN1yqAp6Bf1AOJOy1v+tZHvvZgigawcqlDWg6AhHTVCCqMOhYAVG
   VHT/n77V677C1379XrjVBPrp2c88Oir7q6jtoY+k2ZdCvRNwc4QCieu+l
   I0lnlSwbIdOjOA2pxGFwjIzMy65owX3yDsGrvgZbb9b3gjpYKupNgsK9k
   8uvSIEWTXrbWmH8LqgvbcH9DH2o0VVao8LeXbfERulbg/ttDSqZS5nRI2
   d0mQB0SlCEBtKAHN6P2H5ZifKvwe+FcavTVqJdwZs35lTbrKhKOTr2MUp
   BNWLArnFTWd7s7j6qyJACqKS/fC83QFz8HY3I1AhW4je2TCPFr0/m/Eoz
   g==;
X-CSE-ConnectionGUID: qLgyOGuGSiOEqULZhDfHEA==
X-CSE-MsgGUID: 5z4/gynERpaFgUxQQPndCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51530299"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="51530299"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:31:57 -0700
X-CSE-ConnectionGUID: dYbJNHn9RbGhrECVUI6Wbw==
X-CSE-MsgGUID: 2Zmg4CPsSxyHzB8BqDEwsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="180181908"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2025 21:31:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRkSn-000JOd-1u;
	Wed, 18 Jun 2025 04:31:53 +0000
Date: Wed, 18 Jun 2025 12:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 168/168] <command-line>:0:0: warning:
 "MALI_PLATFORM_DIR" redefined
Message-ID: <202506181245.ZTgcAZDd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   8c8d45c74c6eb0fbee342707b1091713192236cc
commit: 8df8cc2d3cc80f60a56cd1ad44ed404f4c7ac449 [168/168] CHROMIUM: gpu/mediatek: move mtk_proprietary out of mali
config: arm64-randconfig-r053-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181245.ZTgcAZDd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181245.ZTgcAZDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181245.ZTgcAZDd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../include: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: kbuild/src/consumer/drivers/gpu/mediatek/arm/mali: No such file or directory [-Wmissing-include-dirs]
>> <command-line>:0:0: warning: "MALI_PLATFORM_DIR" redefined
   <command-line>:0:0: note: this is the location of the previous definition
--
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../include: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: kbuild/src/consumer/drivers/gpu/mediatek/arm/mali: No such file or directory [-Wmissing-include-dirs]
>> <command-line>:0:0: warning: "MALI_PLATFORM_DIR" redefined
   <command-line>:0:0: note: this is the location of the previous definition
   In file included from drivers/gpu/mediatek/arm/mali/mali_kbase_core_linux.c:126:0:
   drivers/gpu/mediatek/mtk_proprietary/gpufreq/mtk_gpufreq.h:12:10: fatal error: v1/include/mtk_gpufreq_v1.h: No such file or directory
    #include <v1/include/mtk_gpufreq_v1.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../include: No such file or directory [-Wmissing-include-dirs]
>> <command-line>:0:0: warning: "MALI_PLATFORM_DIR" redefined
   <command-line>:0:0: note: this is the location of the previous definition
--
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../base: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../../include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/misc/mediatek/trusted_mem/public: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/mediatek/arm/mali/../../../include: No such file or directory [-Wmissing-include-dirs]
>> <command-line>:0:0: warning: "MALI_PLATFORM_DIR" redefined
   <command-line>:0:0: note: this is the location of the previous definition
   In file included from drivers/gpu/mediatek/arm/mali/mali_kbase_core_linux.c:126:0:
   drivers/gpu/mediatek/mtk_proprietary/gpufreq/mtk_gpufreq.h:12:10: fatal error: v1/include/mtk_gpufreq_v1.h: No such file or directory
    #include <v1/include/mtk_gpufreq_v1.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL
   Depends on [n]: THERMAL [=n] && PM_DEVFREQ [=y] && PM_OPP [=y]
   Selected by [m]:
   - MALI_MTK [=m] && HAS_IOMEM [=y] && ARM64 [=y] && !MALI [=n] && MALI [=n]!=m [=m] && MTK_GPU_SUPPORT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
