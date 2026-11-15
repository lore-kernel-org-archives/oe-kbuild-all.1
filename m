Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763344;
	b=5CnnputLaft+xj4gQ+tqMO4XopFq0t16bApZdBHv3u6bAfA/nA6bx7kG/Ii/Z908dbeF
	 PFzaV7tCrFPxk5L5hMjTPc+dAI3xKauLxVOwHjQSI6pMIaRO/Gu059QMMnFdKGSug6LAx
	 OjDsR8AlcMD4TpJdyaF+U/jj0og9FKfL8iEJtUOa442ItAox6UY7VffpPvLo/9rXsjrGx
	 XP9XhnV++6u/q2ove7YcvbPpq0Zs8m2AIMpEK/5L62DPr0lZcTnHeYnudzha9HZ3JSc9v
	 e8vxzfsaBPlWvKdtx1LAtM/WpGAK1ir51yg+I5i78AM+7zjrAPGPsu+G1wye55I2ZYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763344;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ofJr28WF+Vf2b0/TRpG3Don4gNklf5WTENU1aqjz8u0=;
	b=qnV51izOhKB1neERh1vZshABcT5+Wv70+uI4MY1TBy9+xqxbwccNRtuqIAk9ifxbni0N
	 T7JQPqByd1G5HMR1JqMUxjIWRfwW5a/XFz1+1lNVyERCZjQKHgRCl2KYNrTdLad56iU5Z
	 0RPAhITajXWeR32ow9tSWWNHQHQ5m6mfebzecPFnorSlHFW5TtczPvZklorM0R+M6VNje
	 kpL5794wUEcKuIZhEfwxyWEnPIks2yqIc4QDkmS4Rq1VecOIOs64OpZWMS0GhUybw2A2/
	 pYxbSqcrL0riSgKyAoex1624DoIk3qq06AmpOVMrs7vqKF72L4ZuWMepV8kwx0M1WEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eeBKV9J+;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088DE606A31E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 17:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 088DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eeBKV9J+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794763345; x=1826299345;
  h=date:from:to:cc:subject:message-id;
  bh=UAS++/KkiOg3ZgitnvVL/hXXejP4gWmFjCxcljpKCJE=;
  b=eeBKV9J+UWBjzbrhh1hY5egq+oBTBOu1vy33gl6jleNB9gJDCIl+R5Nu
   XmVnT+GtEn92VxNc8qXPFpTHdJvjIhuFi37udcb3/Y4ihuFeM9Qikxjs8
   PQtsjL3o2a3r0IwK7nTQ1pR2qzyBVoVUQvITOg/R/4b0IVHjy2ad4SB9v
   Gn/5f++NVlsl4LAPP9um8ZH2w9s3Z/VQxfnNGfO4Glz1AdKZdHo/ISFmw
   YrpwEnz5z8gqHJsF4gehtQK+Zq4j6iy0KXyH3MW292UoR4borss6Kn1BG
   C6YYQGhivSQUip432XXLYKB5M/mF9NK4jXHFWqQQKb2oh0Vj0NeDz4rB2
   g==;
X-CSE-ConnectionGUID: KAZQlO3JTNieqHI907187g==
X-CSE-MsgGUID: flpAc4cOTxar0RXkSTgc/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3583246"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3583246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 09:22:23 -0800
X-CSE-ConnectionGUID: RdzIxoGjQtSUOfnQ2DPTAg==
X-CSE-MsgGUID: +5tuMuMVSX6gkqM1zE49Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9611869"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 09:22:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSdvn-000000002Kx-1QGx;
	Sun, 15 Nov 2026 17:22:19 +0000
Date: Sun, 15 Nov 2026 18:21:57 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 86/458]
 drivers/gpu/drm/ttm/ttm_bo.o: warning: objtool: ttm_bo_delayed_delete+0x60:
 stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24
Message-ID: <202611151801.FRgaNlW5-lkp@intel.com>
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
commit: 77c741294743ebef7b1a36b4c526cb5a00d7b472 [86/458] drm/ttm: Check the dma_resv_lock() return value
config: loongarch-randconfig-2000-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151801.FRgaNlW5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151801.FRgaNlW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151801.FRgaNlW5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_bo.o: warning: objtool: ttm_bo_delayed_delete+0x60: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
