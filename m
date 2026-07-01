Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743313B5E08
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 07:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890087; cv=none; b=LV3YlEby7HfCvpSjvtPH6uWHs4B5YbF5q1N/hD5wtJxzUv1OiR+4pKfg82fJravoI3xJ+/CSLyPuk1YtrroZ/TzfPFOpjsrrGWiqZ+77N0o/RXW9JioZGRhqBBWtzn9jihmi4mhQziDnhA+6vbmB8fEDUt/S4KurCY2/DNWNATs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890087; c=relaxed/simple;
	bh=z504ynNl5Azm9aWPePAxUOhOBcD9gsXg9OLzjrBvD3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SGfKrJnGQb2TyfXXdFEwzXzyuhD6zVwHJi8za1nJ3+TBE8POUQ8Nf9hPmhUODo+wMAY5HrUbTe3G3tRPSFj52FIvUcVBP8Avv3sQbQnoPrs/AW/UuERfI1GTGGjJp5gNjoFjJMI+jlUxT9Ix4a0Z+YSCXJaBGTJVD9MO8m/YAl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5GknAO3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5GknAO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782890081; x=1814426081;
  h=date:from:to:cc:subject:message-id;
  bh=z504ynNl5Azm9aWPePAxUOhOBcD9gsXg9OLzjrBvD3Q=;
  b=H5GknAO3P/bmx+tzuCc4J6lAVr/ROHy8/jNnpa3YvDD4Yxr8PkCrZ9bM
   5u5BpKxht01fwGnudwj5MN0GGnXVFCrtjp2C1qFuo65WnoFD36EfZvH/r
   WDnLN5Cv4Ou7D7pXbEupOEjh3JY4rw6NRrDur3Fg0pNIY8s3C33mxQ8JM
   l0FNOucy4dcRjU+ofPu4ID2QompEDKa4XdRND3t8dBoauDWoUZ2zDofuD
   2WLH+cRH1766itJLxzoI9iTS8+5RJf5HPYLW5a+pFvOAozgOw1qlN979U
   5S3OEj6hxULMnVssPpL5q/MIwA1MNdQDJ57IH4qs/t4KivwfkcnOHbFsH
   A==;
X-CSE-ConnectionGUID: m3HfKNYKQ2C1fWW0UJZ8Og==
X-CSE-MsgGUID: +c9gwG0iSMCbWENqhsez/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="71137234"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="71137234"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 00:14:40 -0700
X-CSE-ConnectionGUID: pOrn6eo1RYesWHP4Bag1WA==
X-CSE-MsgGUID: fUgdHdGaSpKTx96MtXlWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="256064048"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 00:14:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wep8z-0000000091d-2Wj0;
	Wed, 01 Jul 2026 07:14:06 +0000
Date: Wed, 01 Jul 2026 15:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 141/160] ERROR: modpost:
 "mtk_xfi_tphy_valid_ctle" [drivers/net/pcs/pcs-mtk-usxgmii.ko] undefined!
Message-ID: <202607011506.iBRK5CrF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: 404f270f44b7a8b39addf2faa1f448827f25f392 [141/160] net: pcs: mtk-usxgmii: check link status and phy ctle before reset
config: x86_64-randconfig-r113-20260630 (https://download.01.org/0day-ci/archive/20260701/202607011506.iBRK5CrF-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011506.iBRK5CrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011506.iBRK5CrF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mtk_xfi_tphy_valid_ctle" [drivers/net/pcs/pcs-mtk-usxgmii.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
