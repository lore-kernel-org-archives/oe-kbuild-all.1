Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7A7F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 01:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675732477; x=1707268477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LFhJSt1fx/SFjp9VD+48PyKO79pofRe4HT47t7RgnZA=;
  b=fOYRcL64F4V2qcEaJaA2VkWqwD+Jfmvd4z2w7kRTZ9fnEm9EDeOMsXwC
   ++pRcm0fK+BlmQhfeAom6JzCwkTt0qzl0usVSujDzn2fLMd2x6XTrXkPa
   HGbyq7B9kDOmMrybcr0W/wYOfDj406CfmMkbtaC9lYynEx+DItLc9oHqN
   /GAeecrwZiuCpzvk7cDjAVi1PiZ0yIOEW+zGO1iVQIVFOhDmS6f5uebMU
   F3dURQbptVBIimdGVSH2/cEE3Hw9l8VlZWaIpawkybVBmxFm5XbeoHbSj
   YyyKaX4aAvySRp1w5Hqzw811FQ9chghpr5lZtuKDZaF4bIAVF3/fGTCL1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="330658098"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="330658098"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 17:14:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="735368624"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="735368624"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2023 17:14:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPCYz-0002vU-38;
	Tue, 07 Feb 2023 01:14:25 +0000
Date: Tue, 7 Feb 2023 09:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: [stable:linux-4.19.y 2192/9999] lib/strncpy_from_user.c:39: Error:
 unrecognized opcode `csrs sstatus,s9'
Message-ID: <202302070926.bm6KpsnS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   53b696f0584acce2e90db69272a2a11aab138370
commit: e18590b3e242638e873a61d299abf8a9df446236 [2192/9999] lib: Reduce user_access_begin() boundaries in strncpy_from_user() and strnlen_user()
config: riscv-randconfig-r001-20230206 (https://download.01.org/0day-ci/archive/20230207/202302070926.bm6KpsnS-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
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

      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/uaccess.h:272:47: note: in expansion of macro 'unlikely'
     272 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                               ^~~~~~~~
   lib/strncpy_from_user.c:55:17: note: in expansion of macro 'unsafe_get_user'
      55 |                 unsafe_get_user(c,src+res, efault);
         |                 ^~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/uaccess.h:272:43: note: in expansion of macro 'if'
     272 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                           ^~
   lib/strncpy_from_user.c:55:17: note: in expansion of macro 'unsafe_get_user'
      55 |                 unsafe_get_user(c,src+res, efault);
         |                 ^~~~~~~~~~~~~~~
   lib/strncpy_from_user.c: In function 'strncpy_from_user':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   lib/strncpy_from_user.c:100:9: note: in expansion of macro 'if'
     100 |         if (unlikely(count <= 0))
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   lib/strncpy_from_user.c:100:13: note: in expansion of macro 'unlikely'
     100 |         if (unlikely(count <= 0))
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   lib/strncpy_from_user.c:100:9: note: in expansion of macro 'if'
     100 |         if (unlikely(count <= 0))
         |         ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   lib/strncpy_from_user.c:105:9: note: in expansion of macro 'if'
     105 |         if (likely(src_addr < max_addr)) {
         |         ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   lib/strncpy_from_user.c:105:13: note: in expansion of macro 'likely'
     105 |         if (likely(src_addr < max_addr)) {
         |             ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   lib/strncpy_from_user.c:105:9: note: in expansion of macro 'if'
     105 |         if (likely(src_addr < max_addr)) {
         |         ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   lib/strncpy_from_user.c:118:17: note: in expansion of macro 'if'
     118 |                 if (user_access_begin(VERIFY_READ, src, max)) {
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:81:9: note: in expansion of macro 'likely'
      81 |         likely(__access_ok((unsigned long __force)(addr), (size)));     \
         |         ^~~~~~
   include/linux/uaccess.h:270:43: note: in expansion of macro 'access_ok'
     270 | #define user_access_begin(type, ptr, len) access_ok(type, ptr, len)
         |                                           ^~~~~~~~~
   lib/strncpy_from_user.c:118:21: note: in expansion of macro 'user_access_begin'
     118 |                 if (user_access_begin(VERIFY_READ, src, max)) {
         |                     ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   lib/strncpy_from_user.c:118:17: note: in expansion of macro 'if'
     118 |                 if (user_access_begin(VERIFY_READ, src, max)) {
         |                 ^~
   lib/strncpy_from_user.c: Assembler messages:
>> lib/strncpy_from_user.c:39: Error: unrecognized opcode `csrs sstatus,s9'
>> lib/strncpy_from_user.c:39: Error: unrecognized opcode `csrc sstatus,s9'
   lib/strncpy_from_user.c:55: Error: unrecognized opcode `csrs sstatus,s11'
   lib/strncpy_from_user.c:55: Error: unrecognized opcode `csrc sstatus,s11'


vim +39 lib/strncpy_from_user.c

2922585b93294d David S. Miller  2012-05-24   19  
2922585b93294d David S. Miller  2012-05-24   20  /*
2922585b93294d David S. Miller  2012-05-24   21   * Do a strncpy, return length of string without final '\0'.
2922585b93294d David S. Miller  2012-05-24   22   * 'count' is the user-supplied count (return 'count' if we
2922585b93294d David S. Miller  2012-05-24   23   * hit it), 'max' is the address space maximum (and we return
2922585b93294d David S. Miller  2012-05-24   24   * -EFAULT if we hit it).
2922585b93294d David S. Miller  2012-05-24   25   */
189b396a2580d6 Peter Zijlstra   2019-04-24   26  static inline long do_strncpy_from_user(char *dst, const char __user *src,
189b396a2580d6 Peter Zijlstra   2019-04-24   27  					unsigned long count, unsigned long max)
2922585b93294d David S. Miller  2012-05-24   28  {
36126f8f2ed816 Linus Torvalds   2012-05-26   29  	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
189b396a2580d6 Peter Zijlstra   2019-04-24   30  	unsigned long res = 0;
2922585b93294d David S. Miller  2012-05-24   31  
2922585b93294d David S. Miller  2012-05-24   32  	if (IS_UNALIGNED(src, dst))
2922585b93294d David S. Miller  2012-05-24   33  		goto byte_at_a_time;
2922585b93294d David S. Miller  2012-05-24   34  
2922585b93294d David S. Miller  2012-05-24   35  	while (max >= sizeof(unsigned long)) {
36126f8f2ed816 Linus Torvalds   2012-05-26   36  		unsigned long c, data;
2922585b93294d David S. Miller  2012-05-24   37  
2922585b93294d David S. Miller  2012-05-24   38  		/* Fall back to byte-at-a-time if we get a page fault */
1bd4403d86a1c0 Linus Torvalds   2016-08-08  @39  		unsafe_get_user(c, (unsigned long __user *)(src+res), byte_at_a_time);
1bd4403d86a1c0 Linus Torvalds   2016-08-08   40  
2922585b93294d David S. Miller  2012-05-24   41  		*(unsigned long *)(dst+res) = c;
36126f8f2ed816 Linus Torvalds   2012-05-26   42  		if (has_zero(c, &data, &constants)) {
36126f8f2ed816 Linus Torvalds   2012-05-26   43  			data = prep_zero_mask(c, data, &constants);
36126f8f2ed816 Linus Torvalds   2012-05-26   44  			data = create_zero_mask(data);
36126f8f2ed816 Linus Torvalds   2012-05-26   45  			return res + find_zero(data);
2922585b93294d David S. Miller  2012-05-24   46  		}
2922585b93294d David S. Miller  2012-05-24   47  		res += sizeof(unsigned long);
2922585b93294d David S. Miller  2012-05-24   48  		max -= sizeof(unsigned long);
2922585b93294d David S. Miller  2012-05-24   49  	}
2922585b93294d David S. Miller  2012-05-24   50  
2922585b93294d David S. Miller  2012-05-24   51  byte_at_a_time:
2922585b93294d David S. Miller  2012-05-24   52  	while (max) {
2922585b93294d David S. Miller  2012-05-24   53  		char c;
2922585b93294d David S. Miller  2012-05-24   54  
1bd4403d86a1c0 Linus Torvalds   2016-08-08   55  		unsafe_get_user(c,src+res, efault);
2922585b93294d David S. Miller  2012-05-24   56  		dst[res] = c;
2922585b93294d David S. Miller  2012-05-24   57  		if (!c)
2922585b93294d David S. Miller  2012-05-24   58  			return res;
2922585b93294d David S. Miller  2012-05-24   59  		res++;
2922585b93294d David S. Miller  2012-05-24   60  		max--;
2922585b93294d David S. Miller  2012-05-24   61  	}
2922585b93294d David S. Miller  2012-05-24   62  
2922585b93294d David S. Miller  2012-05-24   63  	/*
2922585b93294d David S. Miller  2012-05-24   64  	 * Uhhuh. We hit 'max'. But was that the user-specified maximum
2922585b93294d David S. Miller  2012-05-24   65  	 * too? If so, that's ok - we got as much as the user asked for.
2922585b93294d David S. Miller  2012-05-24   66  	 */
2922585b93294d David S. Miller  2012-05-24   67  	if (res >= count)
2922585b93294d David S. Miller  2012-05-24   68  		return res;
2922585b93294d David S. Miller  2012-05-24   69  
2922585b93294d David S. Miller  2012-05-24   70  	/*
2922585b93294d David S. Miller  2012-05-24   71  	 * Nope: we hit the address space limit, and we still had more
2922585b93294d David S. Miller  2012-05-24   72  	 * characters the caller would have wanted. That's an EFAULT.
2922585b93294d David S. Miller  2012-05-24   73  	 */
1bd4403d86a1c0 Linus Torvalds   2016-08-08   74  efault:
2922585b93294d David S. Miller  2012-05-24   75  	return -EFAULT;
2922585b93294d David S. Miller  2012-05-24   76  }
2922585b93294d David S. Miller  2012-05-24   77  
2922585b93294d David S. Miller  2012-05-24   78  /**
2922585b93294d David S. Miller  2012-05-24   79   * strncpy_from_user: - Copy a NUL terminated string from userspace.
2922585b93294d David S. Miller  2012-05-24   80   * @dst:   Destination address, in kernel space.  This buffer must be at
2922585b93294d David S. Miller  2012-05-24   81   *         least @count bytes long.
2922585b93294d David S. Miller  2012-05-24   82   * @src:   Source address, in user space.
2922585b93294d David S. Miller  2012-05-24   83   * @count: Maximum number of bytes to copy, including the trailing NUL.
2922585b93294d David S. Miller  2012-05-24   84   *
2922585b93294d David S. Miller  2012-05-24   85   * Copies a NUL-terminated string from userspace to kernel space.
2922585b93294d David S. Miller  2012-05-24   86   *
2922585b93294d David S. Miller  2012-05-24   87   * On success, returns the length of the string (not including the trailing
2922585b93294d David S. Miller  2012-05-24   88   * NUL).
2922585b93294d David S. Miller  2012-05-24   89   *
2922585b93294d David S. Miller  2012-05-24   90   * If access to userspace fails, returns -EFAULT (some data may have been
2922585b93294d David S. Miller  2012-05-24   91   * copied).
2922585b93294d David S. Miller  2012-05-24   92   *
2922585b93294d David S. Miller  2012-05-24   93   * If @count is smaller than the length of the string, copies @count bytes
2922585b93294d David S. Miller  2012-05-24   94   * and returns @count.
2922585b93294d David S. Miller  2012-05-24   95   */
2922585b93294d David S. Miller  2012-05-24   96  long strncpy_from_user(char *dst, const char __user *src, long count)
2922585b93294d David S. Miller  2012-05-24   97  {
2922585b93294d David S. Miller  2012-05-24   98  	unsigned long max_addr, src_addr;
2922585b93294d David S. Miller  2012-05-24   99  
2922585b93294d David S. Miller  2012-05-24  100  	if (unlikely(count <= 0))
2922585b93294d David S. Miller  2012-05-24  101  		return 0;
2922585b93294d David S. Miller  2012-05-24  102  
2922585b93294d David S. Miller  2012-05-24  103  	max_addr = user_addr_max();
2922585b93294d David S. Miller  2012-05-24  104  	src_addr = (unsigned long)src;
2922585b93294d David S. Miller  2012-05-24  105  	if (likely(src_addr < max_addr)) {
2922585b93294d David S. Miller  2012-05-24  106  		unsigned long max = max_addr - src_addr;
9fd4470ff4974c Linus Torvalds   2015-12-17  107  		long retval;
9fd4470ff4974c Linus Torvalds   2015-12-17  108  
e18590b3e24263 Christophe Leroy 2020-01-23  109  		/*
e18590b3e24263 Christophe Leroy 2020-01-23  110  		 * Truncate 'max' to the user-specified limit, so that
e18590b3e24263 Christophe Leroy 2020-01-23  111  		 * we only have one limit we need to check in the loop
e18590b3e24263 Christophe Leroy 2020-01-23  112  		 */
e18590b3e24263 Christophe Leroy 2020-01-23  113  		if (max > count)
e18590b3e24263 Christophe Leroy 2020-01-23  114  			max = count;
e18590b3e24263 Christophe Leroy 2020-01-23  115  
1771c6e1a567ea Andrey Ryabinin  2016-05-20  116  		kasan_check_write(dst, count);
bf90e56e467ed5 Mark Rutland     2016-10-11  117  		check_object_size(dst, count, false);
216284c4a126b2 Linus Torvalds   2019-01-04 @118  		if (user_access_begin(VERIFY_READ, src, max)) {

:::::: The code at line 39 was first introduced by commit
:::::: 1bd4403d86a1c06cb6cc9ac87664a0c9d3413d51 unsafe_[get|put]_user: change interface to use a error target label

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
