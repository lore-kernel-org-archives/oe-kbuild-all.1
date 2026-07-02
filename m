Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480623EEAE9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989562; cv=none; b=B2waYWN4q5ZlTDGWZcJbRCTwwGtwxsSpowUV6dsAAKf1pmSNkyLknCeBzX+QptHZGdXBuviGnqHd33bONaq5YksKBYtXUbwt+Hn+gcyv5PDiQxNsu1pXS6gzffkFxGD/r2OSML0yUU/tXh+36WlTaouttOJuggH4oV9IymzN2u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989562; c=relaxed/simple;
	bh=oE/WD31q+etoXEnhBkUU3MGYUD0BppE/vCYz32N2FxM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nwEo6LiKyync4+lMCo6jvmi+MJ2ACjYpC/y/ouhL2yP9UYgwvvPi6WIh620qq0NtNbpOTioFnHVv9u9ARg1ty/1FgOxRzllxfLx4ackW0oeX+gjs93x5hyrmcHlJETILaT2eSeQT3qR69ytrxaiHYvf+PdjZWNT4oMHVijm9ICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONFo7qOY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONFo7qOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782989561; x=1814525561;
  h=date:from:to:cc:subject:message-id;
  bh=oE/WD31q+etoXEnhBkUU3MGYUD0BppE/vCYz32N2FxM=;
  b=ONFo7qOYyIq77X+iqHVu8bOj5IhIZy5MyfRO1K74r9m/vzQhx2WbXidw
   CIFKeWxlkzhEqvbWiPlhOrvYksnT+V9xzz12/0NhpORo74OqqzlmxidI1
   gc0uDVlW+7xFKZbevyureSGjneLiMRB99o5mhJWNvGZiwo1WHf4FBCYq3
   Pcmaj43ZtjB1Az6czNSBoUMi91mzqlb0oZ9/4LUvQI3VYrX8i9fDCohRA
   1KTg3NAkzJfYHAR9M9hnjMw1HloJwGIrzRSXSajxcS6QAXySMuyUiDcg1
   ck9Og60cQ5NqAc5nNSJFnXJRw4r+h6jqcPr9F2hQGsx8HsiXZOlzV03dJ
   w==;
X-CSE-ConnectionGUID: 0LpygdkBRVWLE3JMruw0GA==
X-CSE-MsgGUID: kuymvBzhQEGh039TRgx4Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="95244698"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95244698"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 03:52:40 -0700
X-CSE-ConnectionGUID: kXpyw1k/QBegB2kqemj2Tw==
X-CSE-MsgGUID: IE9aHswTS9+2p9zwBOEujA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248377095"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 03:52:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfF22-00000000AiN-2kNp;
	Thu, 02 Jul 2026 10:52:34 +0000
Date: Thu, 02 Jul 2026 18:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: include/linux/jiffies.h:470:36: sparse: sparse: cast
 truncates bits from constant value (7fffffffffff0bdc becomes ffff0bdc)
Message-ID: <202607021942.k1JA91jC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: b777b5e09eabeefc6ba80f4296366a4742701103 time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
date:   5 months ago
config: alpha-randconfig-r111-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021942.k1JA91jC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021942.k1JA91jC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b777b5e09eab ("time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021942.k1JA91jC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/wireless/realtek/rtw89/ps.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (7fffffffffff0bdc becomes ffff0bdc)
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (7fffffffffff0bdc becomes ffff0bdc)
--
   drivers/net/wireless/realtek/rtw89/chan.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (7fffffffffff0bdc becomes ffff0bdc)
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (7fffffffffff0bdc becomes ffff0bdc)
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (7fffffffffff0bdc becomes ffff0bdc)
--
   drivers/net/wireless/realtek/rtw89/core.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (7fffffffffff0bdc becomes ffff0bdc)

vim +470 include/linux/jiffies.h

   454	
   455	#if !(USEC_PER_SEC % HZ)
   456	/**
   457	 * jiffies_to_usecs - Convert jiffies to microseconds
   458	 * @j: jiffies value
   459	 *
   460	 * Return: microseconds value
   461	 */
   462	static inline unsigned int jiffies_to_usecs(const unsigned long j)
   463	{
   464		/*
   465		 * Hz usually doesn't go much further MSEC_PER_SEC.
   466		 * jiffies_to_usecs() and usecs_to_jiffies() depend on that.
   467		 */
   468		BUILD_BUG_ON(HZ > USEC_PER_SEC);
   469	
 > 470		return (USEC_PER_SEC / HZ) * j;
   471	}
   472	#else
   473	unsigned int jiffies_to_usecs(const unsigned long j);
   474	#endif
   475	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
