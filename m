Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28A218E09
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xjm1Jmag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700637589; x=1732173589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HQBneX5mihgVneYMkNvY4OGh3qZtIP48ic65rhciGh8=;
  b=Xjm1Jmagoot0uw8Awn/TeVFT17SB+wW+qhO6meKPYiEWKM7BYp6OtPtP
   5/UX9viZeFB9gfcdAqEBUXhbeo6YhX1R3KTls9167q8IVwZByKTRbIBFa
   w8UIJYsr9um6tzEhGAy04X5zVCXZFLLYmToSM/Nx+pXR42QoEMU9OvB2a
   JPbXXZ3LB559CPnhLLyMOAO1VpFbP9gxN7Hu8TYImlkidAKMzCBT2EffM
   YMm7JNs+rpJ20SnTY0pxLrX9ryM9Yt6UfYhdYOseKms47ySdpo0lqv/H4
   qkc1DpQtprJ6uDTDRK87OKiDYrVPO7gu/8F8VN0fuQN34K5z3SgZuXXKH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382395294"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="382395294"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 23:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="890469467"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="890469467"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Nov 2023 23:19:48 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5hWU-0000Bl-0C;
	Wed, 22 Nov 2023 07:19:46 +0000
Date: Wed, 22 Nov 2023 15:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 12/19] x86: Implement the Memory Table feature to
 store arbitrary per-page data
Message-ID: <202311221345.9sPNLiAU-lkp@intel.com>
References: <20231113022326.24388-13-mic@digikod.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113022326.24388-13-mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-13-mic%40digikod.net
patch subject: [RFC PATCH v2 12/19] x86: Implement the Memory Table feature to store arbitrary per-page data
config: x86_64-randconfig-123-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221345.9sPNLiAU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221345.9sPNLiAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221345.9sPNLiAU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/mem_table.c:47:14: sparse: sparse: symbol 'mem_table_base_level' was not declared. Should it be static?
>> kernel/mem_table.c:48:14: sparse: sparse: symbol 'mem_table_nlevels' was not declared. Should it be static?
>> kernel/mem_table.c:49:24: sparse: sparse: symbol 'mem_table_levels' was not declared. Should it be static?

vim +/mem_table_base_level +47 kernel/mem_table.c

    42	
    43	/*
    44	 * Within this feature, the table levels start from 0. On X86, the base level
    45	 * is not 0.
    46	 */
  > 47	unsigned int mem_table_base_level __ro_after_init;
  > 48	unsigned int mem_table_nlevels __ro_after_init;
  > 49	struct mem_table_level mem_table_levels[CONFIG_PGTABLE_LEVELS] __ro_after_init;
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
