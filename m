Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178AB35E937
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 23:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781480459; cv=none; b=Ziv5BatVD9dVHXIBbnIh1QHrGn+aJkAmIXLchZhovgdnYUtRX/32PedraSQvD+RlhBOtWhRLn1K00FYP2sCVbrLSbqPJH49vrylgFXI4CxkWKDTV1FJfpY2r07BU9WG3wTf8J3b9QNrf5bjkOsIfuYJjTsUnOuvzxgCTJREMU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781480459; c=relaxed/simple;
	bh=cB7ZAQuYcwGtCPPWbXqwOkew5Rt5sjSRF3bnSE70uaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KpOyT++rQXArZ8Ugbrb7vhZ4m9mSP8/OZoacaZPNgthmOfblMvPwxH8CdMsbLz/V51BDPRuFihv+jTiSkR/GVSxNcM03CRx6nXLV8xnOsRdXEcAU1C5oQu6Ke3tCSy1qu0jltFjpQvoINF2/PabydRf1OPQRxhjN9n3IliYZCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0cqdOSb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0cqdOSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781480457; x=1813016457;
  h=date:from:to:cc:subject:message-id;
  bh=cB7ZAQuYcwGtCPPWbXqwOkew5Rt5sjSRF3bnSE70uaQ=;
  b=T0cqdOSbyXcABmoPI/s87z6iIOhcQaM3xjaC3LqS5j93GEyZehvIfPpQ
   /tmmLo1dkDo740yQBDJWqANoeOrVc8BCEG2h6Z9FcaaY1KoQk4Ai7mJnO
   1MuxQTs8MovsVf97OPYbwpJ0F0b0b+eM4ZsVuIsZSZJMxV8KPUUZOwaYU
   zPGC0Rh12kgT6iEnFpYR11mGbRCvadwZRsy+xLSrMpozEOvT7Scgf739T
   VWhM7jfpdxIe6pEYfS90/6e2yZftL4i9DimG+4udzGtiG1toRLDKUlpvF
   V63tjM3auV2CdSFYyaLRqTWAbTnORH0I8cajjXc3jgS+k24gAoffOLOvo
   Q==;
X-CSE-ConnectionGUID: u2OTVilxQoCwF6SumecFRA==
X-CSE-MsgGUID: y3muK23UReiE4pI4NZbLug==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92541625"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="92541625"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 16:40:57 -0700
X-CSE-ConnectionGUID: UHNGLU2yQFixy2RFF1HWQw==
X-CSE-MsgGUID: yXP9cYD1Svq44bZac4gdhg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2026 16:40:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYuRg-00000000RHa-27j5;
	Sun, 14 Jun 2026 23:40:52 +0000
