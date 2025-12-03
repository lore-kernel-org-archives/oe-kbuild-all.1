Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF1B23AB98
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 03:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764732192; cv=none; b=f8YTCU/gy6QcjQJ8ErzYn4Afx2ht7W1GIJ46wiFdiKaOf1z1Utpp7dqKmYyJIxuBzIDwxAG5sa3+5xrF0Wm348W1V6OMeswnaM3v0aF6dH4ZU6jtmUpwOQ8kJ12gLxNrZ5eMW1pQQGsPW4c8gofSntb7uuebCIVilhI9IN0uPl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764732192; c=relaxed/simple;
	bh=WtuT9D+Hb8x1Rjav9QT/aGnMFBP7NS3Nzv9LspCw7pA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFcMVei90Kx9O1Ve11UMiaJe0pAbzgyynMvEwuhvhFJ4/WVp4LVv2wbhuTBQ5XlO97YRyylNFToPQnaPy0Bl32Mo8WQiWeXxw7Wj8PmHVXZASppZgyaQK/tqARMzWLQ1QGNk+52TSC6ROC8vnk7RfNdSqK0+pcTd2a4txYCB6P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8NHgEjH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8NHgEjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764732190; x=1796268190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WtuT9D+Hb8x1Rjav9QT/aGnMFBP7NS3Nzv9LspCw7pA=;
  b=U8NHgEjHXnvobHf7lDVLI1XdykiJaMxFsznIQ9eflHTvebfQjb6Q1sEr
   7ULG3rxpLJyYNQNzFVEqVNwlhw7lrblOCHt3RnY4keQDg8bOFP8Vbp5T1
   w1tFn7KdIYW906upqYF+m+GXZrO1ojgGwf0fKaOtUwBYRIPd/tSq/OkvR
   RxCrWGQVksSVv4jMQ7TEOClpJl162qCVNz0RfyLUbWExGrbcdJaKa0luv
   hYuenTXg7vq6//kNPcb/yqmJk/kwWrJfhekB/TzC5RKtNtyBjDFEbMf1I
   O8vT9EsW1NLHX/PBykH1+X6deIt7p//bDi5SgxNodZYupzJvlnsfdeghE
   w==;
X-CSE-ConnectionGUID: wK69FPohQxuIrduc1dMe6w==
X-CSE-MsgGUID: JzgpqWsNTkWsKkonJzH4QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69311017"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="69311017"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 19:23:09 -0800
X-CSE-ConnectionGUID: YmyJAiYNRAmHFN4HJaZMsg==
X-CSE-MsgGUID: a/U/XL+xR/ekSYy9zCx1lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="198725852"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 19:23:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQdSM-00000000AV9-2hes;
	Wed, 03 Dec 2025 03:23:06 +0000
Date: Wed, 3 Dec 2025 11:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] mm/ksm.c:146: warning: Function
 parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'
Message-ID: <202512031117.qwIhKgJh-lkp@intel.com>
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
head:   6e491b9f54ea3245a5c167b19e48c0502cf7169b
commit: ef314e56b70f4662163f3e1e094bcfa9627674c5 [1/1] anolis: kabi: reserve some space for kABI
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251203/202512031117.qwIhKgJh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031117.qwIhKgJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031117.qwIhKgJh-lkp@intel.com/

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
ef314e56b70f466 Guixin Liu   2024-08-26  143  
ef314e56b70f466 Guixin Liu   2024-08-26  144  	CK_KABI_RESERVE(1)
ef314e56b70f466 Guixin Liu   2024-08-26  145  	CK_KABI_RESERVE(2)
31dbd01f314364b Izik Eidus   2009-09-21 @146  };
31dbd01f314364b Izik Eidus   2009-09-21  147  

:::::: The code at line 146 was first introduced by commit
:::::: 31dbd01f314364b70c2e026a5793a29a4da8a9dc ksm: Kernel SamePage Merging

:::::: TO: Izik Eidus <ieidus@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
