Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955611E53F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 20:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714855972; cv=none; b=K0jNQ4mlUzvy2ZrHpTm6FQw7xOH5jxxBiS2hIORCyiUEmGI9V12au8RBEnkjvT6dePg4cGuESziMd81Ph7/jlFFA0mTKXyC7axJlpddcR8qj3asHzvzhcb7XVqSAnM3XDRvKsHtHgft2/KRZDpiknbTrKKEKdSasxRZv+l481Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714855972; c=relaxed/simple;
	bh=t7XgQJc1c4xDWEPJO/wqU9i8IKyyHQTEH4WrICi9Qlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sBXmXO9wRZicgbMnYD6H7mhTYRx+EyBv1XG+KrAyfxQC2nDCCvE4QVfm9KOu9PHS7EjjrI8qNH6OgQPHhgqVYP3Vrh1EoFb+YshXLLriMPEom1YbqBNDW3rtjk1WP3WJ4JAzjxrtbwIh8odvoQY8GTbCaZJetikCexE4Azhv70E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlMfnl8Y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlMfnl8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714855971; x=1746391971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t7XgQJc1c4xDWEPJO/wqU9i8IKyyHQTEH4WrICi9Qlc=;
  b=dlMfnl8Y/qCBexVPuOysoJz+ztT1nOhFebYS+zioE+6ZQ/EEFyh6fGCQ
   48k5vGJBxNtlb5B8Nm7BzOPyu50UQcEoWKm7ds/XS1iLh7SWue6d0A30S
   dkLVpZpH90dzPJYAXcpr4v7QTwMd9mebzn6d8lAiRwiVtyLgKMHj4Bn74
   Y3dM9VSbX5fTNKDTwofoPT5prxa60W5WajVolWw/W9VuQmfMlzX+yrAbD
   wGzaIAaunfB7/QgmJ3Z5fFNYdBV+4/LT1rUQGCLBwck32KikWFTeUffGV
   YuPrxmIpe0y5DtsJB+hWmUYocmd+VfkzUIqIYyOH+I7c4MUMKxkbwNXkY
   Q==;
X-CSE-ConnectionGUID: eTCm35YEStWIcqNKS0vUXw==
X-CSE-MsgGUID: /5BeT7ZtSDmPQhkU1JTkuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10802037"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10802037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 13:52:50 -0700
X-CSE-ConnectionGUID: xbiJQ1hiTZiSgmJNx7uZ8w==
X-CSE-MsgGUID: on4W22q4QZGvtVnzcYdf3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="58676330"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 May 2024 13:52:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3MNC-000DB6-1B;
	Sat, 04 May 2024 20:52:46 +0000
Date: Sun, 5 May 2024 04:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:thin-lto 4/4] clang: error: invalid value 'sysreg' in
 'mstack-protector-guard=', expected one of: tls global
Message-ID: <202405050422.XEaHkoZn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux thin-lto
head:   3a76412ad0136bab38989d08fde4f54a768eacc7
commit: 3a76412ad0136bab38989d08fde4f54a768eacc7 [4/4] WIP
config: arm64-randconfig-r122-20240505 (https://download.01.org/0day-ci/archive/20240505/202405050422.XEaHkoZn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce: (https://download.01.org/0day-ci/archive/20240505/202405050422.XEaHkoZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050422.XEaHkoZn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
   clang diag: include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>> warning: Linking two modules of different target triples: 'rust/helpers.bc' is 'aarch64-unknown-linux-gnu' whereas 'llvm-link' is 'aarch64-unknown-none'
--
>> clang: error: invalid value 'sysreg' in 'mstack-protector-guard=', expected one of: tls global
   make[3]: *** [rust/Makefile:510: rust/kernel.o] Error 1
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1205: prepare] Error 2
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
