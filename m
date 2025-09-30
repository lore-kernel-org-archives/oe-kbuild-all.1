Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EDD22F74E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 03:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759203051; cv=none; b=d0kRXLgzJPME8h+CSXxbkA2HYVl52inlhDk9awG4tAUOmcsTYDDzfLFMmHsmuc8tJ0raLLWrUTrCkw8EoJYjNQziOMB+8Hku0G7z4V7EcYtN9kfT5d0Gvx83a3wNZvaceIqe2RdqAvdbHSG+V0T3bbH7zJO/zVI8OfzxgrA2eig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759203051; c=relaxed/simple;
	bh=sfnFfzh1lqtVrUauuHqu5o8JdnJ2d3xueBBp24Hsa6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VprOY6WjStsXRG4miIfIiRG5ZKBKS0x5SBDqWCgELZOC89gos+ITHw3H0SsswtnvRPVsI8GF6oq8pi8c2pKSIf1fVbkCLV5ic7lByQJtFIzwZ/lXC9AvpAXrr18leNiHD0hAJPnMJ5Lvf4uccLfQkneHAh8KXOgqW5+vBN6WVgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6nlmW+P; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6nlmW+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759203049; x=1790739049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sfnFfzh1lqtVrUauuHqu5o8JdnJ2d3xueBBp24Hsa6g=;
  b=J6nlmW+PARU369BR0n3AUHhqIRQncHdVOpGGRBb79Xn9Irye2vI0HKzg
   er81JWbj5SO8ztGidtppuj/+/xYPEF4npvZTHK8ycGTYakCrOz5UxBGTo
   PuGPJq3jgC9hhJ5H63Gv+H8+pfn/eqGs57PKvtvn8fyba4dyedCcJQtoY
   Gz+0K24uMUpKU+tOC1oCg4+1HF0dKHCnifWNci/8pKp2fWcwLdjG+Yr0s
   5ptrBBADRnjvlgDrBvSptWSyXrmrfCiLNwWIixxgh5kkWJYZ8iIORhWfJ
   oIRQTeu0IjJsR+OYGD/C71Lk23mcyK4B1WbYb42qideDSW3KyZu2QBSJP
   A==;
X-CSE-ConnectionGUID: P+dM6Z2qThGX2mRhBcFlDQ==
X-CSE-MsgGUID: BqSNOcnqR7Ozxjh/zPkMgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="86894026"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="86894026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 20:30:49 -0700
X-CSE-ConnectionGUID: hzeahOWlQcetqRBWrKuCRA==
X-CSE-MsgGUID: J6aThbiZST+lYR6ThZ7CDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="178200534"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Sep 2025 20:30:48 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3R4f-0000sZ-28;
	Tue, 30 Sep 2025 03:30:45 +0000
Date: Tue, 30 Sep 2025 11:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 45/45] mm/ksm.c:146: warning: Function
 parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'
Message-ID: <202509301106.2QPzJ8vS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   aa75e6da3895e56cacebbe71d2df72767d3e89e0
commit: ef314e56b70f4662163f3e1e094bcfa9627674c5 [45/45] anolis: kabi: reserve some space for kABI
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250930/202509301106.2QPzJ8vS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301106.2QPzJ8vS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301106.2QPzJ8vS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ksm.c:146: warning: Function parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'


vim +146 mm/ksm.c

31dbd01f314364 Izik Eidus   2009-09-21  128  
31dbd01f314364 Izik Eidus   2009-09-21  129  /**
31dbd01f314364 Izik Eidus   2009-09-21  130   * struct ksm_scan - cursor for scanning
31dbd01f314364 Izik Eidus   2009-09-21  131   * @mm_slot: the current mm_slot we are scanning
31dbd01f314364 Izik Eidus   2009-09-21  132   * @address: the next address inside that to be scanned
6514d511dbe5a7 Hugh Dickins 2009-12-14  133   * @rmap_list: link to the next rmap to be scanned in the rmap_list
31dbd01f314364 Izik Eidus   2009-09-21  134   * @seqnr: count of completed full scans (needed when removing unstable node)
31dbd01f314364 Izik Eidus   2009-09-21  135   *
31dbd01f314364 Izik Eidus   2009-09-21  136   * There is only the one ksm_scan instance of this cursor structure.
31dbd01f314364 Izik Eidus   2009-09-21  137   */
31dbd01f314364 Izik Eidus   2009-09-21  138  struct ksm_scan {
21fbd59136e077 Qi Zheng     2022-08-31  139  	struct ksm_mm_slot *mm_slot;
31dbd01f314364 Izik Eidus   2009-09-21  140  	unsigned long address;
21fbd59136e077 Qi Zheng     2022-08-31  141  	struct ksm_rmap_item **rmap_list;
31dbd01f314364 Izik Eidus   2009-09-21  142  	unsigned long seqnr;
ef314e56b70f46 Guixin Liu   2024-08-26  143  
ef314e56b70f46 Guixin Liu   2024-08-26  144  	CK_KABI_RESERVE(1)
ef314e56b70f46 Guixin Liu   2024-08-26  145  	CK_KABI_RESERVE(2)
31dbd01f314364 Izik Eidus   2009-09-21 @146  };
31dbd01f314364 Izik Eidus   2009-09-21  147  

:::::: The code at line 146 was first introduced by commit
:::::: 31dbd01f314364b70c2e026a5793a29a4da8a9dc ksm: Kernel SamePage Merging

:::::: TO: Izik Eidus <ieidus@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
