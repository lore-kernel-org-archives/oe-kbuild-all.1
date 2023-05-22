Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA96111D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 May 2023 06:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684738527; x=1716274527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efrTkUvWI4tlV5iOT7Ce502ZgZue3uA63eBCmRu2YZo=;
  b=DVbncTBw6lq5N+fnB2Yoc4VO4QxU456jo2R3PCPZGULDzVnAJws274YS
   7PuWm6Hl3BaGRxaSmE5Q7XRMcIB0U+RyHzBZ5mohaK6ev2sMOq3pAAOyA
   tUBp0WzAcVlW3y6UXzeaGyJNIzMxY4nKLOs6z6KYxGs8c7ZweJLAQ9p3w
   kYVjpzxoMeZuw7ysok+zMWDc1Hfj90/obTLPBdAG9WThjacL9Zx0Gc5YT
   EAT1Aq+u8K+Iq5S6V95rU9qbUif59deh9ZHKsCtYvGielh/0ikcNn3NQT
   nvHS0Bq07AETNItN0wjZctVdjcabBCnKsPPiZSwJ4dataifhPb7CqVRjb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="355188483"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="scan'208";a="355188483"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2023 23:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="949953583"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="scan'208";a="949953583"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 May 2023 23:55:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q0zRx-000CdR-0b;
	Mon, 22 May 2023 06:55:21 +0000
Date: Mon, 22 May 2023 14:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Vijayanand Jitta <vjitta@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Yogesh Lal <quic_ylal@quicinc.com>
Subject: [sudeep-holla:android13-5.15/ffa 1117/4062] (.rodata+0x0): multiple
 definition of `__crc_si_swapinfo';
 arch/s390/appldata/appldata_base.o:(.rodata+0x0): first defined here
Message-ID: <202305221403.7QLN4YyZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vijayanand,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: eb03ee118ab0680aebda709b5c3e32a3e3b4c99c [1117/4062] ANDROID: mm: Export si_swapinfo
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230522/202305221403.7QLN4YyZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=eb03ee118ab0680aebda709b5c3e32a3e3b4c99c
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla android13-5.15/ffa
        git checkout eb03ee118ab0680aebda709b5c3e32a3e3b4c99c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305221403.7QLN4YyZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/swapfile.o: in function `__crc_si_swapinfo':
>> (.rodata+0x0): multiple definition of `__crc_si_swapinfo'; arch/s390/appldata/appldata_base.o:(.rodata+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
