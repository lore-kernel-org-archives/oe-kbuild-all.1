Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4641F14286
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 04:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732596229; cv=none; b=fQS9oB5JkHQEv6f2Nlf9lvmlfUXqAYqH5m+JosJApSpn6YoqIfX+NuhcDsT/9hzQaFJRfdLJo+zQgqSujZGEs0f7KSkcuhWYP+zqoB8OA3Ti9VcXBqDIH4sZpZLP+oZA5LLuhdBVOB39OSXqSkVNzZm7iVvDmnq7bMy9Uj15Pr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732596229; c=relaxed/simple;
	bh=Snlhg7RZiX0gQET/xxech3rYOGCZsqt929znrVBq2GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dLzBZtRmkzHGqe5gUs2Nkzk0Hmtvyhbap5tzsxRrxLCmCRaT++ZQg4+kuGOzETvLGBJqRdZ/i2mrFTiyWDsifivohSeHf9pRP0Ue4hSShBv1SYZNzqG8mgVTbDJt1dKcFEd3cIibf7PEr/nAANje/y5VbU80FxcejFFTcT0PHLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4gikZvn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4gikZvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732596228; x=1764132228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Snlhg7RZiX0gQET/xxech3rYOGCZsqt929znrVBq2GE=;
  b=Q4gikZvnqlCcBcd8+djcBv2CvP70bOnLkHanPTfBEHFiYs9fI5qJp0AH
   6HNq5xYEbQwgfM0GxIJJtCZMIfddTCU+2FLg8y/8v1WTQc7pr/i7HjEpJ
   92cTYj/QfR2FVFG2FfrCyuM4+krrgB0rR9bLE+QDOXgkFOK7ioCMV8mV5
   Bj8DJAX+Ka0abseAhsISiLcqbdeG6AA1D+r8TZlX4H0jFGB/jjME1RVJM
   ffQgWy6lYGOIcPyfrFpQ5Yc9z1OsAO7YwYekBsPIejcQ249klfpx198ns
   J/hGPSKPQZgbDChCiqwqxrKbxisNNmd2IbmM7o3N6WzLw/OhaTKApDQvp
   A==;
X-CSE-ConnectionGUID: krmZJD5qQCSYsfKnO08AYw==
X-CSE-MsgGUID: vfBNmOjwTuy5p+OqRY1ROQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50262682"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="50262682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 20:43:47 -0800
X-CSE-ConnectionGUID: XURSU8FrRmG5hBK0fMu5PA==
X-CSE-MsgGUID: risTEnIpQzSlR81JPU95Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="114753919"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2024 20:43:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFnQN-00074f-2c;
	Tue, 26 Nov 2024 04:43:43 +0000
Date: Tue, 26 Nov 2024 12:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 4/4] mm/migrate.c:2750:41: error:
 expected expression before '||' token
Message-ID: <202411261443.KmhoR9ju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   bc46f47dbd9b1e365d338f89a0ab10eadce13982
commit: bc46f47dbd9b1e365d338f89a0ab10eadce13982 [4/4] migrate,sysfs: add pagecache promotion
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241126/202411261443.KmhoR9ju-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261443.KmhoR9ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261443.KmhoR9ju-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/migrate.c: In function 'promotion_candidate':
>> mm/migrate.c:2750:41: error: expected expression before '||' token
    2750 |             folio_test_isolated(folio)) ||
         |                                         ^~
>> mm/migrate.c:2736:20: warning: unused variable 'last_cpupid' [-Wunused-variable]
    2736 |         int flags, last_cpupid;
         |                    ^~~~~~~~~~~
>> mm/migrate.c:2736:13: warning: unused variable 'flags' [-Wunused-variable]
    2736 |         int flags, last_cpupid;
         |             ^~~~~
>> mm/migrate.c:2734:14: warning: unused variable 'write' [-Wunused-variable]
    2734 |         bool write = mapping ? mapping->gfp_mask & __GFP_WRITE : false;
         |              ^~~~~


vim +2750 mm/migrate.c

  2716	
  2717	/**
  2718	 * promotion_candidate() - report a promotion candidate folio
  2719	 *
  2720	 * @folio: The folio reported as a candidate
  2721	 *
  2722	 * Records folio access time and places the folio on the task promotion list
  2723	 * if access time is less than the threshhold. The folio will be isolated from
  2724	 * LRU if selected, and task_work will putback the folio on promotion failure.
  2725	 *
  2726	 * Takes a folio reference that will be released in task work.
  2727	 */
  2728	void promotion_candidate(struct folio *folio)
  2729	{
  2730		struct task_struct *task = current;
  2731		struct list_head *promo_list= &task->promo_list;
  2732		struct callback_head *work = &task->numa_promo_work;
  2733		struct address_space *mapping = folio_mapping(folio);
> 2734		bool write = mapping ? mapping->gfp_mask & __GFP_WRITE : false;
  2735		int nid = folio_nid(folio);
> 2736		int flags, last_cpupid;
  2737	
  2738		/*
  2739		 * Only do this work if:
  2740		 *     1) tiering and pagecache promotion are enabled
  2741		 *     2) the page can actually be promoted
  2742		 *     3) The hint-fault latency is relatively hot
  2743		 *     4) the folio is not already isolated
  2744		 *     5) This is not a kernel thread context
  2745		 */
  2746		if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) ||
  2747		    !numa_pagecache_promotion_enabled ||
  2748		    node_is_toptier(nid) ||
  2749		    numa_hint_fault_latency(folio) >= PAGE_ACCESS_TIME_MASK ||
> 2750		    folio_test_isolated(folio)) ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
