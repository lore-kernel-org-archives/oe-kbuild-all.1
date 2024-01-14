Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A431845
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 06:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AiJ3+8WU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705214933; x=1736750933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=45Zwc2wVg4cyvAv4dCLezKNpDoosIRle3ArppH1q/cc=;
  b=AiJ3+8WUTvEnyGKPC9iQVc3yVyaxXuPpTRHbaQFxm3f3rsawrwKMvkis
   Mp4jZdEpPGbDfnVOAvm0AT43Ynz+1HxaEoC9dctNoPWc5p0zPEsBEXK3Q
   ZmG35Rb1by6lPxXr9IKwVsvfihtG5GMBLaMxjQkqxcugUjpiSbB4xE3UR
   F942WI5i1UCm7byOMsFj4q5ih2MVLNidtAvAhNJsm5AtM0Q8exV6DE6Wb
   gy6eDqWikhyl57kCdyF4VcoANok032x+wkwNoEJ2yWGDd9Kzctqg6WZXh
   DKDOYlXgsa8YMTdAnf9JT6nPL10ifgi8Yrwc/1aQ/ijVIWVG2qQ2GIFQk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="403203537"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="403203537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 22:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="25147158"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2024 22:48:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOuIc-000BGQ-0f;
	Sun, 14 Jan 2024 06:48:50 +0000
Date: Sun, 14 Jan 2024 14:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18796/21544] mm/vmscan.c:3257:21:
 error: implicit declaration of function 'kernel_swap_enabled'
Message-ID: <202401141453.U2Gvx7bn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [18796/21544] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-004-20240112 (https://download.01.org/0day-ci/archive/20240114/202401141453.U2Gvx7bn-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141453.U2Gvx7bn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141453.U2Gvx7bn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:23:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:2734:17: warning: variable 'node_lru_pages' set but not used [-Wunused-but-set-variable]
    2734 |                 unsigned long node_lru_pages = 0;
         |                               ^
>> mm/vmscan.c:3257:21: error: implicit declaration of function 'kernel_swap_enabled' [-Werror,-Wimplicit-function-declaration]
    3257 |         if (sc != NULL && !kernel_swap_enabled())
         |                            ^
   mm/vmscan.c:3257:21: note: did you mean 'kernfs_ns_enabled'?
   include/linux/kernfs.h:309:20: note: 'kernfs_ns_enabled' declared here
     309 | static inline bool kernfs_ns_enabled(struct kernfs_node *kn)
         |                    ^
   2 warnings and 1 error generated.


vim +/kernel_swap_enabled +3257 mm/vmscan.c

  3250	
  3251	/*
  3252	 * Check if original kernel swap is enabled
  3253	 * turn off kernel swap,but leave page cache reclaim on
  3254	 */
  3255	static inline void kernel_swap_check(struct scan_control *sc)
  3256	{
> 3257		if (sc != NULL && !kernel_swap_enabled())
  3258			sc->may_swap = 0;
  3259	}
  3260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
