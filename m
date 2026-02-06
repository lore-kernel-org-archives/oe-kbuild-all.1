Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3CF1373
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 00:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770336274; cv=none; b=sI1Z5NK/r+bu5SDJlMGVB0fKUTTWtLhezHt0XWXq51o3dHwSWvM6D+AVAxnKuGVqS5+5Ruf2t5k+IKUnskr4+CcXQUC5J49wgE9RfpWDj751b8gOHeo7gVAGZT3sSjozDXCc1hg54yDJrH0QqS5cQnpn+0RmCcu5KVN12IRe5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770336274; c=relaxed/simple;
	bh=g0RgCihwKRYofBeYaDaNmL4FBn6pABEpVkXtjRVD3Uk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fCX/lzg3qTzUt9SjJ3g7Lmr+pRQYM2dHOhNtVCh2laMFcUqfAuHbfEvyqwC3uyXMcN6Qi7xgMjS9NdknIkoJ4r1QrwulCRsi42lcjwTHqsgmbvqOKekkWhF2PFzqcnlklkCFsEE2Feeje0qveUdM14aBK1ooGfgbq17aP4jCU64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KlwJcTZj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KlwJcTZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770336274; x=1801872274;
  h=date:from:to:cc:subject:message-id;
  bh=g0RgCihwKRYofBeYaDaNmL4FBn6pABEpVkXtjRVD3Uk=;
  b=KlwJcTZjjui0YhrzKIA1WAg2a24OXrllJNLAhkUkCpGY64/ALTMTm1A+
   5j57aoU6KTCNSC6ACoWLMeJKEHh0Q/HSAs6TnpMTnUk8LK78DWnMhosPW
   UaMTNUiJ2i+N6wEiHMcB73B5quNzBwP/MEZiXLGYx+tFitDYyyuUVvJ+p
   UxwzmwC9YtHon2GGJZUEBePi9EHAWIq1NvuNjEkWPy+rDg75Kkq9Skjjg
   x23R6vU6uGpLqZvrjL7aV0XcT7IXfzUHWcjPkCLt/UL1oGAN1M71mAMbj
   XvvBBmDmPFK71ljVdXOX7/PoqCY9dDBYdP4UQrK3dI7uGVfAHr77gFsJq
   Q==;
X-CSE-ConnectionGUID: pRm89BX+ScSFcR+/MYIXsg==
X-CSE-MsgGUID: Qq+j4c8ARTa2yAS+i4dvdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71444593"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71444593"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 16:04:33 -0800
X-CSE-ConnectionGUID: a5uazaLAS+SGKTLm6q2UOw==
X-CSE-MsgGUID: F8WMX4zJQ5SvTD9UE5c9TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210000611"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2026 16:04:31 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo9Km-000000004H7-2x68;
	Fri, 06 Feb 2026 00:04:28 +0000
Date: Fri, 06 Feb 2026 01:03:50 +0100
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
 Charlie Jenkins <charlie@rivosinc.com>
Subject: [linux-next:master 9686/12094] Makefile:20: *** missing
 separator.  Stop.
Message-ID: <202602060119.y6ZtL1dc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9845cf73f7db6094c0d8419d6adb848028f4a921
commit: d30c1683aaecb93d2ab95685dc4300a33d3cea7a [9686/12094] kselftest/riscv: add kselftest for user mode CFI
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260206/202602060119.y6ZtL1dc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060119.y6ZtL1dc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060119.y6ZtL1dc-lkp@intel.com/

Note: the linux-next/master HEAD 9845cf73f7db6094c0d8419d6adb848028f4a921 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> Makefile:20: *** missing separator.  Stop.


vim +20 Makefile

87d599fc3955e5 Masahiro Yamada 2022-12-13  17  
121c2a137767df Masahiro Yamada 2020-05-11  18  $(if $(filter __%, $(MAKECMDGOALS)), \
121c2a137767df Masahiro Yamada 2020-05-11  19  	$(error targets prefixed with '__' are only for internal use))
121c2a137767df Masahiro Yamada 2020-05-11 @20  

:::::: The code at line 20 was first introduced by commit
:::::: 121c2a137767df5f9f301795e7d3757d1af04b21 kbuild: error out if targets prefixed with '__' are directly run

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
