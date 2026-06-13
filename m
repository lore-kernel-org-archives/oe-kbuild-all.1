Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E645233E346
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 06:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781331850; cv=none; b=qVYXl8UboDHdtrWSLnsFWns+KrKQqg9TPKvjcgV6tvkhblI2yIe14lsH9NcIUonbLy/Ui3JMJflJmZ/KSqGG5HDA15e6rOD+hIScARD5fvsPGnzgvGsTRVx/1BTT4O8kixl6101Vo0xgOZRZ0NS6iAXsQfdLC2NK550+PMPSV9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781331850; c=relaxed/simple;
	bh=BgKIYJVq8ZEJd+rzjrXiLL4EQdccv3Fsm4zzGQz7xIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VKfqIA05PAFSyQWe4dET8aZii/fXZFFW/JWrnE/2YFTxH1TbM2sDff1MMgrB4/n3DKS0Dz102dQCDNdFZ/6CTlqi6a1ChZL3+pAdb8LaJqcYh2ROODSHHdCyV4VTFw0GmG9i05GPePNvV1jcb4JK4B6spIx+Ltw1JRR23g3dzh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+SSqoVS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+SSqoVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781331848; x=1812867848;
  h=date:from:to:cc:subject:message-id;
  bh=BgKIYJVq8ZEJd+rzjrXiLL4EQdccv3Fsm4zzGQz7xIQ=;
  b=a+SSqoVSuJNiZQcWg4YBB9Wf7O7Nd2JxAM8RrkPgxbGN1FVl0Fa8/pdQ
   S5Wv9yQgoiA2t1WN36rRKQMTCKH/wW6PZ2sbKnhb1om6KmM5xxIX1Z6az
   DgAZuwxtXTuR8RVqec/BA8WVfo0vNxP0GBU0Af50jeLPPfR46drYH6Gms
   VEpPg9pIWScB+zQmmnqug7yd5auW3irzISLbFrEBwkltCb31Pfy16TKkr
   0Fe0kwSQCN6sJnKBZFoeC83pKToy/w3mh5xlWxi+VKeEVL4uX09c6epxF
   sx6P/zpGfsFAo7DGDf15a1ISBLELYq1apZPJWoiq3WHvUPOH7VMhhT0fF
   w==;
X-CSE-ConnectionGUID: YR+BrA+STFqNxPQ2hdUYSg==
X-CSE-MsgGUID: 6BAwpDXiQ8uWcYWr21N0Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86057676"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="86057676"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 23:24:07 -0700
X-CSE-ConnectionGUID: e9fRYGPxR6GDfm7ddiPxZA==
X-CSE-MsgGUID: wjCt63FbR46kiXnM7HQJng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="245886347"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2026 23:24:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYHmk-00000000PjW-26us;
	Sat, 13 Jun 2026 06:24:02 +0000
Date: Sat, 13 Jun 2026 14:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lohita Mudimela <lohita.mudimela@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Martin Leung <martin.leung@amd.com>, James Lin <pinglei.lin@amd.com>
Subject: [linux-next:master 3751/13763]
 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1590:48:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202606131413.IETW0eTk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 254a47ce0c8a52ff78a60f92a13b56db69f69096 [3751/13763] drm/amd/display: Separate ABM functions into dedicated power_abm.c file
config: sparc64-randconfig-r122-20260613 (https://download.01.org/0day-ci/archive/20260613/202606131413.IETW0eTk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131413.IETW0eTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131413.IETW0eTk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1590:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1590:48: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1590:48: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1591:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1591:48: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1591:48: sparse:     got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1629:25: sparse: sparse: restricted __be16 degrades to integer
>> drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1629:64: sparse: sparse: restricted __le16 degrades to integer
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1631:25: sparse: sparse: restricted __be16 degrades to integer
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1631:61: sparse: sparse: restricted __le16 degrades to integer
>> drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1639:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] min_abm_backlight @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1639:38: sparse:     expected unsigned short [usertype] min_abm_backlight
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1639:38: sparse:     got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1643:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] blRampReduction @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1643:36: sparse:     expected unsigned short [usertype] blRampReduction
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1643:36: sparse:     got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1645:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] blRampStart @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1645:32: sparse:     expected unsigned short [usertype] blRampStart
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1645:32: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1780:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1780:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1780:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1781:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1781:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1781:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1782:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1782:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1782:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1783:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1783:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1783:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1784:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1784:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1784:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1785:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1785:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1785:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1786:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1786:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1786:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1787:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1787:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1787:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1788:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1788:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1788:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1789:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1789:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1789:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1790:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1790:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1790:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1791:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1791:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1791:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1792:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1792:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1792:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1793:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1793:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1793:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1794:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1794:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1794:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1795:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1795:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1795:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1796:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1796:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1796:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1797:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1797:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1797:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1798:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1798:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1798:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1799:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1799:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1799:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1800:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1800:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1800:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1801:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1801:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1801:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1802:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1802:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1802:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1803:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1803:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1803:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1815:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] min_abm_backlight @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1815:38: sparse:     expected unsigned short [usertype] min_abm_backlight
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1815:38: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1926:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1926:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1926:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1927:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1927:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1927:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1928:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1928:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1928:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1929:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1929:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1929:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1930:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1930:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1930:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1931:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1931:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1931:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1932:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1932:35: sparse:     expected unsigned short
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1932:35: sparse:     got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1933:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1933:35: sparse:     expected unsigned short

