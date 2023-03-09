Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A03BC960
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 22:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678402444; x=1709938444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cpdAfjaYpVixhKakGst6ihF7g9NsQ28COl2QeFD+vmU=;
  b=J8Uu6QQSjoQ+7QhkWGjpZOtb+ZZKuS7ZYuTjbWwo6xk0qbP6Q0d8fBZa
   vRrCQO/+Fz5G3/14E96eok161p67jxMCXL/1S2G5M6HEWfP4rMfvFG29k
   ergLw8JNk0TVUn8/6Kc/FjS/i5lyQR7YzFqKzymgMdhmE9vLrSjl/E/5s
   dfE2vF2KaacY5Sek2JonN3X8cfSCCLlN1X9M9iJAzdkz1TadeNI9yQVch
   pIxwVzFce7jvjD4qsNQkgjfN85qPLo52efJDJQZ/cxunH0fZXr2GeXAtc
   e6Mytyan2D6Q6XkIb7iL+cp3OxgRPss359DppJ4QFRQ4ZHIkXKdsbhfH/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338958457"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="338958457"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 14:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="801348156"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="801348156"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Mar 2023 14:54:03 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paP8o-0003HP-02;
	Thu, 09 Mar 2023 22:53:42 +0000
Date: Fri, 10 Mar 2023 06:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:jh71x0 80/117] drivers/usb/cdns3/cdns3-starfive.c:24:
 warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST()
 instead
Message-ID: <202303100612.ML6qE2SL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh71x0
head:   75534dbe282e93f55a9aa7a61eb3dacc6a7c2a37
commit: 2dcd7d3b252b72762a57f3d590f8b8d9e839bc81 [80/117] usb: cdns3: add StarFive JH7110 USB glue layer
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230310/202303100612.ML6qE2SL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/esmil/linux/commit/2dcd7d3b252b72762a57f3d590f8b8d9e839bc81
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil jh71x0
        git checkout 2dcd7d3b252b72762a57f3d590f8b8d9e839bc81
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/usb/cdns3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100612.ML6qE2SL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-starfive.c:24: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead


vim +24 drivers/usb/cdns3/cdns3-starfive.c

    23	
  > 24	#define USB_STRAP_HOST			BIT(17)
    25	#define USB_STRAP_DEVICE		BIT(18)
    26	#define USB_STRAP_MASK			GENMASK(18, 16)
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
