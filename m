Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD50337D11A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848390; cv=none; b=SQu8h3oWV49g0XgqJhzHB6S9cfx777sQpr3ryKcyS8RRPQ5DvgmJiI3PZwBdFRmhjA+8kR9gsgLbHyJrXVPVcybFmZu58CbuZROXEpZSVQx0by2jnyNNiiEo883GI5tsOKiyD39qPk0so1vclGfFasOZG4FS37Rbs7j2714DQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848390; c=relaxed/simple;
	bh=/LoW1NgVySefYl4hrQNWCGJHz1PND33jQ46j9eT1UEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gBbdhvJbAEHpw/FVj+eoQvXVASt1gxyczbqjMGMPDoo6jwPJenM1QkmFoyURl/7prlaU1JFhOzgo2KkXc84xb43cIBTTfb7Upcwfkwf92t7/U0BW3TfZ1fbBkq3ebmyL6nRtRYKFWwIAzupZ4qNV58yI2EkvAu576vV3HytAjCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccueC4Hs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccueC4Hs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790848388; x=1822384388;
  h=date:from:to:cc:subject:message-id;
  bh=/LoW1NgVySefYl4hrQNWCGJHz1PND33jQ46j9eT1UEU=;
  b=ccueC4Hsg4zcrPTkdFG1MENPXO8TfCMpelOqCUQ9d+0lOFgH8zLXUjL/
   P2Av5ilGmHBI+OD8JQbeJbfqJBbE9EOUmhgc4lw9w6xlaVL5C5RRiWcxq
   VlBtvpbY89wt6D+MaBwlaFQqexuszcDrqvvDr0p14RaG55qoiXEGkOlMt
   zsnsiKj83LJzgscOdt4SE66uMHGHXElwU5a6v79q8mPHG40k6MFhJECXJ
   w0BH+AJ/8twisKOdz1mKQYav8RWLmf/dV/1g2/E5NrC4wMQ7FctYf6Jxb
   t/+d6auPupATFsFLBL62CJCEFBGvmSP3hybWneZRDNTUA4KxDadYYXmSV
   g==;
X-CSE-ConnectionGUID: HfceK+wtQU29g2QH7bp+OQ==
X-CSE-MsgGUID: 8fPFgtIvRa6xm6dHHHeiqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90459275"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90459275"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 02:53:07 -0700
X-CSE-ConnectionGUID: J9UGfUxJSBqtBMO24fOX+A==
X-CSE-MsgGUID: jJYVCciHRe2CKAPtTlPiUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="273756887"
Received: from igk-lkp-server01.igk.intel.com (HELO ae472ef62802) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Oct 2026 02:53:05 -0700
Received: from kbuild by ae472ef62802 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCDTL-0000000005j-1QPz;
	Thu, 01 Oct 2026 09:53:03 +0000
Date: Thu, 01 Oct 2026 11:52:58 +0200
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [drm-msm:msm-next 4/25]
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c:2424:28: sparse: sparse: symbol
 'a840_limits_tbl' was not declared. Should it be static?
Message-ID: <202610011141.2iXEaQS2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   8eeca96ad1385e97c3ba4657e6f0b47773ec22da
commit: 08d5049d9e844f114c53bba6a091ef957f4e9be2 [4/25] drm/msm/a6xx: Enable CLX feature on A840
config: arm-randconfig-r2305-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011141.2iXEaQS2-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011141.2iXEaQS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011141.2iXEaQS2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1134:1: sparse: sparse: symbol 'a6xx_gpulist' was not declared. Should it be static?
   drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1694:1: sparse: sparse: symbol 'a7xx_gpulist' was not declared. Should it be static?
>> drivers/gpu/drm/msm/adreno/a6xx_catalog.c:2424:28: sparse: sparse: symbol 'a840_limits_tbl' was not declared. Should it be static?
   drivers/gpu/drm/msm/adreno/a6xx_catalog.c:2616:1: sparse: sparse: symbol 'a8xx_gpulist' was not declared. Should it be static?

vim +/a840_limits_tbl +2424 drivers/gpu/drm/msm/adreno/a6xx_catalog.c

  2423	
> 2424	struct a6xx_hfi_limits_tbl a840_limits_tbl[] = {
  2425		{
  2426			.feature_id = GMU_MIT_IFF,
  2427			.domain = GMU_GX_DOMAIN,
  2428			.feature_rev = 0,
  2429			.cfg = {
  2430				.enable = 1,
  2431				.msg_path = 0,
  2432				.lkg_en = 0,
  2433				.mode = 0,
  2434				.sid = 12,
  2435				.mit_time = 5,
  2436				.curr_limit = 6000,
  2437			},
  2438		},
  2439		{
  2440			.feature_id = GMU_MIT_IFF,
  2441			.domain = GMU_MX_DOMAIN,
  2442			.feature_rev = 0,
  2443			.cfg = {
  2444				.enable = 1,
  2445				.msg_path = 0,
  2446				.lkg_en = 0,
  2447				.mode = 0,
  2448				.sid = 9,
  2449				.mit_time = 2000,
  2450				.curr_limit = 6000,
  2451			},
  2452		},
  2453		{
  2454			.feature_id = GMU_MIT_PCLX,
  2455			.domain = GMU_GX_DOMAIN,
  2456			.feature_rev = 0,
  2457			.cfg = {
  2458				.enable = 1,
  2459				.msg_path = 0,
  2460				.lkg_en = 0,
  2461				.mode = 0,
  2462				.sid = 7,
  2463				.mit_time = 3,
  2464				.curr_limit = 30000,
  2465			},
  2466		},
  2467		{
  2468			.feature_id = GMU_MIT_PCLX,
  2469			.domain = GMU_MX_DOMAIN,
  2470			.feature_rev = 0,
  2471			.cfg = {
  2472				.enable = 0,
  2473				.msg_path = 0,
  2474				.lkg_en = 0,
  2475				.mode = 0,
  2476				.sid = 7,
  2477				.mit_time = 3,
  2478				.curr_limit = 6000,
  2479			},
  2480		},
  2481	};
  2482	DECLARE_ADRENO_LIMITS_TABLE(a840_limits);
  2483	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
