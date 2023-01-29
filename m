Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1BA2F30
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675025672; x=1706561672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GuwTQ5EikxXrIqWi/jWhLeAeWKCP8g+VRX7AyS0xWZM=;
  b=Ww+M0+gLQGko82RAuuyrB1VoBLAgRryyRj4626pW7uacmop9eptGDihS
   Qa8qwihtIDyPDw2BxH9/6y8O67JaZhunXrYJ549neSvfiaoKpnRFjbXRC
   bSO3npzj/2Y8MsWPCLcndg7030FXRJdIlvpiijcxIr25HdWrh+q1Y3oGY
   2PyvpI/Ld2S6hEpQpemaKhx6CjW66GwcOYpXwUajs8BeO/5ZNPmNu01Zj
   q2S230XTlRX78SwLF6Gvr5nj3b3II6BqilLo3M9516ZCULE8ZdnHfVJlg
   8R0Cc9101mmqe0IqOz+iuIlNtDf9AzCNFIvHwHxJEnY/zA4Ggu4V8mi0n
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="311054974"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="311054974"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 12:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="665856432"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="665856432"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jan 2023 12:54:30 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMEh3-00036m-0v;
	Sun, 29 Jan 2023 20:54:29 +0000
Date: Mon, 30 Jan 2023 04:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Price <steven.price@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 08/14] arm64: Make the PHYS_MASK_SHIFT dynamic
Message-ID: <202301300457.4gjPOudA-lkp@intel.com>
References: <20230127112758.37891-9-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127112758.37891-9-steven.price@arm.com>

Hi Steven,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on kvmarm/next efi/next tip/irq/core arm/for-next arm/fixes soc/for-next linus/master v6.2-rc5 next-20230127]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Price/arm64-rsi-Add-RSI-definitions/20230128-113646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230127112758.37891-9-steven.price%40arm.com
patch subject: [RFC PATCH 08/14] arm64: Make the PHYS_MASK_SHIFT dynamic
config: arm64-randconfig-s043-20230129 (https://download.01.org/0day-ci/archive/20230130/202301300457.4gjPOudA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/31ee93a9816b99af56770eb97a8e1f97808fda01
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steven-Price/arm64-rsi-Add-RSI-definitions/20230128-113646
        git checkout 31ee93a9816b99af56770eb97a8e1f97808fda01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:33,
                    from include/linux/slab.h:163,
                    from include/linux/fs.h:45,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from arch/arm64/mm/init.c:12:
>> arch/arm64/include/asm/pgtable.h:41:33: error: initializer element is not constant
      41 | #define PHYS_MASK               ((1UL << PHYS_MASK_SHIFT) - 1)
         |                                 ^
   arch/arm64/mm/init.c:91:52: note: in expansion of macro 'PHYS_MASK'
      91 | phys_addr_t __ro_after_init arm64_dma_phys_limit = PHYS_MASK + 1;
         |                                                    ^~~~~~~~~


vim +41 arch/arm64/include/asm/pgtable.h

    39	
    40	#define PHYS_MASK_SHIFT		(phys_mask_shift)
  > 41	#define PHYS_MASK		((1UL << PHYS_MASK_SHIFT) - 1)
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
