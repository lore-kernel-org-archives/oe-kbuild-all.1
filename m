Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B6D1EA91
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 13:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737207798; cv=none; b=CvAu4J90IpvTosfcfLd6PlLDgAyVki3r7w+ZhgmKKcsNKGMJ1Y1dDBLWRKRNu0+2c1SBaOSPgILKipJ6mTsv+EmUppXP6yif3QCXzkd6uGp47kf8dVnAM90m+mD+gr8Wn86XOyf4cSaNjnttISdphAEiWbVvUDjJIUfVv84HJYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737207798; c=relaxed/simple;
	bh=R/4YZtqv5LHi0onMXMW3QhyWVFCJKUCglcKrDIhcsXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fR3Rm8IYjsCGvc72h58NgCeBVw4INc0dvRpQH5ghzMQ5LOknreTgMC4dEg4VsopgHHvCkX8FOdmUtQoim7C+rdP4jIUYtQOq8Qsr9Xl4Rm+96dINrXykbEaaSnKatuXhNW9ZqE+fmYNVTcQ+8Hkx1tJiOMQV9Ee4c8DyrXgnFQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrcOVLbU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrcOVLbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737207796; x=1768743796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R/4YZtqv5LHi0onMXMW3QhyWVFCJKUCglcKrDIhcsXQ=;
  b=LrcOVLbUW3Xe8YrzUOHvX8DKEZgZDoQHphLmc/lrXyo9/4efOsJJ/uMk
   q8wOMfk+f2QO2mKV8wfYL7ZvfTgV4fz5Kf8zxD1SUOS0g0CUjU8tpYLa5
   QbMAcqFbUKZUuS9oRkSn1YYnSo8xAtJzHTxKqyB974TM0ZD36olzjymAx
   mJzBXVuCJ3snPbN6s9K+8Dc0wqxjlTy1P9ZLMzgrHXwm0AIi4qETwKNE0
   P9MV6aZVsb1oyNcuMOjPfUo0QWstq7dE7Q9UQtcg9+wVxkSpnyIyBDUW/
   V2e9x5QeZuQ2w7F6osibZpota7LAZw7GN0n/WeZgXKns+NeHi7f+CO/1u
   Q==;
X-CSE-ConnectionGUID: gc/kFuH7TFW0YlRPzXi6wg==
X-CSE-MsgGUID: oQXn8e5bTzarLljc7aesoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="41391942"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="41391942"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:43:16 -0800
X-CSE-ConnectionGUID: t4hS9hvXSaa8l/uBOA+iWA==
X-CSE-MsgGUID: iRYfs0LXSzmEIiTW7pAU8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143342636"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2025 05:43:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ96V-000UTj-2x;
	Sat, 18 Jan 2025 13:43:11 +0000
Date: Sat, 18 Jan 2025 21:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/slub-percpu-sheaves 6/12] mm/slab_common.c:1597:13:
 warning: 'kfree_rcu_sheaf' defined but not used
Message-ID: <202501182133.PuVVlVXs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slub-percpu-sheaves
head:   546b53af69edb10fbe90803471b88cb50ca854ec
commit: ec8b102537dcd5e9cb7b968df37eea20d11acc57 [6/12] mm/slub: add sheaf support for batching kfree_rcu() operations
config: arm-randconfig-004-20250118 (https://download.01.org/0day-ci/archive/20250118/202501182133.PuVVlVXs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182133.PuVVlVXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182133.PuVVlVXs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slab_common.c:1597:13: warning: 'kfree_rcu_sheaf' defined but not used [-Wunused-function]
    1597 | static bool kfree_rcu_sheaf(void *obj)
         |             ^~~~~~~~~~~~~~~


vim +/kfree_rcu_sheaf +1597 mm/slab_common.c

  1596	
> 1597	static bool kfree_rcu_sheaf(void *obj)
  1598	{
  1599		struct kmem_cache *s;
  1600		struct folio *folio;
  1601		struct slab *slab;
  1602	
  1603		folio = virt_to_folio(obj);
  1604		if (unlikely(!folio_test_slab(folio)))
  1605			return false;
  1606	
  1607		slab = folio_slab(folio);
  1608		s = slab->slab_cache;
  1609		if (s->cpu_sheaves)
  1610			return __kfree_rcu_sheaf(s, obj);
  1611	
  1612		return false;
  1613	}
  1614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
