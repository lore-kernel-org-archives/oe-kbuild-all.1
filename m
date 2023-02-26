Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E593D36E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 01:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677375167; x=1708911167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Du+j7nTZjYKPRoibdDt5TgIN5ov5zYiTElnjyJE6dE=;
  b=EUZw8km3jc/r2pETZZgJtszLX8cnUCX8mrrqoJWKyUo+Pr/4LU78y29f
   NPmEH+p/GW15psSXvwTZoVAQDh2swbgGLp5bqo6W+AT3H1Hocn3e1vm1m
   7rwEDtZYcBCcA9O5FAxxM+Hq7T9MQGnKc7wcmSmd8ukzC/TxGUaMTL6vr
   R26Dn3I0DiRz534XgAk+54wyblQo5lSRooUDPpmOgdQMyfKUQfjYDfcFa
   NIHsWJcdTUPCBIzesRw9m6dRjbdCzVDQ9p64Lyq9fyEJAsizCaonKdvrV
   F5eYS/EfK4EoHWyUineHpQfBGNPiUdMbxO3hre1dkX/WIQI/iD7L1955l
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="419943217"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="419943217"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 17:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="673308664"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="673308664"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Feb 2023 17:32:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW5u9-0003UR-1B;
	Sun, 26 Feb 2023 01:32:45 +0000
Date: Sun, 26 Feb 2023 09:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-5.15 6/11]
 arch/arm64/kvm/hyp_trace.c:38:24: error: 'STRUCT_HYP_BUFFER_PAGE_SIZE'
 undeclared; did you mean 'STRUCT_HYP_PAGE_SIZE'?
Message-ID: <202302260910.KOMXZxpc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android14-5.15
head:   50dc0d9482ede4b8bf15055dfe46097002cd5fcb
commit: 575dd1da644e642dd122a5af1e81c4171af0f842 [6/11] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-s042-20230226 (https://download.01.org/0day-ci/archive/20230226/202302260910.KOMXZxpc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/575dd1da644e642dd122a5af1e81c4171af0f842
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android14-5.15
        git checkout 575dd1da644e642dd122a5af1e81c4171af0f842
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302260910.KOMXZxpc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c: In function 'bpage_backing_setup':
>> arch/arm64/kvm/hyp_trace.c:38:24: error: 'STRUCT_HYP_BUFFER_PAGE_SIZE' undeclared (first use in this function); did you mean 'STRUCT_HYP_PAGE_SIZE'?
      38 |         backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        STRUCT_HYP_PAGE_SIZE
   arch/arm64/kvm/hyp_trace.c:38:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp_trace.c: At top level:
   arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for 'hyp_trace_release' [-Wmissing-prototypes]
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~


vim +38 arch/arm64/kvm/hyp_trace.c

    29	
    30	static int bpage_backing_setup(struct hyp_trace_pack *pack)
    31	{
    32		size_t backing_size;
    33		void *start;
    34	
    35		if (hyp_buffer_pages_backing.start)
    36			return -EBUSY;
    37	
  > 38		backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
    39			       pack->trace_buffer_pack.total_pages;
    40		backing_size = PAGE_ALIGN(backing_size);
    41	
    42		start = alloc_pages_exact(backing_size, GFP_KERNEL_ACCOUNT);
    43		if (!start)
    44			return -ENOMEM;
    45	
    46		hyp_buffer_pages_backing.start = (unsigned long)start;
    47		hyp_buffer_pages_backing.size = backing_size;
    48		pack->backing.start = (unsigned long)start;
    49		pack->backing.size = backing_size;
    50	
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
