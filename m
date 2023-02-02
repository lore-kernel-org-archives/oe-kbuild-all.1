Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4088A7E8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675334132; x=1706870132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hu9wHKImVDD/N+OSz93SDa04Jw0rQ+OvnWcDR1zvw48=;
  b=XH/AbxB605BjVPzlK76tQHc2ITqba8GNU4OiWSvK5X4QgbDED26PBsrO
   8Hf/kf7iG2xWJKo6Yfp3ESpv6OXG/br99jhW7/jh2yACXWhchX/yxEbNz
   bY/cRq1S0JnbJ/atCB3+yQjc5Per9TsgEaHJsv5oXotw/22mhkN2fkYIu
   1ySG1SQrA7qyH4OBKlUcFPcarJd7djWSVLE2wlySC97NeNV/iR4iuK42V
   P49F87AL4bO0X8820dB6BP3Xa06SWN7O0kJF/IVrJ3pLybUQwQKlb36L0
   tM4ojNDaBC1hreRHRMlstTQ64TjA5AAwmW5fAgz0LFIzn/RnhZwD5iecp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="392994770"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="392994770"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 02:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="733888870"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="733888870"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 02:35:30 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNWw8-0006QM-1M;
	Thu, 02 Feb 2023 10:35:24 +0000
Date: Thu, 2 Feb 2023 18:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 240/258]
 arch/arm64/kvm/hyp/nvhe/serial.c:41:6: warning: no previous prototype for
 'hyp_puts'
Message-ID: <202302021811.PakRA4XL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b2487c5b2bdbac887caa086038f90c88f31f30af
commit: b21ae4963d0d204a1405c4aedd76eb01cd79dfdd [240/258] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-buildonly-randconfig-r005-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021811.PakRA4XL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout b21ae4963d0d204a1405c4aedd76eb01cd79dfdd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/serial.c:41:6: warning: no previous prototype for 'hyp_puts' [-Wmissing-prototypes]
      41 | void hyp_puts(const char *s)
         |      ^~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:53:6: warning: no previous prototype for 'hyp_putx64' [-Wmissing-prototypes]
      53 | void hyp_putx64(u64 x)
         |      ^~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:59:6: warning: no previous prototype for 'hyp_putc' [-Wmissing-prototypes]
      59 | void hyp_putc(char c)
         |      ^~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:65:5: warning: no previous prototype for '__pkvm_register_serial_driver' [-Wmissing-prototypes]
      65 | int __pkvm_register_serial_driver(void (*cb)(char))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
