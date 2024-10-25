Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA04E14F9FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 04:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729829564; cv=none; b=gx0E4O+ZrWgjp4ohqorTkYr8DRUG6bhjVYh7U1z2PFUG2HDqedQGOVgnbqAMG0JKvTqTY9s5fXbkInTnrcg24oVLHX0jp3R9o+oA74dZb+XIkJqeTM7THaX78h1unaGwOnhlY72JkcTXP3d81KE+qAr1JaobzZGiqWR/P5ywONI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729829564; c=relaxed/simple;
	bh=U96v9muYDNrUgEF9OZm28m9vDs/1isXQVc6X1NOxbTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTqDLquJaLcZsiGfXWibBBK/GbpXRwVkkV2ALpBwZqlJ7Ujh/CVQrGunB6QJnCYZs0Xp/i4LEl8V+riz5RSq/P+HHSxRpfV4uTXIJBea5Hn6F49fS2gCv+KSiNPBt3ru7k/IOMRpgeAyyjESt2udTCFps0aHTBa8URtXN0gOMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jd4FpLAj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jd4FpLAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729829562; x=1761365562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=U96v9muYDNrUgEF9OZm28m9vDs/1isXQVc6X1NOxbTs=;
  b=jd4FpLAjE5KWddq6+SXOGPI67/sI94sa8nZ6rO2Wf6pHUUefBgPTxIxM
   u85PEBuxTCCRAWqd/TPizLO2MDTDgeIrjNFcLQQtqbUBVULJrp4hMXwcd
   NYpl0aIuJI7UHgxsWNL9hMxmgCX1SL8k4nOSWFDnMV6WRS0700sdV3q/G
   Zjckl0WutVou5AgR9R3YyI0zGkJ2vZR3Xr7wMwZBpM6I/dVuaK41XWB1d
   NYBFczs7RHidzRrAk3jqd8oqsBFKmttz+7ODnnzDjXqrhpSqAGAVHpqhe
   02AaRnS/XcSNyOLI7odJWZcvD1jwy+04S0FtRWU9jt4aNyEr5Ok+moZ+N
   w==;
X-CSE-ConnectionGUID: KWSdlujYSbCGuLKHngoijw==
X-CSE-MsgGUID: YXTcGfYASxC0kH1et9Qqag==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29653001"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29653001"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 21:12:42 -0700
X-CSE-ConnectionGUID: i72bW9oyQoW96rrRAdfJvg==
X-CSE-MsgGUID: a7/i5UHyQfCIOvmRfYagvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80713099"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Oct 2024 21:12:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Bgk-000XZY-0F;
	Fri, 25 Oct 2024 04:12:38 +0000
Date: Fri, 25 Oct 2024 12:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/7] drm/ttm: Handle cgroup based eviction in TTM
Message-ID: <202410251208.99Kwkppv-lkp@intel.com>
References: <20241023075302.27194-4-maarten.lankhorst@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023075302.27194-4-maarten.lankhorst@linux.intel.com>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next next-20241024]
[cannot apply to tj-cgroup/for-next drm-xe/drm-xe-next akpm-mm/mm-everything drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/kernel-cgroup-Add-dev-memory-accounting-cgroup/20241023-155504
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241023075302.27194-4-maarten.lankhorst%40linux.intel.com
patch subject: [PATCH 3/7] drm/ttm: Handle cgroup based eviction in TTM
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410251208.99Kwkppv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251208.99Kwkppv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251208.99Kwkppv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_bo.c:1100: warning: Function parameter or struct member 'hit_low' not described in 'ttm_bo_swapout_walk'
>> drivers/gpu/drm/ttm/ttm_bo.c:1100: warning: Function parameter or struct member 'evict_low' not described in 'ttm_bo_swapout_walk'


vim +1100 drivers/gpu/drm/ttm/ttm_bo.c

a3185f91d0579b Christian König   2022-05-09  1089  
10efe34dae798c Thomas Hellström  2024-07-05  1090  /**
10efe34dae798c Thomas Hellström  2024-07-05  1091   * struct ttm_bo_swapout_walk - Parameters for the swapout walk
10efe34dae798c Thomas Hellström  2024-07-05  1092   */
10efe34dae798c Thomas Hellström  2024-07-05  1093  struct ttm_bo_swapout_walk {
10efe34dae798c Thomas Hellström  2024-07-05  1094  	/** @walk: The walk base parameters. */
10efe34dae798c Thomas Hellström  2024-07-05  1095  	struct ttm_lru_walk walk;
10efe34dae798c Thomas Hellström  2024-07-05  1096  	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
10efe34dae798c Thomas Hellström  2024-07-05  1097  	gfp_t gfp_flags;
e5a692062aad1c Maarten Lankhorst 2024-10-23  1098  
e5a692062aad1c Maarten Lankhorst 2024-10-23  1099  	bool hit_low, evict_low;
10efe34dae798c Thomas Hellström  2024-07-05 @1100  };
10efe34dae798c Thomas Hellström  2024-07-05  1101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
