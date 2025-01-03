Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4B192B96
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 03:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735874821; cv=none; b=Rp7QxYYI7wmwfYMBwkfEqkAySpyVfW27LFjlSECUPX5aUWsAscEPbg9ZPCZJqlRQJTO5KiE1+PhaFVjck/ltcHIqqllWGGiw6Umq4fjoziFZ+A+m18C6/fsrQFClI2eFEEdck6ymPHf8qfoQFNHusnxB/5AXifCKFoyPHRI7M9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735874821; c=relaxed/simple;
	bh=gAWjNG9Dk3oAXrreEoIseB0NSU3CHUp/jHEYC63NsME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+1D3bUjkcGWtScLQQwyFC6OCs6UGyU8TcG2nNv0PnsAMfxydxdAii5roEi05+GldnVrDINoyZUrtGyZtmv0Ze35van2wRnyyLyMiep7mywaGDCAHG1mUCgTRkIYR1Zz2q5ZuB+l0UU/7bZmstp458f2cSfBmfTLlR5bwLJBH9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jS3Aa/up; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jS3Aa/up"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735874820; x=1767410820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gAWjNG9Dk3oAXrreEoIseB0NSU3CHUp/jHEYC63NsME=;
  b=jS3Aa/upmB5Ux1Oes0548Pwq2PqS3SuMyu7ZrgAd6Rskg9yx05T3FGli
   /rXrpIQ4aivXBOAWYR0e7FWsjhVajlAzoqpg6Fw+9ozyIg8c/2Z0F33KI
   eZ8Ki/Ps3kaVoDEeQ8fPk8KUjaYBIo9PCnRPN4VmU+uKEY/Ixu7K/4Q/4
   VwjNsjSKmGvPzvQTkXYZTpKAgsQNr6x9RIEU3EjupBoezI80hoHvXu9xz
   dzTiP4H53YixdUjpJ5f0pJIr0FQtatiCg0A5y7mcsi7oumVneC2yeFb3b
   OIq5LsCJFC/bhcHR4iFLt3sMkjkH8XhUXt+F4Ik5YKxRy4ZMX0B5haMul
   A==;
X-CSE-ConnectionGUID: EvLMNGbBRS6YJFNMudgSJg==
X-CSE-MsgGUID: oOSVwX1uSuCPbrWjlTgFhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="23716723"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="23716723"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 19:26:58 -0800
X-CSE-ConnectionGUID: coO90XBUQH2EoqXL7t7b4A==
X-CSE-MsgGUID: TNVFTVy1RCKvWjrxXsSgjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106729633"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Jan 2025 19:26:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTYKs-00098t-1C;
	Fri, 03 Jan 2025 03:26:54 +0000
Date: Fri, 3 Jan 2025 11:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>
Subject: [andi-shyti:i2c/i2c-host-next 21/22]
 drivers/i2c/busses/i2c-amd756.c:215:32: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202501031155.RWJvjc8p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   811e13219d56d9bc13ff73029a917e5e5f8401d4
