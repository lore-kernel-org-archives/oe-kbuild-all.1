Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEC18635D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 04:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765688083; cv=none; b=uR0aAe7suSSpvjfU3Xu2UZv4AQy0hqanj9SeGdibzEWUtHVLXifoxS38TFab06H/eaJDXMmiO/3ZARqpEnJFUom7J2S7GJz0VcYQT3LzkyiRrdkoFYWUmNZSQKM6mYKfrMPvGsD+J0H53oXxCmGW1o/BNU83ccWry5AnlB3Qzig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765688083; c=relaxed/simple;
	bh=KEZd99+Q0OtWtLVgbRu24GBRHDslLBwWxl6trCDZQ/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNfoau6kB3kkU+gpyYv79uiR/AA3oNWyvargdvpsLQTYKGeDIwXcH3eJCBzCTjcghMIgdK58gtbr5gYLh86M9cC6LpQgRZor1JyCrhkrjeSTt5OZB8XC68L/1BQQbfdV9dUTCet5po79mt8B2esLY4KwKD48sD03SFR+dOJ+q4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAXEEk8c; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAXEEk8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765688082; x=1797224082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KEZd99+Q0OtWtLVgbRu24GBRHDslLBwWxl6trCDZQ/I=;
  b=lAXEEk8cv6PShbqj3oL+Bz5HfS25TVkYr8h4qzvU2E2ZOrfJrDi9vEYh
   AfUP9Y+HcfBmW6fGmfv+dsjs1vz1F0YXf4kfaK/3f/VyFKNAwktrckUvZ
   W7yQ4B9Yq9skr6EXUwB454yxB3arz8EK4JdqzdFuUWKfhIJRu+4x8XJFs
   65g3yCcAD+XT379fos0/nNVq+pj+y9Sst58e31fUXrrSE2DdtxO14xrXR
   mfHGACu4MEmYRXIRkecfQopVAoNaaDX3KJiOnkwHX/US9GIAA2FGsRolZ
   /4BcG2YEjY0L1t5ssMAAVy3J/F9qCfaAGfE4I9cOXXwj/j4+PQXWQgcca
   w==;
X-CSE-ConnectionGUID: YJBQTdSoSSSk8XgIE3uvKA==
X-CSE-MsgGUID: SBH/pJAMQvWcP1X1J+kstA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79088466"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79088466"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 20:54:41 -0800
X-CSE-ConnectionGUID: omM4/BYWTjm9V/JPMRRTrA==
X-CSE-MsgGUID: z4+PsHg2TXaIJ1bo61jvPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="198268292"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 20:54:40 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUe7y-000000002HI-0fWN;
	Sun, 14 Dec 2025 04:54:38 +0000
Date: Sun, 14 Dec 2025 05:54:37 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/40] htmldocs:
 Documentation/networking/device_drivers/ethernet/amazon/ena.rst:209:
 WARNING: Explicit markup ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202512140506.UyLWdtOt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: d230da7d5d3902995793936bf3034d686b29c19f [0/40] net: ena: Add dynamic recycling mechanism for rx buffers
reproduce: (https://download.01.org/0day-ci/archive/20251214/202512140506.UyLWdtOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140506.UyLWdtOt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/seqlock.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/damon.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/highmem.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/highmem-internal.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/migrate.h' failed with return code 1
>> Documentation/networking/device_drivers/ethernet/amazon/ena.rst:209: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_pause_stats ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_fec_stats ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/net.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/skbuff.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/etherdevice.h' failed with return code 2


vim +209 Documentation/networking/device_drivers/ethernet/amazon/ena.rst

1738cd3ed34229 Documentation/networking/ena.txt                                Netanel Belgazal      2016-08-10  207  
d230da7d5d3902 Documentation/networking/device_drivers/ethernet/amazon/ena.rst David Arinzon         2023-06-12  208  .. _`RX copybreak`:
8d299c7e912bd8 Documentation/networking/device_drivers/amazon/ena.rst          Mauro Carvalho Chehab 2020-05-01 @209  RX copybreak
8d299c7e912bd8 Documentation/networking/device_drivers/amazon/ena.rst          Mauro Carvalho Chehab 2020-05-01  210  ============
1738cd3ed34229 Documentation/networking/ena.txt                                Netanel Belgazal      2016-08-10  211  The rx_copybreak is initialized by default to ENA_DEFAULT_RX_COPYBREAK
1738cd3ed34229 Documentation/networking/ena.txt                                Netanel Belgazal      2016-08-10  212  and can be configured by the ETHTOOL_STUNABLE command of the
1738cd3ed34229 Documentation/networking/ena.txt                                Netanel Belgazal      2016-08-10  213  SIOCETHTOOL ioctl.
1738cd3ed34229 Documentation/networking/ena.txt                                Netanel Belgazal      2016-08-10  214  

:::::: The code at line 209 was first introduced by commit
:::::: 8d299c7e912bd8ebb88b9ac2b8e336c9878783aa docs: networking: device drivers: convert amazon/ena.txt to ReST

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
