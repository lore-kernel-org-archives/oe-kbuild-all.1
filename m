Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737DB742E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 11:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685099370; x=1716635370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QecnW388avL7Pw9D3QBay5Iy0l93Su27eeLgRVARvTk=;
  b=ZVZ0I5qtvwhxo5D4Se9xgyVOKNH8vAWp4WP1/KFHUb4UQdpG7GobLXat
   s00gFHSw0e1J5eV7ztk1LQ8GfUIbFHYjnOFfMMWuKEMDkDvnkofVPpVFc
   /Lf892l0XF5psFkBmgvontwQgloXxEibWkl7wk4pRQx7V3pE3fEW49lOG
   z4xMhNBYFCYD475aJdbxd6yVIsQEq8+kpIwo6NKu2u2mdGkuvptsdh1J0
   dwvBI+HwuX296KACqMDgF4M8fgNkP2s3cVp7OpI6MRISi8ehtDecjhZWh
   VgqtJUCnOYmmpP5yawjryQWFKcz0gN1GG4aKR0BGBK1/FZoUp/l/cOZJS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="417663741"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="417663741"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 04:09:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879527533"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="879527533"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 May 2023 04:09:27 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2VK2-000JH9-2l;
	Fri, 26 May 2023 11:09:26 +0000
Date: Fri, 26 May 2023 19:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, tsahu@linux.ibm.com,
	anshuman.khandual@arm.com, ssawgyw@gmail.com,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH -next] memblock: unify memblock dump and debugfs show
Message-ID: <202305261822.ZFRYZVQk-lkp@intel.com>
References: <20230525115856.124507-1-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525115856.124507-1-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230525]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/memblock-unify-memblock-dump-and-debugfs-show/20230525-194341
base:   next-20230525
patch link:    https://lore.kernel.org/r/20230525115856.124507-1-wangkefeng.wang%40huawei.com
patch subject: [PATCH -next] memblock: unify memblock dump and debugfs show
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230526/202305261822.ZFRYZVQk-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/08ce8490dec830c059127709a3a692ac7368287e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kefeng-Wang/memblock-unify-memblock-dump-and-debugfs-show/20230525-194341
        git checkout 08ce8490dec830c059127709a3a692ac7368287e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261822.ZFRYZVQk-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memblock.c: In function 'memblock_dump.constprop':
>> mm/memblock.c:1910:27: error: 'flagname' causes a section type conflict with 'memblock_debug'
    1910 | static const char * const flagname[] __initdata_memblock = {
         |                           ^~~~~~~~
   mm/memblock.c:158:12: note: 'memblock_debug' was declared here
     158 | static int memblock_debug __initdata_memblock;
         |            ^~~~~~~~~~~~~~


vim +1910 mm/memblock.c

  1909	
> 1910	static const char * const flagname[] __initdata_memblock = {
  1911		[ilog2(MEMBLOCK_HOTPLUG)]		= "HOTPLUG",
  1912		[ilog2(MEMBLOCK_MIRROR)]		= "MIRROR",
  1913		[ilog2(MEMBLOCK_NOMAP)]			= "NOMAP",
  1914		[ilog2(MEMBLOCK_DRIVER_MANAGED)]	= "DRV_MNG",
  1915		[ilog2(MEMBLOCK_MAX_UNKNOWN)]		= "UNKNOWN",
  1916	};
  1917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