commit: ec6b1f01db79c76b883453ba1d86b0e251a9ab4d [21/22] i2c: amd756: Fix endianness handling for word data
config: m68k-randconfig-r121-20241230 (https://download.01.org/0day-ci/archive/20250103/202501031155.RWJvjc8p-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501031155.RWJvjc8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031155.RWJvjc8p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-amd756.c:215:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-amd756.c:215:32: sparse:     expected unsigned short [usertype] value
   drivers/i2c/busses/i2c-amd756.c:215:32: sparse:     got restricted __le16 [usertype]
>> drivers/i2c/busses/i2c-amd756.c:260:30: sparse: sparse: cast to restricted __le16
>> drivers/i2c/busses/i2c-amd756.c:260:30: sparse: sparse: cast to restricted __le16
>> drivers/i2c/busses/i2c-amd756.c:260:30: sparse: sparse: cast to restricted __le16
>> drivers/i2c/busses/i2c-amd756.c:260:30: sparse: sparse: cast to restricted __le16

vim +215 drivers/i2c/busses/i2c-amd756.c

   180	
   181	/* Return negative errno on error. */
   182	static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
   183			  unsigned short flags, char read_write,
   184			  u8 command, int size, union i2c_smbus_data * data)
   185	{
   186		int i, len;
   187		int status;
   188	
   189		switch (size) {
   190		case I2C_SMBUS_QUICK:
   191			outw_p(((addr & 0x7f) << 1) | (read_write & 0x01),
   192			       SMB_HOST_ADDRESS);
   193			size = AMD756_QUICK;
   194			break;
   195		case I2C_SMBUS_BYTE:
   196			outw_p(((addr & 0x7f) << 1) | (read_write & 0x01),
   197			       SMB_HOST_ADDRESS);
   198			if (read_write == I2C_SMBUS_WRITE)
   199				outb_p(command, SMB_HOST_DATA);
   200			size = AMD756_BYTE;
   201			break;
   202		case I2C_SMBUS_BYTE_DATA:
   203			outw_p(((addr & 0x7f) << 1) | (read_write & 0x01),
   204			       SMB_HOST_ADDRESS);
   205			outb_p(command, SMB_HOST_COMMAND);
   206			if (read_write == I2C_SMBUS_WRITE)
   207				outw_p(data->byte, SMB_HOST_DATA);
   208			size = AMD756_BYTE_DATA;
   209			break;
   210		case I2C_SMBUS_WORD_DATA:
   211			outw_p(((addr & 0x7f) << 1) | (read_write & 0x01),
   212			       SMB_HOST_ADDRESS);
   213			outb_p(command, SMB_HOST_COMMAND);
   214			if (read_write == I2C_SMBUS_WRITE)
 > 215				outw_p(cpu_to_le16(data->word), SMB_HOST_DATA);
   216			size = AMD756_WORD_DATA;
   217			break;
   218		case I2C_SMBUS_BLOCK_DATA:
   219			outw_p(((addr & 0x7f) << 1) | (read_write & 0x01),
   220			       SMB_HOST_ADDRESS);
   221			outb_p(command, SMB_HOST_COMMAND);
   222			if (read_write == I2C_SMBUS_WRITE) {
   223				len = data->block[0];
   224				if (len < 0)
   225					len = 0;
   226				if (len > 32)
   227					len = 32;
   228				outw_p(len, SMB_HOST_DATA);
   229				/* i = inw_p(SMBHSTCNT); Reset SMBBLKDAT */
   230				for (i = 1; i <= len; i++)
   231					outb_p(data->block[i],
   232					       SMB_HOST_BLOCK_DATA);
   233			}
   234			size = AMD756_BLOCK_DATA;
   235			break;
   236		default:
   237			dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
   238			return -EOPNOTSUPP;
   239		}
   240	
   241		/* How about enabling interrupts... */
   242		outw_p(size & GE_CYC_TYPE_MASK, SMB_GLOBAL_ENABLE);
   243	
   244		status = amd756_transaction(adap);
   245		if (status)
   246			return status;
   247	
   248		if ((read_write == I2C_SMBUS_WRITE) || (size == AMD756_QUICK))
   249			return 0;
   250	
   251	
   252		switch (size) {
   253		case AMD756_BYTE:
   254			data->byte = inw_p(SMB_HOST_DATA);
   255			break;
   256		case AMD756_BYTE_DATA:
   257			data->byte = inw_p(SMB_HOST_DATA);
   258			break;
   259		case AMD756_WORD_DATA:
 > 260			data->word = le16_to_cpu(inw_p(SMB_HOST_DATA));
   261			break;
   262		case AMD756_BLOCK_DATA:
   263			data->block[0] = inw_p(SMB_HOST_DATA) & 0x3f;
   264			if(data->block[0] > 32)
   265				data->block[0] = 32;
   266			/* i = inw_p(SMBHSTCNT); Reset SMBBLKDAT */
   267			for (i = 1; i <= data->block[0]; i++)
   268				data->block[i] = inb_p(SMB_HOST_BLOCK_DATA);
   269			break;
   270		}
   271	
   272		return 0;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
