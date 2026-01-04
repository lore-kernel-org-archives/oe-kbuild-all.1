Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1F32798F3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767564391; cv=none; b=B3V13QuxUE1gl9FQhx0D+TgufFM81pi+GnmuZRakvsA19PJy5hid76fDeCq4nUfqzxZ1jwDT2ixBirTo7RQPnHZcEdDat5gLqLpe+2viZlEA0pe8dldPLwtydPTIsfr/bglum+BhoVJ/dqs+RsCs8egohwnviI+Ykx4LtDCZMSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767564391; c=relaxed/simple;
	bh=MIiMevQn67+8G7ZqKviFZYvRUBMtTuIDD+yTlMgYbEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ViqgBkgQK2npaCxRtT8/KT3qPlQ1CjjDaxZoXt9gIet/8HVpTaUglfIjRlVunmiiFW5nRj5o6XJAb03OA54SKS30916w/82xnAxouIbHbSoDzEIdz7AIGg5f7d9/QSTM3Of+af0uj1rfpLjJ+xxxLaCwlPFKJW/sshdbfCRDOZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAdCUeIa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAdCUeIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767564388; x=1799100388;
  h=date:from:to:cc:subject:message-id;
  bh=MIiMevQn67+8G7ZqKviFZYvRUBMtTuIDD+yTlMgYbEY=;
  b=nAdCUeIaOsnn1nJ4hdesPXpA1LP7tfB/GCOjMlBh/ZHQ10ijihcvmz0J
   M7WjSRQdIPblGZjIQ7hUsUiBP9BC/YG7Yi77aw3BMXghdibjP6phr0AMT
   2Qr/loJSN/wnwglCvGEsPRzznJ24mNa3Xhe1HILsokQjb5Zc3HvZMi/Gd
   EGbWTqdGOTgVjf3rlKuB8hTIRyODHPgXbdbtw+/uT+gm2URDEvopd/qWi
   mF654pZXxdIIzOPlbtu4S70wNmx6q98Nq40Ylgapr9Pkp8n3MWQ3Th5nX
   UvAsP4O222rz45fEekxpJeMdcNZ+2XmeCE8IV4Hx/ZGP+MKeNf6DD5Vt8
   g==;
X-CSE-ConnectionGUID: gpbu91A9RJGmqaCzF6Rudw==
X-CSE-MsgGUID: WT5IvpLxRpOgTsYw3MU9gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69102905"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="69102905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 14:06:27 -0800
X-CSE-ConnectionGUID: rCM4mhlLTSaZv9VjTfUnHQ==
X-CSE-MsgGUID: LLaNJQBTSYWqD3JU+08MLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="201482744"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jan 2026 14:06:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcWEx-000000000o9-2MAL;
	Sun, 04 Jan 2026 22:06:23 +0000
Date: Mon, 05 Jan 2026 06:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: drivers/net/ethernet/freescale/enetc/enetc.h:84:9: warning:
 conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'}
 changes value from '130560' to '65024'
Message-ID: <202601050637.kHEKKOG7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   54e82e93ca93e49cb4c33988adec5c8cb9d0df31
commit: e59bc32df2e989f034623a580e30a2a72af33b3f net: enetc: correct the value of ENETC_RXB_TRUESIZE
date:   3 months ago
config: powerpc-randconfig-001-20260105 (https://download.01.org/0day-ci/archive/20260105/202601050637.kHEKKOG7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050637.kHEKKOG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050637.kHEKKOG7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/freescale/enetc/enetc.c:4:
   drivers/net/ethernet/freescale/enetc/enetc.c: In function 'enetc_build_xdp_buff':
>> drivers/net/ethernet/freescale/enetc/enetc.h:84:9: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '130560' to '65024' [-Woverflow]
      84 |         (SKB_WITH_OVERHEAD(ENETC_RXB_TRUESIZE) - XDP_PACKET_HEADROOM)
         |         ^
   drivers/net/ethernet/freescale/enetc/enetc.c:1876:24: note: in expansion of macro 'ENETC_RXB_DMA_SIZE_XDP'
    1876 |                 size = ENETC_RXB_DMA_SIZE_XDP;
         |                        ^~~~~~~~~~~~~~~~~~~~~~


vim +84 drivers/net/ethernet/freescale/enetc/enetc.h

69797ff888d3db Wei Fang        2024-12-19  77  
d4fd0404c1c95b Claudiu Manoil  2019-01-22  78  #define ENETC_RX_MAXFRM_SIZE	ENETC_MAC_MAXFRM_SIZE
e59bc32df2e989 Wei Fang        2025-10-16  79  #define ENETC_RXB_TRUESIZE	(PAGE_SIZE >> 1)
d4fd0404c1c95b Claudiu Manoil  2019-01-22  80  #define ENETC_RXB_PAD		NET_SKB_PAD /* add extra space if needed */
d4fd0404c1c95b Claudiu Manoil  2019-01-22  81  #define ENETC_RXB_DMA_SIZE	\
d4fd0404c1c95b Claudiu Manoil  2019-01-22  82  	(SKB_WITH_OVERHEAD(ENETC_RXB_TRUESIZE) - ENETC_RXB_PAD)
d1b15102dd16ad Vladimir Oltean 2021-03-31  83  #define ENETC_RXB_DMA_SIZE_XDP	\
d1b15102dd16ad Vladimir Oltean 2021-03-31 @84  	(SKB_WITH_OVERHEAD(ENETC_RXB_TRUESIZE) - XDP_PACKET_HEADROOM)
d4fd0404c1c95b Claudiu Manoil  2019-01-22  85  

:::::: The code at line 84 was first introduced by commit
:::::: d1b15102dd16adc17fd5e4db8a485e6459f98906 net: enetc: add support for XDP_DROP and XDP_PASS

:::::: TO: Vladimir Oltean <vladimir.oltean@nxp.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
