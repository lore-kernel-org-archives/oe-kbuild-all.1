Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA538DD3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 02:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714184006; cv=none; b=FDwEhamF2Jh1WrwYLi1ZvlQ8kkbelMSgwy+kp/bYvrWz8ghfYECtXbcOKi2jUGXkBEWUv72Zy5eENqfd8A5BFRnQYm4+S+JXSpvOAQREJy9ViNGVEKtZTmEl1y+0olkXz2aiezVpy3qSf2ABDdzPuvnqL64cRM9PFt5SnYj3Asw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714184006; c=relaxed/simple;
	bh=MqJAyNA3FvlKcRCKoM3C5U7GgYXBYctUNd88lnlxQW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZ3k5eZmeXyUEXaSyBglcBDA7g9pNrOcPWF1MWJI1v6r5EOW4MpMBp63YL59NJQ2pGFyWad+p95WG10r8vbfQFfVj3kSxBBiojmnpU8WzJd3KIAzs9a2zSCit7qufQJuRX8AqTFXPRsJ6ttf9WldwMIdFawVKrir42hPLBqbdDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmkbWDhr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmkbWDhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714184005; x=1745720005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MqJAyNA3FvlKcRCKoM3C5U7GgYXBYctUNd88lnlxQW8=;
  b=jmkbWDhrDCSTa94g3si/gJ0uLyw9QLRzAW4dLgxQ/NTGUcC8yjTHSTtI
   3ij03kpyL8cwepVGZj3kKks/igLmMYxIDjlmOI+71Us/Bdf0VC14ubRuH
   nKIJyquOSxQgwM1G1k9DaoRvjCDALsK0NZEIGXXELlCX/uZQmJyPtSit/
   u5lrR2l3LeD5dvQD4TDw+EXTMxamKCeCUzIQfD3o3XSXY+SITvzseZ/Ou
   UOuGLslZQ95kLDzf0ajW+hhKByPdwbjzBH3lYQX/OtxWDWcrUNy7gvnyz
   KID1xEhRfAcKfSQIj1bOe0UR2jPM0YNOZtk0mr9eGI1+acY0NBm3rclsy
   Q==;
X-CSE-ConnectionGUID: TozXQQNrQd2Wc0fTpTr2kw==
X-CSE-MsgGUID: N7sBbuSnTAO4JcJ7E9T8UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10096222"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="10096222"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 19:13:22 -0700
X-CSE-ConnectionGUID: JzB7GH6kRMe2vuG/PDHyEQ==
X-CSE-MsgGUID: bDSFhNlvSW+du/QUKnzqKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="30241307"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Apr 2024 19:13:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0XZ0-0004ZI-1K;
	Sat, 27 Apr 2024 02:13:18 +0000
Date: Sat, 27 Apr 2024 10:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:i2c/time_left 87/94]
 drivers/media/common/saa7146/saa7146_i2c.c:223:29: sparse: sparse:
 incompatible types in comparison expression (different signedness):
