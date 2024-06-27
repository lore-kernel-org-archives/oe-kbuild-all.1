Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512A131E41
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719528684; cv=none; b=W1zTGJmR6RJ/xatvdQqcREDyaI4pFvthdqkuErEzPskIARF3GjoTpvtJg+Fqo/9ZJjZbVpYw55qUYnVoJ2QTH+ejwD0rNU1a2Oza3aFD7XTzk86BzLZBLIvDugWJPsrvChC3gypC74bKXzezJSKJkAgHQZ3jQ5CJmaEOflM4Ic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719528684; c=relaxed/simple;
	bh=Qp3t+2AZNTz7S6USwjudKOpisDN4Au5Adzvy/m0JnsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vn/dnVf9PRDV5N87sv9BqVKTA8KK/CWn2BN+mIz9r7XJSsM6V0JWl7cEsUk5aWOmaB93wDNRzGAkbPMWuyzK3EaIVkEv+fNJNxUKk2QJErf5Cdc4wfxS0fMBB+NgDAAeQC+W/DExCFppjoZ76aiOBiwgd5WZlQllTtNA7gFpLjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnhzPx6l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnhzPx6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719528681; x=1751064681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qp3t+2AZNTz7S6USwjudKOpisDN4Au5Adzvy/m0JnsU=;
  b=FnhzPx6lAQopi0yE1uAfqQ+lWBeo3a2zv0GL4EQvnSETcJ8b4EfQxD6I
   mdBXLfrh4PLVknYRUS0jgysLMfTt95bfc73RJpOStx6WuseRHHqwc0Umj
   QFG+bXW14B1PpBslS4MM7SWmkCdLiCna73a0Gei3FLDq4mZ2eYC1sx+XK
   crMBayiQbvb7lvOFGTpm/6JJO5pGK2CXzv8fXz3UVJgK/Q6MIw+kdMlF0
   lAMFaGHRyv3uAj23rNwFQjJ7Mp97phCq9dqKDzkTyl7sHIyNPEt16xDGL
   B35epfBmvExDsQxF10VHJLWVKttLo4QcTDsT/veTMKEztj3mvhi9uFrPU
   w==;
X-CSE-ConnectionGUID: JK9RPXLOTI6nXPvo3dPw5g==
X-CSE-MsgGUID: 5eKpjrxcSyeQQ1U9Ahao8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="39210648"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="39210648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 15:51:21 -0700
X-CSE-ConnectionGUID: g6JO9UYcRqqtEuB69aSX6g==
X-CSE-MsgGUID: BzKNMDTFT+68DmlgLtljsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="49723084"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jun 2024 15:51:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMxxW-000Gba-0B;
	Thu, 27 Jun 2024 22:51:18 +0000
Date: Fri, 28 Jun 2024 06:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Khanh Le <khanh.le.xr@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>
Subject: [morimoto:renesas-bsp/v6.1.95-2024-06-24-GrayHawk-sound 706/709]
 sound/soc/codecs/ak4619.c:824:35: error: 'REGCACHE_MAPLE' undeclared here
 (not in a function); did you mean 'REGCACHE_NONE'?
Message-ID: <202406280614.7uuZC9HR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.95-2024-06-24-GrayHawk-sound
head:   a2ad04eb2a203f409e8218f127ade36084b87721
commit: 79d8f008f407299e889b60bca90e182ae4a0eded [706/709] ASoC: Add ak4619 codec support
config: x86_64-buildonly-randconfig-004-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280614.7uuZC9HR-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280614.7uuZC9HR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280614.7uuZC9HR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/ak4619.c:824:35: error: 'REGCACHE_MAPLE' undeclared here (not in a function); did you mean 'REGCACHE_NONE'?
     824 |         .cache_type             = REGCACHE_MAPLE,
         |                                   ^~~~~~~~~~~~~~
         |                                   REGCACHE_NONE


vim +824 sound/soc/codecs/ak4619.c

   817	
   818	static const struct regmap_config ak4619_regmap_cfg = {
   819		.reg_bits		= 8,
   820		.val_bits		= 8,
   821		.max_register		= 0x14,
   822		.reg_defaults		= ak4619_reg_defaults,
   823		.num_reg_defaults	= ARRAY_SIZE(ak4619_reg_defaults),
 > 824		.cache_type		= REGCACHE_MAPLE,
   825	};
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
