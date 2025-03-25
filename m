Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D2216F282
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 03:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742871701; cv=none; b=FusK1fbJYW9qkqN1c+d70RD+2otLwUM+b+cSkI2mEQoefRPgF5LcxmZuSiGJYYcuNg0EjpkCeExxDti4aRayFSfcj+UbMmXiwMcs6N+29+V+ek7Ir8ueuLQ9h1BUy0r3WF/noMdtJ5kwTsVRPz8Amp749TaX4Lxyd0v/SvhoE6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742871701; c=relaxed/simple;
	bh=r3/uMxXwFYzsd6OeCBdVG+MBXFCpFSbHMlEBVo5rcEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Asa7yYq5z8L0DA1q7GlI8TdENDJW14/4APT769hFiiPVSgXMXUvb3RC/yVlhka5Qf7SZaEzU8C1vM3wdc6akw2/hW7ebDMh53z+NjVQH/lw9j4NHBOJr/myY7cdt/lV9iDo4hh/ZzNxbVSqgUEuJTf3GXg8k88C8tc/tbcQ/dEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBA0a5Lo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBA0a5Lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742871700; x=1774407700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r3/uMxXwFYzsd6OeCBdVG+MBXFCpFSbHMlEBVo5rcEo=;
  b=HBA0a5LotyT7BFlxiYt4AKDlcDEnYfKwLuxvN9w6QXPQhgYBp5kYA40z
   095FoackHR4JLUZdH89WQ46rG/WqjQcTuHk3OFJh1kCyQ3c9izVcCJvvR
   ZciU8V3IqrbRp3stPkFQf3xQI+65YoklxkHvpOmI0LUjqA9cX/1g6ZHTA
   ITuaZ0WQJ2NX+JGQhzi+xLAYoXbHZO5mCVJwqSFf33+ExNR20O2061Rq5
   Igp2Mt8a8qOF5JaArxYdVD2YzgmI8RHYrGkswpd3r0lIlAFUTa5eoqFLL
   8MJKi0n+KlX9q/VeG4PUzMk/bltiveapD0VvHVw0vcGp5+sIqf/Oaxchm
   g==;
X-CSE-ConnectionGUID: FeZ4q4EMSiytqunfkFXT6Q==
X-CSE-MsgGUID: X/JYvO4HTdi8IykQfeMwUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43258865"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="43258865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 20:01:39 -0700
X-CSE-ConnectionGUID: NyIwBxwQSP2Zrw8H9lvWYQ==
X-CSE-MsgGUID: 9yG5UEOWQk6JJ3lgzS4I5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="129425226"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2025 20:01:37 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twuWq-00046H-2U;
	Tue, 25 Mar 2025 03:00:38 +0000
Date: Tue, 25 Mar 2025 10:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:fork_pat 1/1] include/linux/pgtable.h:1525:13:
 warning: 'untrack_pfn_copy' defined but not used
Message-ID: <202503251020.yoeEZfzv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux fork_pat
head:   4474ef40921c064454fd03245526fc80f373873e
commit: 4474ef40921c064454fd03245526fc80f373873e [1/1] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
config: arc-randconfig-001-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251020.yoeEZfzv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251020.yoeEZfzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251020.yoeEZfzv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:30,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/pgtable.h:1525:13: warning: 'untrack_pfn_copy' defined but not used [-Wunused-function]
    1525 | static void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
         |             ^~~~~~~~~~~~~~~~
--
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:125:35: warning: initialized field overwritten [-Woverride-init]
     125 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:125:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:126:35: warning: initialized field overwritten [-Woverride-init]
     126 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:126:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:127:35: warning: initialized field overwritten [-Woverride-init]
     127 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:127:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   In file included from include/linux/mm.h:30,
                    from include/linux/ring_buffer.h:5,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/time/hrtimer.c:30:
>> include/linux/pgtable.h:1525:13: warning: 'untrack_pfn_copy' defined but not used [-Wunused-function]
    1525 | static void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
         |             ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:30,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/pgtable.h:1525:13: warning: 'untrack_pfn_copy' defined but not used [-Wunused-function]
    1525 | static void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
         |             ^~~~~~~~~~~~~~~~


vim +/untrack_pfn_copy +1525 include/linux/pgtable.h

  1520	
  1521	/*
  1522	 * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
  1523	 * copy_page_range(), but after track_pfn_copy() was already called.
  1524	 */
> 1525	static void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
  1526	{
  1527	}
  1528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
