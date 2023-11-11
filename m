Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083F81DA22
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 21:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Smk2bfFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699737765; x=1731273765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8TJTEj8M98pptCeTla8pXAHqvFIif4xWH6WPh59GeN4=;
  b=Smk2bfFUAScc3gzTcFarklsqbF+IcYLe8pAiczfYg9Zlt6fT1vArpiX3
   sFvXiVbk8uImJWE+OgkVfdy/eXs1mvQemgJgy+dmhm5E8JA3yzc0+qaoS
   6GlIXrON37TBR4NRmx+7TzUzn9MhSYqiI/ntBXqw2NF2bJo90hMnIycer
   96M0IuCWPgRWEpwYg7so9a1GIkc5TOF8cMiQH4asdd3969mlzgnPfcx/2
   WU9FiFSfIDbdtv6sVQ3OVn5WliW/YVjF/DjVkm4cOBmY7kpiIX63VdFRG
   /ODIiSPmb51jRSlqGD2krokBP7tLyWAeAemc5oj2OM/Lo3jExMNBTSQgq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="380684430"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="380684430"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 13:22:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="740431906"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="740431906"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Nov 2023 13:22:42 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1vRA-000Aly-1l;
	Sat, 11 Nov 2023 21:22:40 +0000
Date: Sun, 12 Nov 2023 05:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Okan Sahin <okan.sahin@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/regulator/max77857-regulator.c:428:28: sparse: sparse:
 symbol 'max77857_id' was not declared. Should it be static?
Message-ID: <202311120522.0eeVKiUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: af71cccadecedad3484c2208e2c4fc8eff927d4a regulator: max77857: Add ADI MAX77857/59/MAX77831 Regulator Support
date:   4 months ago
config: i386-randconfig-062-20230912 (https://download.01.org/0day-ci/archive/20231112/202311120522.0eeVKiUT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120522.0eeVKiUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120522.0eeVKiUT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/regulator/max77857-regulator.c:70:22: sparse: sparse: symbol 'max77857_regmap_config' was not declared. Should it be static?
   drivers/regulator/max77857-regulator.c:209:5: sparse: sparse: symbol 'max77859_get_voltage_sel' was not declared. Should it be static?
   drivers/regulator/max77857-regulator.c:221:5: sparse: sparse: symbol 'max77859_set_current_limit' was not declared. Should it be static?
   drivers/regulator/max77857-regulator.c:235:5: sparse: sparse: symbol 'max77859_get_current_limit' was not declared. Should it be static?
>> drivers/regulator/max77857-regulator.c:428:28: sparse: sparse: symbol 'max77857_id' was not declared. Should it be static?
   drivers/regulator/max77857-regulator.c:446:19: sparse: sparse: symbol 'max77857_driver' was not declared. Should it be static?

vim +/max77857_id +428 drivers/regulator/max77857-regulator.c

   427	
 > 428	const struct i2c_device_id max77857_id[] = {
   429		{ "max77831", ID_MAX77831 },
   430		{ "max77857", ID_MAX77857 },
   431		{ "max77859", ID_MAX77859 },
   432		{ "max77859a", ID_MAX77859A },
   433		{ }
   434	};
   435	MODULE_DEVICE_TABLE(i2c, max77857_id);
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
