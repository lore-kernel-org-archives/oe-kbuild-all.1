Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1232C9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681385989; x=1712921989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gaGjiT+v+ghKfYSqeNze/+mE+Wp4oGkF+auybGrR00Y=;
  b=LcxPsC6fAhXJ2EXD1FmoVQoVjdWCUMS/X0EbA0fliNuoxB1mfHwYbCp6
   FS8HHmw7vZJ0ejgnWxs/8VnsIRjHMVC0MDBDNL9b9sv7GYJnfvunTG2Ml
   Tn4O0pjhsqQQTRHMKmZbXoDDMACuUKa+BJh+0rrpnGCMd8nNj2LBXfQoK
   IBYoC2yyOO8rLbgWvJiocvBUc3/1W5trFXG8+7I++mFaXBf/0Tg/nJdSo
   v/iHkh71rA/H+8YBkfD7DXxWeaVsfj14E7OkVM7ukvGXVcz6i1F+w6VKh
   /IvRtxF4FHkLsMUQjSbPyEofCu+88PJhiEbPskWMEfgUc1FASuQGA3+Sm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="372011621"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; 
   d="scan'208";a="372011621"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 04:39:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863744257"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; 
   d="scan'208";a="863744257"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Apr 2023 04:39:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmvIp-000Ye1-02;
	Thu, 13 Apr 2023 11:39:47 +0000
Date: Thu, 13 Apr 2023 19:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:epoll-min_ts.2 9/10]
 ./usr/include/linux/eventpoll.h:111:9: error: unknown type name 'sigset_t'
Message-ID: <202304131945.1zymZHK6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git epoll-min_ts.2
head:   b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
commit: 343353f60bfa9ffcf17dee8189972f43575bbe5e [9/10] eventpoll: add epoll_pwait3()
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230413/202304131945.1zymZHK6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=343353f60bfa9ffcf17dee8189972f43575bbe5e
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block epoll-min_ts.2
        git checkout 343353f60bfa9ffcf17dee8189972f43575bbe5e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131945.1zymZHK6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/eventpoll.h:107:41: error: field 'timeout' has incomplete type
     107 |         struct __kernel_timespec        timeout;
         |                                         ^~~~~~~
>> ./usr/include/linux/eventpoll.h:111:9: error: unknown type name 'sigset_t'
     111 |         sigset_t                        sigmask;
         |         ^~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
