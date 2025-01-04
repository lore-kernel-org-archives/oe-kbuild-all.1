Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7D91D5AAD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 23:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736034401; cv=none; b=d4M39eXJjLiqxAWoHZjbZFmDqRCCmewblgU51+Lhpk6o6EptmHzCoTHpcdvmsyFC22cPgZBTmE3h9fOUxDikqZOUe6+RdsrF9uijss1sioYa9HtxGlv8zjMLQFoArk2091oKwmKE9t1rQ44Hh2jdwjlfqwHTjNZmPte/vF/oevY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736034401; c=relaxed/simple;
	bh=pOfkpHfzGCOkqMOYUhLY6gPNG5fkF7WMYxGG76S6VwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBTuslkT38GQNBXENSVP/w0NiwR/fjVDz0Y1iCdmRyHQxIMm7/tJBgFXy6AIgxOWtfP3A1+mV+uwCkobEY/Ltb/9G8glNT3JMdS8IBmXz9hF/c56O1u1UBqtyTwqT73WoVeSGo4jF3cMblXPVX29HKlLdTgwDyjubUHpsw+4Ff4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfGk+0Wd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfGk+0Wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736034399; x=1767570399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOfkpHfzGCOkqMOYUhLY6gPNG5fkF7WMYxGG76S6VwU=;
  b=EfGk+0WdbOUkGJ3X2E48fZmJEJyIuN6aflojhUZNTheCZzsW+GDqcCPj
   6PwCdeGNemn24G9GrDX/dWqvAjX5YLWSirdOy5O1YJ7IqBkUlE+MrQtvK
   3309ocn4uyu9iKFs0y3gWa21ARKw8XlGzSIHiN6HOvWIl19DAv/tLrAOW
   VwaqUPEJDZjmFrAUEeuqN7fYjeIDsAYb2BnHJWyCDf10eiTCVZ5XKKmT4
   7l+ium1W1ig/iUDleQ9jcJv+DjXyfdYczB7+OqKZgArAWA591Yky4e0oG
   mkTEI027P6YaRVWIX4R3yT4aRBKEwCjyoyPNmw2vFuFHzwcwMmBVwNOZn
   Q==;
X-CSE-ConnectionGUID: cg0rdMCJSE+Y3WQOghvCXg==
X-CSE-MsgGUID: rsar2LVaTlW9cQw3kwWR7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36129617"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="36129617"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 15:46:38 -0800
X-CSE-ConnectionGUID: vpqAVafMRf6xLgnMRlbl8A==
X-CSE-MsgGUID: DlpmqN/DTJSuAyLpI0XypA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="101884118"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jan 2025 15:46:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUDqk-000BJ9-3D;
	Sat, 04 Jan 2025 23:46:34 +0000
Date: Sun, 5 Jan 2025 07:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>
Subject: [andi-shyti:i2c/i2c-host-next 23/23]
 drivers/i2c/busses/i2c-amd756.c:215:32: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202501050734.BSgyIR3M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   5b3114631defb230076ca9d84f1ac5231db62f94
commit: 5b3114631defb230076ca9d84f1ac5231db62f94 [23/23] i2c: amd756: Fix endianness handling for word data
config: alpha-randconfig-r122-20250105 (https://download.01.org/0day-ci/archive/20250105/202501050734.BSgyIR3M-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250105/202501050734.BSgyIR3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050734.BSgyIR3M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-amd756.c:215:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] b @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-amd756.c:215:32: sparse:     expected unsigned short [usertype] b
   drivers/i2c/busses/i2c-amd756.c:215:32: sparse:     got restricted __le16 [usertype]
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
