Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E91C5C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676397440; x=1707933440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOop0+IJASOAa3ZBsG/C9v/17oJIoGOBH6K5Lj9UH6E=;
  b=CQSnRomHvllqaq773/OnYwHdEhTKm4w49jDNEwSO2kippvM9vQpp6iq2
   68NjpjOIO+AQ5CHTjrdlEak27HM2Sa6v1KhOFejVawgKyOZQl5OZBNJlL
   l6JpLk5UcwNvES7mxl25AErYBU6xy9EPUuXw8EykBgB54rFxuj86bvVRY
   XEPyMItLUaWSHrPqmheFDWswAL9aSxyc+tya7p56fGtq5zlwv3KOT8H9b
   Jo6XgWRmDsZOfHaoe8UHilk7NCap5GW/FHIBvHnJHz4olntEj48ws0/Gl
   Qamgd1BkXsGNfgX7h86ChtQaULal/PH8S71m1F0L4ObTaMFRTeiX034/0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="310855104"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="310855104"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 09:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="737953537"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="737953537"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Feb 2023 09:57:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRzYM-0008h4-02;
	Tue, 14 Feb 2023 17:57:18 +0000
Date: Wed, 15 Feb 2023 01:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-5.15 6/11]
 arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier
 'STRUCT_HYP_BUFFER_PAGE_SIZE'
Message-ID: <202302150114.G21uZdzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android14-5.15
head:   8705a3d94302a65f17b6b726517336dabfa0e5fc
commit: 575dd1da644e642dd122a5af1e81c4171af0f842 [6/11] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-r032-20230213 (https://download.01.org/0day-ci/archive/20230215/202302150114.G21uZdzY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/575dd1da644e642dd122a5af1e81c4171af0f842
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android14-5.15
        git checkout 575dd1da644e642dd122a5af1e81c4171af0f842
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150114.G21uZdzY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier 'STRUCT_HYP_BUFFER_PAGE_SIZE'
           backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
                          ^
   arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for function 'hyp_trace_release' [-Wmissing-prototypes]
   int hyp_trace_release(struct inode *inode, struct file *file)
       ^
   arch/arm64/kvm/hyp_trace.c:488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int hyp_trace_release(struct inode *inode, struct file *file)
   ^
   static 
   1 warning and 1 error generated.


vim +/STRUCT_HYP_BUFFER_PAGE_SIZE +38 arch/arm64/kvm/hyp_trace.c

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
