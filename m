Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8B24A0A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnOLgHrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702638066; x=1734174066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScfOf0MRpGB/pJkD/WWTu/qVJmuuEt1TvU0JvjrMOD4=;
  b=KnOLgHrGC4CH+6dQdbRG2n35xau8x3MPRPBASVFKiWnX92amx/rcCLH7
   aazdUWpncAb8THDIFAutEIUPmIxqB6EZCD8qOMfl1Gpyf14EIiKSrOn4I
   Cp9JW7mikuj0YoMvAdEwlLomFj1oWd8sv/m5jxQ+ZuQQKCQ2cempRQR91
   Gdd9V5tqCeBbudBockSX5Lo/4+rcHJWsaGmm8rUSWlZSIVZ9uYfup1SdZ
   fR20zdOgbsud8X/nrv0lpGyCzvZgJjlHEHFDx0HXZ5COgl0YF6n2wlfdX
   P19C1UHH/dn7PVlCjlXloV5ZNn46SZ/AbUCE+T+s65uQ0MJCDe9EBhVZ6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="375405743"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="375405743"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 03:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803680555"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="803680555"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2023 03:01:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE5wD-000NQ8-0w;
	Fri, 15 Dec 2023 11:01:01 +0000
Date: Fri, 15 Dec 2023 19:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 3242/8213] scripts/kernel-doc:
 drivers/spi/spi-pl022.c:397: warning: Excess struct member 'cur_msg'
 description in 'pl022'
Message-ID: <202312151816.munFeE4L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: 9b2ef250b31d46f7ef522bd1bd84942f998bb3f9 [3242/8213] spi: spl022: switch to use default spi_transfer_one_message()
config: arm-lpc18xx_defconfig (https://download.01.org/0day-ci/archive/20231215/202312151816.munFeE4L-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151816.munFeE4L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151816.munFeE4L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: drivers/spi/spi-pl022.c:397: warning: Excess struct member 'cur_msg' description in 'pl022'
>> scripts/kernel-doc: drivers/spi/spi-pl022.c:397: warning: Excess struct member 'cur_msg' description in 'pl022'
>> scripts/kernel-doc: drivers/spi/spi-pl022.c:437: warning: Function parameter or struct member 'enable' not described in 'internal_cs_control'
>> scripts/kernel-doc: drivers/spi/spi-pl022.c:437: warning: Excess function parameter 'command' description in 'internal_cs_control'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
