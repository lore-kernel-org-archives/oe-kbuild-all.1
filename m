Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF81754B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 05:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753161133; cv=none; b=VOs0mGWT9TtAhRSelxSCUGkLEz39a9rLq1sa5deGm+qzjtZYG/JBUH4qSnbPmMWzimW9Yv021Difcf8drlaxUbX+KQMsXLDX43XNJYiyX/LFNXkE/k80H3nwtsKqhNQRpTEAoHbBIi7ez51wnX+8Fa2fotJnGyxpiYz8tuEJKvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753161133; c=relaxed/simple;
	bh=8xaFiM6JrdeVcCIzALhDcRwTycCoUDXhCLgRF0vXgis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C224Ba0qkeKjUdP8203Y6CculjoC3qC0jN6W761FJ7GCaqAnRHnod7wRvCZo+oFb+RBvi/C0P+TjLn2K6Olf/H1NX3tjVOBklNfgzrl6HFYWf2nS2T5JzWQW/KiU7smIlVAJgJ3XOW5xEQk/czqgZjcOu4IjPL1Q/3eRI0grW5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I77f9k73; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I77f9k73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753161132; x=1784697132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8xaFiM6JrdeVcCIzALhDcRwTycCoUDXhCLgRF0vXgis=;
  b=I77f9k738YrmUoKqdkrzTisPQHdfHjmPhJuW1NKQRk9wQH4Mi8M2JWWZ
   hUKrpambpjkZgzqwaPeSG92wBm8mKugQ0P0xKtd6eeDJNk6qff8swhyRA
   H0LxQ0SPz+4iv0pY4+hjKkitwRZD2UTIsvXvZfofhrbb8XPKL2h0gIylu
   I1OzXIj6p/OJY0Amc06D12vt/Q/sVoDx8kzeM28h8P8xdTT7eGW9MDlY7
   scYNXVTiWJIk9QoL0cH1y6rl7lJ7qDAUz07GqppK6QT/FuCFcGK8l5K9n
   SK+oOEa+I9Khde8OSBhl9UUAGm3bFW/xJZkoOTMPSRL8Lq3KPaH9ICeSA
   Q==;
X-CSE-ConnectionGUID: H5qR8AHYTS63BqXujDYgQQ==
X-CSE-MsgGUID: BAlpxBh9TvWxWRwmSQsqyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59054323"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="59054323"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 22:12:11 -0700
X-CSE-ConnectionGUID: AzNTS/19SvOmZlCaa/DFmQ==
X-CSE-MsgGUID: pIQEdWlnTDyr6pbFrgtzlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="163320118"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2025 22:12:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue5IN-000HSx-0p;
	Tue, 22 Jul 2025 05:12:07 +0000
Date: Tue, 22 Jul 2025 13:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 34/34] mm/ksm.c:146: warning: Function
 parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'
Message-ID: <202507221259.LAbTGZsC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guixin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c51bc02ec5b3728140f3a1cd74cf21c8566be5c
commit: 6213df05e6a41c4359febd123367d169fd284683 [34/34] anolis: kabi: reserve some space for kABI
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250722/202507221259.LAbTGZsC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221259.LAbTGZsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221259.LAbTGZsC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ksm.c:146: warning: Function parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'


vim +146 mm/ksm.c

31dbd01f314364b Izik Eidus   2009-09-21  128  
31dbd01f314364b Izik Eidus   2009-09-21  129  /**
31dbd01f314364b Izik Eidus   2009-09-21  130   * struct ksm_scan - cursor for scanning
31dbd01f314364b Izik Eidus   2009-09-21  131   * @mm_slot: the current mm_slot we are scanning
31dbd01f314364b Izik Eidus   2009-09-21  132   * @address: the next address inside that to be scanned
6514d511dbe5a77 Hugh Dickins 2009-12-14  133   * @rmap_list: link to the next rmap to be scanned in the rmap_list
31dbd01f314364b Izik Eidus   2009-09-21  134   * @seqnr: count of completed full scans (needed when removing unstable node)
31dbd01f314364b Izik Eidus   2009-09-21  135   *
31dbd01f314364b Izik Eidus   2009-09-21  136   * There is only the one ksm_scan instance of this cursor structure.
31dbd01f314364b Izik Eidus   2009-09-21  137   */
31dbd01f314364b Izik Eidus   2009-09-21  138  struct ksm_scan {
21fbd59136e0773 Qi Zheng     2022-08-31  139  	struct ksm_mm_slot *mm_slot;
31dbd01f314364b Izik Eidus   2009-09-21  140  	unsigned long address;
21fbd59136e0773 Qi Zheng     2022-08-31  141  	struct ksm_rmap_item **rmap_list;
31dbd01f314364b Izik Eidus   2009-09-21  142  	unsigned long seqnr;
6213df05e6a41c4 Guixin Liu   2024-08-26  143  
6213df05e6a41c4 Guixin Liu   2024-08-26  144  	CK_KABI_RESERVE(1)
6213df05e6a41c4 Guixin Liu   2024-08-26  145  	CK_KABI_RESERVE(2)
31dbd01f314364b Izik Eidus   2009-09-21 @146  };
31dbd01f314364b Izik Eidus   2009-09-21  147  

:::::: The code at line 146 was first introduced by commit
:::::: 31dbd01f314364b70c2e026a5793a29a4da8a9dc ksm: Kernel SamePage Merging

:::::: TO: Izik Eidus <ieidus@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
