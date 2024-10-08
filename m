Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D084D1F9A9F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728408423; cv=none; b=RJmXmp6JHm5gbyMuBtKH+0ziJFV8pEYxjDrIqlCgy2fox83QF3XBlkQBsQ036qApSH5LGlUMt1AFBdxTFmDJvN8lmTlHzK7LQWhiOsHI4MrP1dlDh7ifUVPAHBxcTEAWML1jurKQx86zskNyjkjBp6GpcznV7QFF+PXvM6rTa1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728408423; c=relaxed/simple;
	bh=jOeiETgyw2wSGtluFXbFwzFII5N9rHRIH7iiaCDKGQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rfF4Qzty6Vxh23oqqHjhl2lVqvYXVEeoxsZdMNiWw5OCVMGKI/0W/xV/78Z1n/LYQSp5gw0eGWRkNdmfh51lJIJvDq12Miczc+W6U4r5LZPLw3cxmQaLlC5m06CuLO4/T6FyHOqba79HClocnRvqlRGPWXoAnsLG2Cumgx3rq4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ubc8NOTe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ubc8NOTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728408421; x=1759944421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jOeiETgyw2wSGtluFXbFwzFII5N9rHRIH7iiaCDKGQU=;
  b=Ubc8NOTe9ZI42BOl+GiOy7gG/x4UbBBPksQ6sJOMvNa8YgAm786gNYNZ
   Ys3p9VAA5++QGPN326NGAIhaUQ/xTmhW3okcjrJdxNFfvnGu5aUuJp5Hc
   UK7EokvNqoDNgnjkVkujZI3Ia5lozUWK054CkZr9njEHTPZ7uvkKdnKqh
   fIoKIwdpcKiNfY4XRTVk9aSxFZ1IZwcsMcCdUCBEmaw6IRy+BXJoVV4Yf
   Pbc11QQzYfmrKQomots7A6XeV1UgKQb912kZ5BEHB5DgTOUCgCpxlIRAN
   JRCgIeQtsy+6PoFsGsol5e/hQmIOSrjBhqnhFCvmTLGoKz0eWjscYmzBw
   g==;
X-CSE-ConnectionGUID: iq+0Pu8JRhqwb3vS5LZ5/g==
X-CSE-MsgGUID: /IxIJbVqRoCNi8D9c09beA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27508265"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27508265"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 10:27:01 -0700
X-CSE-ConnectionGUID: fGc+nx/JSEuAsA0PvMkjsw==
X-CSE-MsgGUID: ccbqhkETQNOOdBBZ5GV0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="99264394"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Oct 2024 10:27:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syDz8-0008C0-1W;
	Tue, 08 Oct 2024 17:26:58 +0000
Date: Wed, 9 Oct 2024 01:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next_wrap 4/9] include/linux/cpumask.h:290:74: error:
 'n' undeclared
Message-ID: <202410090117.i1B0R5W5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next_wrap
head:   cd9cf48999c063af9112b67b7ba6a8e4de3a6397
commit: 154672762d63148534b3de1b42f1fb807e286f0c [4/9] cpumask: temp cpumask_next_wrap__
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241009/202410090117.i1B0R5W5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090117.i1B0R5W5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090117.i1B0R5W5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/cpumask.h: In function 'cpumask_next_wrap__':
>> include/linux/cpumask.h:290:74: error: 'n' undeclared (first use in this function)
     290 |         return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
         |                                                                          ^
   include/linux/cpumask.h:290:74: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/n +290 include/linux/cpumask.h

   286	
   287	static __always_inline
   288	unsigned int cpumask_next_wrap__(int start, const struct cpumask *src)
   289	{
 > 290		return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
