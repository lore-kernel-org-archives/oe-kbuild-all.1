Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB10808
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690062568; x=1721598568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=935tKeWYW0XI/zTlnM8qOB3nDDjyLI8xjTMqb3Bo7x0=;
  b=C+ZMut4Veiq1WsTKjRtSBBjmnifHiYz8c4yLYq/i4Vvpuf2qh/VvMPfd
   2BsMTCsJi0EpZSzM6bWf3xRUYNPuOxoiTn5/8HrUzxt2PjiJ2fgp3ZDNr
   kpyeZD0IKE6TXf27GxyXsjD9AMyJ/wTC+f4VWALi8kRjJVhA9ueLZheBA
   QG+e2gdMivDBulZvOPgyQMpo2yd2B2D2hQ9odvXIeHiuBUvCRsskVsu0X
   7EsdY9jtaA7CsSiY1WaASAPyNHzi9bf59dj3z4zim1iZoP3WYAO9FnMvH
   1UH+G4uLWrXTIhoOHzQsmrJGozqJnYQEZeKm0znb1iztt1sdPNdyguYQQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="366120097"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="366120097"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 14:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="815389728"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="815389728"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2023 14:49:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNKTe-0008db-12;
	Sat, 22 Jul 2023 21:49:26 +0000
Date: Sun, 23 Jul 2023 05:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 285/26722]
 drivers/staging/android/ion/heaps/ion_cma_heap.c:21:3: sparse: sparse:
 symbol 'cma_heaps' was not declared. Should it be static?
Message-ID: <202307230529.7FPITdKY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   073366f32a45e29bdbffa6db985f6cb35c5fa7b8
commit: a3d87671564a9cfc4dc3dc30036f50ea8541b109 [285/26722] ANDROID: staging: ion: make cma heap a module
config: x86_64-randconfig-r083-20230723 (https://download.01.org/0day-ci/archive/20230723/202307230529.7FPITdKY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230529.7FPITdKY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230529.7FPITdKY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)


vim +/cma_heaps +21 drivers/staging/android/ion/heaps/ion_cma_heap.c

    17	
    18	struct ion_cma_heap {
    19		struct ion_heap heap;
    20		struct cma *cma;
  > 21	} cma_heaps[MAX_CMA_AREAS];
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
