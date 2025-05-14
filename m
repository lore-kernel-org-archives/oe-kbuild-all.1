Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1874C9F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 11:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747220415; cv=none; b=sYhA5nfWAhMYn0+Xd6KywRBvk0U7pGV4/OCVyO32SwxGyXBRaBC/nYjupQiGvIqJ/rO+GICHKVjcGP1/hExj8Za6sInQjxvN4ISK158j85yKNYIlBCLFld2KYwASHos/5Xoj3UN/LLxtCfQVpo9ARcSQC5gh7mqa+DM8OLnu+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747220415; c=relaxed/simple;
	bh=85oZVOlTXEtpXJ/bWZMknJ8zgVMKsB9riX0PALvd3pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WhUmjSkLyhzmehLlmksALZO9DcbcYnbwsr3Ck0iLwentzXGUEK/LlR4ZhLfs4as1Ec1/05qJnmaWXXP6fxlDZjo9P6oEO4OvGvrhrvfuPdTwMaJmH7Hlt9BZ8hllVtXNWbtIwMrqnvNkCyEd4fKpY/DyTduI1HDMGmzu6veuvPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbGyAeWc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbGyAeWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747220414; x=1778756414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=85oZVOlTXEtpXJ/bWZMknJ8zgVMKsB9riX0PALvd3pg=;
  b=AbGyAeWcfX3oITDNFqw0fPjfRZx5ZousOXBJLJW4AmJvKrtnk4Yyhhzc
   wGlSWFkjp0QzQGFJtltQLmp1KkW1U/+sE1Vve5QDmow3IKXOvDsnyleTg
   y8yt7a7N4jVWucnWf/kY+OKc+sk+3IopFuWw7O6POHB1+/jwZAKY26k3K
   NuEdBykDI7YMeNsMcERMFTAHipP0+srwYhq7p6KsbnOetjLZnn+bDCRzh
   ZCi83Ie86Is2Un89/89MgxkmMJLphFOelJwA5LLwGehx4iqZU8+O00Whn
   HofYA9QF6+UaeQoZT1RhDN7otrNhOLwUIwjRLY3ROt2yoAac9054hvhtI
   A==;
X-CSE-ConnectionGUID: n/3XsjM7Rha/ZRh95z0Y2Q==
X-CSE-MsgGUID: Fglr+nMFT52uQwu/HTgFyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="71612365"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="71612365"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:00:13 -0700
X-CSE-ConnectionGUID: 2UyvQoCuTwqCLKbm8nkRAw==
X-CSE-MsgGUID: V15yGB8dQHOyJ23rPZTF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138061065"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2025 04:00:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF9qL-000H0Z-21;
	Wed, 14 May 2025 11:00:09 +0000
Date: Wed, 14 May 2025 19:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 56/56] mm/ksm.c:146: warning: Function
 parameter or member 'CK_KABI_RESERVE(1' not described in 'ksm_scan'
Message-ID: <202505141807.sk1zcIgx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   962678f628e6378bd0b60eeb52c2e28ec5881096
commit: 6213df05e6a41c4359febd123367d169fd284683 [56/56] anolis: kabi: reserve some space for kABI
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250514/202505141807.sk1zcIgx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141807.sk1zcIgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141807.sk1zcIgx-lkp@intel.com/

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
6213df05e6a41c Guixin Liu   2024-08-26  143  
6213df05e6a41c Guixin Liu   2024-08-26  144  	CK_KABI_RESERVE(1)
6213df05e6a41c Guixin Liu   2024-08-26  145  	CK_KABI_RESERVE(2)
31dbd01f314364 Izik Eidus   2009-09-21 @146  };
31dbd01f314364 Izik Eidus   2009-09-21  147  

:::::: The code at line 146 was first introduced by commit
:::::: 31dbd01f314364b70c2e026a5793a29a4da8a9dc ksm: Kernel SamePage Merging

:::::: TO: Izik Eidus <ieidus@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
