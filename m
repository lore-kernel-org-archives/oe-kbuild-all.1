Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F057C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677197369; x=1708733369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aycrsKu3dGQLhkJHVUUfhx1IBbDVgdQx1mWSkhBVCv8=;
  b=fjVqdJHe7exKCHAFATKQrn+ctrSYx4VTu+DuA2jBrMo3SSXJkkPNXM1e
   QNACGcZKCaoWC1zTZhU8s3Dwh8ydJluxG+jLyq+TAt7MFQ3bmKX5vvFx+
   xsBzi5Y6M1Q+UoFwwUdWajHGfjFKARoERaoOGKBDMKewuFTEbUYn4pVi7
   jCi80FUX1uigiFQRrWFuNlvI5G2FM/kKl6EdzIPnR3EINo3KGgDq91KJO
   nxxZBCHPy8EzyqINfdtGtLM76KWNMevTnKXSr5g/J58K6ELkpjtlAPt8O
   /08VoTZ6lQtd2A1usdM39bbVsLMDkT67HAMj5Vb5RaTvBz7H84YziugE0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="317112822"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="317112822"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 16:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="665987209"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="665987209"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Feb 2023 16:09:27 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVLeQ-0001vR-1F;
	Fri, 24 Feb 2023 00:09:26 +0000
Date: Fri, 24 Feb 2023 08:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Knig <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Dominik Behr <dbehr@chromium.org>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>
Subject: [jsarha:backport/cros-v4.14-intel-audio 5240/9999]
 arch/xtensa/include/asm/cmpxchg.h:157:16: sparse: sparse: non
 size-preserving integer to pointer cast
Message-ID: <202302240839.KIrXKRKd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux backport/cros-v4.14-intel-audio
head:   ed5b3159902598be61b23ef22a235d9b1eaa9ad8
commit: 9246d9eec94b6db09d0949540602930688cbe775 [5240/9999] UPSTREAM: drm/amdgpu: Fix deadlock during GPU reset.
config: xtensa-randconfig-s053-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240839.KIrXKRKd-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/9246d9eec94b6db09d0949540602930688cbe775
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha backport/cros-v4.14-intel-audio
        git checkout 9246d9eec94b6db09d0949540602930688cbe775
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240839.KIrXKRKd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../scheduler/gpu_scheduler.c: note: in included file (through arch/xtensa/include/asm/atomic.h, include/linux/atomic.h, include/linux/rcupdate.h, ...):
>> arch/xtensa/include/asm/cmpxchg.h:157:16: sparse: sparse: non size-preserving integer to pointer cast
   In file included from include/linux/err.h:5:0,
                    from include/linux/kthread.h:5,
                    from drivers/gpu/drm/amd/amdgpu/../scheduler/gpu_scheduler.c:24:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/scatterlist.h:147:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(!virt_addr_valid(buf));
     ^~~~~~
   arch/xtensa/include/asm/page.h:193:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
                                   ^~~~~~~~~
   include/linux/scatterlist.h:147:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~

vim +157 arch/xtensa/include/asm/cmpxchg.h

f9aa7e1882f3ce David Howells 2012-03-28  148  
f9aa7e1882f3ce David Howells 2012-03-28  149  static __inline__ unsigned long
f9aa7e1882f3ce David Howells 2012-03-28  150  __xchg(unsigned long x, volatile void * ptr, int size)
f9aa7e1882f3ce David Howells 2012-03-28  151  {
f9aa7e1882f3ce David Howells 2012-03-28  152  	switch (size) {
f9aa7e1882f3ce David Howells 2012-03-28  153  		case 4:
f9aa7e1882f3ce David Howells 2012-03-28  154  			return xchg_u32(ptr, x);
f9aa7e1882f3ce David Howells 2012-03-28  155  	}
f9aa7e1882f3ce David Howells 2012-03-28  156  	__xchg_called_with_bad_pointer();
f9aa7e1882f3ce David Howells 2012-03-28 @157  	return x;
f9aa7e1882f3ce David Howells 2012-03-28  158  }
f9aa7e1882f3ce David Howells 2012-03-28  159  

:::::: The code at line 157 was first introduced by commit
:::::: f9aa7e1882f3ceec919b30f64a2ce6e66a2571b1 Disintegrate asm/system.h for Xtensa

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
