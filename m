Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F07F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686727919; x=1718263919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6pkoifWYNVcdIY2dzRXf/eXhNJAF42NnKG+vxrdy18=;
  b=g3Ru3IbvHG9xGVfyjsFog7uGKf0JI4TRhZGrddsOUxhOndiu09gxvLIn
   K1C97Oyo65yLTv/iPkFN5guADRMmAd4oSlw8bM0UKl0IymIVubBI7AESW
   0CIzefqJ3t4iZVjUD54iA6SR1XGcyZ+eVOOTJkbuz9zKju/Jf7EtYxOhW
   zMMVGDGjvFxRAP2dGzRVBvaW2LhoJhN1j0lt+J1iOR8EAL/5aTlRt1avH
   2tnii86Ybca1splMNV2fUc/b6Iyr1P0K+zvzdp1AOl0pRwC2tsTP27C2y
   +SwyJ3bUmmp2dQItrGQ5GNTsedOK9RMhQTE/NXO0v9twycLvboOA3MhvH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="357422163"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="357422163"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 00:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="801814127"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="801814127"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2023 00:31:56 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9Kyx-0000NQ-1U;
	Wed, 14 Jun 2023 07:31:55 +0000
Date: Wed, 14 Jun 2023 15:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: [stable:linux-4.19.y 1426/9999] lib/strncpy_from_user.c:55: Error:
 unrecognized opcode `csrs sstatus,a0', extension `zicsr' required
