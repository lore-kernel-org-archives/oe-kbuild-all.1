Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F4917C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 05:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674191442; x=1705727442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7BRjsFosDCZG7P7dgV1v59hQsFwSnzzj9k754ga3Vg=;
  b=VMBHU4SnPgF7KxxNS99cH0GTYQVy9Hq80FO+RfFpjyRn2QOqOKZlEuDM
   C4qJReZwWDsir+19/HCclY0hGT4S2qHhgaZqa8PlnO+SwRA5bEj+sQkiu
   TEKp5ksK4wTSAi7rLwtON3Y/5561DwI+rIGVuR2NMI03uiXozeT4QzkG+
   fm0k7qyX3UFGbjhiCxC0IZ+Z1nI5LXESEYExO0UtzoQ3qPDoc1oBhWAo3
   dPWD5HO7UWykEZWHzCDi1nbLTQRjtougYafdOfV8WEVTxb9AUZZm0nN7F
   4Q6elkx6VIOMFuGXY/F3JV9Rvk+0nFz3N6f+NGa5acNZw59POI1zC5LSH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324188766"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="324188766"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 21:10:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="989292858"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="989292858"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2023 21:10:40 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIjfk-0002Cm-0j;
	Fri, 20 Jan 2023 05:10:40 +0000
Date: Fri, 20 Jan 2023 13:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/slownmi.2023.01.19a 3/4] ERROR:
 modpost: "dump_cpu_task" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202301201335.5rpVzsvW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/slownmi.2023.01.19a
head:   06901681acde9854a9a9a337cebbf3ab537f4543
commit: 0b427424fcb1ed69d6a9feb9532111883b590fea [3/4] rcutorture: Add test_nmis module parameter
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230120/202301201335.5rpVzsvW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/0b427424fcb1ed69d6a9feb9532111883b590fea
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/slownmi.2023.01.19a
        git checkout 0b427424fcb1ed69d6a9feb9532111883b590fea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dump_cpu_task" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
WARNING: modpost: suppressed 16 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