Date: Mon, 15 Jun 2026 07:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: drivers/i2c/busses/i2c-tegra.c:935:21: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202606150754.zgRoeRqx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 73e65c424867fb9396de6d1265228b75e1ee0718 i2c: tegra: enable compile testing on all archs
date:   3 months ago
config: s390-randconfig-r113-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150754.zgRoeRqx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150754.zgRoeRqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 73e65c424867 ("i2c: tegra: enable compile testing on all archs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150754.zgRoeRqx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-tegra.c:935:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-tegra.c:935:21: sparse:     expected unsigned int [assigned] [usertype] val
   drivers/i2c/busses/i2c-tegra.c:935:21: sparse:     got restricted __le32 [usertype]
   drivers/i2c/busses/i2c-tegra.c:1012:23: sparse: sparse: cast to restricted __le32

vim +935 drivers/i2c/busses/i2c-tegra.c

77821b4678f93b Shardar Shariff Md 2016-08-31  890  
df384fa58a321a Dmitry Osipenko    2020-09-30  891  static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
df384fa58a321a Dmitry Osipenko    2020-09-30  892  {
df384fa58a321a Dmitry Osipenko    2020-09-30  893  	size_t buf_remaining = i2c_dev->msg_buf_remaining;
89e3748acd0bf6 Dmitry Osipenko    2020-09-30  894  	unsigned int words_to_transfer, rx_fifo_avail;
89e3748acd0bf6 Dmitry Osipenko    2020-09-30  895  	u8 *buf = i2c_dev->msg_buf;
89e3748acd0bf6 Dmitry Osipenko    2020-09-30  896  	u32 val;
df384fa58a321a Dmitry Osipenko    2020-09-30  897  
df384fa58a321a Dmitry Osipenko    2020-09-30  898  	/*
94a5573f0719cf Dmitry Osipenko    2020-09-30  899  	 * Catch overflow due to message fully sent before the check for
94a5573f0719cf Dmitry Osipenko    2020-09-30  900  	 * RX FIFO availability.
df384fa58a321a Dmitry Osipenko    2020-09-30  901  	 */
df384fa58a321a Dmitry Osipenko    2020-09-30  902  	if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
df384fa58a321a Dmitry Osipenko    2020-09-30  903  		return -EINVAL;
df384fa58a321a Dmitry Osipenko    2020-09-30  904  
df384fa58a321a Dmitry Osipenko    2020-09-30  905  	if (i2c_dev->hw->has_mst_fifo) {
df384fa58a321a Dmitry Osipenko    2020-09-30  906  		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
df384fa58a321a Dmitry Osipenko    2020-09-30  907  		rx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_RX, val);
df384fa58a321a Dmitry Osipenko    2020-09-30  908  	} else {
df384fa58a321a Dmitry Osipenko    2020-09-30  909  		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
df384fa58a321a Dmitry Osipenko    2020-09-30  910  		rx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_RX, val);
df384fa58a321a Dmitry Osipenko    2020-09-30  911  	}
df384fa58a321a Dmitry Osipenko    2020-09-30  912  
94a5573f0719cf Dmitry Osipenko    2020-09-30  913  	/* round down to exclude partial word at the end of buffer */
df384fa58a321a Dmitry Osipenko    2020-09-30  914  	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
df384fa58a321a Dmitry Osipenko    2020-09-30  915  	if (words_to_transfer > rx_fifo_avail)
df384fa58a321a Dmitry Osipenko    2020-09-30  916  		words_to_transfer = rx_fifo_avail;
df384fa58a321a Dmitry Osipenko    2020-09-30  917  
df384fa58a321a Dmitry Osipenko    2020-09-30  918  	i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfer);
df384fa58a321a Dmitry Osipenko    2020-09-30  919  
df384fa58a321a Dmitry Osipenko    2020-09-30  920  	buf += words_to_transfer * BYTES_PER_FIFO_WORD;
df384fa58a321a Dmitry Osipenko    2020-09-30  921  	buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
df384fa58a321a Dmitry Osipenko    2020-09-30  922  	rx_fifo_avail -= words_to_transfer;
df384fa58a321a Dmitry Osipenko    2020-09-30  923  
df384fa58a321a Dmitry Osipenko    2020-09-30  924  	/*
94a5573f0719cf Dmitry Osipenko    2020-09-30  925  	 * If there is a partial word at the end of buffer, handle it
94a5573f0719cf Dmitry Osipenko    2020-09-30  926  	 * manually to prevent overwriting past the end of buffer.
df384fa58a321a Dmitry Osipenko    2020-09-30  927  	 */
df384fa58a321a Dmitry Osipenko    2020-09-30  928  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
df384fa58a321a Dmitry Osipenko    2020-09-30  929  		/*
df384fa58a321a Dmitry Osipenko    2020-09-30  930  		 * buf_remaining > 3 check not needed as rx_fifo_avail == 0
df384fa58a321a Dmitry Osipenko    2020-09-30  931  		 * when (words_to_transfer was > rx_fifo_avail) earlier
df384fa58a321a Dmitry Osipenko    2020-09-30  932  		 * in this function.
df384fa58a321a Dmitry Osipenko    2020-09-30  933  		 */
df384fa58a321a Dmitry Osipenko    2020-09-30  934  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
df384fa58a321a Dmitry Osipenko    2020-09-30 @935  		val = cpu_to_le32(val);
df384fa58a321a Dmitry Osipenko    2020-09-30  936  		memcpy(buf, &val, buf_remaining);
df384fa58a321a Dmitry Osipenko    2020-09-30  937  		buf_remaining = 0;
df384fa58a321a Dmitry Osipenko    2020-09-30  938  		rx_fifo_avail--;
df384fa58a321a Dmitry Osipenko    2020-09-30  939  	}
df384fa58a321a Dmitry Osipenko    2020-09-30  940  
df384fa58a321a Dmitry Osipenko    2020-09-30  941  	/* RX FIFO must be drained, otherwise it's an Overflow case. */
df384fa58a321a Dmitry Osipenko    2020-09-30  942  	if (WARN_ON_ONCE(rx_fifo_avail))
df384fa58a321a Dmitry Osipenko    2020-09-30  943  		return -EINVAL;
df384fa58a321a Dmitry Osipenko    2020-09-30  944  
df384fa58a321a Dmitry Osipenko    2020-09-30  945  	i2c_dev->msg_buf_remaining = buf_remaining;
df384fa58a321a Dmitry Osipenko    2020-09-30  946  	i2c_dev->msg_buf = buf;
df384fa58a321a Dmitry Osipenko    2020-09-30  947  
df384fa58a321a Dmitry Osipenko    2020-09-30  948  	return 0;
df384fa58a321a Dmitry Osipenko    2020-09-30  949  }
df384fa58a321a Dmitry Osipenko    2020-09-30  950  

:::::: The code at line 935 was first introduced by commit
:::::: df384fa58a321a88b22499a43cb5c5d0fb9f5364 i2c: tegra: Reorder location of functions in the code

:::::: TO: Dmitry Osipenko <digetx@gmail.com>
:::::: CC: Wolfram Sang <wsa@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
