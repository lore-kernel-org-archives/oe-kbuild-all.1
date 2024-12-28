Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994D73D76
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735379755; cv=none; b=kLV+WY12Q5ni2xRNwN9ERtlU5usdOS+3dwXOSu4nVG/h2k/ynqSMQUpKDRZWbD3PktvKmzn0oi99s4yx34sc7F8PKWJ3R1JzzuPpSfjwo+Wg83t5gQ8y7aKjfcuqkHuNRnGr5v5ApaH2SEuk57eZGj3DDPSyBSgzDs7AFrKOGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735379755; c=relaxed/simple;
	bh=Sl7FR44PoE97rxVYDQNgw+tp4Bbg1IW+geu3PvywyzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGNXwGBPLuzDvKYeYKf5sWlw29EC98xCxlGpEMG8fSJ0+hzvL2PNy+3FexKla9WkFf+suGAq31zL2LoXEwwZaiUG+0BjE4wWEWWul3NpTZmWv5KltNN6fsq+5vzFjp8ZmUJxyac98qgS5WkpnQXpHZrILwFiLOnqvNHSeXmLBzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKXer0tZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKXer0tZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735379754; x=1766915754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sl7FR44PoE97rxVYDQNgw+tp4Bbg1IW+geu3PvywyzU=;
  b=bKXer0tZrI5x6vJRVyNY4mUvvtNM/CRZ5BfXvA1X3oe9vwuKMPL2dtkC
   ySVI31cz/6lTqDJZuTjGlemYRi+VVFr7Qkv3ol47/4sRGdUMYFyUEI/9E
   UURrtaqHJlKVkY5sROn6ZzHc/uf2aDrUPfa9HakA4Jy5bz+/rwHppCK3g
   wuoe2B1PVQ0nUFlupYmnri8jhtgzIS+6gvCYIXITXMTSTaHbkskgGoWaP
   7M8nFwVS4taHb2Y8Jvtmq8/zFSNxv14bvsoHCr5UO4640w7czTDxggOSE
   ScYwOIw4reFN5oQfugL8hC5s0rPzoasUUS2adZeHeC0I85r/0hqOF0hcA
   Q==;
X-CSE-ConnectionGUID: 5IiCA3JISCyoASP6uwKucg==
X-CSE-MsgGUID: tG2aw4MfSAOaNU+Tpna17Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39437943"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="39437943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 01:55:54 -0800
X-CSE-ConnectionGUID: V1vDTtlNRsm5UTBBrLGDmQ==
X-CSE-MsgGUID: /MQZnWvkQISgCQhFYwggpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="105185284"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Dec 2024 01:55:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRTXy-0003zF-0N;
	Sat, 28 Dec 2024 09:55:50 +0000
Date: Sat, 28 Dec 2024 17:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2601/2601] net/smc/smc_core.c:770:6: sparse:
 sparse: symbol '__smcr_link_clear' was not declared. Should it be static?
Message-ID: <202412281741.d8yDMbp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: 7dad816cb1f8841fda526c0978c10a94793f1178 [2601/2601] anolis: net/smc: Resolve the race between SMC-R link access and clear
config: x86_64-randconfig-121-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281741.d8yDMbp6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281741.d8yDMbp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281741.d8yDMbp6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/smc/smc_core.c:770:6: sparse: sparse: symbol '__smcr_link_clear' was not declared. Should it be static?

vim +/__smcr_link_clear +770 net/smc/smc_core.c

   769	
 > 770	void __smcr_link_clear(struct smc_link *lnk)
   771	{
   772		smc_wr_free_link_mem(lnk);
   773		smc_lgr_put(lnk->lgr);  /* lgr_hold in smcr_link_init() */
   774		memset(lnk, 0, sizeof(struct smc_link));
   775		lnk->state = SMC_LNK_UNUSED;
   776	}
   777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