vim +1590 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c

  1555	
  1556	static void fill_backlight_transform_table(struct dmcu_iram_parameters params,
  1557			struct iram_table_v_2 *table)
  1558	{
  1559		unsigned int i;
  1560		unsigned int num_entries = NUM_BL_CURVE_SEGS;
  1561		unsigned int lut_index;
  1562	
  1563		table->backlight_thresholds[0] = 0;
  1564		ASSERT(params.backlight_lut_array[0] <= 0xFFFF);
  1565		table->backlight_offsets[0] = (uint16_t)params.backlight_lut_array[0];
  1566		table->backlight_thresholds[num_entries-1] = 0xFFFF;
  1567		ASSERT(params.backlight_lut_array[params.backlight_lut_array_size - 1] <= 0xFFFF);
  1568		table->backlight_offsets[num_entries-1] =
  1569			(uint16_t)params.backlight_lut_array[params.backlight_lut_array_size - 1];
  1570	
  1571		/* Setup all brightness levels between 0% and 100% exclusive
  1572		 * Fills brightness-to-backlight transform table. Backlight custom curve
  1573		 * describes transform from brightness to backlight. It will be defined
  1574		 * as set of thresholds and set of offsets, together, implying
  1575		 * extrapolation of custom curve into 16 uniformly spanned linear
  1576		 * segments.  Each threshold/offset represented by 16 bit entry in
  1577		 * format U4.10.
  1578		 */
  1579		for (i = 1; i+1 < num_entries; i++) {
  1580			lut_index = (params.backlight_lut_array_size - 1) * i / (num_entries - 1);
  1581	
  1582			ASSERT(lut_index < params.backlight_lut_array_size);
  1583	
  1584			unsigned int threshold_val = DIV_ROUNDUP((i * 65536), num_entries);
  1585			unsigned int offset_val = params.backlight_lut_array[lut_index];
  1586	
  1587			ASSERT(threshold_val <= 0xFFFF);
  1588			ASSERT(offset_val <= 0xFFFF);
  1589	
> 1590			table->backlight_thresholds[i] = cpu_to_be16((uint16_t)threshold_val);
> 1591			table->backlight_offsets[i]    = cpu_to_be16((uint16_t)offset_val);
  1592		}
  1593	}
  1594	
  1595	static void fill_backlight_transform_table_v_2_2(struct dmcu_iram_parameters params,
  1596			struct iram_table_v_2_2 *table, bool big_endian)
  1597	{
  1598		unsigned int i;
  1599		unsigned int num_entries = NUM_BL_CURVE_SEGS;
  1600		unsigned int lut_index;
  1601	
  1602		table->backlight_thresholds[0] = 0;
  1603		ASSERT(params.backlight_lut_array[0] <= 0xFFFF);
  1604		table->backlight_offsets[0] = (uint16_t)params.backlight_lut_array[0];
  1605		table->backlight_thresholds[num_entries-1] = 0xFFFF;
  1606		ASSERT(params.backlight_lut_array[params.backlight_lut_array_size - 1] <= 0xFFFF);
  1607		table->backlight_offsets[num_entries-1] =
  1608			(uint16_t)params.backlight_lut_array[params.backlight_lut_array_size - 1];
  1609	
  1610		/* Setup all brightness levels between 0% and 100% exclusive
  1611		 * Fills brightness-to-backlight transform table. Backlight custom curve
  1612		 * describes transform from brightness to backlight. It will be defined
  1613		 * as set of thresholds and set of offsets, together, implying
  1614		 * extrapolation of custom curve into 16 uniformly spanned linear
  1615		 * segments.  Each threshold/offset represented by 16 bit entry in
  1616		 * format U4.10.
  1617		 */
  1618		for (i = 1; i+1 < num_entries; i++) {
  1619			lut_index = DIV_ROUNDUP((i * params.backlight_lut_array_size), num_entries);
  1620			ASSERT(lut_index < params.backlight_lut_array_size);
  1621	
  1622			unsigned int threshold_val = DIV_ROUNDUP((i * 65536), num_entries);
  1623			unsigned int offset_val = params.backlight_lut_array[lut_index];
  1624	
  1625			ASSERT(threshold_val <= 0xFFFF);
  1626			ASSERT(offset_val <= 0xFFFF);
  1627	
  1628			table->backlight_thresholds[i] = (big_endian) ?
> 1629				cpu_to_be16((uint16_t)threshold_val) : cpu_to_le16((uint16_t)threshold_val);
  1630			table->backlight_offsets[i] = (big_endian) ?
  1631				cpu_to_be16((uint16_t)offset_val) : cpu_to_le16((uint16_t)offset_val);
  1632		}
  1633	}
  1634	
  1635	static void fill_iram_v_2(struct iram_table_v_2 *ram_table, struct dmcu_iram_parameters params)
  1636	{
  1637		unsigned int set = params.set;
  1638	
> 1639		ram_table->min_abm_backlight =
  1640				cpu_to_be16(params.min_abm_backlight);
  1641		ram_table->deviation_gain = 0xb3;
  1642	
> 1643		ram_table->blRampReduction =
  1644			cpu_to_be16(params.backlight_ramping_reduction);
> 1645		ram_table->blRampStart =
  1646			cpu_to_be16(params.backlight_ramping_start);
  1647	
  1648		ram_table->min_reduction[0][0] = min_reduction_table[abm_config[set][0]];
  1649		ram_table->min_reduction[1][0] = min_reduction_table[abm_config[set][0]];
  1650		ram_table->min_reduction[2][0] = min_reduction_table[abm_config[set][0]];
  1651		ram_table->min_reduction[3][0] = min_reduction_table[abm_config[set][0]];
  1652		ram_table->min_reduction[4][0] = min_reduction_table[abm_config[set][0]];
  1653		ram_table->max_reduction[0][0] = max_reduction_table[abm_config[set][0]];
  1654		ram_table->max_reduction[1][0] = max_reduction_table[abm_config[set][0]];
  1655		ram_table->max_reduction[2][0] = max_reduction_table[abm_config[set][0]];
  1656		ram_table->max_reduction[3][0] = max_reduction_table[abm_config[set][0]];
  1657		ram_table->max_reduction[4][0] = max_reduction_table[abm_config[set][0]];
  1658	
  1659		ram_table->min_reduction[0][1] = min_reduction_table[abm_config[set][1]];
  1660		ram_table->min_reduction[1][1] = min_reduction_table[abm_config[set][1]];
  1661		ram_table->min_reduction[2][1] = min_reduction_table[abm_config[set][1]];
  1662		ram_table->min_reduction[3][1] = min_reduction_table[abm_config[set][1]];
  1663		ram_table->min_reduction[4][1] = min_reduction_table[abm_config[set][1]];
  1664		ram_table->max_reduction[0][1] = max_reduction_table[abm_config[set][1]];
  1665		ram_table->max_reduction[1][1] = max_reduction_table[abm_config[set][1]];
  1666		ram_table->max_reduction[2][1] = max_reduction_table[abm_config[set][1]];
  1667		ram_table->max_reduction[3][1] = max_reduction_table[abm_config[set][1]];
  1668		ram_table->max_reduction[4][1] = max_reduction_table[abm_config[set][1]];
  1669	
  1670		ram_table->min_reduction[0][2] = min_reduction_table[abm_config[set][2]];
  1671		ram_table->min_reduction[1][2] = min_reduction_table[abm_config[set][2]];
  1672		ram_table->min_reduction[2][2] = min_reduction_table[abm_config[set][2]];
  1673		ram_table->min_reduction[3][2] = min_reduction_table[abm_config[set][2]];
  1674		ram_table->min_reduction[4][2] = min_reduction_table[abm_config[set][2]];
  1675		ram_table->max_reduction[0][2] = max_reduction_table[abm_config[set][2]];
  1676		ram_table->max_reduction[1][2] = max_reduction_table[abm_config[set][2]];
  1677		ram_table->max_reduction[2][2] = max_reduction_table[abm_config[set][2]];
  1678		ram_table->max_reduction[3][2] = max_reduction_table[abm_config[set][2]];
  1679		ram_table->max_reduction[4][2] = max_reduction_table[abm_config[set][2]];
  1680	
  1681		ram_table->min_reduction[0][3] = min_reduction_table[abm_config[set][3]];
  1682		ram_table->min_reduction[1][3] = min_reduction_table[abm_config[set][3]];
  1683		ram_table->min_reduction[2][3] = min_reduction_table[abm_config[set][3]];
  1684		ram_table->min_reduction[3][3] = min_reduction_table[abm_config[set][3]];
  1685		ram_table->min_reduction[4][3] = min_reduction_table[abm_config[set][3]];
  1686		ram_table->max_reduction[0][3] = max_reduction_table[abm_config[set][3]];
  1687		ram_table->max_reduction[1][3] = max_reduction_table[abm_config[set][3]];
  1688		ram_table->max_reduction[2][3] = max_reduction_table[abm_config[set][3]];
  1689		ram_table->max_reduction[3][3] = max_reduction_table[abm_config[set][3]];
  1690		ram_table->max_reduction[4][3] = max_reduction_table[abm_config[set][3]];
  1691	
  1692		ram_table->bright_pos_gain[0][0] = 0x20;
  1693		ram_table->bright_pos_gain[0][1] = 0x20;
  1694		ram_table->bright_pos_gain[0][2] = 0x20;
  1695		ram_table->bright_pos_gain[0][3] = 0x20;
  1696		ram_table->bright_pos_gain[1][0] = 0x20;
  1697		ram_table->bright_pos_gain[1][1] = 0x20;
  1698		ram_table->bright_pos_gain[1][2] = 0x20;
  1699		ram_table->bright_pos_gain[1][3] = 0x20;
  1700		ram_table->bright_pos_gain[2][0] = 0x20;
  1701		ram_table->bright_pos_gain[2][1] = 0x20;
  1702		ram_table->bright_pos_gain[2][2] = 0x20;
  1703		ram_table->bright_pos_gain[2][3] = 0x20;
  1704		ram_table->bright_pos_gain[3][0] = 0x20;
  1705		ram_table->bright_pos_gain[3][1] = 0x20;
  1706		ram_table->bright_pos_gain[3][2] = 0x20;
  1707		ram_table->bright_pos_gain[3][3] = 0x20;
  1708		ram_table->bright_pos_gain[4][0] = 0x20;
  1709		ram_table->bright_pos_gain[4][1] = 0x20;
  1710		ram_table->bright_pos_gain[4][2] = 0x20;
  1711		ram_table->bright_pos_gain[4][3] = 0x20;
  1712		ram_table->bright_neg_gain[0][0] = 0x00;
  1713		ram_table->bright_neg_gain[0][1] = 0x00;
  1714		ram_table->bright_neg_gain[0][2] = 0x00;
  1715		ram_table->bright_neg_gain[0][3] = 0x00;
  1716		ram_table->bright_neg_gain[1][0] = 0x00;
  1717		ram_table->bright_neg_gain[1][1] = 0x00;
  1718		ram_table->bright_neg_gain[1][2] = 0x00;
  1719		ram_table->bright_neg_gain[1][3] = 0x00;
  1720		ram_table->bright_neg_gain[2][0] = 0x00;
  1721		ram_table->bright_neg_gain[2][1] = 0x00;
  1722		ram_table->bright_neg_gain[2][2] = 0x00;
  1723		ram_table->bright_neg_gain[2][3] = 0x00;
  1724		ram_table->bright_neg_gain[3][0] = 0x00;
  1725		ram_table->bright_neg_gain[3][1] = 0x00;
  1726		ram_table->bright_neg_gain[3][2] = 0x00;
  1727		ram_table->bright_neg_gain[3][3] = 0x00;
  1728		ram_table->bright_neg_gain[4][0] = 0x00;
  1729		ram_table->bright_neg_gain[4][1] = 0x00;
  1730		ram_table->bright_neg_gain[4][2] = 0x00;
  1731		ram_table->bright_neg_gain[4][3] = 0x00;
  1732		ram_table->dark_pos_gain[0][0] = 0x00;
  1733		ram_table->dark_pos_gain[0][1] = 0x00;
  1734		ram_table->dark_pos_gain[0][2] = 0x00;
  1735		ram_table->dark_pos_gain[0][3] = 0x00;
  1736		ram_table->dark_pos_gain[1][0] = 0x00;
  1737		ram_table->dark_pos_gain[1][1] = 0x00;
  1738		ram_table->dark_pos_gain[1][2] = 0x00;
  1739		ram_table->dark_pos_gain[1][3] = 0x00;
  1740		ram_table->dark_pos_gain[2][0] = 0x00;
  1741		ram_table->dark_pos_gain[2][1] = 0x00;
  1742		ram_table->dark_pos_gain[2][2] = 0x00;
  1743		ram_table->dark_pos_gain[2][3] = 0x00;
  1744		ram_table->dark_pos_gain[3][0] = 0x00;
  1745		ram_table->dark_pos_gain[3][1] = 0x00;
  1746		ram_table->dark_pos_gain[3][2] = 0x00;
  1747		ram_table->dark_pos_gain[3][3] = 0x00;
  1748		ram_table->dark_pos_gain[4][0] = 0x00;
  1749		ram_table->dark_pos_gain[4][1] = 0x00;
  1750		ram_table->dark_pos_gain[4][2] = 0x00;
  1751		ram_table->dark_pos_gain[4][3] = 0x00;
  1752		ram_table->dark_neg_gain[0][0] = 0x00;
  1753		ram_table->dark_neg_gain[0][1] = 0x00;
  1754		ram_table->dark_neg_gain[0][2] = 0x00;
  1755		ram_table->dark_neg_gain[0][3] = 0x00;
  1756		ram_table->dark_neg_gain[1][0] = 0x00;
  1757		ram_table->dark_neg_gain[1][1] = 0x00;
  1758		ram_table->dark_neg_gain[1][2] = 0x00;
  1759		ram_table->dark_neg_gain[1][3] = 0x00;
  1760		ram_table->dark_neg_gain[2][0] = 0x00;
  1761		ram_table->dark_neg_gain[2][1] = 0x00;
  1762		ram_table->dark_neg_gain[2][2] = 0x00;
  1763		ram_table->dark_neg_gain[2][3] = 0x00;
  1764		ram_table->dark_neg_gain[3][0] = 0x00;
  1765		ram_table->dark_neg_gain[3][1] = 0x00;
  1766		ram_table->dark_neg_gain[3][2] = 0x00;
  1767		ram_table->dark_neg_gain[3][3] = 0x00;
  1768		ram_table->dark_neg_gain[4][0] = 0x00;
  1769		ram_table->dark_neg_gain[4][1] = 0x00;
  1770		ram_table->dark_neg_gain[4][2] = 0x00;
  1771		ram_table->dark_neg_gain[4][3] = 0x00;
  1772	
  1773		ram_table->iir_curve[0] = 0x65;
  1774		ram_table->iir_curve[1] = 0x65;
  1775		ram_table->iir_curve[2] = 0x65;
  1776		ram_table->iir_curve[3] = 0x65;
  1777		ram_table->iir_curve[4] = 0x65;
  1778	
  1779		//Gamma 2.4
  1780		ram_table->crgb_thresh[0] = cpu_to_be16(0x13b6);
  1781		ram_table->crgb_thresh[1] = cpu_to_be16(0x1648);
  1782		ram_table->crgb_thresh[2] = cpu_to_be16(0x18e3);
  1783		ram_table->crgb_thresh[3] = cpu_to_be16(0x1b41);
  1784		ram_table->crgb_thresh[4] = cpu_to_be16(0x1d46);
  1785		ram_table->crgb_thresh[5] = cpu_to_be16(0x1f21);
  1786		ram_table->crgb_thresh[6] = cpu_to_be16(0x2167);
  1787		ram_table->crgb_thresh[7] = cpu_to_be16(0x2384);
  1788		ram_table->crgb_offset[0] = cpu_to_be16(0x2999);
  1789		ram_table->crgb_offset[1] = cpu_to_be16(0x3999);
  1790		ram_table->crgb_offset[2] = cpu_to_be16(0x4666);
  1791		ram_table->crgb_offset[3] = cpu_to_be16(0x5999);
  1792		ram_table->crgb_offset[4] = cpu_to_be16(0x6333);
  1793		ram_table->crgb_offset[5] = cpu_to_be16(0x7800);
  1794		ram_table->crgb_offset[6] = cpu_to_be16(0x8c00);
  1795		ram_table->crgb_offset[7] = cpu_to_be16(0xa000);
  1796		ram_table->crgb_slope[0]  = cpu_to_be16(0x3147);
  1797		ram_table->crgb_slope[1]  = cpu_to_be16(0x2978);
  1798		ram_table->crgb_slope[2]  = cpu_to_be16(0x23a2);
  1799		ram_table->crgb_slope[3]  = cpu_to_be16(0x1f55);
  1800		ram_table->crgb_slope[4]  = cpu_to_be16(0x1c63);
  1801		ram_table->crgb_slope[5]  = cpu_to_be16(0x1a0f);
  1802		ram_table->crgb_slope[6]  = cpu_to_be16(0x178d);
  1803		ram_table->crgb_slope[7]  = cpu_to_be16(0x15ab);
  1804	
  1805		fill_backlight_transform_table(
  1806				params, ram_table);
  1807	}
  1808	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
