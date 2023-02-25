Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B3194
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677343359; x=1708879359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zn/aV6puRQ9jG+MRdNQWIdPHRcPdjqQVt4lVyY+6+TQ=;
  b=Bqu+mZkQsFiprMNCVyga7mguTxxZN25NdJ1EfPHtk2jiXnhysv9wO5FO
   XQcQIsCc7PQ/Umw4q2MWkreE6jJzyJueiaBsjw8vbe8hHNqYz1t7+N3qr
   FUGQxNt9PIaak6X0Ca5CWzMdw76KYkJ5MQIkYz1+CjBPujri+7U/aFHqY
   S6P9tgr/ru4PbLrk7Ksd5OuAu/WeaWS5IptgUDVmimA+G2iuKDuLDGFlJ
   2BOIuwNRST8QrPAS9Cu7YqAftKaZQOuWuvSa+FC7iDNbvMCZX17G/n2KR
   ARNNKs1+8ER/z+eJYjpEmN/H724zrkCSRIeE5tRQVHqtdo9j5FkNH6SIX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="396189222"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="396189222"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 08:42:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="623057331"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="623057331"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Feb 2023 08:42:37 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVxd6-0003JH-2g;
	Sat, 25 Feb 2023 16:42:36 +0000
Date: Sun, 26 Feb 2023 00:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 1/2] lib/usercopy.c:75: Error: unrecognized opcode `csrs sstatus,s8'
Message-ID: <202302260023.RXGMR0q8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   271575bc1159139f841635982e75c891e07ff30a
commit: 6a1e36af9d0e008f78f324581e5f1cb5c4393aee [1/2] BACKPORT: lib: introduce copy_struct_from_user() helper
config: riscv-buildonly-randconfig-r003-20230222 (https://download.01.org/0day-ci/archive/20230226/202302260023.RXGMR0q8-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/6a1e36af9d0e008f78f324581e5f1cb5c4393aee
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-stable
        git checkout 6a1e36af9d0e008f78f324581e5f1cb5c4393aee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302260023.RXGMR0q8-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                          ^~~~~~~~~~~~~~~~
   include/linux/uaccess.h:368:47: note: in expansion of macro 'unlikely'
     368 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                               ^~~~~~~~
   lib/usercopy.c:75:17: note: in expansion of macro 'unsafe_get_user'
      75 |                 unsafe_get_user(val, (unsigned long __user *) from, err_fault);
         |                 ^~~~~~~~~~~~~~~
   include/linux/compiler.h:61:31: warning: ignoring attribute 'section ("_ftrace_branch")' because it conflicts with previous 'section ("_ftrace_annotated_branch")' [-Wattributes]
      61 |                 static struct ftrace_branch_data                        \
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:49: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                                 ^~~~
   include/linux/uaccess.h:368:43: note: in expansion of macro 'if'
     368 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                           ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/uaccess.h:368:47: note: in expansion of macro 'unlikely'
     368 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                               ^~~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/compiler.h:398:17: note: in expansion of macro 'if'
     398 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler.h:406:9: note: in expansion of macro '__compiletime_assert'
     406 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:418:9: note: in expansion of macro '_compiletime_assert'
     418 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:79:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:235:17: note: in expansion of macro 'BUILD_BUG'
     235 |                 BUILD_BUG();                                    \
         |                 ^~~~~~~~~
   include/linux/uaccess.h:368:56: note: in expansion of macro '__get_user'
     368 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                                        ^~~~~~~~~~
   lib/usercopy.c:75:17: note: in expansion of macro 'unsafe_get_user'
      75 |                 unsafe_get_user(val, (unsigned long __user *) from, err_fault);
         |                 ^~~~~~~~~~~~~~~
   include/linux/compiler.h:28:33: note: previous declaration here
      28 |                                 ______f = {                             \
         |                                 ^~~~~~~
   include/linux/compiler.h:58:49: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                                 ^~~~
   include/linux/uaccess.h:368:43: note: in expansion of macro 'if'
     368 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                           ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/uaccess.h:368:47: note: in expansion of macro 'unlikely'
     368 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                               ^~~~~~~~
   lib/usercopy.c:75:17: note: in expansion of macro 'unsafe_get_user'
      75 |                 unsafe_get_user(val, (unsigned long __user *) from, err_fault);
         |                 ^~~~~~~~~~~~~~~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/uaccess.h:368:43: note: in expansion of macro 'if'
     368 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                           ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/uaccess.h:368:47: note: in expansion of macro 'unlikely'
     368 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                               ^~~~~~~~
   lib/usercopy.c:75:17: note: in expansion of macro 'unsafe_get_user'
      75 |                 unsafe_get_user(val, (unsigned long __user *) from, err_fault);
         |                 ^~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/uaccess.h:368:43: note: in expansion of macro 'if'
     368 | #define unsafe_get_user(x, ptr, err) do { if (unlikely(__get_user(x, ptr))) goto err; } while (0)
         |                                           ^~
   lib/usercopy.c:75:17: note: in expansion of macro 'unsafe_get_user'
      75 |                 unsafe_get_user(val, (unsigned long __user *) from, err_fault);
         |                 ^~~~~~~~~~~~~~~
   lib/usercopy.c: Assembler messages:
   lib/usercopy.c:64: Error: unrecognized opcode `csrs sstatus,a5'
   lib/usercopy.c:64: Error: unrecognized opcode `csrc sstatus,a5'
>> lib/usercopy.c:75: Error: unrecognized opcode `csrs sstatus,s8'
>> lib/usercopy.c:75: Error: unrecognized opcode `csrc sstatus,s8'


vim +75 lib/usercopy.c

    35	
    36	/**
    37	 * check_zeroed_user: check if a userspace buffer only contains zero bytes
    38	 * @from: Source address, in userspace.
    39	 * @size: Size of buffer.
    40	 *
    41	 * This is effectively shorthand for "memchr_inv(from, 0, size) == NULL" for
    42	 * userspace addresses (and is more efficient because we don't care where the
    43	 * first non-zero byte is).
    44	 *
    45	 * Returns:
    46	 *  * 0: There were non-zero bytes present in the buffer.
    47	 *  * 1: The buffer was full of zero bytes.
    48	 *  * -EFAULT: access to userspace failed.
    49	 */
    50	int check_zeroed_user(const void __user *from, size_t size)
    51	{
    52		unsigned long val;
    53		uintptr_t align = (uintptr_t) from % sizeof(unsigned long);
    54	
    55		if (unlikely(size == 0))
    56			return 1;
    57	
    58		from -= align;
    59		size += align;
    60	
    61		if (!user_access_begin(VERIFY_READ, from, size))
    62			return -EFAULT;
    63	
    64		unsafe_get_user(val, (unsigned long __user *) from, err_fault);
    65		if (align)
    66			val &= ~aligned_byte_mask(align);
    67	
    68		while (size > sizeof(unsigned long)) {
    69			if (unlikely(val))
    70				goto done;
    71	
    72			from += sizeof(unsigned long);
    73			size -= sizeof(unsigned long);
    74	
  > 75			unsafe_get_user(val, (unsigned long __user *) from, err_fault);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
