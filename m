Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785D03438AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782807275; cv=none; b=aZDi2hHTLmf4BnTkzdRralfOmtB/7/9jiSZb+S2o+GT3Q3W34Y604anF6i1vk3U6gQg1cl5aPMRstcUgMqshYPcwPkNuMbDv5ZIDJpGM4X8FcLb9LdLsfFuR8QsswqXmzjFrLM/VYQbxnrddtwUQlaAjucv110hI7WAy2Z99G+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782807275; c=relaxed/simple;
	bh=cv97kP/iSh1Rez7ITqv+fxBA+q64qFJtXXLSPEZbROY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FIVZ7tbtNdTVNFxSDlC14mIgh0jXz4tpE5t8PkWr5u6iOd6YGsQBsVc13kZwQ6AgF7fkmq5pq9uX/rA7nwHdLUXdA6CvkOuEqM2EmN7m05OTMtTs5ejFzeRwhKNYAgEO3PNN9RcuNXlhmTptwMf2NA7WLw1TqR4gDT1bzMRsoh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfoIiv+W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfoIiv+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782807274; x=1814343274;
  h=date:from:to:cc:subject:message-id;
  bh=cv97kP/iSh1Rez7ITqv+fxBA+q64qFJtXXLSPEZbROY=;
  b=gfoIiv+WjMXjhF+uBNsk3UHFIFQkSnjuxL7fQToBtgV3dHBP20omBjoP
   2fc2x3cpiOxZY7JVNeTo//Ad6an6XcFuEjokcRfVHdMXtoYqm3JBx7FNF
   2zTN05tp+Jw3lvooQMDh/iekJK/cjy/An6uS8HHDLLFGsNRBocHOn/2Uw
   Zz1gyH9rKl8IqPPIkGZTjy9yVaqEWKT096ZF8wumPZ/k3M6atX4mk6e15
   3ViD+Ntw2fElV1myTIbkqzYV5IknWQ9R62R3aYEDv0PfBvvl3lD5WA9bl
   +8mvpsKtTqZdBXj3t/xUQVhC+lchxyWTgbZImvSiYu+UAn6dtr+/cdOTo
   Q==;
X-CSE-ConnectionGUID: xMwMFO//RFGy01+UBhtXbQ==
X-CSE-MsgGUID: XVAOF2eUQpaFkOdoYwXwAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87352053"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87352053"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:14:34 -0700
X-CSE-ConnectionGUID: VZzBFxkXTcW60rghy+4PQw==
X-CSE-MsgGUID: xBxcCY/eSBSr6EMBlxdNRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="276472502"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jun 2026 01:14:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weTbx-0000000086z-3gyY;
	Tue, 30 Jun 2026 08:14:29 +0000
Date: Tue, 30 Jun 2026 16:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 35/160]
 drivers/net/dsa/mxl862xx_downstream/mxl862xx-host.c:158:27: sparse: sparse:
 cast to restricted __le16
Message-ID: <202606301619.ssT57BLC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: 96aefe538fdf60924d25ab9ee28d665648458ddc [35/160] net: dsa: add mxl downstream driver from 6.19-main
config: alpha-randconfig-r131-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301619.ssT57BLC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301619.ssT57BLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301619.ssT57BLC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx-host.c:158:27: sparse: sparse: cast to restricted __le16
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx-host.c:193:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx-host.c:193:33: sparse:     expected unsigned short [usertype]
   drivers/net/dsa/mxl862xx_downstream/mxl862xx-host.c:193:33: sparse:     got restricted __le16 [usertype]

vim +158 drivers/net/dsa/mxl862xx_downstream/mxl862xx-host.c

   128	
   129	int mxl862xx_api_wrap(struct mxl862xx_priv *priv, u16 cmd, void *_data,
   130			      u16 size, bool read)
   131	{
   132		u16 *data = _data;
   133		int16_t result = 0;
   134		u16 max, i;
   135		int ret;
   136	
   137		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
   138	
   139		max = (size + 1) / 2;
   140	
   141		ret = mxl862xx_busy_wait(priv);
   142		if (ret < 0)
   143			goto out;
   144	
   145		for (i = 0; i < max; i++) {
   146			u16 off = i % MXL862XX_MMD_REG_DATA_MAX_SIZE;
   147	
   148			if (i && off == 0) {
   149				/* Send command to set data when every
   150				 * MXL862XX_MMD_REG_DATA_MAX_SIZE of WORDs are written.
   151				 */
   152				ret = mxl862xx_set_data(priv, i);
   153				if (ret < 0)
   154					goto out;
   155			}
   156	
   157			mxl862xx_write(priv, MXL862XX_MMD_REG_DATA_FIRST + off,
 > 158				  le16_to_cpu(data[i]));
   159		}
   160	
   161		ret = mxl862xx_send_cmd(priv, cmd, size, &result);
   162		if (ret < 0)
   163			goto out;
   164	
   165		if (result < 0) {
   166			ret = result;
   167			goto out;
   168		}
   169	
   170		for (i = 0; i < max && read; i++) {
   171			u16 off = i % MXL862XX_MMD_REG_DATA_MAX_SIZE;
   172	
   173			if (i && off == 0) {
   174				/* Send command to fetch next batch of data
   175				 * when every MXL862XX_MMD_REG_DATA_MAX_SIZE of WORDs
   176				 * are read.
   177				 */
   178				ret = mxl862xx_get_data(priv, i);
   179				if (ret < 0)
   180					goto out;
   181			}
   182	
   183			ret = mxl862xx_read(priv, MXL862XX_MMD_REG_DATA_FIRST + off);
   184			if (ret < 0)
   185				goto out;
   186	
   187			if ((i * 2 + 1) == size) {
   188				/* Special handling for last BYTE
   189				 * if it's not WORD aligned.
   190				 */
   191				*(uint8_t *)&data[i] = ret & 0xFF;
   192			} else {
 > 193				data[i] = cpu_to_le16((u16)ret);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
