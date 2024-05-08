Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616571B809
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 06:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715150473; cv=none; b=s+0r6NldF3r7uZrwXb4MJOOOOsUXq7MUbSYbMdASMM855+E6aaSA7yMldhsxyy2QpvuqDbHqpoltzEILevOxT1Cgu1NB0PFWVYg2Uwsl2VlFfT8coxjQBrpI5iwjzuWCDZEMyPE2lkvQt5LztbQ35q1HEeDrf93MVz2ojU3f5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715150473; c=relaxed/simple;
	bh=hwQRrTO8qrvRGt13Z6f5uuP1WeHSk26OtYwJm3qtGls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qu4vosriofk+r6O1cCQtGm6g/Kna4sMKB28CPmHFe45UU1KZG0gaghR5teA5NZeMJSCNrCZo2IgPwTj+Q7j3i4CR6EurpB/3jSpfRfOPSgzIhH6zywmVXnRhl5pBayXwhflvMjoPnGWRQtuCnj5m7pNrkO6Gw+SsN50QfvZU0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyNVxR7k; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyNVxR7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715150473; x=1746686473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwQRrTO8qrvRGt13Z6f5uuP1WeHSk26OtYwJm3qtGls=;
  b=HyNVxR7ktwsm7yIBX9T82N7tpy0JsfnycGCFqiqFm7f2nA5Km0MJGUKa
   Zcu6uGMIPOevsiFXNiW4KWvjNPUkfWgvXX8QIFb8MWcZcIQZvPtUA93aH
   K6N5xJD+IQxRIW24LF6TPgu9iCDpbASUwhw44GSNnZGthxvmoCpOz32Kr
   sW1EG4+cZbX5QeHYrkkWPXbZaZzjcG0/OPoNR7FaylsFtgoTicse3gys6
   Z8NF6EDwA7KpRrTb+t40yY8FVUaaLZom6bVbwPzdcLi79qBAUG0qZX2Rk
   /39yHh5ya9/POgEzbHZ7Be7YJ7EtD2aZKEms9TLYgF3YJY9Hxdr0Fea08
   Q==;
X-CSE-ConnectionGUID: c5y9bHewTdiB6F05r7OVSA==
X-CSE-MsgGUID: j755xRUZQl6MD+004UwJRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14807247"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="14807247"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 23:41:11 -0700
X-CSE-ConnectionGUID: ve6CmnjRTaucEXrBE4/O5Q==
X-CSE-MsgGUID: 34YGRZJFSFWfh9ZdoSKkjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="33469118"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2024 23:41:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4azD-00035U-08;
	Wed, 08 May 2024 06:41:07 +0000
Date: Wed, 8 May 2024 14:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:tmppppp 10/10] lib/test_bitops.c:56:21: error: use of
 undeclared identifier '__free_kfree'; did you mean '__free_pages'?
Message-ID: <202405081427.1JjfCbjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux tmppppp
head:   f1c702508a99b036a5ca80b1755558f95e177b4e
commit: f1c702508a99b036a5ca80b1755558f95e177b4e [10/10] bitops: use dynamically allocated array in test_fns()
config: i386-buildonly-randconfig-005-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081427.1JjfCbjU-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081427.1JjfCbjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081427.1JjfCbjU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_bitops.c:56:21: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
      56 |         unsigned long *buf __free(kfree) = NULL;
         |                            ^
   include/linux/cleanup.h:64:33: note: expanded from macro '__free'
      64 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:95:1: note: expanded from here
      95 | __free_kfree
         | ^
   include/linux/gfp.h:310:13: note: '__free_pages' declared here
     310 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
>> lib/test_bitops.c:56:21: error: 'cleanup' function '__free_pages' must take 1 parameter
      56 |         unsigned long *buf __free(kfree) = NULL;
         |                            ^
   include/linux/cleanup.h:64:33: note: expanded from macro '__free'
      64 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:95:1: note: expanded from here
      95 | __free_kfree
         | ^
>> lib/test_bitops.c:60:8: error: call to undeclared function 'kmalloc_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      60 |         buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
         |               ^
>> lib/test_bitops.c:60:6: error: incompatible integer to pointer conversion assigning to 'unsigned long *' from 'int' [-Wint-conversion]
      60 |         buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +56 lib/test_bitops.c

    52	
    53	static int __init test_fns(void)
    54	{
    55		static volatile __always_used unsigned long tmp __initdata;
  > 56		unsigned long *buf __free(kfree) = NULL;
    57		unsigned int i, n;
    58		ktime_t time;
    59	
  > 60		buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
    61		if (!buf)
    62			return -ENOMEM;
    63	
    64		get_random_bytes(buf, 10000 * sizeof(unsigned long));
    65		time = ktime_get();
    66	
    67		for (n = 0; n < BITS_PER_LONG; n++)
    68			for (i = 0; i < 10000; i++)
    69				tmp = fns(buf[i], n);
    70	
    71		time = ktime_get() - time;
    72		pr_err("fns:  %18llu ns\n", time);
    73	
    74		return 0;
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
