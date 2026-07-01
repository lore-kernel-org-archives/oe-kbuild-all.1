Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9943921EC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 06:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885949; cv=none; b=SA65nBMc6STCOVlswieSslUAzNmn2Ol9BHaGdPUTeuHyv653J9nIk0sVyCieeC2W5MIWLo/dA31kS/kxia3lqKRfT3RVfL8tyP5uHdv2v7Riq3s1KhWd4tbl6ErMiiuPWu0Yo1C2YEejGB7VlfdsMT8EB425Nxl80ieKFpkrfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885949; c=relaxed/simple;
	bh=bFRRKsDGUyshaOh8Hp0rFB3obPe6HbBKz0nuDCdpDmE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ggEj1/pWC0xKCsLBoJ9E0SrSYXzUR2lx6pbLxIuSzAw4yceO3Nef/xaTPDYPef2YA4kaQRLylSS2ydY6N7+T7SnwhFTXVETIStDS0J4R+dL9ivOynwaGV2FuVZiB2kU66Lwr69zX59GLg2ZzpP9bsyV2esT1HKsk+aiVO6+Mj7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aduHs2lK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aduHs2lK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782885947; x=1814421947;
  h=date:from:to:cc:subject:message-id;
  bh=bFRRKsDGUyshaOh8Hp0rFB3obPe6HbBKz0nuDCdpDmE=;
  b=aduHs2lKsHAsNUd7SSt8F6tmni9+gUWVGqVNGoYKX4IauPVCjyXl606N
   YOrtmY33MMvT0sOOramtFSrtXpnGWC8CxIspmcXS/DZvo3e+XXRIBqEd5
   MRypHOquI/T5NYkAQaQa12vTflC3VXUQbuRJDbZY6omQUKbo7kHXJiZvJ
   DDkyWW+J8197lygDfD3a45r1dzSPuawmFinllE+C+kZUIs6bME9+mlg2I
   fNRFrkZZ2ZNfLr0IeVXv9YgN69Q6Rjvrc8SLasFHKxY/maS9T/maJKPsC
   W0oKYF7qDP5W7WtTBhvMwX8bCEbvP/RfmGBzdN3mg6SxnZA1lx0guU1wU
   Q==;
X-CSE-ConnectionGUID: lw/4Tm5/Q123/yF4+wpkqA==
X-CSE-MsgGUID: CtBe7a+mTc6AgfeN5QLlXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="93964248"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="93964248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 23:05:47 -0700
X-CSE-ConnectionGUID: MA6hFpTTR5qFmWK6THtECA==
X-CSE-MsgGUID: AdsjOULoRTaTudH9g/hxDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="256047144"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 23:05:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weo4f-000000008z5-3Z5d;
	Wed, 01 Jul 2026 06:05:33 +0000
