Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626C210E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 00:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743382174; cv=none; b=YxLsfS2vb/5eY0zoplH8Dej3OjLru/4w9N8hCdiD5hEjvB1ogzpBlAgqpYy5PN96GzYIYEhKu0f53uhAUoeDcCDkY7TdMKYiWFbu9W8Nf1QW9/jVHbYUx/EbZMN+Dc4H1Yq+Ts1OOzOyjrg3x3idvMk0sXlQ0Z5/UE9hWmrD588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743382174; c=relaxed/simple;
	bh=6dExAQYJra8VW/8UH45e6JxrVkh56uDBqhzxhHNTRXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdo49syhcDudXQJ0RQotYDG+e0I6s5ol9Po7vD71LOKS3A1pjkROtr01/DxrxLj0j6WWme59lK2QJP2j5ewh6NuhU99GH1CNUt80RlsIAE2yZrVb0GvV+3WHkA+1GKUNWfLxYnnkdovYZeGOrySGgm7PlXMT2k9aCde4DB+GTq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwV8phUd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwV8phUd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743382173; x=1774918173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dExAQYJra8VW/8UH45e6JxrVkh56uDBqhzxhHNTRXo=;
  b=MwV8phUduvkXjtiWfX1iy8u3+6YnBfGJDOe8mbyOe6y/rFaKmcLf3ygr
   RO1vyPi4ziUTarNC0x7DhUTdDay9XjxXIJmKDNEW+0xkQcofGQOG2xjlV
   ustRJ9mc13bY1h1M2YxbQp7oZXivqg/EE+lDxO1zfMGcAcg1Xb32QO1LU
   T873HN1yJRLZgTM/10ozUoQRLyGsBlej+ltCi32/Rl1xiKFQ6GyFMmCye
   kqTMI94bTNI47Ccm5U9nd/DVa4HozCAPIEb9lZUmZpI34siSBA5j78I7b
   QIlig1q4dPxTZjweQhbWLJIAlmw+2L/Uo/D5HPBSVMRrhB4CE1pDOcFgO
   Q==;
X-CSE-ConnectionGUID: 7qQxlaAFTmmLloyXfRSoPg==
X-CSE-MsgGUID: RVJAUGmGTE+7SZidvxN6fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44843768"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="44843768"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 17:49:31 -0700
X-CSE-ConnectionGUID: mb9XaJPoQzalBZy3hoXuHA==
X-CSE-MsgGUID: yelob/zkQje3MU6U4J0jJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="125957116"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Mar 2025 17:49:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz3LD-0008xC-1f;
	Mon, 31 Mar 2025 00:49:27 +0000
Date: Mon, 31 Mar 2025 08:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327] mm/vmscan.c:3257:21: error:
 implicit declaration of function 'kernel_swap_enabled'
Message-ID: <202503310818.VmXexZb9-lkp@intel.com>
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
head:   5b56c883c34a890a3f9ca7baa8aea426538c88a8
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1327/1327] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-005-20241216 (https://download.01.org/0day-ci/archive/20250331/202503310818.VmXexZb9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503310818.VmXexZb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503310818.VmXexZb9-lkp@intel.com/

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
