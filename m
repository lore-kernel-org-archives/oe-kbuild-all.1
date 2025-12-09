Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1E122A4E1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291931; cv=none; b=Y8qbVWv4DYjXXin79JCP8sKbE4jsZjNVhjl7gh/V3afStxKo2gZmG737GNezyf/NzsAL0ARKhtioTZ1csmdngNCvWINbDF6CGAe5fe96QKPhUZh4cXuM6iLTlwVFs8NRYMYgHlWeZmmCfnJEuPYM22RAKoFXeZvScj0aErsnfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291931; c=relaxed/simple;
	bh=poTJg3L6eek80MApjoPYCmYlTi7VPqk8gkLYG+ik+50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FaTjjQIzhCVLYWxDfsnDqoOkA3rXN5REj9HLXi1pZm/lLjtEKRVm8Xmb1yRzTwyOBYuzhO0azAQYcJD6n5AcrTkfbj5S8YDedwWn1dgNp7rYFW4/+kVRdB+k+q/ocsz9uSEllGIa//gf+LigvG9o0CAsMjYUo9/M1XvxXopI1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOIc0SgU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOIc0SgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765291929; x=1796827929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=poTJg3L6eek80MApjoPYCmYlTi7VPqk8gkLYG+ik+50=;
  b=WOIc0SgUuQKGFqz3wRAevD6ODD+LTtecz0BOlQkeBsUM0sC6XO29E80C
   pBAyfFR9/WVrT2xBFdKMlPAwSQo1n0fEEIFTOx+U8bYSSBZ47treL/0S6
   FHfSdMG4ipyGgm7NYLTRf5FQesA9KXwLSLqvyD7w5xtuOPbrWic7apPcS
   3BS/XVOL6K17TxwPqamg6cxltELl6wivf4eP+l7Xr11QE/EJ0j5MKZuzH
   7Qm7oeteqdCB0td1gjaI0z74KqrLp8KlYO8GAcr3TKEwJlRhL4iM0VmSY
   g0bc4RZbsFgmnn6V1Rs7xi041pejit6ga1z5AIVwtNjUiojV3/peCyCW0
   A==;
X-CSE-ConnectionGUID: iDD3hJPiQ3+mXdvq52fIRQ==
X-CSE-MsgGUID: y1wEAjuYRwStcZCWkn+Vbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67417052"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67417052"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:52:09 -0800
X-CSE-ConnectionGUID: SXqI+PTxQ5qAXmUSOSj8fg==
X-CSE-MsgGUID: gwV3mPrXTK2RDAQmg+9xzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="196249273"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Dec 2025 06:52:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSz4P-000000000HZ-1JWT;
	Tue, 09 Dec 2025 14:52:05 +0000
Date: Tue, 9 Dec 2025 15:52:05 +0100
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
Message-ID: <202512091536.NKcEthFL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: f673055a46784ccea04465b9213e999f7bc5187e drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
date:   1 year, 3 months ago
config: um-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_LDB-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091536.NKcEthFL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091536.NKcEthFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091536.NKcEthFL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
