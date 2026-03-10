Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8341F418F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151438; cv=none; b=jDkbCvqLLJJLmGECS3a/5oiiSN9y6Uy8r50yv/ZybeFGpJmVleazDuOw1xPuhUM7n2tEEsXIWnicYuFYkRgKyU6hD45+FJOHazHx83Pu+bTtTkVa6kPjEPfDyobnjc6Ys6QQ0JOSa6JKSqxvGwtfAt8OjyRrJfjtoRxxTjprCh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151438; c=relaxed/simple;
	bh=07Bko18c3aDoFzcgZtKKKMvuImFiSaZ3eGpiHkNa7AA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jYje4fbMTeXF6rXbJXY+fjq+7uSq8AvlwkKCsVu+6qTnJrCGPmWA9USZUzq9Rz1UhtbQgIZXD+Dobyj53uHHiZvJWBZC+Rev6FZvQ2l4bNtV5x9zQaAll+Jd2eFKHBASXo87mVQiWghba3kLUTvNAzoMkIV/jIp5z7Vn3YcKd9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjy2hRpK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjy2hRpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773151435; x=1804687435;
  h=date:from:to:cc:subject:message-id;
  bh=07Bko18c3aDoFzcgZtKKKMvuImFiSaZ3eGpiHkNa7AA=;
  b=gjy2hRpKf4JOvTZFZnQOyHirVAhz21aFyvMenxnv4kUsHXos3k626xeQ
   HYCVN2YoeDvBjjI5JO3ySgVnEAjwGuaqJo9P+N7eu/SwF0uaZiZLqhJha
   u2Yo0oM430pDrYOtsEnURL+TQGZU2t0UL3mSQnGkmHKi+Uc0Lturyk9tq
   HumhQPeYx44b1DWYb8U7xF+l/tfK0XVa/El/iWXy4F9wyU9GSVSNt/OC7
   euGzur5JzfegpsdmJd5gx37Rox6lnmo1SL55MtD1AIDCCMnAygdzSB4df
   KYChoJAlswOcvQ4Pt5LgqgzKJryY+ohtbfDE9e7f7NLpfDsnDjhwZ3kYP
   w==;
X-CSE-ConnectionGUID: tO3ZEoiUSlScaP+AsgLdYQ==
X-CSE-MsgGUID: q7pDanhxTt6m5AE3BDOeFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74315396"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74315396"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:03:53 -0700
X-CSE-ConnectionGUID: funQO4yWQXSMFScydiyJAg==
X-CSE-MsgGUID: e4twQEUWSoKiDEL40v8axQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220303450"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Mar 2026 07:03:51 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzxga-0000000022I-3fNm;
	Tue, 10 Mar 2026 14:03:48 +0000
Date: Tue, 10 Mar 2026 22:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:drm-gem-dma-dedicated-dev 3/4] make[7]: *** No rule to
 make target 'drivers/gpu/drm/mediatek/mtk_gem.o', needed by
 'drivers/gpu/drm/mediatek/built-in.a'.
Message-ID: <202603102144.TuNvek0l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git drm-gem-dma-dedicated-dev
head:   4c540f788bc97dba78a5ab21b508c8e8fc983db9
commit: 7b88f45d82166ea4311c9f006e70509d4b8df489 [3/4] drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260310/202603102144.TuNvek0l-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603102144.TuNvek0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603102144.TuNvek0l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/gpu/drm/mediatek/mtk_gem.o', needed by 'drivers/gpu/drm/mediatek/built-in.a'.
   make[7]: Target 'drivers/gpu/drm/mediatek/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
