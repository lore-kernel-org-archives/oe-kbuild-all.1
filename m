Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20A01662F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735392953; cv=none; b=E8Uiw5ZhnJ5H6DqkyCFlwwazg3b+LKe+bITBIXfgM/I48ErwMIQt3gk282/lOhyT/4inZgYOGt0TGkGumsz1vMdlFjTCClb/V14YXyAr35fLVg3GUHKeAqvopw3qVAekDzS7HxFd6DGNClkQjC7KB8TfdLVd7Hf0vnVFVckp0GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735392953; c=relaxed/simple;
	bh=LPBXRaBM1Sdet7XV8VAv1pL75k47/QfJ+3beOd2lvVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t0RUvgXM/y0lnrRmi1/ZUh4Tj4AYfXqr1i0arOAA6OZIW5DnlzZwQvdKl7PdAVujB22rKLZYVK6QHa9en/amz/ED3lRZWWKUc+fDWOTbnNoIOSiC8Ejz0AYMKwX/WcEyJJdGUeH6FBGt097Guf1jeUOC+5aF7ZOal6TZlCGGtwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9mKa983; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9mKa983"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735392951; x=1766928951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LPBXRaBM1Sdet7XV8VAv1pL75k47/QfJ+3beOd2lvVU=;
  b=U9mKa9835PSMJKhzHcC3oMxPFEMlHEPRKm31P+l2OMzk+p6JuzpdLkIC
   7uxwPCHof4+zzUQh1lXc+ZOLcX9bfyvo4VbZnhOSEdGxAjCnIFzPpDlsS
   VPetzQ44RyxQhcpdSGxYzOlX6Ukm2Z+AnUiuCrE2t0qK0wCvn9b7SID1D
   jzTXJ+hniB2tRWcHv5VhdT/ZEH4FCEThfm265eTTvWZIPFI9z1sieDDpT
   r3f77o6hPMaX5YTLjsIbarflkxkF2p2Gv8PlHW18GVx78sMWEHas14SK5
   RMc1+oO4kUECUZN59EjS8j0bU5w+i0SJNGZV2XHvJuKRUat+eXpOg43ex
   g==;
X-CSE-ConnectionGUID: elhTkC8ERz+3W9LcmPNKng==
X-CSE-MsgGUID: 93v3UpUGTcugMrMflT75AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35469161"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="35469161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 05:35:50 -0800
X-CSE-ConnectionGUID: qpwdeXuIRSGBMEi5WhtQrA==
X-CSE-MsgGUID: U+eId4VRTDGhsNVEmrsXkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100856395"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Dec 2024 05:35:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRWyp-00045U-0E;
	Sat, 28 Dec 2024 13:35:47 +0000
Date: Sat, 28 Dec 2024 21:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko]
 undefined!
Message-ID: <202412282326.0DSE4HbR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDIO drivers into a new subdirectory
date:   4 years, 4 months ago
config: sh-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241228/202412282326.0DSE4HbR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412282326.0DSE4HbR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412282326.0DSE4HbR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
