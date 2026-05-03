Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF673ACEE9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777797562; cv=none; b=m2nuXoAxogaEAdCybdDdXY89LXAmcJlS/Y6y07EKqVw4fOxFaU2G2QrllAs40/CfU7ej7DfpbzCTQzyxWTvNAhmaZeNUbyhCj4/W2KyIlufm92xKWE1bc1+guaHAF6bWWD47sjsu9E5TA24uqGjOK2NkmuwFkyprcXaao6Lx/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777797562; c=relaxed/simple;
	bh=bYhBEGoKaoGReN/TzJ4TP/NFMJHOjBQlaYwMJjXwNn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TSA+yWKpMO0JCGb1pnK4R4NiAh2wO5fdB+UiEfuqoIxOMbJ0aCp+arYeG5p23jaBMm8ndKzCSm62oyckGY2on9sPexFLTSWU1LkdY/KsHQ+wdi4ONkyrnVg2jJ4Ew+vGNKKPTVyzlupzRdNAMdVkzu39tgXQZ5hkZ1bPUMfzQCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4cUzFO2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4cUzFO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777797561; x=1809333561;
  h=date:from:to:cc:subject:message-id;
  bh=bYhBEGoKaoGReN/TzJ4TP/NFMJHOjBQlaYwMJjXwNn4=;
  b=j4cUzFO2faDBlCSpkP1Q81y43Rvn2ckc8SqFbPg2FtQkhXZWt7hKLmCx
   1PStZGu9M+jC35X17vSERpqdaP0MdoX55GHPwpY3VesG1RXUtBjtJ8wy4
   eekdYJmElWsvbrxlm7tiBLE/g4sTE8s2O1jRMZsapqiARRj8jX4/nSnu9
   buB0u2xYvNldSzerwDkG7cXrfRTFHq6agImSU3CKZ1+u964BK4eHCi6RK
   oNDzHMGAgLvk3d5hJdDv8V3K7ux+9BbFy2HE/kdV9z4bgwtni+b5mb4I/
   7kot1D1RRSdu4u9QRpKGK3RwA8D1YcUj7Btk7QsV5UTxJyECIhCc2VZvd
   A==;
X-CSE-ConnectionGUID: 0fmnsPjuTTmEQETj9DnAsQ==
X-CSE-MsgGUID: k3EZpA8qSQqnOkoCtm4+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="81260522"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="81260522"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 01:39:17 -0700
X-CSE-ConnectionGUID: Cyjn2PBzScCF6AwFwrHFVA==
X-CSE-MsgGUID: 4nTBSNjaSsui4qqxwMTA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="239568532"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 03 May 2026 01:39:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJSM5-000000005VJ-41Be;
	Sun, 03 May 2026 08:39:13 +0000
Date: Sun, 03 May 2026 10:38:18 +0200
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: mm/workingset.c:273 function parameter 'bits' not
 described in 'lru_eviction'
Message-ID: <202605031041.EHIjDz9i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-make-lru_zone_size-atomic-and-simplify-sanity-check/20260503-103454
head:   64b560f27addefdad180f484c4bd8ebf96e70a7a
commit: afe74d5d59350091e6aededce02eedbc55b2b23e mm/workingset: move refault distance checking into a helper
date:   6 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260503/202605031041.EHIjDz9i-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031041.EHIjDz9i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031041.EHIjDz9i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/workingset.c:273 function parameter 'bits' not described in 'lru_eviction'
>> Warning: mm/workingset.c:273 function parameter 'bucket_order' not described in 'lru_eviction'
>> Warning: mm/workingset.c:273 function parameter 'bits' not described in 'lru_eviction'
>> Warning: mm/workingset.c:273 function parameter 'bucket_order' not described in 'lru_eviction'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
