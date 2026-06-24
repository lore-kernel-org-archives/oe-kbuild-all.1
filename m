Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF8639B95D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337071; cv=none; b=sj6fSMtZIJFEEldvkhDgYvW5+cFgOWqvhPuQOROgDaavYIfVz/uQZWQz3cKPZzvqRZ86gjRdpqdMlzbXnwRBXHsJ0leo4odeiHtIO749vEgG65WXFUiAbqfTYXFXHuW0FBslpoMsdocSTjJpaaxfr6jPA8uXaLoz0fTbbzwyWtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337071; c=relaxed/simple;
	bh=zuJGNQQJHfwJes12bn+NZxbGJrf+VV5+Oqr3fMbcY9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lrl5JnI9uhFJY31RAVyxuwmsu5FUbTKmg/RfFljx+vV+eqT0JgAYePDkF/QLo90dAb0QPCvWIk7y7cddxP0ZE76M1kggODm6hfdMEWircyjNfUDUKJF3tB5nrh4ivmMeG8GQ5NJJT0OnE788gp3H0f2QVwL4EfiRAj8yVMCgfPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIZXraqO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIZXraqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782337070; x=1813873070;
  h=date:from:to:cc:subject:message-id;
  bh=zuJGNQQJHfwJes12bn+NZxbGJrf+VV5+Oqr3fMbcY9I=;
  b=VIZXraqOvGP9S6hzCto6LUhRHaIwHbw3uKIEhd/fUul0i3MtHT59XcPf
   aPSM0apqgZwo5sU4T7AU+BTWAVRtrWjVElGMNsEmZH62UPxLewzBpym8i
   KmrfTa1RYBrzZwRWQjH7JZ33NYLX4QnlQVSkjwHiGG5D3E866w/08kjdl
   DG1HFmfchPW+roLlO9Mk9dm0ENVNq16iRBn2ABRTP9/j9CTvXnAm3ycqm
   ou6SQ29Fn1qbnj+ELYr+igcLYUVhTd40UoFj/0pWR9S46wjx48JEsVBsg
   8+6f38Jli7Nbemm5acCFfZzuFBco/NwEyFFStqBxXITiX5ueccKJkacem
   w==;
X-CSE-ConnectionGUID: YPd+NFB4SJ6SPE4bIf2SuQ==
X-CSE-MsgGUID: +0GiJmJUQvqrl+waYRwhDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83113467"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83113467"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 14:37:49 -0700
X-CSE-ConnectionGUID: epWO+/t3Rbm/jD6/oT+5Xg==
X-CSE-MsgGUID: xXmcfX2+TqC/dYqV9C/HnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="254962500"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2026 14:37:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcVI0-000000003gN-0p5I;
	Wed, 24 Jun 2026 21:37:45 +0000
Date: Thu, 25 Jun 2026 05:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [jic23-iio:testing 23/62] Warning: lib/kstrtox.c:59 function
 parameter 'init' not described in '_parse_integer_limit'
Message-ID: <202606250505.W2lYv9PS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   7667a80340e99fd45357d0c90ae05813b01bbfef
commit: 521b4ae3b5a47cf4ef5826016eecde08e8740bef [23/62] lib: kstrtox: add initial value to _parse_integer_limit()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260625/202606250505.W2lYv9PS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250505.W2lYv9PS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250505.W2lYv9PS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/kstrtox.c:59 function parameter 'init' not described in '_parse_integer_limit'
>> Warning: lib/kstrtox.c:59 function parameter 'init' not described in '_parse_integer_limit'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
