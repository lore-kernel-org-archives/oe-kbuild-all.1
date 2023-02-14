Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69BAC5E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 19:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676401701; x=1707937701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/QAIubZIGl79mjrIIlxp4xAo4C1DtkmGdfLjrXly+gs=;
  b=F2jErtmG1h436T5UJ71dpLW4vIs3yZ268LoqhNviCC2Rk/jNwny1z+ay
   pfxRop+ApldSPiXwxvOQ2H/QJLLziGEglmdTuKbc1NgoTrpX5eKkXKUD9
   zCYBLM9JIt0C7KMYeDpYtKUcrJ4Ei9ER6At57yjo5cQzkE//bgYkBog0/
   /y9lRzXRWPV0VN4ZrY/kIa9z8k+/8osv54IKEyIMG3LQD6jXhsx8pUlOr
   3DO2Nhorw/R3ca0SpK+HTwTyrFcIJOnV0cFQV1ZR2cmOErBiobBZ73EpB
   75eXmkYplYkPgoeD9J/r0n34YcEet+JOW3NiNJK1qD9vEa+pqvsJAa64M
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="310875098"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="310875098"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 11:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="671312342"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="671312342"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Feb 2023 11:08:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS0f5-0008jJ-1b;
	Tue, 14 Feb 2023 19:08:19 +0000
Date: Wed, 15 Feb 2023 03:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle 9/9]
 include/asm-generic/bitops/sched.h:35:14: error: assignment of read-only
 location '*b'
Message-ID: <202302150300.HNUZj5FO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle
head:   f2f6a265a964d70dd174dfce3f44401bb11a475d
commit: f2f6a265a964d70dd174dfce3f44401bb11a475d [9/9] Add sched_find_first_bit_except
config: arc-randconfig-r043-20230213 (https://download.01.org/0day-ci/archive/20230215/202302150300.HNUZj5FO-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=f2f6a265a964d70dd174dfce3f44401bb11a475d
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle
        git checkout f2f6a265a964d70dd174dfce3f44401bb11a475d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150300.HNUZj5FO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/bitops.h:187,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   include/asm-generic/bitops/sched.h: In function 'sched_find_first_bit_except':
>> include/asm-generic/bitops/sched.h:35:14: error: assignment of read-only location '*b'
      35 |         b[0] &= ~(s[0]);
         |              ^~
>> include/asm-generic/bitops/sched.h:36:14: error: assignment of read-only location '*(b + 4)'
      36 |         b[1] &= ~(s[1]);
         |              ^~
   include/asm-generic/bitops/sched.h:42:14: error: assignment of read-only location '*(b + 8)'
      42 |         b[2] &= ~(s[2]);
         |              ^~
   include/asm-generic/bitops/sched.h:43:14: error: assignment of read-only location '*(b + 12)'
      43 |         b[3] &= ~(s[3]);
         |              ^~
   make[2]: *** [scripts/Makefile.build:118: kernel/bounds.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1270: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:231: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +35 include/asm-generic/bitops/sched.h

    31	
    32	static inline int sched_find_first_bit_except(const unsigned long *b,
    33						      const unsigned long *s)
    34	{
  > 35		b[0] &= ~(s[0]);
  > 36		b[1] &= ~(s[1]);
    37	#if BITS_PER_LONG == 64
    38		if (b[0])
    39			return __ffs(b[0]);
    40		return __ffs(b[1]) + 64;
    41	#elif BITS_PER_LONG == 32
    42		b[2] &= ~(s[2]);
    43		b[3] &= ~(s[3]);
    44		if (b[0])
    45			return __ffs(b[0]);
    46		if (b[1])
    47			return __ffs(b[1]) + 32;
    48		if (b[2])
    49			return __ffs(b[2]) + 64;
    50		return __ffs(b[3]) + 96;
    51	#else
    52	#error BITS_PER_LONG not defined
    53	#endif
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
