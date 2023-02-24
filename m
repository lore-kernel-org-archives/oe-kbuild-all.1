Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5067DAD58
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 20:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677268990; x=1708804990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yK0OLOKHTBjVer7SFMeFOCUouvvyebPi2V/Mk1R/2rk=;
  b=AfaIQEu7rAIcMsELPpoObpYoqWISyxf/smxF4PYXIErG3dZ89nPMsOYc
   5jCvYlEry5zChOdIehsn/nUPypi5bG05AnISUEqL+EnEeYSRnfNv74Ebw
   aDHW6GTN30WNGIZp4SSZu75DgscrcDn93zY13FaeuZvVvYwrOW9euspYX
   kp7ZjXGelXuC4Ex8jimN0RnvcO+V7lmIdEtJxHANkbCZMNjrRuiekzn+/
   ZhfYU7pN4qaPFAM6bQfBbcQSjnMMwNN/ZT+EGeWGwU60rvb6YYq1gk5qM
   YqoX8BhQj8m22GzXoV/jka8GuO+O4TsVLSHUGnyDfwhH23MURScgvwUR7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="321771027"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="321771027"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 12:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="741764528"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="741764528"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2023 12:03:07 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVeHa-0002hb-0z;
	Fri, 24 Feb 2023 20:03:06 +0000
Date: Sat, 25 Feb 2023 04:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <nmi@metaspace.dk>, linux-block@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Andreas Hindborg <nmi@metaspace.dk>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] block: ublk: enable zoned storage support
Message-ID: <202302250349.1eKfsTvO-lkp@intel.com>
References: <20230224125950.214779-1-nmi@metaspace.dk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224125950.214779-1-nmi@metaspace.dk>

Hi Andreas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v6.2]
[cannot apply to axboe-block/for-next linus/master next-20230224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Hindborg/block-ublk-enable-zoned-storage-support/20230224-210205
patch link:    https://lore.kernel.org/r/20230224125950.214779-1-nmi%40metaspace.dk
patch subject: [PATCH] block: ublk: enable zoned storage support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230225/202302250349.1eKfsTvO-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6d088fc1b115a63e8888b12fa47aabd45be97460
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andreas-Hindborg/block-ublk-enable-zoned-storage-support/20230224-210205
        git checkout 6d088fc1b115a63e8888b12fa47aabd45be97460
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250349.1eKfsTvO-lkp@intel.com/

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
   mips-linux-ld: drivers/block/ublk_drv.o: in function `ublk_dev_param_basic_apply':
>> ublk_drv.c:(.text.ublk_dev_param_basic_apply+0x2d8): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
