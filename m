Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC96116
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683640550; x=1715176550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b7Hyazj80VhlyHjKskcmOmmLPOGAVGVIuXvL/gGh3gE=;
  b=WJuFylitAuAfyysPQbB3JmhE5hnm2I/hfHBxMmmGKLoxBsR7Jl/tKyb6
   Am+8bzoHhv9koHYg6kRG3QC1Oh9VkK7wPeD25iWI9eJ3RbwLkSm0oQcHL
   SGWRfR4WeX/VTi3w5WhfW2+m2m71t1BPbSuaQ0ZjRVYS1Zgp69b8i6d1m
   AZEWIDt8qBkU4vTzCzlsGR2ysFZlNjon55LAqGZG0ou4XiNMwZothSnpu
   STMwy1Sxs3RJW4yIofXS41PmVwBM8yD6jKaddUqsNRCJuMaZeSBjw2w2s
   NKjF90itXSoCilXZiXRCCO1EtUzB3uTR96nJANqsAQsRANIAIt/+LBo3D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330292775"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="330292775"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 06:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873207619"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="873207619"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 May 2023 06:55:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwNoi-0002Bc-0R;
	Tue, 09 May 2023 13:55:48 +0000
Date: Tue, 9 May 2023 21:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/splice.c:53:19: sparse: sparse: cast from restricted fmode_t
Message-ID: <202305092109.6raeJ4wr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba0ad6ed89fd5dada3b7b65ef2b08e95d449d4ab
commit: 0f99fc513ddd28de155c58547824a9fd63daacea splice: clear FMODE_NOWAIT on file if splice/vmsplice is used
date:   2 weeks ago
config: loongarch-randconfig-s052-20230507 (https://download.01.org/0day-ci/archive/20230509/202305092109.6raeJ4wr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0f99fc513ddd28de155c58547824a9fd63daacea
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0f99fc513ddd28de155c58547824a9fd63daacea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305092109.6raeJ4wr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/splice.c:53:19: sparse: sparse: cast from restricted fmode_t
>> fs/splice.c:53:19: sparse: sparse: cast from restricted fmode_t
>> fs/splice.c:53:19: sparse: sparse: cast to restricted fmode_t

vim +53 fs/splice.c

    39	
    40	/*
    41	 * Splice doesn't support FMODE_NOWAIT. Since pipes may set this flag to
    42	 * indicate they support non-blocking reads or writes, we must clear it
    43	 * here if set to avoid blocking other users of this pipe if splice is
    44	 * being done on it.
    45	 */
    46	static noinline void noinline pipe_clear_nowait(struct file *file)
    47	{
    48		fmode_t fmode = READ_ONCE(file->f_mode);
    49	
    50		do {
    51			if (!(fmode & FMODE_NOWAIT))
    52				break;
  > 53		} while (!try_cmpxchg(&file->f_mode, &fmode, fmode & ~FMODE_NOWAIT));
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
