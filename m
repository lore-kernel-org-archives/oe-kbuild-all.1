Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291444E1CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713029022; cv=none; b=F9VJXXHjkpwhR/t6SPmKg2FPW380mtTzZv+J4vkfyA0tb9b+WCX7qTxINdtqyFbm39dh5fvU1inl6efXVdecVAv4A072xgpzgJgsIfJA6b+G5bJPveyM6Nrm2pCJx7Ld0O+8K1Pe5Jdrkc9rQVJ5VWcuYjwacNWFmdMaeEOK3Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713029022; c=relaxed/simple;
	bh=WWBXs0AYaR2fYC6IbJB0rV9bojBdhH10nsiw9/MktRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFMr6YyO+qGYW4NAsEO132SDaecsQHfGEIVfsVtRVcZ9T5pbE8Pma2JMhnC3LxumsLMKKBdaoKfEoMNzSH+ZR1pGTKsmhvYGLXM9m85lWLOcuD4Lmj8n/UMqt379/RV23luZqRELwpy4el0kKtjKwdZdwdpbfjLxQlq5q1A17Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=le5htdGk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="le5htdGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713029020; x=1744565020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWBXs0AYaR2fYC6IbJB0rV9bojBdhH10nsiw9/MktRE=;
  b=le5htdGk1H6rcVAphl3rg7ceOuwK3+1fctK9s8DudhDwcGKtLlT3NFxI
   GLlFoFqkfY1zTCa6gaMUz0MS1svOgZ+EvEi5fcp7Jzcq6G/3OZP3NcoL5
   +iqcvU+WIbFgV8PShVOPBXb+kufO6EPRwRtG4ZOtnpkuS//vzOfGQd0md
   eelmiy5TYucFDeh9XPf3ApSELf5Atw75hmw4/KFGG4eEUM8LYXPn0K6L1
   kASj0OkOkWhcwmdfDYItc1PMgsmngN5J++Tu0dnqIBMOcanPF6DqFrhC2
   AVa0bMFmZw1DVCtPySwXF3dxtpRpHXc6AK78Yj8Hbe99schsmzgb3KV3f
   Q==;
X-CSE-ConnectionGUID: gPo5ZuhpQauYirMkhZC5Sw==
X-CSE-MsgGUID: BlQG0wUuQCKEf1H8kU3gdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="12313957"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="12313957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 10:23:39 -0700
X-CSE-ConnectionGUID: Gult9vJ8QJe/5shiPzBrxg==
X-CSE-MsgGUID: aEL/NGOtTv6WV1NdEklwbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="22003463"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Apr 2024 10:23:36 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvh6E-0002wu-0S;
	Sat, 13 Apr 2024 17:23:34 +0000
Date: Sun, 14 Apr 2024 01:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5548/6461] mm/workingset.c:230: warning: Function
 parameter or member 'lruvec' not described in 'lru_eviction'
Message-ID: <202404140157.G9nQJbuy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c4ce1844f1a80961c5357dac5ef4837633bdaa11
commit: 95b44900741c0397e1dc0ff4147c644f3e0ec2d7 [5548/6461] emm: mm/workingset: move refault distance checking into to a helper
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240414/202404140157.G9nQJbuy-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404140157.G9nQJbuy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404140157.G9nQJbuy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:230: warning: Function parameter or member 'lruvec' not described in 'lru_eviction'
>> mm/workingset.c:230: warning: Function parameter or member 'type' not described in 'lru_eviction'
>> mm/workingset.c:230: warning: Function parameter or member 'nr_pages' not described in 'lru_eviction'
>> mm/workingset.c:230: warning: Function parameter or member 'bits' not described in 'lru_eviction'
>> mm/workingset.c:230: warning: Function parameter or member 'bucket_order' not described in 'lru_eviction'


vim +230 mm/workingset.c

   219	
   220	/**
   221	 * lru_eviction - age non-resident entries as LRU ages
   222	 *
   223	 * As in-memory pages are aged, non-resident pages need to be aged as
   224	 * well, in order for the refault distances later on to be comparable
   225	 * to the in-memory dimensions. This function allows reclaim and LRU
   226	 * operations to drive the non-resident aging along in parallel.
   227	 */
   228	static inline unsigned long lru_eviction(struct lruvec *lruvec, int type,
   229						 int nr_pages, int bits, int bucket_order)
 > 230	{
   231		unsigned long eviction;
   232	
   233		/*
   234		 * Reclaiming a cgroup means reclaiming all its children in a
   235		 * round-robin fashion. That means that each cgroup has an LRU
   236		 * order that is composed of the LRU orders of its child
   237		 * cgroups; and every page has an LRU position not just in the
   238		 * cgroup that owns it, but in all of that group's ancestors.
   239		 *
   240		 * So when the physical inactive list of a leaf cgroup ages,
   241		 * the virtual inactive lists of all its parents, including
   242		 * the root cgroup's, age as well.
   243		 */
   244		eviction = atomic_long_fetch_add_relaxed(nr_pages, &lruvec->evictions[type]);
   245		while ((lruvec = parent_lruvec(lruvec)))
   246			atomic_long_add(nr_pages, &lruvec->evictions[type]);
   247	
   248		/* Truncate the timestamp to fit in limited bits */
   249		eviction >>= bucket_order;
   250		eviction &= ~0UL >> (BITS_PER_LONG - bits);
   251		return eviction;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
