Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901AF3FE5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 03:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754622079; cv=none; b=cmQz88H7hGvrAjBLRZySbT3rC6Z++mBR3TsFQ4KlZhPmG5D7xn8FUMJ+Hx/swhwTmEUhXFDve53wKRgFfnUxCpBlrPhXm5hRjUOQaIDZ6ktcgtgO6/FduDlbOt2OfHHLj0h8ZAvjqfZOEPd5gISyppW6HQ54okT6seEn0KDBORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754622079; c=relaxed/simple;
	bh=b60/CoOL//mj++mvID67AOHok8MDp5SiHTET4znBFlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZvlKxFaeOYeMTArTD5EzK94eXh84PM2VE6NB+xusqMeMqAOtu/eLfl+ifSn7icJLNuGBgQ1/UCZaBE3+w5a9NkCBVscToIiytuBPA1RSE77RacpMvCzGK7JshkeYUc2vma8P18GiinYRf+LdF5VLoVbPxx2RT9wgySMlbVa1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kY34jfYL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kY34jfYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754622077; x=1786158077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b60/CoOL//mj++mvID67AOHok8MDp5SiHTET4znBFlQ=;
  b=kY34jfYLCSAsV19u7AgnBez/2r1wJqbyDPKvYntPpC2qswui8XoFXEbv
   v5qpyvHyUYgFLTtsYRyLyCgKlGAdVtLkm/+PMvgwEP7CqsbH6XXnaXRph
   1BYcrmnp6X+Ys8ildwAXlEZu078uoOcbSsKh502vRarhcei5wP3p4MpnX
   wI/qOlBjbv4mBqHJtIx/FP9AHzb8Yv+apnSXrxat2fEpO3Rppunn7wPzF
   QQ5xP+q4ki9NvJSdGuqc9NSIJ1DKMp+jsrgUYhrB9QLzDPgwTfPM10lEc
   AWTni8CjCb0WD4yJtjrdAWLijWHRm5mGI4f2GJOyyUhLefS3J8AWYYnby
   w==;
X-CSE-ConnectionGUID: yCA7cvBiQfm5hF93P4Azig==
X-CSE-MsgGUID: c9v+tbZgTZueCdype/ztMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74545073"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="74545073"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 20:01:16 -0700
X-CSE-ConnectionGUID: 8l5QFiXcS/iBs62m/c0nzw==
X-CSE-MsgGUID: BC6AixRRQHOEHG5ddz0DWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="170474024"
Received: from unknown (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2025 20:01:15 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukDM0-0002Zz-2x;
	Fri, 08 Aug 2025 03:01:12 +0000
Date: Fri, 8 Aug 2025 05:00:27 +0200
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [sj:mm-new 39/45]
 include/linux/atomic/atomic-arch-fallback.h:457:undefined reference to
 `kasan_flag_enabled'
Message-ID: <202508080510.f1wPsKSS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git mm-new
head:   b2a4beca30ba51331a16d7bb84387a70b692a66d
commit: 825af80daf827d439c7dd3e24ef5648cc338bc98 [39/45] mm/kasan: make kasan=on|off take effect for all three modes
config: alpha-randconfig-2003-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080510.f1wPsKSS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080510.f1wPsKSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080510.f1wPsKSS-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: mm/mempool.o: in function `raw_atomic_read':
>> include/linux/atomic/atomic-arch-fallback.h:457:(.text+0x544): undefined reference to `kasan_flag_enabled'
>> alpha-linux-ld: include/linux/atomic/atomic-arch-fallback.h:457:(.text+0x9a8): undefined reference to `kasan_flag_enabled'


vim +457 include/linux/atomic/atomic-arch-fallback.h

e01cc1e8c2ad73 Uros Bizjak  2023-09-25  443  
ad8110706f3811 Mark Rutland 2023-06-05  444  /**
ad8110706f3811 Mark Rutland 2023-06-05  445   * raw_atomic_read() - atomic load with relaxed ordering
ad8110706f3811 Mark Rutland 2023-06-05  446   * @v: pointer to atomic_t
ad8110706f3811 Mark Rutland 2023-06-05  447   *
ad8110706f3811 Mark Rutland 2023-06-05  448   * Atomically loads the value of @v with relaxed ordering.
ad8110706f3811 Mark Rutland 2023-06-05  449   *
ad8110706f3811 Mark Rutland 2023-06-05  450   * Safe to use in noinstr code; prefer atomic_read() elsewhere.
ad8110706f3811 Mark Rutland 2023-06-05  451   *
ad8110706f3811 Mark Rutland 2023-06-05  452   * Return: The value loaded from @v.
ad8110706f3811 Mark Rutland 2023-06-05  453   */
1d78814d41701c Mark Rutland 2023-06-05  454  static __always_inline int
1d78814d41701c Mark Rutland 2023-06-05  455  raw_atomic_read(const atomic_t *v)
1d78814d41701c Mark Rutland 2023-06-05  456  {
1d78814d41701c Mark Rutland 2023-06-05 @457  	return arch_atomic_read(v);
1d78814d41701c Mark Rutland 2023-06-05  458  }
9257959a6e5b4f Mark Rutland 2023-06-05  459  

:::::: The code at line 457 was first introduced by commit
:::::: 1d78814d41701c216e28fcf2656526146dec4a1a locking/atomic: scripts: simplify raw_atomic*() definitions

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
