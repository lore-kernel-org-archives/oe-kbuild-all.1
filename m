Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B440826E09
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695740921; x=1727276921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGcW+yd8VQvE48wC4kRjCr8HFf8GzeUlgGIb2XYd6uI=;
  b=DbpeGApJT590KjbwCVUKz19HA0Sxk4kY/1hP5dkcwiZrSzzjmYo3VKOX
   jbMENafa0p9McZNFWVGeJZFNw4iv+A+SUmvY5yj5NjQM81hgnp0dpJLZA
   7kD4kEju/lyMBCpJRkleq5i4FSjRiTS4PDOt2tcQzAVBOrF0ODOwaElLM
   Ju8eXvuMT16YUd5vhqurfQSWFuJg6tQoeB8ZWUic00WIY0qoujH1/qArQ
   4VJNO1zrkWgGb7FziPiYffIqAcQtf5vpQ4FPcHFhz0Gx2xuJxc7MaL3iK
   /yiicYi3opdZBM0bQIElWEl9/6pf9Xrbk6ZnHZ1SyYpVpxgA2g2ox58wq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378865615"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="378865615"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 08:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="839058708"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="839058708"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2023 08:08:37 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql9fv-0002xv-0V;
	Tue, 26 Sep 2023 15:08:35 +0000
Date: Tue, 26 Sep 2023 23:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11788/30000]
 drivers/staging/android/ion/ion_cma_heap.c:137:5: warning: no previous
 prototype for 'ion_add_cma_heaps'
Message-ID: <202309262316.j98oOb5s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hridya,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   8daba3e055d00086f153f5562449f11065001703
commit: f64a8b79c0e85440319136ed928f22ed37481742 [11788/30000] ANDROID: staging: android: ion: enable modularizing the ion driver
config: x86_64-randconfig-002-20230926 (https://download.01.org/0day-ci/archive/20230926/202309262316.j98oOb5s-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309262316.j98oOb5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309262316.j98oOb5s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/android/ion/ion_cma_heap.c:137:5: warning: no previous prototype for 'ion_add_cma_heaps' [-Wmissing-prototypes]
     137 | int ion_add_cma_heaps(void)
         |     ^~~~~~~~~~~~~~~~~


vim +/ion_add_cma_heaps +137 drivers/staging/android/ion/ion_cma_heap.c

   136	
 > 137	int ion_add_cma_heaps(void)
   138	{
   139		cma_for_each_area(__ion_add_cma_heaps, NULL);
   140		return 0;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
