Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2E33D2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 11:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678186876; x=1709722876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCx8fvy8h1ZoVvcCxn+5QxGbqRJJ8UTISghe9LSTlUU=;
  b=CMVl3HRbpzggjhBmigcDeI5G+9IPYDtioCDMjHEz4jrF3yCbVn/xoZvZ
   3eAW5+a8+pAHh1fl8NaDTaa/KHXiQmONevPuUY77O8YDqYuLn7Mx6bfRW
   YbRc25tfOBAiqkhvO/0KM6hdfjlYKx3TdJax7BQsajxxir2U+NEu/K7EF
   5F5G3NFpA/H6CaSU6fk90P2cFA+4A2lzNP9KaE2S90PIRHbers9pswTmB
   0Lla5e1kNGqFXvQvPRxKkq1TClj4nAWIk3Iu3T61MzbkccHylzfZj9uW/
   M9UomeqRiMM8euzsKl7z9RaHP5Dck8/23Fph/ua4DY0yAvwbvw4Afvv6O
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319652510"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="319652510"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 03:01:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005822096"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="1005822096"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 03:01:02 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZV41-0001Ez-0x;
	Tue, 07 Mar 2023 11:01:01 +0000
Date: Tue, 7 Mar 2023 19:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.4.y 5698/9999] ERROR: "iounmap"
 [drivers/net/arcnet/arc-rimi.ko] undefined!
Message-ID: <202303071804.BRzIcPal-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   a103859aaa718cf13cb5f55c3a33512dbab613f7
commit: 43dd03f088191e6c85529e649ebb5c54994486ee [5698/9999] init/Kconfig: make COMPILE_TEST depend on !S390
config: s390-randconfig-m031-20230307 (https://download.01.org/0day-ci/archive/20230307/202303071804.BRzIcPal-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=43dd03f088191e6c85529e649ebb5c54994486ee
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 43dd03f088191e6c85529e649ebb5c54994486ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071804.BRzIcPal-lkp@intel.com/

All errors (new ones prefixed by >>):

   ERROR: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!
   ERROR: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
   ERROR: "devm_ioremap" [drivers/input/misc/msm-vibrator.ko] undefined!
>> ERROR: "iounmap" [drivers/net/arcnet/arc-rimi.ko] undefined!
>> ERROR: "ioremap" [drivers/net/arcnet/arc-rimi.ko] undefined!
   ERROR: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
   ERROR: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
