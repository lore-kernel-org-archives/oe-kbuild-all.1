Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446B97E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681373624; x=1712909624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fz55oFw66skOUy802pxtdOf11J+zoosUbI6kvQADUWk=;
  b=S92y4pztCZ6ppnWnNzLsgvOdCYzpJzWJwCF5j+LydJ/xciWrFItLwhPO
   LzTELt02O49Vvue9E4UrTuSC1AQp2IyfbaS9Gp1uFQW6nW7I65pdo0aDk
   Ffy2dr+hkxLQK+Q23NsQJhgi4MBO3gIGU8luR1H4mXVs8cCFogEqV7p26
   iZXY9rbHuy6kX111Xj3t2Y4txSRCnv0GhGWt7mne3VL8c33WmrIpavu4B
   g7PG0PiYQ92CLj6podfbqrhOeom9TiW9pBRcJlSy1cW86WXZ12VDgWmAt
   V5PMTG1IqKAEdxYWersTGfB0TWL+eF2W/C4p46yca8fuhHdZAoQ+zKc3d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346800682"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="346800682"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 01:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666719277"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="666719277"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Apr 2023 01:13:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pms5N-000YVp-0i;
	Thu, 13 Apr 2023 08:13:41 +0000
Date: Thu, 13 Apr 2023 16:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [sean-jc:x86/upm_base_support 15/30]
 include/asm-generic/bug.h:110:41: error: expected expression before ')'
 token
Message-ID: <202304131657.bIKxNs3A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/upm_base_support
head:   9c985077b313ff50af5393d0b2268486b8ac63af
commit: da9b31a7c2b32653d4a27cb5ffedca130d23ad40 [15/30] KVM: Use gfn instead of hva for mmu_notifier_retry
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230413/202304131657.bIKxNs3A-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sean-jc/linux/commit/da9b31a7c2b32653d4a27cb5ffedca130d23ad40
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/upm_base_support
        git checkout da9b31a7c2b32653d4a27cb5ffedca130d23ad40
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131657.bIKxNs3A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/current.h:13,
                    from include/linux/mutex.h:14,
                    from include/linux/kvm_types.h:22,
                    from include/kvm/iodev.h:6,
                    from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:16:
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_mmu_invalidate_end':
>> include/asm-generic/bug.h:110:41: error: expected expression before ')' token
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                         ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:804:9: note: in expansion of macro 'WARN_ON_ONCE'
     804 |         WARN_ON_ONCE()
         |         ^~~~~~~~~~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:811:9: error: expected ';' before 'kvm'
     811 |         kvm->mmu_invalidate_seq++;
         |         ^~~


vim +110 include/asm-generic/bug.h

^1da177e4c3f41 Linus Torvalds   2005-04-16   73  
af9379c7121d55 David Brownell   2009-01-06   74  /*
af9379c7121d55 David Brownell   2009-01-06   75   * WARN(), WARN_ON(), WARN_ON_ONCE, and so on can be used to report
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   76   * significant kernel issues that need prompt attention if they should ever
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   77   * appear at runtime.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   78   *
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   79   * Do not use these macros when checking for invalid external inputs
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   80   * (e.g. invalid system call arguments, or invalid data coming from
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   81   * network/devices), and on transient conditions like ENOMEM or EAGAIN.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   82   * These macros should be used for recoverable kernel issues only.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   83   * For invalid external inputs, transient conditions, etc use
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   84   * pr_err[_once/_ratelimited]() followed by dump_stack(), if necessary.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   85   * Do not include "BUG"/"WARNING" in format strings manually to make these
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   86   * conditions distinguishable from kernel issues.
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   87   *
96c6a32ccb55a3 Dmitry Vyukov    2018-08-21   88   * Use the versions with printk format strings to provide better diagnostics.
af9379c7121d55 David Brownell   2009-01-06   89   */
d4bce140b4e739 Kees Cook        2019-09-25   90  #ifndef __WARN_FLAGS
b9075fa968a0a4 Joe Perches      2011-10-31   91  extern __printf(4, 5)
ee8711336c5170 Kees Cook        2019-09-25   92  void warn_slowpath_fmt(const char *file, const int line, unsigned taint,
b9075fa968a0a4 Joe Perches      2011-10-31   93  		       const char *fmt, ...);
f2f84b05e02b77 Kees Cook        2019-09-25   94  #define __WARN()		__WARN_printf(TAINT_WARN, NULL)
5916d5f9b33473 Thomas Gleixner  2020-03-13   95  #define __WARN_printf(taint, arg...) do {				\
5916d5f9b33473 Thomas Gleixner  2020-03-13   96  		instrumentation_begin();				\
5916d5f9b33473 Thomas Gleixner  2020-03-13   97  		warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);	\
5916d5f9b33473 Thomas Gleixner  2020-03-13   98  		instrumentation_end();					\
5916d5f9b33473 Thomas Gleixner  2020-03-13   99  	} while (0)
a8f18b909c0a3f Arjan van de Ven 2008-07-25  100  #else
a7bed27af194aa Kees Cook        2017-11-17  101  extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
a44f71a9ab99b5 Kees Cook        2019-09-25  102  #define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
d4bce140b4e739 Kees Cook        2019-09-25  103  #define __WARN_printf(taint, arg...) do {				\
5916d5f9b33473 Thomas Gleixner  2020-03-13  104  		instrumentation_begin();				\
d4bce140b4e739 Kees Cook        2019-09-25  105  		__warn_printk(arg);					\
a44f71a9ab99b5 Kees Cook        2019-09-25  106  		__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
5916d5f9b33473 Thomas Gleixner  2020-03-13  107  		instrumentation_end();					\
6b15f678fb7d5e Drew Davenport   2019-07-16  108  	} while (0)
2da1ead4d5f7fa Kees Cook        2019-09-25  109  #define WARN_ON_ONCE(condition) ({				\
2da1ead4d5f7fa Kees Cook        2019-09-25 @110  	int __ret_warn_on = !!(condition);			\
2da1ead4d5f7fa Kees Cook        2019-09-25  111  	if (unlikely(__ret_warn_on))				\
2da1ead4d5f7fa Kees Cook        2019-09-25  112  		__WARN_FLAGS(BUGFLAG_ONCE |			\
2da1ead4d5f7fa Kees Cook        2019-09-25  113  			     BUGFLAG_TAINT(TAINT_WARN));	\
2da1ead4d5f7fa Kees Cook        2019-09-25  114  	unlikely(__ret_warn_on);				\
2da1ead4d5f7fa Kees Cook        2019-09-25  115  })
3a6a62f96f168d Olof Johansson   2008-01-30  116  #endif
3a6a62f96f168d Olof Johansson   2008-01-30  117  

:::::: The code at line 110 was first introduced by commit
:::::: 2da1ead4d5f7fa5f61e5805655de1e245d03a763 bug: consolidate __WARN_FLAGS usage

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
