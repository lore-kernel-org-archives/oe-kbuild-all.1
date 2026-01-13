Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D22D257845
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 01:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768266470; cv=none; b=GzzrzdDIsIKyzDFX2lvDsaoxAtwrOt0ClG+pHmk36nIZsadWQGaPqLms3jB6nlrCMfvKMFX8HrUVxD4adyMCzwaxc0rocuUxi/NuMcsW/9X4+EYxrcQNVbvHlgYGW/xb/tQnV62rVlNKDWF43NHsnfyx7uiS/pUETlziAQDomcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768266470; c=relaxed/simple;
	bh=pasdr/Bxpr2+ZBSmpSTDy2zcxSRWUmm9S9zqpYi6x34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NAVyjj10quaFb4o/UoM7BSsDOySUbutI+OJhTaxJI8Ea7fA/TsNtxP3rIo4BIyfUo+/UTClQF63mibMl5lk4ySgxpfZfXFEpPTx/4l3+qHGrmCIm51cYMeAmLma+vUvGifcepV26hPgnCIeZ1ziLO7iXVImkfzN8wXQVV8DQRcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnaIU8jw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnaIU8jw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768266469; x=1799802469;
  h=date:from:to:cc:subject:message-id;
  bh=pasdr/Bxpr2+ZBSmpSTDy2zcxSRWUmm9S9zqpYi6x34=;
  b=MnaIU8jwjRQd2QMneERHeDq5xG9uMWvhpes2QJ1kfcu1Gwsxq0T6dz6F
   st779GaSYjgNZitr4Yi7zAMMPbAoNf5gU27sz3D+oYlYnIexGMITHouYB
   432LHplxDm8CdBybJcWzYyyjnMgkL/Xdmy+uzANMpo9fv5hucwPta/7xt
   Gkm5TCoaOZNwczusXT91D+NyqjxKgR57N3iPPgTRlYFnQYs3jwOw/WoZ4
   txTcbMTIILUgphymkvNwcJO2sWFaJNrVLF3A3TgVNKeVGby17I+uHtDXg
   yVAS0BmLCmhjitRlhYKglFyXJl/S/TBptzHj+Ln7pdWyCn/fogjsrIa5g
   Q==;
X-CSE-ConnectionGUID: apulhSSPSa2dCaPSTljJrQ==
X-CSE-MsgGUID: NHtp9IuRSA2hwV10AXhHvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80999318"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80999318"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 17:07:47 -0800
X-CSE-ConnectionGUID: FfAFI9uaTOGctp29fE6d3Q==
X-CSE-MsgGUID: kP/JhsbuTmSpR2VgGzZ8aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203448147"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 17:07:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfSsp-00000000E3E-0RTZ;
	Tue, 13 Jan 2026 01:07:43 +0000
Date: Tue, 13 Jan 2026 09:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Hongzhen Luo <hongzhen@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
 Hongbo Li <lihongbo22@huawei.com>
Subject: [xiang:erofs/pagecache-share 7/10] ishare.c:undefined
 reference to `z_erofs_aops'
Message-ID: <202601130827.dHbGXL3Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git erofs/pagecache-share
head:   1fd57384c2a516c6a572e45ff299459be4caec29
commit: 4a4f51597bf91590953985eb287d6664d40b7b82 [7/10] erofs: introduce the page cache share feature
config: csky-randconfig-r132-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130827.dHbGXL3Y-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130827.dHbGXL3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130827.dHbGXL3Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/erofs/ishare.o: in function `erofs_ishare_free_inode':
>> ishare.c:(.text+0x418): undefined reference to `z_erofs_aops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
