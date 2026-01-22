Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1356221540
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769069088; cv=none; b=tnX9UBASXkBajlfCYBygifnQXb7PmrIFb1OdPniMWMiPQkfwzAx0oy57j0tPmXIrD2qfzwz0QoWMvmB07Yf8kNfHVhkiwIYNvI+TiWQJB6Vxu3qX5T6xRwR/AxtLjY8MqbMtkIuhlGVWAsqaKQbq984CsKSXRlFeFj+Nh2ZNfPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769069088; c=relaxed/simple;
	bh=xVdMDZavYUXU8qpApbkkI6EhcczS7BMVhM5nbxPw7xY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AHVHSqZhL2I5hj/UQyzi3gjqTLHtb2luSAXtfeUBiVV1qX/wqRLWj3xbe8R6728oe6042Sa2lJ3A3MGzjYapWstE5Fw4Z0kdZCSF7lDd46vsZh4PwL8SUQND7imTKaqLiL8n+wv7esoLY7l4Dq6DjWVvHPsgRu2cXxGeRZm3xJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDT4hcKg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDT4hcKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769069087; x=1800605087;
  h=date:from:to:cc:subject:message-id;
  bh=xVdMDZavYUXU8qpApbkkI6EhcczS7BMVhM5nbxPw7xY=;
  b=mDT4hcKg145/OB5qfl7BjGICrH2BknzpmWnyWr23FN0mZw0p7GURjBTN
   TfvA7+8+QfNdwSxMRTk0IdxGeZo9zUriJo+5dROM7f1yARTtKNgLzZTWu
   DE2OUfsD64qn0th7GHC2GPiGgtTjkYDoW5diGKb4jN2BXhrZ1b6bmOxwp
   iTwwao94DdBIlOijMOx1KrVgKO/9PAzaRVU3eTurVDQ9OA17oDGprFT2w
   nT6TDr6+nzeOsVUUcm8D22FMY3wdOnUNh1DIn92KcIQ1Yo+lXFggn8Ubg
   0n5iYCjD4BVVQROkT6CMClxpwHmty1LMrNy9EyrMMHAx/5hS0WaU2FTs2
   Q==;
X-CSE-ConnectionGUID: Lr6+fyD4Q5OHXx22iq9kMQ==
X-CSE-MsgGUID: tQoyDbQPSX63+FyWd1OHrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80930325"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="80930325"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 00:04:46 -0800
X-CSE-ConnectionGUID: 4jcAYE2URme3cSNXb8gmdw==
X-CSE-MsgGUID: llLIVkZ2RiijFYHAaIcviA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206577077"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jan 2026 00:04:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vipgH-00000000SaL-3oTb;
	Thu, 22 Jan 2026 08:04:41 +0000
Date: Thu, 22 Jan 2026 16:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 420/429] fs/romfs/mmap-nommu.c:66:42:
 sparse: sparse: dereference of noderef expression
Message-ID: <202601221505.RxftadLx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   dc4fe40a11269aead253fa0beb098b00417b8694
commit: 57a654376d4bb67119d436edc8c3c4c0ecb3c369 [420/429] mm: update all remaining mmap_prepare users to use vma_flags_t
config: sh-randconfig-r122-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221505.RxftadLx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221505.RxftadLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221505.RxftadLx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/romfs/mmap-nommu.c:66:42: sparse: sparse: dereference of noderef expression
>> fs/romfs/mmap-nommu.c:66:42: sparse: sparse: dereference of noderef expression
   fs/romfs/mmap-nommu.c: note: in included file:
   include/linux/mm.h:1954:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1954:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1954:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression

vim +66 fs/romfs/mmap-nommu.c

    59	
    60	/*
    61	 * permit a R/O mapping to be made directly through onto an MTD device if
    62	 * possible
    63	 */
    64	static int romfs_mmap_prepare(struct vm_area_desc *desc)
    65	{
  > 66		return is_nommu_shared_vma_flags(desc->vma_flags) ? 0 : -ENOSYS;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
