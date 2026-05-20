Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA658834
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 00:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779235903; cv=none; b=lwaytOdSKkYUB2fPH0oNS+QE3lMdiZiSaOdJdvMdWcY2/4GexfiHYZ+31ZrLISdYDxbLelJNFQoain1Lbk5Ub12HS0Ixxx4osenMrpECIILdYdBKlOYZOf0UH4nQUiqHzy8pfKFii/eF9vCejpWRBlJjRQHy7r2LrSt4XSc4IDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779235903; c=relaxed/simple;
	bh=EZVy/4nmDm4ND6GKRrDOonOw9IOs3LwUaPZzabJAtIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ac+IAjKOXX5aFj708X7oXiEMeZeTC0vKHbCGMxHy4LDW9bicY51FhRhpyA9ssCXVx0WADnMWVtPU7irV3a7u/zIqhneQzYShs1/x/la5pdj/GScHvVkNvwR2YGnjFwg0sFHi2id86cBLHdiQ+VIYnTK9v/0EBq5ccSh1KVsLWAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGUA+2mn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGUA+2mn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779235901; x=1810771901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZVy/4nmDm4ND6GKRrDOonOw9IOs3LwUaPZzabJAtIg=;
  b=BGUA+2mnush15tXr+0l8o5mTUURS9MuM5WgNQjHD9JCf3a/IGzCiVXqy
   5hsAb8xaaxYCNmd+VzWuyksZ80A59zifk0TEU/soyINo0+ApiafCxATUJ
   on5jQ7vVIOlMmXuCOr2/ESzhxz4CsFRqYBVFTvfO5iuWzVer4lWN+6JHn
   O8QgKESNleLzwrxxjnSRpHamz8bDfbWc/73FWpN/X5ZnHxDt4bCv2gaBV
   pijRl5RrCvBUvpy2czI2eElIakAakwASikY6DN8FnLfftMzYypODHkdHH
   3rnvYeBB4idvoWB9wSFMUBkCdcsLjEdefu/QEbVuz80jzZNhgnYnm19it
   Q==;
X-CSE-ConnectionGUID: jCN2kHSZQSOZofv+A4XWww==
X-CSE-MsgGUID: /BfrhIvdQAyzL5kVjelb8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91232737"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91232737"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 17:11:40 -0700
X-CSE-ConnectionGUID: GzimXzC6SJqLRHHxOVoAmA==
X-CSE-MsgGUID: XIekYQbuR02SlQSzAIuRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263450262"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2026 17:11:39 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPUXB-000000002BJ-0WBx;
	Wed, 20 May 2026 00:11:37 +0000
Date: Wed, 20 May 2026 08:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:merge-em-2 15/25] Warning: lib/dynamic_debug.c:664
 expecting prototype for param_set_dyndbg_classes(). Prototype was for
 param_set_dyndbg_module_classes() instead
Message-ID: <202605200701.iKzK2JW7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git merge-em-2
head:   9babd1e2b8f11800a5968cb9d16f473902b2f3da
commit: aadd55a4b5cdc45f55e2729fcf5d70674867582d [15/25] dyndbg: refactor param_set_dyndbg_classes and below
config: um-randconfig-r072-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200701.iKzK2JW7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200701.iKzK2JW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200701.iKzK2JW7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/dynamic_debug.c:664 expecting prototype for param_set_dyndbg_classes(). Prototype was for param_set_dyndbg_module_classes() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
