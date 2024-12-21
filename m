Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38A913C9DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734796617; cv=none; b=FyKlmz0sYsYBjZ5YMLCMB0em9qmlPENrIiK7oQdY/JRmygb4qzJLQFK+iZ+h54e5hElNPJ5KsGrk1YIKWVzDJvpAFzQyCOPKw6s6T5a/7Xxwz8qtK7zPiAJ4CYHAyIk07UmTACKuZ1xiwYgc+RD+KiyvGLCD3iRzauweHaKYTbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734796617; c=relaxed/simple;
	bh=JmKQlyNuRPH4TKWU6S2LHMQ869zM/FaOTb6HHYFuZDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kO4/Wbd3xNGl6FPkdw2eZ1plOE50HtAuMsDhghF+tzO6ZCeDJelwnk/p8o8zvTKv77w2ydMzT6NWgg/AZz4kHE4Mrd+AcpwmH1uj3+U+Hpmxk2F9qauPPMVmMv+gLO5u2GyuoCpYG7ahQAuI1cqG1ohZ4/Y5lsVvbYQa7XXhqgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhgkvNBP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhgkvNBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734796616; x=1766332616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JmKQlyNuRPH4TKWU6S2LHMQ869zM/FaOTb6HHYFuZDU=;
  b=DhgkvNBPQBBPLTD8hIAhWesyagiGpzLvPSdjmal62qWOprQ4ASHThn1v
   QGdUkySbYIjHXDtlPNSUIrL5ZcihybCsWGWcM+ckeOzapj6qhDqo+V3C2
   LcNFcETmEwTDBqopMxbTpFg3+IZbAbXOmK+rZasgPSXK6tp/1uJHHwIra
   urjRmpglhDk2nbfohYfgNF8wRQIqL6gHUo3HEVYRcX7lCGv9KP1ZyvxXX
   FemV6CSLDGzhwBvaSPDo9LHheke66TEXB37CtxNbM0fP1HIFP8oW8F/2v
   fRxpa+VHQktUCb33gAlFH5QXLkCg1eMUdMwVw7EQwme8gs9FxSBtPoiaz
   A==;
X-CSE-ConnectionGUID: TNdHkf1TSOy3noPDWS3jBw==
X-CSE-MsgGUID: 1kpl3qFBSc+nySXEZh8NiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35469155"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="35469155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 07:56:56 -0800
X-CSE-ConnectionGUID: W6nZE96uRkmmPvy6920QYA==
X-CSE-MsgGUID: c5dwDHOwRTCJU2k7P49lQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="103766076"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Dec 2024 07:56:54 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP1qW-0002GA-0S;
	Sat, 21 Dec 2024 15:56:52 +0000
Date: Sat, 21 Dec 2024 23:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-mt7988upstream 51/53]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:32:10: fatal error:
 'mtk_eth_dbg.h' file not found
Message-ID: <202412212327.4MlRicBb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-mt7988upstream
head:   7ddebaebf72c883cdbf2abc58186db4d6fe48ae4
commit: 995893b54b03fb8fe9eda9182116572d6e105190 [51/53] debugfs-patch from mtk sdk
config: arm-randconfig-004-20241221 (https://download.01.org/0day-ci/archive/20241221/202412212327.4MlRicBb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212327.4MlRicBb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212327.4MlRicBb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:32:10: fatal error: 'mtk_eth_dbg.h' file not found
      32 | #include "mtk_eth_dbg.h"
         |          ^~~~~~~~~~~~~~~
   1 error generated.


vim +32 drivers/net/ethernet/mediatek/mtk_eth_soc.c

    30	
    31	#include "mtk_eth_soc.h"
  > 32	#include "mtk_eth_dbg.h"
    33	#include "mtk_wed.h"
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
