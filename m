Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B33E33EB0E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526404; cv=none; b=i7K3O+aGkxcdjJrnDliBtNvvBP53NhGeDsnMFDyfvkHh1KXuo9OB5J033UKIdPyqhCxwgBFukNZn+mDBpFeOyEPG//ySxs7DzWYWUOui5Y+DF2chMCKCI0H8Ahxk+66K2kpt78R2z243vbLUYIQqmNkOQJNqWbrwjfzxDPoYAvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526404; c=relaxed/simple;
	bh=xCQyl4NunpvFWr9KRMbEguetAqvHM1AI9msTdpw6PAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qux9SvzuOnt7JZEDe9KaNoFUiJIoqeEQIhQEu/qdwYtZyapkZU5JQpvHftVoReJ/PfxSwkEL0gMoLb02eJykgIhe/z/7kP3mKQlHbyeIXt8cd9eSjDL1WZm+kUppKFU5atXDyiAZ6fHxE87FGTWpwh9wry2wDdrSid6hD5EV1PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dojUe4WF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dojUe4WF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755526403; x=1787062403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xCQyl4NunpvFWr9KRMbEguetAqvHM1AI9msTdpw6PAc=;
  b=dojUe4WFYbUR0km3LNyOuOSlwdRjzqJ3Ccyr/R0LuHSEnALy2SsZ9Qkc
   2IgGiLfD+WYijtBDWa+IjPtugNtB72cxLAwWpdFDsyt9v1T83LpoNZVWe
   F4C+Ag3c8s0pqGRNsw+nKyrPg4QHQ4NuLgiO8teIi8sJTd0o52VexLDIR
   WrTa1jZ9dSue9e8wWJavKt+I4M0kUbmnvKsitCRzm7fS9Fg3+j7DVWP2+
   cXtR5GozCUM2dffRi2fzWTUlCI0FzJteZ9DP63XCuRvhdmKkHn7MnLpfn
   vB/0lWOPiaNm3dJwI3c/lPysvljx+ysXdP1w+ntxeXSciL9cpwTR7Q0Ck
   Q==;
X-CSE-ConnectionGUID: ui8/tJSlQKWKGi5Kk/eD6Q==
X-CSE-MsgGUID: cG047xU5TRighAOGyDZkmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68352721"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68352721"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:13:22 -0700
X-CSE-ConnectionGUID: 8vBpcxc0SROI6qBwt/O6Hw==
X-CSE-MsgGUID: MZX72EPBRCGjW7lyYXSOMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167944038"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 18 Aug 2025 07:13:21 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo0bv-00015z-0r;
	Mon, 18 Aug 2025 14:13:19 +0000
Date: Mon, 18 Aug 2025 16:13:01 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] arch/x86/kernel/early-quirks.c:722:6:
 warning: no previous prototype for function 'is_zhaoxin_kh40000'
Message-ID: <202508181643.2giEZ0ax-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: 8eaba08b2d72718a40cafe3402ab4f26b0dc62eb [2687/2687] x86/cpu/zhaoxin: Encapsulate access to global variables within functions
config: x86_64-buildonly-randconfig-2004-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181643.2giEZ0ax-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181643.2giEZ0ax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181643.2giEZ0ax-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/early-quirks.c:13:
   In file included from include/linux/pci.h:1666:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for function 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^
   arch/x86/kernel/early-quirks.c:722:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     722 | bool is_zhaoxin_kh40000(void)
         | ^
         | static 
   arch/x86/kernel/early-quirks.c:737:14: error: use of undeclared identifier 'kh40000_dma_direct_ops'
     737 |                 dma_ops = &kh40000_dma_direct_ops;
         |                            ^
   2 warnings and 1 error generated.
--
   In file included from kernel/dma/contiguous.c:48:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/dma/contiguous.c:209:13: warning: no previous prototype for function 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     209 | bool __weak is_zhaoxin_kh40000(void)
         |             ^
   kernel/dma/contiguous.c:209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     209 | bool __weak is_zhaoxin_kh40000(void)
         | ^
         | static 
   2 warnings generated.


vim +/is_zhaoxin_kh40000 +722 arch/x86/kernel/early-quirks.c

   721	
 > 722	bool is_zhaoxin_kh40000(void)
   723	{
   724		return zhaoxin_kh40000;
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
