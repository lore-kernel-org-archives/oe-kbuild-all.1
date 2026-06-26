Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE49119D07A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482529; cv=none; b=JwXfVG4r8Ss/A5lVnuLsTOeceyati0puU1MGdqSTASLgwgqYAxwaSBetRg6gIsgPoT9Fti+mEuQKeJvTFjsWhRAVIkX2WeZFdGGa1G/We8TyqB0CLNbdFLteq5kTWg18xCZYlRnmyQjYVv4UGAOpr86B8J+a+Nihs2QaZiC0OKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482529; c=relaxed/simple;
	bh=yzbubqNZ/5KS7QzrGlml3UXKW+XHuMPLPhaWE41YJY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lMaQOTVkbdXzO0hpmgZyhKGmjXyh/gjCUPCaUyQiJDVJQytMLb+gcXsjWcF5C5gDnDKhc/47TAdH7+voCbyLw9F2rOGSY/YksBbw8H51lb9i7lw8MdXcgo6jCUylZpBiNUcPbOBL7VIATKGSXvkE+ookh3BUnAoT1qkunFqtzEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTylQLKT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTylQLKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782482528; x=1814018528;
  h=date:from:to:cc:subject:message-id;
  bh=yzbubqNZ/5KS7QzrGlml3UXKW+XHuMPLPhaWE41YJY8=;
  b=XTylQLKTwkh4f7rEtAqgpiKUpbNf6btlBKnYCUc1pmz3Pf9uG/fEO8SK
   nilVWU4Itt8o9Um9iUFQqrcEKEWLglrlZSa+k7JS6QFgCf2kao5U0mMaC
   fS+wOObX/zjBDNaiOA0ChebZwkfdqsabVp7CqZD1xbDKHRWPgdQQTL1FW
   zpcrqRNeatX7Zv8ifFmfDoisWps9kFLBmZpAlhtvcqIpQQZoxpuurhGhb
   abz6eG9+n8FF6CN2RH0+IM4vNR4qPCE4Bqi9HjSuiUpe3AvtZR0e/uG5s
   MqvpXrYUDU13vJV6QKdY8VsN3NjLykNAA22ua3mZCLzbQ00jsxOrOK4Vv
   A==;
X-CSE-ConnectionGUID: uLZURw1QTl6tHCNVrqjj+g==
X-CSE-MsgGUID: fIgl6cXHRXqtANpp12vt3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="70795115"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="70795115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 07:02:07 -0700
X-CSE-ConnectionGUID: rocNLrGcReSU6kmrk92cTw==
X-CSE-MsgGUID: Coj30XlDRQmooumuAtDIRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="250944673"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Jun 2026 07:02:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd77p-0000000058L-3eqU;
	Fri, 26 Jun 2026 14:02:00 +0000
Date: Fri, 26 Jun 2026 22:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: 
 drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c:25:32: error:
 'struct rvu' has no member named 'rvu_dbg'; did you mean 'rvu_dl'?
Message-ID: <202606262158.Dvc57sU5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
commit: 1396771b0b7741d517d591cfb63333d3f97a8f6d octeontx2-af: npc: cn20k: Index management
date:   4 months ago
config: s390-randconfig-r134-20260626 (https://download.01.org/0day-ci/archive/20260626/202606262158.Dvc57sU5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606262158.Dvc57sU5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1396771b0b77 ("octeontx2-af: npc: cn20k: Index management")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606262158.Dvc57sU5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c: In function 'npc_cn20k_debugfs_deinit':
>> drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c:25:32: error: 'struct rvu' has no member named 'rvu_dbg'; did you mean 'rvu_dl'?
     debugfs_remove_recursive(rvu->rvu_dbg.npc);
                                   ^~~~~~~
                                   rvu_dl


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
