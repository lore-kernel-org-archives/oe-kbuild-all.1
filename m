Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81131C8604
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 04:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756702280; cv=none; b=QIuGW5h63YLmJC7QLC46RXsYv1Bbh2M+fPEfDAVY5zCLyg9zB0crhVmwQPugncYNl+s0yBrg74bJuY2juQVl7FTHQnymj+j9P3xadZNA/E7UjwKpO4u0gENIqs3HGLuVOsdKkZQtXqJtNucYGXJRTKyMRdMq278rOiWjQBkglJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756702280; c=relaxed/simple;
	bh=qWzHMnhWJPGYYa/YJjSa67Pa9RtqpspkCzZriyFyb6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uEWb9xVQAkkQkds7TCPoiQ9AXMz2Yd4v5L88VA/EjmL2gJUEhHbcK3i+TiK9fi5RdTqAc9SnbzTfnPtpp6DE8/Ff0tST/Rg4LCncWNBGIZl6GJPTe5fVjKu8yxDbyFrcSYg5BrMN0hfsQknigYwHxc0WmZtwVxaYCitkRgrR/Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAECgDrz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAECgDrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756702279; x=1788238279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qWzHMnhWJPGYYa/YJjSa67Pa9RtqpspkCzZriyFyb6E=;
  b=AAECgDrzkKV8UGLaVIxZ3zOvnfs6aJqFD9kOKk8u/czQxxWvQC3yn8DQ
   SOHhZXYNZbagn2KwGsCGNENqf0xzqGTbN7m+tuPkeY96XGnt3G3pn3njA
   YTiD8/Rzy/YxHwcuYbI5vrZpAmHZg/HXvCtv2ovlyBF+l69MQzSStTPug
   QGdlsQ0PsEinp4P2UKY6jbylmg1IQCbi3Y5TQ9YsGfCBjCjVmveJFSqC0
   dQjSFlw9+eAKh+nUnTR2BESmYB476g3QPafOBb/tnTJTdW0JkQ80+80j1
   21Uyj2KQI87XtCehFNEdhXo/Fb+9tJk15MvbNpFdpQITeThxGKFZ0z73j
   Q==;
X-CSE-ConnectionGUID: XD0AzmlLT4qbNY8rS8WxRw==
X-CSE-MsgGUID: McN4OAadSSGxp6/BYxgUTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="69164005"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69164005"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 21:51:18 -0700
X-CSE-ConnectionGUID: mqomEWrUSzStAxwKefinSg==
X-CSE-MsgGUID: 7cbArqEHQGm7uqrNVJvMGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171258357"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 31 Aug 2025 21:51:17 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uswVK-0000EL-2x;
	Mon, 01 Sep 2025 04:51:01 +0000
Date: Mon, 1 Sep 2025 12:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327] mm/vmscan.c:3257:21: error:
 implicit declaration of function 'kernel_swap_enabled'
Message-ID: <202509011244.xk0lo5DG-lkp@intel.com>
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
head:   7dd09dff93e7ad921baf5cec4b58301d9aebb79a
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1327/1327] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-005-20241216 (https://download.01.org/0day-ci/archive/20250901/202509011244.xk0lo5DG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509011244.xk0lo5DG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509011244.xk0lo5DG-lkp@intel.com/

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
