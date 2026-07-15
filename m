Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC433BB112
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 23:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784157888; cv=none; b=LIFwfLGoIrrnE8jJTNPQUjpbR8t/fy6GM+oBShVjvflGwYnO4azYo+vvlLz5JYXKy3+vt2BLQbcZA5lRez/aR6sW3vJ42wIULr4Kkb7KFHZnRFIs7W6K9mIvhnRn7drj7/CpXHTEU6E5uySHqfzafTjliBQOKCUYUuPyuTUCAbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784157888; c=relaxed/simple;
	bh=eqt+AXaNmmiwskM6SU9X3PYgE4Woe1yM3CDLgNxSlZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PMA6SIewXZKTkTboe2Z3lTv2wzCxo6rw3U43Tql/cLx79S0nNMT4GBOh0Di+aGF+w3vy+QYHXDD13BICWKJorB1VKbG4lIYvgGcSIUn5rHXTWMcpYytbXNPNYKmofQh6A1B+tklWNlOAqw+SlyePnMxuneCjjzpYUTet9PmJ068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmDsxcEN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmDsxcEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784157884; x=1815693884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eqt+AXaNmmiwskM6SU9X3PYgE4Woe1yM3CDLgNxSlZ8=;
  b=LmDsxcEN+WzaEtsmNODJMx4XOUmmfJeXWCuOs4qulTRBaVuwLCVMbYtr
   PFES5uy2iEC2mxvTtwiQ7rdovMw1Z3Uoe3gD17woo9dEzXkN/JjtNNQhb
   c1ET5WRTMi8lwvZorbUL6liAaLnAr+impueLKC1S9SDrS8k5eCE39rS1e
   ee8tQgqidPb2O0Li3XFv2y+bUsDgBcYFhvsFZ7IVzIOfOaqihtQXYLcrA
   wE74RjzObMFtFIjhKGVruOM/Hb+zQgON8mBCfZDme1VYy3G09KFmPPiB3
   uQjQaBHeIHiMCtSLZRduCV0QPW6ZDXZIy3MC/F4z9YEa4+N6daB3TSR5z
   g==;
X-CSE-ConnectionGUID: uAHLnEZ0Qr+XZz1UVwZQeA==
X-CSE-MsgGUID: 7WkiLnGeRDuHPUNqNA4M6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83933323"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="83933323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 16:24:44 -0700
X-CSE-ConnectionGUID: nKec6feqQc24+AdXJmhK4g==
X-CSE-MsgGUID: 90o2PBPrT/WX/cYZlGjfEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294548204"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 16:24:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk8xn-00000000O5O-18dk;
	Wed, 15 Jul 2026 23:24:31 +0000
Date: Thu, 16 Jul 2026 07:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 79/96]
 sparc-linux-ld: hrtimer.c:undefined reference to `HRTIMER_BASE_AUX0'
Message-ID: <202607160740.qrFMU4In-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   aae9c6fcfe1b60e4a63da0fe64f8ffe470b0fa29
commit: 69bfefa1c9bf52492df144e6ad0daf86f82a3727 [79/96] DELETEME
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260716/202607160740.qrFMU4In-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160740.qrFMU4In-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160740.qrFMU4In-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: kernel/time/hrtimer.o: in function `hrtimers_disable_clock':
   hrtimer.c:(.text+0x1f44): undefined reference to `HRTIMER_BASE_AUX0'
>> sparc-linux-ld: hrtimer.c:(.text+0x1f48): undefined reference to `HRTIMER_BASE_AUX0'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
