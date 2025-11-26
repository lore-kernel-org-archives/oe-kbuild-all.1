Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2500C339B32
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174130; cv=none; b=rVy5Ubqp82q9BaWHHx1S8/WKl32aRWheo+sh6VJtGGcBFcnbOYgAeg6GGFMZsd0jDCvSIj/JfMmfVcVK/9wWOjeYEhJTTxeuiDcc8DqAWiD0+jjoa8qZLQVwwNb1sqQhYS5xP9IlMLPRuMFUANdJDCPVJpwRoE4+SZdkaQnVhwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174130; c=relaxed/simple;
	bh=EA0qg7s69O4kUUWMyol3dChLvIggMUF5JJK0dev1t1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXmFTRRCw+Ja0UT3izWyhXIILnp9n0lYdL8mHBOTgkS8CnobRf2I0Kmy32pyGVPhM3THooor6IabYHuE/d8Ffn2VgmB/EuWPAywHWC4Q/rGbX1n1PYOB+3R+DQXM5zGJC/lAyKQcvcS0iDyFoN8P5wD2IrKzcJMUPsy9qomTPac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQArnRAb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQArnRAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764174129; x=1795710129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EA0qg7s69O4kUUWMyol3dChLvIggMUF5JJK0dev1t1E=;
  b=PQArnRAbmpw0KJw6bzf0fpn+p9jNcZCX1caXa/qOSsM4f+fC/yALqgxK
   /36drk+Z3Z8z5elLYbfJWgjRfiQbxfhm5+vYv9ok7QjWdQ1uD3WEel23B
   Vdatq3c/ev0ErL0KvY2ierurIzWFWu1kM7ta10Fl6qz93sE7jui+A+pIi
   u802gp5fn2sQZivGbtCPwahs9cSKfAs4iG9HtXSGaXQq04IuH2BY1Q7YT
   wTfC9wiYVHEcv8tShvGxx80w+Hs53IeSwTCYIWKVKrJH3117fkQNwLIxM
   y7Brf2YBuP7rImODZjhqbV0OgfzI7+ANvTrXybVZQ1udbtj9AbT4ITQea
   Q==;
X-CSE-ConnectionGUID: fQdh5fd/SXiBZTBAWiUEYA==
X-CSE-MsgGUID: 20zxCEQsRJSL04Evv+yjqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66293160"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66293160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 08:22:08 -0800
X-CSE-ConnectionGUID: 1X10q17RQh6rmdOnpRtl1w==
X-CSE-MsgGUID: 8jfCjTc9RaCq01vOr25w9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197313627"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2025 08:22:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOIHN-0000000036d-1Op7;
	Wed, 26 Nov 2025 16:22:05 +0000
Date: Thu, 27 Nov 2025 00:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tsu 3/8] drivers/net/ethernet/cadence/macb_main.c:5437:12:
 error: use of undeclared identifier 'at91_default_usrio'
Message-ID: <202511270039.VhU8QJeP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tsu
head:   ee448f4b363d21bc51b5945c31c12fc7a8810df4
commit: 597a70567d1d4a422e6ec506fd641d4448131ac9 [3/8] net: macb: rename macb_default_usrio to at91_default_usrio as not all platforms have mii mode control in usrio
config: i386-randconfig-007-20251126 (https://download.01.org/0day-ci/archive/20251127/202511270039.VhU8QJeP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270039.VhU8QJeP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270039.VhU8QJeP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:5437:12: error: use of undeclared identifier 'at91_default_usrio'
    5437 |         .usrio = &at91_default_usrio,
         |                   ^
   1 error generated.


vim +/at91_default_usrio +5437 drivers/net/ethernet/cadence/macb_main.c

  5429	
  5430	static const struct macb_config default_gem_config = {
  5431		.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
  5432			MACB_CAPS_JUMBO |
  5433			MACB_CAPS_GEM_HAS_PTP,
  5434		.dma_burst_length = 16,
  5435		.clk_init = macb_clk_init,
  5436		.init = macb_init,
> 5437		.usrio = &at91_default_usrio,
  5438		.jumbo_max_len = 10240,
  5439	};
  5440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
