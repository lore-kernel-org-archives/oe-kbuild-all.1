Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DEE2AE90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 21:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766697616; cv=none; b=tLA5oETb6jrxQ95IS/9YkIuGJzMFkWv7HBNAS8ulRoBbSnFmlyb44ZOvzqTZBHLoacF/wNYwBfAyjAd+NXKLbT3zI2wW/et7VrB786r06sR2xW2HDgDB7hTURL4zu1dwRyMdqRa3crh9FRRWWYdzZ0cGE6zlmnVX/vmtDcH13VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766697616; c=relaxed/simple;
	bh=XaLM7os6e5UXE+tpZnDkhWR1TqzpCT/i5KWbI59rm8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TZTXfwlPF/Xdh8tfhbdMGlqCvwHmMLAd1fyREUwt84eJ/Sx7oaj737MNaeD10qkednxyiNtu6n9UCN4LDyPbBtburN98R58SH8bN7VooYv3NQNM6ivMJ64tKxVqKB4WBQhs580IZA3oSJR2PzLqB8CzqjxRxTWK2CQkSzhq1juE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+6qBbcD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+6qBbcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766697614; x=1798233614;
  h=date:from:to:cc:subject:message-id;
  bh=XaLM7os6e5UXE+tpZnDkhWR1TqzpCT/i5KWbI59rm8s=;
  b=Q+6qBbcDdcqUD8HN5kCtLogu0Eea/sYlaiq3PsiXLEu1cBXdLVOiwoNh
   Uj/8Bf/Bx0EKFj4lJGKIZD00XLZF2QC+YC1TIoxTtuRycthfa+bdBHJ8P
   ctPbYYm97bcWRgPufRy0qnE8odkca05QG6n9t+1aHoegDdnx0Zkb+qx+q
   /JPOgRj8vD+FdOJtQb/n427NGVQzSQ7V50Yg9stXN9kIxClLfVgUFq7D+
   0BYQIV0pDHwhgDSRQnwFPdBLHArRVL58Z39gniA0W+WgaWgGqAJFdP/AH
   pniz5UqtSxZ2BfyE/lZPjIuWmnkayJDIkug41B5IC/2HUu4UFbZAOkPPd
   Q==;
X-CSE-ConnectionGUID: eJQDpKM3Tj+oFRPvJMHdDw==
X-CSE-MsgGUID: 9SKguXDuQ/a7dhnazkLP2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68555810"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68555810"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 13:20:14 -0800
X-CSE-ConnectionGUID: 5kqHLiiYSoCwfFkG7l7pog==
X-CSE-MsgGUID: J8krOrRnTOmqkU33RcSirQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200759224"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Dec 2025 13:20:13 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYske-000000004TB-1Te3;
	Thu, 25 Dec 2025 21:20:06 +0000
Date: Fri, 26 Dec 2025 05:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Finn Thain <fthain@linux-m68k.org>
Subject: [akpm-mm:mm-nonmm-unstable 71/99]
 include/linux/instrumented.h:86:(.text.efi_stub_common+0x198): undefined
 reference to `warn_slowpath_fmt'
Message-ID: <202512260552.mJWvYIYi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   c40f0b9f72a08d208c7793090ae98faaf6a58719
commit: 472d1f40d1f7db592e9fef39a813c7e8cf95359d [71/99] atomic: add alignment check to instrumented atomic operations
config: arm-randconfig-r072-20251225 (https://download.01.org/0day-ci/archive/20251226/202512260552.mJWvYIYi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260552.mJWvYIYi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260552.mJWvYIYi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: warning: orphan section `.data..once' from `drivers/firmware/efi/libstub/efi-stub.stub.o' being placed in section `.data..once'
   arm-linux-gnueabi-ld: error: zImage file size is incorrect
   arm-linux-gnueabi-ld: drivers/firmware/efi/libstub/efi-stub.stub.o: in function `instrument_atomic_write':
>> include/linux/instrumented.h:86:(.text.efi_stub_common+0x198): undefined reference to `warn_slowpath_fmt'
   arm-linux-gnueabi-ld: arch/arm/boot/compressed/vmlinux: hidden symbol `warn_slowpath_fmt' isn't defined
   arm-linux-gnueabi-ld: final link failed: bad value


vim +86 include/linux/instrumented.h

    73	
    74	/**
    75	 * instrument_atomic_write - instrument atomic write access
    76	 * @v: address of access
    77	 * @size: size of access
    78	 *
    79	 * Instrument an atomic write access. The instrumentation should be inserted
    80	 * before the actual write happens.
    81	 */
    82	static __always_inline void instrument_atomic_write(const volatile void *v, size_t size)
    83	{
    84		kasan_check_write(v, size);
    85		kcsan_check_atomic_write(v, size);
  > 86		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1)));
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
