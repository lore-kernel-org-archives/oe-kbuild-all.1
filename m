Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B03367B94
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 23:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330633; cv=none; b=gNx39MOl0J+oZ65IDUWmO65HU6Yc4IvsAIJ2ty1+WxJjYF6pYpTxz04ZctqY7bkhbCPjZyQ6BK4ylmLtBen31rxyKK+mVpZ+jvAQStYgJmFLmRucrzO0nSmpmAKeTV51sC/6XgvkJIMLUltRdiWD0LQKlmVGr/AnccWGGQiKN7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330633; c=relaxed/simple;
	bh=ChjwRhZ7m4aVdG3A7MSQPmPWOX7iS4HuQho8rXj7H3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eqBFSOzz2wt6izfdfnhumeS6/amfbEn48bHBpSlnssmdQVMu3yQzDBxEepmzYbFZel4A+wxHUc9QpFAqDyTPEp6GDzoPsEwxFNmNGPd6gGqxJYhxPaR4/FJH0VMVkg4csHWKYhheRPlCaxOHGPHBSEhUjbZRIPZ3Zpeq3rQfnCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsKzuzXT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsKzuzXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784330630; x=1815866630;
  h=date:from:to:cc:subject:message-id;
  bh=ChjwRhZ7m4aVdG3A7MSQPmPWOX7iS4HuQho8rXj7H3M=;
  b=SsKzuzXTn4VxlJPnNSHSQXLgsdKddGnvzOpLcaZD/+Uly6ZDMRTjnDlE
   eQVZnhgd6p0zlnPI54lcbzbg+uGPxeh6m92dBCSj+wdppecag7EyodNaR
   wiQffRhemtZdM165n2KZCnVr6vXqMuE+q6C69+1G+yuvG7IN5tdip9OHC
   iDRA/svsNYZCa1Wy6Ikdd6BeTWkLMLi6JgeLJKFCsIXZhoEUuK5QcS4RM
   iwk8/DF4XwZJ9VYXXpJM/p4quBWLGJa14WoDPbCLSCrrG6g5YnZM7dnX+
   cByDeZvKM6kMWgDSVXK3geJVfbye7tubSgMvkCwF8gb7G3l4lZHtb0gbL
   A==;
X-CSE-ConnectionGUID: Bxq8I16LRIOTKTAitb7KDw==
X-CSE-MsgGUID: ndG2PpQnTFib69WcfUi+CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88825953"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="88825953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:23:49 -0700
X-CSE-ConnectionGUID: FL5hsIgiSNKupCTAEOxmfQ==
X-CSE-MsgGUID: c7rXSVESQciadF9VCVvFKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="286969706"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Jul 2026 16:23:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkrtg-00000000TEk-1j7f;
	Fri, 17 Jul 2026 23:23:35 +0000
Date: Sat, 18 Jul 2026 07:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_abm.c:1590:48:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202607180739.2fo10qKo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af5e34a41cd607c00ef752e00331736570992354
commit: af3f2f5db2659a13c256d2fb096c473eb50412ef drm/amdgpu: Remove UML build exclusion from Kconfig
date:   9 weeks ago
config: um-randconfig-r133-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180739.2fo10qKo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180739.2fo10qKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: af3f2f5db265 ("drm/amdgpu: Remove UML build exclusion from Kconfig")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180739.2fo10qKo-lkp@intel.com/

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

