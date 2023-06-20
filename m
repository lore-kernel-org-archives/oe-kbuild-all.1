Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA7BFC1A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687256536; x=1718792536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RyZhsxOk7rJShqq7JUiZU4HJzC9GOQ4nijC5s3cKFlw=;
  b=YALiyiARFFl8FCnfFJ8QuDNQPmYVMX2rXZvws53y9DnyPwmPuBcTOs0A
   3NjMl6o3oxpDtB6u8GXQST0uhv9x7oLd37tmIQ+pUWTPrdLt7U7ii1kZy
   K+pDCI6P7IV/eoLXZRMNdQWD8N+tOumseQh7Cv0nducerTO2DaEgvrE/H
   Vj+pVYSMBqnLXzn0NjtbgYXUHlwaXtCmYbyvQT1wHO2L3JH/fv2PFCQzR
   qQOdrDPv3sp8SaKyc+zmQTQgvZMca227J+9eqCsWdiNyxU1jVyVM7l2K0
   77864TzdAn2uHGMkOl57PB1oDWSmt8y0B/btl3f/QutnpY64qcAVF5UcS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423487003"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="423487003"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 03:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="779368241"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="779368241"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2023 03:22:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBYV0-0005ns-2j;
	Tue, 20 Jun 2023 10:22:10 +0000
Date: Tue, 20 Jun 2023 18:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>, suzuki.poulose@arm.com,
	robin.murphy@arm.com, ilkka@os.amperecomputing.com,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
	rwiley@nvidia.com, efunsten@nvidia.com,
	Besar Wicaksono <bwicaksono@nvidia.com>
Subject: Re: [PATCH v4] perf: arm_cspmu: Separate Arm and vendor module
Message-ID: <202306201854.S2tjTpWE-lkp@intel.com>
References: <20230620041438.32514-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620041438.32514-1-bwicaksono@nvidia.com>

Hi Besar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ea8d1c062a0e876e999e4f347daeb598d5e677ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Besar-Wicaksono/perf-arm_cspmu-Separate-Arm-and-vendor-module/20230620-121723
base:   ea8d1c062a0e876e999e4f347daeb598d5e677ab
patch link:    https://lore.kernel.org/r/20230620041438.32514-1-bwicaksono%40nvidia.com
patch subject: [PATCH v4] perf: arm_cspmu: Separate Arm and vendor module
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230620/202306201854.S2tjTpWE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201854.S2tjTpWE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201854.S2tjTpWE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm_cspmu/arm_cspmu.c:386:30: warning: no previous prototype for 'arm_cspmu_impl_match_get' [-Wmissing-prototypes]
     386 | struct arm_cspmu_impl_match *arm_cspmu_impl_match_get(u32 pmiidr)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/arm_cspmu_impl_match_get +386 drivers/perf/arm_cspmu/arm_cspmu.c

   385	
 > 386	struct arm_cspmu_impl_match *arm_cspmu_impl_match_get(u32 pmiidr)
   387	{
   388		struct arm_cspmu_impl_match *match = impl_match;
   389	
   390		for (; match->pmiidr_val; match++) {
   391			u32 mask = match->pmiidr_mask;
   392	
   393			if ((match->pmiidr_val & mask) == (pmiidr & mask))
   394				break;
   395		}
   396	
   397		return match;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
