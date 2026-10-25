Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792961320;
	b=1Bytn4FR2H/9bOX7D0OW4lv6jTb8Q3wr5fUrvrXVzdxGpwgH4waoSbHjeBmmrKjVTZ9l
	 uVkDhQn42j1wN7QZz7iFyrQU5tc4xmzQ9QcdxkPgR/BKyJ0/nJ1LxfXzjPDIUllEU5uQs
	 oO1vLaVN3tHEJkqe+GumuwLII4z8EYp8dZCn+iQFhzPXcC8n2r5teg1llhF/ywBSQbaha
	 RxFZ+T4uU/AMEJCeKGOhOGRLFGE3eDtxusrSKlGGrOp3gq2DSzL8xTCEzEZAA9pTrLatF
	 Yc6b84LavgIskN1NRg59YwVd0ipzrp3ueSRgLuI8xw4whmhNZ7YMMV8oY+djOgCXdyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792961320;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=K2B56TxIVPnddVYSBm/ANMvPRzuNvVJ8wsUCiKCD3lE=;
	b=QqDVUvm6Bs6Ol7wqgj1bzUH3CaQI8jFQGdMm0fDrmklyXBF+myzK1M65+CfwrMhhinZT
	 f9u/ZQ1aOk29PxUUm399KaOesifArlIPSJORrdUgzdmL8IBwK/PR+COowyDL3SiD8/4G/
	 A5Sy5aWD5lerZHqoSES1TBAhvCNleMNEueQS6pV6mJUMv456P/FFPK9g7LbMIa+K6bFVe
	 5asb82NhAtjX0ddqrjxBydz8ZdFWYOPdw3RhqwwpVhmFAkWyM+rVWxT686JRWOF1H/bWN
	 WipuzBroAOJke0BQM8uyjZq9hKT/GGK0IwXIKelizcoySx4I0gny2HinSGINGOFmF4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gMG2DMcY;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48218606A31E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 20:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48218606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gMG2DMcY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792961318; x=1824497318;
  h=date:from:to:cc:subject:message-id;
  bh=ebHHbdk9kyWzocVm6kUUWd0KPVFrxOoIHaCTJapSfHc=;
  b=gMG2DMcY5HdXIi932RY6b4JGq7vBrf3wP6qC/aCwJGfH4U0rlkVKnJMn
   wYEcuxv6mmWK9MGQmySXiCdOcPgdAvZFkGLku+MqNB8iN7o9fSwAYOdMA
   B/WWo+zKccWmcaKFfgJDdpXJNbvWZ1QRVpECc3SkQBVV2GwCpUlOhCI0X
   ky8q49Dl+4bjwwKVZCt9AdWJMyZl9dhzOeIW9XSPG9DHYV8L9zW+PNl6Z
   x+0i3TO1HItpCQ9yjAOds0gjWLT7k8hCRA2vhn0lRSe31+JYQRf2HTPt3
   z4RK6u0aSzDfF8DZgUd1sAt2QU44YiBNNIKDGEebDA85Nb/TyYYBuzH9m
   g==;
X-CSE-ConnectionGUID: WIO0jXIqSJuzrkF1x/O4eQ==
X-CSE-MsgGUID: 6KWi/rwVTsO2u1FHkn1+xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1632726"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1632726"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 13:48:37 -0700
X-CSE-ConnectionGUID: raRLxVGNTuK/9aF9tjkh3w==
X-CSE-MsgGUID: m+G44m0ISaiNegG9m++68Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4114410"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2026 13:48:35 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL58q-000000003p3-32aT;
	Sun, 25 Oct 2026 20:48:32 +0000
