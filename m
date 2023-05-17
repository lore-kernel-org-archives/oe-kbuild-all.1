Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8641C26
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 May 2023 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684334427; x=1715870427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+FmyJTVx9/7qyj3mQH8rmehUHLtl4a6td3yJPO3NCx4=;
  b=UbioVa6Bsyl2Hd9ha3gDhy0NWbHzjnW9nQnPGzOj5rUN/WBEm7uXNcwm
   ysB5gE9ISxoZ4TvOpbdcFL4Dsu+bn+p3mFSwzRlX6vt43qj1hSlCA7js+
   hr3YG4wLS6Yj1Q1JkYkPXvgnSSD6xlcj7dwsKkxe+CrihrX78lQ5BfFFb
   LcrOSIDeviCRAS/2y0W0pk5/tk2qFmPCBxY130ZJb6cjdPulbQxcs0YzZ
   BenO95vD99U6NKz4zTOXvywLPS1+UecQO6CGOcYBvTbbViydiBkeT5bMA
   m1KxWsChw9lgH1ygBx7fTDwCnFI5b5rN9Uvn15HJ5dUXB3htv9jPnn4pQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="351798704"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="351798704"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 07:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="679306756"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="679306756"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 May 2023 07:40:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzIKF-0008z8-2t;
	Wed, 17 May 2023 14:40:23 +0000
Date: Wed, 17 May 2023 22:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:missing-prototypes 56/131]
 arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types
 for 'sys_io_setup'; have 'long int(const struct pt_regs *)'
Message-ID: <202305172218.OPDclLag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="aNWNWuzrTMGEG40H"
Content-Disposition: inline


--aNWNWuzrTMGEG40H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git missing-prototypes
head:   e516971c38440e7d43a134499af3ac283cd4692e
commit: 48ebcdc6b1a90108f6994aa9ae58e2b25c3a0c29 [56/131] syscalls: always include syscall prototypes
config: powerpc-allnoconfig
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=48ebcdc6b1a90108f6994aa9ae58e2b25c3a0c29
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground missing-prototypes
        git checkout 48ebcdc6b1a90108f6994aa9ae58e2b25c3a0c29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ block/ drivers/char/ fs/ io_uring/ kernel/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305172218.OPDclLag-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/syscalls.h:98,
                    from block/ioprio.c:29:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_ioprio_set'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   block/ioprio.c:68:1: note: in expansion of macro 'SYSCALL_DEFINE3'
      68 | SYSCALL_DEFINE3(ioprio_set, int, which, int, who, int, ioprio)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:416:17: note: previous declaration of 'sys_ioprio_set' with type 'long int(int,  int,  int)'
     416 | asmlinkage long sys_ioprio_set(int which, int who, int ioprio);
         |                 ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_ioprio_set'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   block/ioprio.c:68:1: note: in expansion of macro 'SYSCALL_DEFINE3'
      68 | SYSCALL_DEFINE3(ioprio_set, int, which, int, who, int, ioprio)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:416:17: note: previous declaration of 'sys_ioprio_set' with type 'long int(int,  int,  int)'
     416 | asmlinkage long sys_ioprio_set(int which, int who, int ioprio);
         |                 ^~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_ioprio_get'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   block/ioprio.c:209:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     209 | SYSCALL_DEFINE2(ioprio_get, int, which, int, who)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:417:17: note: previous declaration of 'sys_ioprio_get' with type 'long int(int,  int)'
     417 | asmlinkage long sys_ioprio_get(int which, int who);
         |                 ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_ioprio_get'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   block/ioprio.c:209:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     209 | SYSCALL_DEFINE2(ioprio_get, int, which, int, who)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:417:17: note: previous declaration of 'sys_ioprio_get' with type 'long int(int,  int)'
     417 | asmlinkage long sys_ioprio_get(int which, int who);
         |                 ^~~~~~~~~~~~~~
