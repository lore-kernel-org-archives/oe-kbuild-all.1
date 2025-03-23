Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824A1C84D5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 02:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742695839; cv=none; b=a/QgoXw0MwUIJeLnWMnXjQlg04oMzyDMjTlsOOKCX8Ghao875vnX8LLHPLxl9CqpCqu9z5IRkgkmxt6k1I4W71AuZkej2vAgBMq8hmTBGrlH8nlQj9+W65ku/cJblXTN5qiavKcb4Mof1Gaw6PaR8jD6Dq0JVVGBe9J13Cv3iCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742695839; c=relaxed/simple;
	bh=Zv7zqFsziim21Gdrzf6i1T692arQjS+3ueEXTgAU/lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMaUk31k3FT2tM9G9uS9swcwNfkwjiwe+cSGdeFBj7IUeOzvTYBl2HY8fCAi9+fPBzbc0LALhsSjrIQTHk2jjJXqOubxX4pmdBeoG9EfiNloxLDdN3Pn5ikw9KmFiA89zVyh+QvjrIrLg87/dHtIJEQx3qMSIYNrby9PfBImwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVbTZq17; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVbTZq17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742695838; x=1774231838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zv7zqFsziim21Gdrzf6i1T692arQjS+3ueEXTgAU/lo=;
  b=aVbTZq17T+4nHdEAEJtXtQRYZe6NO1mIIiM6bqJC78miGhoHFe5yalPn
   quyTeRY0KRVXWsG/DcRC6ekWYRm0jOfMH9TwBdWHTGhioQZpUmaT5eoVJ
   gKGToLogUirq3W/i+WKcs/A7qZnTi1NY4t2mL+j1+Gesqe2Erqrb/NJqh
   0OyHkREtp/VpSNDRT1gPLZpgShZkIlKCCCU6v2wEx42wWnh/rEgOZDEnF
   oGllkrYBRpGPrg2hP0Lgsf4l1F/nK6JaG7o1gUxFM01wEgKsJpixJtwHt
   /9oBQvbzZ+vyH5/OK4LDbN0kpkxrJRnSi9X8k8gkBCZ0bMRrKGxDR3s0F
   w==;
X-CSE-ConnectionGUID: W7dJlBQTQ2u8Md7s6XtDDw==
X-CSE-MsgGUID: SmYFh1nGRpGTAFYFgYqvjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="44089263"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="44089263"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 19:10:37 -0700
X-CSE-ConnectionGUID: Y0pm/TKpQ+Glp2ZrJriwdQ==
X-CSE-MsgGUID: dyJQQRDrSFegl1QD8RlbSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="123530703"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Mar 2025 19:10:33 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twAnH-0002Wr-0p;
	Sun, 23 Mar 2025 02:10:31 +0000
Date: Sun, 23 Mar 2025 10:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Peng Zhang <zhangpeng362@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2051/2051] include/linux/userfaultfd_k.h:66:45:
 sparse: sparse: restricted uffd_flags_t degrades to integer
Message-ID: <202503231043.bCX9sPgT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6f6f173b2b8fa65e1ef7ebc6e43b0b02c2a52759
commit: 0214feb8f616acf62f9a6a2a131f0a1479b2b8af [2051/2051] mm/userswap: introduce UFFDIO_COPY_MODE_DIRECT_MAP
config: loongarch-randconfig-r131-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231043.bCX9sPgT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250323/202503231043.bCX9sPgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231043.bCX9sPgT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/userfaultfd.c:136:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - unexpected unlock
   mm/userfaultfd.c:243:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - unexpected unlock
   mm/userfaultfd.c:325:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - unexpected unlock
   mm/userfaultfd.c: note: in included file:
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode

vim +66 include/linux/userfaultfd_k.h

    63	
    64	static inline uffd_flags_t uffd_flags_set_mode(uffd_flags_t flags, enum mfill_atomic_mode mode)
    65	{
  > 66		if (IS_ENABLED(CONFIG_USERSWAP) && (flags & MFILL_ATOMIC_DIRECT_MAP) &&
  > 67		    uffd_flags_mode_is(mode, MFILL_ATOMIC_COPY))
    68			mode = MFILL_ATOMIC_DIRECT_MAP;
    69	
    70		flags &= ~MFILL_ATOMIC_MODE_MASK;
    71		return flags | ((__force uffd_flags_t) mode);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
