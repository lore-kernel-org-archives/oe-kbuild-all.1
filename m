Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A629AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674311257; x=1705847257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eDTgsOwwOd0YuiypU5nXxQ7XV/9P3HzUwQohecf9mLU=;
  b=GJLe92R1QB+chDIkyrs/cAmyce/YgNGJ4Jj6KcZ7smHzR4GBjHtyFwzt
   B9rtIaVG7SlYRY6pmvK7bgMo4FnxXDUNzALvE87Fvq4p6O2CFXvUu3ajx
   wQZA7fdzN78LuoDeZxAqE0PD0FmyzrYhtFkMUVH5bQYzW9UG85yuc21B5
   OCsL2uqi8xqm6jxxzoq9riVGo1roDjy4j5zFU82xxzU99F77Sa9KTMyLD
   q0QC8lUgwPT9hydmwVh1ZZovZZQCAbzwpyfDInBQ21WaOSRJ7vjaorlbH
   zGK1jW9O6Gmo6h1NgyMVtIPEIhFvVUuQtcTXW/NLTJUSVgn26ewaU0TJV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309363211"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="309363211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 06:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="662851476"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="662851476"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jan 2023 06:27:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJEq5-0004A2-0H;
	Sat, 21 Jan 2023 14:27:25 +0000
Date: Sat, 21 Jan 2023 22:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 4/5] ERROR: modpost: "local_clock"
 [kernel/torture.ko] undefined!
Message-ID: <202301212230.s4kGOM54-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   2f4db18052727418ff37088ea7b08d5380aa91ad
commit: 01eee81c7fec26ca0a3ea93f3793d0772266fa8b [4/5] sched/clock: Make local_clock() noinstr
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230121/202301212230.s4kGOM54-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=01eee81c7fec26ca0a3ea93f3793d0772266fa8b
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 01eee81c7fec26ca0a3ea93f3793d0772266fa8b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux.o: section mismatch in reference: swiotlb_memblock_alloc (section: .text.unlikely) -> memblock_alloc_try_nid (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: swiotlb_memblock_alloc (section: .text.unlikely) -> memblock_alloc_try_nid (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: swiotlb_memblock_alloc (section: .text.unlikely) -> memblock_free (section: .meminit.text)
>> ERROR: modpost: "local_clock" [kernel/torture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
