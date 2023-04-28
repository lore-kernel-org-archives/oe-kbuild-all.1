Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F515AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 01:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682644594; x=1714180594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/C+wf40FPBuPbzFZaSLB84K+3Xt5BAsTWBJitX4I84=;
  b=EDCHfmxl3yyYp3STzsMIRWaJu2tEl++tjP+sovswbEJWIsomThB6Vid4
   Q2RUJPW7MNx5qUnWV3m9b4Xot5wCRIQvb8taPD8DCIzrlM4VZpARmiBPc
   HVRPWosIQUVTTCnV4opjczLrroNxdfSLvCCw9ewZMX+McCnGXrjOk6vj5
   9qgkQA6ybr6EzxcoHcy3ASo20nv59MLTfu28JX9N9QP19Tjv5zpME1SzX
   8tV06TC+ERmkY3WbCVO8y3aHZDhlHS4FTq6dqgEqO1OA5q5Di/0hWaowR
   zfCOhf88zncTr954CaDVP6vWfrasPREIoxCPaateqXCGcPaWYRBgBXGcj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="412999812"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="412999812"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 18:16:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="940884659"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="940884659"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2023 18:16:32 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psCit-0000Fh-13;
	Fri, 28 Apr 2023 01:16:31 +0000
Date: Fri, 28 Apr 2023 09:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.3-next 239/344]
 arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types
 for 'sys_pciconfig_iobase'; have 'long int(const struct pt_regs *)'
