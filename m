Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093A847B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677775240; x=1709311240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ddpeYcd3jay+u6BOc2MfT/dx3rtowzXoAJkEj3v7qeY=;
  b=ndF/QgMV0g4xk1mDfmk8d/qkNoSusVzxwVznolv5NTARM83hBgKRJ9bh
   ezpAlRBP4CR5+LvhBBBvEv+Grkmb4iIn6whIuC7RHVsSCXE4RCAcyTYf+
   7pItPy1DE0SeqEUAPfEhS8GDXmnCvMG6GjiZl+EsoL8UfX0IzZfGgumrt
   aNlpZUEbDcCoYeq+4Yu7J9kt/9s6VwtJcnmt6oaC+y+RkUEYFmdzIFYdE
   VpiTVhjuvFQYVm6kIgGqs5zcAuZvpS79sUc1w8Ny6B/whD6HNvyOdiOGb
   e4kG/ctwAZfX2BTfv6RfCBdKcMQHLPcatzMvVZHSNq9hEQ4CcjaQBM05x
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397362796"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="397362796"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 08:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="798896500"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="798896500"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 08:40:22 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXlyf-0000fE-0K;
	Thu, 02 Mar 2023 16:40:21 +0000
Date: Fri, 3 Mar 2023 00:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-gfx@lists.freedesktop.org,
	Christian Koenig <christian.koenig@amd.com>,
	intel-xe@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH RESEND] drm/tests: Suballocator test
Message-ID: <202303030056.CNeZGRQR-lkp@intel.com>
References: <20230302083422.76608-1-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302083422.76608-1-thomas.hellstrom@linux.intel.com>

Hi Thomas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-tests-Suballocator-test/20230302-163704
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230302083422.76608-1-thomas.hellstrom%40linux.intel.com
patch subject: [Intel-gfx] [PATCH RESEND] drm/tests: Suballocator test
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303030056.CNeZGRQR-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e970911bccf3145b76cd755e2d78c0c0f7f22ca1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-tests-Suballocator-test/20230302-163704
        git checkout e970911bccf3145b76cd755e2d78c0c0f7f22ca1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030056.CNeZGRQR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
   (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x234): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x254): additional relocation overflows omitted from the output
   mips-linux-ld: drivers/gpu/drm/tests/drm_suballoc_test.o: in function `drm_test_suballoc':
>> drm_suballoc_test.c:(.text.drm_test_suballoc+0xcbc): undefined reference to `__udivdi3'
>> mips-linux-ld: drm_suballoc_test.c:(.text.drm_test_suballoc+0xd20): undefined reference to `__udivdi3'
   mips-linux-ld: drm_suballoc_test.c:(.text.drm_test_suballoc+0xd84): undefined reference to `__udivdi3'
   mips-linux-ld: drm_suballoc_test.c:(.text.drm_test_suballoc+0xde8): undefined reference to `__udivdi3'
   mips-linux-ld: drm_suballoc_test.c:(.text.drm_test_suballoc+0xe40): undefined reference to `__udivdi3'
   mips-linux-ld: drivers/gpu/drm/tests/drm_suballoc_test.o:drm_suballoc_test.c:(.text.drm_test_suballoc+0xfb4): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
