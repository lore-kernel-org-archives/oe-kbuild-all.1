Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67161E528
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721915772; cv=none; b=RThLspecRdCx1q7hIsNGymBjnCz1Aoxmw8k4Y3sOv6ypY8+WwdaYO5ExR0l/ixoNOm2rEoI1NeB1a4atrKLgX/l+dpQRjomrv3Zp15wUaSoHe06zxgTa8wThDWS+T8pyqKJkgFlJKkiUzQ5FsWeV3hc6d54pbWjqzrQuff+PrIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721915772; c=relaxed/simple;
	bh=NOYdpXwRPkSK0sL6t7lqh6vdEQOchDm9XRO72K10ylI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MpYNRQPfqfSQ8JHuZ8CgAFgOupFRqJqkq0iSSU7IbRx2QAypiECTygBgzxihQUpFyGugHaWHNKx3202uG4Bmql1TkUMsIzfJCUo6R7Et88Vm3YLweQejYfiFaMA7J5WGzb1Zyq3JwOyOEsZZBQ6VCIyF4aZnewGmkVJJxq/YL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGJjYSOe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGJjYSOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721915771; x=1753451771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NOYdpXwRPkSK0sL6t7lqh6vdEQOchDm9XRO72K10ylI=;
  b=fGJjYSOe1/ikGe/BV8A3OG8TVA4fNlqQR/tAUzyv6N037rgey+sRg/Vo
   5Zr+Y3QshV607d4ZbLVqPMi/3X+J4GAmnN/c4jgRn+/DwAQd9id1fjqCa
   e9WqyX2HcNJwaxWym1cb+yNKl/wp+EuQU6O1iyh0CzmrTUo8/5xCuc1qI
   vTSMYQm61KFeWaIH6vDPdNE3PNAD3gFwliqMX9WBixgyz3ZhUj3CbnQLh
   FI7+VV88FO7FdeRxDV7odoVJJlPdUJtG5jxKZFlCO2l/RF97laAgnYmNS
   mGBLcEkhn3YScRqYireeo10QpaNkYk8xbpcUkmpUjYiISgZ1fa/s3z/99
   Q==;
X-CSE-ConnectionGUID: nLY0nAsySrWi/a5JEKYPKA==
X-CSE-MsgGUID: pq6SlzghRhy2tqrRuV1L9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="31041469"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="31041469"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 06:56:10 -0700
X-CSE-ConnectionGUID: RghD6leiQq2zdN6qNjaCEg==
X-CSE-MsgGUID: mkT62unaQ0SBds4Fbbhweg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="57733141"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jul 2024 06:56:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWyww-000o9a-0H;
	Thu, 25 Jul 2024 13:56:06 +0000
Date: Thu, 25 Jul 2024 21:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [linux-next:master 13686/13827]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:107:24: error: assignment
 to 'struct svm_range *' from 'int' makes pointer from integer without a cast
Message-ID: <202407252127.zvnxaKRA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   864b1099d16fc7e332c3ad7823058c65f890486c
commit: b049504e211e8f4dbcd40434f2dcab2215ea1039 [13686/13827] drm/amdkfd: Validate user queue svm memory residency
config: powerpc64-randconfig-003-20240725 (https://download.01.org/0day-ci/archive/20240725/202407252127.zvnxaKRA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407252127.zvnxaKRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407252127.zvnxaKRA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c: In function 'kfd_queue_buffer_svm_get':
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:107:26: error: implicit declaration of function 'svm_range_from_addr' [-Wimplicit-function-declaration]
     107 |                 prange = svm_range_from_addr(&p->svms, addr, NULL);
         |                          ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:107:24: error: assignment to 'struct svm_range *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     107 |                 prange = svm_range_from_addr(&p->svms, addr, NULL);
         |                        ^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:111:28: error: invalid use of undefined type 'struct svm_range'
     111 |                 if (!prange->mapped_to_gpu)
         |                            ^~
   In file included from include/linux/kernel.h:23,
                    from arch/powerpc/include/asm/page.h:11,
                    from arch/powerpc/include/asm/mmu.h:144,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:25:
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:46:23: note: in definition of macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:47:57: note: in definition of macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:48:24: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:48:39: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:45: error: invalid use of undefined type 'struct svm_range'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                                             ^~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:22: note: in expansion of macro 'test_bit'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:45: error: invalid use of undefined type 'struct svm_range'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                                             ^~
   include/linux/bitops.h:46:23: note: in definition of macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:22: note: in expansion of macro 'test_bit'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:45: error: invalid use of undefined type 'struct svm_range'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                                             ^~
   include/linux/bitops.h:47:57: note: in definition of macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:22: note: in expansion of macro 'test_bit'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:45: error: invalid use of undefined type 'struct svm_range'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                                             ^~
   include/linux/bitops.h:48:24: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:22: note: in expansion of macro 'test_bit'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                      ^~~~~~~~


vim +107 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c

    86	
    87	static int kfd_queue_buffer_svm_get(struct kfd_process_device *pdd, u64 addr, u64 size)
    88	{
    89		struct kfd_process *p = pdd->process;
    90		struct list_head update_list;
    91		struct svm_range *prange;
    92		int ret = -EINVAL;
    93	
    94		INIT_LIST_HEAD(&update_list);
    95		addr >>= PAGE_SHIFT;
    96		size >>= PAGE_SHIFT;
    97	
    98		mutex_lock(&p->svms.lock);
    99	
   100		/*
   101		 * range may split to multiple svm pranges aligned to granularity boundaery.
   102		 */
   103		while (size) {
   104			uint32_t gpuid, gpuidx;
   105			int r;
   106	
 > 107			prange = svm_range_from_addr(&p->svms, addr, NULL);
   108			if (!prange)
   109				break;
   110	
   111			if (!prange->mapped_to_gpu)
   112				break;
   113	
   114			r = kfd_process_gpuid_from_node(p, pdd->dev, &gpuid, &gpuidx);
   115			if (r < 0)
   116				break;
   117			if (!test_bit(gpuidx, prange->bitmap_access) &&
   118			    !test_bit(gpuidx, prange->bitmap_aip))
   119				break;
   120	
   121			if (!(prange->flags & KFD_IOCTL_SVM_FLAG_GPU_ALWAYS_MAPPED))
   122				break;
   123	
   124			list_add(&prange->update_list, &update_list);
   125	
   126			if (prange->last - prange->start + 1 >= size) {
   127				size = 0;
   128				break;
   129			}
   130	
   131			size -= prange->last - prange->start + 1;
   132			addr += prange->last - prange->start + 1;
   133		}
   134		if (size) {
   135			pr_debug("[0x%llx 0x%llx] not registered\n", addr, addr + size - 1);
   136			goto out_unlock;
   137		}
   138	
   139		list_for_each_entry(prange, &update_list, update_list)
   140			atomic_inc(&prange->queue_refcount);
   141		ret = 0;
   142	
   143	out_unlock:
   144		mutex_unlock(&p->svms.lock);
   145		return ret;
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
