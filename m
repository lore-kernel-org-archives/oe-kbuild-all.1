Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052C35392
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677073456; x=1708609456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZpFbwJiceR+aYIAEqqzrzYwQLgmNin9sbO3v4coOfw=;
  b=WlHP685UU049YSU+PiWvoXEx0JPnm1163aCueFPMSFwq1Jf78phZXDMh
   kz9NcrTskexf96XZtXwosyFEky2jt2WvWDD6c6rlBBhTm0ZhJL4lxTvqa
   hCnw/7U3tq2UFTWStubj1FYvf7c2KxRH2hnXuCdfYdP/2W+7mj+7HM25a
   4CkQTlObT6Rbhv6qn79EWFpMb7/jtp5i/c5EiF8cy2SR3S/RoxJF/s2nC
   AlOatMJRqc3xI+VVknacmm36UFZrVjxB5hZsu7yYg7eR1N9UPTfnh6MB/
   WOJdhsOLWvyk4jIrK5tUI0eKZ/E3DLyjVkWI3V2wX3+54QJP/N5Bhy4H9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="395408324"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="395408324"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 05:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="735912319"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="735912319"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Feb 2023 05:44:15 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUpPq-0000Nh-1M;
	Wed, 22 Feb 2023 13:44:14 +0000
Date: Wed, 22 Feb 2023 21:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:spi-arch-deps 61/61] ERROR: modpost: "s3c24xx_set_fiq"
 [drivers/spi/spi-s3c24xx-hw.ko] undefined!
Message-ID: <202302222114.eyIQQBnf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git spi-arch-deps
head:   a80878a3420cde908203955acd54cd7bb36dab81
commit: a80878a3420cde908203955acd54cd7bb36dab81 [61/61] spi: s3c24xx: Allow build test coverage
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230222/202302222114.eyIQQBnf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=a80878a3420cde908203955acd54cd7bb36dab81
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci spi-arch-deps
        git checkout a80878a3420cde908203955acd54cd7bb36dab81
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302222114.eyIQQBnf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "s3c24xx_set_fiq" [drivers/spi/spi-s3c24xx-hw.ko] undefined!
>> ERROR: modpost: "s3c24xx_spi_fiq_tx" [drivers/spi/spi-s3c24xx-hw.ko] undefined!
>> ERROR: modpost: "s3c24xx_spi_fiq_txrx" [drivers/spi/spi-s3c24xx-hw.ko] undefined!
>> ERROR: modpost: "s3c24xx_spi_fiq_rx" [drivers/spi/spi-s3c24xx-hw.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
