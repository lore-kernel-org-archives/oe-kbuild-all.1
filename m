Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579AB36E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Dec 2022 02:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671934435; x=1703470435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v8JsR6hTcZI359ScwTRzrVY4ouZlcRP6ZPdSArqYoTI=;
  b=Hxpx3Fk7s0WsCiKer2Ap80KT54y7+ydJWAyoxxr0x+fefvo7RGRXAoSc
   OEq3bHIeEyYHrcahuvCSDAHriergW9T/+x52QHOVGIf1aeSCZ/SHti+iK
   UsFh+H13tztn48IsLgerQJ1/tmj1wqmSsUEVwSczSDhyQSYcwyEz7eYXY
   N4ecvfzUgCG6s0+vRAj7qRj1DHa/p7rvlxGaUt56njzsTqeYr1w0b17x0
   K5SgE1fX5r+luM4vVVDD9tyGgDTVBCdZ/F+TG1bEHocICYB5o5LuPBnmJ
   3Bxpgm3lmg8TRL6h33jTRwnePai2Dd8I/kAblrOG4TypHro9xrfmRt2H6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="303941231"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="303941231"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 18:13:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="684857028"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="684857028"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Dec 2022 18:13:53 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p9GWO-000Dgd-1e;
	Sun, 25 Dec 2022 02:13:52 +0000
Date: Sun, 25 Dec 2022 10:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-test-stm32-cryp 7/7]
 drivers/crypto/Kconfig:400: can't open file "drivers/crypto/ux500/Kconfig"
Message-ID: <202212251013.cKoKG6Pe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-test-stm32-cryp
head:   4cd90320805b656001bfde1428b002972b857e1a
commit: 4cd90320805b656001bfde1428b002972b857e1a [7/7] crypto: ux500/hash - delete driver
config: loongarch-randconfig-r016-20221225 (attached as .config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=4cd90320805b656001bfde1428b002972b857e1a
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-test-stm32-cryp
        git checkout 4cd90320805b656001bfde1428b002972b857e1a
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 ARCH=loongarch 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/crypto/Kconfig:400: can't open file "drivers/crypto/ux500/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1
   make[1]: *** [Makefile:708: oldconfig] Error 2
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/crypto/Kconfig:400: can't open file "drivers/crypto/ux500/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
   make[1]: *** [Makefile:708: olddefconfig] Error 2
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +400 drivers/crypto/Kconfig

aef7b31c8833e7 Kent Yoder     2012-04-12  392  
2789c08fffeae2 Andreas Westin 2012-04-30  393  config CRYPTO_DEV_UX500
2789c08fffeae2 Andreas Westin 2012-04-30  394  	tristate "Driver for ST-Ericsson UX500 crypto hardware acceleration"
2789c08fffeae2 Andreas Westin 2012-04-30  395  	depends on ARCH_U8500
2789c08fffeae2 Andreas Westin 2012-04-30  396  	help
2789c08fffeae2 Andreas Westin 2012-04-30  397  	  Driver for ST-Ericsson UX500 crypto engine.
2789c08fffeae2 Andreas Westin 2012-04-30  398  
2789c08fffeae2 Andreas Westin 2012-04-30  399  if CRYPTO_DEV_UX500
2789c08fffeae2 Andreas Westin 2012-04-30 @400  	source "drivers/crypto/ux500/Kconfig"
2789c08fffeae2 Andreas Westin 2012-04-30  401  endif # if CRYPTO_DEV_UX500
2789c08fffeae2 Andreas Westin 2012-04-30  402  

:::::: The code at line 400 was first introduced by commit
:::::: 2789c08fffeae270820dda5d096634aecc810af5 crypto: ux500 - Add driver for CRYP hardware

:::::: TO: Andreas Westin <andreas.westin@stericsson.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
