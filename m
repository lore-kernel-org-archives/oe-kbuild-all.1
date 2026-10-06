Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546DC31328E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 03:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256299; cv=none; b=hU+m5l2yecNUhlc2bxig2VtyOjIP+8GEcVw6V5HmkX20E0x4otN6UpK74kaKt5NztO/gk4bhjYGATnrOlupaiUW3Ej3e6FgIUdDIsw3pCeMeoqPTdYRTgWiS97OLuPzYY7+h9Znh5xox8Z2unlz6QO42IecVn7ws51PvgKuyDYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256299; c=relaxed/simple;
	bh=T9+SNvnRwxuR5SSRPHDMt8UVB7775rXdW0btxiYlXlk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lqUegaOqBH1xuh2FOhIcxHaulDzNWeN2ztFa1P2XHKFzkcyg8ki0qxVbhekfNPY2sIThPMd1jVEI/c4VC8T2Xy/8VGixKwXa4ouShgV4MthXSobMFZzjfZUw2vNUIJe5MuQGOXaXVreIhgN/x3lR8VQmDYp1Ek/1M5XFqHrLjtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eStM+Z3Z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eStM+Z3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791256298; x=1822792298;
  h=date:from:to:cc:subject:message-id;
  bh=T9+SNvnRwxuR5SSRPHDMt8UVB7775rXdW0btxiYlXlk=;
  b=eStM+Z3ZLzy4OMDHjPyv+3CRCD+jgd07vVryjeJN6JG8820H3BDNdD3I
   f2UBURL4pvc8mgjeeJ7nYwa/X3ffwiUQl+OfMrrCvz+s06N1n7bD4OtCf
   aAl7XRwJjcI6LiUztAuqQddqqV/RqUsq8xZ6O437IobeJiXNRA7bLNsvj
   LuRLL/5iyXQXeizBCYBR29+pfYcnA7pSo3q4epLyi+eMSH1CQLGvakEza
   f/XitgaaQYCBcutiY+xHZZvpPfs0OnBenwjnUFoJDgWWWQtiqPhf9xF0U
   tl0bpvWTws5l6mNXF2BWNHa3NuepbbKSP36/okWfxougGQ+FHFR7lVaiw
   g==;
X-CSE-ConnectionGUID: 7G2b/WDGQVa0Xt1dSKpbgw==
X-CSE-MsgGUID: JoemFoaCSrqN+A7sCFj8/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102100088"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102100088"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 20:11:37 -0700
X-CSE-ConnectionGUID: C3kU/LTHTsu0e2HPVrWonQ==
X-CSE-MsgGUID: L6zwDBSsSvGg+o+bpnePjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276545224"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Oct 2026 20:11:36 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDvaX-0000000016c-3MT8;
	Tue, 06 Oct 2026 03:11:33 +0000
Date: Tue, 06 Oct 2026 11:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 648/781] Warning: kernel/sched/alt_core.c:102
 cannot understand function prototype: 'int sched_yield_type __read_mostly =
 1;'
Message-ID: <202610061129.ALWSZ3nJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   2bfd868afb6d8c6d606a189951e4680cd4ca98e2
commit: ca8e0fde64fcfaf8691f1aa16d875770a5896ca5 [648/781] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261006/202610061129.ALWSZ3nJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061129.ALWSZ3nJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061129.ALWSZ3nJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sched/alt_core.c:102 cannot understand function prototype: 'int sched_yield_type __read_mostly = 1;'
>> Warning: kernel/sched/alt_core.c:3534 function parameter 'prev' not described in 'prepare_task_switch'
   Warning: kernel/sched/alt_core.c:3566 Excess function parameter 'rq' description in 'finish_task_switch'
>> Warning: kernel/sched/alt_core.c:3534 function parameter 'prev' not described in 'prepare_task_switch'
   Warning: kernel/sched/alt_core.c:3566 Excess function parameter 'rq' description in 'finish_task_switch'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
