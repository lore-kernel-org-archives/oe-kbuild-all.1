Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFE43E6DD9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004544; cv=none; b=QCk5vtHWOAzJ3QwbDqV0UXswzfWsQEkwVG2YZVor1IBfh2ClQzAmB4A3KU8cGoD/1+1VHfPldoC66fb4BLpRPtxxIqPhjx+/oDga/bf+jXMjQFEkkLUSl1Br9Hc6Yep2w5AkkMiCa1jf2fNmcdmFsmwuZb9OeOhKybhMsHeG5CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004544; c=relaxed/simple;
	bh=JsYIKaIJ1i1fFAEQuKR3azXIH9dw80AP+5vNEZZ13CI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lq5XB+jF+EsKvvcwLVFAC2K/hgx4SWfDNOA1xz4cPfJ3h3owDc4iTNr9Dg5qdyDc4HYgGs8ATLnO4gtMkLcuUfN7U8BfYlfrsGPeiVuB87sqvdPSdm5CX/Rv8sHE+mZa7erXPXK5Kg1ee16qAH6JY2pPv52sifRM0MyInYPHTm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQVeQgXN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQVeQgXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786004542; x=1817540542;
  h=date:from:to:cc:subject:message-id;
  bh=JsYIKaIJ1i1fFAEQuKR3azXIH9dw80AP+5vNEZZ13CI=;
  b=kQVeQgXNzStYdBMcXPvIW8VhXcELUil6QgkIkOrfNoLTEJNPKZH013bL
   hSVRM37lVkU9ZeOBOgvCp8bFXfJ46zrEJAQOGBdkPMPkpRFZgMVgVC8u5
   hV7k/j/lWWH1Sv1LHaFvWLEopD1TghqRAajQJ8j84uFJHLH00mI/rhGOE
   XCZyId312Rt9xUqAZKpVNvb4dHydnzNE6uxBgNNw2edgOynymYV+vTEGU
   2SAN8A6CjdVWiDCJ5mOIYsahDd/4U1+9audRdqmG1hnXFPcWHiyQlHXE7
   dNrHfGmNQTwJTf1mlSiXE1DZZmVA/yKEywBqL/4IB3FTQXuZGinqeh3by
   g==;
X-CSE-ConnectionGUID: baZjTdc8QUqkdRIDJ2RTjw==
X-CSE-MsgGUID: cI1ZAvkmQu6n6gmO/KqWsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90408028"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="90408028"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 01:22:21 -0700
X-CSE-ConnectionGUID: 2KB7XXzHSQq9efnU8Dae/A==
X-CSE-MsgGUID: 4j6IFL9fQ2SxKjIzjtmL6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265879901"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2026 01:22:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrtMn-00000000EdB-233v;
	Thu, 06 Aug 2026 08:22:17 +0000
Date: Thu, 06 Aug 2026 16:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: include/linux/jiffies.h:470:36: sparse: sparse: cast
 truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
Message-ID: <202608061645.FE6qJ4pT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: b777b5e09eabeefc6ba80f4296366a4742701103 time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
date:   6 months ago
config: alpha-randconfig-r111-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061645.FE6qJ4pT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061645.FE6qJ4pT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b777b5e09eab ("time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061645.FE6qJ4pT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/mac80211/agg-rx.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
--
   net/mac80211/agg-tx.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
--
   net/mac80211/mesh_hwmp.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
--
   net/mac80211/mesh.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
--
   net/mac80211/rx.c: note: in included file:
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
--
   net/mac80211/mlme.c: note: in included file (through include/linux/delay.h):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)

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
