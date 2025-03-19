Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80591E9B0E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742410947; cv=none; b=i4fFhoPTaJy673HIl5e9mqvzsHidgLeY04CnUkCuPkOK4bdWTyf/0+SPLsP/tPwOKif3WhszeWBl/CsmPQfp8WBC8dkFiSpBLxXYnYem3wcZ2h8SL9gLXm7uk+E2gMSoPhZk4lZN95o/pE7JZYZCmDurdIIcnuBbhc24UJbLlYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742410947; c=relaxed/simple;
	bh=2yiaR1OKNSJQUU0AIZte/nSQrv0s0j6p/KCkIINk5kw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VnEGNLsQDOngqjckA+FP4P2DPwu3E6SOBeI1s4ECbyn2fbfPqoXE4gBchRnXygruFxhCIYYUHOt921Mpk4NOboCcpVti3RmLks7NmmWiFuCb8uNXxUF165IX7sBr2rMDoXYKdiwUPAIF3ZQlm5HTwbPczYKgrYwe2COIc6jgEa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7czx3dF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7czx3dF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742410945; x=1773946945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2yiaR1OKNSJQUU0AIZte/nSQrv0s0j6p/KCkIINk5kw=;
  b=n7czx3dF1qejqRS8W+oAwvpZqPSe8/h7omoBVlYQ/5DzhxGmiv/W4fEY
   WnR0wIUaEpvKh2a6/qtjw33LTl2sj1BIwTDZF273gBXucfQoD9H3W6KFm
   ejuQWDIogwxHbzybs/0fs3sD6rpXkdEFZGLFWsJ9o1UOwfZgPTiZglnZj
   PWYFWDNcrd+jl++j9+mApvbtx/ruJLcJl17ejdOKn5rKC3zLaPfgDb9VX
   OtMxISnieow4ztjmla/dv907rlNEAfCwRU1OWJP+A6b5JGfiyl5U3tNM5
   u9hsdiMsNN80TXoRy0zzfWP3Tmv5B98nuqTS4L1TKscmAsWTEamjl2oWv
   A==;
X-CSE-ConnectionGUID: Vjm7H3VtT9+Bio7V8vCe+A==
X-CSE-MsgGUID: cHKuLxYPSDmSny7OBR77sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43638343"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43638343"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 12:02:25 -0700
X-CSE-ConnectionGUID: Sh2ot5m+QeCc/r63ev+15w==
X-CSE-MsgGUID: Y9D6GskVSOiZwl4YU4uLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123676507"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Mar 2025 12:02:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuygI-000FcA-0A;
	Wed, 19 Mar 2025 19:02:22 +0000
Date: Thu, 20 Mar 2025 03:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12087/12094] vmlinux.o: warning: objtool:
 do_user_addr_fault+0x275: skipping duplicate warning(s)
Message-ID: <202503200238.xDcggGXm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
commit: e309224f0a8d02685f1858911a761f33806c2469 [12087/12094] Merge branch 'for-next/kspp' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
config: x86_64-randconfig-102-20250318 (https://download.01.org/0day-ci/archive/20250320/202503200238.xDcggGXm-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200238.xDcggGXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200238.xDcggGXm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_user_addr_fault+0x26c: unreachable instruction
   vmlinux.o: warning: objtool: do_user_addr_fault+0x270: unreachable instruction
>> vmlinux.o: warning: objtool: do_user_addr_fault+0x275: skipping duplicate warning(s)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
