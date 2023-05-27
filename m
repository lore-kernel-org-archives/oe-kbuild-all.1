Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307AA11C9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685199006; x=1716735006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gh+nzsc+wBPnVzKxFs5HJU0L6JUu+GdipG1vmeSRgeg=;
  b=k2Wh4r+RegPiC6eA7aVMU4slJmHhPf2fczktuFrNJHMfL1A80Dd4m9d9
   fCY30Om9xmhswejqvuySoBY5YsxxFZnkWqXrMWuWXbwOXaoc22HGRfuaj
   56jIS20L1CwOm0RedcqjAiz1rGevJ5XllgWzcn+1Z45h/ZF8Cq3JKGaT7
   XkVFBGMAlGPNo7a5lbiBouxSDu6AcswqqhQgHQXzG52pqTCSVnq8owzcG
   jM8U+J34sdCkIZLsh1Jik3wwm5gRFSzyK4g7isAlkZbcOwTICnhIzU7VA
   NFQyZwTiHV2bdkR9VJJvIn/5+qgEy4ovFEpDZs56j734nW9HvgTogu1IR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="356786226"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="356786226"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 07:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="775406115"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="775406115"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 May 2023 07:50:04 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2vF6-000K0k-0B;
	Sat, 27 May 2023 14:50:04 +0000
Date: Sat, 27 May 2023 22:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 285/26432]
 drivers/staging/android/ion/heaps/ion_cma_heap.c:21:3: sparse: sparse:
 symbol 'cma_heaps' was not declared. Should it be static?
Message-ID: <202305272223.tlyBrXbJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   25dcbf92d4dec5c447f35efbef53ee91c82dbc6b
commit: a3d87671564a9cfc4dc3dc30036f50ea8541b109 [285/26432] ANDROID: staging: ion: make cma heap a module
config: i386-randconfig-s003-20230526 (https://download.01.org/0day-ci/archive/20230527/202305272223.tlyBrXbJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout a3d87671564a9cfc4dc3dc30036f50ea8541b109
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305272223.tlyBrXbJ-lkp@intel.com/

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
