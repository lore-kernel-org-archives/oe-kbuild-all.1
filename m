Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6848417A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770954493; cv=none; b=AyCnWZ+Hbkpe4K+KA2Jbs7yRatz8mmOqK0cpI6FPm3b/yfvImrxxCMdlDkEIZvZ0UDcQPb0aF1o0ru0jv0qv0q7OZwX7IlJnpZs0rtSZ0CqqxwN+yXZwsUtdOEA3zFHStW/yGwfepdN8bjAVRmJriOmGY99RCq70MfW6glcRhDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770954493; c=relaxed/simple;
	bh=JciQMgx93/BaLIRwoIVxkBNBa6/ujG901rwLHlF1i0g=;
	h=Date:From:Cc:Subject:Message-ID; b=WlHKk5I4UErqZ8B7IsPk8ffQwHApGIevTot+996XGQCqS9C8aXhMOFHIPqcIkni82MVm3kUiXQAQu3h7sVjf33ElAv783DX1oEze7Fwjf0UhxVk7YTpTGErU8+t1dxwrut2826qOvoZa1lNLIzh8av8bRHN/ZY/wPzhYfXL5okk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EI/xKRay; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EI/xKRay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770954492; x=1802490492;
  h=date:from:cc:subject:message-id;
  bh=JciQMgx93/BaLIRwoIVxkBNBa6/ujG901rwLHlF1i0g=;
  b=EI/xKRayr6x4VGL8UmNkRaDBTKCX4iNmI/kElBoI57wjRJ4KatcTwf3y
   vcYA7E9Yth0ZhwVjljqEzqfcOId2ij5Cv5vNdFi+2HQgsLPkHOsRpVk53
   TRmf5hk9H/R+0XsSqz8qTdz8hoAYjiCx7gzKsKQxaILrt6/fBoKoZouf0
   HBiCcGkgrRs2hf8M+38Tm0uMQwr7tIbPY8TuoUH5zH/ZhumU+Wd32JC4i
   QDxKh33cU6i1dLqhSppu3Lo6DqNq71qHOPqaG90TT6NKDfGKOBmm/WbkD
   omMehTy0+G3uJE+mMWoH/QqlqRl7xvw5HvQ6sGsqV92fbDmhENft32rG1
   A==;
X-CSE-ConnectionGUID: 3adLY8ekRnWVS1kFSad3Tw==
X-CSE-MsgGUID: Pf2tkc8lRVujmvht8Fw/OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="94776758"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="94776758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 19:48:12 -0800
X-CSE-ConnectionGUID: kvLCkCCgQ6KDlRgW94aNfg==
X-CSE-MsgGUID: N0mFKb5YR9OI8/gvpYJgnw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Feb 2026 19:48:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqkA4-00000000uzJ-23Z0;
	Fri, 13 Feb 2026 03:48:08 +0000
Date: Fri, 13 Feb 2026 11:47:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: ld.lld: error: undefined symbol:
 xe_configfs_get_ctx_restore_post_bb
Message-ID: <202602131114.LrOqbQnZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7449f86bafcdb588422bb14a4babfd285e723670
commit: 6c6988c5e03df145e6c5cabc50d67b11f5aa2e56 drm/xe/lrc: Allow to add user commands on context switch
date:   5 months ago
config: x86_64-randconfig-r052-20260212 (https://download.01.org/0day-ci/archive/20260213/202602131114.LrOqbQnZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131114.LrOqbQnZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131114.LrOqbQnZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_get_ctx_restore_post_bb
   >>> referenced by xe_lrc.c:1116 (drivers/gpu/drm/xe/xe_lrc.c:1116)
   >>>               vmlinux.o:(setup_configfs_post_ctx_restore_bb)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
