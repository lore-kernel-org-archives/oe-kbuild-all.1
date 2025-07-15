Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C37E1F1537
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752622916; cv=none; b=aEGFUIEEM5CI+1m6/bx7HsXL2ihTrkVB9WxP5/l8Lacq7sQVqv80Ch7QZMQuPRg1TcHSaNL6sbbFHWs7gxe6izeRHUOHP6hLkow+0tAoO7txYEm4+F42a+YY7jr+XsBcEY8mOhj2YEkAf2YF+tZgzYiFZBak8x8GovOAJc4QijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752622916; c=relaxed/simple;
	bh=kLugsfffY4OQhMK+xzdAyEOOogUU76zOvcXRxRGXvFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e2BDpxsv7PNVPJ8P/2dzgWjSV6+2WlAfSfqLvakmkiOTbsu5gXr+YkyUb4gT6I1643MAht47sK9fggqgmaPG1vvNwz1NDCWmfUYHlnwxT4wnZdExjiowQkfJNxNMIBeduy4E+PHSjc3YgJ+G2BEPhoPHbRBxqgmOcfmk7kDkXBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckOzT/EB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckOzT/EB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752622914; x=1784158914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLugsfffY4OQhMK+xzdAyEOOogUU76zOvcXRxRGXvFc=;
  b=ckOzT/EBfO8sUzXLAI2uAAWX6ZbvFH4x2oGunJjR7CL8VAPTWihPH82i
   NXU2VdNvYggFSLEDfKCDxD9xtTEyIs+VrIZD5tMtsYgTYntxvvqBRI7Gy
   iY1A1P9iLqUjwbziyRXOacLXzSV0tv1EwteLBpJhFG7b9vzTI5F899+dy
   WbCdb+fJQsvCf+GIcwaW/na99Er18u6cf7UQfkabqD120JokVZvI/Bh5w
   795AC6itFdAykodSOOlCrChSL7eKPcTcRfSLNKJ1OpI8Yu+l7pQArO1TR
   jiKAxL6EPwczdsjpiS965DJuPM4DkKbs2FMhKtW9+vJJpK42jcNtxaG8y
   w==;
X-CSE-ConnectionGUID: FrdQP2cgTcSITwoGP5MMHA==
X-CSE-MsgGUID: YcbdzR0xTVGPLOVLTXXgfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55003179"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="55003179"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 16:41:53 -0700
X-CSE-ConnectionGUID: FsNcgHqdQNSomliFeRBTYA==
X-CSE-MsgGUID: XA7KGNinSVGzyWBLvLVo1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="157455582"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jul 2025 16:41:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubpHR-000Bff-1W;
	Tue, 15 Jul 2025 23:41:49 +0000
Date: Wed, 16 Jul 2025 07:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 16/22]
 drivers/i2c/i2c-core-smbus.c:650: multiple definition of
 `__pfx_bpf_tracing_multi_attach';
 drivers/i2c/i2c-core-base.o:drivers/i2c/i2c-core-base.c:2349: first defined
 here
Message-ID: <202507160750.JJCUHDaT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   d0503d4013c49a3fde856947dfffe6c80c178eb1
commit: 32063d40ee98cf6c450c02c5ed3cbfd86ff70c63 [16/22] bpf: Add support to create tracing multi link
config: x86_64-randconfig-072-20250716 (https://download.01.org/0day-ci/archive/20250716/202507160750.JJCUHDaT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160750.JJCUHDaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160750.JJCUHDaT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i2c/i2c-core-smbus.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:837: multiple definition of `bpf_tracing_multi_attach'; drivers/i2c/i2c-core-base.o:include/linux/trace_events.h:837: first defined here
   ld: drivers/i2c/i2c-core-smbus.o: in function `__pfx_bpf_tracing_multi_attach':
>> drivers/i2c/i2c-core-smbus.c:650: multiple definition of `__pfx_bpf_tracing_multi_attach'; drivers/i2c/i2c-core-base.o:drivers/i2c/i2c-core-base.c:2349: first defined here
   ld: drivers/i2c/i2c-core-slave.o: in function `bpf_tracing_multi_attach':
   include/linux/trace_events.h:837: multiple definition of `bpf_tracing_multi_attach'; drivers/i2c/i2c-core-base.o:include/linux/trace_events.h:837: first defined here
   ld: drivers/i2c/i2c-core-slave.o: in function `__pfx_bpf_tracing_multi_attach':
   drivers/i2c/i2c-core-slave.c:127: multiple definition of `__pfx_bpf_tracing_multi_attach'; drivers/i2c/i2c-core-base.o:drivers/i2c/i2c-core-base.c:2349: first defined here


vim +650 drivers/i2c/i2c-core-smbus.c

