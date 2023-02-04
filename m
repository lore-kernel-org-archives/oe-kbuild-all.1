Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFF07C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 23:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675552021; x=1707088021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+OBaKGVX/ZxuLQl6ec+WH3yedGl8skQ6Km5EfEF44A=;
  b=UZr4Hj0z1yjrc++HVl3bUhlajio/l6XRaU4mYBem4YOMM0oU8qVELpEb
   bK6CgcrWWpFHjJFSk2P6T4NHQ+LJ3tKVq6ZY8kWrtoEsBvnabMkhdJBbl
   wVmoN0Cdm2peRNDuUOWYBssKYpgJU0D0AaKzE6FFJNFSjk2dhBOJl872S
   4gQ2KPjx0IoWEZ+5J9URNUcxHnymjvAFSh5Wq8sYPfNLNhcsZxW81S44j
   hZ1qB5P7eQaY/ObkqAInqGXQPNHjZtOnoEUUaUvVm+oHqEqqF0QZQP1J4
   44xBlAUtQFONLxNdxIJHnuXuoUs8tKhlxZGtr/sfm5YHEy9YEtvPyyJKJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="326690403"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="326690403"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 15:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="729645004"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="729645004"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Feb 2023 15:06:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pORcY-0001ZY-2Z;
	Sat, 04 Feb 2023 23:06:58 +0000
Date: Sun, 5 Feb 2023 07:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: xtensa-linux-ld: section .start VMA
 [00000000d1000000,00000000d1000007] overlaps section .image VMA
 [00000000d0003000,00000000d15af34b]
Message-ID: <202302050705.X4TzpbYB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0136d86b78522bbd5755f8194c97a987f0586ba5
commit: c633544a6154146a210cf158157a1ae7c55473b6 xtensa: add support for KASAN
date:   5 years ago
config: xtensa-randconfig-r012-20230202 (https://download.01.org/0day-ci/archive/20230205/202302050705.X4TzpbYB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c633544a6154146a210cf158157a1ae7c55473b6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c633544a6154146a210cf158157a1ae7c55473b6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .start VMA [00000000d1000000,00000000d1000007] overlaps section .image VMA [00000000d0003000,00000000d15af34b]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
