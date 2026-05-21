Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F9C33EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376373; cv=none; b=cooz585oSPMVToYav7ERnJC9Zxxq33e+ICefoJEpis/hsMDBg5tWx4fj04VYtug1Xu96beMvsCpgLse11U8zvOTYCzlUFpzlpUJv8F+mVECG5QXsRQOcXCtMqseBcXtopaI2jNjZ+NYk5pkJYjl3AGIPLboc1Wr0qwXbvL61IBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376373; c=relaxed/simple;
	bh=G9bilRLS2DY+qV5XS8iIGsNxrGm9KckKLv8bBZ13qo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=njzYNBwAgUdWjiG4MhCa9qDEI2KuGndG+1at7t6Bn1ugTmBFiXw8RwuyrqSr0YqDOFF3zTrdBYU5nDPw1Kxw5y3qSWvAx/iNU/Ze04ZQqIT5ij3u1pVknH2Hh6Z2OHFusmCro+6ObJA6/85fZc67HTlVUOROc2D43dh/DiUsiNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXJffqjQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXJffqjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779376371; x=1810912371;
  h=date:from:to:cc:subject:message-id;
  bh=G9bilRLS2DY+qV5XS8iIGsNxrGm9KckKLv8bBZ13qo4=;
  b=dXJffqjQb4YwILQ6LAko51ulykkaL54ywHGlrJzVUuqW17zucjOHitj5
   qUyWcZqTibr7E85cFDPhz4OeO6M2bhJk+/8JOERgetbtOQOZn6u3eaBmV
   GGOK7K0XR1KZG5kUiO3vTFmuA5ZfowclR+vO28PAc6RbnHzaOLExpnA97
   PUdsPhU1lEM59gCt0xLEEgg+EH+gRLxYgB1Vvp52iDmFlNgOFNZf32Pop
   Ws9xvFvEsw+0rK5ascWlD5NigXX0CzBqEXjJ/lPzAxuRAL4Ewv57siMCP
   0ZibADeWvC4GQLXGADTQVtpu+n1b3Y9CqSaoHJ5Zc2lCPur9G9rLTQwdZ
   g==;
X-CSE-ConnectionGUID: 4P2f+vdRREWDk+SOAlbpmQ==
X-CSE-MsgGUID: aIUsCR1TSHCHAp5QxtXaSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="82874741"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="82874741"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:12:51 -0700
X-CSE-ConnectionGUID: CCSKauFyRTOgxYj4i87kAQ==
X-CSE-MsgGUID: J/3aj5qySmSeNAK632PpmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="240575906"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2026 08:12:49 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ54p-000000000fv-08oo;
	Thu, 21 May 2026 15:12:47 +0000
Date: Thu, 21 May 2026 23:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 738/1130]
 arch/arm/kernel/sys_oabi-compat.c:307:1: error: conflicting types for
 'epoll_put_uevent'; have 'struct epoll_event *(__poll_t,  __u64,  struct
 epoll_event *)' {aka 'struct epoll_event *(unsigned int,  long long unsigned
 int,  struct epoll_event *)'}
Message-ID: <202605212340.xZBWuNPq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 1bf3c3ab7dd8039fe192a4328cd2f968913cf760 [738/1130] cheri: fs: Fix uintptr_t handling in fs/
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260521/202605212340.xZBWuNPq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212340.xZBWuNPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212340.xZBWuNPq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/kernel/sys_oabi-compat.c:307:1: error: conflicting types for 'epoll_put_uevent'; have 'struct epoll_event *(__poll_t,  __u64,  struct epoll_event *)' {aka 'struct epoll_event *(unsigned int,  long long unsigned int,  struct epoll_event *)'}
     307 | epoll_put_uevent(__poll_t revents, __u64 data,
         | ^~~~~~~~~~~~~~~~
   In file included from arch/arm/kernel/sys_oabi-compat.c:81:
   include/linux/eventpoll.h:84:1: note: previous declaration of 'epoll_put_uevent' with type 'struct epoll_event *(__poll_t,  uintptr_t,  struct epoll_event *)' {aka 'struct epoll_event *(unsigned int,  long unsigned int,  struct epoll_event *)'}
      84 | epoll_put_uevent(__poll_t revents, uintptr_t data,
         | ^~~~~~~~~~~~~~~~


vim +307 arch/arm/kernel/sys_oabi-compat.c

687ad0191488a0 Nicolas Pitre 2006-01-14  305  
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  306  struct epoll_event __user *
249dbe74d3c4b5 Arnd Bergmann 2021-08-11 @307  epoll_put_uevent(__poll_t revents, __u64 data,
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  308  		 struct epoll_event __user *uevent)
b6e47f3c11c179 Arnd Bergmann 2021-08-11  309  {
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  310  	if (in_oabi_syscall()) {
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  311  		struct oabi_epoll_event __user *oevent = (void __user *)uevent;
b6e47f3c11c179 Arnd Bergmann 2021-08-11  312  
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  313  		if (__put_user(revents, &oevent->events) ||
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  314  		    __put_user(data, &oevent->data))
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  315  			return NULL;
b6e47f3c11c179 Arnd Bergmann 2021-08-11  316  
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  317  		return (void __user *)(oevent+1);
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  318  	}
b6e47f3c11c179 Arnd Bergmann 2021-08-11  319  
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  320  	if (__put_user(revents, &uevent->events) ||
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  321  	    __put_user(data, &uevent->data))
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  322  		return NULL;
b6e47f3c11c179 Arnd Bergmann 2021-08-11  323  
249dbe74d3c4b5 Arnd Bergmann 2021-08-11  324  	return uevent+1;
b6e47f3c11c179 Arnd Bergmann 2021-08-11  325  }
b6e47f3c11c179 Arnd Bergmann 2021-08-11  326  

:::::: The code at line 307 was first introduced by commit
:::::: 249dbe74d3c4b568a623fb55c56cddf19fdf0b89 ARM: 9108/1: oabi-compat: rework epoll_wait/epoll_pwait emulation

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
