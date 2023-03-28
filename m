Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787548BE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680017479; x=1711553479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WE42II75vVKCmBLB2rtbV59aUWg+eA2WJ+c6lcHtGns=;
  b=BcP7sp/B7bOO9c2U2ZUfS3UEOlX78yOZtYaZ4MjURiIjL6ZY6PVEzg74
   Z7XnhetfkdSDATZ8TRzPqUCkKQA22tK+0mnYpJjbtCwpE40zq5HWq69IA
   ugZBt0kmxtlnsWo4jLAmMSw7wn3Vt075KF/iikSr3r7tdGADxeTSHg26e
   fnIxmpLAmzq5uHaMCf5UdVKJCtbG0sdnhtZEDdICXbTAtmYAQ/wpGOiur
   WkS11rhb5vVf4Z9pCPJ8ZOTodafWY2LmPKRYwyzfIFgohCyJ7xuRB9Q/7
   AY6JJifEle6TQzWHXAp8Ul4nOhb31cS2yINGp/ELo/8Ek1VSLkn6uQdzJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405540626"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="405540626"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 08:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773183567"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="773183567"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2023 08:31:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phBHx-000Iel-2D;
	Tue, 28 Mar 2023 15:31:09 +0000
Date: Tue, 28 Mar 2023 23:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.4 53/58] arch/riscv/kernel/head.S:55:
 Error: unrecognized opcode `csrw 0x104,zero'
Message-ID: <202303282359.tiuafpnd-lkp@intel.com>
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
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230328/202303282359.tiuafpnd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/ arch/riscv/lib/ arch/riscv/mm/ drivers/char/ drivers/clocksource/ kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303282359.tiuafpnd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/head.S: Assembler messages:
>> arch/riscv/kernel/head.S:55: Error: unrecognized opcode `csrw 0x104,zero'
   arch/riscv/kernel/head.S:56: Error: unrecognized opcode `csrw 0x144,zero'
>> arch/riscv/kernel/head.S:69: Error: unrecognized opcode `csrc 0x100,t0'
>> arch/riscv/kernel/head.S:124: Error: unrecognized opcode `csrw 0x105,a2'
>> arch/riscv/kernel/head.S:141: Error: unrecognized opcode `csrw 0x180,a0'
   arch/riscv/kernel/head.S:146: Error: unrecognized opcode `csrw 0x105,a0'
   arch/riscv/kernel/head.S:160: Error: unrecognized opcode `csrw 0x180,a2'
--
   arch/riscv/kernel/entry.S: Assembler messages:
>> arch/riscv/kernel/entry.S:163: Error: unrecognized opcode `csrrw tp,0x140,tp'
>> arch/riscv/kernel/entry.S:163: Error: unrecognized opcode `csrr tp,0x140'
>> arch/riscv/kernel/entry.S:163: Error: unrecognized opcode `csrrc s1,0x100,t0'
>> arch/riscv/kernel/entry.S:163: Error: unrecognized opcode `csrr s2,0x141'
>> arch/riscv/kernel/entry.S:163: Error: unrecognized opcode `csrr s3,0x143'
>> arch/riscv/kernel/entry.S:163: Error: unrecognized opcode `csrr s4,0x142'
>> arch/riscv/kernel/entry.S:163: Error: unrecognized opcode `csrr s5,0x140'
>> arch/riscv/kernel/entry.S:169: Error: unrecognized opcode `csrw 0x140,x0'
>> arch/riscv/kernel/entry.S:192: Error: unrecognized opcode `csrs 0x100,0x00000002'
>> arch/riscv/kernel/entry.S:248: Error: unrecognized opcode `csrc 0x100,0x00000002'
>> arch/riscv/kernel/entry.S:266: Error: unrecognized opcode `csrw 0x140,tp'
>> arch/riscv/kernel/entry.S:269: Error: unrecognized opcode `csrw 0x100,a0'
>> arch/riscv/kernel/entry.S:269: Error: unrecognized opcode `csrw 0x141,a2'
   arch/riscv/kernel/entry.S:290: Error: unrecognized opcode `csrs 0x100,0x00000002'
--
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:28: Error: unrecognized opcode `csrc 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
>> arch/riscv/kernel/traps.c:160: Error: unrecognized opcode `csrw 0x140,0'
>> arch/riscv/kernel/traps.c:162: Error: unrecognized opcode `csrw 0x105,a5'
   arch/riscv/kernel/traps.c:164: Error: unrecognized opcode `csrw 0x104,a5'
--
   arch/riscv/mm/init.c: Assembler messages:
