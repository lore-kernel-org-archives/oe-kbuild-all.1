Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412BF1FD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 05:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679550193; x=1711086193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rpclhQt2YWXMj+Jgd1rd2Gx6UQRdVDKkMFzqlmlUWvo=;
  b=jrI+XebD7MnyAZ5ECQMhBCtea8BDJ67lg3AYjLXWTYIBPVyaTIVS5sYM
   3RZSKDzeS8+tZgBHqmhfq8yDALaqZbQB5t/yotO31R8kelAR6/2ZGf43U
   vWP5aHOJmDAxg33G6txlExDQJHA+HLXGaW98SvZlFT5SiXIeiB8BIdPKm
   MmWfz5O1tYvRA+ZYFdznqgRs5mElIoZjbZwTVn2Htdh209eY0Msoz6S+w
   zqG9bh+TOwGshbPAfF/hoREibZWN+FYodzTpnsUYqTo+4NHdxAA6hg4vq
   WL7JcAmWNnwsWqWPHBnLMJf/yuO+8X4YTL+beg62QBlQN/iGIXQUUyqUh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338122191"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="338122191"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 22:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="856365907"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="856365907"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Mar 2023 22:43:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfDjC-000E0e-2s;
	Thu, 23 Mar 2023 05:43:10 +0000
Date: Thu, 23 Mar 2023 13:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sverdlin:ep93xx-snd-wip 16/48]
 drivers/power/reset/ep93xx-restart.c:22:9: error: implicit declaration of
 function 'ep93xx_devcfg_set_clear'
Message-ID: <202303231304.HohbBA4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-snd-wip
head:   ba6048c19f4e119e9d76024c66e205a7f6750063
commit: a436b8a7d7370b4ef5a7d33015f21e684d387454 [16/48] power: reset: Add a driver for the ep93xx reset
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230323/202303231304.HohbBA4z-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sverdlin/linux/commit/a436b8a7d7370b4ef5a7d33015f21e684d387454
        git remote add sverdlin https://github.com/sverdlin/linux
        git fetch --no-tags sverdlin ep93xx-snd-wip
        git checkout a436b8a7d7370b4ef5a7d33015f21e684d387454
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/power/reset/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231304.HohbBA4z-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/reset/ep93xx-restart.c: In function 'ep93xx_restart_handle':
>> drivers/power/reset/ep93xx-restart.c:22:9: error: implicit declaration of function 'ep93xx_devcfg_set_clear' [-Werror=implicit-function-declaration]
      22 |         ep93xx_devcfg_set_clear(EP93XX_SYSCON_DEVCFG_SWRST, 0x00);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ep93xx_devcfg_set_clear +22 drivers/power/reset/ep93xx-restart.c

    17	
    18	static int ep93xx_restart_handle(struct notifier_block *this,
    19					 unsigned long mode, void *cmd)
    20	{
    21		/* Issue the reboot */
  > 22		ep93xx_devcfg_set_clear(EP93XX_SYSCON_DEVCFG_SWRST, 0x00);
    23		ep93xx_devcfg_set_clear(0x00, EP93XX_SYSCON_DEVCFG_SWRST);
    24	
    25		mdelay(1000);
    26	
    27		pr_emerg("Unable to restart system\n");
    28		return NOTIFY_DONE;
    29	}
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
