Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AB7B663
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022168; cv=none; b=deiH0ryCjDIO+FPQf7gov2qaNVMnMtWzBpYv1H35gKU2+2AscLWR1vMpVxAKWdRPHUWhvNaznPN2O4O3cLsx4m372bf1vj59tsdJAf670DMMmXKKfsPxqvYtwj9lJAbDlUBRBcO07DrdYOScvt1tf2YOzyb6shzNUBa0RZ/23MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022168; c=relaxed/simple;
	bh=cpu151zP3sMHJhuAJxAWv4pjvgwUQw+h5XnrHICVB2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFxkN+mIuW/C3n2b+ld+k5nYRAQcMNlp7QkjMwBI4+M6rL9S8Fvq0JuvyvYoWu6yAIPvZykWxIAfTlzGZzhwU/miQQgZEfDT4XWpBphn7Xzc0ZMlmqiHOfu1G+AcTv6resTucu7shUNQCouiQek9YepYphGAXIqW8yyQLGs8KPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qw/o5aAF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qw/o5aAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760022166; x=1791558166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cpu151zP3sMHJhuAJxAWv4pjvgwUQw+h5XnrHICVB2w=;
  b=Qw/o5aAF0Vd2O6tRsarcFSWE5tJ0p+JE2vBdi5k+YvAYZkC/XSbf9v8G
   XpB1G4IhDAF7rhanvYZaTYi/5DIs46jMCAHLyw1mXv9m+tZFj9LOEJlSF
   ogBpKwSlIvKOhXuQPA7Zg1GbuxeLqjXHsyZkvwsRHiRbEsCGz8T41sfLL
   HsDOeImyWPuDh86HDQQxEfxuRdbKdNLc3sFFzK1VfdEHmnrmH64Ja2nfC
   64s3ybRR9v70o+0PfJGV1oPmfJS04LlmHlwBjMmW2EZ0wn1jBYoILXPWo
   55HF2JGVzN8QW8fY544xTqZ4g8ldGzj8sVucc4mVqUy3+YDFOstTW36iV
   A==;
X-CSE-ConnectionGUID: I+WEm5AVQWWHUO9yXOBdJQ==
X-CSE-MsgGUID: H5uxcLsqSRCBno/B1EFEfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64855781"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="64855781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 08:02:45 -0700
X-CSE-ConnectionGUID: oZHRjQb8TRCfeQitWdDCVw==
X-CSE-MsgGUID: qdyXaMTuTMumhfTGJtgnqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="204440393"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2025 08:02:44 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6sAD-0000s0-36;
	Thu, 09 Oct 2025 15:02:41 +0000
Date: Thu, 9 Oct 2025 23:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327] mm/vmscan.c:3257:21: error:
 implicit declaration of function 'kernel_swap_enabled'
Message-ID: <202510092256.OaFtw9Dz-lkp@intel.com>
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
head:   b0534aa9eeb9c05e780430c051477b8eb5768330
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1327/1327] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-005-20241216 (https://download.01.org/0day-ci/archive/20251009/202510092256.OaFtw9Dz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510092256.OaFtw9Dz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510092256.OaFtw9Dz-lkp@intel.com/

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
