Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2BE946C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 07:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685430751; x=1716966751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+Zlc3rFkYSoVdViRULuOCCT18dzQfOVW2u3v5fyF+Q=;
  b=aRuy6GK3prtpQGnqxvJmP4yjeOQlZcoiKqU72jFHy9fAt3IOgGMR061m
   sKF2m/0mraY+vpiMWMbesiYlaWUbmGxCKAbY0tukeWiHWRG/9nK4BhE+Y
   6gK8uqdC8XhVW+Yg+5SPBJg0D7EoiE/Rc17wKlSwGzpUD13A01EuFgagq
   KPgUcWuG5a6PRg1JYqP3+CbFWvQnhC8/Ptn93tnk3+T3ekdh9UHsywCNI
   QPcL/io4yDAAUTkbYLFI1+mUXWXDMDNnlyu140Cw9eodUFmYH49RAHbha
   lWlFaulzTPw/Evuhw5qCaMt35QPC2iwqnYwxy4Lsg1ulwg5uYHcNgl8px
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441192120"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="441192120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 00:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683833044"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="683833044"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2023 00:12:12 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3tWe-0000Bg-0X;
	Tue, 30 May 2023 07:12:12 +0000
Date: Tue, 30 May 2023 15:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [linux-next:master 3890/5779] m68k-linux-ld: section .rodata VMA
 [00001000,00154967] overlaps section .text VMA [00000400,006e714f]
Message-ID: <202305301505.a1hJGgBM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8c33787278ca8db73ad7d23f932c8c39b9f6e543
commit: b8cbc0855a22fe386c704ee29fb21282f999b995 [3890/5779] sysctl: Remove register_sysctl_table
config: m68k-randconfig-m031-20230530 (https://download.01.org/0day-ci/archive/20230530/202305301505.a1hJGgBM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b8cbc0855a22fe386c704ee29fb21282f999b995
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b8cbc0855a22fe386c704ee29fb21282f999b995
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301505.a1hJGgBM-lkp@intel.com/

Note: the linux-next/master HEAD 8c33787278ca8db73ad7d23f932c8c39b9f6e543 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> m68k-linux-ld: section .rodata VMA [00001000,00154967] overlaps section .text VMA [00000400,006e714f]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
