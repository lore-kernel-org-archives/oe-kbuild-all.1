Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BBD15C6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 04:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681793303; x=1713329303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iikn2fHq/VA1/UjIXV1sXkApoZpQm+NLROyuPf7mgmg=;
  b=QTxPNjaS45TGOjNFl3L/sv573u7yTIn04+M7mEZMIsC/zx99guwT1e+o
   wbAkto4JG4E61DfYiCerCIZ6eX7SQOxBDXBcOPjnAaeKDC6I08xvuXGE+
   3n+lyW8UVNgU0fR3dVUyuzjUpA3oMIFghpnRj26+TLDxln/egGab8UCun
   b8N5jz47yX0iXmbSL9FHwHfI/3HM9nPUvUU9/8uPdQ3T8T3PZ2nGaybeq
   lJDLkNxqXynkGQvjg8+wU3lLUzmjDxTKPEvAv2U+dwUmNluNOwX5L0i2I
   Iq1dbdBQ6c6dpFs3zudtZbrUNHoCO8CBLlBzkiUDhXE4284M/Hj6v1+eW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="342567801"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="342567801"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 21:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="865238122"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="865238122"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Apr 2023 21:48:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1podGO-000d03-2M;
	Tue, 18 Apr 2023 04:48:20 +0000
Date: Tue, 18 Apr 2023 12:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: ERROR: modpost: "__divsi3_table" [lib/lz4/lz4_compress.ko] undefined!
Message-ID: <202304181254.PNdQfsf9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
commit: 5750121ae7382ebac8d47ce6d68012d6cd1d7926 kbuild: list sub-directories in ./Kbuild
date:   7 months ago
config: nios2-randconfig-r014-20230417 (https://download.01.org/0day-ci/archive/20230418/202304181254.PNdQfsf9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5750121ae7382ebac8d47ce6d68012d6cd1d7926
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5750121ae7382ebac8d47ce6d68012d6cd1d7926
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181254.PNdQfsf9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__mulsi3" [kernel/locking/locktorture.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/rcu/rcuscale.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/time/test_udelay.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/scftorture.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/fuse/virtiofs.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/fscache/fscache.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/autofs/autofs4.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/math/prime_numbers.ko] undefined!
ERROR: modpost: "__mulsi3" [lib/lz4/lz4_compress.ko] undefined!
>> ERROR: modpost: "__divsi3_table" [lib/lz4/lz4_compress.ko] undefined!
WARNING: modpost: suppressed 415 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
