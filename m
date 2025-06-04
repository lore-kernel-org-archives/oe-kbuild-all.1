Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120FE3D3B8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749062547; cv=none; b=FdLkOqLtkwoKzPOXs3qYj96MlZ6aviJu4/LTfF+h2qEDRlhmiZka2V6z0BJ4QuqhodYNGtK1u0JyjmPCy2E7OsxXgPunKLgnOEmM4epGL5ETWez4JtZeWdns6lhkwY7dXlvgOoolRja2kv1qRqIVheJDE7DebmOK59p3EbO+J6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749062547; c=relaxed/simple;
	bh=btAvEDEY/qtV7RUCMBKmMTiFPGB5uBHggT6ogK2m8n8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mRq/GAd4hY1xq5TMgu/0O6fBTetaVe2S0+nf0uHzdJrjka5q9e79lgojmUMnn8DFM+iJQbeco/tSHvq9colB4DITII7Ap0sRzmu/gAgHCf8NAXQR5hGydyjcpc7TnvP+jryUJwbBcOoUQRzm6tZkfhVhTJ4MwecHisz+JyH7lww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1UPinYj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1UPinYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749062545; x=1780598545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=btAvEDEY/qtV7RUCMBKmMTiFPGB5uBHggT6ogK2m8n8=;
  b=F1UPinYjFKycfJLlyrW6m0CLz0O7Hjx0/q+ePSyC5zc9Qw4pByxRIzLy
   JAlDSGWBQmavuWOQOvWGdy/3Q3zfYdV2c0b30FQIp1TqiFNDkvL8AgnxC
   XA3553cROiqXZrxjBLNPjrGwpaY5MwxrkrYmvdi6v8VvvZLEc+w+866eD
   cHhep58pUVJJqZ4lSvNj1N8HqFyXfOAxV/8LRPBbqbj+T+MRSxnkXfdgV
   oOj+u3k+YWrqnjEdbZ5zKkuKXHhd1Bba3fFuz7EX12NAHVoDQ28vX1rsx
   Nfe+uNfVr/4P92jcL56BSzUeG23a9I89TckCLPrDtf7Oej3mFPTP19Svk
   w==;
X-CSE-ConnectionGUID: X4KgOpyxR6ys9o0NiUbpuQ==
X-CSE-MsgGUID: nQZhsFgsReeP1dSY85yZZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50856027"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="50856027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 11:42:24 -0700
X-CSE-ConnectionGUID: jjuyD/79QIKE9Mx/FIQjmA==
X-CSE-MsgGUID: PAdEhcJRS8GivEPXQ88vjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="176235332"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2025 11:42:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMt48-0003OH-1l;
	Wed, 04 Jun 2025 18:42:20 +0000
Date: Thu, 5 Jun 2025 02:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/391] mm/mmzone.c:117:47:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202506050254.qzDkTjNO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   3d3b9316ca19514479cedc15f8173485ad213f80
commit: 342be123fd886c8a7f3a91234b028ac127fd483f [0/391] ANDROID: mm: Create hooks for ZONE_MOVABLE allocs
config: x86_64-randconfig-123-20250604 (https://download.01.org/0day-ci/archive/20250605/202506050254.qzDkTjNO-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050254.qzDkTjNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050254.qzDkTjNO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mmzone.c:117:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/mmzone.c:117:47: sparse:     expected unsigned int *flags
   mm/mmzone.c:117:47: sparse:     got restricted gfp_t *
--
>> mm/readahead.c:152:51: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/readahead.c:152:51: sparse:     expected unsigned int *flags
   mm/readahead.c:152:51: sparse:     got restricted gfp_t *

vim +117 mm/mmzone.c

   114	
   115	enum zone_type gfp_zone(gfp_t flags)
   116	{
 > 117		trace_android_rvh_set_gfp_zone_flags(&flags);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
