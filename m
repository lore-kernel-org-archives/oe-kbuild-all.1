Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06114F70
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 18:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766254428; cv=none; b=oIQ0Vt8rP0IxTu1xCFFKd0PZfe+fazLxRjUYnmGeTwX/clsdXQjq5IQwDVE8S7sMCIawx7cgnsbKyqCwHp0IwYo54JfEplScZJGOJ8uHzFsuWGD4tXYksxNnD9Qe1CWXE4tfLHYG2zP1tB0eCfcpUBOoJW511btwknnD9KMFRgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766254428; c=relaxed/simple;
	bh=o4Ndtgqvlpqv7raiHtTyY3q+sSkAz90FXBMGB6JFjos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbe6r1bBR4coL81Wznsje5vC1JrdFFjUx3FqWJ0cRTBSQtB1ncqLJr1BGYDa/2mCXweq1LasHIr/A81AaykYVhsjlcqEBO/CfFf4nxjUzXKSPQtfQbs8VnuRK1PURLcNj7JURfFgROL1mOmYtLpgxPDtQEbL6RsaQwRBPfB7lVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUueIXOl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUueIXOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766254427; x=1797790427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4Ndtgqvlpqv7raiHtTyY3q+sSkAz90FXBMGB6JFjos=;
  b=fUueIXOlOCi7pdFnsk3fmqpEnYvwCFB1Q9tGyn5f4kRxXbuhD2OSHgh4
   OyTDfpOMyvITmrK3mi0N5Mi0/N46gfvh7xnr8dVKhrISY75vwrBpNqDFe
   8kmif18z2OOnrAT9kuCM1iXfRhYrKvPHP+hhf6ZvcpjOJ4nuUp6LQlDz2
   E049GhpNSjUwHqgDOboD9SkWK9REwLSjRY9AQlyLu85Zel9VE7mYkFCZF
   1DNT5RRao0BB8iQ9Epw3Q1nuNPM4zXhUb9gFyVkqWw8zVuaCrRkCfbVk6
   MiAC8no4skbLWH8rQ0/YAwYqiAz6SbcIEek6j9dU/NT5k7P8z6xL43R4N
   w==;
X-CSE-ConnectionGUID: w6j//frbQw+Vz+IKgZE1zQ==
X-CSE-MsgGUID: 49tbzevKQuC5NEQaZyMi0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68060029"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68060029"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 10:13:46 -0800
X-CSE-ConnectionGUID: krbmccOuSL2jz0eiDRfklw==
X-CSE-MsgGUID: G4Eaj2fhRyC1rGNjMm7UMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="236555828"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 10:13:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX1SZ-000000004js-0muj;
	Sat, 20 Dec 2025 18:13:43 +0000
Date: Sat, 20 Dec 2025 19:13:35 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for PGP_PRELOAD when selected by PGP_PRELOAD_PUBLIC_KEYS
Message-ID: <202512201919.aBYsjEcq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [1/1] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-kismet-CONFIG_PGP_PRELOAD-CONFIG_PGP_PRELOAD_PUBLIC_KEYS-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201919.aBYsjEcq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201919.aBYsjEcq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201919.aBYsjEcq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PGP_PRELOAD when selected by PGP_PRELOAD_PUBLIC_KEYS
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
