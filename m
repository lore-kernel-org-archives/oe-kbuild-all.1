Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D20253C9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689606304; x=1721142304;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YUuRF2yAZXYlPLgPjwgn1G1LB4mhNGX4YXJMOkaCoEw=;
  b=N169tYBdRuY2agQzbgSpHMOxC7sI6ioTrhlhz1tY/X22WahQ0HsnQXsH
   qQT7BxrmBZR8tq8MJvlJnznKHjI44She9YuF+BXwLZaWlEtQaWOMbqPDx
   WhjHuiHXLVq3EAFCjfzoxFJ2mSANcsn5WX6K7OKYg5JPp9RC46ioCrJQw
   LDhWvcZajetEn/5AyH4wGuDqjuES+KICTtSgNO60y5ORUlNjYpAx2h0Ho
   UyD9jxU3iG5MAjq6w+53IGdICSGFw9I7va10/VpJ/WI9sUweu0pEsm25I
   89FmpDTKEUU6sikaUVtqQiyrr/bxn4JNlAhoDU5RDCjKS6yWYN1UjJ1Ke
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="368593820"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="368593820"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 08:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673560782"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673560782"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2023 08:05:00 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLPmV-0009eM-1T;
	Mon, 17 Jul 2023 15:04:59 +0000
Date: Mon, 17 Jul 2023 23:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 11/37]
 sound/soc/codecs/cs42l83-i2c.c:235:1: error: type defaults to 'int' in
 declaration of 'module_i2c_driver'
Message-ID: <202307172218.pEYjq0tR-lkp@intel.com>
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
head:   fd19415d77a7612b4edbe780d58328ec41019816
commit: 3c3d5de0a7ced368904f610daab8b4b3f21e7f31 [11/37] ASoC: apple: Add macaudio machine driver
config: arm64-randconfig-r061-20230717 (https://download.01.org/0day-ci/archive/20230717/202307172218.pEYjq0tR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307172218.pEYjq0tR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307172218.pEYjq0tR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs42l83-i2c.c:235:1: warning: data definition has no type or storage class
     235 | module_i2c_driver(cs42l83_i2c_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/codecs/cs42l83-i2c.c:235:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
>> sound/soc/codecs/cs42l83-i2c.c:235:1: warning: parameter names (without types) in function declaration
   sound/soc/codecs/cs42l83-i2c.c:225:26: warning: 'cs42l83_i2c_driver' defined but not used [-Wunused-variable]
     225 | static struct i2c_driver cs42l83_i2c_driver = {
         |                          ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> sound/soc/codecs/tas2764.c:811:1: warning: data definition has no type or storage class
     811 | module_i2c_driver(tas2764_i2c_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2764.c:811:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
>> sound/soc/codecs/tas2764.c:811:1: warning: parameter names (without types) in function declaration
   sound/soc/codecs/tas2764.c:803:26: warning: 'tas2764_i2c_driver' defined but not used [-Wunused-variable]
     803 | static struct i2c_driver tas2764_i2c_driver = {
         |                          ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> sound/soc/codecs/tas2770.c:726:1: warning: data definition has no type or storage class
     726 | module_i2c_driver(tas2770_i2c_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2770.c:726:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
>> sound/soc/codecs/tas2770.c:726:1: warning: parameter names (without types) in function declaration
   sound/soc/codecs/tas2770.c:718:26: warning: 'tas2770_i2c_driver' defined but not used [-Wunused-variable]
     718 | static struct i2c_driver tas2770_i2c_driver = {
         |                          ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && I2C [=n]
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
   Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2770
   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && I2C [=n]
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2764
   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && I2C [=n]
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])


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