--
   In file included from include/linux/syscalls.h:98,
                    from fs/open.c:27:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_truncate'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:145:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     145 | SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:452:17: note: previous declaration of 'sys_truncate' with type 'long int(const char *, long int)'
     452 | asmlinkage long sys_truncate(const char __user *path, long length);
         |                 ^~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_truncate'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:145:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     145 | SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:452:17: note: previous declaration of 'sys_truncate' with type 'long int(const char *, long int)'
     452 | asmlinkage long sys_truncate(const char __user *path, long length);
         |                 ^~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_ftruncate'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:203:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     203 | SYSCALL_DEFINE2(ftruncate, unsigned int, fd, unsigned long, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:453:17: note: previous declaration of 'sys_ftruncate' with type 'long int(unsigned int,  long unsigned int)'
     453 | asmlinkage long sys_ftruncate(unsigned int fd, unsigned long length);
         |                 ^~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_ftruncate'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:203:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     203 | SYSCALL_DEFINE2(ftruncate, unsigned int, fd, unsigned long, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:453:17: note: previous declaration of 'sys_ftruncate' with type 'long int(unsigned int,  long unsigned int)'
     453 | asmlinkage long sys_ftruncate(unsigned int fd, unsigned long length);
         |                 ^~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_truncate64'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:217:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     217 | SYSCALL_DEFINE2(truncate64, const char __user *, path, loff_t, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:455:17: note: previous declaration of 'sys_truncate64' with type 'long int(const char *, loff_t)' {aka 'long int(const char *, long long int)'}
     455 | asmlinkage long sys_truncate64(const char __user *path, loff_t length);
         |                 ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_truncate64'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:217:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     217 | SYSCALL_DEFINE2(truncate64, const char __user *, path, loff_t, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:455:17: note: previous declaration of 'sys_truncate64' with type 'long int(const char *, loff_t)' {aka 'long int(const char *, long long int)'}
     455 | asmlinkage long sys_truncate64(const char __user *path, loff_t length);
         |                 ^~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_ftruncate64'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:222:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     222 | SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:456:17: note: previous declaration of 'sys_ftruncate64' with type 'long int(unsigned int,  loff_t)' {aka 'long int(unsigned int,  long long int)'}
     456 | asmlinkage long sys_ftruncate64(unsigned int fd, loff_t length);
         |                 ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_ftruncate64'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:222:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     222 | SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:456:17: note: previous declaration of 'sys_ftruncate64' with type 'long int(unsigned int,  loff_t)' {aka 'long int(unsigned int,  long long int)'}
     456 | asmlinkage long sys_ftruncate64(unsigned int fd, loff_t length);
         |                 ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fallocate'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:353:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     353 | SYSCALL_DEFINE4(fallocate, int, fd, int, mode, loff_t, offset, loff_t, len)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:458:17: note: previous declaration of 'sys_fallocate' with type 'long int(int,  int,  loff_t,  loff_t)' {aka 'long int(int,  int,  long long int,  long long int)'}
     458 | asmlinkage long sys_fallocate(int fd, int mode, loff_t offset, loff_t len);
         |                 ^~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fallocate'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:353:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     353 | SYSCALL_DEFINE4(fallocate, int, fd, int, mode, loff_t, offset, loff_t, len)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:458:17: note: previous declaration of 'sys_fallocate' with type 'long int(int,  int,  loff_t,  loff_t)' {aka 'long int(int,  int,  long long int,  long long int)'}
     458 | asmlinkage long sys_fallocate(int fd, int mode, loff_t offset, loff_t len);
         |                 ^~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_faccessat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:529:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     529 | SYSCALL_DEFINE3(faccessat, int, dfd, const char __user *, filename, int, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:459:17: note: previous declaration of 'sys_faccessat' with type 'long int(int,  const char *, int)'
     459 | asmlinkage long sys_faccessat(int dfd, const char __user *filename, int mode);
         |                 ^~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_faccessat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:529:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     529 | SYSCALL_DEFINE3(faccessat, int, dfd, const char __user *, filename, int, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:459:17: note: previous declaration of 'sys_faccessat' with type 'long int(int,  const char *, int)'
     459 | asmlinkage long sys_faccessat(int dfd, const char __user *filename, int mode);
         |                 ^~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_faccessat2'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:534:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     534 | SYSCALL_DEFINE4(faccessat2, int, dfd, const char __user *, filename, int, mode,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:460:17: note: previous declaration of 'sys_faccessat2' with type 'long int(int,  const char *, int,  int)'
     460 | asmlinkage long sys_faccessat2(int dfd, const char __user *filename, int mode,
         |                 ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_faccessat2'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:534:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     534 | SYSCALL_DEFINE4(faccessat2, int, dfd, const char __user *, filename, int, mode,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:460:17: note: previous declaration of 'sys_faccessat2' with type 'long int(int,  const char *, int,  int)'
     460 | asmlinkage long sys_faccessat2(int dfd, const char __user *filename, int mode,
         |                 ^~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_access'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:540:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     540 | SYSCALL_DEFINE2(access, const char __user *, filename, int, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1105:17: note: previous declaration of 'sys_access' with type 'long int(const char *, int)'
    1105 | asmlinkage long sys_access(const char __user *filename, int mode);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_access'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:540:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     540 | SYSCALL_DEFINE2(access, const char __user *, filename, int, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1105:17: note: previous declaration of 'sys_access' with type 'long int(const char *, int)'
    1105 | asmlinkage long sys_access(const char __user *filename, int mode);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_chdir'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:217:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     217 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:545:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     545 | SYSCALL_DEFINE1(chdir, const char __user *, filename)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:462:17: note: previous declaration of 'sys_chdir' with type 'long int(const char *)'
     462 | asmlinkage long sys_chdir(const char __user *filename);
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_chdir'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:217:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     217 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:545:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     545 | SYSCALL_DEFINE1(chdir, const char __user *, filename)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:462:17: note: previous declaration of 'sys_chdir' with type 'long int(const char *)'
     462 | asmlinkage long sys_chdir(const char __user *filename);
         |                 ^~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchdir'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:217:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     217 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:571:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     571 | SYSCALL_DEFINE1(fchdir, unsigned int, fd)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:463:17: note: previous declaration of 'sys_fchdir' with type 'long int(unsigned int)'
     463 | asmlinkage long sys_fchdir(unsigned int fd);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchdir'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:217:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     217 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:571:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     571 | SYSCALL_DEFINE1(fchdir, unsigned int, fd)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:463:17: note: previous declaration of 'sys_fchdir' with type 'long int(unsigned int)'
     463 | asmlinkage long sys_fchdir(unsigned int fd);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_chroot'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:217:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     217 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:593:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     593 | SYSCALL_DEFINE1(chroot, const char __user *, filename)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:464:17: note: previous declaration of 'sys_chroot' with type 'long int(const char *)'
     464 | asmlinkage long sys_chroot(const char __user *filename);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_chroot'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:217:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     217 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:593:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     593 | SYSCALL_DEFINE1(chroot, const char __user *, filename)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:464:17: note: previous declaration of 'sys_chroot' with type 'long int(const char *)'
     464 | asmlinkage long sys_chroot(const char __user *filename);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchmod'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:662:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     662 | SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:465:17: note: previous declaration of 'sys_fchmod' with type 'long int(unsigned int,  umode_t)' {aka 'long int(unsigned int,  short unsigned int)'}
     465 | asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchmod'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:662:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     662 | SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:465:17: note: previous declaration of 'sys_fchmod' with type 'long int(unsigned int,  umode_t)' {aka 'long int(unsigned int,  short unsigned int)'}
     465 | asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchmodat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:692:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     692 | SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:466:17: note: previous declaration of 'sys_fchmodat' with type 'long int(int,  const char *, umode_t)' {aka 'long int(int,  const char *, short unsigned int)'}
     466 | asmlinkage long sys_fchmodat(int dfd, const char __user * filename,
         |                 ^~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchmodat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:692:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     692 | SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:466:17: note: previous declaration of 'sys_fchmodat' with type 'long int(int,  const char *, umode_t)' {aka 'long int(int,  const char *, short unsigned int)'}
     466 | asmlinkage long sys_fchmodat(int dfd, const char __user * filename,
         |                 ^~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_chmod'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:698:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     698 | SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1098:17: note: previous declaration of 'sys_chmod' with type 'long int(const char *, umode_t)' {aka 'long int(const char *, short unsigned int)'}
    1098 | asmlinkage long sys_chmod(const char __user *filename, umode_t mode);
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_chmod'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:698:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     698 | SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1098:17: note: previous declaration of 'sys_chmod' with type 'long int(const char *, umode_t)' {aka 'long int(const char *, short unsigned int)'}
    1098 | asmlinkage long sys_chmod(const char __user *filename, umode_t mode);
         |                 ^~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchownat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:817:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     817 | SYSCALL_DEFINE5(fchownat, int, dfd, const char __user *, filename, uid_t, user,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:468:17: note: previous declaration of 'sys_fchownat' with type 'long int(int,  const char *, uid_t,  gid_t,  int)' {aka 'long int(int,  const char *, unsigned int,  unsigned int,  int)'}
     468 | asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
         |                 ^~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchownat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:817:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     817 | SYSCALL_DEFINE5(fchownat, int, dfd, const char __user *, filename, uid_t, user,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:468:17: note: previous declaration of 'sys_fchownat' with type 'long int(int,  const char *, uid_t,  gid_t,  int)' {aka 'long int(int,  const char *, unsigned int,  unsigned int,  int)'}
     468 | asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
         |                 ^~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_chown'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:823:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     823 | SYSCALL_DEFINE3(chown, const char __user *, filename, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1099:17: note: previous declaration of 'sys_chown' with type 'long int(const char *, uid_t,  gid_t)' {aka 'long int(const char *, unsigned int,  unsigned int)'}
    1099 | asmlinkage long sys_chown(const char __user *filename,
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_chown'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:823:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     823 | SYSCALL_DEFINE3(chown, const char __user *, filename, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1099:17: note: previous declaration of 'sys_chown' with type 'long int(const char *, uid_t,  gid_t)' {aka 'long int(const char *, unsigned int,  unsigned int)'}
    1099 | asmlinkage long sys_chown(const char __user *filename,
         |                 ^~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_lchown'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:828:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     828 | SYSCALL_DEFINE3(lchown, const char __user *, filename, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1103:17: note: previous declaration of 'sys_lchown' with type 'long int(const char *, uid_t,  gid_t)' {aka 'long int(const char *, unsigned int,  unsigned int)'}
    1103 | asmlinkage long sys_lchown(const char __user *filename,
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_lchown'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:828:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     828 | SYSCALL_DEFINE3(lchown, const char __user *, filename, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1103:17: note: previous declaration of 'sys_lchown' with type 'long int(const char *, uid_t,  gid_t)' {aka 'long int(const char *, unsigned int,  unsigned int)'}
    1103 | asmlinkage long sys_lchown(const char __user *filename,
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchown'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:859:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     859 | SYSCALL_DEFINE3(fchown, unsigned int, fd, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:470:17: note: previous declaration of 'sys_fchown' with type 'long int(unsigned int,  uid_t,  gid_t)' {aka 'long int(unsigned int,  unsigned int,  unsigned int)'}
     470 | asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchown'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:859:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     859 | SYSCALL_DEFINE3(fchown, unsigned int, fd, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:470:17: note: previous declaration of 'sys_fchown' with type 'long int(unsigned int,  uid_t,  gid_t)' {aka 'long int(unsigned int,  unsigned int,  unsigned int)'}
     470 | asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_open'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1376:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    1376 | SYSCALL_DEFINE3(open, const char __user *, filename, int, flags, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1091:17: note: previous declaration of 'sys_open' with type 'long int(const char *, int,  umode_t)' {aka 'long int(const char *, int,  short unsigned int)'}
    1091 | asmlinkage long sys_open(const char __user *filename,
         |                 ^~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_open'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1376:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    1376 | SYSCALL_DEFINE3(open, const char __user *, filename, int, flags, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1091:17: note: previous declaration of 'sys_open' with type 'long int(const char *, int,  umode_t)' {aka 'long int(const char *, int,  short unsigned int)'}
    1091 | asmlinkage long sys_open(const char __user *filename,
         |                 ^~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_openat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1383:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1383 | SYSCALL_DEFINE4(openat, int, dfd, const char __user *, filename, int, flags,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:471:17: note: previous declaration of 'sys_openat' with type 'long int(int,  const char *, int,  umode_t)' {aka 'long int(int,  const char *, int,  short unsigned int)'}
     471 | asmlinkage long sys_openat(int dfd, const char __user *filename, int flags,
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_openat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1383:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1383 | SYSCALL_DEFINE4(openat, int, dfd, const char __user *, filename, int, flags,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:471:17: note: previous declaration of 'sys_openat' with type 'long int(int,  const char *, int,  umode_t)' {aka 'long int(int,  const char *, int,  short unsigned int)'}
     471 | asmlinkage long sys_openat(int dfd, const char __user *filename, int flags,
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_openat2'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1391:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1391 | SYSCALL_DEFINE4(openat2, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:473:17: note: previous declaration of 'sys_openat2' with type 'long int(int,  const char *, struct open_how *, size_t)' {aka 'long int(int,  const char *, struct open_how *, unsigned int)'}
     473 | asmlinkage long sys_openat2(int dfd, const char __user *filename,
         |                 ^~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_openat2'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1391:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1391 | SYSCALL_DEFINE4(openat2, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:473:17: note: previous declaration of 'sys_openat2' with type 'long int(int,  const char *, struct open_how *, size_t)' {aka 'long int(int,  const char *, struct open_how *, unsigned int)'}
     473 | asmlinkage long sys_openat2(int dfd, const char __user *filename,
         |                 ^~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_creat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1442:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1442 | SYSCALL_DEFINE2(creat, const char __user *, pathname, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1154:17: note: previous declaration of 'sys_creat' with type 'long int(const char *, umode_t)' {aka 'long int(const char *, short unsigned int)'}
    1154 | asmlinkage long sys_creat(const char __user *pathname, umode_t mode);
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_creat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1442:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1442 | SYSCALL_DEFINE2(creat, const char __user *, pathname, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1154:17: note: previous declaration of 'sys_creat' with type 'long int(const char *, umode_t)' {aka 'long int(const char *, short unsigned int)'}
    1154 | asmlinkage long sys_creat(const char __user *pathname, umode_t mode);
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_close'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:217:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     217 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1484:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    1484 | SYSCALL_DEFINE1(close, unsigned int, fd)
..


vim +19 arch/powerpc/include/asm/syscall_wrapper.h

7e92e01b724526 Rohan McLure     2022-09-21  12  
7e92e01b724526 Rohan McLure     2022-09-21  13  #define SC_POWERPC_REGS_TO_ARGS(x, ...)				\
7e92e01b724526 Rohan McLure     2022-09-21  14  	__MAP(x,__SC_ARGS					\
7e92e01b724526 Rohan McLure     2022-09-21  15  	      ,,regs->gpr[3],,regs->gpr[4],,regs->gpr[5]	\
7e92e01b724526 Rohan McLure     2022-09-21  16  	      ,,regs->gpr[6],,regs->gpr[7],,regs->gpr[8])
7e92e01b724526 Rohan McLure     2022-09-21  17  
7e92e01b724526 Rohan McLure     2022-09-21  18  #define __SYSCALL_DEFINEx(x, name, ...)						\
94746890202cf1 Michael Ellerman 2022-10-06 @19  	long sys##name(const struct pt_regs *regs);			\
94746890202cf1 Michael Ellerman 2022-10-06  20  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
7e92e01b724526 Rohan McLure     2022-09-21  21  	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
7e92e01b724526 Rohan McLure     2022-09-21  22  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
94746890202cf1 Michael Ellerman 2022-10-06  23  	long sys##name(const struct pt_regs *regs)			\
7e92e01b724526 Rohan McLure     2022-09-21  24  	{									\
7e92e01b724526 Rohan McLure     2022-09-21  25  		return __se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
7e92e01b724526 Rohan McLure     2022-09-21  26  	}									\
7e92e01b724526 Rohan McLure     2022-09-21  27  	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
7e92e01b724526 Rohan McLure     2022-09-21  28  	{									\
7e92e01b724526 Rohan McLure     2022-09-21  29  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
7e92e01b724526 Rohan McLure     2022-09-21  30  		__MAP(x,__SC_TEST,__VA_ARGS__);					\
7e92e01b724526 Rohan McLure     2022-09-21  31  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		\
7e92e01b724526 Rohan McLure     2022-09-21  32  		return ret;							\
7e92e01b724526 Rohan McLure     2022-09-21  33  	}									\
7e92e01b724526 Rohan McLure     2022-09-21  34  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
7e92e01b724526 Rohan McLure     2022-09-21  35  
7e92e01b724526 Rohan McLure     2022-09-21  36  #define SYSCALL_DEFINE0(sname)							\
7e92e01b724526 Rohan McLure     2022-09-21  37  	SYSCALL_METADATA(_##sname, 0);						\
94746890202cf1 Michael Ellerman 2022-10-06 @38  	long sys_##sname(const struct pt_regs *__unused);		\
94746890202cf1 Michael Ellerman 2022-10-06  39  	ALLOW_ERROR_INJECTION(sys_##sname, ERRNO);			\
94746890202cf1 Michael Ellerman 2022-10-06 @40  	long sys_##sname(const struct pt_regs *__unused)
7e92e01b724526 Rohan McLure     2022-09-21  41  

:::::: The code at line 19 was first introduced by commit
:::::: 94746890202cf18e5266b4de77895243e55b0a79 powerpc: Don't add __powerpc_ prefix to syscall entry points

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--aNWNWuzrTMGEG40H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/powerpc 6.4.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="powerpc-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
# CONFIG_LOCALVERSION_AUTO is not set
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_XZ is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_WATCH_QUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is not set
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TINY_SRCU=y
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
# CONFIG_CGROUPS is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_TIME_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_RELAY is not set
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_BOOT_CONFIG is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
# CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
# CONFIG_KALLSYMS_ALL is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_CALLBACKS=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
# CONFIG_KCMP is not set
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
# end of General setup

CONFIG_PPC32=y
# CONFIG_PPC64 is not set

#
# Processor support
#
CONFIG_PPC_BOOK3S_32=y
# CONFIG_PPC_85xx is not set
# CONFIG_PPC_8xx is not set
# CONFIG_40x is not set
# CONFIG_44x is not set
# CONFIG_PPC_BOOK3S_603 is not set
CONFIG_PPC_BOOK3S_604=y
CONFIG_POWERPC_CPU=y
# CONFIG_E300C2_CPU is not set
# CONFIG_E300C3_CPU is not set
# CONFIG_G4_CPU is not set
# CONFIG_TOOLCHAIN_DEFAULT_CPU is not set
CONFIG_TARGET_CPU_BOOL=y
CONFIG_TARGET_CPU="powerpc"
CONFIG_PPC_BOOK3S=y
CONFIG_PPC_FPU_REGS=y
CONFIG_PPC_FPU=y
# CONFIG_ALTIVEC is not set
# CONFIG_PPC_KUEP is not set
# CONFIG_PPC_KUAP is not set
CONFIG_PPC_HAVE_PMU_SUPPORT=y
# CONFIG_PMU_SYSFS is not set
# CONFIG_SMP is not set
CONFIG_NR_CPUS=1
# end of Processor support

CONFIG_VDSO32=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_32BIT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MAX=17
CONFIG_ARCH_MMAP_RND_BITS_MIN=11
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=17
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=11
CONFIG_NR_IRQS=512
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_PPC=y
CONFIG_EARLY_PRINTK=y
CONFIG_PANIC_TIMEOUT=180
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_AUDIT_ARCH=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_HAS_ADD_PAGES=y
# CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT is not set
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_PGTABLE_LEVELS=2

#
# Platform support
#
# CONFIG_PPC_CHRP is not set
# CONFIG_PPC_MPC512x is not set
# CONFIG_PPC_MPC52xx is not set
# CONFIG_PPC_PMAC is not set
# CONFIG_PPC_82xx is not set
# CONFIG_PPC_83xx is not set
# CONFIG_PPC_86xx is not set
# CONFIG_EMBEDDED6xx is not set
# CONFIG_AMIGAONE is not set
# CONFIG_KVM_GUEST is not set
# CONFIG_EPAPR_PARAVIRT is not set
# CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPUIdle driver
#

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of CPUIdle driver

# CONFIG_TAU is not set
# CONFIG_GEN_RTC is not set
# end of Platform support

#
# Kernel options
#
# CONFIG_HIGHMEM is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
# CONFIG_KEXEC is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ILLEGAL_POINTER_VALUE=0
CONFIG_PPC_4K_PAGES=y
CONFIG_PAGE_SIZE_4KB=y
CONFIG_PPC_PAGE_SHIFT=12
CONFIG_THREAD_SHIFT=13
CONFIG_DATA_SHIFT=12
CONFIG_ARCH_FORCE_MAX_ORDER=10
CONFIG_CMDLINE=""
CONFIG_EXTRA_TARGETS=""
# CONFIG_PM is not set
# end of Kernel options

#
# Bus options
#
# CONFIG_FSL_LBC is not set
# end of Bus options

#
# Advanced setup
#
# CONFIG_ADVANCED_OPTIONS is not set

#
# Default settings for advanced configuration options are used
#
CONFIG_LOWMEM_SIZE=0x30000000
CONFIG_PAGE_OFFSET=0xc0000000
CONFIG_KERNEL_START=0xc0000000
CONFIG_PHYSICAL_START=0x00000000
CONFIG_TASK_SIZE=0xb0000000
# end of Advanced setup

# CONFIG_VIRTUALIZATION is not set
CONFIG_HAVE_LIVEPATCH=y

#
# General architecture-dependent options
#
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_PAGE_SIZE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WEAK_RELEASE_ACQUIRE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_ARCH_MMAP_RND_BITS=11
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_HAVE_ARCH_NVRAM_OPS=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND=y
CONFIG_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_OPTIONAL_KERNEL_RWX=y
CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
# CONFIG_STRICT_KERNEL_RWX is not set
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_ARCH_HAS_PHYS_TO_DMA=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SPLIT_ARG64=y

#
# GCOV-based kernel profiling
#
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# CONFIG_GCC_PLUGINS is not set
CONFIG_FUNCTION_ALIGNMENT=0
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_BLOCK=y
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
# CONFIG_BLK_DEV_BSGLIB is not set
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

#
# IO Schedulers
#
# CONFIG_MQ_IOSCHED_DEADLINE is not set
# CONFIG_MQ_IOSCHED_KYBER is not set
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
# CONFIG_BINFMT_SCRIPT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
# CONFIG_SWAP is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLUB_TINY is not set
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_FLATMEM=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
# CONFIG_COMPACTION is not set
# CONFIG_PAGE_REPORTING is not set
# CONFIG_MIGRATION is not set
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set

#
# GUP_TEST needs to have DEBUG_FS enabled
#
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
# CONFIG_PCCARD is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
# CONFIG_OF_OVERLAY is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
# CONFIG_NVME_FC is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_DUMMY_IRQ is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_SRAM is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_OPEN_DICE is not set
# CONFIG_VCPU_STALL_DETECTOR is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_93CX6 is not set
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

#
# Altera FPGA firmware download module (requires I2C)
#
# CONFIG_ECHO is not set
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
# CONFIG_SCSI is not set
# end of SCSI device support

# CONFIG_ATA is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_MACINTOSH_DRIVERS is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_SPARSEKMAP is not set
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
# CONFIG_SERIO is not set
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
# CONFIG_VT_HW_CONSOLE_BINDING is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LEGACY_TIOCSTI is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_UARTLITE is not set
# CONFIG_SERIAL_SIFIVE is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
# end of Serial drivers

# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_PPC_EPAPR_HV_BYTECHAN is not set
# CONFIG_NULL_TTY is not set
# CONFIG_HVC_UDBG is not set
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_DEVMEM is not set
# CONFIG_NVRAM is not set
# CONFIG_TCG_TPM is not set
# CONFIG_XILLYBUS is not set
# end of Character devices

#
# I2C support
#
# CONFIG_I2C is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
# CONFIG_PPS is not set

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

# CONFIG_PINCTRL is not set
# CONFIG_GPIOLIB is not set
# CONFIG_W1 is not set
# CONFIG_POWER_RESET is not set
# CONFIG_POWER_SUPPLY is not set
# CONFIG_HWMON is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_TQMX86 is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
# CONFIG_RC_CORE is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_DRM is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
# end of Backlight & LCD device support

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# end of Console display driver support
# end of Graphics support

# CONFIG_SOUND is not set
# CONFIG_HID_SUPPORT is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH is not set
# CONFIG_COMMON_CLK is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_WPCM450_SOC is not set

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
# CONFIG_XILINX_INTC is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_DPHY is not set
# CONFIG_PHY_CADENCE_DPHY_RX is not set
# CONFIG_PHY_CADENCE_SALVO is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set
# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_DAX is not set
# CONFIG_NVMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_FSI is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_EXT4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
# CONFIG_MSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
# CONFIG_TMPFS is not set
# CONFIG_CONFIGFS_FS is not set
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NLS is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

# CONFIG_CRYPTO is not set

#
# Library routines
#
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# end of Crypto library routines

# CONFIG_CRC_CCITT is not set
# CONFIG_CRC16 is not set
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC64_ROCKSOFT is not set
# CONFIG_CRC_ITU_T is not set
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
# CONFIG_RANDOM32_SELFTEST is not set
# CONFIG_XZ_DEC is not set
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_DMA_DEFAULT_COHERENT=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_GENERIC_ATOMIC64=y
# CONFIG_IRQ_POLL is not set
CONFIG_LIBFDT=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_LEB128=y
CONFIG_DEBUG_INFO_NONE=y
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_DEBUG_FS is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
CONFIG_GENERIC_PTDUMP=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_LATENCYTOP is not set
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# powerpc Debugging
#
# CONFIG_PPC_DISABLE_WERROR is not set
CONFIG_PPC_WERROR=y
CONFIG_PRINT_STACK_DEPTH=64
# CONFIG_CODE_PATCHING_SELFTEST is not set
# CONFIG_FTR_FIXUP_SELFTEST is not set
# CONFIG_MSI_BITMAP_SELFTEST is not set
# CONFIG_XMON is not set
# CONFIG_BDI_SWITCH is not set
# CONFIG_BOOTX_TEXT is not set
# CONFIG_PPC_EARLY_DEBUG is not set
# end of powerpc Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--aNWNWuzrTMGEG40H--
