Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F721DF990
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 05:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742190897; cv=none; b=LCdSX5yKWVYMYmmIYQn1jJmlnTW1HizEZhlyiah1TljJJ4T7bWXJcpIMyNts6oCfBTqssMAQjPgBkEKvNYX5wGVmZLTRreqXF3ehE9jxpqzZ/8/ar7FxS/oArcqawgbBzkzkv++sWNmnBU0FZROFKQJY8UDwqyGzQO5kzz4H3MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742190897; c=relaxed/simple;
	bh=YMXg+MHmT9N4Otb9U90IHK195axsiyg6u0VrMIduIzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FcKsoqBCCtDsqFXxZ/rMkO2NEVILBSkTdTrdgPSCqopaGeBGfuDPZXlqtVhyOrZSna6JLcYJYtMjyoVbAdiioSURu8kbsp31EhaqC6/QtBi7wsBnu8+vm8hfB/N0zvuynojU2my+AkHplcG3Gs75zHZOa9bdqxeAG7MJhFk0M3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grjL8Hp5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grjL8Hp5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742190895; x=1773726895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YMXg+MHmT9N4Otb9U90IHK195axsiyg6u0VrMIduIzM=;
  b=grjL8Hp5O0pEQVWwlNMhlTaqdDe6Ya+vEvNItoX/E7Bj8VTtROd4vNHs
   viGluiUIo3e6MTkGzFLKZ2+Sx6rkwOCLPdV1XqFjQSOXyezk3gvuRmgIQ
   FpHaLqNZyrxQK1wW3xU1SUlF5lEs1PGADzpA5mVLizDb5/Fa9q2JIiUSf
   Mc4g9tWRYdiRZXxB8FCoDwFUTAxTb7jsm+a9YYiIPSXcyuHlh/l/pOcoR
   g5ZIyxWKPt3JXRjMylttagoTCXlNO0lcmsiq+eu9sxoFcIyi0jPHIs7Ux
   HNBLOWIfwa57at4vOob50x1vp5aiYRXGNovu4L+/x1x/mLncO7UKaztbf
   Q==;
X-CSE-ConnectionGUID: jRTmXzYpRHiWlb9qCtb/sQ==
X-CSE-MsgGUID: sm/tJA5FRr6lMCAIfndgLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="47168776"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="47168776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 22:54:55 -0700
X-CSE-ConnectionGUID: y7MgtuvkTlqThAEWXEcBgw==
X-CSE-MsgGUID: YEnRVLXVRRykSo4ZPlOCAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="126473062"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2025 22:54:53 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu3R5-000CUt-1h;
	Mon, 17 Mar 2025 05:54:51 +0000
Date: Mon, 17 Mar 2025 13:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros 183/194]
 WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol sof_acpi_pm from
 namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
Message-ID: <202503171311.Y0CltFV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250313_tiwai_asoc_convert_to_modern_pm_macros
head:   9a2c84a9570fadf5fa15f3e6ca13a7ca23a6fb4c
commit: 431bdad71028cf4ad9958a49c76b8b54081930f2 [183/194] ASoC: SOF: acpi: Convert to EXPORT_NS_DEV_PM_OPS()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250317/202503171311.Y0CltFV2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171311.Y0CltFV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171311.Y0CltFV2-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-acpi-intel-bdw uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
