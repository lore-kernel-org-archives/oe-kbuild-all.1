Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746DD9448
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685426953; x=1716962953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5mC4fDFAYmHINxWuc/hg/ya/ukiJXfR3kliuIVeOSQ4=;
  b=Dl3ygZgFmwY6mq/tETWVF7yJDF9cU2Il1MXw7uAUpdk2N0joh5Zr1YIj
   o9a6W0BPDKY1zsWKDsUvb/sF2thtWNGQ4x9Z+ngl6+iKUgTPVFoKT77GO
   EOiG8InfelTdrCfxDoz3WQgiF5GzxSr/yi+gjYoWGPFqTD0gk8Xhgpfve
   JbtHq0UQRrIZJnBWJTCIA3ED47mJGUf4sG23mfhsaZRw96hJ6NzaFUY+o
   RGrbtrW55dTJodxZvH1ofQLb4G3BBYCcbhQ2FDgiAy6U9Pi1CQ7aSEUL0
   RkVRhgYC1EhRunDFNo+xbd7R4dDVIpdLagdzAZrerZxs+jEqIJTs+L6/I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357200366"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="357200366"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 23:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="739381244"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="739381244"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 May 2023 23:09:11 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3sXe-0000AE-21;
	Tue, 30 May 2023 06:09:10 +0000
Date: Tue, 30 May 2023 14:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.15 17/69] m68k-linux-ld: section .rodata
 VMA [00001000,0024925f] overlaps section .text VMA [00000400,00439aff]
Message-ID: <202305301407.z33zOjcG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   45d082d2c0daa97f3ea394c47e705afdd1c621e0
commit: 43f232d748d57057e2e9dd041907c55177c50cf2 [17/69] m68k: Move signal frame following exception on 68020/030
config: m68k-randconfig-r035-20230530 (https://download.01.org/0day-ci/archive/20230530/202305301407.z33zOjcG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=43f232d748d57057e2e9dd041907c55177c50cf2
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout 43f232d748d57057e2e9dd041907c55177c50cf2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301407.z33zOjcG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> m68k-linux-ld: section .rodata VMA [00001000,0024925f] overlaps section .text VMA [00000400,00439aff]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
