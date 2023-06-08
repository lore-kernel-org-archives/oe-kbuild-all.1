Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD61C2DA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686238946; x=1717774946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XovPN5jWdpaylBfEXbZEN6S437WmBDR4N0ocDjfhz8s=;
  b=DOjo5NNqrp0NaC4Z6N2c5fPxMMEj7usSll4X5s6iZ7qX70DJ/VTIyTGH
   /mLPOMRxTlN0R0XN7IdK3XIwsQLTcJs6og2lmMTm1e3YJZZg4bQQlBEXz
   NJP+VXLuF0Uu2R7B2uRsUS2NYhuSJjhjoku4tnNGz6C0V6keH0/KQHBno
   hCZzeWMN7wYRwwAFOHgXFvgQ7djLtf7BlHlD4qXKNUthpHqbF4mtFGeEd
   idPbNWMgVjbW6dEojIcwt3OgJNGcaKwGGzuWyxaFC+gXdAPP8EUXbwiEg
   XGuT/UlThkcwZKvPpfKo6nJBfx73LhMNaGcfQ930pTVPnpBmjX+HwdJML
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385687183"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="385687183"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 08:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="687411406"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="687411406"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jun 2023 08:42:23 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7HmJ-0007zj-05;
	Thu, 08 Jun 2023 15:42:23 +0000
Date: Thu, 8 Jun 2023 23:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
Subject: [linux-next:master 7388/8065] ERROR: modpost: "uv_info"
 [drivers/s390/char/uvdevice.ko] undefined!
Message-ID: <202306082325.7vvIeVZo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   db10f126048021b86e43a5d6a335ec49dec10155
commit: f0e8f36f8b99c475ee75455fd68e0b955c5cd1e4 [7388/8065] s390/uvdevice: Add info IOCTL
config: s390-randconfig-s041-20230608 (https://download.01.org/0day-ci/archive/20230608/202306082325.7vvIeVZo-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f0e8f36f8b99c475ee75455fd68e0b955c5cd1e4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f0e8f36f8b99c475ee75455fd68e0b955c5cd1e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306082325.7vvIeVZo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "uv_info" [drivers/s390/char/uvdevice.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
