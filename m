Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E57C86353
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758888692; cv=none; b=IkKBeaTGDUpHNwHq+YL2HhPxlFEtka5h2yv0vxCuyJCveamutvkRZfW9gFrwqdK9ZvCz2dFlVWtC/eonKy5S8wUFSAK3QP0xbUR5bItYJmu994r2czC0LZGpqSyrEMi0ZsNFyPliLR/FPuCTwz6Dg38cFmuP5fwVsA92+ZvLS38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758888692; c=relaxed/simple;
	bh=nCDSbYdeXaLPidMr9lL+fmnB2gr5DTElEZVK9u8ulAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBbArzEaQnmnjw9fzaJGhBhPRVqP9c/QDd9SJxW3fOZgfN+2cX0Ryy6ojaD6/pQ2Rq8H8kf4k40jabdGRe7LvegDdr3V2etT4w1Z+LgBdjKKI4Y/Ud61927wNBAKHqngNcXc6Sk20Yk6RacgkVU8mvRvmu3NoOAONKKPSKstrX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBzp0fEV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBzp0fEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758888690; x=1790424690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nCDSbYdeXaLPidMr9lL+fmnB2gr5DTElEZVK9u8ulAc=;
  b=GBzp0fEV7kmPmCHcpKIpooQWNZNxy5cZPdkalyxKnCRC7CCatpF/dF8F
   Ie4zBzuDmFyvMY4dUTW4tlBu0Htmlv/PIJcWryNRJZ4X9WWJSZJiM+33q
   /1HB/7icAHJ+M9hTkwDEGUi6nN8g6H3Soh/px31fkIyTfXqCexqc8h6bm
   SA06WTX40SHNdX6ANeVA4lMw8NoTc4gyxhuCFcb+F2nhDYti6qfKf0BCt
   X1Yo8YU/5+3tdhUL2NJTaY4VWj/OKA2g3+CYzZ3mfyHDrI9Vcw5jVcuO3
   jvpNdojQZBmsynB3PvtkpLC0TYI9yncHxCeErNUfTlmKQ7zgY+IvkBhae
   Q==;
X-CSE-ConnectionGUID: vpFO1fDYTZeK3YhATN3BlQ==
X-CSE-MsgGUID: CQ9+PUqMQdeBkWgZlaYGrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60920772"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="60920772"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 05:11:29 -0700
X-CSE-ConnectionGUID: 5TOMKYYXRby3R0sTBcWZ2Q==
X-CSE-MsgGUID: V5eIeQPRR8+cevf0Ygvvcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177163417"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2025 05:11:29 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v27IL-0006CT-2o;
	Fri, 26 Sep 2025 12:11:25 +0000
Date: Fri, 26 Sep 2025 20:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2938/2938] arch/arm64/kernel/xcall/xcall.c:22:8:
 error: use of undeclared identifier '__NR_syscalls'
Message-ID: <202509262003.tHuFHwb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a069154a5b505dae14e18b3d12771757eef2e07f
commit: 7de9fb723946e2c735199cd92df3d7d953b43759 [2938/2938] arm64: Add hardware xcall framework support
config: arm64-randconfig-004-20250926 (https://download.01.org/0day-ci/archive/20250926/202509262003.tHuFHwb4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509262003.tHuFHwb4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509262003.tHuFHwb4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/xcall/xcall.c:12:
   arch/arm64/include/asm/xcall.h:18:31: error: use of undeclared identifier '__NR_syscalls'
      18 |         DECLARE_BITMAP(xcall_enable, __NR_syscalls);
         |                                      ^~~~~~~~~~~~~
>> arch/arm64/kernel/xcall/xcall.c:22:8: error: use of undeclared identifier '__NR_syscalls'
      22 |                             __NR_syscalls);
         |                             ^~~~~~~~~~~~~
   2 errors generated.


vim +/__NR_syscalls +22 arch/arm64/kernel/xcall/xcall.c

    13	
    14	static inline int sw_xcall_init_task(struct task_struct *p, struct task_struct *orig)
    15	{
    16		p->xinfo = kzalloc(sizeof(struct xcall_info), GFP_KERNEL);
    17		if (!p->xinfo)
    18			return -ENOMEM;
    19	
    20		if (orig->xinfo) {
    21			bitmap_copy(TASK_XINFO(p)->xcall_enable, TASK_XINFO(orig)->xcall_enable,
  > 22				    __NR_syscalls);
    23		}
    24	
    25		return 0;
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
