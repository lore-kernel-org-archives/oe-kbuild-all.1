Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654531;
	b=SIsjIiGEa2/Jvd80HALSFV8dK6qKvZB538EwRsRL1YlEXbO6lIKLvQ6yvoHig3e4aCtQ
	 zJ2VYd4E10KYjnKUKLDf8hftBrkdUiBkavuBE4/Z3y+B8sctk90zvMN96Bz/F7gL+Dw3N
	 PS+jmTR8qYbCcRfzCaHkN2Vx0mb5jr0rDgtWIoKbV9z43LLGfALWRN3afFknkUzcQppaK
	 qoCAEPHWw10iZr/uoMnpgBWx02IEf6BkhHh5qe9xKDLNC5XPQZYpgMqq1VsCVffjyb099
	 Cla2WBWZ8x/MGr6AYmTzPS9e8mO/+tlSD8dQoBUkjQFlM8NJAPDbamU6z/DyPkS+Egg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WFieA5P+v0lJGO8X21eQ/hQ1SPyiVDrCjcM6wkas1r8=;
	b=vSB1AT7f65McB7QA9GrxF3VDYsrg9im797NVeo0Q2L7OiGX6A71yLWp2Uj1ZTE6LrSyQ
	 BCMR14pkW873d9VOllEXBdIoa/uOOlkg9uUyWpHx8dJLxcgCDbdkkANRPm8S6GKzkqJ82
	 VNQI6MnT5m+o2hOBun5SRTPfJ5M9AABXeaqcFhRwTB8f5eeIasyJQkHJfUmMY5c2j7hh5
	 2FKqVL53P9i9GO/O/KsoGzLKcvn0P4He1u6mrzIja4KWrkNU2p8Fp5/ynL12EKKiWiSep
	 FXOwfJekxo+g4w+bT5zVuKjjtcE9kO+ILPcjMOYzbamw6U8c2gCQ9lZONgk5CrqQnTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ml8Qjp0P;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F58606A329
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 11:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9F58606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ml8Qjp0P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794654531; x=1826190531;
  h=date:from:to:cc:subject:message-id;
  bh=eRr9k9CV569P3GeldHM0mMGIQiQkhjOMpUER0WDKhaA=;
  b=Ml8Qjp0PqhcLpSetztYTq29E+mz3siY+0Zd3Vm/iVVLe3A2vn9MmRvEF
   abNzAlfJBEvAcq73wx2MG2iHCM0f/jooa/trUqg0nTP7C0UdBBkrEgS8s
   fYK2K4Qkcw+nOmTjDlOUyf9qO0J/Z3vFM70dEFcEtTmxSnmcxM2ZWtE5c
   7vg5fxFsrnTbwgVAIKlereNMwYr8lzJawQM64MR3rKk4yZwSFWGIEnEF/
   OuoxCDgFqvskKv0rLIVw1EbcpCyU4lKk2OIJyNW8O9x9dY0Fme+ho0i1N
   sPbV9zLdeNzBYrUBDFoWUOyAIX+7hkh47DwtuclfNu4FBlyGHQ4LYOMl9
   g==;
X-CSE-ConnectionGUID: 6KS0u/OwRKaFZBc4UUZrxw==
X-CSE-MsgGUID: aKHeBij8Rcayo5vzOkZdmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3531342"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3531342"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 03:08:49 -0800
X-CSE-ConnectionGUID: ZmNPe4gfSCq8Uqq+nPVeSA==
X-CSE-MsgGUID: 2eT0uD00Q9eRtuoHE+tiow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9383245"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Nov 2026 03:08:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSBci-000000001Y1-2Sto;
	Sat, 14 Nov 2026 11:08:44 +0000
Date: Sat, 14 Nov 2026 12:07:54 +0100
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [broadcom-stblinux:drivers/next 9/22]
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c:1690:36: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202611141210.9hmxzD2V-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/Broadcom/stblinux drivers/next
head:   0cab822bca7a59667774725b83e948b71462290f
commit: 67d0fbe47f8a03cdf30794ea8660a05dd54100d0 [9/22] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy
config: um-randconfig-r2308-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141210.9hmxzD2V-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141210.9hmxzD2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141210.9hmxzD2V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c:1690:36: sparse: sparse: Using plain integer as NULL pointer

vim +1690 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c

  1673	
  1674	int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
  1675	{
  1676		struct mmal_msg_context *msg_context = buf->msg_context;
  1677	
  1678		if (msg_context)
  1679			release_msg_context(msg_context);
  1680		buf->msg_context = NULL;
  1681	
  1682		if (buf->vcsm_handle) {
  1683			int ret;
  1684	
  1685			pr_debug("%s: vc_sm_cma_free on handle %p\n", __func__,
  1686				 buf->vcsm_handle);
  1687			ret = vc_sm_cma_free(buf->vcsm_handle);
  1688			if (ret)
  1689				pr_err("%s: vcsm_free failed, ret %d\n", __func__, ret);
> 1690			buf->vcsm_handle = 0;
  1691		}
  1692		return 0;
  1693	}
  1694	EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
  1695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
