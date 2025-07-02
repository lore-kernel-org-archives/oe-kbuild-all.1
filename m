Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40032277CBE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 16:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472380; cv=none; b=Tfr/qI2TD2kc4LK/JwyRhtE+MNwNd+uDmvM36+nqKJkY5zxo07ILWSwj1gW2T4fi4iH2/1gVM4/islYpJgpXP6JZD/Zb79WP75ndTR4/0paX8l5BqDazk6CFGxl4DY+qCnXRbE1xpqKrbGDt4sEuMgkECRPzvXWByg6K9uKFtFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472380; c=relaxed/simple;
	bh=1cHpxiEe084IrQNWs8CfW5GmlkSS/p3OTZgrqj8xTKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDjhU4laKD1AUCiBQ1PAVsKgUXgEJxfygc4ThxAWxU4EtHMeMVU7pXLAaiYVQVCS0RNWI0FHJGnepWg8eSL1p4oCNX5LwludHWLMey+Oz83qatN8xAzK5T+TF3YiCJGxW2+80LP+xkHITQzEepoR7AtqwZttSj6tmwhtQPVPHas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIkXTzB7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIkXTzB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751472378; x=1783008378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1cHpxiEe084IrQNWs8CfW5GmlkSS/p3OTZgrqj8xTKw=;
  b=mIkXTzB7wokpCVy0gCBkwZbcxzK9GCGw9wUXfd/bOeKV1hPjlu71qnpO
   ie7Bt2U8GX46uA+85xNLDmjFZQnEdZv4j90Vv4bgetuPbVmn/Vtf4TtqO
   y96Z8hEfU/yWitio1CxCJW5TVUB+8ERaR6oX37KB5/2fDHO2Sb72K26aq
   RK4Lizq9xmcgmrSoJyJzinMxoe9IWdJHYrwDFS1WciQUJ4VyWqUKTRsiO
   8gI5osPNg0qD5YCuWeAEqakpqYUFystyyJ144BilkpYI9YidboNSLgDz0
   dwgHsFICYCqR5/0H7nq7uii6i6nT5jxXt9xX68ZD7qlx/4Ic8CM07+7Fi
   A==;
X-CSE-ConnectionGUID: ZPMXAjPBS+2n4ZJ4PkowGQ==
X-CSE-MsgGUID: 7nJKoslcSTyRzo4NaXkKaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="79219441"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="79219441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:06:18 -0700
X-CSE-ConnectionGUID: X7CFnwvVQQ27SSkSCLpqRQ==
X-CSE-MsgGUID: Rx0CrSDJSoShSRikpbd8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158500081"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2025 09:06:16 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWzyQ-0000JR-1X;
	Wed, 02 Jul 2025 16:06:14 +0000
Date: Wed, 2 Jul 2025 18:05:46 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] mm/vmscan.c:3257:21: error:
 implicit declaration of function 'kernel_swap_enabled'
Message-ID: <202507021830.RRt4mQ1g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1605/1605] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507021830.RRt4mQ1g-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021830.RRt4mQ1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021830.RRt4mQ1g-lkp@intel.com/

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