>> arch/riscv/mm/init.c:449: Error: unrecognized opcode `csrw 0x180,a5'
--
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
>> arch/riscv/mm/fault.c:235: Error: unrecognized opcode `csrr a3,0x180'
--
   arch/riscv/mm/context.c: Assembler messages:
>> arch/riscv/mm/context.c:61: Error: unrecognized opcode `csrw 0x180,a5'
--
   arch/riscv/include/asm/irqflags.h: Assembler messages:
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a5,0xc01'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a5,0xc01'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a5,0xc01'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a5,0xc01'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s5,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s5'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a5'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a0,0xc01'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   drivers/char/random.c:1320: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/char/random.c:1320: Error: unrecognized opcode `csrc sstatus,a3'
   drivers/char/random.c:1340: Error: unrecognized opcode `csrs sstatus,a4'
   drivers/char/random.c:1340: Error: unrecognized opcode `csrc sstatus,a4'
   drivers/char/random.c:1344: Error: unrecognized opcode `csrs sstatus,a4'
   drivers/char/random.c:1344: Error: unrecognized opcode `csrc sstatus,a4'
   drivers/char/random.c:1326: Error: unrecognized opcode `csrs sstatus,a4'
   drivers/char/random.c:1326: Error: unrecognized opcode `csrc sstatus,a4'
   arch/riscv/include/asm/irqflags.h:28: Error: unrecognized opcode `csrc 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a5,0xc01'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a4,0xc01'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a5,0xc01'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a5,0xc01'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
   arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a5,0xc01'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
   arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a0,0xc01'
--
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:28: Error: unrecognized opcode `csrc 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:28: Error: unrecognized opcode `csrc 0x100,2'
   arch/riscv/include/asm/irqflags.h:22: Error: unrecognized opcode `csrs 0x100,2'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a5,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a5'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a4,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a4'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s2'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
--
   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s4'
   arch/riscv/include/asm/irqflags.h:28: Error: unrecognized opcode `csrc 0x100,2'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s3'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc a5,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a3'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
--
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,a5'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s6,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s6'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s6'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s6'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
>> arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s0,0x100,2'
>> arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s0'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s2,0x100,2'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s3'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s2'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s3,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s3'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s1,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s1'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s2,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s2'
   arch/riscv/include/asm/irqflags.h:34: Error: unrecognized opcode `csrrc s5,0x100,2'
   arch/riscv/include/asm/irqflags.h:52: Error: unrecognized opcode `csrs 0x100,s5'
--
   drivers/clocksource/timer-riscv.c: Assembler messages:
>> drivers/clocksource/timer-riscv.c:22: Error: unrecognized opcode `csrs sie,a5'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a5,0xc01'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a0,0xc01'
>> arch/riscv/include/asm/timex.h:15: Error: unrecognized opcode `csrr a0,0xc01'
>> drivers/clocksource/timer-riscv.c:70: Error: unrecognized opcode `csrc sie,a5'
   drivers/clocksource/timer-riscv.c:64: Error: unrecognized opcode `csrs sie,a5'
   drivers/clocksource/timer-riscv.c:79: Error: unrecognized opcode `csrc sie,a5'
..


vim +55 arch/riscv/kernel/head.S

