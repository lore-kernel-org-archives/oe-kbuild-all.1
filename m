Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB61ED1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 00:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682469009; x=1714005009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=btzpk5Zu3yncUYNgMmoaaw5q1PQk8OTfPLEpAXmfKJ4=;
  b=GknmMaO8Svw4cvJwHw8ByDp0B0srQV1ukWRUoMpt4WrxOwOxGuEOhCpY
   SMXJSQxuoAl3Nx5pcEmax+Jm2KKs2G8E9DuulgA7KUAeU236IPjBPKeSf
   JDeKw6oVYWajzXq6PO3yIAnXMd/6BGkmBf6jifxauuruQebBT3zfoXSIQ
   AntoJuH+QKgNeH+6n+prFfGusTwfBz6e+wcg/4daPStvbdQvFhxBki8B/
   vD727yxpz2oogZAM6AcYEjXHQOGgpYEQfFCVwlwWYPv1Nprnxm2bSHJhc
   1CoEC1c0Ou2iFBmv3rXvZJFsLqbcSfIO7GPpF5xpCMtXHMu+AJLF31ZHJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="374895453"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="374895453"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 17:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="939982622"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="939982622"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Apr 2023 17:30:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prT2s-000juS-1i;
	Wed, 26 Apr 2023 00:30:06 +0000
Date: Wed, 26 Apr 2023 08:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.3-next 239/344]
 arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types
 for 'sys_ioprio_set'; have 'long int(const struct pt_regs *)'
Message-ID: <202304260847.SZ8LIoUG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.3-next
head:   ce323d567a17c02081821dde7ef52ff1a966156d
commit: 570f14d947a524845f96c1043f63bbd565473272 [239/344] missing prototypes
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230426/202304260847.SZ8LIoUG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=570f14d947a524845f96c1043f63bbd565473272
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-6.3-next
        git checkout 570f14d947a524845f96c1043f63bbd565473272
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ block/ drivers/char/ fs/ io_uring/ kernel/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260847.SZ8LIoUG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/syscalls.h:98,
                    from block/ioprio.c:29:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_ioprio_set'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   block/ioprio.c:68:1: note: in expansion of macro 'SYSCALL_DEFINE3'
      68 | SYSCALL_DEFINE3(ioprio_set, int, which, int, who, int, ioprio)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:417:17: note: previous declaration of 'sys_ioprio_set' with type 'long int(int,  int,  int)'
     417 | asmlinkage long sys_ioprio_set(int which, int who, int ioprio);
         |                 ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_ioprio_set'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   block/ioprio.c:68:1: note: in expansion of macro 'SYSCALL_DEFINE3'
      68 | SYSCALL_DEFINE3(ioprio_set, int, which, int, who, int, ioprio)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:417:17: note: previous declaration of 'sys_ioprio_set' with type 'long int(int,  int,  int)'
     417 | asmlinkage long sys_ioprio_set(int which, int who, int ioprio);
         |                 ^~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_ioprio_get'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   block/ioprio.c:209:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     209 | SYSCALL_DEFINE2(ioprio_get, int, which, int, who)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:418:17: note: previous declaration of 'sys_ioprio_get' with type 'long int(int,  int)'
     418 | asmlinkage long sys_ioprio_get(int which, int who);
         |                 ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_ioprio_get'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   block/ioprio.c:209:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     209 | SYSCALL_DEFINE2(ioprio_get, int, which, int, who)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:418:17: note: previous declaration of 'sys_ioprio_get' with type 'long int(int,  int)'
     418 | asmlinkage long sys_ioprio_get(int which, int who);
         |                 ^~~~~~~~~~~~~~
