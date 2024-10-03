Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32D61CF5CB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 23:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727999281; cv=none; b=O8BQrvc4jD5+gqVub1dhUAKM7bdgVq5/tljuulOmuJH6iBKecEY5uR1qvS0jl1XLnFtj75SXiPcW0NTk7bViifTD3jX+crOR0Fbx1Pf5tXWLt1isECeVrLluUe1lQlhutwS7OqDFUY26HCY6DkjhXipwtQyKz9PWnWyYCBSkYvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727999281; c=relaxed/simple;
	bh=p8HpsUtxQX1LTslZjf2goqrfXuK0GE1kjnFjjGmUOyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPOEK1onX6ZGN4+H0dkseXV/mgrBhzsSoCnYkL1S/5nV9/+MQ7yglAwSYXLEylW3JdW7HVKoXW7Ymey0iYhO1s2DHeYFmkIXJ9VLBHggaTcvT5LwO4pLIvLk7MFa0gIWUYw1kzyeZdobMWs/seAbL3VJ6ccL/VWZXFhMrybYm08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCfUhbRT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCfUhbRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727999280; x=1759535280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8HpsUtxQX1LTslZjf2goqrfXuK0GE1kjnFjjGmUOyM=;
  b=JCfUhbRTOcEJHbJV8KYXpL+JRD9RFaOnvioFdQxUW7aTXqzJ+8H5DOmO
   zpI0tkC0hqltoqukIag69rKLJbR8ubqu0xY0ZTWgl1YDbcDyRMin0DN0S
   fxgOp1pYAvQGKsxKFQKb5UdUaL9cNC0EIjYz/fP72IB8F+yIoYc3orWmx
   Dd3PagJgWWw3ztYeEUQK5Tp0JGM2ZIz8J+7OBEssA1ox1vBOY++17H+ww
   FtRN8QSVnDs8YexUpHpyeu5AzNWp0zJOsxFbGkqlpD+4BlgiXHThvCYtu
   6yC5DpMAGi9d3JQu7QVd3EsG6ycwPFIV50ybPtKYcHnPeC7RAL7nHn2dO
   w==;
X-CSE-ConnectionGUID: rCh8U0MpQQ6XfdQogRjSsQ==
X-CSE-MsgGUID: D1tqXt/6RD+8wd8UtOvMTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44683358"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="44683358"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 16:47:57 -0700
X-CSE-ConnectionGUID: AwgTPNGjRuiddOccMZ4oTw==
X-CSE-MsgGUID: vI0183LVTF2MkAMZSE+96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74832311"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Oct 2024 16:47:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swVY1-00011s-33;
	Thu, 03 Oct 2024 23:47:53 +0000
Date: Fri, 4 Oct 2024 07:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [namhyung-perf:bpf/slab-iter-v4 2/3] mm/slab_common.c:1334:30:
 warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer
 without a cast
Message-ID: <202410040726.ChVYsqks-lkp@intel.com>
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
config: arc-randconfig-001-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040726.ChVYsqks-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040726.ChVYsqks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040726.ChVYsqks-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/slab_common.c:7:
   mm/slab_common.c: In function 'bpf_get_kmem_cache':
>> mm/slab_common.c:1334:30: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    1334 |         if (!virt_addr_valid(addr))
         |                              ^~~~
         |                              |
         |                              u64 {aka long long unsigned int}
   arch/arc/include/asm/page.h:129:55: note: in definition of macro 'virt_addr_valid'
     129 | #define virt_addr_valid(kaddr)  pfn_valid(virt_to_pfn(kaddr))
         |                                                       ^~~~~
   arch/arc/include/asm/page.h:123:53: note: expected 'const void *' but argument is of type 'u64' {aka 'long long unsigned int'}
     123 | static inline unsigned long virt_to_pfn(const void *kaddr)
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
