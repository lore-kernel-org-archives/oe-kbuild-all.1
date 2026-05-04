Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161321B905
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 05:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777872866; cv=none; b=sotUsQO8Sf8zbDmzC3CB1Mx65ym33pCd5i79OJYmv5Ltlohll+cvJV81A2UaVi8h1Ze/Y5SA5ilji1ppJvHntcj2QTX45SAtFEGowhsNOv2PH5CfAjSSN0qoyLwELIDocz/Kl8Im21CbKh+0Z2l41fWa7fM3YffhrRhNwXEg2bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777872866; c=relaxed/simple;
	bh=iBxX0o1N0JowWdYJGPWfKljfs7kDRL1Al/9j6z1MNig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=es6EJYx7q5HdfaoN8mLFuC4KtO9kPrQ1acwsq74ZkyuJ2pRXKTafNDlXoobfKlQPV8Wmrf7Xz6Kj6IjI2FoIUMGaQNPSDBhMqd/HDv6elqpUCk4e7uFi9bCDf6xUr7b7vU8RmJhp0PNQ7Uy3aTQi0Zo3LnTCCksXgFaIJR6u2Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByADcQ13; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByADcQ13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777872864; x=1809408864;
  h=date:from:to:cc:subject:message-id;
  bh=iBxX0o1N0JowWdYJGPWfKljfs7kDRL1Al/9j6z1MNig=;
  b=ByADcQ13etk4iD0yisojrMJeqHsEQSvVMgLOHQmGn9OzDvB3699MLk1o
   JTphrddhCxXUyr9kMvxr254AV5IXXwhXbJDVMcrYNvH9N0qK1XLkJSEyS
   7E7Sxx3a3JlV0XA3ffzWoo2/LRpnV8JjIpNgpESkCDoSaX3DbZV77/MLA
   C5A5WONtdex5WSdzRxM6EEk3s+Qkyfz8xhpQssvoXcMOQ1AKquxID5kyh
   Yb4848ZegT0MPrYsKQJBFPBNgrbAUKNNjCkW0z7fU9YSdZEJQ+i4lGUrQ
   giudK6c6JfSu2Qg5+l9aPOflXdb29j/j/SCDJdPc1omxqZh7Ofkn/GbvT
   w==;
X-CSE-ConnectionGUID: X6R3GLo0RgemYWmxvJl5+A==
X-CSE-MsgGUID: bFnMdpiLSfmf7L0Vxor0lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89418715"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="89418715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 22:34:24 -0700
X-CSE-ConnectionGUID: 8XVUzfuWQvOoPIrIHmIz1w==
X-CSE-MsgGUID: zn9J8XY0RYShQAn0MG2LTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="235676916"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 May 2026 22:34:22 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJlwZ-000000003VZ-3AJk;
	Mon, 04 May 2026 05:34:14 +0000
Date: Mon, 04 May 2026 13:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 9/12] include/linux/preempt.h:149:31:
 error: unknown type name 'nmi_nesting'
Message-ID: <202605041337.NcWnc5Lp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   25f8ae3956f6e747f0eedaca70ed975a79068ec4
commit: 06213534538c49fcab99613e767100580c940910 [9/12] preempt: x86: Avoid tracking NMI separately when 64BIT=y
config: um-randconfig-002-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041337.NcWnc5Lp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041337.NcWnc5Lp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041337.NcWnc5Lp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:15,
                    from arch/um/kernel/asm-offsets.c:4:
>> include/linux/preempt.h:149:31: error: unknown type name 'nmi_nesting'
     149 | DECLARE_PER_CPU(unsigned int, nmi_nesting);
         |                               ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/um/kernel/asm-offsets.s] Error 1 shuffle=2055369200
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1373: prepare0] Error 2 shuffle=2055369200
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2055369200
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2055369200
   make: Target 'prepare' not remade because of errors.


vim +/nmi_nesting +149 include/linux/preempt.h

   147	
   148	#ifndef CONFIG_PREEMPT_LONG
 > 149	DECLARE_PER_CPU(unsigned int, nmi_nesting);
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