--
   In file included from include/linux/syscalls.h:98,
                    from fs/open.c:27:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_truncate'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:145:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     145 | SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:453:17: note: previous declaration of 'sys_truncate' with type 'long int(const char *, long int)'
     453 | asmlinkage long sys_truncate(const char __user *path, long length);
         |                 ^~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_truncate'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:145:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     145 | SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:453:17: note: previous declaration of 'sys_truncate' with type 'long int(const char *, long int)'
     453 | asmlinkage long sys_truncate(const char __user *path, long length);
         |                 ^~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_ftruncate'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:203:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     203 | SYSCALL_DEFINE2(ftruncate, unsigned int, fd, unsigned long, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:454:17: note: previous declaration of 'sys_ftruncate' with type 'long int(unsigned int,  long unsigned int)'
     454 | asmlinkage long sys_ftruncate(unsigned int fd, unsigned long length);
         |                 ^~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_ftruncate'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:203:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     203 | SYSCALL_DEFINE2(ftruncate, unsigned int, fd, unsigned long, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:454:17: note: previous declaration of 'sys_ftruncate' with type 'long int(unsigned int,  long unsigned int)'
     454 | asmlinkage long sys_ftruncate(unsigned int fd, unsigned long length);
         |                 ^~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_truncate64'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:217:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     217 | SYSCALL_DEFINE2(truncate64, const char __user *, path, loff_t, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:456:17: note: previous declaration of 'sys_truncate64' with type 'long int(const char *, loff_t)' {aka 'long int(const char *, long long int)'}
     456 | asmlinkage long sys_truncate64(const char __user *path, loff_t length);
         |                 ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_truncate64'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:217:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     217 | SYSCALL_DEFINE2(truncate64, const char __user *, path, loff_t, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:456:17: note: previous declaration of 'sys_truncate64' with type 'long int(const char *, loff_t)' {aka 'long int(const char *, long long int)'}
     456 | asmlinkage long sys_truncate64(const char __user *path, loff_t length);
         |                 ^~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_ftruncate64'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:222:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     222 | SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:457:17: note: previous declaration of 'sys_ftruncate64' with type 'long int(unsigned int,  loff_t)' {aka 'long int(unsigned int,  long long int)'}
     457 | asmlinkage long sys_ftruncate64(unsigned int fd, loff_t length);
         |                 ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_ftruncate64'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:222:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     222 | SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:457:17: note: previous declaration of 'sys_ftruncate64' with type 'long int(unsigned int,  loff_t)' {aka 'long int(unsigned int,  long long int)'}
     457 | asmlinkage long sys_ftruncate64(unsigned int fd, loff_t length);
         |                 ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fallocate'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:353:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     353 | SYSCALL_DEFINE4(fallocate, int, fd, int, mode, loff_t, offset, loff_t, len)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:459:17: note: previous declaration of 'sys_fallocate' with type 'long int(int,  int,  loff_t,  loff_t)' {aka 'long int(int,  int,  long long int,  long long int)'}
     459 | asmlinkage long sys_fallocate(int fd, int mode, loff_t offset, loff_t len);
         |                 ^~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fallocate'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:353:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     353 | SYSCALL_DEFINE4(fallocate, int, fd, int, mode, loff_t, offset, loff_t, len)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:459:17: note: previous declaration of 'sys_fallocate' with type 'long int(int,  int,  loff_t,  loff_t)' {aka 'long int(int,  int,  long long int,  long long int)'}
     459 | asmlinkage long sys_fallocate(int fd, int mode, loff_t offset, loff_t len);
         |                 ^~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_faccessat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:529:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     529 | SYSCALL_DEFINE3(faccessat, int, dfd, const char __user *, filename, int, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:460:17: note: previous declaration of 'sys_faccessat' with type 'long int(int,  const char *, int)'
     460 | asmlinkage long sys_faccessat(int dfd, const char __user *filename, int mode);
         |                 ^~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_faccessat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:529:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     529 | SYSCALL_DEFINE3(faccessat, int, dfd, const char __user *, filename, int, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:460:17: note: previous declaration of 'sys_faccessat' with type 'long int(int,  const char *, int)'
     460 | asmlinkage long sys_faccessat(int dfd, const char __user *filename, int mode);
         |                 ^~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_faccessat2'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:534:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     534 | SYSCALL_DEFINE4(faccessat2, int, dfd, const char __user *, filename, int, mode,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:461:17: note: previous declaration of 'sys_faccessat2' with type 'long int(int,  const char *, int,  int)'
     461 | asmlinkage long sys_faccessat2(int dfd, const char __user *filename, int mode,
         |                 ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_faccessat2'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:534:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     534 | SYSCALL_DEFINE4(faccessat2, int, dfd, const char __user *, filename, int, mode,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:461:17: note: previous declaration of 'sys_faccessat2' with type 'long int(int,  const char *, int,  int)'
     461 | asmlinkage long sys_faccessat2(int dfd, const char __user *filename, int mode,
         |                 ^~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_access'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:540:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     540 | SYSCALL_DEFINE2(access, const char __user *, filename, int, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1107:17: note: previous declaration of 'sys_access' with type 'long int(const char *, int)'
    1107 | asmlinkage long sys_access(const char __user *filename, int mode);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_access'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:540:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     540 | SYSCALL_DEFINE2(access, const char __user *, filename, int, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1107:17: note: previous declaration of 'sys_access' with type 'long int(const char *, int)'
    1107 | asmlinkage long sys_access(const char __user *filename, int mode);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_chdir'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:545:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     545 | SYSCALL_DEFINE1(chdir, const char __user *, filename)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:463:17: note: previous declaration of 'sys_chdir' with type 'long int(const char *)'
     463 | asmlinkage long sys_chdir(const char __user *filename);
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_chdir'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:545:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     545 | SYSCALL_DEFINE1(chdir, const char __user *, filename)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:463:17: note: previous declaration of 'sys_chdir' with type 'long int(const char *)'
     463 | asmlinkage long sys_chdir(const char __user *filename);
         |                 ^~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchdir'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:571:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     571 | SYSCALL_DEFINE1(fchdir, unsigned int, fd)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:464:17: note: previous declaration of 'sys_fchdir' with type 'long int(unsigned int)'
     464 | asmlinkage long sys_fchdir(unsigned int fd);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchdir'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:571:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     571 | SYSCALL_DEFINE1(fchdir, unsigned int, fd)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:464:17: note: previous declaration of 'sys_fchdir' with type 'long int(unsigned int)'
     464 | asmlinkage long sys_fchdir(unsigned int fd);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_chroot'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:593:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     593 | SYSCALL_DEFINE1(chroot, const char __user *, filename)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:465:17: note: previous declaration of 'sys_chroot' with type 'long int(const char *)'
     465 | asmlinkage long sys_chroot(const char __user *filename);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_chroot'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:593:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     593 | SYSCALL_DEFINE1(chroot, const char __user *, filename)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:465:17: note: previous declaration of 'sys_chroot' with type 'long int(const char *)'
     465 | asmlinkage long sys_chroot(const char __user *filename);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchmod'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:662:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     662 | SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:466:17: note: previous declaration of 'sys_fchmod' with type 'long int(unsigned int,  umode_t)' {aka 'long int(unsigned int,  short unsigned int)'}
     466 | asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchmod'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:662:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     662 | SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:466:17: note: previous declaration of 'sys_fchmod' with type 'long int(unsigned int,  umode_t)' {aka 'long int(unsigned int,  short unsigned int)'}
     466 | asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchmodat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:692:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     692 | SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:467:17: note: previous declaration of 'sys_fchmodat' with type 'long int(int,  const char *, umode_t)' {aka 'long int(int,  const char *, short unsigned int)'}
     467 | asmlinkage long sys_fchmodat(int dfd, const char __user * filename,
         |                 ^~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchmodat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:692:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     692 | SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:467:17: note: previous declaration of 'sys_fchmodat' with type 'long int(int,  const char *, umode_t)' {aka 'long int(int,  const char *, short unsigned int)'}
     467 | asmlinkage long sys_fchmodat(int dfd, const char __user * filename,
         |                 ^~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_chmod'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:698:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     698 | SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1100:17: note: previous declaration of 'sys_chmod' with type 'long int(const char *, umode_t)' {aka 'long int(const char *, short unsigned int)'}
    1100 | asmlinkage long sys_chmod(const char __user *filename, umode_t mode);
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_chmod'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:698:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     698 | SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1100:17: note: previous declaration of 'sys_chmod' with type 'long int(const char *, umode_t)' {aka 'long int(const char *, short unsigned int)'}
    1100 | asmlinkage long sys_chmod(const char __user *filename, umode_t mode);
         |                 ^~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchownat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:817:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     817 | SYSCALL_DEFINE5(fchownat, int, dfd, const char __user *, filename, uid_t, user,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:469:17: note: previous declaration of 'sys_fchownat' with type 'long int(int,  const char *, uid_t,  gid_t,  int)' {aka 'long int(int,  const char *, unsigned int,  unsigned int,  int)'}
     469 | asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
         |                 ^~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchownat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:817:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     817 | SYSCALL_DEFINE5(fchownat, int, dfd, const char __user *, filename, uid_t, user,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:469:17: note: previous declaration of 'sys_fchownat' with type 'long int(int,  const char *, uid_t,  gid_t,  int)' {aka 'long int(int,  const char *, unsigned int,  unsigned int,  int)'}
     469 | asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
         |                 ^~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_chown'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:823:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     823 | SYSCALL_DEFINE3(chown, const char __user *, filename, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1101:17: note: previous declaration of 'sys_chown' with type 'long int(const char *, uid_t,  gid_t)' {aka 'long int(const char *, unsigned int,  unsigned int)'}
    1101 | asmlinkage long sys_chown(const char __user *filename,
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_chown'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:823:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     823 | SYSCALL_DEFINE3(chown, const char __user *, filename, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1101:17: note: previous declaration of 'sys_chown' with type 'long int(const char *, uid_t,  gid_t)' {aka 'long int(const char *, unsigned int,  unsigned int)'}
    1101 | asmlinkage long sys_chown(const char __user *filename,
         |                 ^~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_lchown'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:828:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     828 | SYSCALL_DEFINE3(lchown, const char __user *, filename, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1105:17: note: previous declaration of 'sys_lchown' with type 'long int(const char *, uid_t,  gid_t)' {aka 'long int(const char *, unsigned int,  unsigned int)'}
    1105 | asmlinkage long sys_lchown(const char __user *filename,
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_lchown'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:828:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     828 | SYSCALL_DEFINE3(lchown, const char __user *, filename, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1105:17: note: previous declaration of 'sys_lchown' with type 'long int(const char *, uid_t,  gid_t)' {aka 'long int(const char *, unsigned int,  unsigned int)'}
    1105 | asmlinkage long sys_lchown(const char __user *filename,
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_fchown'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:859:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     859 | SYSCALL_DEFINE3(fchown, unsigned int, fd, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:471:17: note: previous declaration of 'sys_fchown' with type 'long int(unsigned int,  uid_t,  gid_t)' {aka 'long int(unsigned int,  unsigned int,  unsigned int)'}
     471 | asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_fchown'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:859:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     859 | SYSCALL_DEFINE3(fchown, unsigned int, fd, uid_t, user, gid_t, group)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:471:17: note: previous declaration of 'sys_fchown' with type 'long int(unsigned int,  uid_t,  gid_t)' {aka 'long int(unsigned int,  unsigned int,  unsigned int)'}
     471 | asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
         |                 ^~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_open'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1376:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    1376 | SYSCALL_DEFINE3(open, const char __user *, filename, int, flags, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1093:17: note: previous declaration of 'sys_open' with type 'long int(const char *, int,  umode_t)' {aka 'long int(const char *, int,  short unsigned int)'}
    1093 | asmlinkage long sys_open(const char __user *filename,
         |                 ^~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_open'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1376:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    1376 | SYSCALL_DEFINE3(open, const char __user *, filename, int, flags, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1093:17: note: previous declaration of 'sys_open' with type 'long int(const char *, int,  umode_t)' {aka 'long int(const char *, int,  short unsigned int)'}
    1093 | asmlinkage long sys_open(const char __user *filename,
         |                 ^~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_openat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1383:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1383 | SYSCALL_DEFINE4(openat, int, dfd, const char __user *, filename, int, flags,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:472:17: note: previous declaration of 'sys_openat' with type 'long int(int,  const char *, int,  umode_t)' {aka 'long int(int,  const char *, int,  short unsigned int)'}
     472 | asmlinkage long sys_openat(int dfd, const char __user *filename, int flags,
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_openat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1383:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1383 | SYSCALL_DEFINE4(openat, int, dfd, const char __user *, filename, int, flags,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:472:17: note: previous declaration of 'sys_openat' with type 'long int(int,  const char *, int,  umode_t)' {aka 'long int(int,  const char *, int,  short unsigned int)'}
     472 | asmlinkage long sys_openat(int dfd, const char __user *filename, int flags,
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_openat2'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1391:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1391 | SYSCALL_DEFINE4(openat2, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:474:17: note: previous declaration of 'sys_openat2' with type 'long int(int,  const char *, struct open_how *, size_t)' {aka 'long int(int,  const char *, struct open_how *, unsigned int)'}
     474 | asmlinkage long sys_openat2(int dfd, const char __user *filename,
         |                 ^~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_openat2'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1391:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    1391 | SYSCALL_DEFINE4(openat2, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:474:17: note: previous declaration of 'sys_openat2' with type 'long int(int,  const char *, struct open_how *, size_t)' {aka 'long int(int,  const char *, struct open_how *, unsigned int)'}
     474 | asmlinkage long sys_openat2(int dfd, const char __user *filename,
         |                 ^~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_creat'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1442:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1442 | SYSCALL_DEFINE2(creat, const char __user *, pathname, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1156:17: note: previous declaration of 'sys_creat' with type 'long int(const char *, umode_t)' {aka 'long int(const char *, short unsigned int)'}
    1156 | asmlinkage long sys_creat(const char __user *pathname, umode_t mode);
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_creat'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/open.c:1442:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1442 | SYSCALL_DEFINE2(creat, const char __user *, pathname, umode_t, mode)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1156:17: note: previous declaration of 'sys_creat' with type 'long int(const char *, umode_t)' {aka 'long int(const char *, short unsigned int)'}
    1156 | asmlinkage long sys_creat(const char __user *pathname, umode_t mode);
         |                 ^~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_close'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     218 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
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
https://github.com/intel/lkp-tests
