Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D404C8828
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 23:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676937456; x=1708473456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tlfcLraB7jMmoKeZ3Q4etolNa+Ng9y+ZDOo6MGge81g=;
  b=kwyG4sTDShWeDlKzerGOYD+i9g+XSdHJGUFYK09kiAq+C5bbHrngNbSB
   vNiW7adqLUp8Tww93YTieXBv39NAILv7QiW920J3N9vb+tUotGskRPrHy
   kxlTpPN/kC6DM84x5eiqeah7nskkV8s9g/W0zwoSwJgnis8QX49lBcP98
   CGqGwlv1bmN6q7GYC2gDIqA0cpubzDGHNakt0ej8woFQtY3ykCZMM9a9J
   DcNkBOwX+6Q0uU53DYDZ89+DUNTmAvc9ZMhxNdgmgZ+mYFknbRq8hTuv4
   WAZmgxICjWMjNb6MVItKswDtEmXwezDUxSJYQ8asN4Gb0xBqKTjaB85aA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="334706513"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="334706513"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 15:57:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="1000410799"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="1000410799"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Feb 2023 15:57:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUG2H-000EFp-3B;
	Mon, 20 Feb 2023 23:57:33 +0000
Date: Tue, 21 Feb 2023 07:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev, Hal Feng <hal.feng@starfivetech.com>
Subject: [esmil:jh7110 12/47]
 drivers/reset/starfive/reset-starfive-jh71x0.c:106:5: warning: no previous
 prototype for 'reset_starfive_jh71x0_register'
Message-ID: <202302210730.CsvDlay8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Emil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/esmil/linux jh7110
head:   c004d36a3c27fd53e8b35dbb620eae711613662c
commit: a02025203e27a21b3bf1d6f4ba4f86d4af8e5b2b [12/47] reset: starfive: Rename "jh7100" to "jh71x0" for the common code
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230221/202302210730.CsvDlay8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/esmil/linux/commit/a02025203e27a21b3bf1d6f4ba4f86d4af8e5b2b
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil jh7110
        git checkout a02025203e27a21b3bf1d6f4ba4f86d4af8e5b2b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/reset/starfive/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210730.CsvDlay8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/starfive/reset-starfive-jh71x0.c:106:5: warning: no previous prototype for 'reset_starfive_jh71x0_register' [-Wmissing-prototypes]
     106 | int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/reset_starfive_jh71x0_register +106 drivers/reset/starfive/reset-starfive-jh71x0.c

   105	
 > 106	int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
