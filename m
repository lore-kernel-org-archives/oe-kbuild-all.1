Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAC46447
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793843; cv=none; b=i7NhGKM6bG4BMIsb/TCBwO/f1VmMUEUjn36gRifcQY+Rz1C8Ka2JnZc4oC/k35qKNY7BCVHMPm0ElPzJGTk0Tzp5NEYpV3DHpDSsoiinMn4JzTfEr4DJBO/gu8UtWJYrSVnz4wfZl6K18Qtr5iT/cNzOlVyZx2a2XF95hyWrV/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793843; c=relaxed/simple;
	bh=ZRZ4otUsRY1JjZc4B1xrhLAtPpo+nFS7CwwIUFzWhAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvAReRRx6vzMUB2ncv60QiiolUxi9ACu4tF+anQiQf/n2Sr93X36ohUlhwBg0S6/KZdIbVZtpHibEsvj/dK9eN2qA1D8SybjO4PfcrJFt+6PDp9/Kt6Q9NXh9LEsXfG2ikSxd4HSoEj3U2COq+jtOGs4Wf/FJecXpX3UuPlF064=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJ3bIKZe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJ3bIKZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753793842; x=1785329842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZRZ4otUsRY1JjZc4B1xrhLAtPpo+nFS7CwwIUFzWhAw=;
  b=jJ3bIKZeH/GgJ1RNJFGzpH1Gmuj/ZGRFGLPBjea6KpvAaBQIFYPYgZDd
   DhZn4I9LrRIbQsDupBAILUTLtENnsYNNOfF8Zq1h56PSMRpmMtqARNz67
   toBocPZVvIkdyQwGDstz8wDvA2IovT8WkvNWiaJwWmgB3eiz2AO88LZbc
   DNBVgZpdFxXRZOJ/27HTJqmgUg8I+Nv9LOG05z/lIYBscwNvzHZHRHd/y
   RQCgtmBpZrFlxnl4/3T6ikK7MCRnC4/9noK/r7zehtwHhr3C90TBjpyZN
   S9BXo9uwlV3+RiHU5N/vXPxZ4ipFAxjiNIijPcAjIQS2xSmmEtHvryuPJ
   w==;
X-CSE-ConnectionGUID: O5RhJ3h5RyegfXu2L9ZjnA==
X-CSE-MsgGUID: 477V6zwMR7eD4R7leQMewA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55268253"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="55268253"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 05:57:20 -0700
X-CSE-ConnectionGUID: 9xt6LF7PRh6OLjJ2DSW4/g==
X-CSE-MsgGUID: Ctmz1JVRTJCGbvs5EPKpWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="163034319"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2025 05:57:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugjtM-0001IF-2X;
	Tue, 29 Jul 2025 12:57:16 +0000
Date: Tue, 29 Jul 2025 20:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] net: add net-device TX clock source selection
 framework
Message-ID: <202507292013.LP57OCNg-lkp@intel.com>
References: <20250729104528.1984928-1-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729104528.1984928-1-arkadiusz.kubalewski@intel.com>

Hi Arkadiusz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fa582ca7e187a15e772e6a72fe035f649b387a60]

url:    https://github.com/intel-lab-lkp/linux/commits/Arkadiusz-Kubalewski/net-add-net-device-TX-clock-source-selection-framework/20250729-185213
base:   fa582ca7e187a15e772e6a72fe035f649b387a60
patch link:    https://lore.kernel.org/r/20250729104528.1984928-1-arkadiusz.kubalewski%40intel.com
patch subject: [RFC PATCH] net: add net-device TX clock source selection framework
config: csky-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507292013.LP57OCNg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507292013.LP57OCNg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507292013.LP57OCNg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:12: net/phy_clk/Makefile: No such file or directory
>> make[5]: *** No rule to make target 'net/phy_clk/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'net/phy_clk/Makefile'.
   make[4]: *** [scripts/Makefile.clean:61: net/phy_clk] Error 2 shuffle=492353021
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:61: net] Error 2 shuffle=492353021
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [Makefile:2008: _clean_.] Error 2 shuffle=492353021
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=492353021
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=492353021
   make: Target 'distclean' not remade because of errors.


vim +12 scripts/Makefile.clean

^1da177e4c3f41 Linus Torvalds  2005-04-16   7  
4f1933620f5714 Paul Smith      2006-03-05   8  PHONY := __clean
^1da177e4c3f41 Linus Torvalds  2005-04-16   9  __clean:
^1da177e4c3f41 Linus Torvalds  2005-04-16  10  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  11  include $(srctree)/scripts/Kbuild.include
a2430b25c31840 Masahiro Yamada 2022-11-19 @12  include $(kbuild-file)
^1da177e4c3f41 Linus Torvalds  2005-04-16  13  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
