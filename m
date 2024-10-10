Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8D92207A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728522641; cv=none; b=Lnev+WS/TZxZk5/uOfSrhHm4eOmN9Tx+c3qYipzOzFtAIi6Bxqa7n5KaHIEEar9RmW2wztI1sCokko5aWLAXcDVCh7o10MW8u4L5mKSqFKhyonh3RO/XJc6Da3p/+NePivB1PDITaEdkOMJwTOu0DnD3m9IQsV/bnWMx9kRhMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728522641; c=relaxed/simple;
	bh=wAz94XaFMBRYrfN/U2AS8NuTWNFZN+tu7CfDeXqquuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suBGlV5ZkPp0ckJq+GY65rmFJWy+fObDQEkBaw15NAlCyveOLCDNLUNqVD+VWjIFYXqN0FZ35fVu5YztW9cyBsCXxKBKR4kdPPcTM3P03bfxh4u2YxhPsYtphV9YrknywkyKevQP/aRjqzhlDEsVHyv+2vLaSMfuBiACxoQdQcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgXkdRCi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgXkdRCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728522639; x=1760058639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wAz94XaFMBRYrfN/U2AS8NuTWNFZN+tu7CfDeXqquuk=;
  b=HgXkdRCi/BYKtJemRghD8x1zLSP/LF4SrpKcHEo4F+LDs3p8lFzQKzyc
   67mR50fc7J3V9TZh6YGzrKO0JRGJbdQEK1YVN+yJm96DP6/PSPk1kXpvc
   541KfrWHQMvS6uWt4UkEYQR4gCv1b2cMy6KJNqQRLgUkLlaI9XQQ1BvxU
   c3iGGFwYjFPTo+yGIJ7zQAaQHc75TzW7A6ft2g/6UPXOllQWppFh5lx2Z
   f2w+oi0ls7qDwkarb4O1ynr5iShYyizUbQMvaOSKcZdksWrG/CpnxWy+i
   iQINVjQ5MHH/C9hPTbDt8p9nKw6ncnuSXKG3QnmpXzLeWRpMnQy3QlwVK
   A==;
X-CSE-ConnectionGUID: yapOkaf5STapeH9uXVIl9g==
X-CSE-MsgGUID: r5e5MF8fQ8WLfmY+/Mi25A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39250047"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="39250047"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 18:10:39 -0700
X-CSE-ConnectionGUID: VRuQOVujQSqziKmbOn2DeA==
X-CSE-MsgGUID: fVCIHmpSR7uS/8woAilvqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="81448303"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Oct 2024 18:10:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syhhL-000A0S-0c;
	Thu, 10 Oct 2024 01:10:35 +0000
Date: Thu, 10 Oct 2024 09:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Aubrey Li <aubrey.li@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 23034/30000] kernel/sched/topology.c:1749:2:
 error: implicit declaration of function 'register_sysctl_init'
Message-ID: <202410100921.MexAROBI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tim,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c9c7afae6802fd2282529d80c0f808360f7b654a
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [23034/30000] sched: Add cluster scheduler level for x86
config: x86_64-buildonly-randconfig-002-20241010 (https://download.01.org/0day-ci/archive/20241010/202410100921.MexAROBI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100921.MexAROBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100921.MexAROBI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/topology.c:5:
   kernel/sched/sched.h:1838:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1838 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/topology.c:718:6: warning: variable 'numa_distance' set but not used [-Wunused-but-set-variable]
     718 |         int numa_distance = 0;
         |             ^
>> kernel/sched/topology.c:1749:2: error: implicit declaration of function 'register_sysctl_init' [-Werror,-Wimplicit-function-declaration]
    1749 |         register_sysctl_init("kernel", sched_cluster_sysctls);
         |         ^
   2 warnings and 1 error generated.


vim +/register_sysctl_init +1749 kernel/sched/topology.c

8ce3e706b314091 Tim Chen 2021-12-03  1746  
8ce3e706b314091 Tim Chen 2021-12-03  1747  static int __init sched_cluster_sysctl_init(void)
8ce3e706b314091 Tim Chen 2021-12-03  1748  {
8ce3e706b314091 Tim Chen 2021-12-03 @1749  	register_sysctl_init("kernel", sched_cluster_sysctls);
8ce3e706b314091 Tim Chen 2021-12-03  1750  	return 0;
8ce3e706b314091 Tim Chen 2021-12-03  1751  }
8ce3e706b314091 Tim Chen 2021-12-03  1752  late_initcall(sched_cluster_sysctl_init);
9e68cc2bf535a2f Tim Chen 2021-12-03  1753  

:::::: The code at line 1749 was first introduced by commit
:::::: 8ce3e706b31409147f035c037055caa68e450ce5 scheduler: Add runtime knob sysctl_sched_cluster

:::::: TO: Tim Chen <tim.c.chen@linux.intel.com>
:::::: CC: Jie Liu <liujie375@h-partners.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
