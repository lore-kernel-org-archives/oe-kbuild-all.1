Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD71021B192
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764857115; cv=none; b=HwckREDW63V4kt7xg/+wazjcUAJz64idbOSAzBVaKqxVHYYl5+0OcqADxAuR0MtIg9GCnLc3aFWMcG/zIDeSSXGiRAfg+Iy6HWrbZ6m/Kum2YCtSum8ku9KnnoawAUsmHXZ4NhtBm9mSN/a8TaoR3+ylprdziOl83d9foggWxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764857115; c=relaxed/simple;
	bh=wE1ClXJ+ljXxwYZ0HTm73Qt+YVL1puuWBG+zGO32N5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMZ+nGeR+EuFwCI9vA2SCD9lTz80MWs1RhlD/lEVqWVfSGPzmilthnlfOSceQ1qasA74ywXGciv3CKbZ8kyh14Hv7GU4DTAzyWNopp9M+Ipuj+d5Cb9yK4NuOeXOT1n7FIx4t00/v9K56LPQstXoVgvIUbUiZtxzNPvPvDZ4M/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLNv53ZU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLNv53ZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764857113; x=1796393113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wE1ClXJ+ljXxwYZ0HTm73Qt+YVL1puuWBG+zGO32N5c=;
  b=hLNv53ZUm5+VNtphlteXLeqaSax0MXB1zT3/RIlwjJgCDUZ2iyVbsx0u
   2DitcfTyXYEyO4micWbOM174dn8byl01iFzuJgLZ64256FOF57oEo3Xco
   Ka/sNrn1ixUJA0jUHwvXcbC5ZF0Ur6LRQ6q7dTPFhadtJrXDGPaF10RuA
   4//vhFvJyA8B2vwXIvlXoH7LBPDVwrxVcn25mjFYBH8+XWO0ObkCKNcpM
   58xpBR1IY5gq9NXOC0hiouQAduGZNVj101LrnS63yk3Wpz5CBnTl9UqvD
   qME2iN/DkCrQwie3eLi4fJH0QFB70yXYCelSV3kGAExMkGCs8w7coNLnu
   A==;
X-CSE-ConnectionGUID: kpyV6qJdTDeSinGZ6iRIlg==
X-CSE-MsgGUID: bSqgLeuhTVKcVxuewIxUuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78341280"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="78341280"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 06:05:12 -0800
X-CSE-ConnectionGUID: LQwYcxQCQuusOJPSkcXsOA==
X-CSE-MsgGUID: LZl80mGpRaSq87qhPxwrKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="200117085"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2025 06:05:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR9xE-00000000DqH-04fN;
	Thu, 04 Dec 2025 14:05:08 +0000
Date: Thu, 4 Dec 2025 22:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:compound_head 3/8] Warning: mm/hugetlb_vmemmap.c:312 function
 parameter 'vmemmap_head' not described in 'vmemmap_remap_free'
Message-ID: <202512042202.sqxNvupn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git compound_head
head:   fc92cc608d991f2985ffdcc5711ded4886005ea5
commit: 935c04c0d8b3d599e0af395373911e60d113a3d9 [3/8] mm/hugetlb: Refactor code around vmemmap_walk
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251204/202512042202.sqxNvupn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512042202.sqxNvupn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512042202.sqxNvupn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/hugetlb_vmemmap.c:312 function parameter 'vmemmap_head' not described in 'vmemmap_remap_free'
>> Warning: mm/hugetlb_vmemmap.c:312 function parameter 'vmemmap_tail' not described in 'vmemmap_remap_free'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
