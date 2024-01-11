Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461153C47C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2Qe+V8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704982635; x=1736518635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+IxWTnJXGwg8EggnBpr6RNyka90xuZauoHvQYEMiIk=;
  b=g2Qe+V8VSG2Rp7HWlGPX7O64oVpSrZhq16KHgKh936H1PIwb0aKEQu0E
   yJL1DdEhn0mc2xpD4tLpcKfhS3HwRmzKQKdi/XrKF6ushFn2USyYDP5RL
   G+LKFL4OZ2aBzeEhqdfHM48mXSUcaOxJpxq9d1HDDyB1rVfMK1w2gwGGu
   DNjPb+fonTcsUfxZOw/TxhDBGnWvbV5LSxYSCYELRZZuV8Qu9pccccYMY
   tevjz8mHndq9XIGwUnVSqROcnbTSnVdIV4ldN/NDkEVdg6BkYOkDwE9VX
   Qo8yGF1zKM6uzSOBA4H4WBgMoJm/LKRPhpzF41QbWoUJsuIfy9gM1JMgZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="12214812"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="12214812"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 06:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="786013472"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="786013472"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jan 2024 06:17:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNvrq-0008LK-1Q;
	Thu, 11 Jan 2024 14:17:10 +0000
Date: Thu, 11 Jan 2024 22:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>
Subject: [linux-next:master 12996/13245] WARNING: modpost: vmlinux: section
 mismatch in reference: pmd_clear_bad+0x20 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202401112230.cSyQ4cBs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
commit: 86817057732a9ce9cefdb6f513b6554a55ebbbbb [12996/13245] mm: vmalloc: remove global vmap_area_root rb-tree
config: xtensa-randconfig-r031-20220806 (https://download.01.org/0day-ci/archive/20240111/202401112230.cSyQ4cBs-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112230.cSyQ4cBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112230.cSyQ4cBs-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: pmd_clear_bad+0x20 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/test_udelay.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp852.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp874.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/jbd2/jbd2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/minix/minix.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/sysv/sysv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ufs/ufs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/pstore/pstore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted-keys/trusted.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test-kstrtox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_encoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/vfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/dmatest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ac97.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/charlcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microsoft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/fbtft/fbtft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: drivers/hwmon/smsc47m1: section mismatch in reference: smsc47m1_driver+0x4 (section: .data) -> smsc47m1_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-ab8500-codec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section mismatch in reference: adc3xxx_i2c_driver+0x8 (section: .data) -> adc3xxx_i2c_driver_exit (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-dma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/mxs/snd-soc-mxs-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
