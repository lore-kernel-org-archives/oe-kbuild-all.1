Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8A7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 08:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682412328; x=1713948328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVDuvoHyfqef7hU/QGEcFpe4zX0NmBVkCFOgiOqw9uY=;
  b=a6Dub4oU88Qaxr0eyyDa3AZ11KbFTTFxlabSPTOv0fRaVNgJQqBnVmlx
   iB6OFKbD4egl2rPCpeby5z6mF0QsDpKJfCT6SQXIKKSkXkiBMDS4GLN4G
   y9/ViiUtWZXz/MXkeYykQtaYvEjXGbqZYW1Ia/4zuO8Az6JrYIA5d2rLp
   sWHxEAier9BcuvqlaAeZEw/YC1XFXP3G5/3TmhGwLjdgJycg0onDgUc2+
   WxZ19NdsBG7Ecjc9GuwO0Vp6GyzcIl5FBFiF/aTNY5TZRoKO8s45W+Z+1
   3KKHSKUTOz6C/p4yPYnSZq3L3pRmb2k1Ykmge9G792Waf5aFhnNbrHHYm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409642915"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="409642915"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 01:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693415313"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="693415313"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Apr 2023 01:45:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prEIg-000jEG-2A;
	Tue, 25 Apr 2023 08:45:26 +0000
Date: Tue, 25 Apr 2023 16:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:pipe-nonblock.2 1/2] fs/splice.c:60:19: sparse: sparse:
 cast from restricted fmode_t
Message-ID: <202304251604.SwJpFdA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git pipe-nonblock.2
head:   09ad5feff1f4b3d12bf6a5aabf6752401043c471
commit: f10cbebf4dd7f77b0e87c77bb0191a5a07d5e7ac [1/2] splice: clear FMODE_NOWAIT on file if splice/vmsplice is used
config: m68k-randconfig-s033-20230423 (https://download.01.org/0day-ci/archive/20230425/202304251604.SwJpFdA1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=f10cbebf4dd7f77b0e87c77bb0191a5a07d5e7ac
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block pipe-nonblock.2
        git checkout f10cbebf4dd7f77b0e87c77bb0191a5a07d5e7ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251604.SwJpFdA1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/splice.c:60:19: sparse: sparse: cast from restricted fmode_t
>> fs/splice.c:60:19: sparse: sparse: cast from restricted fmode_t
>> fs/splice.c:60:19: sparse: sparse: cast to restricted fmode_t

vim +60 fs/splice.c

    39	
    40	/*
    41	 * Splice doesn't support FMODE_NOWAIT. Since pipes may set this flag to
    42	 * indicate they support non-blocking reads or writes, we must clear it
    43	 * here if set to avoid blocking other users of this pipe if splice is
    44	 * being done on it.
    45	 */
    46	static void pipe_clear_nowait(struct file *file)
    47	{
    48		fmode_t new_fmode, old_fmode;
    49	
    50		/*
    51		 * We could get by with just doing an xchg() here as f_mode should
    52		 * not change in the file's lifetime, but let's be safe and use
    53		 * a cmpxchg() instead.
    54		 */
    55		do {
    56			old_fmode = READ_ONCE(file->f_mode);
    57			if (!(old_fmode & FMODE_NOWAIT))
    58				break;
    59			new_fmode = old_fmode & ~FMODE_NOWAIT;
  > 60		} while (!try_cmpxchg(&file->f_mode, &old_fmode, new_fmode));
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
