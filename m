Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2A16A395
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 05:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756531551; cv=none; b=kWqdmVPGErfdMzvnnN4SjwdC35WzsSDq041TCz/TF8s0EMxEc/+A0qZ7oXyDqNnsEp42c3m6ckQirSIfh+R+dSnPZphG7ON1Wm/pNK+rBNJPkqASYA4AIs8hYep9M4xQK/rur6dAVdAofmWTkBgfwpPYS6Lo3TqeOucwG1f8lqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756531551; c=relaxed/simple;
	bh=RYOT5F6rgDSaqyBqxp3vBMJ9W+6bau1TP/g4axzG9Co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drMdzmeR2277vYJ+bDNo0sRXvZ1WP3TIPcynX2TUr/HKRX2sc8UG0pdQbpyPhDnDueCkwiRKddgV7G0qwa6fVmUbu5jauHXfreVs1oWryVmhGYGIG7Vj/7MTZtJuxfVIy37owhn+FAb/W6YDDQhzXkVol4/vM8cUKmoiyv2mJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQ7UPwea; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQ7UPwea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756531550; x=1788067550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RYOT5F6rgDSaqyBqxp3vBMJ9W+6bau1TP/g4axzG9Co=;
  b=bQ7UPweaMSnjSWJzu0mFdYdnL48pZX7DgkE1xz5DmhTVPEykx34PVa8w
   TeTTnGLEg9xy3HlUVjsvfv4uB32+o3hiLQtSuuMC6d4UEk6caMUolDoCT
   3v37F/zH90+ebox5oxCmLXa8Dt8HNWvtGYqOt+ryqwRy0l5o6HUn4fYTs
   4oFNL6xCrdudX/tJDdL3jGREtuS0IXaWm7umWDY+7FMhxyVF7PUTWopPm
   fkNs3FTiPkSawLVipVn8YbY/EBZX4687RE6tpo0djQsj+e6HuD3PazjkK
   P3ZG4AVJL4PMisGMmW+pMVBngG9Kk6pb5U/vsDM5T5zyY6KtbgoehbSMl
   Q==;
X-CSE-ConnectionGUID: HiwR1PGKTDKik0vO4UY80A==
X-CSE-MsgGUID: PCdxMKj2RQ+gprWv/yXNxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81404612"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81404612"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 22:25:49 -0700
X-CSE-ConnectionGUID: AGuD98y8SROAMP6v0CT32Q==
X-CSE-MsgGUID: pcWPCgXRRhOGBRAVh6B2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170450151"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Aug 2025 22:25:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usE5H-000VBr-00;
	Sat, 30 Aug 2025 05:25:17 +0000
Date: Sat, 30 Aug 2025 13:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sven:wip/atcphy 20/21] drivers/soc/apple/tunable.c:43:44: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202508301336.YPpqlSZh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git wip/atcphy
head:   97d802951dc91e73bc9884fecd5c79504aabc13b
commit: c9f84c19a14e5037a2d3f58ea9a52cbfd8ab5fa7 [20/21] phy: apple: Add Apple Type-C PHY
config: sparc64-randconfig-r122-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301336.YPpqlSZh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250830/202508301336.YPpqlSZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301336.YPpqlSZh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/apple/tunable.c:43:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 const [usertype] *cur @@     got restricted __le32 const [usertype] *p @@
   drivers/soc/apple/tunable.c:43:44: sparse:     expected restricted __be32 const [usertype] *cur
   drivers/soc/apple/tunable.c:43:44: sparse:     got restricted __le32 const [usertype] *p
>> drivers/soc/apple/tunable.c:43:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 const [usertype] *p @@     got restricted __be32 const [usertype] * @@
   drivers/soc/apple/tunable.c:43:19: sparse:     expected restricted __le32 const [usertype] *p
   drivers/soc/apple/tunable.c:43:19: sparse:     got restricted __be32 const [usertype] *
   drivers/soc/apple/tunable.c:44:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 const [usertype] *cur @@     got restricted __le32 const [usertype] *p @@
   drivers/soc/apple/tunable.c:44:44: sparse:     expected restricted __be32 const [usertype] *cur
   drivers/soc/apple/tunable.c:44:44: sparse:     got restricted __le32 const [usertype] *p
   drivers/soc/apple/tunable.c:44:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 const [usertype] *p @@     got restricted __be32 const [usertype] * @@
   drivers/soc/apple/tunable.c:44:19: sparse:     expected restricted __le32 const [usertype] *p
   drivers/soc/apple/tunable.c:44:19: sparse:     got restricted __be32 const [usertype] *
   drivers/soc/apple/tunable.c:45:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 const [usertype] *cur @@     got restricted __le32 const [usertype] *p @@
   drivers/soc/apple/tunable.c:45:44: sparse:     expected restricted __be32 const [usertype] *cur
   drivers/soc/apple/tunable.c:45:44: sparse:     got restricted __le32 const [usertype] *p
   drivers/soc/apple/tunable.c:45:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 const [usertype] *p @@     got restricted __be32 const [usertype] * @@
   drivers/soc/apple/tunable.c:45:19: sparse:     expected restricted __le32 const [usertype] *p
   drivers/soc/apple/tunable.c:45:19: sparse:     got restricted __be32 const [usertype] *