254a47ce0c8a52 Lohita Mudimela 2026-03-10  1555  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1556  static void fill_backlight_transform_table(struct dmcu_iram_parameters params,
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1557  		struct iram_table_v_2 *table)
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1558  {
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1559  	unsigned int i;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1560  	unsigned int num_entries = NUM_BL_CURVE_SEGS;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1561  	unsigned int lut_index;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1562  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1563  	table->backlight_thresholds[0] = 0;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1564  	ASSERT(params.backlight_lut_array[0] <= 0xFFFF);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1565  	table->backlight_offsets[0] = (uint16_t)params.backlight_lut_array[0];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1566  	table->backlight_thresholds[num_entries-1] = 0xFFFF;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1567  	ASSERT(params.backlight_lut_array[params.backlight_lut_array_size - 1] <= 0xFFFF);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1568  	table->backlight_offsets[num_entries-1] =
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1569  		(uint16_t)params.backlight_lut_array[params.backlight_lut_array_size - 1];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1570  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1571  	/* Setup all brightness levels between 0% and 100% exclusive
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1572  	 * Fills brightness-to-backlight transform table. Backlight custom curve
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1573  	 * describes transform from brightness to backlight. It will be defined
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1574  	 * as set of thresholds and set of offsets, together, implying
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1575  	 * extrapolation of custom curve into 16 uniformly spanned linear
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1576  	 * segments.  Each threshold/offset represented by 16 bit entry in
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1577  	 * format U4.10.
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1578  	 */
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1579  	for (i = 1; i+1 < num_entries; i++) {
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1580  		lut_index = (params.backlight_lut_array_size - 1) * i / (num_entries - 1);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1581  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1582  		ASSERT(lut_index < params.backlight_lut_array_size);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1583  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1584  		unsigned int threshold_val = DIV_ROUNDUP((i * 65536), num_entries);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1585  		unsigned int offset_val = params.backlight_lut_array[lut_index];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1586  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1587  		ASSERT(threshold_val <= 0xFFFF);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1588  		ASSERT(offset_val <= 0xFFFF);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1589  
254a47ce0c8a52 Lohita Mudimela 2026-03-10 @1590  		table->backlight_thresholds[i] = cpu_to_be16((uint16_t)threshold_val);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1591  		table->backlight_offsets[i]    = cpu_to_be16((uint16_t)offset_val);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1592  	}
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1593  }
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1594  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1595  static void fill_backlight_transform_table_v_2_2(struct dmcu_iram_parameters params,
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1596  		struct iram_table_v_2_2 *table, bool big_endian)
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1597  {
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1598  	unsigned int i;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1599  	unsigned int num_entries = NUM_BL_CURVE_SEGS;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1600  	unsigned int lut_index;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1601  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1602  	table->backlight_thresholds[0] = 0;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1603  	ASSERT(params.backlight_lut_array[0] <= 0xFFFF);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1604  	table->backlight_offsets[0] = (uint16_t)params.backlight_lut_array[0];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1605  	table->backlight_thresholds[num_entries-1] = 0xFFFF;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1606  	ASSERT(params.backlight_lut_array[params.backlight_lut_array_size - 1] <= 0xFFFF);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1607  	table->backlight_offsets[num_entries-1] =
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1608  		(uint16_t)params.backlight_lut_array[params.backlight_lut_array_size - 1];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1609  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1610  	/* Setup all brightness levels between 0% and 100% exclusive
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1611  	 * Fills brightness-to-backlight transform table. Backlight custom curve
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1612  	 * describes transform from brightness to backlight. It will be defined
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1613  	 * as set of thresholds and set of offsets, together, implying
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1614  	 * extrapolation of custom curve into 16 uniformly spanned linear
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1615  	 * segments.  Each threshold/offset represented by 16 bit entry in
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1616  	 * format U4.10.
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1617  	 */
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1618  	for (i = 1; i+1 < num_entries; i++) {
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1619  		lut_index = DIV_ROUNDUP((i * params.backlight_lut_array_size), num_entries);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1620  		ASSERT(lut_index < params.backlight_lut_array_size);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1621  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1622  		unsigned int threshold_val = DIV_ROUNDUP((i * 65536), num_entries);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1623  		unsigned int offset_val = params.backlight_lut_array[lut_index];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1624  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1625  		ASSERT(threshold_val <= 0xFFFF);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1626  		ASSERT(offset_val <= 0xFFFF);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1627  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1628  		table->backlight_thresholds[i] = (big_endian) ?
254a47ce0c8a52 Lohita Mudimela 2026-03-10 @1629  			cpu_to_be16((uint16_t)threshold_val) : cpu_to_le16((uint16_t)threshold_val);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1630  		table->backlight_offsets[i] = (big_endian) ?
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1631  			cpu_to_be16((uint16_t)offset_val) : cpu_to_le16((uint16_t)offset_val);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1632  	}
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1633  }
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1634  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1635  static void fill_iram_v_2(struct iram_table_v_2 *ram_table, struct dmcu_iram_parameters params)
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1636  {
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1637  	unsigned int set = params.set;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1638  
254a47ce0c8a52 Lohita Mudimela 2026-03-10 @1639  	ram_table->min_abm_backlight =
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1640  			cpu_to_be16(params.min_abm_backlight);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1641  	ram_table->deviation_gain = 0xb3;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1642  
254a47ce0c8a52 Lohita Mudimela 2026-03-10 @1643  	ram_table->blRampReduction =
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1644  		cpu_to_be16(params.backlight_ramping_reduction);
254a47ce0c8a52 Lohita Mudimela 2026-03-10 @1645  	ram_table->blRampStart =
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1646  		cpu_to_be16(params.backlight_ramping_start);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1647  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1648  	ram_table->min_reduction[0][0] = min_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1649  	ram_table->min_reduction[1][0] = min_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1650  	ram_table->min_reduction[2][0] = min_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1651  	ram_table->min_reduction[3][0] = min_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1652  	ram_table->min_reduction[4][0] = min_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1653  	ram_table->max_reduction[0][0] = max_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1654  	ram_table->max_reduction[1][0] = max_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1655  	ram_table->max_reduction[2][0] = max_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1656  	ram_table->max_reduction[3][0] = max_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1657  	ram_table->max_reduction[4][0] = max_reduction_table[abm_config[set][0]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1658  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1659  	ram_table->min_reduction[0][1] = min_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1660  	ram_table->min_reduction[1][1] = min_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1661  	ram_table->min_reduction[2][1] = min_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1662  	ram_table->min_reduction[3][1] = min_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1663  	ram_table->min_reduction[4][1] = min_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1664  	ram_table->max_reduction[0][1] = max_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1665  	ram_table->max_reduction[1][1] = max_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1666  	ram_table->max_reduction[2][1] = max_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1667  	ram_table->max_reduction[3][1] = max_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1668  	ram_table->max_reduction[4][1] = max_reduction_table[abm_config[set][1]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1669  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1670  	ram_table->min_reduction[0][2] = min_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1671  	ram_table->min_reduction[1][2] = min_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1672  	ram_table->min_reduction[2][2] = min_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1673  	ram_table->min_reduction[3][2] = min_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1674  	ram_table->min_reduction[4][2] = min_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1675  	ram_table->max_reduction[0][2] = max_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1676  	ram_table->max_reduction[1][2] = max_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1677  	ram_table->max_reduction[2][2] = max_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1678  	ram_table->max_reduction[3][2] = max_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1679  	ram_table->max_reduction[4][2] = max_reduction_table[abm_config[set][2]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1680  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1681  	ram_table->min_reduction[0][3] = min_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1682  	ram_table->min_reduction[1][3] = min_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1683  	ram_table->min_reduction[2][3] = min_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1684  	ram_table->min_reduction[3][3] = min_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1685  	ram_table->min_reduction[4][3] = min_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1686  	ram_table->max_reduction[0][3] = max_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1687  	ram_table->max_reduction[1][3] = max_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1688  	ram_table->max_reduction[2][3] = max_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1689  	ram_table->max_reduction[3][3] = max_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1690  	ram_table->max_reduction[4][3] = max_reduction_table[abm_config[set][3]];
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1691  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1692  	ram_table->bright_pos_gain[0][0] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1693  	ram_table->bright_pos_gain[0][1] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1694  	ram_table->bright_pos_gain[0][2] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1695  	ram_table->bright_pos_gain[0][3] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1696  	ram_table->bright_pos_gain[1][0] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1697  	ram_table->bright_pos_gain[1][1] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1698  	ram_table->bright_pos_gain[1][2] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1699  	ram_table->bright_pos_gain[1][3] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1700  	ram_table->bright_pos_gain[2][0] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1701  	ram_table->bright_pos_gain[2][1] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1702  	ram_table->bright_pos_gain[2][2] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1703  	ram_table->bright_pos_gain[2][3] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1704  	ram_table->bright_pos_gain[3][0] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1705  	ram_table->bright_pos_gain[3][1] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1706  	ram_table->bright_pos_gain[3][2] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1707  	ram_table->bright_pos_gain[3][3] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1708  	ram_table->bright_pos_gain[4][0] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1709  	ram_table->bright_pos_gain[4][1] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1710  	ram_table->bright_pos_gain[4][2] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1711  	ram_table->bright_pos_gain[4][3] = 0x20;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1712  	ram_table->bright_neg_gain[0][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1713  	ram_table->bright_neg_gain[0][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1714  	ram_table->bright_neg_gain[0][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1715  	ram_table->bright_neg_gain[0][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1716  	ram_table->bright_neg_gain[1][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1717  	ram_table->bright_neg_gain[1][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1718  	ram_table->bright_neg_gain[1][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1719  	ram_table->bright_neg_gain[1][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1720  	ram_table->bright_neg_gain[2][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1721  	ram_table->bright_neg_gain[2][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1722  	ram_table->bright_neg_gain[2][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1723  	ram_table->bright_neg_gain[2][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1724  	ram_table->bright_neg_gain[3][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1725  	ram_table->bright_neg_gain[3][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1726  	ram_table->bright_neg_gain[3][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1727  	ram_table->bright_neg_gain[3][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1728  	ram_table->bright_neg_gain[4][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1729  	ram_table->bright_neg_gain[4][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1730  	ram_table->bright_neg_gain[4][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1731  	ram_table->bright_neg_gain[4][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1732  	ram_table->dark_pos_gain[0][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1733  	ram_table->dark_pos_gain[0][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1734  	ram_table->dark_pos_gain[0][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1735  	ram_table->dark_pos_gain[0][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1736  	ram_table->dark_pos_gain[1][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1737  	ram_table->dark_pos_gain[1][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1738  	ram_table->dark_pos_gain[1][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1739  	ram_table->dark_pos_gain[1][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1740  	ram_table->dark_pos_gain[2][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1741  	ram_table->dark_pos_gain[2][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1742  	ram_table->dark_pos_gain[2][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1743  	ram_table->dark_pos_gain[2][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1744  	ram_table->dark_pos_gain[3][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1745  	ram_table->dark_pos_gain[3][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1746  	ram_table->dark_pos_gain[3][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1747  	ram_table->dark_pos_gain[3][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1748  	ram_table->dark_pos_gain[4][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1749  	ram_table->dark_pos_gain[4][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1750  	ram_table->dark_pos_gain[4][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1751  	ram_table->dark_pos_gain[4][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1752  	ram_table->dark_neg_gain[0][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1753  	ram_table->dark_neg_gain[0][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1754  	ram_table->dark_neg_gain[0][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1755  	ram_table->dark_neg_gain[0][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1756  	ram_table->dark_neg_gain[1][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1757  	ram_table->dark_neg_gain[1][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1758  	ram_table->dark_neg_gain[1][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1759  	ram_table->dark_neg_gain[1][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1760  	ram_table->dark_neg_gain[2][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1761  	ram_table->dark_neg_gain[2][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1762  	ram_table->dark_neg_gain[2][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1763  	ram_table->dark_neg_gain[2][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1764  	ram_table->dark_neg_gain[3][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1765  	ram_table->dark_neg_gain[3][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1766  	ram_table->dark_neg_gain[3][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1767  	ram_table->dark_neg_gain[3][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1768  	ram_table->dark_neg_gain[4][0] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1769  	ram_table->dark_neg_gain[4][1] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1770  	ram_table->dark_neg_gain[4][2] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1771  	ram_table->dark_neg_gain[4][3] = 0x00;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1772  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1773  	ram_table->iir_curve[0] = 0x65;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1774  	ram_table->iir_curve[1] = 0x65;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1775  	ram_table->iir_curve[2] = 0x65;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1776  	ram_table->iir_curve[3] = 0x65;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1777  	ram_table->iir_curve[4] = 0x65;
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1778  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1779  	//Gamma 2.4
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1780  	ram_table->crgb_thresh[0] = cpu_to_be16(0x13b6);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1781  	ram_table->crgb_thresh[1] = cpu_to_be16(0x1648);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1782  	ram_table->crgb_thresh[2] = cpu_to_be16(0x18e3);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1783  	ram_table->crgb_thresh[3] = cpu_to_be16(0x1b41);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1784  	ram_table->crgb_thresh[4] = cpu_to_be16(0x1d46);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1785  	ram_table->crgb_thresh[5] = cpu_to_be16(0x1f21);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1786  	ram_table->crgb_thresh[6] = cpu_to_be16(0x2167);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1787  	ram_table->crgb_thresh[7] = cpu_to_be16(0x2384);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1788  	ram_table->crgb_offset[0] = cpu_to_be16(0x2999);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1789  	ram_table->crgb_offset[1] = cpu_to_be16(0x3999);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1790  	ram_table->crgb_offset[2] = cpu_to_be16(0x4666);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1791  	ram_table->crgb_offset[3] = cpu_to_be16(0x5999);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1792  	ram_table->crgb_offset[4] = cpu_to_be16(0x6333);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1793  	ram_table->crgb_offset[5] = cpu_to_be16(0x7800);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1794  	ram_table->crgb_offset[6] = cpu_to_be16(0x8c00);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1795  	ram_table->crgb_offset[7] = cpu_to_be16(0xa000);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1796  	ram_table->crgb_slope[0]  = cpu_to_be16(0x3147);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1797  	ram_table->crgb_slope[1]  = cpu_to_be16(0x2978);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1798  	ram_table->crgb_slope[2]  = cpu_to_be16(0x23a2);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1799  	ram_table->crgb_slope[3]  = cpu_to_be16(0x1f55);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1800  	ram_table->crgb_slope[4]  = cpu_to_be16(0x1c63);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1801  	ram_table->crgb_slope[5]  = cpu_to_be16(0x1a0f);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1802  	ram_table->crgb_slope[6]  = cpu_to_be16(0x178d);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1803  	ram_table->crgb_slope[7]  = cpu_to_be16(0x15ab);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1804  
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1805  	fill_backlight_transform_table(
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1806  			params, ram_table);
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1807  }
254a47ce0c8a52 Lohita Mudimela 2026-03-10  1808  

:::::: The code at line 1590 was first introduced by commit
:::::: 254a47ce0c8a52ff78a60f92a13b56db69f69096 drm/amd/display: Separate ABM functions into dedicated power_abm.c file

:::::: TO: Lohita Mudimela <lohita.mudimela@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
