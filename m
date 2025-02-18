Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482F122E3E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739871768; cv=none; b=hlkPr+9ShcyvDYSMtppAmvWTGZ4rAzqYCfSVuH7y4CT0oYDi6pw5PwOys9xnYytZFCmMRrYulSPdn41rscuWL32xwfNTUBWR8Oz7SSIfyYG+82LNbRU/cqbXTGXP8tMPMARjOhTADbEzJLCdeQfya8qz28T07eQwHIbdSn8NvUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739871768; c=relaxed/simple;
	bh=m46kCOVFnAs79aiIbwMglXbCDQEF1G/MDCXhPZkvZH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UFM1HDziSkfv9S8sM+UC/qhYTukeIWMoPNbbYf0R3bx1DbiSMDsbqsDI/++ccAdI1s/1Dmu43Zd+UOffgtJOBSZLLSPPjWXnpOF8w5S/hI1R7aeDnjROx6r1HPskUEvOHDyIwscZNPIZ1nsBWA5c5KQTvIaAl2Th6DpICh81+KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTx/XF0v; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTx/XF0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739871766; x=1771407766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m46kCOVFnAs79aiIbwMglXbCDQEF1G/MDCXhPZkvZH0=;
  b=lTx/XF0vm5Bqugiyr+f6O/wR0fJrOiY+1w01PfM/hy/LX73MffJiwZUV
   3M2BvuPyiVMtB0+55c3R82fZBypcIecpR6/fRZ9Tr+EgBFLuDzYDFll4K
   iXs5EbjsjU1C+QbliQJqFhPwfCxOSazerrVGdvbXsY90bRdPgv9gZ/H/1
   bNiIJCjE8nwM4NyAYjz5/iFwlabCAbi5vDz3wSWyOWHu9Xwcu76Ov5swr
   HzuQzFjKS2J+FpdsKLmh8BrnAnGmVVd4Ym7oX9EEcMSg1R0uR9FTSux5c
   80Kkb2Az2gM+7BxekSAQU0DhBVfFjWtvBEAT5wrg310SG1jWjXs6PiGmV
   w==;
X-CSE-ConnectionGUID: OKUR+ptNSO+MMyhPov39EQ==
X-CSE-MsgGUID: 7hs06XsaQk2mwqzfnehO+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44484288"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="44484288"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 01:42:46 -0800
X-CSE-ConnectionGUID: X3eBvaOKT46hKaVeHKbxWQ==
X-CSE-MsgGUID: 2kqHZkWFQ96KEwdAoL8sFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="114996846"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Feb 2025 01:42:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkK7n-0000NP-0L;
	Tue, 18 Feb 2025 09:42:43 +0000
Date: Tue, 18 Feb 2025 17:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] mm/mmzone.c:117:47: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202502181708.uPvq4Xnj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   9cc94fea109e008b8d6739254d971d81c60332ca
commit: 31feff06a014b0241a77c06162831ea027d2946d [1/1] ANDROID: mm: Create hooks for ZONE_MOVABLE allocs
config: arm-randconfig-r113-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181708.uPvq4Xnj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce: (https://download.01.org/0day-ci/archive/20250218/202502181708.uPvq4Xnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181708.uPvq4Xnj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mmzone.c:117:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/mmzone.c:117:47: sparse:     expected unsigned int *flags
   mm/mmzone.c:117:47: sparse:     got restricted gfp_t *
--
>> mm/readahead.c:151:51: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/readahead.c:151:51: sparse:     expected unsigned int *flags
   mm/readahead.c:151:51: sparse:     got restricted gfp_t *

vim +117 mm/mmzone.c

   114	
   115	enum zone_type gfp_zone(gfp_t flags)
   116	{
 > 117		trace_android_rvh_set_gfp_zone_flags(&flags);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
