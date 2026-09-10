Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497484AE8B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054782; cv=none; b=FsgcPJbW7+YEBbUYM50pL9QKDgbKxrgfjWblzhLfQxpTGQ2u9eDanfqx35+o2zwJsTtpiwOtNulsr2FMkqfveL17JxAmGdCPkZuEZ6OQrcksLio1ElBoctE20Slb/XKpA8Vr/ig6x96X1iUXCKZJX1kFOJEIPNkkZWhlSVml0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054782; c=relaxed/simple;
	bh=NOje+3YsUALdI0J6shC4UnEqkQpYfQXP5PQ8Hp6j3MA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VYvCXVnCK4F7jPmF8GzXnorVEU/MoMJnF+CbylSWV7YKkjv9ThSbFOMwhYKi55/6OHV0rqtbnhq/ClATxhqqDg50arFG1THkQCwT5NVfJJ6hFTRZKzB/dfsv+HE5nsQSralQMKIsMVJWKz9jgwPPHu2TL5AuwZx3TqfegRR9uuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMJ6sKLe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMJ6sKLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054780; x=1820590780;
  h=date:from:to:cc:subject:message-id;
  bh=NOje+3YsUALdI0J6shC4UnEqkQpYfQXP5PQ8Hp6j3MA=;
  b=iMJ6sKLejfZ1P6/PXjTiqcYrAzrK127DkkBEkflzjbH5LWg/ZfEWQoap
   6TpWjdz7MI+26p0nVSah1PcEv/TUNizBDortv2rzzw8YWI/SByBWkWMEC
   uyUCUWjlOquY7eL3x4WSaYUgH3I7cqhLyuSaPQkPJG2uDHcF88Aq5J4Op
   rsUgCS8DE4ODbngC/sQOmsWqKL2Y0OEwvyCIWak+6S9b8PhhRjLEktntJ
   4jrHcrEaTprYXVtJgxGOW7Egs3+iDdeWV8trbq6NylkTkZObot9GrZdtT
   IkIvelW8SaPG79xyM6sxEw1163E0AubZkLr8BJbURyaTa09wvz7Zz5roF
   g==;
X-CSE-ConnectionGUID: Rzix0DuWRUCV0CdW0B4d4A==
X-CSE-MsgGUID: jI6EX3MrTo+N4FtE4Nw8Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271598"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:32 -0700
X-CSE-ConnectionGUID: hTAiZiOVTpSZuL+IHFPDMQ==
X-CSE-MsgGUID: Q3rs1bgrT0W90GKna8/sCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395201"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 08:39:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gs5-000000000QE-0KYi;
	Thu, 10 Sep 2026 15:39:29 +0000
Date: Thu, 10 Sep 2026 17:39:16 +0200
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/linux/swiotlb.h:236:36: error: static declaration of
 'swiotlb_adjusted_size' follows non-static declaration
Message-ID: <202609092003.yIZwwi2l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/dma-swiotlb-Centralize-default-pool-policy-selection/20260904-154807
head:   946f0f99e295541ece6b88a541cb0552bf53a305
commit: 4ec8b860ec4014ba52aefcafbb9c178b95b5b967 dma: swiotlb: Centralize memory-encryption pool sizing
date:   3 days ago
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20260909/202609092003.yIZwwi2l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609092003.yIZwwi2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609092003.yIZwwi2l-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:28:
>> include/linux/swiotlb.h:236:36: error: static declaration of 'swiotlb_adjusted_size' follows non-static declaration
     236 | static inline unsigned long __init swiotlb_adjusted_size(void)
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/crash_reserve.h:9,
                    from include/linux/kexec.h:19,
                    from include/linux/crash_dump.h:5,
                    from arch/x86/kernel/setup.c:12:
   arch/x86/include/asm/crash_reserve.h:21:22: note: previous declaration of 'swiotlb_adjusted_size' with type 'long unsigned int(void)'
      21 | unsigned long __init swiotlb_adjusted_size(void);
         |                      ^~~~~~~~~~~~~~~~~~~~~


vim +/swiotlb_adjusted_size +236 include/linux/swiotlb.h

   235	
 > 236	static inline unsigned long __init swiotlb_adjusted_size(void)
   237	{
   238		return 0;
   239	}
   240	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
