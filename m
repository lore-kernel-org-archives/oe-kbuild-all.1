Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91061640A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685543429; x=1717079429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZxUHQhX0GyRGtx2OE3MmZh0e8gGy6ik4PE8LpHqXF4=;
  b=ZJSi6jgR3rRibevceWBeJ3FaN/tlhKQONq0vGGeXO3raiggpRd4mF4WD
   0GElzsPCzzOcmr3toj2xaLjGJePefO/0VNGoAJ1+tinv8F1satj67++hR
   sYErz8obl+v7NSSS9E2Wxz4KwiblgarLwkekU3ErtVlLWje7de+b6253d
   Nsdk0YkbZGp6QXOYdXAtnsKM7gugvtWlkQGPaxc3k3GMLbkGA6O9DUDFA
   uQTDkW6YVvQuUrUlw43fibSRUDsIwZwhnzAcA0WrP4nQAy/D2H0ThtfgJ
   w0Q7BU7z5y7GXaBPgHvsBtYLnmJabtoXlzUleKuRL11F00Afwar6ByGda
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="344766423"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="344766423"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 07:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710099538"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="710099538"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 May 2023 07:30:26 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4MqH-0001OV-2M;
	Wed, 31 May 2023 14:30:25 +0000
Date: Wed, 31 May 2023 22:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:master 26/68] m68k-linux-ld: section .rodata VMA
 [00001000,00529c6f] overlaps section .text VMA [00000400,009429cf]
Message-ID: <202305312256.B823JJ2Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   397ede0056e7977ee161817e66bff04542f6deac
commit: e1bac42e19ce0885bdcba2bea6518f96ce04b8b1 [26/68] media: hi846: fix usage of pm_runtime_get_if_in_use()
config: m68k-buildonly-randconfig-r002-20230531 (https://download.01.org/0day-ci/archive/20230531/202305312256.B823JJ2Q-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
        git fetch --no-tags sailus-media-tree master
        git checkout e1bac42e19ce0885bdcba2bea6518f96ce04b8b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305312256.B823JJ2Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> m68k-linux-ld: section .rodata VMA [00001000,00529c6f] overlaps section .text VMA [00000400,009429cf]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
