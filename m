Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072F72391A4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 00:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733445262; cv=none; b=OBEWEx66nGcLOEFYukhd7/1aN/M0WFnzjlO8h2MrY3/flFWcYX4zRQTJmfp5tqJ7GIOjNlF5YLb+Z/JYsNlqc10pumuQ+taDpm8e+P9cpnmAnY7wrOED2H8WNmU8tyrT0T+Da3pcz6bl4SFl0xg+Dn4aR4uEGwhOhY1VQTC9lH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733445262; c=relaxed/simple;
	bh=vrzgLWKp7zxTdqKDYIhVDv8qsfQpPySkGCYR3U5B4GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ISiuHV/OC2OgABqV6ghpG87XlOVoH8TNH1jEZnQOR9aFgCo1PGBEQSnKKLqjsH1OgO2JeqZDn7gaJRYG+iI/Uvkks3ObBFzPxfYn2S/zxUdXGPGS1bw6ir0NqgL8ddhxFQgSKCMQgBF06jrJdMQAWAjPWmyxGZZn9/SQ/iLdmsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvaXh1tF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvaXh1tF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733445260; x=1764981260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrzgLWKp7zxTdqKDYIhVDv8qsfQpPySkGCYR3U5B4GE=;
  b=nvaXh1tF3z0ODA+umEcRBC0dchIODrSL5LbSbLA3Tx8LOs/i2yrKsuP0
   iDswPE33LjWBhDbSmbkuJD3SBPKyYNE7PflkqElcu3lEjCkyrzCmyVi9N
   NZTPlEUF+qydvW3fSfXhZt49NpDZOV/nVOsnVI84oPieiog813TTCxvCA
   UtJfF82MPncnOAQ0UyPr6Ty6L+rtd8VqsKwVT7Q3Y30IfTDu2wJStsu48
   HPvgxWeKW/cy5RdMqe/5OgUQwRwJZIu4i3b7FiR0IEvNLzAA5Ep1a5ogA
   57x6AhAHjtoBMxElcL1Q1IQfEKziZcq/ZchdSiJv2IahNX5C3VAFOkUfm
   g==;
X-CSE-ConnectionGUID: 1rAOmfdlQheFqbO+pxva3w==
X-CSE-MsgGUID: GmANEIx6Tj+x0mZbZZKPRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="56269951"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="56269951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 16:34:19 -0800
X-CSE-ConnectionGUID: sihBck1cTTG8v3Jl4fNhPQ==
X-CSE-MsgGUID: ZqLzmCmuST+4VavwdMB0wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94455207"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Dec 2024 16:34:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJMIS-0000Wt-0Z;
	Fri, 06 Dec 2024 00:34:16 +0000
Date: Fri, 6 Dec 2024 08:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:acpm-v3-upstream 9/10] ERROR: modpost: "acpm_do_xfer"
 [drivers/firmware/samsung/exynos-acpm-mfd.ko] undefined!
Message-ID: <202412060859.8uPau1KJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day acpm-v3-upstream
head:   20f606fa2a40e27ec03a65c1a7e7d59617173b99
commit: 2c7c337e69c51f04f63d04aa2c817eda43cf97ca [9/10] firmware: add exynos ACPM protocol driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241206/202412060859.8uPau1KJ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060859.8uPau1KJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060859.8uPau1KJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/firmware/samsung/exynos-acpm-mfd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/samsung/exynos-acpm-mfd.o
ERROR: modpost: "acpm_pmic_read_reg" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
ERROR: modpost: "acpm_pmic_bulk_read" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
ERROR: modpost: "acpm_pmic_write_reg" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
ERROR: modpost: "acpm_pmic_bulk_write" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
ERROR: modpost: "acpm_pmic_update_reg" [drivers/firmware/samsung/exynos-acpm.ko] undefined!
>> ERROR: modpost: "acpm_do_xfer" [drivers/firmware/samsung/exynos-acpm-mfd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
