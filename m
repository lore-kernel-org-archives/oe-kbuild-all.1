Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110F2EB845
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767512527; cv=none; b=IxQDS+08+QqXTanAKpjMKrqLsjXQZ0agffH3wmOkHTbnkm3XuzF5yzGTha2A+Nn6twQqkZisK7L1os5jwkPOR5luN7tqVESHQK1VWREiSR1ccgpdjGOIWUz3o8ZtwFiZKGfG9MgHHexvBKmhZWQdzPtqMjno+xdN1Hlc41bumu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767512527; c=relaxed/simple;
	bh=PbycqZcHulrYcgeulLi1kuUoGiKUM3p/9lZ8r3/MYao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MJaCVfmwFMFz3c9BvqhtVno8nEmxAPolL82rAf6t9VwR3010+2ClS9cP3o46EJl0XwO+70q+OLNT6BiNjV33ll/qh2JnQDIszxFdNCJ3ZHOjTVLjHCWFDr9IEjmYoy2ZU1SXB0A/I3M2RiSC9VVvKsrPqGx4HO1hEXGMc6AVzYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiPDrLqZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiPDrLqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767512525; x=1799048525;
  h=date:from:to:cc:subject:message-id;
  bh=PbycqZcHulrYcgeulLi1kuUoGiKUM3p/9lZ8r3/MYao=;
  b=FiPDrLqZ3wX+aWcszXjoGJZTdDXT3auh1ZoKhfvNlBm5ijnWw6mxaQW4
   ip3OiG5MJD3tKqihAc3OiZddE7/B4Yj949bwE+KM4ODLMTP9FEvNIhkA0
   INj4PA5Kq0o1IeceVFn2P9LqKpxuliISCWvVapwgzg5Y2+qP8C4INinur
   il8VxILdc9dlZU0piHY5KQeFp8dDEPIeWlU0uqR69rGixgsZmg3QpBvB6
   yLYvQ8ix4i+b14L5MMSY1oEiJhwcrEGyb3sZ5OepGUuLzu7Ur/s4G5yFk
   d+BYdbedl97xtf4f2gU+xjcEBuJO24EtlWJ0mtYwdR0w/7IMqg114Pyj3
   w==;
X-CSE-ConnectionGUID: 4PgHDnqgTYOOVlq0xnlNqg==
X-CSE-MsgGUID: QIqpqAZ1Q46Uf0390U5O0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68991997"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="68991997"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 23:42:04 -0800
X-CSE-ConnectionGUID: DKmtJzjZRQGxZepfRb2Huw==
X-CSE-MsgGUID: tkOJY3ytQTOvOlXqr+0hKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="203086767"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jan 2026 23:42:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcIkT-000000000RB-093h;
	Sun, 04 Jan 2026 07:42:01 +0000
Date: Sun, 04 Jan 2026 15:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was not
 declared. Should it be static?
Message-ID: <202601041526.6PaR85J1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   b307e8eedb0ffe219c0eaf00c9223bceada7b833
commit: a1931ea63052986e24ca093ae8fa2443d3a6e2fc [1/1] ANDROID: uid_sys_stat: split the global lock uid_lock to the fine-grained locks for each hlist in hash_table.
config: arm64-randconfig-r133-20260104 (https://download.01.org/0day-ci/archive/20260104/202601041526.6PaR85J1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601041526.6PaR85J1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601041526.6PaR85J1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was not declared. Should it be static?

vim +/uid_lock +38 drivers/misc/uid_sys_stats.c

    31	
    32	#define UID_HASH_BITS	10
    33	#define UID_HASH_NUMS	(1 << UID_HASH_BITS)
  > 34	DECLARE_HASHTABLE(hash_table, UID_HASH_BITS);
    35	/*
    36	 * uid_lock[bkt] ensure consistency of hash_table[bkt]
    37	 */
  > 38	spinlock_t uid_lock[UID_HASH_NUMS];
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
