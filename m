Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082B51E497
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708796790; cv=none; b=naUxJtPLER9roT2UptKIhG7HMkP6iDPNriktuzUF9sok5NlKOJeMdPxIE04deEEn51D3ujpcQoMXfX5N25X8H/r9EoG3gnHmC1ftuaA3qbafEjXHcv0Mz7nzkZaZEy3vpHIpHMpj64P+5UtNbv0jALPkBBccLg7ZqJh/hbHUzIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708796790; c=relaxed/simple;
	bh=Um8uE0jgcY3TcUZai2xLljEj9f89IebhL2aWu0Fg4ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ntSMBVSBu2E+K/8+R0zuWjmE+oSEFkczs0dykTBmZQ50+aEr6Syo/hFmMR5I3ssrNKdc++pRdgdNeerHrOfDsk68nLOyyPXcPzFel7uQcV2qiCKk0d+SRCJFsE5Td6U8c2hAnOQDbBcEaD5POLki6zJTF8FBPZBDYjy5m6O0C5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co1y1GqF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co1y1GqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708796788; x=1740332788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Um8uE0jgcY3TcUZai2xLljEj9f89IebhL2aWu0Fg4ug=;
  b=co1y1GqF7ZgiCBv7BH1OJ4lpCsAXfdMeg75evCQucJ3/UpppSDFLaAtn
   Dg+EgAwjkcK9qDwruVMBfBtrvqzJXMo/AAIDIPXivX0HzlMY4QB7+XB1s
   byvOcc6hq76rOINe5Ka7ZWfUduT3WndIotaaGA9OI+WCKel9bALP9pdFL
   e5SLaOhvodAROtxmFTegEuBrtYvbRTEYrGn32UhI25NUe2kOz6SiNsnFy
   KJpdqQJmfnUOL5x4AZKKPQ1ZJqsNEByXyDbDLdMs2pCTG/f7YIBjRASJ4
   r7v/CvHJvMQ+NzJXrw4iYSfz63kdcwf2DTrd38qjt587cjpR1rfqg8+yE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="14248225"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="14248225"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 09:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6152785"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Feb 2024 09:46:26 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdw6K-0008ls-2q;
	Sat, 24 Feb 2024 17:46:19 +0000
Date: Sun, 25 Feb 2024 01:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regulator-mp8859 5/7] drivers/regulator/mp8859.c:120:30:
 warning: initialization of 'unsigned int' from 'bool (*)(struct device *,
 unsigned int)' {aka '_Bool (*)(struct device *, unsigned int)'} makes
 integer from pointer without a cast
Message-ID: <202402250152.rNoDRvUK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regulator-mp8859
head:   dd4fd1e2b4ddb0dd4b24f7d896fba11e1f83e234
commit: c8ad2f2d94132360954e4d5dbb87a87e9a58d9c3 [5/7] regulator: mp8859: Convert to use a maple tree register cache
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240225/202402250152.rNoDRvUK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402250152.rNoDRvUK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402250152.rNoDRvUK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/regulator/mp8859.c:119:10: error: 'const struct regmap_config' has no member named 'readable_register'; did you mean 'readable_reg'?
     119 |         .readable_register = mp8859_readable,
         |          ^~~~~~~~~~~~~~~~~
         |          readable_reg
   drivers/regulator/mp8859.c:120:10: error: 'const struct regmap_config' has no member named 'volatile_register'; did you mean 'volatile_reg'?
     120 |         .volatile_register = mp8859_volatile,
         |          ^~~~~~~~~~~~~~~~~
         |          volatile_reg
>> drivers/regulator/mp8859.c:120:30: warning: initialization of 'unsigned int' from 'bool (*)(struct device *, unsigned int)' {aka '_Bool (*)(struct device *, unsigned int)'} makes integer from pointer without a cast [-Wint-conversion]
     120 |         .volatile_register = mp8859_volatile,
         |                              ^~~~~~~~~~~~~~~
   drivers/regulator/mp8859.c:120:30: note: (near initialization for 'mp8859_regmap.num_reg_defaults_raw')
   drivers/regulator/mp8859.c:120:30: error: initializer element is not computable at load time
   drivers/regulator/mp8859.c:120:30: note: (near initialization for 'mp8859_regmap.num_reg_defaults_raw')


vim +120 drivers/regulator/mp8859.c

90b60aa3876828 Mark Brown    2024-02-24  113  
4444a1c10069e2 Markus Reichl 2020-01-06  114  static const struct regmap_config mp8859_regmap = {
4444a1c10069e2 Markus Reichl 2020-01-06  115  	.reg_bits = 8,
4444a1c10069e2 Markus Reichl 2020-01-06  116  	.val_bits = 8,
4444a1c10069e2 Markus Reichl 2020-01-06  117  	.max_register = MP8859_MAX_REG,
c8ad2f2d941323 Mark Brown    2024-02-24  118  	.cache_type = REGCACHE_MAPLE,
59b550c7bc1384 Mark Brown    2024-02-24 @119  	.readable_register = mp8859_readable,
90b60aa3876828 Mark Brown    2024-02-24 @120  	.volatile_register = mp8859_volatile,
4444a1c10069e2 Markus Reichl 2020-01-06  121  };
4444a1c10069e2 Markus Reichl 2020-01-06  122  

:::::: The code at line 120 was first introduced by commit
:::::: 90b60aa3876828efe3a97b9ba7770890aa04ff31 regulator: mp8859: Specify volatile registers

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
