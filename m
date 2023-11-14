Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43391224CA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNAzUkkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699969407; x=1731505407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6VwIraGNFNcEbcFRhPWTzddi2+t1Nd4XYUvQWVB6Yz0=;
  b=MNAzUkkJC4R0M99nTINGymXaq+jqytgVsWxsd0sAoKrdPhyo3k5OAS75
   jwc42WhmLRNY09kNYThU9AfOrHU8uHH4EzazL2DZy6DQVIaIu4lXspebA
   sQfEs3lnp4MGQBNx+9iR6D7CoTCoQ+tdnCNZ/Rw96BP8+C7DfHaqdp7QI
   hwH0EHWlPBcWFLJyopeL2cd6B4TLlxnSjYV2zCH1+0BTFdlJHmgzWi1Jg
   BVTVKTJskPSasBeGDIUNpP2B51Nu1vIHBq3F+PnxXAS8u7o3Q3kR0jsAf
   tuCNSWTPLmMoOVARJUMjPpNO+DhnL85Gqp4jXTClKxSOqQOjkslfm0lAV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3761152"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="3761152"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 05:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938092066"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="938092066"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Nov 2023 05:43:22 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2thH-0000HL-39;
	Tue, 14 Nov 2023 13:43:19 +0000
Date: Tue, 14 Nov 2023 21:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, sudeep.holla@arm.com,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, dietmar.eggemann@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	linuxarm@huawei.com, yangyicong@hisilicon.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] arch_topology: Support basic SMT control for the
 driver
Message-ID: <202311142157.B3tyngmI-lkp@intel.com>
References: <20231114040110.54590-2-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114040110.54590-2-yangyicong@huawei.com>

Hi Yicong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus arm/for-next kvmarm/next soc/for-next linus/master arm/fixes v6.7-rc1 next-20231114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/arch_topology-Support-basic-SMT-control-for-the-driver/20231114-120544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231114040110.54590-2-yangyicong%40huawei.com
patch subject: [PATCH v3 1/4] arch_topology: Support basic SMT control for the driver
config: parisc-generic-64bit_defconfig (https://download.01.org/0day-ci/archive/20231114/202311142157.B3tyngmI-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311142157.B3tyngmI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311142157.B3tyngmI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/arch_topology.c:32:12: warning: 'topology_smt_num_threads' defined but not used [-Wunused-variable]
      32 | static int topology_smt_num_threads = 1;
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/topology_smt_num_threads +32 drivers/base/arch_topology.c

    30	
    31	/* Maximum threads number per-Core */
  > 32	static int topology_smt_num_threads = 1;
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
