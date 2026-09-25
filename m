Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE28484225
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328397; cv=none; b=WY356FnOHC2NFQTRypUYpHDKoq1b/bYAznOhSsgHlDytVOkUp4K8Vx7CVB0VaTMqNfF3T6b4YVhU9q80ZrUGaDVVn/tHnCHr9xnbJamT7ZuIlXL/cUoZV3ymyIkt4bo9eXORUb/noac5cZz479BLLZArQ3dFFvXnb1tZaHApr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328397; c=relaxed/simple;
	bh=jaeUhKmdaL0Q8wyCM6K3w/b/KJCOUoiUciUDXJH5xe4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XLPUd/XTIIpLwx+80ROdGrb0C27oD0/i3pm+wHibDGqQwkNoOtiGM1H6+BlkCZstyJCQdrXx3+NIvriOhD925O0zkIHVNU6iKNa23I88ATJ0JWNzvcNRmYzLAnTG5FjMRvnVltKOrkK7hQv1tW8VxIrCNL94z45sPPN26h14j+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IL3ztmGs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IL3ztmGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790328394; x=1821864394;
  h=date:from:to:cc:subject:message-id;
  bh=jaeUhKmdaL0Q8wyCM6K3w/b/KJCOUoiUciUDXJH5xe4=;
  b=IL3ztmGsfMZAMn8yqok0kouZmgVx/hNFMKiQs83E2YJlOqz/SqhKo6b2
   hkXGyPxShNp+D4Y8N8FJUB9nKm1YDOlF6+3V76WWROagqQftC1d6vAKx6
   GJI6C6Z3zZe+xL4lCf00zeiSgGw/8LMxgTn3nlPHgWqoU+74T6iEOxxZg
   KylxRcX8a6aVTeogW9tKrEqlyVc9EGek8yNmgdf0n71i7rAHiw/41/Ndb
   212aLq8j2KM1OK+08dRNrAsZG+SRnRVk12Yk6nb66C7Tj9TgTeWsR4uzb
   DCehdV/cOEF55zBM6KEqpRa96Yf4sKHEjVFZRfVtKIHH1BVgOCe5uXKzr
   Q==;
X-CSE-ConnectionGUID: X69OrHDcRL+tNKEbFDjY7g==
X-CSE-MsgGUID: 3mx1xmfAQvqj8hQoLSvT0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94930047"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="94930047"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:26:32 -0700
X-CSE-ConnectionGUID: uRUXLwfPT/OmI6I4pQyZ1A==
X-CSE-MsgGUID: dTLw1DRgTDKAmfYgTxmoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273842045"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2026 02:26:31 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA2CK-000000000fi-0n9w;
	Fri, 25 Sep 2026 09:26:28 +0000
Date: Fri, 25 Sep 2026 11:25:35 +0200
From: kernel test robot <lkp@intel.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: 
 drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c:25:32: error:
 'struct rvu' has no member named 'rvu_dbg'; did you mean 'rvu_dl'?
Message-ID: <202609251130.hAOAXoIz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ratheesh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: 1396771b0b7741d517d591cfb63333d3f97a8f6d octeontx2-af: npc: cn20k: Index management
date:   7 months ago
config: s390-randconfig-r2103-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251130.hAOAXoIz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251130.hAOAXoIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1396771b0b77 ("octeontx2-af: npc: cn20k: Index management")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251130.hAOAXoIz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c: In function 'npc_cn20k_debugfs_deinit':
>> drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c:25:32: error: 'struct rvu' has no member named 'rvu_dbg'; did you mean 'rvu_dl'?
      25 |  debugfs_remove_recursive(rvu->rvu_dbg.npc);
         |                                ^~~~~~~
         |                                rvu_dl


vim +25 drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c

    22	
    23	void npc_cn20k_debugfs_deinit(struct rvu *rvu)
    24	{
  > 25		debugfs_remove_recursive(rvu->rvu_dbg.npc);
    26	}
    27	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
