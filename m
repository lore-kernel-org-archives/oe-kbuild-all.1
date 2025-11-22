Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7D4199237
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763778014; cv=none; b=ngkHpDmw4nXf9hVle69D0L6qMR1d/awf5U31JzGR05RX1zkzd0FqfmRjzvGCdCfh6bLCwePzKxa2fSXBeuuQC42e/7vg7TFLjkI++8QMPFqWEVibxPejSIfr1Im3hDOz7s0eonAv0043S01kSRGRpfw/arCppwMqvBmxfLOjMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763778014; c=relaxed/simple;
	bh=418ibr1/jPIjCjqPUEEOY6GZJspF9/65bDljY+HkDgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7s5f746Jvzpk8bDe/PkzFBVzDXdU4PVFWw8IfwSCZFKNj6Dzs7SSeFmmitE+VUTk+FH8+DU6LCvXiNXHMIjf9zba/ujsUGHm867dz0Skc/Unquf2zQLhVeg4yty/BKOXnyzI4dX5G8zc/kVc25NZO3qXwwJkagnThN8T0xscR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAFqRLHN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAFqRLHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763778013; x=1795314013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=418ibr1/jPIjCjqPUEEOY6GZJspF9/65bDljY+HkDgs=;
  b=lAFqRLHNT2H+NPLUNeJFuYNqHcuzj1eAkaxwOOxFzI+EOfhbCwexSOAp
   zjBHHQ05nbUNnk6/20iUOs2iD9TKkGqoBzN4DFiwpOR+M1vCqkJkw5TQ3
   59d7/B1v/10F5xdZ4+WbM7mLq4HOg5oOl0pGfn+fK4XyryGDbEohWOpnv
   mNWw0unFQ78yjzGMUUK5bOyMEsuNO8y1nrCMwuwXPjjMHhfCO2tmTaNuQ
   Cs4goqgdUMOlHFkE3W00OQnlUS5wonUJE0wdZJIoOZ8DAUDW4UW145Sjl
   a48MeNkI3xowzZ1kuFqEWy+b7IPR4wGX+xjGoCAsZ7oFJposkjeCgRN7U
   g==;
X-CSE-ConnectionGUID: xxoni+SBRi6AQrSNMmnHBQ==
X-CSE-MsgGUID: Bt69+HvGTuy0K+LnxoeSFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="88526476"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="88526476"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 18:20:13 -0800
X-CSE-ConnectionGUID: dahtqrFsQaqhhRkVe4LI1A==
X-CSE-MsgGUID: /XZ/P9oQTcKDCI7iaBkiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="191139038"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2025 18:20:11 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMdEP-00074Z-05;
	Sat, 22 Nov 2025 02:20:09 +0000
Date: Sat, 22 Nov 2025 10:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3304/3304] mm/kasan/shadow.c:90:(.text+0x590):
 relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol
 `__memcpy_mc'
Message-ID: <202511221034.dymjxfJa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7fe983da1977aac40da78a43010d0612ff5c0bb1
commit: b991780c836ceb9a479c6c6e385e914b487e353a [3304/3304] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-003-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221034.dymjxfJa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221034.dymjxfJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221034.dymjxfJa-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
   mm/kasan/shadow.c:90: undefined reference to `__memcpy_mc'
>> mm/kasan/shadow.c:90:(.text+0x590): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__memcpy_mc'


vim +90 mm/kasan/shadow.c

    81	
    82	#ifdef __HAVE_ARCH_MEMCPY_MC
    83	#undef memcpy_mc
    84	int memcpy_mc(void *dest, const void *src, size_t len)
    85	{
    86		if (!kasan_check_range(src, len, false, _RET_IP_) ||
    87		    !kasan_check_range(dest, len, true, _RET_IP_))
    88			return (int)len;
    89	
  > 90		return __memcpy_mc(dest, src, len);
    91	}
    92	#endif
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
