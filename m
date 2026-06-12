Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE06F313E24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257555; cv=none; b=VagZ05T4QROOs6CqaHTn5pThVv8dYclVGaUhGJbLfv1vXOGXfHVfyd4TNzsY+WjZU0vGeQALsNnJOfNiWDwRSF90Sm63xw99F5P+TKRYi/1LaIsHLaIgbzHvwe2IFeqlMfwdpRHs2d3CHv71lVHFokjQW/6msBWKH1JEsOtFoN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257555; c=relaxed/simple;
	bh=mA5ODsXDkeLn7jgVCMCQPuz3oiRVXB9I2YE4nabsfZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YYYOQdWtOdAZ+DrXidultq3xCqF6Wd8m9OU9WFJBmVT2014nJ6xlE4nZXclZjKCCDpZh0O1Aus2XvHTyM1flT6g3vg8aEy/S/EHsCkOnsAl71GZzON3z+U0naTGJ35B/Xj/58/8Xn5CiLeYgWuWWm8lzw3emd6W7fRndVkFTceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ID1N7Dsf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ID1N7Dsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781257553; x=1812793553;
  h=date:from:to:cc:subject:message-id;
  bh=mA5ODsXDkeLn7jgVCMCQPuz3oiRVXB9I2YE4nabsfZQ=;
  b=ID1N7DsfHEWDQf5ar6t0hXa5LYsljrW2Dn6D0tzhFnXp3rsjgQJOZvaL
   uYpwV4Vb6YFpvHgRzdxkRcNXaabfbbbbydcqS+USYImMrRAc5WAsypynZ
   1iGMCjEtdsjtNWNIOb7qJb/RkSvwB5qXttbTaksSMpQHhdV6H5Ms/cyyV
   wEksM5WaQzouO5aYBaW1Pmw2yvo+gORH+fBEIkYFxK5dEA9t1Vv3uedAX
   WPb46qIfVYIE8PJfG+lSA/gDMO4mR4CuHAocIdijZJJdfTERJlnTLNlvF
   T9VfyV00EPkBt/hsz1sK9WCSqKRMxs9NS+CFuIlxRDNIuN6WACieDgTjW
   A==;
X-CSE-ConnectionGUID: 6QsnxiRhTkmqPhCYQma5gA==
X-CSE-MsgGUID: VxeaomJHTnS6MwoIaeuQBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81992478"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81992478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 02:45:53 -0700
X-CSE-ConnectionGUID: w8np+ShWS3WPC/RECmR0SA==
X-CSE-MsgGUID: FOKF/LA5Q4OX52LFOfLK0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="248664740"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2026 02:45:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXySS-00000000OZn-43UP;
	Fri, 12 Jun 2026 09:45:48 +0000
Date: Fri, 12 Jun 2026 17:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:timekeeping 3/4] ntp.c:undefined reference to
 `__divdi3'
Message-ID: <202606121707.36E3rJ2o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux timekeeping
head:   e7f603c6279b37147e7f69f394706df2546459b9
commit: c763fbd03afe23fb69685b6987fabf43c65ed579 [3/4] timekeeping: Settle competing time_offset and time_adjust skew
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260612/202606121707.36E3rJ2o-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121707.36E3rJ2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121707.36E3rJ2o-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/time/ntp.o: in function `second_overflow':
>> ntp.c:(.text+0x1434): undefined reference to `__divdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
