Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BF042C13
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 21:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBHPowE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696629401; x=1728165401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uwamB1nyRoYmVff7LKjqtkmyW6HXE9lE5s1Rr896hzY=;
  b=aBHPowE+pG4OroS32Oxgv1lowBv4ksMVGLMXsNSziuYsr1nDGt5d4F5W
   A1Wbmntx5zMV2Iuqv9hzFh2kJ4GyPSwVi+z7CfAQLPpnfio4aW5WeqwQO
   /4S0OMUIMDVojUtggqDUIUtRyxOoxyZ3mDTQHzyPZls9N/FwFUMXHBPkS
   qSXoky1GbVW1gUaLwp86TpHjWjDNEgvT4jSmyiyjOD2HdCFHsGL+k5e/O
   oa9e8zEig1FMaLNl1Z0E76756NJCUCzwAhiBeS/DNs4zoEemC0Q0NMcV9
   aQ7yEkEg8ENutNQNRuyL2vFBGn3wiqKgUmH7BFpbB1IJmHuwK7x8/oCUn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="2447374"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="2447374"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 14:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="1083602959"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="1083602959"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2023 14:56:33 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qosoB-0003gD-2I;
	Fri, 06 Oct 2023 21:56:31 +0000
Date: Sat, 7 Oct 2023 05:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH v8 3/7] drm/i915: Define and use GuC and CTB
 TLB invalidation routines
Message-ID: <202310070531.PnbHOOWZ-lkp@intel.com>
References: <20231006182051.1599923-4-jonathan.cavitt@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006182051.1599923-4-jonathan.cavitt@intel.com>

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-i915-Add-GuC-TLB-Invalidation-device-info-flags/20231007-023252
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231006182051.1599923-4-jonathan.cavitt%40intel.com
patch subject: [Intel-gfx] [PATCH v8 3/7] drm/i915: Define and use GuC and CTB TLB invalidation routines
config: i386-buildonly-randconfig-006-20231007 (https://download.01.org/0day-ci/archive/20231007/202310070531.PnbHOOWZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310070531.PnbHOOWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310070531.PnbHOOWZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c: In function 'intel_guc_invalidate_tlb_engines':
>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4814:45: warning: implicit conversion from 'enum intel_guc_tlb_invalidation_type' to 'enum intel_guc_tlb_inval_mode' [-Wenum-conversion]
    4814 |         return guc_send_invalidate_tlb(guc, INTEL_GUC_TLB_INVAL_ENGINES);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c: In function 'intel_guc_invalidate_tlb_guc':
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4820:45: warning: implicit conversion from 'enum intel_guc_tlb_invalidation_type' to 'enum intel_guc_tlb_inval_mode' [-Wenum-conversion]
    4820 |         return guc_send_invalidate_tlb(guc, INTEL_GUC_TLB_INVAL_GUC);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~


vim +4814 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

  4810	
  4811	/* Full TLB invalidation */
  4812	int intel_guc_invalidate_tlb_engines(struct intel_guc *guc)
  4813	{
> 4814		return guc_send_invalidate_tlb(guc, INTEL_GUC_TLB_INVAL_ENGINES);
  4815	}
  4816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
