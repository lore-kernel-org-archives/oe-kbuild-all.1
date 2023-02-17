Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D7376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 03:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676605805; x=1708141805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O+c6MjNUQXeadDzpM+t8VgVjrw7GBTRFLweCYRCA8HY=;
  b=QBqfC7MgWV8ROHk/QrGQyw8O+7eZ3EjWi7oOkXl1TvhHcXAscWwpWAZq
   +iZ+Ib6sbSYYd1UzjQM3gWEoW/7TjfJ+VeaMz6zwnZI9Agm8z0bM21dZs
   yzj5tYaD9rp5/ywG7V7e7V7zcOwXWrYjPRUEPTO+3otGMh17VTOUvLDng
   yypGQpPsIxhX//5O9MYV/YzMCJLavPlHYeJqUS0NWpYAfvg2wbZXOChmG
   kLW3DBXhuioPiSOLdS1vVN4Yp/ba1nFZczdpQxzYZt8bJCKBBvNEUNzrR
   beXzZ52lfq4rwCw9AC5ubX+p9g5mV+p16lGFUh1pFdrqMT4RGvBG/vUQk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331903910"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="331903910"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 19:50:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915946649"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="915946649"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Feb 2023 19:49:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSrl0-000B5h-01;
	Fri, 17 Feb 2023 03:49:58 +0000
Date: Fri, 17 Feb 2023 11:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jingbo Xu <jefflexu@linux.alibaba.com>, xiang@kernel.or,
	chao@kernel.org, huyue2@coolpad.com, linux-erofs@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] erofs: convert hardcoded blocksize to sb->s_blocksize
Message-ID: <202302171143.RmhVCgqe-lkp@intel.com>
References: <20230216094745.47868-1-jefflexu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216094745.47868-1-jefflexu@linux.alibaba.com>

Hi Jingbo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on xiang-erofs/dev-test]
[also build test ERROR on xiang-erofs/dev next-20230216]
[cannot apply to xiang-erofs/fixes linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingbo-Xu/erofs-set-block-size-to-the-on-disk-block-size/20230216-175045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20230216094745.47868-1-jefflexu%40linux.alibaba.com
patch subject: [PATCH 1/2] erofs: convert hardcoded blocksize to sb->s_blocksize
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230217/202302171143.RmhVCgqe-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/30b09ec3be57f3777d22e71d2d4e5ec70d9227f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jingbo-Xu/erofs-set-block-size-to-the-on-disk-block-size/20230216-175045
        git checkout 30b09ec3be57f3777d22e71d2d4e5ec70d9227f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171143.RmhVCgqe-lkp@intel.com/

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
   mips-linux-ld: fs/erofs/data.o: in function `erofs_map_blocks_flatmode.constprop.0':
>> data.c:(.text.erofs_map_blocks_flatmode.constprop.0+0x118): undefined reference to `__divdi3'
   mips-linux-ld: fs/erofs/namei.o: in function `erofs_find_target_block.constprop.0':
>> namei.c:(.text.erofs_find_target_block.constprop.0+0xf8): undefined reference to `__divdi3'
   mips-linux-ld: fs/erofs/zmap.o: in function `compacted_load_cluster_from_disk':
>> zmap.c:(.text.compacted_load_cluster_from_disk+0x224): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
