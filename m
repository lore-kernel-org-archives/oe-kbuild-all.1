Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE8363A9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728178358; cv=none; b=Rph5yJqKS1O5PMw8ANgD+rXoaw3DFC6CBrf3/Z23LzSf70auYzZINiZ2cFdRqRtaj7XnkTPClWtTYsKHlFOcotaUJIKS226GLg4r5hRxNoDnl1rb2iPwMEyorYRBgcGiHSnhi/lU8iAjpW9FJiecxvHEuGIvggepvUm3OW1Z9aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728178358; c=relaxed/simple;
	bh=FtsHAejsz34lsu2KaxHtaw055zCTZi2eMuFjEVD9kGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLPvIzxm4efcYMwuGJbw6fALbsWKNhDs0mvg6r96x0YzKeEwTQlKnr4/KxBlqUfV/tS7xh26KbO0rhQsbX1XU3CCc+FcR27FNMViVI6sfKv+qU9okTaYXy+O6GFmG10zrIUd22v2AOcZVaoc288MLfedqPAgnE1typr0j/YiW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFpR6Jsw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFpR6Jsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728178356; x=1759714356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FtsHAejsz34lsu2KaxHtaw055zCTZi2eMuFjEVD9kGE=;
  b=KFpR6Jswkbr3skvadm1iWjYOcwTwvryOPBIZi4OTtg+OCTLQVALPqfeL
   k3clvWg3Vw1RYDEDIdo0H3sxo6vAeuealRp8isQpdEc2OELc2dMw/li+w
   5L49LhFqFNSKIkmIBkiOdNblxmy04Ze224ASq1WrEl/RAQ8/CSPjTND/5
   DIBE7I3jqlOkPV+2YoaSFFNox79GSqKhD9kIuHTqp0I1cZ+T8jL8CcNJX
   5CaZfVoVc5VcCAeppVjTeqDlAqvdeZXc1Em5hUlVkLNoyT+mtyXQslWyF
   ZZDVSBmOUhkDqh6pHsLI4aYqdILDr01wHbVMJvqC2/ysctn2ZRkIj1i0Z
   Q==;
X-CSE-ConnectionGUID: 85zj129nSh2z467PZolwjA==
X-CSE-MsgGUID: OLM/AmylS7KK1EaBALjj7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="30244114"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="30244114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 18:32:35 -0700
X-CSE-ConnectionGUID: 1Bir+sKURGufntH5yG36RQ==
X-CSE-MsgGUID: DbR3ZxbnSneLVBpogbeI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="75223270"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Oct 2024 18:32:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxG8O-0003Vu-2M;
	Sun, 06 Oct 2024 01:32:32 +0000
Date: Sun, 6 Oct 2024 09:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next_wrap 4/9] include/linux/cpumask.h:291:13: error:
 'n' undeclared
Message-ID: <202410060923.qOrizdxY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next_wrap
head:   064db2e196607c2f2afa41380b0c9adf68a239d6
commit: fd224778f474e339cce1fe59438ee07f446a02d7 [4/9] cpumask: temp cpumask_next_wrap__
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241006/202410060923.qOrizdxY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060923.qOrizdxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060923.qOrizdxY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:2140,
                    from arch/openrisc/kernel/asm-offsets.c:23:
   include/linux/cpumask.h: In function 'cpumask_next_wrap__':
>> include/linux/cpumask.h:291:13: error: 'n' undeclared (first use in this function)
     291 |         if (n != -1)
         |             ^
   include/linux/cpumask.h:291:13: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:102: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/n +291 include/linux/cpumask.h

   286	
   287	static __always_inline
   288	unsigned int cpumask_next_wrap__(int start, const struct cpumask *src)
   289	{
   290		/* -1 is a legal arg here. */
 > 291		if (n != -1)
   292			cpumask_check(n);
   293		return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
