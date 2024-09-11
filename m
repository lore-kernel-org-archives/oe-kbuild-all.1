Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA36A5337F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726088479; cv=none; b=HwIWylZs6gi4iy0xe5rdvmAZPuH4UoXNG961J78JRmNtadBRtgwZgAejVbDu+NWU5rhsDIsdmnqSLiidACGLoDM1AbGw3Iif4mHDaZ9PtGdQWfvooRdim8J2cZohVS0BBrvHF5tXouQsd8NmTl2iJRKdN+ZnFbcIcIjPPIX4kNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726088479; c=relaxed/simple;
	bh=BgXp87BEcQuBiuO2n6RZyLWac0IGuAQ6WabuYyM2Y5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kxfHQMGLtzIFS4pF+GRSNKZl1VpLpvtNZVpMeZoPHJ54M5FvFHyZdJ76KntKk0Ssrqc+WtiMMDEJE9m2e6V+/FUnUfVO54d5onMpJIsGRS0LXIaieY6DhfSCKIHzoPGIlEbt//+RLL8+hiplFFfhPFkIBXhn+SJlQBnnrxSNYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nG9AnkZN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nG9AnkZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726088478; x=1757624478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BgXp87BEcQuBiuO2n6RZyLWac0IGuAQ6WabuYyM2Y5Q=;
  b=nG9AnkZN7HbW5QRdqXj/Qh3anixbdfxBPwrSEaYnyWhLyL79DzTfZFkS
   e3XuIIAHX8bYLYMrjAQfPKwTEx2x6yr+ZZ2C4dhq2ZLkA9fkuDWV54hE9
   rp2DN4RShKGq62Henxvwl+Ku+FDIYMUbpWKXA4wJeys5fLziGJ3cUzZFb
   MPWG8tdpLIg8SmRYMr85FwAQnDSqi0kzij9phfNxMecxFePvLSaw+zE5x
   /olFQsVlDBuzOSqMJuB3j8mjWBHfsVUKE01FiDNWj7BE0TKmqvo8c/U2V
   e7K0TEZeRfktgdQRI5+SCr/zAZhVayhUnT8azw3ds1r5Dp2hgeaTMaVSz
   A==;
X-CSE-ConnectionGUID: dgAggpozS5e5/3N38avNsw==
X-CSE-MsgGUID: Nn8HAMxNQtyvJVEfCfPviA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25058352"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="25058352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 14:01:18 -0700
X-CSE-ConnectionGUID: FyoCbAfyRamzHif5Zx88mQ==
X-CSE-MsgGUID: slopr+PRSPO/lQ16IaHu3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="90742382"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2024 14:01:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soUSg-000498-0S;
	Wed, 11 Sep 2024 21:01:14 +0000
Date: Thu, 12 Sep 2024 05:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenkuan Wang <Wenkuan.Wang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24990/30000]
 arch/x86/kernel/alternative.c:78:21: sparse: sparse: symbol 'x86nops' was
 not declared. Should it be static?
Message-ID: <202409120441.dVS6opjE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e23f76121de26a57b9f398c8b1ce5405a88acd8a
commit: 8243b036681b074fab34e18024d1ee24c656b432 [24990/30000] x86: Remove dynamic NOP selection
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240912/202409120441.dVS6opjE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120441.dVS6opjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120441.dVS6opjE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/alternative.c:78:21: sparse: sparse: symbol 'x86nops' was not declared. Should it be static?

vim +/x86nops +78 arch/x86/kernel/alternative.c

    77	
  > 78	const unsigned char x86nops[] =
    79	{
    80		BYTES_NOP1,
    81		BYTES_NOP2,
    82		BYTES_NOP3,
    83		BYTES_NOP4,
    84		BYTES_NOP5,
    85		BYTES_NOP6,
    86		BYTES_NOP7,
    87		BYTES_NOP8,
    88	};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
