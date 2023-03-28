Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E77BA94D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680020595; x=1711556595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ex7zN1hvJ6Uj7Q4gv1CmsiROtwrQrjmc2JRQA8Lh9IQ=;
  b=DLgm+xt+JJ1HWr8NF+KJ4TT2GzHBh5f9MFtYCtQGZkOaI0QTLP9X/Y4c
   IZsXNAckujfTg17VzWtW66tGoH+Ql7FTVdrXNrB8T1SWPDQIUW5/k6dsQ
   XCVqgd7nM0RSaFc5cDgZ6ehg8tQXPoI9K1LpNdoPNX+9sgTF4kbBghnuf
   uQY8VMfCzd7Tr5EP/+UbJ8QDXx8vgCWgRrhlFxQrslRcbBuXK5s6KKzw2
   +lq6eoe4yylKl6HFI+kbADI8Yb9aAGwsO+cprwZ5Datv1Vdsox/Saloyw
   Hskv8ywy5V24ipBFavDv93hgWV7ptl0zACTa3ixJ0yGRQzcBfGZAvaW+V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="340639494"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="340639494"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 09:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="753219008"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="753219008"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2023 09:23:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phC6J-000Ihd-2e;
	Tue, 28 Mar 2023 16:23:11 +0000
Date: Wed, 29 Mar 2023 00:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.4 53/58] arch/riscv/include/asm/futex.h:59:
 Error: unrecognized opcode `csrs sstatus,a5'
Message-ID: <202303290043.lIOADltE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   288f882a0ab160d072d2365768e9d239b5a8282d
commit: f58f74eaf94e8e606cd73a3130fd7b91d8415fa7 [53/58] riscv: Handle zicsr/zifencei issues between clang and binutils
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230329/202303290043.lIOADltE-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=f58f74eaf94e8e606cd73a3130fd7b91d8415fa7
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout f58f74eaf94e8e606cd73a3130fd7b91d8415fa7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash M=kernel

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290043.lIOADltE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/futex.h: Assembler messages:
>> arch/riscv/include/asm/futex.h:59: Error: unrecognized opcode `csrs sstatus,a5'
>> arch/riscv/include/asm/futex.h:59: Error: unrecognized opcode `csrc sstatus,a5'
   arch/riscv/include/asm/futex.h:63: Error: unrecognized opcode `csrs sstatus,a5'
   arch/riscv/include/asm/futex.h:63: Error: unrecognized opcode `csrc sstatus,a5'
   arch/riscv/include/asm/futex.h:47: Error: unrecognized opcode `csrs sstatus,a5'
   arch/riscv/include/asm/futex.h:47: Error: unrecognized opcode `csrc sstatus,a5'
   arch/riscv/include/asm/futex.h:51: Error: unrecognized opcode `csrs sstatus,a5'
   arch/riscv/include/asm/futex.h:51: Error: unrecognized opcode `csrc sstatus,a5'
   arch/riscv/include/asm/futex.h:55: Error: unrecognized opcode `csrs sstatus,a5'
   arch/riscv/include/asm/futex.h:55: Error: unrecognized opcode `csrc sstatus,a5'
   kernel/futex.c:817: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/futex.c:817: Error: unrecognized opcode `csrc sstatus,a3'
>> arch/riscv/include/asm/futex.h:89: Error: unrecognized opcode `csrs sstatus,a6'
>> arch/riscv/include/asm/futex.h:109: Error: unrecognized opcode `csrc sstatus,a6'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   kernel/futex.c:3564: Error: unrecognized opcode `csrs sstatus,s2'
   kernel/futex.c:3564: Error: unrecognized opcode `csrc sstatus,s2'
   kernel/futex.c:3666: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/futex.c:3666: Error: unrecognized opcode `csrc sstatus,a4'
   kernel/futex.c:3702: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/futex.c:3702: Error: unrecognized opcode `csrc sstatus,a4'
   kernel/futex.c:3666: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/futex.c:3666: Error: unrecognized opcode `csrc sstatus,a4'
   kernel/futex.c:3666: Error: unrecognized opcode `csrs sstatus,s3'
   kernel/futex.c:3666: Error: unrecognized opcode `csrc sstatus,s3'
   kernel/futex.c:2798: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/futex.c:2798: Error: unrecognized opcode `csrc sstatus,a4'
   kernel/futex.c:3098: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/futex.c:3098: Error: unrecognized opcode `csrc sstatus,a4'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   kernel/futex.c:2110: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/futex.c:2110: Error: unrecognized opcode `csrc sstatus,a4'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   kernel/futex.c:3535: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/futex.c:3535: Error: unrecognized opcode `csrc sstatus,a4'
   kernel/futex.c:3537: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/futex.c:3537: Error: unrecognized opcode `csrc sstatus,a4'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
