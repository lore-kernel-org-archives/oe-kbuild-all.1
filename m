Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC426154457
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897868; cv=none; b=BXtHeckp0MZDJ6SAN14mGkYgb48tLIjgM379ThM3e6oDFObSE5JOlUfhAleLrSzMduJ0YlVGj584lJ9lF+gKQ6ypZroNvL9/rMS62+Y7KqvtaFoBhDG34UWnS3wOSZekxMtn9cRDIEjgz0YZC4Ci9hPrVui4QSkF3/bjFvC8ZrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897868; c=relaxed/simple;
	bh=j3O+DDae8ILo4jmvNigqBbtK79Ejksa7HmS3Ijb0k0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=am0QURJdOazwPzMgxV9pZVPskHoiVc7qDREFplvz4GwBIFwlQt8njKmv7TJKOcMMo+DUAehasK+XPaOmek6RLVo4offvEJXYOxQWe68Sg1v+odPcomGqErWmYQkX/lo47z3dnByVAhk80oUlHKKr7UsFqtMzHpRrSjVINvBdbEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyQOhW60; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyQOhW60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749897867; x=1781433867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j3O+DDae8ILo4jmvNigqBbtK79Ejksa7HmS3Ijb0k0k=;
  b=nyQOhW60cFaGRsfNK6mqqo6rmALEABZbSE0LTBmhBs6AbOD+fUd+zR4Q
   coYBD6lH3dPWb+jG/rky+Q1Ht771OLovG78dnttM+wpRKNOXzX9gy3HpV
   Tr1v0sfj7/rPTJRVsoR0Oy9d9PaVuWCx/8Bw36swJc5c8v2/j1yBoMxFY
   xZWzz8nmPft4jk3OOmpO3QrWQhXipchvfyUxwWkoSvwOGWuKd7ctf4th3
   kuEuqrr1X1ZC7RGxt5TpS6aFlwvoTV+LMO/sbmF/wQTOeR4q5qBACeSB4
   rvSsaGcAr8JBibG+0E2cp08plEzKL2p4AJIsyUB3Jsc1qg/OqQwSH2rBq
   w==;
X-CSE-ConnectionGUID: Q19Rx0TLQhq40Mh+scvwZw==
X-CSE-MsgGUID: LenrMyiGT3K8RfyAvVEf3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55904566"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="55904566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 03:44:26 -0700
X-CSE-ConnectionGUID: o+MJz9v3R8iy+6BbqcV6yw==
X-CSE-MsgGUID: ETDdU5NXRSSwSb1vD0jUZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148945105"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2025 03:44:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQON5-000DSU-1y;
	Sat, 14 Jun 2025 10:44:23 +0000
Date: Sat, 14 Jun 2025 18:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 101/101] mm/memory.c:95:2: warning:
 Unfortunate NUMA and NUMA Balancing config, growing page-frame for
 last_cpupid.
Message-ID: <202506141820.D4T9qEe7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quan,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   fb985e3d6ffe60670777a329eb5ac36f2ed9f5a0
commit: 2b334ebbac08c6e8ed4121b5336b59856b396294 [101/101] anolis: mm: introduce a new page flag PG_inited
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250614/202506141820.D4T9qEe7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141820.D4T9qEe7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141820.D4T9qEe7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:95:2: warning: Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid. [-W#warnings]
      95 | #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
         |  ^
   1 warning generated.


vim +95 mm/memory.c

42b7772812d15b Jan Beulich    2008-07-23  93  
af27d9403f5b80 Arnd Bergmann  2018-02-16  94  #if defined(LAST_CPUPID_NOT_IN_PAGE_FLAGS) && !defined(CONFIG_COMPILE_TEST)
90572890d20252 Peter Zijlstra 2013-10-07 @95  #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
75980e97daccfc Peter Zijlstra 2013-02-22  96  #endif
75980e97daccfc Peter Zijlstra 2013-02-22  97  

:::::: The code at line 95 was first introduced by commit
:::::: 90572890d202527c366aa9489b32404e88a7c020 mm: numa: Change page last {nid,pid} into {cpu,pid}

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
