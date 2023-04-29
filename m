Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D595672
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 19:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682795052; x=1714331052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mcZBr/vLPhCrs8Cn+BNHkLbjRA9LEa6/Vz2iwYywmQ8=;
  b=UVO8dr+oBnN/T2NWjtPraS5QNfiu+45HoU98aLZg5d5GulfhOP1lVxtT
   rR31zR/14JvoBLaIcbDhan4ZushSn8WvRJzBV0vVQwaGwKoqEZwTiWL66
   wR3P/2U+uOwfZfXzFCTnPnrnAQu+p1bRqtbqZ+skmOZPT8NXa5NZKqkaV
   swn5NB4bw+MgzHytB3oymJcTLLvKYuA2d0QlW3bzaU0OOKnLQ7c8I51hT
   3RlGZy9t5afefYrC3mjcOPxGq6eF9Tdk1HGrRkqGaZqdheyz6iEuTkGU5
   JGwipKPwmEs2TlSS+bKnF9RJNbBRYTq8wYsJ0IyUi2RJy/HxVBg35i7Vx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="345422896"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="345422896"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 12:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="806888730"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="806888730"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2023 12:04:10 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pspre-0001JH-1K;
	Sat, 29 Apr 2023 19:04:10 +0000
Date: Sun, 30 Apr 2023 03:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 290/395] kernel/sched/smp.h:14:20: error: redefinition
 of 'flush_smp_call_function_queue'
Message-ID: <202304300332.YMVyKFMV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   6a80d978aa1f981122f7478fedea389aa9475f9d
commit: 7b3d43238e0fd4a97c85581d819604e81ff0b585 [290/395] sched/alt: [Sync] 16bf5a5e1ec5 smp: Rename flush_smp_call_function_from_idle()
config: hexagon-randconfig-r041-20230430 (https://download.01.org/0day-ci/archive/20230430/202304300332.YMVyKFMV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/7b3d43238e0fd4a97c85581d819604e81ff0b585
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 7b3d43238e0fd4a97c85581d819604e81ff0b585
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304300332.YMVyKFMV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from kernel/sched/build_policy.c:35:
>> kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
   static inline void flush_smp_call_function_queue(void) { }
                      ^
   kernel/sched/alt_sched.h:296:20: note: previous definition is here
   static inline void flush_smp_call_function_queue(void) { }
                      ^
   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/idle.c:56:2: error: call to undeclared function 'ct_idle_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ct_idle_enter();
           ^
   kernel/sched/idle.c:56:2: note: did you mean 'cpuidle_enter'?
   include/linux/cpuidle.h:183:19: note: 'cpuidle_enter' declared here
   static inline int cpuidle_enter(struct cpuidle_driver *drv,
                     ^
   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/idle.c:63:2: error: call to undeclared function 'ct_idle_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ct_idle_exit();
           ^
   kernel/sched/idle.c:63:2: note: did you mean 'ct_irq_exit'?
   include/linux/context_tracking_irq.h:14:20: note: 'ct_irq_exit' declared here
   static inline void ct_irq_exit(void) { }
                      ^
   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/idle.c:106:3: error: call to undeclared function 'ct_idle_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ct_idle_enter();
                   ^
   kernel/sched/idle.c:119:3: error: call to undeclared function 'ct_idle_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ct_idle_exit();
                   ^
   6 warnings and 5 errors generated.


vim +/flush_smp_call_function_queue +14 kernel/sched/smp.h

d664e399128bd7 Thomas Gleixner 2022-04-13  10  
d664e399128bd7 Thomas Gleixner 2022-04-13  11  #ifdef CONFIG_SMP
16bf5a5e1ec564 Thomas Gleixner 2022-04-13  12  extern void flush_smp_call_function_queue(void);
d664e399128bd7 Thomas Gleixner 2022-04-13  13  #else
16bf5a5e1ec564 Thomas Gleixner 2022-04-13 @14  static inline void flush_smp_call_function_queue(void) { }

:::::: The code at line 14 was first introduced by commit
:::::: 16bf5a5e1ec56474ed2a19d72f272ed09a5d3ea1 smp: Rename flush_smp_call_function_from_idle()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
