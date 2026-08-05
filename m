Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E0247ECC8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 21:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785964021; cv=none; b=OkivhiI5qu4sZnTW6i7yuUgrAXkKZ1VW0Gs7mX4pZgf9QZUXoSpIv/MknRuzCZRHi/kLc08+33AYe2A0Lu+oP6Fk3Nr8AIHe9+7j6pY8hA0EB7RIo8+sFd0jkSJbb9/fzHSXIwBRdxlgg4qS1Q4LvFq5R085rnzlmmyBd7ohp2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785964021; c=relaxed/simple;
	bh=FGpbSJaCKQ05uGIzA4gH05LMeSPwqAAL/nqLAD9Md7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WVcjtDyR4BuIOk8aMBATt6LfPU5HcB24yR2nFitIitUcWglWjmHE55JgldvANoxZ3oAgvv6RWk91yqIV/u+PLiSI5NYPRmyQBlYBKGE5dStPDaCdSB2bF3ryrcyWRaoQrwsIFffM22unFfOMhRU1b+gUNwLct2tv+QJ2Ct+ydEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVzfOCds; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVzfOCds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785964019; x=1817500019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FGpbSJaCKQ05uGIzA4gH05LMeSPwqAAL/nqLAD9Md7Y=;
  b=HVzfOCdss9mTacWB6btOlrRzOAhbMukUCSy/r9WlwpJZLP+DNGiWc1Cb
   5Nxzl9nu2lt2AeBMcsGGNS4Nwd2ggbs2ozZvcN+dmdmLCRYuvlJ8A7q5K
   JOF/8DOVr708ai/UGViqIfQd5KHzMYnuro4L6OdihbJB8n/TR9tH7Y/hK
   t7wTGxSpWydmUuRZtcy8p5O/ZN1y+ezbTMviHbuA3NWu6lbEH9kRiW//R
   ZhJMXuerSs1rdSXejuWqygBHdH49Miqd1x9JV2a9jpy8zVqbbYCJIID4y
   ejO+XKiZvETFT4kB/zjZjj2KgQK5zCniERzOjmUC+spAuvKMcWRUCGZnd
   A==;
X-CSE-ConnectionGUID: 8dTdtXU3R2aROpB4pm71aw==
X-CSE-MsgGUID: hsLl8OhaS+GcJ9efHW396g==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="109339837"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="109339837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 14:06:58 -0700
X-CSE-ConnectionGUID: 6fybZPFUQeO+HsQ6Dsw/wA==
X-CSE-MsgGUID: he7Yl0P+QJ6GiA+kaefW3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="261370903"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Aug 2026 14:06:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wripC-00000000DSL-1Wm3;
	Wed, 05 Aug 2026 21:06:54 +0000
Date: Thu, 06 Aug 2026 05:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: Natalie Vock <natalie.vock@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 "Timur =?utf-8?Q?Krist=C3=B3f"?= <timur.kristof@gmail.com>
Subject: [linux-next:master 12840/13093] Warning:
 drivers/gpu/drm/ttm/ttm_bo.c:516 Excess function parameter 'ctx' description
 in 'ttm_bo_alloc_at_place'
Message-ID: <202608060522.oJAEqT8b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Natalie,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1701fda2f58e345c050f4309971bdc07cd6146ba
commit: 3f356c0e36a057e45301b8279da4ed4b68fe80a6 [12840/13093] drm/ttm: Extract code for attempting allocation in a place
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260806/202608060522.oJAEqT8b-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060522.oJAEqT8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060522.oJAEqT8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/ttm/ttm_bo.c:516 Excess function parameter 'ctx' description in 'ttm_bo_alloc_at_place'
>> Warning: drivers/gpu/drm/ttm/ttm_bo.c:516 Excess function parameter 'ctx' description in 'ttm_bo_alloc_at_place'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