22c78d1cce1040 Wolfram Sang 2017-05-23  621  
22c78d1cce1040 Wolfram Sang 2017-05-23  622  /**
22c78d1cce1040 Wolfram Sang 2017-05-23  623   * i2c_smbus_read_i2c_block_data_or_emulated - read block or emulate
22c78d1cce1040 Wolfram Sang 2017-05-23  624   * @client: Handle to slave device
22c78d1cce1040 Wolfram Sang 2017-05-23  625   * @command: Byte interpreted by slave
22c78d1cce1040 Wolfram Sang 2017-05-23  626   * @length: Size of data block; SMBus allows at most I2C_SMBUS_BLOCK_MAX bytes
22c78d1cce1040 Wolfram Sang 2017-05-23  627   * @values: Byte array into which data will be read; big enough to hold
22c78d1cce1040 Wolfram Sang 2017-05-23  628   *	the data returned by the slave.  SMBus allows at most
22c78d1cce1040 Wolfram Sang 2017-05-23  629   *	I2C_SMBUS_BLOCK_MAX bytes.
22c78d1cce1040 Wolfram Sang 2017-05-23  630   *
22c78d1cce1040 Wolfram Sang 2017-05-23  631   * This executes the SMBus "block read" protocol if supported by the adapter.
22c78d1cce1040 Wolfram Sang 2017-05-23  632   * If block read is not supported, it emulates it using either word or byte
22c78d1cce1040 Wolfram Sang 2017-05-23  633   * read protocols depending on availability.
22c78d1cce1040 Wolfram Sang 2017-05-23  634   *
22c78d1cce1040 Wolfram Sang 2017-05-23  635   * The addresses of the I2C slave device that are accessed with this function
22c78d1cce1040 Wolfram Sang 2017-05-23  636   * must be mapped to a linear region, so that a block read will have the same
22c78d1cce1040 Wolfram Sang 2017-05-23  637   * effect as a byte read. Before using this function you must double-check
22c78d1cce1040 Wolfram Sang 2017-05-23  638   * if the I2C slave does support exchanging a block transfer with a byte
22c78d1cce1040 Wolfram Sang 2017-05-23  639   * transfer.
22c78d1cce1040 Wolfram Sang 2017-05-23  640   */
22c78d1cce1040 Wolfram Sang 2017-05-23  641  s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
22c78d1cce1040 Wolfram Sang 2017-05-23  642  					      u8 command, u8 length, u8 *values)
22c78d1cce1040 Wolfram Sang 2017-05-23  643  {
22c78d1cce1040 Wolfram Sang 2017-05-23  644  	u8 i = 0;
22c78d1cce1040 Wolfram Sang 2017-05-23  645  	int status;
22c78d1cce1040 Wolfram Sang 2017-05-23  646  
22c78d1cce1040 Wolfram Sang 2017-05-23  647  	if (length > I2C_SMBUS_BLOCK_MAX)
22c78d1cce1040 Wolfram Sang 2017-05-23  648  		length = I2C_SMBUS_BLOCK_MAX;
22c78d1cce1040 Wolfram Sang 2017-05-23  649  
22c78d1cce1040 Wolfram Sang 2017-05-23 @650  	if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_BLOCK))
22c78d1cce1040 Wolfram Sang 2017-05-23  651  		return i2c_smbus_read_i2c_block_data(client, command, length, values);
22c78d1cce1040 Wolfram Sang 2017-05-23  652  
22c78d1cce1040 Wolfram Sang 2017-05-23  653  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BYTE_DATA))
22c78d1cce1040 Wolfram Sang 2017-05-23  654  		return -EOPNOTSUPP;
22c78d1cce1040 Wolfram Sang 2017-05-23  655  
22c78d1cce1040 Wolfram Sang 2017-05-23  656  	if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_WORD_DATA)) {
22c78d1cce1040 Wolfram Sang 2017-05-23  657  		while ((i + 2) <= length) {
22c78d1cce1040 Wolfram Sang 2017-05-23  658  			status = i2c_smbus_read_word_data(client, command + i);
22c78d1cce1040 Wolfram Sang 2017-05-23  659  			if (status < 0)
22c78d1cce1040 Wolfram Sang 2017-05-23  660  				return status;
22c78d1cce1040 Wolfram Sang 2017-05-23  661  			values[i] = status & 0xff;
22c78d1cce1040 Wolfram Sang 2017-05-23  662  			values[i + 1] = status >> 8;
22c78d1cce1040 Wolfram Sang 2017-05-23  663  			i += 2;
22c78d1cce1040 Wolfram Sang 2017-05-23  664  		}
22c78d1cce1040 Wolfram Sang 2017-05-23  665  	}
22c78d1cce1040 Wolfram Sang 2017-05-23  666  
22c78d1cce1040 Wolfram Sang 2017-05-23  667  	while (i < length) {
22c78d1cce1040 Wolfram Sang 2017-05-23  668  		status = i2c_smbus_read_byte_data(client, command + i);
22c78d1cce1040 Wolfram Sang 2017-05-23  669  		if (status < 0)
22c78d1cce1040 Wolfram Sang 2017-05-23  670  			return status;
22c78d1cce1040 Wolfram Sang 2017-05-23  671  		values[i] = status;
22c78d1cce1040 Wolfram Sang 2017-05-23  672  		i++;
22c78d1cce1040 Wolfram Sang 2017-05-23  673  	}
22c78d1cce1040 Wolfram Sang 2017-05-23  674  
22c78d1cce1040 Wolfram Sang 2017-05-23  675  	return i;
22c78d1cce1040 Wolfram Sang 2017-05-23  676  }
22c78d1cce1040 Wolfram Sang 2017-05-23  677  EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data_or_emulated);
3c0a60bee1d157 Phil Reid    2017-08-24  678  

:::::: The code at line 650 was first introduced by commit
:::::: 22c78d1cce104072747023d2ae0351bf3f97d725 i2c: break out smbus support into separate file

:::::: TO: Wolfram Sang <wsa@the-dreams.de>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