--
   kernel/bpf/syscall.c: Assembler messages:
   kernel/bpf/syscall.c:2153: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/bpf/syscall.c:2153: Error: unrecognized opcode `csrc sstatus,a4'
   kernel/bpf/syscall.c:2731: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/bpf/syscall.c:2731: Error: unrecognized opcode `csrc sstatus,a3'
   kernel/bpf/syscall.c:2739: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/bpf/syscall.c:2739: Error: unrecognized opcode `csrc sstatus,a3'
   kernel/bpf/syscall.c:2759: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/bpf/syscall.c:2759: Error: unrecognized opcode `csrc sstatus,a3'
   kernel/bpf/syscall.c:2760: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/bpf/syscall.c:2760: Error: unrecognized opcode `csrc sstatus,a3'
   kernel/bpf/syscall.c:2761: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/bpf/syscall.c:2761: Error: unrecognized opcode `csrc sstatus,a3'
   kernel/bpf/syscall.c:2762: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/bpf/syscall.c:2762: Error: unrecognized opcode `csrc sstatus,a3'
   kernel/bpf/syscall.c:2754: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/bpf/syscall.c:2754: Error: unrecognized opcode `csrc sstatus,a4'
   kernel/bpf/syscall.c:85: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/bpf/syscall.c:85: Error: unrecognized opcode `csrc sstatus,a3'
   kernel/bpf/syscall.c:2368: Error: unrecognized opcode `csrs sstatus,a1'
   kernel/bpf/syscall.c:2368: Error: unrecognized opcode `csrc sstatus,a1'
   kernel/bpf/syscall.c:2599: Error: unrecognized opcode `csrs sstatus,a5'
   kernel/bpf/syscall.c:2599: Error: unrecognized opcode `csrc sstatus,a5'
   kernel/bpf/syscall.c:2485: Error: unrecognized opcode `csrs sstatus,a7'
   kernel/bpf/syscall.c:2485: Error: unrecognized opcode `csrc sstatus,a7'
   kernel/bpf/syscall.c:2513: Error: unrecognized opcode `csrs sstatus,a0'
   kernel/bpf/syscall.c:2513: Error: unrecognized opcode `csrc sstatus,a0'
>> kernel/bpf/syscall.c:2566: Error: unrecognized opcode `csrs sstatus,a2'
>> kernel/bpf/syscall.c:2566: Error: unrecognized opcode `csrc sstatus,a2'
   kernel/bpf/syscall.c:2491: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/bpf/syscall.c:2491: Error: unrecognized opcode `csrc sstatus,a4'
   kernel/bpf/syscall.c:2518: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/bpf/syscall.c:2518: Error: unrecognized opcode `csrc sstatus,a3'
   kernel/bpf/syscall.c:2642: Error: unrecognized opcode `csrs sstatus,a5'
   kernel/bpf/syscall.c:2642: Error: unrecognized opcode `csrc sstatus,a5'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
--
   In file included from include/linux/bpf_verifier.h:8,
                    from kernel/bpf/verifier.c:12:
   kernel/bpf/verifier.c: In function 'jit_subprogs':
   include/linux/filter.h:346:18: warning: cast between incompatible function types from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     346 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:9072:37: note: in expansion of macro 'BPF_CAST_CALL'
    9072 |                         insn->imm = BPF_CAST_CALL(func[subprog]->bpf_func) -
         |                                     ^~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'fixup_bpf_calls':
   include/linux/filter.h:346:18: warning: cast between incompatible function types from 'void * (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     346 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:9426:45: note: in expansion of macro 'BPF_CAST_CALL'
    9426 |                                 insn->imm = BPF_CAST_CALL(ops->map_lookup_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:346:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *, void *, u64)' {aka 'int (*)(struct bpf_map *, void *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     346 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:9430:45: note: in expansion of macro 'BPF_CAST_CALL'
    9430 |                                 insn->imm = BPF_CAST_CALL(ops->map_update_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:346:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     346 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:9434:45: note: in expansion of macro 'BPF_CAST_CALL'
    9434 |                                 insn->imm = BPF_CAST_CALL(ops->map_delete_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:346:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *, u64)' {aka 'int (*)(struct bpf_map *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     346 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:9438:45: note: in expansion of macro 'BPF_CAST_CALL'
    9438 |                                 insn->imm = BPF_CAST_CALL(ops->map_push_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:346:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     346 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:9442:45: note: in expansion of macro 'BPF_CAST_CALL'
    9442 |                                 insn->imm = BPF_CAST_CALL(ops->map_pop_elem) -
         |                                             ^~~~~~~~~~~~~
   include/linux/filter.h:346:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     346 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:9446:45: note: in expansion of macro 'BPF_CAST_CALL'
    9446 |                                 insn->imm = BPF_CAST_CALL(ops->map_peek_elem) -
         |                                             ^~~~~~~~~~~~~
   kernel/bpf/verifier.c: Assembler messages:
>> kernel/bpf/verifier.c:6764: Error: unrecognized opcode `csrs sstatus,a2'
>> kernel/bpf/verifier.c:6764: Error: unrecognized opcode `csrc sstatus,a2'
   kernel/bpf/verifier.c:6880: Error: unrecognized opcode `csrs sstatus,a2'
   kernel/bpf/verifier.c:6880: Error: unrecognized opcode `csrc sstatus,a2'
--
   kernel/bpf/cgroup.c: Assembler messages:
>> kernel/bpf/cgroup.c:1107: Error: unrecognized opcode `csrs sstatus,a3'
>> kernel/bpf/cgroup.c:1107: Error: unrecognized opcode `csrc sstatus,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   kernel/bpf/cgroup.c:1149: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/bpf/cgroup.c:1149: Error: unrecognized opcode `csrc sstatus,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
--
   arch/riscv/include/asm/irqflags.h: Assembler messages:
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a0,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a1'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a1'
   arch/riscv/include/asm/irqflags.h:28: Error: unrecognized opcode `csrc 0x100,2'
   arch/riscv/include/asm/irqflags.h:28: Error: unrecognized opcode `csrc 0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a1'
   arch/riscv/include/asm/irqflags.h:28: Error: unrecognized opcode `csrc 0x100,2'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a0,0x100,2'
--
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a6,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a6,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a0,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a0'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
..


vim +59 arch/riscv/include/asm/futex.h

b90edb33010bcf Jim Wilson     2018-10-16   37  
b90edb33010bcf Jim Wilson     2018-10-16   38  static inline int
b90edb33010bcf Jim Wilson     2018-10-16   39  arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
b90edb33010bcf Jim Wilson     2018-10-16   40  {
b90edb33010bcf Jim Wilson     2018-10-16   41  	int oldval = 0, ret = 0;
b90edb33010bcf Jim Wilson     2018-10-16   42  
b90edb33010bcf Jim Wilson     2018-10-16   43  	pagefault_disable();
b90edb33010bcf Jim Wilson     2018-10-16   44  
b90edb33010bcf Jim Wilson     2018-10-16   45  	switch (op) {
b90edb33010bcf Jim Wilson     2018-10-16   46  	case FUTEX_OP_SET:
b90edb33010bcf Jim Wilson     2018-10-16   47  		__futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
b90edb33010bcf Jim Wilson     2018-10-16   48  				  ret, oldval, uaddr, oparg);
b90edb33010bcf Jim Wilson     2018-10-16   49  		break;
b90edb33010bcf Jim Wilson     2018-10-16   50  	case FUTEX_OP_ADD:
b90edb33010bcf Jim Wilson     2018-10-16   51  		__futex_atomic_op("amoadd.w.aqrl %[ov],%z[op],%[u]",
b90edb33010bcf Jim Wilson     2018-10-16   52  				  ret, oldval, uaddr, oparg);
b90edb33010bcf Jim Wilson     2018-10-16   53  		break;
b90edb33010bcf Jim Wilson     2018-10-16   54  	case FUTEX_OP_OR:
b90edb33010bcf Jim Wilson     2018-10-16   55  		__futex_atomic_op("amoor.w.aqrl %[ov],%z[op],%[u]",
b90edb33010bcf Jim Wilson     2018-10-16   56  				  ret, oldval, uaddr, oparg);
b90edb33010bcf Jim Wilson     2018-10-16   57  		break;
b90edb33010bcf Jim Wilson     2018-10-16   58  	case FUTEX_OP_ANDN:
b90edb33010bcf Jim Wilson     2018-10-16  @59  		__futex_atomic_op("amoand.w.aqrl %[ov],%z[op],%[u]",
b90edb33010bcf Jim Wilson     2018-10-16   60  				  ret, oldval, uaddr, ~oparg);
b90edb33010bcf Jim Wilson     2018-10-16   61  		break;
b90edb33010bcf Jim Wilson     2018-10-16   62  	case FUTEX_OP_XOR:
b90edb33010bcf Jim Wilson     2018-10-16   63  		__futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
b90edb33010bcf Jim Wilson     2018-10-16   64  				  ret, oldval, uaddr, oparg);
b90edb33010bcf Jim Wilson     2018-10-16   65  		break;
b90edb33010bcf Jim Wilson     2018-10-16   66  	default:
b90edb33010bcf Jim Wilson     2018-10-16   67  		ret = -ENOSYS;
b90edb33010bcf Jim Wilson     2018-10-16   68  	}
b90edb33010bcf Jim Wilson     2018-10-16   69  
b90edb33010bcf Jim Wilson     2018-10-16   70  	pagefault_enable();
b90edb33010bcf Jim Wilson     2018-10-16   71  
b90edb33010bcf Jim Wilson     2018-10-16   72  	if (!ret)
b90edb33010bcf Jim Wilson     2018-10-16   73  		*oval = oldval;
b90edb33010bcf Jim Wilson     2018-10-16   74  
b90edb33010bcf Jim Wilson     2018-10-16   75  	return ret;
b90edb33010bcf Jim Wilson     2018-10-16   76  }
b90edb33010bcf Jim Wilson     2018-10-16   77  
b90edb33010bcf Jim Wilson     2018-10-16   78  static inline int
b90edb33010bcf Jim Wilson     2018-10-16   79  futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
b90edb33010bcf Jim Wilson     2018-10-16   80  			      u32 oldval, u32 newval)
b90edb33010bcf Jim Wilson     2018-10-16   81  {
b90edb33010bcf Jim Wilson     2018-10-16   82  	int ret = 0;
b90edb33010bcf Jim Wilson     2018-10-16   83  	u32 val;
b90edb33010bcf Jim Wilson     2018-10-16   84  	uintptr_t tmp;
b90edb33010bcf Jim Wilson     2018-10-16   85  
96d4f267e40f95 Linus Torvalds 2019-01-03   86  	if (!access_ok(uaddr, sizeof(u32)))
b90edb33010bcf Jim Wilson     2018-10-16   87  		return -EFAULT;
b90edb33010bcf Jim Wilson     2018-10-16   88  
b90edb33010bcf Jim Wilson     2018-10-16  @89  	__enable_user_access();
b90edb33010bcf Jim Wilson     2018-10-16   90  	__asm__ __volatile__ (
b90edb33010bcf Jim Wilson     2018-10-16   91  	"1:	lr.w.aqrl %[v],%[u]			\n"
b90edb33010bcf Jim Wilson     2018-10-16   92  	"	bne %[v],%z[ov],3f			\n"
b90edb33010bcf Jim Wilson     2018-10-16   93  	"2:	sc.w.aqrl %[t],%z[nv],%[u]		\n"
b90edb33010bcf Jim Wilson     2018-10-16   94  	"	bnez %[t],1b				\n"
b90edb33010bcf Jim Wilson     2018-10-16   95  	"3:						\n"
b90edb33010bcf Jim Wilson     2018-10-16   96  	"	.section .fixup,\"ax\"			\n"
b90edb33010bcf Jim Wilson     2018-10-16   97  	"	.balign 4				\n"
b90edb33010bcf Jim Wilson     2018-10-16   98  	"4:	li %[r],%[e]				\n"
b90edb33010bcf Jim Wilson     2018-10-16   99  	"	jump 3b,%[t]				\n"
b90edb33010bcf Jim Wilson     2018-10-16  100  	"	.previous				\n"
b90edb33010bcf Jim Wilson     2018-10-16  101  	"	.section __ex_table,\"a\"		\n"
b90edb33010bcf Jim Wilson     2018-10-16  102  	"	.balign " RISCV_SZPTR "			\n"
b90edb33010bcf Jim Wilson     2018-10-16  103  	"	" RISCV_PTR " 1b, 4b			\n"
b90edb33010bcf Jim Wilson     2018-10-16  104  	"	" RISCV_PTR " 2b, 4b			\n"
b90edb33010bcf Jim Wilson     2018-10-16  105  	"	.previous				\n"
b90edb33010bcf Jim Wilson     2018-10-16  106  	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
b90edb33010bcf Jim Wilson     2018-10-16  107  	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
b90edb33010bcf Jim Wilson     2018-10-16  108  	: "memory");
b90edb33010bcf Jim Wilson     2018-10-16 @109  	__disable_user_access();
b90edb33010bcf Jim Wilson     2018-10-16  110  
b90edb33010bcf Jim Wilson     2018-10-16  111  	*uval = val;
b90edb33010bcf Jim Wilson     2018-10-16  112  	return ret;
b90edb33010bcf Jim Wilson     2018-10-16  113  }
b90edb33010bcf Jim Wilson     2018-10-16  114  

:::::: The code at line 59 was first introduced by commit
:::::: b90edb33010bcfb9a0d74681be2cdd52300f1e69 RISC-V: Add futex support.

:::::: TO: Jim Wilson <jimw@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@sifive.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