76d2a0493a17d4 Palmer Dabbelt    2017-07-10   15  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   16  __INIT
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   17  ENTRY(_start)
0f327f2aaad6a8 Atish Patra       2019-06-06   18  	/*
0f327f2aaad6a8 Atish Patra       2019-06-06   19  	 * Image header expected by Linux boot-loaders. The image header data
0f327f2aaad6a8 Atish Patra       2019-06-06   20  	 * structure is described in asm/image.h.
0f327f2aaad6a8 Atish Patra       2019-06-06   21  	 * Do not modify it without modifying the structure and all bootloaders
0f327f2aaad6a8 Atish Patra       2019-06-06   22  	 * that expects this header format!!
0f327f2aaad6a8 Atish Patra       2019-06-06   23  	 */
0f327f2aaad6a8 Atish Patra       2019-06-06   24  	/* jump to start kernel */
0f327f2aaad6a8 Atish Patra       2019-06-06   25  	j _start_kernel
0f327f2aaad6a8 Atish Patra       2019-06-06   26  	/* reserved */
0f327f2aaad6a8 Atish Patra       2019-06-06   27  	.word 0
0f327f2aaad6a8 Atish Patra       2019-06-06   28  	.balign 8
37a048d790c318 Sean Anderson     2020-10-22   29  #ifdef CONFIG_RISCV_M_MODE
37a048d790c318 Sean Anderson     2020-10-22   30  	/* Image load offset (0MB) from start of RAM for M-mode */
37a048d790c318 Sean Anderson     2020-10-22   31  	.dword 0
37a048d790c318 Sean Anderson     2020-10-22   32  #else
0f327f2aaad6a8 Atish Patra       2019-06-06   33  #if __riscv_xlen == 64
0f327f2aaad6a8 Atish Patra       2019-06-06   34  	/* Image load offset(2MB) from start of RAM */
0f327f2aaad6a8 Atish Patra       2019-06-06   35  	.dword 0x200000
0f327f2aaad6a8 Atish Patra       2019-06-06   36  #else
0f327f2aaad6a8 Atish Patra       2019-06-06   37  	/* Image load offset(4MB) from start of RAM */
0f327f2aaad6a8 Atish Patra       2019-06-06   38  	.dword 0x400000
37a048d790c318 Sean Anderson     2020-10-22   39  #endif
0f327f2aaad6a8 Atish Patra       2019-06-06   40  #endif
0f327f2aaad6a8 Atish Patra       2019-06-06   41  	/* Effective size of kernel image */
0f327f2aaad6a8 Atish Patra       2019-06-06   42  	.dword _end - _start
0f327f2aaad6a8 Atish Patra       2019-06-06   43  	.dword __HEAD_FLAGS
0f327f2aaad6a8 Atish Patra       2019-06-06   44  	.word RISCV_HEADER_VERSION
0f327f2aaad6a8 Atish Patra       2019-06-06   45  	.word 0
0f327f2aaad6a8 Atish Patra       2019-06-06   46  	.dword 0
474efecb65dceb Paul Walmsley     2019-09-13   47  	.ascii RISCV_IMAGE_MAGIC
0f327f2aaad6a8 Atish Patra       2019-06-06   48  	.balign 4
474efecb65dceb Paul Walmsley     2019-09-13   49  	.ascii RISCV_IMAGE_MAGIC2
0f327f2aaad6a8 Atish Patra       2019-06-06   50  	.word 0
0f327f2aaad6a8 Atish Patra       2019-06-06   51  
0f327f2aaad6a8 Atish Patra       2019-06-06   52  .global _start_kernel
0f327f2aaad6a8 Atish Patra       2019-06-06   53  _start_kernel:
a3182c91ef4e7d Anup Patel        2019-04-25   54  	/* Mask all interrupts */
a3182c91ef4e7d Anup Patel        2019-04-25  @55  	csrw CSR_SIE, zero
a3182c91ef4e7d Anup Patel        2019-04-25   56  	csrw CSR_SIP, zero
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   57  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   58  	/* Load the global pointer */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   59  .option push
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   60  .option norelax
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   61  	la gp, __global_pointer$
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   62  .option pop
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   63  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   64  	/*
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   65  	 * Disable FPU to detect illegal usage of
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   66  	 * floating point in kernel space
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   67  	 */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   68  	li t0, SR_FS
4f3f90084673fa Bin Meng          2019-08-07  @69  	csrc CSR_SSTATUS, t0
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   70  
b47613da3b71ca Xiang Wang        2019-09-06   71  #ifdef CONFIG_SMP
b47613da3b71ca Xiang Wang        2019-09-06   72  	li t0, CONFIG_NR_CPUS
b47613da3b71ca Xiang Wang        2019-09-06   73  	bgeu a0, t0, .Lsecondary_park
b47613da3b71ca Xiang Wang        2019-09-06   74  #endif
b47613da3b71ca Xiang Wang        2019-09-06   75  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   76  	/* Pick one hart to run the main boot sequence */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   77  	la a3, hart_lottery
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   78  	li a2, 1
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   79  	amoadd.w a3, a2, (a3)
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   80  	bnez a3, .Lsecondary_start
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   81  
c0fbcd9918607e Anup Patel        2018-11-12   82  	/* Clear BSS for flat non-ELF images */
c0fbcd9918607e Anup Patel        2018-11-12   83  	la a3, __bss_start
c0fbcd9918607e Anup Patel        2018-11-12   84  	la a4, __bss_stop
c0fbcd9918607e Anup Patel        2018-11-12   85  	ble a4, a3, clear_bss_done
c0fbcd9918607e Anup Patel        2018-11-12   86  clear_bss:
c0fbcd9918607e Anup Patel        2018-11-12   87  	REG_S zero, (a3)
c0fbcd9918607e Anup Patel        2018-11-12   88  	add a3, a3, RISCV_SZPTR
c0fbcd9918607e Anup Patel        2018-11-12   89  	blt a3, a4, clear_bss
c0fbcd9918607e Anup Patel        2018-11-12   90  clear_bss_done:
c0fbcd9918607e Anup Patel        2018-11-12   91  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   92  	/* Save hart ID and DTB physical address */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   93  	mv s0, a0
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   94  	mv s1, a1
f99fb607fb2bc0 Atish Patra       2018-10-02   95  	la a2, boot_cpu_hartid
f99fb607fb2bc0 Atish Patra       2018-10-02   96  	REG_S a0, (a2)
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   97  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   98  	/* Initialize page tables and relocate to virtual addresses */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10   99  	la sp, init_thread_union + THREAD_SIZE
671f9a3e2e24cd Anup Patel        2019-06-28  100  	mv a0, s1
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  101  	call setup_vm
671f9a3e2e24cd Anup Patel        2019-06-28  102  	la a0, early_pg_dir
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  103  	call relocate
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  104  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  105  	/* Restore C environment */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  106  	la tp, init_task
f99fb607fb2bc0 Atish Patra       2018-10-02  107  	sw zero, TASK_TI_CPU(tp)
c637b911e06697 Christoph Hellwig 2019-04-15  108  	la sp, init_thread_union + THREAD_SIZE
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  109  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  110  	/* Start the kernel */
8b08f50152ff85 Michael Clark     2018-02-16  111  	call parse_dtb
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  112  	tail start_kernel
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  113  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  114  relocate:
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  115  	/* Relocate return address */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  116  	li a1, PAGE_OFFSET
671f9a3e2e24cd Anup Patel        2019-06-28  117  	la a2, _start
671f9a3e2e24cd Anup Patel        2019-06-28  118  	sub a1, a1, a2
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  119  	add ra, ra, a1
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  120  
7549cdf59d9faf Christoph Hellwig 2018-01-09  121  	/* Point stvec to virtual address of intruction after satp write */
671f9a3e2e24cd Anup Patel        2019-06-28  122  	la a2, 1f
671f9a3e2e24cd Anup Patel        2019-06-28  123  	add a2, a2, a1
671f9a3e2e24cd Anup Patel        2019-06-28 @124  	csrw CSR_STVEC, a2
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  125  
7549cdf59d9faf Christoph Hellwig 2018-01-09  126  	/* Compute satp for kernel page tables, but don't load it yet */
671f9a3e2e24cd Anup Patel        2019-06-28  127  	srl a2, a0, PAGE_SHIFT
7549cdf59d9faf Christoph Hellwig 2018-01-09  128  	li a1, SATP_MODE
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  129  	or a2, a2, a1
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  130  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  131  	/*
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  132  	 * Load trampoline page directory, which will cause us to trap to
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  133  	 * stvec if VA != PA, or simply fall through if VA == PA.  We need a
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  134  	 * full fence here because setup_vm() just wrote these PTEs and we need
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  135  	 * to ensure the new translations are in use.
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  136  	 */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  137  	la a0, trampoline_pg_dir
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  138  	srl a0, a0, PAGE_SHIFT
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  139  	or a0, a0, a1
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  140  	sfence.vma
a3182c91ef4e7d Anup Patel        2019-04-25 @141  	csrw CSR_SATP, a0
94f592f0e5b9c1 Zong Li           2018-08-02  142  .align 2
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  143  1:
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  144  	/* Set trap vector to spin forever to help debug */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  145  	la a0, .Lsecondary_park
a3182c91ef4e7d Anup Patel        2019-04-25  146  	csrw CSR_STVEC, a0
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  147  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  148  	/* Reload the global pointer */
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  149  .option push
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  150  .option norelax
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  151  	la gp, __global_pointer$
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  152  .option pop
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  153  
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  154  	/*
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  155  	 * Switch to kernel page tables.  A full fence is necessary in order to
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  156  	 * avoid using the trampoline translations, which are only correct for
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  157  	 * the first superpage.  Fetching the fence is guarnteed to work
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  158  	 * because that first superpage is translated the same way.
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  159  	 */
a3182c91ef4e7d Anup Patel        2019-04-25  160  	csrw CSR_SATP, a2
4c3aeb82a0f461 Palmer Dabbelt    2019-03-26  161  	sfence.vma
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  162  
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  163  	ret
76d2a0493a17d4 Palmer Dabbelt    2017-07-10  164  

:::::: The code at line 55 was first introduced by commit
:::::: a3182c91ef4e7dda90ff080a4132efd3ecb8786a RISC-V: Access CSRs using CSR numbers

:::::: TO: Anup Patel <Anup.Patel@wdc.com>
:::::: CC: Palmer Dabbelt <palmer@sifive.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
