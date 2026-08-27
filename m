Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BF21CA03
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 00:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787790638; cv=none; b=QhqyfBlbyh197MrVVWlOcr22/OvoVAUNJ3DMPy5zZYzQVdRurefO93Km/DFWWZyMZOC1/mYuBq73MMuUI9nrcBPyN753hhLsc6YM/GZnHsAZYLqQHf1dzPtRpvehNmboPj9FFdFnZy4k4Am0hqIIt4SWBeW7bfw2S18r0P0KcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787790638; c=relaxed/simple;
	bh=EGlF4ubITwR/PbPv2SAUbltkVJF/3F15/aIv45fpF7Y=;
	h=Date:From:Cc:Subject:Message-ID; b=eqZsNr/XsOARTHCTxIPnL2aBk8AC/Kunezk5FrnRjVRfEtr/hIe7+VMtdZzYfQABqmUf7DxULvyuxiVveFp2Ljij7YmnZoZpok8US5XjsgAST855c4a7EOZkxzTNw1F01BuZMbg/HRYCJXRRa6UdFPCQUmMnA15kEftknTC6xAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJm6JCdq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJm6JCdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787790637; x=1819326637;
  h=date:from:cc:subject:message-id;
  bh=EGlF4ubITwR/PbPv2SAUbltkVJF/3F15/aIv45fpF7Y=;
  b=YJm6JCdqAwCfvgCmZldXNBvIZIAM3fJJ9EnsL6tPmFvBBksGbxwyfCvi
   DiW+PWpvlIO0iHix++0CIYgcELqKO17rKSo8yJQ+sgRxeGW4Pq7zvdlQu
   pd4XUJs50HmCRPK2TnzcgAzIGTyGuNv74vnjuf/pGCj7cqFhKDmJAQbMG
   sMtfeSklwsuloWGkvr36APmNexXcL+XU6S2FfgwY2ASLCoC7JRe3u6v06
   HEcPt70I6Oq5c2rQUvl4cr8eVugBrGwOpclgea676RfA81+XU5T63CQ1Q
   JFE5ye0q7aQZjf4Et9cPBHxJyf2J8ZZB+qyfOtlo9N/+TIt4ejVfXSDkk
   Q==;
X-CSE-ConnectionGUID: KkxfVI0QSr2HYaxrHmUawQ==
X-CSE-MsgGUID: uGqbYmJjTVKffWed82ideQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88205219"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88205219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:30:37 -0700
X-CSE-ConnectionGUID: KpJsPIPQStGYINxQGmdthQ==
X-CSE-MsgGUID: gLnN0QKeT0mQeFLaAjgmdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="263434787"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Aug 2026 17:30:35 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzO0n-000000000eb-0MX6;
	Thu, 27 Aug 2026 00:30:33 +0000
Date: Thu, 27 Aug 2026 02:30:21 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Junxiao Chang <junxiao.chang@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 "Zawawi, Muhammad Zul Husni" <muhammad.zul.husni.zawawi@intel.com>
Subject: [intel-lts:6.18/linux 0/1] htmldocs:
 Documentation/gpu/i915:564:
 ./drivers/gpu/drm/i915/gt/iov/abi/iov_actions_abi.h:176: WARNING: Blank line
 required after table. [docutils]
Message-ID: <202608270233.gtva9EEO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   6589ebb7420106d5db39b84880e040cd907b7143
commit: d56f3a63be48fc6e417988e373fe89f9100d1ce8 [0/1] drm/i915: SR-IOV Enabling and Support
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608270233.gtva9EEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270233.gtva9EEO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   +---+-------+--------------------------------------------------------------+
   | 4 |  31:0 | **PTE_LO** - lower 32 bits of GGTT PTE1                      |
   +---+-------+--------------------------------------------------------------+
   | 5 |  31:0 | **PTE_HI** - upper 32 bits of GGTT PTE1                      |
   +---+-------+--------------------------------------------------------------+ [docutils]
>> Documentation/gpu/i915:564: ./drivers/gpu/drm/i915/gt/iov/abi/iov_actions_abi.h:176: WARNING: Blank line required after table. [docutils]
   Documentation/gpu/i915:565: ./drivers/gpu/drm/i915/gt/iov/abi/iov_actions_mmio_abi.h:105: ERROR: Malformed table.
   Right border not aligned or missing.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