Message-ID: <202306141556.xkjRYt9Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   7625843c7c86dd2d5d4bcbbc06da8cba49d09a5b
commit: e18590b3e242638e873a61d299abf8a9df446236 [1426/9999] lib: Reduce user_access_begin() boundaries in strncpy_from_user() and strnlen_user()
config: riscv-randconfig-c044-20230612 (https://download.01.org/0day-ci/archive/20230614/202306141556.xkjRYt9Y-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=e18590b3e242638e873a61d299abf8a9df446236
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout e18590b3e242638e873a61d299abf8a9df446236
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141556.xkjRYt9Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/strncpy_from_user.c: Assembler messages:
   lib/strncpy_from_user.c:39: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   lib/strncpy_from_user.c:39: Error: unrecognized opcode `csrc sstatus,a2', extension `zicsr' required
>> lib/strncpy_from_user.c:55: Error: unrecognized opcode `csrs sstatus,a0', extension `zicsr' required
>> lib/strncpy_from_user.c:55: Error: unrecognized opcode `csrc sstatus,a0', extension `zicsr' required


vim +55 lib/strncpy_from_user.c

2922585b93294d David S. Miller 2012-05-24  19  
2922585b93294d David S. Miller 2012-05-24  20  /*
2922585b93294d David S. Miller 2012-05-24  21   * Do a strncpy, return length of string without final '\0'.
2922585b93294d David S. Miller 2012-05-24  22   * 'count' is the user-supplied count (return 'count' if we
2922585b93294d David S. Miller 2012-05-24  23   * hit it), 'max' is the address space maximum (and we return
2922585b93294d David S. Miller 2012-05-24  24   * -EFAULT if we hit it).
2922585b93294d David S. Miller 2012-05-24  25   */
189b396a2580d6 Peter Zijlstra  2019-04-24  26  static inline long do_strncpy_from_user(char *dst, const char __user *src,
189b396a2580d6 Peter Zijlstra  2019-04-24  27  					unsigned long count, unsigned long max)
2922585b93294d David S. Miller 2012-05-24  28  {
36126f8f2ed816 Linus Torvalds  2012-05-26  29  	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
189b396a2580d6 Peter Zijlstra  2019-04-24  30  	unsigned long res = 0;
2922585b93294d David S. Miller 2012-05-24  31  
2922585b93294d David S. Miller 2012-05-24  32  	if (IS_UNALIGNED(src, dst))
2922585b93294d David S. Miller 2012-05-24  33  		goto byte_at_a_time;
2922585b93294d David S. Miller 2012-05-24  34  
2922585b93294d David S. Miller 2012-05-24  35  	while (max >= sizeof(unsigned long)) {
36126f8f2ed816 Linus Torvalds  2012-05-26  36  		unsigned long c, data;
2922585b93294d David S. Miller 2012-05-24  37  
2922585b93294d David S. Miller 2012-05-24  38  		/* Fall back to byte-at-a-time if we get a page fault */
1bd4403d86a1c0 Linus Torvalds  2016-08-08 @39  		unsafe_get_user(c, (unsigned long __user *)(src+res), byte_at_a_time);
1bd4403d86a1c0 Linus Torvalds  2016-08-08  40  
2922585b93294d David S. Miller 2012-05-24  41  		*(unsigned long *)(dst+res) = c;
36126f8f2ed816 Linus Torvalds  2012-05-26  42  		if (has_zero(c, &data, &constants)) {
36126f8f2ed816 Linus Torvalds  2012-05-26  43  			data = prep_zero_mask(c, data, &constants);
36126f8f2ed816 Linus Torvalds  2012-05-26  44  			data = create_zero_mask(data);
36126f8f2ed816 Linus Torvalds  2012-05-26  45  			return res + find_zero(data);
2922585b93294d David S. Miller 2012-05-24  46  		}
2922585b93294d David S. Miller 2012-05-24  47  		res += sizeof(unsigned long);
2922585b93294d David S. Miller 2012-05-24  48  		max -= sizeof(unsigned long);
2922585b93294d David S. Miller 2012-05-24  49  	}
2922585b93294d David S. Miller 2012-05-24  50  
2922585b93294d David S. Miller 2012-05-24  51  byte_at_a_time:
2922585b93294d David S. Miller 2012-05-24  52  	while (max) {
2922585b93294d David S. Miller 2012-05-24  53  		char c;
2922585b93294d David S. Miller 2012-05-24  54  
1bd4403d86a1c0 Linus Torvalds  2016-08-08 @55  		unsafe_get_user(c,src+res, efault);
2922585b93294d David S. Miller 2012-05-24  56  		dst[res] = c;
2922585b93294d David S. Miller 2012-05-24  57  		if (!c)
2922585b93294d David S. Miller 2012-05-24  58  			return res;
2922585b93294d David S. Miller 2012-05-24  59  		res++;
2922585b93294d David S. Miller 2012-05-24  60  		max--;
2922585b93294d David S. Miller 2012-05-24  61  	}
2922585b93294d David S. Miller 2012-05-24  62  
2922585b93294d David S. Miller 2012-05-24  63  	/*
2922585b93294d David S. Miller 2012-05-24  64  	 * Uhhuh. We hit 'max'. But was that the user-specified maximum
2922585b93294d David S. Miller 2012-05-24  65  	 * too? If so, that's ok - we got as much as the user asked for.
2922585b93294d David S. Miller 2012-05-24  66  	 */
2922585b93294d David S. Miller 2012-05-24  67  	if (res >= count)
2922585b93294d David S. Miller 2012-05-24  68  		return res;
2922585b93294d David S. Miller 2012-05-24  69  
2922585b93294d David S. Miller 2012-05-24  70  	/*
2922585b93294d David S. Miller 2012-05-24  71  	 * Nope: we hit the address space limit, and we still had more
2922585b93294d David S. Miller 2012-05-24  72  	 * characters the caller would have wanted. That's an EFAULT.
2922585b93294d David S. Miller 2012-05-24  73  	 */
1bd4403d86a1c0 Linus Torvalds  2016-08-08  74  efault:
2922585b93294d David S. Miller 2012-05-24  75  	return -EFAULT;
2922585b93294d David S. Miller 2012-05-24  76  }
2922585b93294d David S. Miller 2012-05-24  77  

:::::: The code at line 55 was first introduced by commit
:::::: 1bd4403d86a1c06cb6cc9ac87664a0c9d3413d51 unsafe_[get|put]_user: change interface to use a error target label

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
