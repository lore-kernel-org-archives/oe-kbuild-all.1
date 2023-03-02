Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D11866
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 08:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677744489; x=1709280489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dtkzR1j0OWcU9IN7AjRBcct1vlzAWeqMnPrkscX5uUs=;
  b=PGftZVbXjjDjUouTFJT2uKJZpJMpStDLqbQ6BL1arh3vhxB0btBrahks
   twl8Wtwhv2i4q5Sj5iTbZTeTMZW3pSChc6J24ntVSo+zrGOX4ycGaKjRq
   8gBiF4/UoDOj2+G7gr6E1uybdwsPGWpMuOpf7jJ7Z0qvrHneK1KCyOSEm
   n77WUOKUCpKJcGStywiDpm2773eAJPJTkP5TPIRX6fRbn+ZJPQryB0St1
   y+BN9uKPH32UeM8FoKAUebif5JqSDmIv3Wa+aI3zyvjjYPXffKlPsqzC/
   me8TmDIt+DrzVsA24zTqwQeLQuTWOUegNCUIwfapnA3Qz10wWWho1I/40
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336149898"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="336149898"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 00:08:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674862510"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="674862510"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Mar 2023 00:08:08 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXdyx-0000Kq-19;
	Thu, 02 Mar 2023 08:08:07 +0000
Date: Thu, 2 Mar 2023 16:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 505/9999] timer-of.c:undefined reference to
 `of_iomap'
Message-ID: <202303021633.9ojFTGFM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d383d0f28ecac0f3375bdfb9a0c4bfac979f6f8f
commit: df04ef63347faac344e69e3c16ff20fead158dcc [505/9999] clocksource/drivers/timer-of: Check return value of of_iomap in timer_of_base_init()
config: s390-randconfig-r025-20230227 (https://download.01.org/0day-ci/archive/20230302/202303021633.9ojFTGFM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=df04ef63347faac344e69e3c16ff20fead158dcc
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout df04ef63347faac344e69e3c16ff20fead158dcc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021633.9ojFTGFM-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_init':
>> timer-of.c:(.init.text+0x1fc): undefined reference to `of_iomap'
   s390-linux-ld: timer-of.c:(.init.text+0x5b8): undefined reference to `iounmap'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_cleanup':
   timer-of.c:(.init.text+0xb5e): undefined reference to `iounmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
