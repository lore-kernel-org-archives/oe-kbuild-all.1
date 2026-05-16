Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3F2F7EFD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778919509; cv=none; b=AglUtnhlOpQWDobUGkAF9D74LVAYggX4QtgBpeiG6fho0wCOdtaJ5jYsVhVNiWtA9FBhfQCwiKiRGVSo1qlA7p+DDU/VHOpKs01Pq+VAgTiJOYeWGSpvi4rRhsDu+RUB3vNV2Ii5m5xB0JKgZrzKBdsgIwdPNz1JVNK2JM9tZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778919509; c=relaxed/simple;
	bh=MVnaQrgHznLX3MMDHMTYrFd5T8RDqMHE5St3rmL0MPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hUVuOb9kpA9UQMpyPnUAYGNevBR4GryRhO9AJ3cAbxZMcaXK4v3fRneNsqY2hZd7ctmoPxjTBcbonjlAJCS33R/HtzD4a/nUr+ELqeSIzsx7YKH/hUKyY6l6m6anRUPFur54V5f+QCtLgmtTYL/2r7tUEv+dEZTNrWLHlG6oJso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCcSgOxY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCcSgOxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778919508; x=1810455508;
  h=date:from:to:cc:subject:message-id;
  bh=MVnaQrgHznLX3MMDHMTYrFd5T8RDqMHE5St3rmL0MPA=;
  b=YCcSgOxYv1mFbzaFCu+OkwoVU2/58szryhBAy20MhD7rkIvR4ax/Qp03
   SlYM1LD3PFHp1IquZw7lrZvBiKuQaud/E7xLe5cqbWTNb2aW8XVps5xeI
   kalkVkpSyTOKfgWuxONdx6RvRrDaV5fKErmmE38BcP2ic6iiaNmxrEowx
   DzMybsclbQPNBtONZbjK/3FHOj/IChyLFIJul/VJKD0K9+Y3Y6cYWpVll
   w03ZDjgk0rcELqwi4O5juFWAlSLCxReHiwWlhTaD/CD9dBVp60vm59RgW
   nA2xIpdQJWjueIN3R5KfHzTF/bobnvoZMyAFlJFVSUhKV/R9Fq1WDv5cy
   g==;
X-CSE-ConnectionGUID: aVx1vq6cRw6fCPPBTyqblA==
X-CSE-MsgGUID: QrnxvYGBTxC9q6I6lsDq6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90559042"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90559042"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 01:18:27 -0700
X-CSE-ConnectionGUID: POv4N7/0SUuApVkt4M8rMA==
X-CSE-MsgGUID: tGChwVl2Tmaz0y08n/eY8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="243251979"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 May 2026 01:18:24 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOAE1-000000000dt-381Q;
	Sat, 16 May 2026 08:18:21 +0000
Date: Sat, 16 May 2026 16:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nishanth Sampath Kumar <nissampa@cisco.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: drivers/base/regmap/regmap-i2c.c:340:42: sparse: sparse:
 incorrect type in argument 3 (different base types)
Message-ID: <202605161621.mY5zFh4D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d458a240344c4369bf6f3da203f2779515177738
commit: bad4bd28abf4d7cb2adcb39cc0de789729d2cd69 regmap-i2c: add SMBus byte/word reg16 bus for adapters lacking I2C_FUNC_I2C
date:   5 weeks ago
config: x86_64-randconfig-122-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161621.mY5zFh4D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161621.mY5zFh4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bad4bd28abf4 ("regmap-i2c: add SMBus byte/word reg16 bus for adapters lacking I2C_FUNC_I2C")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161621.mY5zFh4D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/regmap/regmap-i2c.c:340:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/base/regmap/regmap-i2c.c:340:42: sparse:     expected unsigned short [usertype] value
   drivers/base/regmap/regmap-i2c.c:340:42: sparse:     got restricted __le16 [usertype]

vim +340 drivers/base/regmap/regmap-i2c.c

   305	
   306	/*
   307	 * SMBus byte/word reg16 support for adapters that have SMBUS_BYTE_DATA
   308	 * and SMBUS_WORD_DATA but lack I2C_FUNC_I2C and I2C_FUNC_SMBUS_I2C_BLOCK,
   309	 * such as the AMD PIIX4.
   310	 *
   311	 * READ:  set 16-bit EEPROM address via write_byte_data(addr_lo, addr_hi),
   312	 *        then sequentially read bytes via read_byte() (EEPROM auto-
   313	 *        increments the address pointer).  Same as the I2C-block reg16
   314	 *        read path above.
   315	 *
   316	 * WRITE: encode the low address byte and data into a word transaction:
   317	 *        write_word_data(addr_hi, (data_byte << 8) | addr_lo).
   318	 *        Only single-byte writes are supported (one value per transaction).
   319	 */
   320	static int regmap_smbus_word_write_reg16(void *context, const void *data,
   321						 size_t count)
   322	{
   323		struct device *dev = context;
   324		struct i2c_client *i2c = to_i2c_client(dev);
   325		u8 addr_hi, addr_lo, val;
   326	
   327		/*
   328		 * data layout: [addr_hi, addr_lo, val0, val1, ...].
   329		 * Only single-byte value writes are supported; multi-byte would
   330		 * require raw I2C (or repeated word writes with incrementing address).
   331		 */
   332		if (count != 3)
   333			return -EINVAL;
   334	
   335		addr_hi = ((u8 *)data)[0];
   336		addr_lo = ((u8 *)data)[1];
   337		val = ((u8 *)data)[2];
   338	
   339		return i2c_smbus_write_word_data(i2c, addr_hi,
 > 340						 cpu_to_le16(((u16)val << 8) | addr_lo));
   341	}
   342	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
