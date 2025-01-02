Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A2243173
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735854025; cv=none; b=mCoqkjJrgamQO8mtR/UF6tii+eCWbfRa+VhBFc6txpsAg3qFICROJ0Nkwb57OAEbgKIg/opyY5asy8+OJZM4c3VKjVNbuYOI/CLUMA1ZxQ9xEyIGsKEVv87rbQfMJ713HUhXujloK9/Jn3nWnMz36oKVWsS4vWRgDhflaOpufvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735854025; c=relaxed/simple;
	bh=zWz8vX1D+bRv+JXgvpoDPq7Uu4S412MMQ4PoFDcGVWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VS+T/bG9uz0a1j4Lf8A3EzxoDEFNPhk4uu5U0YSOszU89YWl1MHlu33lld24yzqmZpd4GrlGaZXtbFzswshaFcuYntajbbX9cmc0aolAt4YyOl5aKtxG74TFdUN1BErf6PmRO1ulxXu8ypyIdiMSMLXt+ph4t8mzc0r3HejqxjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrJ7wTom; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrJ7wTom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735854024; x=1767390024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWz8vX1D+bRv+JXgvpoDPq7Uu4S412MMQ4PoFDcGVWQ=;
  b=NrJ7wTomGoH+DsovqjCuG2rUb8h2/au8Nak1/Wbok5lzX30JX7Ybx+Rh
   65uODzUlFxpjhwR+MFFmpFrPe4MzdS8SlcMDaFyB/QLRCRMPW0seP90/C
   YB7RPXW6HeFy1Rf7/y4DnWRgPN/VwmBW4cmLtEm2qdJAn/5Kkz1iZAxI9
   mVldzb/5NN+70tVMF3D4L7H70o/gfoeybPPgwkmVBdSQUSQW5Yv/mzBzz
   67MOzs2qSN9NaI5gVXmnB3GRnqVE8nF/uX64n6VBO4u8QQxrCmq8ht6ix
   R4qCInYCImBdT2jHXs/SAUedSm/8JVYEA/xwRb40hUGf74cC4XSFizJBY
   Q==;
X-CSE-ConnectionGUID: NUyuEXiJQO2WFNsTO2iwVQ==
X-CSE-MsgGUID: B94sKFRVRravOA6veAQIcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="47462897"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="47462897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 13:40:24 -0800
X-CSE-ConnectionGUID: 1cBXeOjTTLO+SCdpvXRzBA==
X-CSE-MsgGUID: Wrs39LAzSs6f+dK0H8jrFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101463750"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jan 2025 13:40:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTSvT-0008tP-1N;
	Thu, 02 Jan 2025 21:40:19 +0000
Date: Fri, 3 Jan 2025 05:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
Message-ID: <202501030516.uZrwnuQQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
head:   17810b1de0e9e5c1000cf8f5b4787ad930b0353e
commit: e96424b86d5098f44279399b85551e0f84a1c9e9 [2/2] m68k: Use kernel's generic muldi3 libgcc function
config: m68k-randconfig-r122-20250101 (https://download.01.org/0day-ci/archive/20250103/202501030516.uZrwnuQQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501030516.uZrwnuQQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030516.uZrwnuQQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: not addressable
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)

vim +53 lib/muldi3.c

b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  48  
b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  49  long long notrace __muldi3(long long u, long long v)
b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  50  {
b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  51  	const DWunion uu = {.ll = u};
b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  52  	const DWunion vv = {.ll = v};
b35cd9884fa5d81 Palmer Dabbelt 2017-05-23 @53  	DWunion w = {.ll = __umulsidi3(uu.s.low, vv.s.low)};

:::::: The code at line 53 was first introduced by commit
:::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of some GCC library routines

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
