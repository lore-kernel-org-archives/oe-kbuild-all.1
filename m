Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F022C21F9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249553; cv=none; b=sSB+ArHA/RhVIhVxNZ94QXZcATdJFvkd59F091R3yWlka2vLXeOhq1sLmqLgwepaQM6fD5XhgTHAlaB2wC4P0vTw/3NKkKMyUaWKE2AbKLERM71J0Yb37uvXU64N0bpq8SQZHAmF2iqI2n6r3vX/wh8CgN0r+LG9tMxGjoZZauQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249553; c=relaxed/simple;
	bh=RkY+r1pyDAjmvDQRizTd0ODiwBXdC8jwj5xJ2RgY9Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=umKtC1ZzACEiLFfhcb0+ESmeNuJj9jh17J5Cv3waqUNhLOorQdcCwxXfHSFsLiFK+jOFLHd1rvVkvSYcXVgFCdjz4L2Q06DkwQ3Xpf+6qGsOIii1ABIBdenEGzZpOlznTRZM4dj2R57s8/aePZMjzDLDBkas1J8z9Liza7t6CBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vksc9uTl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vksc9uTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766249551; x=1797785551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RkY+r1pyDAjmvDQRizTd0ODiwBXdC8jwj5xJ2RgY9Lo=;
  b=Vksc9uTlU6AIxQQ2GNtvH9IBGp6znSdZwEQ88cWmneX6hTz9AMtjyaVV
   9ug2G6iEabgbIQcy7Zd61e8rPZJVYidEyaGf0JkgwnNsIk2RB9KYb+9+l
   rRgPEZi+vj0QjzH1mxUaHkY9ipNgwxaIcuKNegjE6JgiItcPEJGbuipql
   ER0xhCLBlCMLxz+MW+j+4ik/b3hNP2tHecnfYUk4FQtuYpT+nyDCr7enc
   kYYPDQCxUXzc/UxCyhBT+7o0SgVYPlGx+3+HZ4Qsog8SK0t0YQwJzOqU9
   EPnK6tJY44h+Xw8TGd20agzNY9IyI94H2sXoOe0jnBNQAFboSvrFGoOS+
   g==;
X-CSE-ConnectionGUID: 8EJX1uUWRZGE4qN4diBs6w==
X-CSE-MsgGUID: nY3ZITv3RYuBn7NXt65ZCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85594915"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85594915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:52:28 -0800
X-CSE-ConnectionGUID: xi9l5ix1Svu2uiNIqwp0gQ==
X-CSE-MsgGUID: SYu2RfFXQ0un+SLOOutHPQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 08:52:27 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0Bt-000000004u9-0Qc4;
	Sat, 20 Dec 2025 16:52:25 +0000
Date: Sun, 21 Dec 2025 00:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 40/109]
 drivers/net/dsa/mxl862xx/mxl862xx-host.c:158:27: sparse: sparse: cast to
 restricted __le16
Message-ID: <202512210048.PfdgIbPn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   5ee5189ef893fbbb9311f0cdb9f2f382c4a17eb1
commit: 657713ca903f7f4b2274ef76a2840dd3bbde1c42 [40/109] WIP: net: dsa: add driver for MaxLinear 2.5G switches
config: hexagon-randconfig-r113-20251218 (https://download.01.org/0day-ci/archive/20251221/202512210048.PfdgIbPn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210048.PfdgIbPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210048.PfdgIbPn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mxl862xx/mxl862xx-host.c:158:27: sparse: sparse: cast to restricted __le16
>> drivers/net/dsa/mxl862xx/mxl862xx-host.c:193:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/net/dsa/mxl862xx/mxl862xx-host.c:193:33: sparse:     expected unsigned short [usertype]
   drivers/net/dsa/mxl862xx/mxl862xx-host.c:193:33: sparse:     got restricted __le16 [usertype]

vim +158 drivers/net/dsa/mxl862xx/mxl862xx-host.c

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
