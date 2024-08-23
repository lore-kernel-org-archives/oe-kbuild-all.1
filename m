Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C7517C66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 02:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724381596; cv=none; b=GKONbfi1hi7qEAWeyMGe/Yl2H+vCtsnUKrKBg+o02wUBS1uRa3WzbdiOIp4FEqHjES0MyLkKBrJx9qdCpYMsJtIxIrcgx+ShQgBqJNpGuHTbkSWmfoB3SQrlAD6j6PVk8RPkU8EhtqTdaJQKFhZyOpw5agJMPUpgRR1nmQYNYiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724381596; c=relaxed/simple;
	bh=lyEc//LPcGnyZ4G+KRSavFpwkpgUoFm0W1Dwu4SQajo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7tUkj2PlDoq4TwA7KJf+zj43lR6rchboCduYQrDgfxMrI+CyrTtD/vVIiWwPuzJ5vaOfEjHweDQe90xN+crWlOsvJlG7FdVDypUdvaDyppyEE1EjjT6BtULnxhpcQ+PtAq+Cbf5l2mBgUUgfg5I9HApmtcrGpFO1VcaHKU20CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/8kw3QC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/8kw3QC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724381594; x=1755917594;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lyEc//LPcGnyZ4G+KRSavFpwkpgUoFm0W1Dwu4SQajo=;
  b=V/8kw3QCtodAOiaSgAcHt09uKxSwDU48+F4PKFpxNSYAd4AiGTWVz1HH
   lQWOzRwKpPy+NbMouHCpZOOKa4+Zu6zb9E9bML5+KSnzPtIukYpJwa5hB
   zJw4iX0ydYGZmK+3QBEywMRWCA82FAz9Lq6DFpOeO+4zF3UvzAaq5BI04
   d5oi2cAQHSQhinXaCQrg5TH6KsdUjNa7Nxv1sErGr26Z+ResAZVXlU0wK
   BXifTTPlVTTs9M0KJ+WzTRfuv/Cwe5UqZHtCRyeHlcB7YB58JBCqg1sWy
   OsGA6RewJmFS1IPHzSc7B+09gOGYAf7565c0T9hASnFDit6Z2GBA/ZgOf
   w==;
X-CSE-ConnectionGUID: o9CWMEi/QqOBg71h7SB77A==
X-CSE-MsgGUID: IsOJ06k7T9imzzer7HXC5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22358342"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="22358342"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 19:53:13 -0700
X-CSE-ConnectionGUID: sgMn78c2RiOjOwjqrU41wQ==
X-CSE-MsgGUID: kWCXCMuIThuEOdjGK61EIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="66586735"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Aug 2024 19:53:12 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shKQH-000DPK-2U;
	Fri, 23 Aug 2024 02:53:09 +0000
Date: Fri, 23 Aug 2024 10:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 11/120]
 sound/soc/codecs/cs42l83-i2c.c:235:1: error: type defaults to 'int' in
 declaration of 'module_i2c_driver'
Message-ID: <202408231041.WjVEvDcJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   8bb0ee8e8fd75aa60a4bb4efe074711f2c35ca5c
commit: 4505843a945e1d46e759f01c0822a855eec41cea [11/120] ASoC: apple: Add macaudio machine driver
config: sh-randconfig-r062-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231041.WjVEvDcJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231041.WjVEvDcJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231041.WjVEvDcJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs42l83-i2c.c:235:1: warning: data definition has no type or storage class
     235 | module_i2c_driver(cs42l83_i2c_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/codecs/cs42l83-i2c.c:235:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Wimplicit-int]
>> sound/soc/codecs/cs42l83-i2c.c:235:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   sound/soc/codecs/cs42l83-i2c.c:225:26: warning: 'cs42l83_i2c_driver' defined but not used [-Wunused-variable]
     225 | static struct i2c_driver cs42l83_i2c_driver = {
         |                          ^~~~~~~~~~~~~~~~~~
--
   sound/soc/codecs/tas2764.c:811:1: warning: data definition has no type or storage class
     811 | module_i2c_driver(tas2764_i2c_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2764.c:811:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Wimplicit-int]
>> sound/soc/codecs/tas2764.c:811:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   sound/soc/codecs/tas2764.c:803:26: warning: 'tas2764_i2c_driver' defined but not used [-Wunused-variable]
     803 | static struct i2c_driver tas2764_i2c_driver = {
         |                          ^~~~~~~~~~~~~~~~~~
--
   sound/soc/codecs/tas2770.c:726:1: warning: data definition has no type or storage class
     726 | module_i2c_driver(tas2770_i2c_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2770.c:726:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Wimplicit-int]
>> sound/soc/codecs/tas2770.c:726:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   sound/soc/codecs/tas2770.c:718:26: warning: 'tas2770_i2c_driver' defined but not used [-Wunused-variable]
     718 | static struct i2c_driver tas2770_i2c_driver = {
         |                          ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
   Selected by [y]:
   - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
   Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [y]:
   - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2764
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
   Selected by [y]:
   - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2770
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
   Selected by [y]:
   - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for COMMON_CLK_APPLE_NCO
   Depends on [n]: COMMON_CLK [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [y]:
   - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +235 sound/soc/codecs/cs42l83-i2c.c

94d5f62a91aab6 Martin Povišer 2022-09-15  234  
94d5f62a91aab6 Martin Povišer 2022-09-15 @235  module_i2c_driver(cs42l83_i2c_driver);
94d5f62a91aab6 Martin Povišer 2022-09-15  236  

:::::: The code at line 235 was first introduced by commit
:::::: 94d5f62a91aab6ac9c3f4abfd048cbe5f77153ac ASoC: cs42l83: Extend CS42L42 support to new part

:::::: TO: Martin Povišer <povik+lin@cutebit.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
