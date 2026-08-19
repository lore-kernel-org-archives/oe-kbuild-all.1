Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9153CF202
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787122486; cv=none; b=TZ+kr8Z00VPA1LVaG7uaux5BKE2o0sKjrfgL6dwx12Eb1NWMkLfUK01ofk9mw7/9r0BNk0+/rsSIqO28TK/9f5W3LQ/afKxbbh/GtfR4at5XCL+z6VcU1hcyDJDevnuwXzPoeJRLb7Vxx+QaiCv2gEu4WJZB4j42rOpBoPRB+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787122486; c=relaxed/simple;
	bh=Q+AJvFAG+/xkkBHyg3xJWG8/3it5voa5b0fm0C7D8Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZewdOBmXK7DR1CkcAdtGNUVi+SYevs8Ssnny+H5+5sRYfdHvz0mPQryTIxx3O1DNLnOJMkZz/kpHXqZupg1QfnzS5cjmEpYs3x5kkKUpxPF4JR2oYQCK+xktmxOtM/wRRLhkqYVJABOaU7OWLUsmRjyYENN9B2fInuSJ+/+FVSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APywXEdj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APywXEdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787122485; x=1818658485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q+AJvFAG+/xkkBHyg3xJWG8/3it5voa5b0fm0C7D8Ak=;
  b=APywXEdjQdS+dxh4oYXk3PT6rWvZzyYYfAGQtWOxxWc3OHvKHvJN2MGr
   SQTmEPw3XE4ZMaCerrQTLA02pE2dyNhD6zsZnkYdeZeDeo6SFhEkjiL7v
   YWbjc3xzh2bu1s3bPJ4AJ9W9Mlqk+CLhGCgHibARHXnYimC/asG3PWbsH
   MGDKLOfCR6mRGJZiZ4GafKdkv2Faoq0hMoMl+8hR+n+DDT9C9ip1sr69l
   19fpIPY07Lxx6DkRFbGsmUyh/1cm1v/jvOFFWGpVLyol7VDyIPOG36OrE
   7KrovqTIRxd/t2nUyYwUgqybN7b5y1NZKB4Nh1YrHmRHf9wUXU6NuNdZV
   g==;
X-CSE-ConnectionGUID: 4E/xFw23QdiP4Yr1DwSY4g==
X-CSE-MsgGUID: eYpX65vrQ0GCpp7XRQsJ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87388080"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87388080"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:54:45 -0700
X-CSE-ConnectionGUID: XN0jsZgRSkCsWdGnVa/s6A==
X-CSE-MsgGUID: x54ODAAPRFaJuey3LB3gog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269295939"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 23:54:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwaC4-00000000exM-10Vf;
	Wed, 19 Aug 2026 06:54:36 +0000
Date: Wed, 19 Aug 2026 14:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v1 9/12] kernel/locking/lockdep.c:63:1:
 sparse: sparse: symbol 'lockdep_pool_key' was not declared. Should it be
 static?
Message-ID: <202608191652.G5GTllPZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v1
head:   cf5ab0bf7d3855a2dc795f25265b8f9f5ae0d324
commit: 844a7f0daad9f0422b8f7abe29d02b994b66d72b [9/12] locking/lockdep: Fallback to folio_pool in alloc_list_entry when static pool is full
config: openrisc-randconfig-r133-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191652.G5GTllPZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191652.G5GTllPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191652.G5GTllPZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/lockdep.c:63:1: sparse: sparse: symbol 'lockdep_pool_key' was not declared. Should it be static?
   kernel/locking/lockdep.c:3440:49: sparse: sparse: cast truncates bits from constant value (50000 becomes 0)
   kernel/locking/lockdep.c:3440:49: sparse: sparse: cast truncates bits from constant value (50000 becomes 0)

vim +/lockdep_pool_key +63 kernel/locking/lockdep.c

    62	
  > 63	DEFINE_STATIC_KEY_TRUE(lockdep_pool_key);
    64	static struct folio_pool lockdep_pool =
    65		FOLIO_POOL_INIT_KEY(lockdep_pool, sizeof(struct lock_list),
    66				    FOLIO_POOL_64K_ORDER, &lockdep_pool_key);
    67	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
