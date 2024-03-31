Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D5EEC0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711884329; cv=none; b=czBE9I6AFFDLReM7ucG4Rk5cB4gHrJj8kis2UOkeOUyL3u3i6aUs3poWaVtZuzHq2DbDE9m4fbxyZl1QiNALzoOPMcpulememe23evlqhPn1Lyqaf1RStz6PMOnkwqDKOG6l/0zis2PB3dlBevb5YbM2Xk1KjRox0j0YEx3mQ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711884329; c=relaxed/simple;
	bh=zS208rdhRzNP+fbN8CFhPpv10VUZIuhn4np5txZPrF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDSXNWm3n+/y/EkTI9B0+sHdFmRBJsnTIMLvdm4WyWgHCh79ngc61TYP1M3mkSgbWI6MBjivIaccjkHAhz0a1R/YTaundE+W6WHXUZLrUA1VtxokZNvdix+gEoCzqQsk9SxZgREvyJZY68jd4oD4q7GsYOT6M77EZKvH10gD1MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifsAxbAQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifsAxbAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711884327; x=1743420327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zS208rdhRzNP+fbN8CFhPpv10VUZIuhn4np5txZPrF4=;
  b=ifsAxbAQ1Ul5AzEpIkdij7iZDXMqqv6rWe9QU7JFlYrHg6ngYytUuJ7d
   in/VMk5our7LZntr/j4Y5IU+QohmrRSd20ZEBU3leTBBnC/b0snnxoYyq
   PeplzXTqsB9R4/GGZq4tgGuF9g4K1aguGiF16mmt8YrLE7iqvQpyY+z/N
   JDpIZfBTI/NCswDr3VFe2IzOpkGZZm/gpGx9TnYG7tOF++rz5BZAsUClh
   XMO1gKFDbRUCmt8GWAQOg/erFdRKkn4wGZhT6VvWSEJvp+CSPGTU4+JyA
   eFCgV9njQ1Q3dhXvzyu2OikKmkzuHHPsWhLE68WqFCIRgqGU36zAJV/o8
   g==;
X-CSE-ConnectionGUID: qH1t8LW+QY6Ds2V4z9qvnQ==
X-CSE-MsgGUID: 57UWpUxPTq2pzJjSzv4BuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="6855255"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="6855255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 04:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17484265"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2024 04:25:25 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqtJS-00013m-1Z;
	Sun, 31 Mar 2024 11:25:22 +0000
Date: Sun, 31 Mar 2024 19:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [akpm-mm:mm-unstable 262/270] (.text+0x2478): multiple definition of
 `mt_find_alloc_memory_type'; kernel/sched/fair.o:(.text+0x1728): first
 defined here
Message-ID: <202403311935.bPW1CSZk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   0cef2c0a2a356137b170c3cb46cb9c1dd2ca3e6b
commit: 57fc2afac84efdb0968e028382023a937bb4d6a0 [262/270] memory tier: dax/kmem: introduce an abstract layer for finding, allocating, and putting memory types
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240331/202403311935.bPW1CSZk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311935.bPW1CSZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311935.bPW1CSZk-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: mm/vmscan.o: in function `mt_find_alloc_memory_type':
>> (.text+0x2478): multiple definition of `mt_find_alloc_memory_type'; kernel/sched/fair.o:(.text+0x1728): first defined here
   hppa-linux-ld: mm/vmscan.o: in function `mt_put_memory_types':
>> (.text+0x2480): multiple definition of `mt_put_memory_types'; kernel/sched/fair.o:(.text+0x1730): first defined here
   hppa-linux-ld: mm/memory.o: in function `mt_find_alloc_memory_type':
   (.text+0x13f8): multiple definition of `mt_find_alloc_memory_type'; kernel/sched/fair.o:(.text+0x1728): first defined here
   hppa-linux-ld: mm/memory.o: in function `mt_put_memory_types':
   (.text+0x1400): multiple definition of `mt_put_memory_types'; kernel/sched/fair.o:(.text+0x1730): first defined here
   hppa-linux-ld: mm/mprotect.o: in function `mt_find_alloc_memory_type':
   (.text+0x0): multiple definition of `mt_find_alloc_memory_type'; kernel/sched/fair.o:(.text+0x1728): first defined here
   hppa-linux-ld: mm/mprotect.o: in function `mt_put_memory_types':
   (.text+0x8): multiple definition of `mt_put_memory_types'; kernel/sched/fair.o:(.text+0x1730): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