Message-ID: <202404271011.dke7uy5U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
head:   f40d9c303c85f20a79881e3dc955ec601bef36fb
commit: d47ee85aaf42ffd72a8961d7593ecf69c1b2f2f2 [87/94] media: common: saa7146: saa7146_i2c: use 'time_left' variable with wait_event_interruptible_timeout()
config: csky-randconfig-r112-20240427 (https://download.01.org/0day-ci/archive/20240427/202404271011.dke7uy5U-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240427/202404271011.dke7uy5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271011.dke7uy5U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/common/saa7146/saa7146_i2c.c:223:29: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/common/saa7146/saa7146_i2c.c:223:29: sparse:    unsigned long *
   drivers/media/common/saa7146/saa7146_i2c.c:223:29: sparse:    long *
   drivers/media/common/saa7146/saa7146_i2c.c:237:29: sparse: sparse: incompatible types in comparison expression (different signedness):
   drivers/media/common/saa7146/saa7146_i2c.c:237:29: sparse:    unsigned long *
   drivers/media/common/saa7146/saa7146_i2c.c:237:29: sparse:    long *

vim +223 drivers/media/common/saa7146/saa7146_i2c.c

   172	
   173	/* this functions writes out the data-byte 'dword' to the i2c-device.
   174	   it returns 0 if ok, -1 if the transfer failed, -2 if the transfer
   175	   failed badly (e.g. address error) */
   176	static int saa7146_i2c_writeout(struct saa7146_dev *dev, __le32 *dword, int short_delay)
   177	{
   178		u32 status = 0, mc2 = 0;
   179		int trial = 0;
   180		long time_left;
   181	
   182		/* write out i2c-command */
   183		DEB_I2C("before: 0x%08x (status: 0x%08x), %d\n",
   184			*dword, saa7146_read(dev, I2C_STATUS), dev->i2c_op);
   185	
   186		if( 0 != (SAA7146_USE_I2C_IRQ & dev->ext->flags)) {
   187	
   188			saa7146_write(dev, I2C_STATUS,	 dev->i2c_bitrate);
   189			saa7146_write(dev, I2C_TRANSFER, le32_to_cpu(*dword));
   190	
   191			dev->i2c_op = 1;
   192			SAA7146_ISR_CLEAR(dev, MASK_16|MASK_17);
   193			SAA7146_IER_ENABLE(dev, MASK_16|MASK_17);
   194			saa7146_write(dev, MC2, (MASK_00 | MASK_16));
   195	
   196			time_left = HZ/100 + 1; /* 10ms */
   197			time_left = wait_event_interruptible_timeout(dev->i2c_wq, dev->i2c_op == 0,
   198								     time_left);
   199			if (time_left == -ERESTARTSYS || dev->i2c_op) {
   200				SAA7146_IER_DISABLE(dev, MASK_16|MASK_17);
   201				SAA7146_ISR_CLEAR(dev, MASK_16|MASK_17);
   202				if (time_left == -ERESTARTSYS)
   203					/* a signal arrived */
   204					return -ERESTARTSYS;
   205	
   206				pr_warn("%s %s [irq]: timed out waiting for end of xfer\n",
   207					dev->name, __func__);
   208				return -EIO;
   209			}
   210			status = saa7146_read(dev, I2C_STATUS);
   211		} else {
   212			saa7146_write(dev, I2C_STATUS,	 dev->i2c_bitrate);
   213			saa7146_write(dev, I2C_TRANSFER, le32_to_cpu(*dword));
   214			saa7146_write(dev, MC2, (MASK_00 | MASK_16));
   215	
   216			/* do not poll for i2c-status before upload is complete */
   217			time_left = jiffies + HZ/100 + 1; /* 10ms */
   218			while(1) {
   219				mc2 = (saa7146_read(dev, MC2) & 0x1);
   220				if( 0 != mc2 ) {
   221					break;
   222				}
 > 223				if (time_after(jiffies,time_left)) {
   224					pr_warn("%s %s: timed out waiting for MC2\n",
   225						dev->name, __func__);
   226					return -EIO;
   227				}
   228			}
   229			/* wait until we get a transfer done or error */
   230			time_left = jiffies + HZ/100 + 1; /* 10ms */
   231			/* first read usually delivers bogus results... */
   232			saa7146_i2c_status(dev);
   233			while(1) {
   234				status = saa7146_i2c_status(dev);
   235				if ((status & 0x3) != 1)
   236					break;
   237				if (time_after(jiffies,time_left)) {
   238					/* this is normal when probing the bus
   239					 * (no answer from nonexisistant device...)
   240					 */
   241					pr_warn("%s %s [poll]: timed out waiting for end of xfer\n",
   242						dev->name, __func__);
   243					return -EIO;
   244				}
   245				if (++trial < 50 && short_delay)
   246					udelay(10);
   247				else
   248					msleep(1);
   249			}
   250		}
   251	
   252		/* give a detailed status report */
   253		if ( 0 != (status & (SAA7146_I2C_SPERR | SAA7146_I2C_APERR |
   254				     SAA7146_I2C_DTERR | SAA7146_I2C_DRERR |
   255				     SAA7146_I2C_AL    | SAA7146_I2C_ERR   |
   256				     SAA7146_I2C_BUSY)) ) {
   257	
   258			if ( 0 == (status & SAA7146_I2C_ERR) ||
   259			     0 == (status & SAA7146_I2C_BUSY) ) {
   260				/* it may take some time until ERR goes high - ignore */
   261				DEB_I2C("unexpected i2c status %04x\n", status);
   262			}
   263			if( 0 != (status & SAA7146_I2C_SPERR) ) {
   264				DEB_I2C("error due to invalid start/stop condition\n");
   265			}
   266			if( 0 != (status & SAA7146_I2C_DTERR) ) {
   267				DEB_I2C("error in data transmission\n");
   268			}
   269			if( 0 != (status & SAA7146_I2C_DRERR) ) {
   270				DEB_I2C("error when receiving data\n");
   271			}
   272			if( 0 != (status & SAA7146_I2C_AL) ) {
   273				DEB_I2C("error because arbitration lost\n");
   274			}
   275	
   276			/* we handle address-errors here */
   277			if( 0 != (status & SAA7146_I2C_APERR) ) {
   278				DEB_I2C("error in address phase\n");
   279				return -EREMOTEIO;
   280			}
   281	
   282			return -EIO;
   283		}
   284	
   285		/* read back data, just in case we were reading ... */
   286		*dword = cpu_to_le32(saa7146_read(dev, I2C_TRANSFER));
   287	
   288		DEB_I2C("after: 0x%08x\n", *dword);
   289		return 0;
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
