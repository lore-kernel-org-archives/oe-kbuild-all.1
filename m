Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A48A36E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 05:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674279297; x=1705815297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MHdRNgYIKdoTg7iodQO4s/Tix+28Ua3KfjiAgmipUsg=;
  b=m97RPNRlfN5Yr07a+KaIgT3vhvTOb+nhqzSCWuDogcYIxtYks5W3+nih
   nsxplZarVV9ALfiIPHqrrS76ZwmI0OFpxouReS8VCMGRv7YEzL8iti7YE
   Oqf6CU6GvQwUMrG+M6tbbY23mnSM9E4lP/r/KErLX7nqXCZnWgcf3ClE4
   lOy/4aW+enN+FFGAu6RquCJ5Zehh+Zg0nd/JSPV5AIzOimddTf21TJyd2
   vwsGskaqs+2zqSpdBRUGlxzYjF3BFp4NrWvpGu5x9eG1qiXGic2U8IhUe
   MM7b3hVhlPNQnzkYstjUxLYdmGmMi8Yr/8l+WCIx+GZ/Xp++5dRK3zyEc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324448685"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="324448685"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 21:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="662773339"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="662773339"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2023 21:34:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ6Wk-0003Za-2W;
	Sat, 21 Jan 2023 05:34:54 +0000
Date: Sat, 21 Jan 2023 13:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/nmitest.2023.01.20a 5/5]
 kernel/rcu/rcutorture.c:undefined reference to `set_nmi_torture'
Message-ID: <202301211330.0IJsirCg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/nmitest.2023.01.20a
head:   53e298568bde2c728ee2aac4ac634cca8550a4b4
commit: 53e298568bde2c728ee2aac4ac634cca8550a4b4 [5/5] rcutorture: Test NMI diagnostics
config: mips-randconfig-r025-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211330.0IJsirCg-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/53e298568bde2c728ee2aac4ac634cca8550a4b4
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/nmitest.2023.01.20a
        git checkout 53e298568bde2c728ee2aac4ac634cca8550a4b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mipsel-linux-ld: mipsel-linux-ld: DWARF error: could not find abbrev number 17
   kernel/rcu/rcutorture.o: in function `rcu_torture_cleanup':
>> kernel/rcu/rcutorture.c:(.text+0x33b8): undefined reference to `set_nmi_torture'
>> mipsel-linux-ld: kernel/rcu/rcutorture.c:(.text+0x3424): undefined reference to `set_nmi_torture'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
