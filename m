Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D812B90
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708796164; cv=none; b=gldoWXrKIp3Eoyamu3MnyfPJnFKDR7+l6VfEmNF7SGT+hWvxw9odDUb0tvvrWmbHJfTM/6GnABnEmwwS13kY6NXe1enIBGR2b+B4Fzc0n1ZPDSCqJ8OiBcYa5pqjn//qZNc5cFBmdFzxwYSj1sxli0gQ/iYzG/LvT5V7VzGviHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708796164; c=relaxed/simple;
	bh=1sQWzFWMH1qLLZCxAXVN+gjkAXHgOjyEF/zyzFrmsgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BwTHzznt1hZUiZIx72PjSkYukNyoLiq3y3geMyR03anz22vboMGRS+kiuLMMdP2/i3uKARWCYmwqreLSLPpmrJ1gSkC+EsoptVF2OKdqi3DbgIoxN0M1+9tz2VW7Vev7tG9/08ouFtb/cQCRl7bOVUE6XSOdA1N6dUs0uD4QKjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7qe6RXv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7qe6RXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708796163; x=1740332163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1sQWzFWMH1qLLZCxAXVN+gjkAXHgOjyEF/zyzFrmsgQ=;
  b=a7qe6RXvSZ7nD+BAOPFsy4J5gbpBAluhT3Tx6Dg7cGZCt+6lG8yhVByp
   w1EdQtWoahUQKFcHDKjfDwPheW30TRZru8j7eCHOGrlwoTZgLxfAovcdL
   P08O83grzXx+KG9tF/NBpvjeKEp1oodTJgBWcqiRugsGvilXPmsPEQVn1
   f3vUCkrg+XEeG31dGPwKOZHYFM8Id1FRhi7KMruhurgUmL14X21HpZ6kl
   OBeGgDY/QOHu7BTJwufX50VXqOnPmXf/zCN6o9SNYZ6T17aohoDWOXh5k
   3aLyjxnZmok8izaSDVanMZlpvdsCaw37Nsm6IHEbj48DMf8QxJkYHcIv4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="2981694"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="2981694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 09:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="10831886"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2024 09:36:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdvw3-0008lU-0R;
	Sat, 24 Feb 2024 17:35:49 +0000
Date: Sun, 25 Feb 2024 01:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regulator-mp8859 5/7] drivers/regulator/mp8859.c:120:23:
 warning: initialization makes integer from pointer without a cast
Message-ID: <202402250123.NxlE22wU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regulator-mp8859
head:   dd4fd1e2b4ddb0dd4b24f7d896fba11e1f83e234
commit: c8ad2f2d94132360954e4d5dbb87a87e9a58d9c3 [5/7] regulator: mp8859: Convert to use a maple tree register cache
config: x86_64-randconfig-161-20240224 (https://download.01.org/0day-ci/archive/20240225/202402250123.NxlE22wU-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402250123.NxlE22wU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402250123.NxlE22wU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/regulator/mp8859.c:119:3: error: 'const struct regmap_config' has no member named 'readable_register'; did you mean 'readable_reg'?
     .readable_register = mp8859_readable,
      ^~~~~~~~~~~~~~~~~
      readable_reg
   drivers/regulator/mp8859.c:120:3: error: 'const struct regmap_config' has no member named 'volatile_register'; did you mean 'volatile_reg'?
     .volatile_register = mp8859_volatile,
      ^~~~~~~~~~~~~~~~~
      volatile_reg
>> drivers/regulator/mp8859.c:120:23: warning: initialization makes integer from pointer without a cast [-Wint-conversion]
     .volatile_register = mp8859_volatile,
                          ^~~~~~~~~~~~~~~
   drivers/regulator/mp8859.c:120:23: note: (near initialization for 'mp8859_regmap.num_reg_defaults_raw')
   drivers/regulator/mp8859.c:120:23: error: initializer element is not computable at load time
   drivers/regulator/mp8859.c:120:23: note: (near initialization for 'mp8859_regmap.num_reg_defaults_raw')


vim +120 drivers/regulator/mp8859.c

90b60aa3876828 Mark Brown    2024-02-24  113  
4444a1c10069e2 Markus Reichl 2020-01-06  114  static const struct regmap_config mp8859_regmap = {
4444a1c10069e2 Markus Reichl 2020-01-06  115  	.reg_bits = 8,
4444a1c10069e2 Markus Reichl 2020-01-06  116  	.val_bits = 8,
4444a1c10069e2 Markus Reichl 2020-01-06  117  	.max_register = MP8859_MAX_REG,
c8ad2f2d941323 Mark Brown    2024-02-24  118  	.cache_type = REGCACHE_MAPLE,
59b550c7bc1384 Mark Brown    2024-02-24 @119  	.readable_register = mp8859_readable,
90b60aa3876828 Mark Brown    2024-02-24 @120  	.volatile_register = mp8859_volatile,
4444a1c10069e2 Markus Reichl 2020-01-06  121  };
4444a1c10069e2 Markus Reichl 2020-01-06  122  

:::::: The code at line 120 was first introduced by commit
:::::: 90b60aa3876828efe3a97b9ba7770890aa04ff31 regulator: mp8859: Specify volatile registers

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
