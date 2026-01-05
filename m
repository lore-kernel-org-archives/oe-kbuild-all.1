Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD783FFD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 04:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767587128; cv=none; b=I60Lx2onblvU21MhMfQGYYekbyW+C6gvBf8tODc8kF0Yv9g6JEPsHzwpgTMCv6vUjiTc2/2x6EQBIelP5LRAtWlGRfh8NyTKzYruWSDqkH061hFgmD36tQtquwb9HuGvA1K68f1jLaBDgUMb8OxggYVUCYuoQBdsL2FN6PaFbmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767587128; c=relaxed/simple;
	bh=v9pfEkU8hGr/Z5crXgPa6EkyAh6WzuWreJ/HPCbY4Zg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e8JOPOkSNx2BNzYBKxGKBtnjhX1sFp099iK3XWRnIzfWuesdYo6xMJj7MHTIVa2pmDPaaK2IiS2EVZkogn+yjTOgbMwWR5drRNBnmwc+Twl5v8tMsputwd9AXfLrn+aSeKp6Ff25JdKsCO09VB6ZvnESBQY1lzBFD23vg/iu3Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAcL/FEe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAcL/FEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767587124; x=1799123124;
  h=date:from:to:cc:subject:message-id;
  bh=v9pfEkU8hGr/Z5crXgPa6EkyAh6WzuWreJ/HPCbY4Zg=;
  b=PAcL/FEe4Xyy6UwpQIh+z+eHeGeLNTm9Wl/fpDu6UeF+AMP7wkZwegZU
   ASpGcR1JCJd4PMxvpa38M3U948NrAzHBIaY48P4YnEJh2gNJVGhEqEKDL
   yZd17/Rj8Zshgeq8idCciLB+Gnb8ygyzpep61jp0bXEl4JCakFy/qanXd
   kspsS9hJZThFbHXYO92v9fWTFx7GlR8TeCuE2vRbFrfGyfZJbmP8kidhw
   XsMgh87D3Ntm4NDroQlpsLl6o4voHpjtk8tpRK8gP1L76joXpaLdgOceu
   Bt3WJeRtQENt99igMYQY+55NI5E1G2uh1sZ/LK+DUVG1YKYiWX4oAHE8G
   Q==;
X-CSE-ConnectionGUID: 6bEBs5cbQ/C9yndTl3miXQ==
X-CSE-MsgGUID: y2bW6ku6SFKxy8vZ3XGLkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68858177"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="68858177"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 20:25:24 -0800
X-CSE-ConnectionGUID: cqZIWVjxTfOfCmv0EBuVlQ==
X-CSE-MsgGUID: WEZgA8mDS5m4aeIxpSLRjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="207183322"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jan 2026 20:25:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcc9g-000000000vx-20sW;
	Mon, 05 Jan 2026 04:25:20 +0000
Date: Mon, 05 Jan 2026 12:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 2/2] mm/ksm.c:146: warning:
 Function parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'
Message-ID: <202601051237.571fhLvp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Guixin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f64b5635bc6da0e12f72f202d7ac1b5bb5457209
commit: ef314e56b70f4662163f3e1e094bcfa9627674c5 [2/2] anolis: kabi: reserve some space for kABI
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260105/202601051237.571fhLvp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601051237.571fhLvp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601051237.571fhLvp-lkp@intel.com/

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
