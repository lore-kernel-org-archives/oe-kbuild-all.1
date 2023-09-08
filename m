Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C4F517
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694188094; x=1725724094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kL/BstKUFDhI5Gxh7T34W0iuUvb5FN4aCY/Zd5PGLAE=;
  b=nYmljEpuuT2ELn3C2YCu+PzcBVJOziM7HPbK/x3xavjGL5D08TIHv7ef
   VwSOVopAmE7SxIeTr7VWWmFS/Tf6k+E20hjtorJePudfusYpyjkFNI7Yg
   xdTJddQEP8a46kYAYT5hNaC6aRLsHOcJidIYqP+Gfnr04iW24oufM6nmB
   lgxLzZ0kPH276uRBCUjFxH7CcHnfXdWVKT7fczbL6UyGZSv+gSToTK241
   jWvQ55Jl94VxpM/DNQwH7j0hKVce6crmXyXCJ7oYtTOttuJqIDPViqyp3
   YB/ww7CMBfJEimaYwlvdqlMmp0XMjKm/rugTgANu1g/Q6yhU/hV/O9A6T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="444113413"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="444113413"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 08:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="719194427"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="719194427"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Sep 2023 08:48:12 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qediM-0002PP-2S;
	Fri, 08 Sep 2023 15:48:10 +0000
Date: Fri, 8 Sep 2023 23:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 240/258]
 arch/arm64/kvm/hyp/nvhe/serial.c:41:6: warning: no previous prototype for
 function 'hyp_puts'
Message-ID: <202309082322.BULCgRwR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   a68bd014933d54623838ac1c07fd725694631e53
commit: b21ae4963d0d204a1405c4aedd76eb01cd79dfdd [240/258] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-randconfig-r013-20230908 (https://download.01.org/0day-ci/archive/20230908/202309082322.BULCgRwR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309082322.BULCgRwR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309082322.BULCgRwR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/serial.c:41:6: warning: no previous prototype for function 'hyp_puts' [-Wmissing-prototypes]
      41 | void hyp_puts(const char *s)
         |      ^
   arch/arm64/kvm/hyp/nvhe/serial.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | void hyp_puts(const char *s)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/serial.c:53:6: warning: no previous prototype for function 'hyp_putx64' [-Wmissing-prototypes]
      53 | void hyp_putx64(u64 x)
         |      ^
   arch/arm64/kvm/hyp/nvhe/serial.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | void hyp_putx64(u64 x)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/serial.c:59:6: warning: no previous prototype for function 'hyp_putc' [-Wmissing-prototypes]
      59 | void hyp_putc(char c)
         |      ^
   arch/arm64/kvm/hyp/nvhe/serial.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      59 | void hyp_putc(char c)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/serial.c:65:5: warning: no previous prototype for function '__pkvm_register_serial_driver' [-Wmissing-prototypes]
      65 | int __pkvm_register_serial_driver(void (*cb)(char))
         |     ^
   arch/arm64/kvm/hyp/nvhe/serial.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      65 | int __pkvm_register_serial_driver(void (*cb)(char))
         | ^
         | static 
   4 warnings generated.


vim +/hyp_puts +41 arch/arm64/kvm/hyp/nvhe/serial.c

    40	
  > 41	void hyp_puts(const char *s)
    42	{
    43		if (!hyp_serial_enabled())
    44			return;
    45	
    46		while (*s)
    47			__hyp_putc(*s++);
    48	
    49		__hyp_putc('\n');
    50		__hyp_putc('\r');
    51	}
    52	
  > 53	void hyp_putx64(u64 x)
    54	{
    55		if (hyp_serial_enabled())
    56			__hyp_putx4n(x, 64);
    57	}
    58	
  > 59	void hyp_putc(char c)
    60	{
    61		if (hyp_serial_enabled())
    62			__hyp_putc(c);
    63	}
    64	
  > 65	int __pkvm_register_serial_driver(void (*cb)(char))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
