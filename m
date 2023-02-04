Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF02586
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675524950; x=1707060950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pFNfNKudiXrHpLiIw+aNvsIB4aT2LvDeE1ZWZNvwCqw=;
  b=mukgvL8KCtohMKOtqYM+vjMCx9jtAPtwX6n6cfRhr2k6dQX5SCPprkVo
   D6m9ys8rfhPnzTIt7iXrkY4xQzuaU0PKNmHU524L74VG/3JIEQAX7JKeE
   ak0It7QgfH8YXFVbnUuDiFkrnfraI6AHjHSnl4rCiC51oIXphDSOAuYwk
   GHrfBeixQGUJ2QAdozmKJ+lFgEY6WaSuxCzjTKA9jbyeFjmFQKYWINsKw
   XTj6cqsS0+hMjphVR6/juqA43X8zbBbbl807H6EXj7tGIxwtWGdpLITvg
   V32pyIseEpEI9UnG7yUg6DJv6Fsp2G2mVmE8yAwuoSBkfKQRumDhlJvXB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393548546"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="393548546"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 07:35:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698395273"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="698395273"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2023 07:35:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOKZv-0001OC-1G;
	Sat, 04 Feb 2023 15:35:47 +0000
Date: Sat, 4 Feb 2023 23:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: [stable:linux-4.19.y 2192/9999] lib/strnlen_user.c:57: Error:
 unrecognized opcode `csrs sstatus,a7'
Message-ID: <202302042352.2mntkiTg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   b17faf2c4e88ac0deb894f068bda67ace57e9c0a
commit: e18590b3e242638e873a61d299abf8a9df446236 [2192/9999] lib: Reduce user_access_begin() boundaries in strncpy_from_user() and strnlen_user()
config: riscv-randconfig-c031-20230202 (https://download.01.org/0day-ci/archive/20230204/202302042352.2mntkiTg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=e18590b3e242638e873a61d299abf8a9df446236
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout e18590b3e242638e873a61d299abf8a9df446236
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   lib/strnlen_user.c: Assembler messages:
   lib/strnlen_user.c:42: Error: unrecognized opcode `csrs sstatus,a2'
   lib/strnlen_user.c:42: Error: unrecognized opcode `csrc sstatus,a2'
>> lib/strnlen_user.c:57: Error: unrecognized opcode `csrs sstatus,a7'
>> lib/strnlen_user.c:57: Error: unrecognized opcode `csrc sstatus,a7'


vim +57 lib/strnlen_user.c

a08c5356a3aaf6 Linus Torvalds 2012-05-26  14  
a08c5356a3aaf6 Linus Torvalds 2012-05-26  15  /*
a08c5356a3aaf6 Linus Torvalds 2012-05-26  16   * Do a strnlen, return length of string *with* final '\0'.
a08c5356a3aaf6 Linus Torvalds 2012-05-26  17   * 'count' is the user-supplied count, while 'max' is the
a08c5356a3aaf6 Linus Torvalds 2012-05-26  18   * address space maximum.
a08c5356a3aaf6 Linus Torvalds 2012-05-26  19   *
a08c5356a3aaf6 Linus Torvalds 2012-05-26  20   * Return 0 for exceptions (which includes hitting the address
a08c5356a3aaf6 Linus Torvalds 2012-05-26  21   * space maximum), or 'count+1' if hitting the user-supplied
a08c5356a3aaf6 Linus Torvalds 2012-05-26  22   * maximum count.
a08c5356a3aaf6 Linus Torvalds 2012-05-26  23   *
a08c5356a3aaf6 Linus Torvalds 2012-05-26  24   * NOTE! We can sometimes overshoot the user-supplied maximum
a08c5356a3aaf6 Linus Torvalds 2012-05-26  25   * if it fits in a aligned 'long'. The caller needs to check
a08c5356a3aaf6 Linus Torvalds 2012-05-26  26   * the return value against "> max".
a08c5356a3aaf6 Linus Torvalds 2012-05-26  27   */
a08c5356a3aaf6 Linus Torvalds 2012-05-26  28  static inline long do_strnlen_user(const char __user *src, unsigned long count, unsigned long max)
a08c5356a3aaf6 Linus Torvalds 2012-05-26  29  {
a08c5356a3aaf6 Linus Torvalds 2012-05-26  30  	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
189b396a2580d6 Peter Zijlstra 2019-04-24  31  	unsigned long align, res = 0;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  32  	unsigned long c;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  33  
a08c5356a3aaf6 Linus Torvalds 2012-05-26  34  	/*
a08c5356a3aaf6 Linus Torvalds 2012-05-26  35  	 * Do everything aligned. But that means that we
a08c5356a3aaf6 Linus Torvalds 2012-05-26  36  	 * need to also expand the maximum..
a08c5356a3aaf6 Linus Torvalds 2012-05-26  37  	 */
189b396a2580d6 Peter Zijlstra 2019-04-24  38  	align = (sizeof(unsigned long) - 1) & (unsigned long)src;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  39  	src -= align;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  40  	max += align;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  41  
1bd4403d86a1c0 Linus Torvalds 2016-08-08  42  	unsafe_get_user(c, (unsigned long __user *)src, efault);
a08c5356a3aaf6 Linus Torvalds 2012-05-26  43  	c |= aligned_byte_mask(align);
a08c5356a3aaf6 Linus Torvalds 2012-05-26  44  
a08c5356a3aaf6 Linus Torvalds 2012-05-26  45  	for (;;) {
a08c5356a3aaf6 Linus Torvalds 2012-05-26  46  		unsigned long data;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  47  		if (has_zero(c, &data, &constants)) {
a08c5356a3aaf6 Linus Torvalds 2012-05-26  48  			data = prep_zero_mask(c, data, &constants);
a08c5356a3aaf6 Linus Torvalds 2012-05-26  49  			data = create_zero_mask(data);
a08c5356a3aaf6 Linus Torvalds 2012-05-26  50  			return res + find_zero(data) + 1 - align;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  51  		}
a08c5356a3aaf6 Linus Torvalds 2012-05-26  52  		res += sizeof(unsigned long);
f18c34e483ff6b Jan Kara       2015-06-02  53  		/* We already handled 'unsigned long' bytes. Did we do it all ? */
f18c34e483ff6b Jan Kara       2015-06-02  54  		if (unlikely(max <= sizeof(unsigned long)))
a08c5356a3aaf6 Linus Torvalds 2012-05-26  55  			break;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  56  		max -= sizeof(unsigned long);
1bd4403d86a1c0 Linus Torvalds 2016-08-08 @57  		unsafe_get_user(c, (unsigned long __user *)(src+res), efault);
a08c5356a3aaf6 Linus Torvalds 2012-05-26  58  	}
a08c5356a3aaf6 Linus Torvalds 2012-05-26  59  	res -= align;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  60  
a08c5356a3aaf6 Linus Torvalds 2012-05-26  61  	/*
a08c5356a3aaf6 Linus Torvalds 2012-05-26  62  	 * Uhhuh. We hit 'max'. But was that the user-specified maximum
a08c5356a3aaf6 Linus Torvalds 2012-05-26  63  	 * too? If so, return the marker for "too long".
a08c5356a3aaf6 Linus Torvalds 2012-05-26  64  	 */
a08c5356a3aaf6 Linus Torvalds 2012-05-26  65  	if (res >= count)
a08c5356a3aaf6 Linus Torvalds 2012-05-26  66  		return count+1;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  67  
a08c5356a3aaf6 Linus Torvalds 2012-05-26  68  	/*
a08c5356a3aaf6 Linus Torvalds 2012-05-26  69  	 * Nope: we hit the address space limit, and we still had more
a08c5356a3aaf6 Linus Torvalds 2012-05-26  70  	 * characters the caller would have wanted. That's 0.
a08c5356a3aaf6 Linus Torvalds 2012-05-26  71  	 */
1bd4403d86a1c0 Linus Torvalds 2016-08-08  72  efault:
a08c5356a3aaf6 Linus Torvalds 2012-05-26  73  	return 0;
a08c5356a3aaf6 Linus Torvalds 2012-05-26  74  }
a08c5356a3aaf6 Linus Torvalds 2012-05-26  75  

:::::: The code at line 57 was first introduced by commit
:::::: 1bd4403d86a1c06cb6cc9ac87664a0c9d3413d51 unsafe_[get|put]_user: change interface to use a error target label

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
