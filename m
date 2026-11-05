Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845145;
	b=m2WkaB88ZdAkLqj95ZUGb5hyUrxuvPIYAIDQOZgP5Q484cv+cB4DFzoQk+7kEzfTsuxs
	 LFCD2+rEegcHaszTDdN1YB3+E8qF6zhUsbWu5GIb5ZbMClCMeM/++Pb1dFKojJLmd5Xo5
	 7owVCG3U6O/bRjCCTUbcvb3m6R2GOWlmiBRIJgYPd3AE9WJbsH8zmYtYj1/X9vkap6yG7
	 zCfz5yTFfIHwsZqWte9kuLvshA27hBh0cPhOYDPpUjyvnQaN8PCuAZKWciGzhIoG91znc
	 YXtAjzm9iGPr2TkceLDNjWPgy/ihYGSIPEHlfDdnDx6OdN2UgOtTFtK73jv0q+ZQKQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845145;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AddO009tUtOAbuC5vksHQgyvS13+CWJ9hXR0NE8z8Es=;
	b=MVKJ49EY+SzB0kAUKhGpLmpsJCoVoyeLHWWVEIPUotV94Uy+Qy4BKIVfQ7R9/647Chal
	 wLJi65zHTL4D2taBgs5GY8Qsli2nNokqDNOIJeuxjlaY2xuEHExRh90wrhIca/8+vSo7k
	 IgN0c+Fc1JTzAQfu3OZ0NS1SafOOL3WUDC10COcX5DxFsQ4alUwz70nnBUu6zN/YsftZA
	 ongQkTyh4N8rzTYFb52MrAQ9FiJqhx7U+NW1HPcVCB+PouGWAfkJNAniJxa/ihN2ylCWE
	 QwlVL7Fo8eJR4clsOVOWMLHT7de0KGZYCJGNtTwuapx/hN+R0cKgC7t2z4IRFTVAubg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="O/7y5zaf";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE48606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 02:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE48606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O/7y5zaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793845144; x=1825381144;
  h=date:from:to:cc:subject:message-id;
  bh=q1J8SSd6t9WP7vDsJXSBs/l23wPNJe9341oxl+i4XX8=;
  b=O/7y5zaf3bmEvqapp4vJy2cshQmyg6k3IAqc1jGOWczAQC7UO4w07TmY
   q079Q14Z6h2EerDthewuM332UoiMINVUGu+Pf0+S8OV+7byBQdvawzlFV
   CGzUPnOXApYoEOSpwByKHTrHnWV0S2fJTXZP3vNYiuWGuU3ZjTZctquBd
   Rm3Mdl5smU3GpqD9T4jg5CWBE6fXs0JB/fj32A66XiYLaGIBVntLxSqhY
   PHfUpedljajKvz7654sUpjkaCsZrUatE9/u8XnwGUv0ypXnig6CILmILo
   qr/rxQrgwJtNTMTxOwFEygLXHNCN95CHyRZlDNs++zS9PXshRA4TAx81b
   g==;
X-CSE-ConnectionGUID: 3jbH9e5wS6aKZo5x+F/qJg==
X-CSE-MsgGUID: kbKvvZ8KRDqrD3MmQgy0yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2626610"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2626610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 18:19:04 -0800
X-CSE-ConnectionGUID: y+OjtEKSRTK+l9oDMgH8Qw==
X-CSE-MsgGUID: k3fJMen7QMKUav2A/JEdHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6987807"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2026 18:19:02 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOn48-000000009RX-05wa;
	Thu, 05 Nov 2026 02:19:00 +0000
Date: Thu, 05 Nov 2026 03:18:55 +0100
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:device-trust-core-v1 16/18] ERROR: modpost:
 drivers/base/test/device-trust-test.ko: symbol 'device_trust_init_state'
 undefined!
Message-ID: <202611050304.FoIjKmhE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git device-trust-core-v1
head:   de870c841cdc66fcef8c15662d737b49b2356904
commit: 16c0a5ab002de9ece57552721116428855565e14 [16/18] driver core: Cover trust authorization and binding with KUnit
config: xtensa-randconfig-r2110-20261105 (https://download.01.org/0day-ci/archive/20261105/202611050304.FoIjKmhE-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050304.FoIjKmhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050304.FoIjKmhE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/base/test/device-trust-test.ko: symbol 'device_trust_init_state' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
