Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E5913A89A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 22:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727995559; cv=none; b=ICkmaYTBrHo/maAVpopjJBg8SObiE/6WaqlwXuRBf5j7PyJzxqzw0WHJvqB9jAd8JqtmQmNb5SJKiR6Klxnbmko9fxw4bai3LUAOSA/HzN9JWoX8eR/uOaecqKExJ2XR2UPjVymD4+33Q7WLz3EpAYQqVSvtHG4c/NfFKNkY4h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727995559; c=relaxed/simple;
	bh=AUGkGqMI2P0FKFH7C9ToqSO7K/iK/nefuZpwwMKpbLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+sign6ai6gaVY1VHZLa82xNxsU2kVD1s+6AoPg63lTU5l0jpkgj8fAe9xQe2aJc9Xmvz0YPIxkPZhXI3CU6noNr71rQvruxhYgxqrwgiwFW12BsN2MY/vi9WSoDvnEww7U9D6cqFOJqIQUkByHBURKFo5idbiDfz/saegPdFhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEBUjYLI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEBUjYLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727995557; x=1759531557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AUGkGqMI2P0FKFH7C9ToqSO7K/iK/nefuZpwwMKpbLw=;
  b=IEBUjYLIC5eX1I5VLuV3OjP304VjfdH/OKZwWUtBWLw7tAPNBWx3kraB
   LRTktUAG0vEeYifmecCha8p6q9x8U45kAxfmOEJp/zBGRVW4ezXbnNpGb
   c1w2nyWg4j6m0Q2GVDEJh8bJu8gpDtH+0Sw19yr0AfH5KMBqaShMX8vqV
   AWCtO7BUc40llojOX5/nebz7ooiBHJ5yAH4bSESEwiOWjeFtDPsqjp+M3
   wWbg6Gouao9975mDdcyd8h5B3QbA90BtawD0FsEhPQSdkasMTqbTsdkte
   6wUJ7zjFgbtTJ+UIrvFbV15b6ZrnnmR5rKPLbv+MGY2fFDbk8iLXKX3AE
   w==;
X-CSE-ConnectionGUID: 9Tg8ZPXqRhaKfwUEru9qnw==
X-CSE-MsgGUID: aOteWmvHT1GTLielJgdnMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26720441"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="26720441"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 15:45:56 -0700
X-CSE-ConnectionGUID: O6TDnFGBQmydhoJPh5m7vw==
X-CSE-MsgGUID: 4B1z/s0hQde+8CU35QM/rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="105351475"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Oct 2024 15:45:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swUa0-0000zM-2w;
	Thu, 03 Oct 2024 22:45:52 +0000
Date: Fri, 4 Oct 2024 06:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [namhyung-perf:bpf/slab-iter-v4 2/3] mm/slab_common.c:1334:30:
 error: passing argument 1 of 'virt_to_pfn' makes pointer from integer
 without a cast
Message-ID: <202410040657.0zCsaj69-lkp@intel.com>
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
config: microblaze-randconfig-r072-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040657.0zCsaj69-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040657.0zCsaj69-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040657.0zCsaj69-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/slab_common.c:7:
   mm/slab_common.c: In function 'bpf_get_kmem_cache':
>> mm/slab_common.c:1334:30: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    1334 |         if (!virt_addr_valid(addr))
         |                              ^~~~
         |                              |
         |                              u64 {aka long long unsigned int}
   arch/microblaze/include/asm/page.h:135:56: note: in definition of macro 'virt_addr_valid'
     135 | #define virt_addr_valid(vaddr)  (pfn_valid(virt_to_pfn(vaddr)))
         |                                                        ^~~~~
   arch/microblaze/include/asm/page.h:125:53: note: expected 'const void *' but argument is of type 'u64' {aka 'long long unsigned int'}
     125 | static inline unsigned long virt_to_pfn(const void *vaddr)
         |                                         ~~~~~~~~~~~~^~~~~


vim +/virt_to_pfn +1334 mm/slab_common.c

  1329	
  1330	__bpf_kfunc struct kmem_cache *bpf_get_kmem_cache(u64 addr)
  1331	{
  1332		struct slab *slab;
  1333	
> 1334		if (!virt_addr_valid(addr))
  1335			return NULL;
  1336	
  1337		slab = virt_to_slab((void *)(long)addr);
  1338		return slab ? slab->slab_cache : NULL;
  1339	}
  1340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
