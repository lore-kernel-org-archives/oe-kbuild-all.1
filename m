Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B28D111A8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076346; cv=none; b=JPvopbPIDU9WiwwD6iMrv4akA0PvH3nEwN3U5vKe4itg+BUFLQAdzx287V7BVZDU+mK4kPVvFlNvNM+RpHeVHSRBc89iHYalNaOJXhXTlC4F1BmBHmqomID8OxtZswUJ8Pffsc2tDYzYZIz5+VZ1y7Jvafb5Rg0sj3fulwbYKXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076346; c=relaxed/simple;
	bh=WWoqVmBRaWUFKOY36UKJC3eCI4MNiRi+WvNV7nLxwBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vo7MWJMDTza0mtAO4vh54O0GpE/tpfASHQUDX28Gvzl1mu/TEY0OuqGSAHzLDrYDp1cNoIOc4nugUz0r9kxIGCQnpTa3pVLJ9x3XNsWe6oFv5AF3tJRw65hZktsG8/xNp0IbDtp/HwPw0v8sSqoGrBKzVS9pJLY/rAAphbR+eKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMR0obAV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMR0obAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744076345; x=1775612345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWoqVmBRaWUFKOY36UKJC3eCI4MNiRi+WvNV7nLxwBU=;
  b=nMR0obAVRBpE17/58d4zULiGZ0L1Sp6dDDrCxj6txuWNC4DsmybiGXVJ
   Aw8qQ9O2qOnnEcoAx118UcUAURY2K56IggVtKwsr0sRbTz8MFPaGRhIx1
   Dwt1WZeLrvt91Wzx+JQUnN+YUYacqULmUaYZu7ZII5z027EgDGprQ/ZkO
   ePYdN5BFAUaGWDUhEvqRzX9a8AC8Z7/Pc9tPCR9Z2qmOEfCnwQtdugonK
   C28LG2ccESxuaMXkPVl7kZo9mE2vZCgHzxGogb4Y+0+WAxvL8GodXgIy0
   W18R2FPh+SmJ+iv3j0jQOTu7mfJlmbrVcVSkVlKKcUz82ncAM2hJBAdr5
   g==;
X-CSE-ConnectionGUID: RJgS5qAVR+KM19ylg8EnYg==
X-CSE-MsgGUID: XS7+l6rCQK2aeKN18NSsuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55675883"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="55675883"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:39:04 -0700
X-CSE-ConnectionGUID: dK6GwwyBQlaNQn+QkgBLzQ==
X-CSE-MsgGUID: TtPonmBuRPaCIHaqum19bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="129065880"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Apr 2025 18:39:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1xvY-0003yJ-0G;
	Tue, 08 Apr 2025 01:39:00 +0000
Date: Tue, 8 Apr 2025 09:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327] mm/vmscan.c:3257:21: error:
 implicit declaration of function 'kernel_swap_enabled'
Message-ID: <202504080927.7eGn2cDH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liubo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3191c9e4e7c581bfe0a40ee198ffcbd5c3dea53e
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1327/1327] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-005-20241216 (https://download.01.org/0day-ci/archive/20250408/202504080927.7eGn2cDH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080927.7eGn2cDH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080927.7eGn2cDH-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   1 warning and 1 error generated.


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
