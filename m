Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B2AED9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 01:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685495693; x=1717031693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fS6k/hvrcYCPh8j3mI+Z05pFLw+RCkVOHAYke57U7Uw=;
  b=nXyctOMGKtsYnfm68jJdLwPKsSzSaT6abYI4623Gp1NZylrXLEw9qAta
   G1iSYkEBBcPOy1hxFjBpry7yP7mhcS3BgRvjAltNVUgA2Ys0otXnEQmLO
   IwgmsQGwSHeS5jqK+zxa0p0nJVuQjJ8w9zpU8H4kJhiG48odMrS/go9dh
   RipPxstHWuFV7u6utp5fnFfYmYyQjkqu/Y+qg4E8IOjnwaIb8BwsFwUzF
   b/INT6Yu9MuBkHIX8Jzfq6z3qPkyOguf3xiIGrpaWAbOIZegNT19FJJbc
   3/0VzQsSqwy6DzUdw31yUF2+CnIJr5ZzysrkjYWD4kiOaHIVYcmaq9iAF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="344600285"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="344600285"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 18:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="1036810310"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="1036810310"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 May 2023 18:14:52 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4AQN-0000x9-10;
	Wed, 31 May 2023 01:14:51 +0000
Date: Wed, 31 May 2023 09:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: [peterz-queue:locking/core 12/14] s390-linux-ld: mm/slub.c:3040:
 undefined reference to `__bad_size_call_parameter'
Message-ID: <202305310924.NzhVUPyA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   5b5635c673a420e884950501f1fdc8ae6dd68174
commit: 43a7be77d3f8e94e1d76c4877602c08406f1c6ac [12/14] slub: Replace cmpxchg_double()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230531/202305310924.NzhVUPyA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=43a7be77d3f8e94e1d76c4877602c08406f1c6ac
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/core
        git checkout 43a7be77d3f8e94e1d76c4877602c08406f1c6ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310924.NzhVUPyA-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/slub.o: in function `__update_cpu_freelist_fast':
   mm/slub.c:3040: undefined reference to `__bad_size_call_parameter'
>> s390-linux-ld: mm/slub.c:3040: undefined reference to `__bad_size_call_parameter'
>> s390-linux-ld: mm/slub.c:3040: undefined reference to `__bad_size_call_parameter'
>> s390-linux-ld: mm/slub.c:3040: undefined reference to `__bad_size_call_parameter'
>> s390-linux-ld: mm/slub.c:3040: undefined reference to `__bad_size_call_parameter'
   s390-linux-ld: mm/slub.o:mm/slub.c:3040: more undefined references to `__bad_size_call_parameter' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
