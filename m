Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785811;
	b=2DYrmYZZN9Mb+OK8ImG/QdFk6DzxYeWt9eYjqYDmXzkTLJvGp3PF9lcCVx+/Zc17HcaK
	 +fHP5DWi6r9CqQ+zK46PWxMYN5V1XaQXQ7KvfP0SpVJi9/5TNqxAdRTSAT623PXvtCINl
	 a+8rEtFCccpaEdN94F4e05zeXyiOGuJbMcEbEZxbVIO401WEnB0j2IU1i+YHo7Q/YgtBP
	 W3QyWS3bk/jtWMxd4z07B0oezOVhewtduGISd6q1cmpfXYf5bthAzq6ea6AMVizcJiFB0
	 5Vf7PLaODuQiED7Zb+SJiFqOnRjtnV9KmuX7V5/gAUoo5doxGQqE9/AFquqk+FbBJaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785811;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SWx2pFUcaAQyAI8KiqxAqFQTx8S1//HfQdOifWGthik=;
	b=FCmCJVY/jedRQ/Rq5cc3O0/Xxtx/Uz4QHnfE3RhKhCkD8C3+waZCruZ44/4i12mKKoJM
	 9TPjMyuMN1hE48NewmE/hqTF3xGWC3TtK0ZqsSENYTc88zZwGYuo3nAHbwoF9aYsaIADX
	 FMnIKyPtffc4ANpuVE2D6sdZBI3OsobGRQOUd6NU2S3Vc1rejbIrCyIP2KzTQBxtzJrLV
	 RIvv+ScuIcpo3yyd/vYQv9dOGDOWk3QUsRHoGpDNo5MzEGjq7R/OLfC3HmpxzZFdoj3vI
	 kndClDDAn3F8s3XWieyTdMjGts1MZqw4ffaFlvMOhv2q7B/leU4A6WnCZc18Es7fHOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TwE+EIoW;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5106C606A32C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 23:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5106C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TwE+EIoW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794785810; x=1826321810;
  h=date:from:to:cc:subject:message-id;
  bh=+9iytjyiKVzQunjGK5JXdzru7BKFTHNN8c76pPUDxzw=;
  b=TwE+EIoWBc2IkG8HKwf0q5xbr1zFtftJ5E8De7i72zgPOCKRZpv5/NSJ
   JXAMt7BOyIVoG8D/BNnfX0Jaa37+RuUMtBlmEUGTpXrZSH0wJP7526jWX
   C+ivNSfJb6BRaVcDp+1DPe+EjaUQvyUWMBqyyR77YyGdLM0i3R6svYVho
   OObbEDWKCsIg+m5OnUucB7tjy/7s4otl7mH/8a0VWS0t+4DdyeYVq6pnb
   kqHEeaLJpKxiaS17DZVFfxkitpvh6T3S8xncLNvGm8BZg8Pqyea6oKpz2
   0NgHKE2vJHCbQGqk7SQ8DHTOU9Zb8ItmIjhTJWC1/E4v0lLADc9RAZfr9
   Q==;
X-CSE-ConnectionGUID: FeOECQyZQlabUUUsrVtH6g==
X-CSE-MsgGUID: pbYHNH05TK+IYENCuLJZgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3409987"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3409987"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 15:36:50 -0800
X-CSE-ConnectionGUID: oROO5Ic9To+FHrsjaCEYlQ==
X-CSE-MsgGUID: vx9k7ZS2SvKl1VAGMu6z8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="11185137"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 15 Nov 2026 15:36:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSjmA-000000002VT-1h2R;
	Sun, 15 Nov 2026 23:36:46 +0000
Date: Mon, 16 Nov 2026 00:36:02 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 96/458] net/core/devmem.o:
 warning: objtool: __net_devmem_dmabuf_binding_free+0x60: stack state
 mismatch: reg1[24]=-1+0 reg2[24]=-2-24
Message-ID: <202611160006.FkP5JnAq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   0e6b6b4005f8a398c95e4d8bdf0bdbb9aed73729
commit: 520f4c12528973cfc7626b2a67602121e757e8ff [96/458] net: devmem: Check the dma_resv_lock() return value
config: loongarch-randconfig-2000-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160006.FkP5JnAq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160006.FkP5JnAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160006.FkP5JnAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/devmem.o: warning: objtool: __net_devmem_dmabuf_binding_free+0x60: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
