Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462F1388
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 01:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725239557; cv=none; b=AdLV6ke8tKXqYKMb8R0YZgbEDmKAyBJ4NTfh06YHth2Tocpo4yrYJhqFQlLw7RNjpcQj8x13bARB/KHa/SyzlSERYjsnR4zmvTnAOBflw7bVyp2VZMRMi+O73vv27ppbgj+8MqyBt5psRdKE+VQ3K2p11fiz1Vg2Mlr+Qc0JEf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725239557; c=relaxed/simple;
	bh=RBrzIiUWKGj5kFpbEuVCiiyHM6DxxKN3kCoQpSjcEsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ac+E5cUku9pzHBB6QMmYZp0qYLm8ZK8MuajsuGExZ1o9d6DPE+si3mNaWaeMTyIHonVQJrPIS3lSCgISF5UAEbWJ/X4Hjv8hObFGUqYl3qcuiA+XvNQku6PAjFPPB4+Z2H6AUolXpj13loUAHIpTvbVOvZQg8OQcd3lIe4ZKFmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbgOEpJP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbgOEpJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725239556; x=1756775556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RBrzIiUWKGj5kFpbEuVCiiyHM6DxxKN3kCoQpSjcEsM=;
  b=XbgOEpJPJrTt+29J0Y7I4ddIQclRrOU3pTdk5eF0TfkG7ABmxmmrF5Dl
   xVE/b8PR4hlLJZFlEKRNH1+kD1XZDc2B7B2d2OI0E6LSO01lCgmTDq9Tj
   E2JFUSUz9F8xWAFH/vlJhVowprIKbr7rKFYGD8JqEXvV89gdq5edCY09c
   21PZ0WTLdJC0CEwAHlGAhIJKGmH1pBKLIXQwTYo/Bj04qhvraRbEMCAcb
   mI9K7IeZZB1gfpr2K9WjGaybFUeKCtHM0W76NF9h4aEg/DWMnJ8U3F9u9
   N0jeZIKtMlDbpdTGjtGhX1D5nNxPLz/yjN4FZiTp2Occ0Kc7+a7twDBFe
   w==;
X-CSE-ConnectionGUID: l27UPtk/TW+kI3Y/vpQy3w==
X-CSE-MsgGUID: slHuGYnFTqCQGDEngwIyPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="46316335"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="46316335"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 18:12:36 -0700
X-CSE-ConnectionGUID: x7q6y3oTS8mEdG54nprkPQ==
X-CSE-MsgGUID: Rxw9W0pxSG2moILV13WgEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="95269574"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Sep 2024 18:12:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skvcM-00051H-0D;
	Mon, 02 Sep 2024 01:12:30 +0000
Date: Mon, 2 Sep 2024 09:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [linux-next:master 7142/8126] include/linux/numa_memblks.h:50:12:
 error: conflicting types for 'phys_to_target_node'; have 'int(phys_addr_t)'
 {aka 'int(unsigned int)'}
Message-ID: <202409020920.5S9U7dww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: 58b48700d8e043187d8032e0855f7ee8c4af5eac [7142/8126] mm: make range-to-target_node lookup facility a part of numa_memblks
config: riscv-randconfig-r022-20221228 (https://download.01.org/0day-ci/archive/20240902/202409020920.5S9U7dww-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409020920.5S9U7dww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409020920.5S9U7dww-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/numa.c:6:
>> include/linux/numa_memblks.h:50:12: error: conflicting types for 'phys_to_target_node'; have 'int(phys_addr_t)' {aka 'int(unsigned int)'}
      50 | extern int phys_to_target_node(phys_addr_t start);
         |            ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:17,
                    from arch/riscv/include/asm/processor.h:77,
                    from arch/riscv/include/asm/thread_info.h:37,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/memblock.h:12,
                    from mm/numa.c:3:
   include/linux/numa.h:47:5: note: previous declaration of 'phys_to_target_node' with type 'int(u64)' {aka 'int(long long unsigned int)'}
      47 | int phys_to_target_node(u64 start);
         |     ^~~~~~~~~~~~~~~~~~~
--
   In file included from mm/numa_memblks.c:8:
>> include/linux/numa_memblks.h:50:12: error: conflicting types for 'phys_to_target_node'; have 'int(phys_addr_t)' {aka 'int(unsigned int)'}
      50 | extern int phys_to_target_node(phys_addr_t start);
         |            ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:17,
                    from arch/riscv/include/asm/processor.h:77,
                    from arch/riscv/include/asm/thread_info.h:37,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/memblock.h:12,
                    from mm/numa_memblks.c:6:
   include/linux/numa.h:47:5: note: previous declaration of 'phys_to_target_node' with type 'int(u64)' {aka 'int(long long unsigned int)'}
      47 | int phys_to_target_node(u64 start);
         |     ^~~~~~~~~~~~~~~~~~~
   include/linux/numa_memblks.h:51:29: error: conflicting types for 'phys_to_target_node'; have 'int(phys_addr_t)' {aka 'int(unsigned int)'}
      51 | #define phys_to_target_node phys_to_target_node
         |                             ^~~~~~~~~~~~~~~~~~~
   mm/numa_memblks.c:546:5: note: in expansion of macro 'phys_to_target_node'
     546 | int phys_to_target_node(phys_addr_t start)
         |     ^~~~~~~~~~~~~~~~~~~
   include/linux/numa.h:47:5: note: previous declaration of 'phys_to_target_node' with type 'int(u64)' {aka 'int(long long unsigned int)'}
      47 | int phys_to_target_node(u64 start);
         |     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from mm/numa_memblks.c:5:
   include/linux/numa_memblks.h:51:29: error: conflicting types for 'phys_to_target_node'; have 'int(phys_addr_t)' {aka 'int(unsigned int)'}
      51 | #define phys_to_target_node phys_to_target_node
         |                             ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   mm/numa_memblks.c:559:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     559 | EXPORT_SYMBOL_GPL(phys_to_target_node);
         | ^~~~~~~~~~~~~~~~~
   mm/numa_memblks.c:559:19: note: in expansion of macro 'phys_to_target_node'
     559 | EXPORT_SYMBOL_GPL(phys_to_target_node);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/numa.h:47:5: note: previous declaration of 'phys_to_target_node' with type 'int(u64)' {aka 'int(long long unsigned int)'}
      47 | int phys_to_target_node(u64 start);
         |     ^~~~~~~~~~~~~~~~~~~


vim +50 include/linux/numa_memblks.h

    48	
    49	#ifdef CONFIG_NUMA_KEEP_MEMINFO
  > 50	extern int phys_to_target_node(phys_addr_t start);
    51	#define phys_to_target_node phys_to_target_node
    52	extern int memory_add_physaddr_to_nid(u64 start);
    53	#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
    54	#endif /* CONFIG_NUMA_KEEP_MEMINFO */
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
