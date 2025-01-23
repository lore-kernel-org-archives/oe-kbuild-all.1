Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AEA1CF5F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 22:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737671083; cv=none; b=gopLXyqoDJWwPH9/pBtz4vK6tKyAMbuY+hH4e+8QnM2VuIEIdze2bFazrMD4Qv+sVTwd2qKjdSlkGw9sYD67X4P1kuXOhBtD0Vz7L2zM+FW3GDOWBre/pAOFlev26jJe2AgcV5WymJfb7v+sxDngP4b9PBXi9KpWvPlu7ybVHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737671083; c=relaxed/simple;
	bh=iHdFEJh/Yk2Usw907515qZrp4XNRO19SthZ3x06M/Os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=li+XJaRYdGsclGgb75iRmrspziG2OPNQku5uWP9yPyBERZdHyqYqsqCvWrhNPtZ1IzRCwsj0n1k6u6qxbkszc12vjI/KtQC7kEOfzWcI9NOwCRCC5mjOT8Mr/HxnfyJd2xQXvhywQ0cZoOzWPuJ9273GLD7gX8RIvtg6fJJ0Uw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4WEnmX8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4WEnmX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737671080; x=1769207080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHdFEJh/Yk2Usw907515qZrp4XNRO19SthZ3x06M/Os=;
  b=A4WEnmX83yCdQojjoeovUAa5hvID9FPllQBcLIF+LdHpXs0hz3yL1KpA
   aqjbb5sFxKU2IRjsfHElRvV2e4Nba0FirbnH5xW3F+jGXzgBvCpxy3EPu
   Y6x3GvJTBo2oMw3dxigtbE3pRGT+ifkx0Rc1IS1vMchB8wdd/oLnvJh7N
   K73X6quVdaNuv4C3ZqbL/niu6S0svNbYn9AJpJaz8pmE5j6T+E6nxLFp1
   KF9n2TUdg5pUPdflJCb6Wj/yV+7PzyBtZoWnQy/MPVthfntDI1OxVYRai
   drMB5qQehp67zVpsPIM9lAK5V8oa6Wlf34IIz8KjgD+jAeYw8k6cO0iPs
   A==;
X-CSE-ConnectionGUID: AhDpAaIxRxOVuFvnZ3kWhA==
X-CSE-MsgGUID: ZU2w76+KTZGKZfaJFaW54Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38344142"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38344142"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 14:24:40 -0800
X-CSE-ConnectionGUID: AhYiWEvwSmmN5mRNvU9D7A==
X-CSE-MsgGUID: HyoESF7IRMa7v1oiC7A24Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144833755"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2025 14:24:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb5cp-000bn4-32;
	Thu, 23 Jan 2025 22:24:35 +0000
Date: Fri, 24 Jan 2025 06:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: kismet: WARNING: unmet direct dependencies detected for HUGETLBFS
 when selected by PPC_8xx
Message-ID: <202501240611.LDmD2nkj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
date:   2 years, 4 months ago
config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240611.LDmD2nkj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240611.LDmD2nkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240611.LDmD2nkj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
   WARNING: unmet direct dependencies detected for HUGETLBFS
     Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
     Selected by [y]:
     - PPC_8xx [=y] && <choice>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