vim +43 drivers/soc/apple/tunable.c

9eb4346f8d37bf Sven Peter 2025-08-27  17  
9eb4346f8d37bf Sven Peter 2025-08-27  18  int devm_apple_parse_tunable(struct device *dev, struct device_node *np,
9eb4346f8d37bf Sven Peter 2025-08-27  19  			     struct apple_tunable *tunable, const char *name)
9eb4346f8d37bf Sven Peter 2025-08-27  20  {
9eb4346f8d37bf Sven Peter 2025-08-27  21  	struct property *prop;
9eb4346f8d37bf Sven Peter 2025-08-27  22  	const __le32 *p = NULL;
9eb4346f8d37bf Sven Peter 2025-08-27  23  	int i;
9eb4346f8d37bf Sven Peter 2025-08-27  24  
9eb4346f8d37bf Sven Peter 2025-08-27  25  	prop = of_find_property(np, name, NULL);
9eb4346f8d37bf Sven Peter 2025-08-27  26  	if (!prop) {
9eb4346f8d37bf Sven Peter 2025-08-27  27  		dev_err(dev, "tunable %s not found\n", name);
9eb4346f8d37bf Sven Peter 2025-08-27  28  		return -ENOENT;
9eb4346f8d37bf Sven Peter 2025-08-27  29  	}
9eb4346f8d37bf Sven Peter 2025-08-27  30  
9eb4346f8d37bf Sven Peter 2025-08-27  31  	if (prop->length % (3 * sizeof(u32)))
9eb4346f8d37bf Sven Peter 2025-08-27  32  		return -EINVAL;
9eb4346f8d37bf Sven Peter 2025-08-27  33  
9eb4346f8d37bf Sven Peter 2025-08-27  34  	tunable->sz = prop->length / (3 * sizeof(u32));
9eb4346f8d37bf Sven Peter 2025-08-27  35  	tunable->values = devm_kcalloc(dev, tunable->sz,
9eb4346f8d37bf Sven Peter 2025-08-27  36  				       sizeof(*tunable->values), GFP_KERNEL);
9eb4346f8d37bf Sven Peter 2025-08-27  37  	if (!tunable->values) {
9eb4346f8d37bf Sven Peter 2025-08-27  38  		tunable->sz = 0;
9eb4346f8d37bf Sven Peter 2025-08-27  39  		return -ENOMEM;
9eb4346f8d37bf Sven Peter 2025-08-27  40  	}
9eb4346f8d37bf Sven Peter 2025-08-27  41  
9eb4346f8d37bf Sven Peter 2025-08-27  42  	for (i = 0; i < tunable->sz; ++i) {
9eb4346f8d37bf Sven Peter 2025-08-27 @43  		p = of_prop_next_u32(prop, p, &tunable->values[i].offset);
9eb4346f8d37bf Sven Peter 2025-08-27  44  		p = of_prop_next_u32(prop, p, &tunable->values[i].mask);
9eb4346f8d37bf Sven Peter 2025-08-27  45  		p = of_prop_next_u32(prop, p, &tunable->values[i].value);
9eb4346f8d37bf Sven Peter 2025-08-27  46  	}
9eb4346f8d37bf Sven Peter 2025-08-27  47  
9eb4346f8d37bf Sven Peter 2025-08-27  48  	return 0;
9eb4346f8d37bf Sven Peter 2025-08-27  49  }
9eb4346f8d37bf Sven Peter 2025-08-27  50  EXPORT_SYMBOL(devm_apple_parse_tunable);
9eb4346f8d37bf Sven Peter 2025-08-27  51  

:::::: The code at line 43 was first introduced by commit
:::::: 9eb4346f8d37bff8331dc2c24ca02fe9f27f7b9c soc: apple: Add hardware tunable support

:::::: TO: Sven Peter <sven@kernel.org>
:::::: CC: Sven Peter <sven@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
