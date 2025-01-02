Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E077E1BC064
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 23:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735859737; cv=none; b=Kq3lX59DgYS1a4sTdcap+4L9TNW6bEp/Q7fVxJsMhPgHYwMM/1l12z0LN/UPNyMxHae2Dfps3ZN270bESE9e4Rqwu96yfzph9JohO4pwqeNb303XwjqZ455RWiHo25PFwo1MYQQi9toylTpWDyll4Pf3gKY5xUkHyt+mhnYqweU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735859737; c=relaxed/simple;
	bh=J3LzGUAZPKd6kbgYlWDjX/JFJnzoiTZCH5MUhC0wcVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/Hu9tzXg91P8ZOeRT1f+ZVgNPEUOeRiId7MbMzY8AE/CR1WYyl8Dveep8VreTDPTNBObXNegf9mD5sgd/C9dgvmVJFbHVbjeBdTZIRtozAj4kF3SD4q2ZWBJAaz22K9GjC9DF4vJyzZEN6aK130W6Xlcs6xjQV7ISHQof24hmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+j3RgWc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+j3RgWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735859735; x=1767395735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J3LzGUAZPKd6kbgYlWDjX/JFJnzoiTZCH5MUhC0wcVc=;
  b=m+j3RgWcmJ4KjT4sWvPSgGVoIL9AICKdsp+GhYUX0Q7QQYBwoTQfmWJr
   F9tQhNRPAr8zaIT8nLvYQBe8m5sXgEk2aWXZd+9ZZvXDXKdGzU4uhHOOV
   XPk1Eb4HGQMuvp1Rn632c6ctSqWkulFfuaHo9Zh+qZ5Kg0w85jUwBV28n
   p4YawqTr6YeJH6clwuFIqTyE5P0i7z5vnWozPWRHHX7/vXxuSne1epHak
   4wGCoMzTM5QLvqZLy/GBwQNu5sotHBRNlMGuJ3xEII45pfsl2VaQouBKo
   DrIrzVgInaS3KWTdXvfmKOW2fY5ucHHwqJBzNhEzARuNPfNSI5i3aG46U
   Q==;
X-CSE-ConnectionGUID: /iWZWvTTQp+SgA2SOPeQ6w==
X-CSE-MsgGUID: AV8oMRz6SMuF6+BmAKzBNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="40033023"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="40033023"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 15:15:32 -0800
X-CSE-ConnectionGUID: IhdBgGhsQ7qR9o5fNfh3TQ==
X-CSE-MsgGUID: q6NHdRZWSYuX29mn/fT7iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101708345"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jan 2025 15:15:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTUPY-0008x5-2M;
	Thu, 02 Jan 2025 23:15:28 +0000
Date: Fri, 3 Jan 2025 07:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <202501030714.Z5nsNXq4-lkp@intel.com>
References: <20250101103422.30523-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250101103422.30523-1-evepolonium@gmail.com>

Hi Atharva,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.13-rc5]
[also build test WARNING on linus/master next-20241220]
[cannot apply to andi-shyti/i2c/i2c-host]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Atharva-Tiwari/i2c-amd756-Fix-endianness-handling-for-word-data/20250101-183620
base:   v6.13-rc5
patch link:    https://lore.kernel.org/r/20250101103422.30523-1-evepolonium%40gmail.com
patch subject: [PATCH] i2c: amd756: Fix endianness handling for word data
config: powerpc-randconfig-r111-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030714.Z5nsNXq4-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501030714.Z5nsNXq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030714.Z5nsNXq4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-amd756.c:215:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-amd756.c:215:25: sparse:     expected unsigned short [usertype] val
   drivers/i2c/busses/i2c-amd756.c:215:25: sparse:     got restricted __le16 [usertype]
   drivers/i2c/busses/i2c-amd756.c:260:35: sparse: sparse: cast to restricted __le16

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
 > 215				outw_p(cpu_to_le16((u16)data->word), SMB_HOST_DATA);
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
   260			data->word = (u16)le16_to_cpu(inw_p(SMB_HOST_DATA));
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
