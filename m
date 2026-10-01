Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53850515983
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866515; cv=none; b=mJPu3vhxwxM292oCF96R7yBfGJahsMpRKkyPT6d3mzLl2kO2f4T7+XaaW1J6C7HWLE9t79pSApJoWihuw2exv+U1Wx+29asExtlpRjnJ8Sjuslb2nxqgwoGXWqclrRJpHfsGPa885MgKGh5FIpPn1RYobrxTJtJLzGrGqWTMRig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866515; c=relaxed/simple;
	bh=06F+oXQzEqt+T1JYhVIgDe4nxPHMnv+CXaxAfMtAudA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MzQDI0McgY4qovw+9cqVbg8MWr95YMTc5Iye+hb2fbaBbs/5mD/eHHPkjo9hAEb4FfBRw3fI6L4hdPCX4vykFJk8lv1G6cZLQCZ2hkjurKUqh1y6hRWQf8WBQRGGGuYhTkfVY9Ohn0YffHRSWnUZEO4EGTS1HQQt5mQ03ZB98jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnnUXkvg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnnUXkvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790866513; x=1822402513;
  h=date:from:to:cc:subject:message-id;
  bh=06F+oXQzEqt+T1JYhVIgDe4nxPHMnv+CXaxAfMtAudA=;
  b=TnnUXkvgssl/Zm935/1QGsCELlwvdkH+T5Dh6qCNvJCdj7I1LvcD/Poi
   zt6A0RnJnKcB82ORbjIdQJUeuAcK4iDkqkoKNr27eMtg41e+xeXTuBo+W
   yEbf6HHJiIo3HtXE+WOLn/Ttk02N3Dnm1PgR6EPpBC8tNtd76AwK2rprR
   QIjAZmnCNAcOSEa7nMYQjV0pYoDq+PuJkeSrxU9geWTKPa96pcGTv/23n
   /WWCb1TLtcFRkqGounSsaWs8XmrE321/zYm73G4uNm+ijlHrZfWSsbWmF
   u1b6pKLF2cGvm740KiE/8ky4ZWz6ttn0k8gHaRcOQNV+QFBvdMA1RFCIS
   w==;
X-CSE-ConnectionGUID: tJ4moL+HRy2+VTV0TUG+2g==
X-CSE-MsgGUID: pPp5BaEnRsuZhh4CVuR3OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94108086"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="94108086"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 07:55:12 -0700
X-CSE-ConnectionGUID: FRmpVhLJSXuiDgG/RXz6rg==
X-CSE-MsgGUID: op3fbTtwR2qABWBlHMiTrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279791522"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 01 Oct 2026 07:55:10 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCIBe-0000000007X-3g8S;
	Thu, 01 Oct 2026 14:55:06 +0000
Date: Thu, 01 Oct 2026 16:54:42 +0200
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [drm-msm:msm-next 4/25]
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c:2424:28: sparse: sparse: symbol
 'a840_limits_tbl' was not declared. Should it be static?
Message-ID: <202610011641.8FaGlNDg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   8eeca96ad1385e97c3ba4657e6f0b47773ec22da
commit: 08d5049d9e844f114c53bba6a091ef957f4e9be2 [4/25] drm/msm/a6xx: Enable CLX feature on A840
config: arm-randconfig-r2305-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011641.8FaGlNDg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011641.8FaGlNDg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011641.8FaGlNDg-lkp@intel.com/

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
