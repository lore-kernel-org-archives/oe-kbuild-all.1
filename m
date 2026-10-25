Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792944256;
	b=HIwd1wTuFGe85qWjZi0js0v/TpoH0gD8BRorPYoov55CNgeihzaHr1SsvJVKnxiPlEQg
	 UYUI2msn3NxRNs65hvV6QKAmU3fOlxbKxXObAdf2NeZMdlgq3mQZtR7XJ0PKgy4uSNGqo
	 KiiOt5eACbZRmWyWkHyJjH/prXckg/UxjjN5E3xHu7K9smvEvIyc6Mvzb6Tgz4epjYw8s
	 LgABvLGsQOV3IIwZB63vHqbNNdK+p4ZT7Jm/0xHNeXqv3YnJeXP7LuD0foDS/UB78PiGH
	 PPqIP5oWSVrJZzK3b0PBIh68UMHcWj99858tBVy2uQUxZujJOOD/Gtp2C/e8N/AxRSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792944256;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=chR7aARYR1PfpngRG3MDwBuKrv0LclhSgWypC9mzsZs=;
	b=N8LshaFCB2yJqjynkGO6/rE+r75KgH8xMlhC7y1R/vqCNy38HYEbppfBKKkXDGXw1mgI
	 co/0rnK6ICNHDCywsJwsJkwiFqvNBrFa3UZqMqhHpq2HRCP2/rS1ia8GdBLVehYDFM+Tb
	 skCYiI6/zvvytGoc3fpDiF9Ou9kSJXNFS2uxqjFWH8Fleu9Zj/bYSIFQ89qYnwW4YI+eF
	 g4dSuMrE33GTbnm45Qt3nMnkFHmhkPORxStwHAYaxlRQVM61cu9A+5ZgbE+QHSeA6PSUk
	 oLa7y38sb8AjvZh+8uLDZ0yW68+ymJOsnZ4IkC6hK/5H9sknVGCXQXvrUw2r5JDa4BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ATRd1rkF;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8285606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 16:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8285606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ATRd1rkF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792944255; x=1824480255;
  h=date:from:to:cc:subject:message-id;
  bh=Qn/cJORE8qNdi8SEfoNVbd8Zpg4RtWUEnUxrDErw+Mk=;
  b=ATRd1rkFJUFMCrK/awuWMgIxaYto1EbN4syEyJDYsOVvWOdhqLOxsh7L
   N6D8F+/jbK5/d4Qq05s93ubfgWBd09iTsxy5K8qkbiQrlODQMjqf3G95J
   LRwhlc7bN2cYDdqxSKRbM0pH9eEuFuMGbR7kPnCeSbjmfIqPcY2Rh3MZb
   l0GXPljNsXGmq4zXvDbEJhYY9dxviJ2eEJzxPT67Dmk/12/TW4oJRpdfa
   bPJlxsZts8I7zL4D5ktiZVMyM1E1V3N9RoXNi6h1fSK+pY+W53+d1RZ2A
   hR3YPpWIlpEzDcpUbyF7j12MkA7JBMdzGwEl5943U00i2t7zAtM8SUl74
   w==;
X-CSE-ConnectionGUID: dlXwLCu1QsW67qCDTnDZ0w==
X-CSE-MsgGUID: tX96HgSmRIaVp5U/iw+pyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1493868"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1493868"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 09:04:15 -0700
X-CSE-ConnectionGUID: yv+R4h/9T9KLtfxYYtxNXw==
X-CSE-MsgGUID: 0LpFcHX9QRaDlzDjqOLC4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4411351"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2026 09:04:13 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL0he-000000003jh-4BwM;
	Sun, 25 Oct 2026 16:04:11 +0000
Date: Sun, 25 Oct 2026 17:03:18 +0100
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 7629/19841]
 drivers/firmware/imx/se_ctrl.c:490:1: sparse: sparse: symbol 'se_pm' was not
 declared. Should it be static?
Message-ID: <202610251704.2JNB1i0g-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20a33c6b6cbe7e4805dfb6cd68816937443aa148
commit: dfc0183f20c3b21d67a3e4e6dd34b833a83c19fc [7629/19841] firmware: imx: add driver for NXP EdgeLock Enclave
config: arm-randconfig-r2300-20261025 (https://download.01.org/0day-ci/archive/20261025/202610251704.2JNB1i0g-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251704.2JNB1i0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251704.2JNB1i0g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/se_ctrl.c:490:1: sparse: sparse: symbol 'se_pm' was not declared. Should it be static?

vim +/se_pm +490 drivers/firmware/imx/se_ctrl.c

   489	
 > 490	DEFINE_SIMPLE_DEV_PM_OPS(se_pm, se_suspend, se_resume);
   491	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
