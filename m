Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE7B11C92
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 01:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728006121; cv=none; b=TklTyi6vYvBOy1Zvf65O61ICVnNCFlop0HIAKSfOSQHXWlO9szPIaDqAK3Oxro2pIUaMabcohi9ZI8BB7l+VRjPVzGyPtGa/PliqHh95JzRjPTta8UgWBQ0yoZEsZ9hP6qlkeYUfmJkNjwO2WqBLXUdMYuKs8cCAMdsUz9qIq84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728006121; c=relaxed/simple;
	bh=zlbeZQMKkh+mOBk6cvcXl9n1E3ZqzMDWyrrTBvhpL+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F2BxOXE9N4ssqygNjTewZIMPreGNeskZA6brlcsEHkzm+HzsKqYHNiQgHXUVMjOSOIjbL5aYe1ct4SDxtcq2v1Bsh+NcBbAT0Rqop96cVRKJPTfg817J8ctKfhDgcNGBeYykAppz2ri4uyYvlCSs0lwV/J7iEWXdYDGUWutN2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2v7Nduv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2v7Nduv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728006120; x=1759542120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zlbeZQMKkh+mOBk6cvcXl9n1E3ZqzMDWyrrTBvhpL+E=;
  b=g2v7NduveIDe3fke/S+pCXQ30xm6Ht8ZBsFZotS5pqlLJ3yfNR8RWagp
   vQg31yZw+jr2sX0kG1mJR6+KHkCjlXhKypGeya/hu/f5DKzKe1q4dYYV2
   We2I8T0HrFvrHbSsI+sCla6ZpVL+UynrXCrEIsi8SZ20s5Iy7ge2kx4Lw
   tgxRKP9o8oDXg11vDc6f34IUYBNCdSCVkB9wllvh43zpM1D8VgV6xid4o
   nycgi7/+J/0x6NwVOca67ABuoGZw0GwUfTI8RNEnhKl/t04/k/zuX23p0
   S30WCs4zd3yz6Vpt7eB4jqfVwtq6SypVOfUFIlRajo9poyIfHGeugeAxC
   A==;
X-CSE-ConnectionGUID: pz0oGBftS/C8GHChZINnkQ==
X-CSE-MsgGUID: eqVFzammRCmaJNS0B43aqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26690797"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="26690797"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 18:41:59 -0700
X-CSE-ConnectionGUID: ehyIXpzUTBe/ADi5vTBbrQ==
X-CSE-MsgGUID: HTWAhasXTHW42yr2INhJFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="78976730"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Oct 2024 18:41:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swXKO-00016e-1L;
	Fri, 04 Oct 2024 01:41:56 +0000
Date: Fri, 4 Oct 2024 09:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [namhyung-perf:bpf/slab-iter-v4 2/3]
 arch/csky/include/asm/page.h:37:34: warning: cast to pointer from integer of
 different size
Message-ID: <202410040942.klv5XQ1P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/namhyung/linux-perf.git bpf/slab-iter-v4
head:   2941faf08c4c0c782881cfe9e8b7e1b6432a6212
commit: 96ce888c02ed7cf7278c4d4d14bab67c1db4b673 [2/3] mm/bpf: Add bpf_get_kmem_cache() kfunc
config: csky-randconfig-001-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040942.klv5XQ1P-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040942.klv5XQ1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040942.klv5XQ1P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/csky/include/asm/thread_info.h:9,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/slab_common.c:7:
   mm/slab_common.c: In function 'bpf_get_kmem_cache':
>> arch/csky/include/asm/page.h:37:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      37 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && \
         |                                  ^
   mm/slab_common.c:1334:14: note: in expansion of macro 'virt_addr_valid'
    1334 |         if (!virt_addr_valid(addr))
         |              ^~~~~~~~~~~~~~~
   arch/csky/include/asm/page.h:38:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      38 |                         (void *)(kaddr) < high_memory)
         |                         ^
   mm/slab_common.c:1334:14: note: in expansion of macro 'virt_addr_valid'
    1334 |         if (!virt_addr_valid(addr))
         |              ^~~~~~~~~~~~~~~


vim +37 arch/csky/include/asm/page.h

013de2d6671d89 Guo Ren 2018-09-05  36  
013de2d6671d89 Guo Ren 2018-09-05 @37  #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && \
013de2d6671d89 Guo Ren 2018-09-05  38  			(void *)(kaddr) < high_memory)
013de2d6671d89 Guo Ren 2018-09-05  39  

:::::: The code at line 37 was first introduced by commit
:::::: 013de2d6671d89de3397904749c86a69ac0686f7 csky: MMU and page table management

:::::: TO: Guo Ren <ren_guo@c-sky.com>
:::::: CC: Guo Ren <ren_guo@c-sky.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