Date: Wed, 01 Jul 2026 14:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: drivers/scsi/advansys.c:4261:9: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202607011327.MoJQL8RK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   665159e246749578d4e4bfe106ee3b74edcdab18
commit: c7233b3d99db9760daf07c4e95daa9675c6c0cba scsi: advansys: Drop ISA_DMA_API remnants
date:   9 weeks ago
config: m68k-randconfig-r132-20260701 (https://download.01.org/0day-ci/archive/20260701/202607011327.MoJQL8RK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011327.MoJQL8RK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c7233b3d99db ("scsi: advansys: Drop ISA_DMA_API remnants")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011327.MoJQL8RK-lkp@intel.com/

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

4b47e464510c52 Hannes Reinecke 2015-04-24  4224  
512193588db0d3 Matthew Wilcox  2007-10-02  4225  /*
512193588db0d3 Matthew Wilcox  2007-10-02  4226   * Send an idle command to the chip and wait for completion.
512193588db0d3 Matthew Wilcox  2007-10-02  4227   *
512193588db0d3 Matthew Wilcox  2007-10-02  4228   * Command completion is polled for once per microsecond.
512193588db0d3 Matthew Wilcox  2007-10-02  4229   *
512193588db0d3 Matthew Wilcox  2007-10-02  4230   * The function can be called from anywhere including an interrupt handler.
512193588db0d3 Matthew Wilcox  2007-10-02  4231   * But the function is not re-entrant, so it uses the DvcEnter/LeaveCritical()
512193588db0d3 Matthew Wilcox  2007-10-02  4232   * functions to prevent reentrancy.
512193588db0d3 Matthew Wilcox  2007-10-02  4233   *
512193588db0d3 Matthew Wilcox  2007-10-02  4234   * Return Values:
512193588db0d3 Matthew Wilcox  2007-10-02  4235   *   ADV_TRUE - command completed successfully
512193588db0d3 Matthew Wilcox  2007-10-02  4236   *   ADV_FALSE - command failed
512193588db0d3 Matthew Wilcox  2007-10-02  4237   *   ADV_ERROR - command timed out
512193588db0d3 Matthew Wilcox  2007-10-02  4238   */
512193588db0d3 Matthew Wilcox  2007-10-02  4239  static int
512193588db0d3 Matthew Wilcox  2007-10-02  4240  AdvSendIdleCmd(ADV_DVC_VAR *asc_dvc,
95cfab6c11180f Hannes Reinecke 2015-04-24  4241  	       ushort idle_cmd, u32 idle_cmd_parameter)
512193588db0d3 Matthew Wilcox  2007-10-02  4242  {
95cfab6c11180f Hannes Reinecke 2015-04-24  4243  	int result, i, j;
512193588db0d3 Matthew Wilcox  2007-10-02  4244  	AdvPortAddr iop_base;
512193588db0d3 Matthew Wilcox  2007-10-02  4245  
512193588db0d3 Matthew Wilcox  2007-10-02  4246  	iop_base = asc_dvc->iop_base;
512193588db0d3 Matthew Wilcox  2007-10-02  4247  
512193588db0d3 Matthew Wilcox  2007-10-02  4248  	/*
512193588db0d3 Matthew Wilcox  2007-10-02  4249  	 * Clear the idle command status which is set by the microcode
512193588db0d3 Matthew Wilcox  2007-10-02  4250  	 * to a non-zero value to indicate when the command is completed.
512193588db0d3 Matthew Wilcox  2007-10-02  4251  	 * The non-zero result is one of the IDLE_CMD_STATUS_* values
512193588db0d3 Matthew Wilcox  2007-10-02  4252  	 */
512193588db0d3 Matthew Wilcox  2007-10-02  4253  	AdvWriteWordLram(iop_base, ASC_MC_IDLE_CMD_STATUS, (ushort)0);
512193588db0d3 Matthew Wilcox  2007-10-02  4254  
512193588db0d3 Matthew Wilcox  2007-10-02  4255  	/*
512193588db0d3 Matthew Wilcox  2007-10-02  4256  	 * Write the idle command value after the idle command parameter
512193588db0d3 Matthew Wilcox  2007-10-02  4257  	 * has been written to avoid a race condition. If the order is not
512193588db0d3 Matthew Wilcox  2007-10-02  4258  	 * followed, the microcode may process the idle command before the
512193588db0d3 Matthew Wilcox  2007-10-02  4259  	 * parameters have been written to LRAM.
512193588db0d3 Matthew Wilcox  2007-10-02  4260  	 */
512193588db0d3 Matthew Wilcox  2007-10-02 @4261  	AdvWriteDWordLramNoSwap(iop_base, ASC_MC_IDLE_CMD_PARAMETER,
512193588db0d3 Matthew Wilcox  2007-10-02  4262  				cpu_to_le32(idle_cmd_parameter));
512193588db0d3 Matthew Wilcox  2007-10-02  4263  	AdvWriteWordLram(iop_base, ASC_MC_IDLE_CMD, idle_cmd);
512193588db0d3 Matthew Wilcox  2007-10-02  4264  
512193588db0d3 Matthew Wilcox  2007-10-02  4265  	/*
512193588db0d3 Matthew Wilcox  2007-10-02  4266  	 * Tickle the RISC to tell it to process the idle command.
512193588db0d3 Matthew Wilcox  2007-10-02  4267  	 */
512193588db0d3 Matthew Wilcox  2007-10-02  4268  	AdvWriteByteRegister(iop_base, IOPB_TICKLE, ADV_TICKLE_B);
512193588db0d3 Matthew Wilcox  2007-10-02  4269  	if (asc_dvc->chip_type == ADV_CHIP_ASC3550) {
512193588db0d3 Matthew Wilcox  2007-10-02  4270  		/*
512193588db0d3 Matthew Wilcox  2007-10-02  4271  		 * Clear the tickle value. In the ASC-3550 the RISC flag
512193588db0d3 Matthew Wilcox  2007-10-02  4272  		 * command 'clr_tickle_b' does not work unless the host
512193588db0d3 Matthew Wilcox  2007-10-02  4273  		 * value is cleared.
512193588db0d3 Matthew Wilcox  2007-10-02  4274  		 */
512193588db0d3 Matthew Wilcox  2007-10-02  4275  		AdvWriteByteRegister(iop_base, IOPB_TICKLE, ADV_TICKLE_NOP);
512193588db0d3 Matthew Wilcox  2007-10-02  4276  	}
512193588db0d3 Matthew Wilcox  2007-10-02  4277  
512193588db0d3 Matthew Wilcox  2007-10-02  4278  	/* Wait for up to 100 millisecond for the idle command to timeout. */
512193588db0d3 Matthew Wilcox  2007-10-02  4279  	for (i = 0; i < SCSI_WAIT_100_MSEC; i++) {
512193588db0d3 Matthew Wilcox  2007-10-02  4280  		/* Poll once each microsecond for command completion. */
512193588db0d3 Matthew Wilcox  2007-10-02  4281  		for (j = 0; j < SCSI_US_PER_MSEC; j++) {
512193588db0d3 Matthew Wilcox  2007-10-02  4282  			AdvReadWordLram(iop_base, ASC_MC_IDLE_CMD_STATUS,
512193588db0d3 Matthew Wilcox  2007-10-02  4283  					result);
512193588db0d3 Matthew Wilcox  2007-10-02  4284  			if (result != 0)
512193588db0d3 Matthew Wilcox  2007-10-02  4285  				return result;
512193588db0d3 Matthew Wilcox  2007-10-02  4286  			udelay(1);
512193588db0d3 Matthew Wilcox  2007-10-02  4287  		}
512193588db0d3 Matthew Wilcox  2007-10-02  4288  	}
512193588db0d3 Matthew Wilcox  2007-10-02  4289  
512193588db0d3 Matthew Wilcox  2007-10-02  4290  	BUG();		/* The idle command should never timeout. */
512193588db0d3 Matthew Wilcox  2007-10-02  4291  	return ADV_ERROR;
512193588db0d3 Matthew Wilcox  2007-10-02  4292  }
512193588db0d3 Matthew Wilcox  2007-10-02  4293  

:::::: The code at line 4261 was first introduced by commit
:::::: 512193588db0d38ae6aa78802bb15f3ef3104a00 [SCSI] advansys: Eliminate prototypes

:::::: TO: Matthew Wilcox <matthew@wil.cx>
:::::: CC: James Bottomley <jejb@mulgrave.localdomain>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
