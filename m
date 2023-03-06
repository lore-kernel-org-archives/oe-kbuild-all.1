Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E092D304
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 04:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678075503; x=1709611503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWuJ0jbj8CKayyLbzqCZIxtNohp7mHu+wsd5Owa4Rc0=;
  b=dbX2/M+13VYxZsxMTZQsKs5yvpv5eLGshTrBrX29BCmaqGpAhrR5mVbP
   o348W6xxA0GFEDeNLcyykypsRGv6lKmS2sZ3RxK+n/n0iQJKSdKcyZ/zA
   1Hyj3auNatKlgO7wATHfSzqdg7jbQhlg5X9U69UATvyC5MWvcS9x/Frus
   1U6M+OrOG7Facu9KEyHcVZkB2Ub1FWIkQv+4m9iEK25LB3U1GhIqo8bHW
   lT8QqHhh3A0aJ0B/owfPRv/n3urcw5R5veQeunD9WCYEvtDefV7IkzGG7
   9bgOLryVu/s7+dT+fPTPj2lobLbrdvYeU9xPZiHFJbIX0qJHrZ6dfdIn0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337783237"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="337783237"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 20:05:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="765083440"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="765083440"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2023 20:05:01 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ25s-0003J4-20;
	Mon, 06 Mar 2023 04:05:00 +0000
Date: Mon, 6 Mar 2023 12:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [broonie-ci:20230303_u_kleine_koenig_spi_convert_to_platform_remove_callback_returning_void
 9/87] drivers/spi/spi-bcm2835.c:1421:9: error: implicit declaration of
 function 'rbcm2835_spi_remove'; did you mean 'bcm2835_spi_remove'?
Message-ID: <202303061201.7shVfjkk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20230303_u_kleine_koenig_spi_convert_to_platform_remove_callback_returning_void
head:   8428522b5b0063454f7a1fad16d405ebca87aeee
commit: b1c4089d04518212ffa1855e1557fe125f71f8a5 [9/87] spi: bcm2835: Convert to platform remove callback returning void
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230306/202303061201.7shVfjkk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=b1c4089d04518212ffa1855e1557fe125f71f8a5
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci 20230303_u_kleine_koenig_spi_convert_to_platform_remove_callback_returning_void
        git checkout b1c4089d04518212ffa1855e1557fe125f71f8a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061201.7shVfjkk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-bcm2835.c: In function 'bcm2835_spi_shutdown':
>> drivers/spi/spi-bcm2835.c:1421:9: error: implicit declaration of function 'rbcm2835_spi_remove'; did you mean 'bcm2835_spi_remove'? [-Werror=implicit-function-declaration]
    1421 |         rbcm2835_spi_remove(pdev);
         |         ^~~~~~~~~~~~~~~~~~~
         |         bcm2835_spi_remove
   cc1: some warnings being treated as errors


vim +1421 drivers/spi/spi-bcm2835.c

  1418	
  1419	static void bcm2835_spi_shutdown(struct platform_device *pdev)
  1420	{
> 1421		rbcm2835_spi_remove(pdev);
  1422	}
  1423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
