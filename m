Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FE11D90C9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 23:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733097380; cv=none; b=SdvwpqBylZFsmmKSaryBDiK4XTPa8C7LxoQPvmaAeQVL9mhkeTcVoWqugMY1lRje8aDptMaN51rQQXWWGafc+Xx/1H6IkKuHVKYR4Bq9asrQ5wGQPhJ3mA8YYh7ThbADK9c2ZZj09dR7sgXlUoIm5UrRwlmyDc5ZRz7bDHxoTBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733097380; c=relaxed/simple;
	bh=L2lgmJfIZgDdq3W6ICRne4CmqGD23LbWayIQbVrv7Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OSEHWKzhNYHe6UGO6ZwobeWXnw0XtkfqKgcJvuygwCAIyPejVlRN+/bRXdJ2ZgRt6shjfjncJmnMja4H0+Cm30eP01n8ryIoMj4HanMQ+LogEb2BH3AUKeSo9LF0Sl996GnX0t/ELmxr2hUuY5DMP5JBml0AEAwNVkoMZxebsFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LETSqQWY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LETSqQWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733097378; x=1764633378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2lgmJfIZgDdq3W6ICRne4CmqGD23LbWayIQbVrv7Cg=;
  b=LETSqQWYNigu3BsdU3hqJ/4umt2b4lFkz6B020u8OS6G9RHtZviTuaJv
   7EtcexmGhasdTUZkYXFbNlZ4NPY5GzO8hv9uRGjBPBICOqMb7RlgfyOUo
   DMlAyWzTkuH6Cq1yNe0xq0Cp72x07lCZtanPCpZ59s4wO1YLzsUTt5R7j
   NkjLkum7TLmvLxdsZ87Quc4CqDKis9C23/9INdrF6svShem0izmlWSWGY
   wnmd4svGEQUK7W3jD0TopWAAYcgeqY0ALRenhAbOOyNzxLbAw5Y/KdyUs
   2b3u7DKz6hxs3S1TjwnmQmPnmUPDcxmiOq8TNc+dH9tAk5WvMvMZmjdJ2
   g==;
X-CSE-ConnectionGUID: MzKefl4GSDasu7qWj0di8g==
X-CSE-MsgGUID: QAHw31o3SsKHbpLdcWuwyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="50769458"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="50769458"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 15:56:18 -0800
X-CSE-ConnectionGUID: xHOJO68FT5+Ks+d8WhvONw==
X-CSE-MsgGUID: aVx0rWmgTfuumAr48ECzfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="92862084"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2024 15:56:17 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHtnS-0001wm-2q;
	Sun, 01 Dec 2024 23:56:14 +0000
Date: Mon, 2 Dec 2024 07:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 62/72] mm/damon/sysfs-schemes.c:2199: warning:
 Function parameter or struct member 'sysfs_schemes' not described in
 'damos_sysfs_populate_region_dir'
Message-ID: <202412020702.S7FyZSzV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   b75cfd5260e9e512e1075267a70283e53e661357
commit: 2385753a6db33141791a25d611e6e5b63a9ddc4d [62/72] mm/damon/sysfs: use damos_walk() for schemes tried regions update
config: x86_64-buildonly-randconfig-003-20241202 (https://download.01.org/0day-ci/archive/20241202/202412020702.S7FyZSzV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020702.S7FyZSzV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020702.S7FyZSzV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/sysfs-schemes.c:2199: warning: Function parameter or struct member 'sysfs_schemes' not described in 'damos_sysfs_populate_region_dir'
>> mm/damon/sysfs-schemes.c:2199: warning: Function parameter or struct member 'ctx' not described in 'damos_sysfs_populate_region_dir'
>> mm/damon/sysfs-schemes.c:2199: warning: Function parameter or struct member 't' not described in 'damos_sysfs_populate_region_dir'
>> mm/damon/sysfs-schemes.c:2199: warning: Function parameter or struct member 'r' not described in 'damos_sysfs_populate_region_dir'
>> mm/damon/sysfs-schemes.c:2199: warning: Function parameter or struct member 's' not described in 'damos_sysfs_populate_region_dir'
>> mm/damon/sysfs-schemes.c:2199: warning: Function parameter or struct member 'total_bytes_only' not described in 'damos_sysfs_populate_region_dir'


vim +2199 mm/damon/sysfs-schemes.c

  2190	
  2191	/**
  2192	 * damos_sysfs_populate_region_dir() - Populate a schemes tried region dir.
  2193	 *
  2194	 * Called from DAMOS walk callback while holding damon_sysfs_lock.
  2195	 */
  2196	void damos_sysfs_populate_region_dir(struct damon_sysfs_schemes *sysfs_schemes,
  2197			struct damon_ctx *ctx, struct damon_target *t,
  2198			struct damon_region *r, struct damos *s, bool total_bytes_only)
> 2199	{
  2200		struct damos *scheme;
  2201		struct damon_sysfs_scheme_regions *sysfs_regions;
  2202		struct damon_sysfs_scheme_region *region;
  2203		int schemes_idx = 0;
  2204	
  2205		damon_for_each_scheme(scheme, ctx) {
  2206			if (scheme == s)
  2207				break;
  2208			schemes_idx++;
  2209		}
  2210	
  2211		/* user could have removed the scheme sysfs dir */
  2212		if (schemes_idx >= sysfs_schemes->nr)
  2213			return;
  2214	
  2215		sysfs_regions = sysfs_schemes->schemes_arr[schemes_idx]->tried_regions;
  2216		sysfs_regions->total_bytes += r->ar.end - r->ar.start;
  2217		if (total_bytes_only)
  2218			return;
  2219	
  2220		region = damon_sysfs_scheme_region_alloc(r);
  2221		if (!region)
  2222			return;
  2223		list_add_tail(&region->list, &sysfs_regions->regions_list);
  2224		sysfs_regions->nr_regions++;
  2225		if (kobject_init_and_add(&region->kobj,
  2226					&damon_sysfs_scheme_region_ktype,
  2227					&sysfs_regions->kobj, "%d",
  2228					damon_sysfs_schemes_region_idx++)) {
  2229			kobject_put(&region->kobj);
  2230		}
  2231	}
  2232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
