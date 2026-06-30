Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A433F5AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 15:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832548; cv=none; b=Y7KtQNC1w/gU3d9zeAE04+ok9hvde+fq7xu0k8DUMrEQHGpDezFj9Xfs/n1KDuexztMYsvMcmbe5M733MSBmHJjz9B7W9LmqkYf0QMymzQrc7h6rh1sSAL16O55eyq+db5dVJzkzRrHYChMgPGFtjQJ3a2Jk8d9nrard0a3cDuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832548; c=relaxed/simple;
	bh=3ZHyopE+L679TCaubWp/fuZeTDNt6ljFOvASKU5A5kc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tgb4E6bGgjUbfuOl62hvhgDtiTmRC37o0mV1HuMphg2azM2N85WgflqyhuF1hHyhAzneTrxtu7AF+g98qXuctnOUOuoAvYzW2x1YNLGXwkGSBywqiLnOz5iDCVyNgvVQCOWKMfgoSFr6uWC64bEaX4N/V6lkPq9A8+eDkeSs6gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A17AAWF0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A17AAWF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782832547; x=1814368547;
  h=date:from:to:cc:subject:message-id;
  bh=3ZHyopE+L679TCaubWp/fuZeTDNt6ljFOvASKU5A5kc=;
  b=A17AAWF0tNytnW7EjCFZeLXOE0Lb4Ol+wsdh0H2vAyN6ek+aAInkqVOv
   NRpTEF6sfrg9qYkB2j5ip+1LVY6gt+uu+F467eh6Ndv830TGlmp5v/nxX
   IURjcrIvBpzMEFEU98+S1tDyhzMwFQfrD1MvgZos2sO2xZtgoyEuJmAoP
   WTk9zKF9xfruPkpWa9JLP2dOZmORV5IQusY0E05ABOi3grm1ZnDJx1+FN
   +abHGEnAeSpEFCktr/QZuomOfO1gBzSclkAhb0vJMT3o738h8nGlpsIcd
   etHFLjckggtC0ok1nDHkfOWEE1ALZxrT6DQDbS2UaHDfumhMeI3aiO1iN
   Q==;
X-CSE-ConnectionGUID: XNJcD4ayShmRqgtH7AZ2ug==
X-CSE-MsgGUID: NvUwC5jYSD64JlfrGjZ7rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82538219"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="82538219"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:15:46 -0700
X-CSE-ConnectionGUID: TA6CRLdYQu6NXxR0H197NA==
X-CSE-MsgGUID: e6NuT0lBSp+bnE6ZE4lRSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="248305606"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jun 2026 08:15:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weaBZ-000000008RW-43bd;
	Tue, 30 Jun 2026 15:15:41 +0000
Date: Tue, 30 Jun 2026 23:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [broonie-ci:asoc-7.3 41/42] sound/soc/meson/aiu.c:184:34:
 sparse: sparse: symbol 'aiu_formatter_i2s_drv' was not declared. Should it be
 static?
Message-ID: <202606302308.ioZ5mvDz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.3
head:   c7852d2dcf66e54e0fb0f9e40934440f0ced4df1
commit: 83b83024cdbfdddee104f4a84c2c2f1f8e6659f3 [41/42] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
config: mips-randconfig-r134-20260630 (https://download.01.org/0day-ci/archive/20260630/202606302308.ioZ5mvDz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302308.ioZ5mvDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302308.ioZ5mvDz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/meson/aiu.c:184:34: sparse: sparse: symbol 'aiu_formatter_i2s_drv' was not declared. Should it be static?

vim +/aiu_formatter_i2s_drv +184 sound/soc/meson/aiu.c

   183	
 > 184	const struct gx_formatter_driver aiu_formatter_i2s_drv = {
   185		.regmap_cfg	= &aiu_regmap_cfg,
   186		.ops		= &aiu_formatter_i2s_ops,
   187	};
   188	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
