Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FECD19046E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730876958; cv=none; b=a6LQJ+FHSNS91O1oVD6ra8t/9/5d4Fgi+Vxlm41RM3bYX0sDgoX5bgt8dQwzqMqw6PfVK+kGlK2hgzN4jvHgjh91hte10uA6pKncfdeUeQMlTRPvOz+I8DeeJ2D12NVBsx0kfY1vPWPVuYQMDwA7SBLVEC2cHNGwxObmRED5yso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730876958; c=relaxed/simple;
	bh=BH+2/wL6fP/XcN+mi+DcVh+27bUl3r/8r2YV+MqiC+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=goQjZpNAasdBs+xFO77pg0f1S2kSUMy1Am7lksVQaKMnEaIA9Np717BfMWSXylv1KOmRPybpl7CFBtWv698BrsA10yuOVfMrKuwj5bDObXq6Gc5Gh6yloeMiUgCV8JkVcmylo4BzMaDgjRUpuP4mh4c5j6fOC5tAhkSw/ntLXu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3Ddypmb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3Ddypmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730876957; x=1762412957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BH+2/wL6fP/XcN+mi+DcVh+27bUl3r/8r2YV+MqiC+M=;
  b=C3DdypmbnVQfSNzWx1FGzLZ+nJxKjQ+uslEEHG/XmcnoKrSEVqDiNMkK
   kOR6mdQodxc8L0e4ILc9rYeZWU1DZ66dd57z+LsBkdcA0GAWQNjVfKA35
   H05rliFPGzJkpR94p5Txut26fnl4MNK7nw2UjIm4eYgwvwF0XmJJ73g6U
   gJYKzc/QN7WKF5PuH5Y/lXxuyeT5nr+KOpKyZ1rhDzutGG3hKsk4MofMU
   +C4R87OzjiAbLjXNtLI0snR6D9DjMJWDSvx3OTzy7p5qwNGvK/Plok/hi
   xde0gnce0vAN198ZbMfnkLqj3c7QTBCvtPWOHxKaauzJvGavz2b4xmI4z
   g==;
X-CSE-ConnectionGUID: IvzP77caTiia+2ltwtdHCA==
X-CSE-MsgGUID: 2w7fCD/lRRKA4JM0jd0oHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30623885"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30623885"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 23:09:14 -0800
X-CSE-ConnectionGUID: I8aXufsBQlSdzf0soJABiQ==
X-CSE-MsgGUID: D6UZ0D27RCOAzoUobnRFbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84505504"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2024 23:09:12 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8aAA-000n2C-0q;
	Wed, 06 Nov 2024 07:09:10 +0000
Date: Wed, 6 Nov 2024 15:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1225/1225] mm/memory.o: warning:
 objtool: __apply_to_page_range()+0x67c: unreachable instruction
Message-ID: <202411061528.694k8VkC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: dd365884b743523ae70dbbf469bca8168f40ba93 [1225/1225] mm/memory.c: add apply_to_existing_page_range() helper
config: x86_64-buildonly-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241106/202411061528.694k8VkC-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061528.694k8VkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061528.694k8VkC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memory.c:47:
   In file included from include/linux/hugetlb.h:44:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4707:3: warning: cast from 'int (*)(unsigned long, unsigned long, struct cgp_args *)' to 'ktask_thread_func' (aka 'int (*)(void *, void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
    4707 |                 DEFINE_KTASK_CTL(ctl, clear_gigantic_page_chunk, &args,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4708 |                                  KTASK_PTE_MINCHUNK);
         |                                  ~~~~~~~~~~~~~~~~~~~
   include/linux/ktask.h:139:3: note: expanded from macro 'DEFINE_KTASK_CTL'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ktask.h:123:21: note: expanded from macro 'KTASK_CTL_INITIALIZER'
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
>> mm/memory.o: warning: objtool: __apply_to_page_range()+0x67c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