Date: Sun, 25 Oct 2026 21:48:12 +0100
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202610252105.0w3GI1ak-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21a7f44fd0765fcc5194130b28767786eba1d1e7
commit: c7233b3d99db9760daf07c4e95daa9675c6c0cba scsi: advansys: Drop ISA_DMA_API remnants
date:   6 months ago
config: m68k-randconfig-r2302-20261025 (https://download.01.org/0day-ci/archive/20261025/202610252105.0w3GI1ak-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610252105.0w3GI1ak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c7233b3d99db ("scsi: advansys: Drop ISA_DMA_API remnants")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610252105.0w3GI1ak-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4261:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4261:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4261:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4261:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4261:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4261:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4261:9: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4261:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4261:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4719:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4719:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4719:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4719:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4719:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4719:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4719:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4719:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4719:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4733:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4733:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: cast from restricted __le16
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4733:9: sparse:     expected unsigned short volatile [usertype]
   drivers/scsi/advansys.c:4733:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/scsi/advansys.c:4733:9: sparse:     expected unsigned short [usertype] val
   drivers/scsi/advansys.c:4733:9: sparse:     got restricted __le16 [usertype]
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/advansys.c:4733:9: sparse: sparse: restricted __le32 degrades to integer

vim +4261 drivers/scsi/advansys.c

4b47e464510c524 Hannes Reinecke 2015-04-24  4224  
512193588db0d38 Matthew Wilcox  2007-10-02  4225  /*
512193588db0d38 Matthew Wilcox  2007-10-02  4226   * Send an idle command to the chip and wait for completion.
512193588db0d38 Matthew Wilcox  2007-10-02  4227   *
512193588db0d38 Matthew Wilcox  2007-10-02  4228   * Command completion is polled for once per microsecond.
512193588db0d38 Matthew Wilcox  2007-10-02  4229   *
512193588db0d38 Matthew Wilcox  2007-10-02  4230   * The function can be called from anywhere including an interrupt handler.
512193588db0d38 Matthew Wilcox  2007-10-02  4231   * But the function is not re-entrant, so it uses the DvcEnter/LeaveCritical()
512193588db0d38 Matthew Wilcox  2007-10-02  4232   * functions to prevent reentrancy.
512193588db0d38 Matthew Wilcox  2007-10-02  4233   *
512193588db0d38 Matthew Wilcox  2007-10-02  4234   * Return Values:
512193588db0d38 Matthew Wilcox  2007-10-02  4235   *   ADV_TRUE - command completed successfully
512193588db0d38 Matthew Wilcox  2007-10-02  4236   *   ADV_FALSE - command failed
512193588db0d38 Matthew Wilcox  2007-10-02  4237   *   ADV_ERROR - command timed out
512193588db0d38 Matthew Wilcox  2007-10-02  4238   */
512193588db0d38 Matthew Wilcox  2007-10-02  4239  static int
512193588db0d38 Matthew Wilcox  2007-10-02  4240  AdvSendIdleCmd(ADV_DVC_VAR *asc_dvc,
95cfab6c11180f1 Hannes Reinecke 2015-04-24  4241  	       ushort idle_cmd, u32 idle_cmd_parameter)
512193588db0d38 Matthew Wilcox  2007-10-02  4242  {
95cfab6c11180f1 Hannes Reinecke 2015-04-24  4243  	int result, i, j;
512193588db0d38 Matthew Wilcox  2007-10-02  4244  	AdvPortAddr iop_base;
512193588db0d38 Matthew Wilcox  2007-10-02  4245  
512193588db0d38 Matthew Wilcox  2007-10-02  4246  	iop_base = asc_dvc->iop_base;
512193588db0d38 Matthew Wilcox  2007-10-02  4247  
512193588db0d38 Matthew Wilcox  2007-10-02  4248  	/*
512193588db0d38 Matthew Wilcox  2007-10-02  4249  	 * Clear the idle command status which is set by the microcode
512193588db0d38 Matthew Wilcox  2007-10-02  4250  	 * to a non-zero value to indicate when the command is completed.
512193588db0d38 Matthew Wilcox  2007-10-02  4251  	 * The non-zero result is one of the IDLE_CMD_STATUS_* values
512193588db0d38 Matthew Wilcox  2007-10-02  4252  	 */
512193588db0d38 Matthew Wilcox  2007-10-02  4253  	AdvWriteWordLram(iop_base, ASC_MC_IDLE_CMD_STATUS, (ushort)0);
512193588db0d38 Matthew Wilcox  2007-10-02  4254  
512193588db0d38 Matthew Wilcox  2007-10-02  4255  	/*
512193588db0d38 Matthew Wilcox  2007-10-02  4256  	 * Write the idle command value after the idle command parameter
512193588db0d38 Matthew Wilcox  2007-10-02  4257  	 * has been written to avoid a race condition. If the order is not
512193588db0d38 Matthew Wilcox  2007-10-02  4258  	 * followed, the microcode may process the idle command before the
512193588db0d38 Matthew Wilcox  2007-10-02  4259  	 * parameters have been written to LRAM.
512193588db0d38 Matthew Wilcox  2007-10-02  4260  	 */
512193588db0d38 Matthew Wilcox  2007-10-02 @4261  	AdvWriteDWordLramNoSwap(iop_base, ASC_MC_IDLE_CMD_PARAMETER,
512193588db0d38 Matthew Wilcox  2007-10-02  4262  				cpu_to_le32(idle_cmd_parameter));
512193588db0d38 Matthew Wilcox  2007-10-02  4263  	AdvWriteWordLram(iop_base, ASC_MC_IDLE_CMD, idle_cmd);
512193588db0d38 Matthew Wilcox  2007-10-02  4264  
512193588db0d38 Matthew Wilcox  2007-10-02  4265  	/*
512193588db0d38 Matthew Wilcox  2007-10-02  4266  	 * Tickle the RISC to tell it to process the idle command.
512193588db0d38 Matthew Wilcox  2007-10-02  4267  	 */
512193588db0d38 Matthew Wilcox  2007-10-02  4268  	AdvWriteByteRegister(iop_base, IOPB_TICKLE, ADV_TICKLE_B);
512193588db0d38 Matthew Wilcox  2007-10-02  4269  	if (asc_dvc->chip_type == ADV_CHIP_ASC3550) {
512193588db0d38 Matthew Wilcox  2007-10-02  4270  		/*
512193588db0d38 Matthew Wilcox  2007-10-02  4271  		 * Clear the tickle value. In the ASC-3550 the RISC flag
512193588db0d38 Matthew Wilcox  2007-10-02  4272  		 * command 'clr_tickle_b' does not work unless the host
512193588db0d38 Matthew Wilcox  2007-10-02  4273  		 * value is cleared.
512193588db0d38 Matthew Wilcox  2007-10-02  4274  		 */
512193588db0d38 Matthew Wilcox  2007-10-02  4275  		AdvWriteByteRegister(iop_base, IOPB_TICKLE, ADV_TICKLE_NOP);
512193588db0d38 Matthew Wilcox  2007-10-02  4276  	}
512193588db0d38 Matthew Wilcox  2007-10-02  4277  
512193588db0d38 Matthew Wilcox  2007-10-02  4278  	/* Wait for up to 100 millisecond for the idle command to timeout. */
512193588db0d38 Matthew Wilcox  2007-10-02  4279  	for (i = 0; i < SCSI_WAIT_100_MSEC; i++) {
512193588db0d38 Matthew Wilcox  2007-10-02  4280  		/* Poll once each microsecond for command completion. */
512193588db0d38 Matthew Wilcox  2007-10-02  4281  		for (j = 0; j < SCSI_US_PER_MSEC; j++) {
512193588db0d38 Matthew Wilcox  2007-10-02  4282  			AdvReadWordLram(iop_base, ASC_MC_IDLE_CMD_STATUS,
512193588db0d38 Matthew Wilcox  2007-10-02  4283  					result);
512193588db0d38 Matthew Wilcox  2007-10-02  4284  			if (result != 0)
512193588db0d38 Matthew Wilcox  2007-10-02  4285  				return result;
512193588db0d38 Matthew Wilcox  2007-10-02  4286  			udelay(1);
512193588db0d38 Matthew Wilcox  2007-10-02  4287  		}
512193588db0d38 Matthew Wilcox  2007-10-02  4288  	}
512193588db0d38 Matthew Wilcox  2007-10-02  4289  
512193588db0d38 Matthew Wilcox  2007-10-02  4290  	BUG();		/* The idle command should never timeout. */
512193588db0d38 Matthew Wilcox  2007-10-02  4291  	return ADV_ERROR;
512193588db0d38 Matthew Wilcox  2007-10-02  4292  }
512193588db0d38 Matthew Wilcox  2007-10-02  4293  

:::::: The code at line 4261 was first introduced by commit
:::::: 512193588db0d38ae6aa78802bb15f3ef3104a00 [SCSI] advansys: Eliminate prototypes

:::::: TO: Matthew Wilcox <matthew@wil.cx>
:::::: CC: James Bottomley <jejb@mulgrave.localdomain>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
