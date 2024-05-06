Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A6114388D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995564; cv=none; b=dw+41sWWZDCRVy1YO0TyLp8v/u5BB3lOdP0qmVimKHt7k5mpgOE880JtWaeoQFkRBY576ma1wIlczzsoDemekgxS7Kw/Y4rNe5gI7hDE0/yc4501uLuq0n+E9KlH2mG68KlEnEQmL6wHAg1SlqpAeNzdfzqTzRpzsxHZU1PTikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995564; c=relaxed/simple;
	bh=z2M2Lr9xy3nHyYqXX559Fn7WfPefFbsp3EL5j5Q0vDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sODs8LOv7er+azsPuK9Iry5SIJd3sh+7smnon5WasAj4vF3Swbl25m6W7wnIEfhIXNXWK7J3hauyxQ6L3rMt/5XzDThbwE58Rt+wQfI3kY5q5WxiGi14b7pzGLdu3i202v1DOy8IOB6FpXbTf0KcpUolz5XSt3C24Cb0XFLONco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQfCgTMD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQfCgTMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714995563; x=1746531563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2M2Lr9xy3nHyYqXX559Fn7WfPefFbsp3EL5j5Q0vDs=;
  b=bQfCgTMDGVntna8VGNATVsr13fCWLcHmxRahErDp1p9MTWGx9Ow4tvMo
   bCTpVW/5SMueLBFlx18ey06tqDxiFxAE3THZ4wnP/KA4wZOeWD/2ltyn3
   QgUYGfmnXYLTcA3Ik8qSK8aNQsCnnB27lWvyNjPaRRDXHE78K7TfUHM4V
   L/9E2OWcIAPfnvI1bkpmO2aQrrdo/mWuujRuL8o/IrRdbdIIDGCXqe70o
   NBSlI/mQ+bNOrHpfWVzurPjUavcTPfQdDIyXaubmIRaFYHooeT7SMk73j
   /pK/gmjJP8dZYFlHN2EV5u5rw571eSw/sLXKfNLyjudzjQKIgh+S5/eDs
   A==;
X-CSE-ConnectionGUID: tHNj7z15T2yd+9H0+95Yaw==
X-CSE-MsgGUID: N7O1WLvETJOHewpIn0L2pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="13681959"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="13681959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 04:39:22 -0700
X-CSE-ConnectionGUID: 9BwIgWGASCqiftIfDBsfpA==
X-CSE-MsgGUID: Wt6JhCnkRFGNsEk6HPNnng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28235026"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2024 04:39:22 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3wgh-0000eB-1b;
	Mon, 06 May 2024 11:39:19 +0000
Date: Mon, 6 May 2024 19:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:fns2 3/8] lib/test_bitops.c:56:39: error: variable 'tmp' set
 but not used
Message-ID: <202405061900.4HgQJjvK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fns2
head:   f92306cbaa708996e4cabe1c802e4d71e2e0ad77
commit: 4bb80c67057ee84c93316be9f688e969a1a6ad63 [3/8] lib/test_bitops: Add benchmark test for fns()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405061900.4HgQJjvK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061900.4HgQJjvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405061900.4HgQJjvK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_bitops.c:56:39: error: variable 'tmp' set but not used [-Werror,-Wunused-but-set-variable]
      56 |         static volatile __used unsigned long tmp __initdata;
         |                                              ^
   1 error generated.


vim +/tmp +56 lib/test_bitops.c

    52	
    53	static int __init test_fns(void)
    54	{
    55		static unsigned long buf[10000] __initdata;
  > 56		static volatile __used unsigned long tmp __initdata;
    57		unsigned int i, n;
    58		ktime_t time;
    59	
    60		get_random_bytes(buf, sizeof(buf));
    61		time = ktime_get();
    62	
    63		for (n = 0; n < BITS_PER_LONG; n++)
    64			for (i = 0; i < 10000; i++)
    65				tmp = fns(buf[i], n);
    66	
    67		time = ktime_get() - time;
    68		pr_err("fns:  %18llu ns\n", time);
    69	
    70		return 0;
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
