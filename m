Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392112E5B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 06:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747808548; cv=none; b=kBtw2lzsU60bjQ13Y2Bud4Y8/29rlccClbbQpZ0IdcKlrr2WOZGD/A73WxaWHlRDs7SjaQR0TUoRdyqeK9vk9YMhFNYEawDqiKeZlpXR3S2pUeNXMcH2hDiP3vFowcyp9XTikh5JsnmhG8jzlVY8YXVe3xhwef8MF5JFvNw/rxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747808548; c=relaxed/simple;
	bh=tb0rv2Vx5a2jleh89F17Y3/qSV1RVB+jnQkZ+iooR9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHG/zZpUvehz5czCKDWlFV/yvNNAJ8f1DglpAAd0ZAwVwgLNUyYxIp0HMIEaxTGb5J4xuyDFI+k8qvQYFSF7T4JnUvQBNlRiY4GRqZKFix7TORCEltkdsMKFvwn0v+WnOdbbLPe6gJw8M2SqUY7ppE/cn7IbaOopZ7YtBrbzhC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L91Cy+4R; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L91Cy+4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747808546; x=1779344546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tb0rv2Vx5a2jleh89F17Y3/qSV1RVB+jnQkZ+iooR9c=;
  b=L91Cy+4RI8l5y1/l+XaBQO6Mn6n6VjMo/2mqGuWPI7kRFHKgZxjG3o5x
   pCnB2mOjncdVRr8TQN+Iq/IFwk1BMzpeDvHtgVmtZbpbHpMckJq+q9Blz
   6MYjCedEK9mvJA1TDnUg8fZiQ7A4nRCJZSn12WtgxsXRMYIBRVNjkIIyj
   VWRx7c5KK/3WTUyM2e02hWXPG/LxWY/iyzUKtyQvZq0qq6bJWhK4Gtown
   lEOLJkSo6GHKLaewNET87b6Ty9qf4Uz65s/63eyUZyJLz3a0xKLXuyhAr
   dii+lgX8HMJOCv+GN+CqrgcILN2QYaNbIT3JA/aiRL9l5xYH5hFJBYneu
   A==;
X-CSE-ConnectionGUID: EBIH4X6hQtCyWnon+EwY9g==
X-CSE-MsgGUID: VRZMXTaRSrKnyegBCrXIsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48889189"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="48889189"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 23:22:25 -0700
X-CSE-ConnectionGUID: GXlRqALoS0uccgFl2mHRKA==
X-CSE-MsgGUID: 7hZG0tzyRiagYZZRaMdS1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170928938"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 May 2025 23:21:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHcpN-000NwK-1L;
	Wed, 21 May 2025 06:21:21 +0000
Date: Wed, 21 May 2025 14:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327] mm/vmscan.c:3257:21: error:
 implicit declaration of function 'kernel_swap_enabled'
Message-ID: <202505211409.Yqcxm2Qg-lkp@intel.com>
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
head:   2eb609d2f89b2d85d89cb018c3f97050989807e2
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1327/1327] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-005-20241216 (https://download.01.org/0day-ci/archive/20250521/202505211409.Yqcxm2Qg-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211409.Yqcxm2Qg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211409.Yqcxm2Qg-lkp@intel.com/

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