Message-ID: <202304280942.iOJK55g1-lkp@intel.com>
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230428/202304280942.iOJK55g1-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/ drivers/ fs// ipc// kernel// mm// net// security/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280942.iOJK55g1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/syscalls.h:98,
                    from arch/powerpc/kernel/pci_32.c:15:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_pciconfig_iobase'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   arch/powerpc/kernel/pci_32.c:326:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     326 | SYSCALL_DEFINE3(pciconfig_iobase, long, which,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1078:17: note: previous declaration of 'sys_pciconfig_iobase' with type 'long int(long int,  long unsigned int,  long unsigned int)'
    1078 | asmlinkage long sys_pciconfig_iobase(long which, unsigned long bus, unsigned long devfn);
         |                 ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_pciconfig_iobase'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   arch/powerpc/kernel/pci_32.c:326:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     326 | SYSCALL_DEFINE3(pciconfig_iobase, long, which,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1078:17: note: previous declaration of 'sys_pciconfig_iobase' with type 'long int(long int,  long unsigned int,  long unsigned int)'
    1078 | asmlinkage long sys_pciconfig_iobase(long which, unsigned long bus, unsigned long devfn);
         |                 ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/syscalls.h:98,
                    from drivers/pci/syscall.c:11:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_pciconfig_read'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   drivers/pci/syscall.c:15:1: note: in expansion of macro 'SYSCALL_DEFINE5'
      15 | SYSCALL_DEFINE5(pciconfig_read, unsigned long, bus, unsigned long, dfn,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1072:17: note: previous declaration of 'sys_pciconfig_read' with type 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  void *)'
    1072 | asmlinkage long sys_pciconfig_read(unsigned long bus, unsigned long dfn,
         |                 ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_pciconfig_read'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   drivers/pci/syscall.c:15:1: note: in expansion of macro 'SYSCALL_DEFINE5'
      15 | SYSCALL_DEFINE5(pciconfig_read, unsigned long, bus, unsigned long, dfn,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1072:17: note: previous declaration of 'sys_pciconfig_read' with type 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  void *)'
    1072 | asmlinkage long sys_pciconfig_read(unsigned long bus, unsigned long dfn,
         |                 ^~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_pciconfig_write'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   drivers/pci/syscall.c:86:1: note: in expansion of macro 'SYSCALL_DEFINE5'
      86 | SYSCALL_DEFINE5(pciconfig_write, unsigned long, bus, unsigned long, dfn,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1075:17: note: previous declaration of 'sys_pciconfig_write' with type 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  void *)'
    1075 | asmlinkage long sys_pciconfig_write(unsigned long bus, unsigned long dfn,
         |                 ^~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_pciconfig_write'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   drivers/pci/syscall.c:86:1: note: in expansion of macro 'SYSCALL_DEFINE5'
      86 | SYSCALL_DEFINE5(pciconfig_write, unsigned long, bus, unsigned long, dfn,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1075:17: note: previous declaration of 'sys_pciconfig_write' with type 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  void *)'
    1075 | asmlinkage long sys_pciconfig_write(unsigned long bus, unsigned long dfn,
         |                 ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/syscalls.h:98,
                    from security/keys/keyctl.c:12:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_add_key'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/keys/keyctl.c:74:1: note: in expansion of macro 'SYSCALL_DEFINE5'
      74 | SYSCALL_DEFINE5(add_key, const char __user *, _type,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:872:17: note: previous declaration of 'sys_add_key' with type 'long int(const char *, const char *, const void *, size_t,  key_serial_t)' {aka 'long int(const char *, const char *, const void *, unsigned int,  int)'}
     872 | asmlinkage long sys_add_key(const char __user *_type,
         |                 ^~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_add_key'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/keys/keyctl.c:74:1: note: in expansion of macro 'SYSCALL_DEFINE5'
      74 | SYSCALL_DEFINE5(add_key, const char __user *, _type,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:872:17: note: previous declaration of 'sys_add_key' with type 'long int(const char *, const char *, const void *, size_t,  key_serial_t)' {aka 'long int(const char *, const char *, const void *, unsigned int,  int)'}
     872 | asmlinkage long sys_add_key(const char __user *_type,
         |                 ^~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_request_key'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/keys/keyctl.c:167:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     167 | SYSCALL_DEFINE4(request_key, const char __user *, _type,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:877:17: note: previous declaration of 'sys_request_key' with type 'long int(const char *, const char *, const char *, key_serial_t)' {aka 'long int(const char *, const char *, const char *, int)'}
     877 | asmlinkage long sys_request_key(const char __user *_type,
         |                 ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_request_key'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/keys/keyctl.c:167:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     167 | SYSCALL_DEFINE4(request_key, const char __user *, _type,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:877:17: note: previous declaration of 'sys_request_key' with type 'long int(const char *, const char *, const char *, key_serial_t)' {aka 'long int(const char *, const char *, const char *, int)'}
     877 | asmlinkage long sys_request_key(const char __user *_type,
         |                 ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_keyctl'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/keys/keyctl.c:1869:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    1869 | SYSCALL_DEFINE5(keyctl, int, option, unsigned long, arg2, unsigned long, arg3,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:881:17: note: previous declaration of 'sys_keyctl' with type 'long int(int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'
     881 | asmlinkage long sys_keyctl(int cmd, unsigned long arg2, unsigned long arg3,
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_keyctl'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/keys/keyctl.c:1869:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    1869 | SYSCALL_DEFINE5(keyctl, int, option, unsigned long, arg2, unsigned long, arg3,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:881:17: note: previous declaration of 'sys_keyctl' with type 'long int(int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'
     881 | asmlinkage long sys_keyctl(int cmd, unsigned long arg2, unsigned long arg3,
         |                 ^~~~~~~~~~
--
   In file included from include/linux/syscalls.h:98,
                    from security/landlock/syscalls.c:24:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_landlock_create_ruleset'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/landlock/syscalls.c:157:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     157 | SYSCALL_DEFINE3(landlock_create_ruleset,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1053:17: note: previous declaration of 'sys_landlock_create_ruleset' with type 'long int(const struct landlock_ruleset_attr *, size_t,  __u32)' {aka 'long int(const struct landlock_ruleset_attr *, unsigned int,  unsigned int)'}
    1053 | asmlinkage long sys_landlock_create_ruleset(const struct landlock_ruleset_attr __user *attr,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_landlock_create_ruleset'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/landlock/syscalls.c:157:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     157 | SYSCALL_DEFINE3(landlock_create_ruleset,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1053:17: note: previous declaration of 'sys_landlock_create_ruleset' with type 'long int(const struct landlock_ruleset_attr *, size_t,  __u32)' {aka 'long int(const struct landlock_ruleset_attr *, unsigned int,  unsigned int)'}
    1053 | asmlinkage long sys_landlock_create_ruleset(const struct landlock_ruleset_attr __user *attr,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_landlock_add_rule'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/landlock/syscalls.c:305:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     305 | SYSCALL_DEFINE4(landlock_add_rule, const int, ruleset_fd,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1055:17: note: previous declaration of 'sys_landlock_add_rule' with type 'long int(int,  enum landlock_rule_type,  const void *, __u32)' {aka 'long int(int,  enum landlock_rule_type,  const void *, unsigned int)'}
    1055 | asmlinkage long sys_landlock_add_rule(int ruleset_fd, enum landlock_rule_type rule_type,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_landlock_add_rule'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/landlock/syscalls.c:305:1: note: in expansion of macro 'SYSCALL_DEFINE4'
     305 | SYSCALL_DEFINE4(landlock_add_rule, const int, ruleset_fd,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1055:17: note: previous declaration of 'sys_landlock_add_rule' with type 'long int(int,  enum landlock_rule_type,  const void *, __u32)' {aka 'long int(int,  enum landlock_rule_type,  const void *, unsigned int)'}
    1055 | asmlinkage long sys_landlock_add_rule(int ruleset_fd, enum landlock_rule_type rule_type,
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_landlock_restrict_self'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/landlock/syscalls.c:397:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     397 | SYSCALL_DEFINE2(landlock_restrict_self, const int, ruleset_fd, const __u32,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1057:17: note: previous declaration of 'sys_landlock_restrict_self' with type 'long int(int,  __u32)' {aka 'long int(int,  unsigned int)'}
    1057 | asmlinkage long sys_landlock_restrict_self(int ruleset_fd, __u32 flags);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_landlock_restrict_self'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:229:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     229 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/landlock/syscalls.c:397:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     397 | SYSCALL_DEFINE2(landlock_restrict_self, const int, ruleset_fd, const __u32,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1057:17: note: previous declaration of 'sys_landlock_restrict_self' with type 'long int(int,  __u32)' {aka 'long int(int,  unsigned int)'}
    1057 | asmlinkage long sys_landlock_restrict_self(int ruleset_fd, __u32 flags);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~


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

:::::: The code at line 19 was first introduced by commit
:::::: 94746890202cf18e5266b4de77895243e55b0a79 powerpc: Don't add __powerpc_ prefix to syscall entry points

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
