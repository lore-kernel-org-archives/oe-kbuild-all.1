Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8737F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 03:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682134055; x=1713670055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ph5w1AYiKP/d6+QKp5cQkQTwiEsnf7CXXn3Vy270zHc=;
  b=aIg8Eq1MqD476YDriV+5hJJo79NThJTJbiGMDBajGmdT4Z/g3V87Qcz9
   6zgfmGRdZKL+Jf9/WHCs9pOxTkU4dhVTjOZnsSLP2SOqmRTvXd2pJj8ep
   zktmhKSbBhB/O6QpZlejlgRXOz8NXIRp0HAAtczvbtQvuMmTScc8oBykr
   rAupugp9u78/eLIm8pmRYwcwPZHhXj//Qk1qTBOO9JQjXSu9BoL9o/aSh
   DPQHMROzltIpULHpC58oRueh1jib7uwoMTXMnaV20HWx2JdgTPo4Rta1o
   N4lXR4AG59uX54N2JKE9b8phGnZhFKsMQ2tUWqI+GdCd7VmIR5dXeLmqu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409064006"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="409064006"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 20:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="761784015"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="761784015"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2023 20:27:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq3uP-000h2W-04;
	Sat, 22 Apr 2023 03:27:33 +0000
Date: Sat, 22 Apr 2023 11:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:ctime 1/5] stat.c:undefined reference to
 `__atomic_fetch_or_4'
Message-ID: <202304221113.xP0iPgpQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ctime
head:   54dd444fe05963240ab071845d5de2b1da6d7688
commit: ef2430ea5bbddbce887a45fce3dcc6d2034e6d7b [1/5] fs: add infrastructure for multigrain inode i_m/ctime
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20230422/202304221113.xP0iPgpQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=ef2430ea5bbddbce887a45fce3dcc6d2034e6d7b
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ctime
        git checkout ef2430ea5bbddbce887a45fce3dcc6d2034e6d7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221113.xP0iPgpQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/stat.o: in function `generic_fill_multigrain_cmtime':
>> stat.c:(.text+0x1c8): undefined reference to `__atomic_fetch_or_4'
   arm-linux-gnueabi-ld: fs/inode.o: in function `current_ctime':
>> inode.c:(.text+0x172c): undefined reference to `__atomic_fetch_and_4'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
