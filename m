Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2031D0E05
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 20:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728939265; cv=none; b=oex3zPPvb41cbOUi2x0aQ5KAXFMgdgMWrOnSK3YNHW8oJLiPeFm525dSTF5w95aFEfCX0sxhCm8vFI3KQtIK2oi1uXsPXEqaa2zvJRCDlzcIm4gQtJquEY0+oKPeEVgJz6Ed0p9TZuheRo6hzZRSm5ncrAAEHODyLRDttQ6roGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728939265; c=relaxed/simple;
	bh=IYfdYTHlQUixpmAB1Yq2x9AjmKu6J8u9y0dc03q7pno=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=aPz0/RsGjzTx6UEI572+pbxq6I3Gb4wvQfhTJhJjS3Af2iy1BSYA7B/wYM678YQqE/9CWCXBsu/hsKRfoMjn5pDI0u2V8lw0H+5pLM9urYr7NbwYn6U4sfVutUIJZZqcUeeTaE8vWlwqO5kC5hyh5gHkK8IJ7ifPtxWmTwzK4e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=pTDtsd2D; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="pTDtsd2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RM7FEiv82YORuSZRay38zgNbV0YV9GdFZcxPNn9oCtk=;
  b=pTDtsd2DpgCHa7rF6w16NodZs2ZLaI8+CfY8C5L3/Z+nHCNqGVRBfXCP
   ahHmH2OsAb9md96j47rHMHBcX6+6QV6ypIZCnMUS3HBnlrLaIgAMF4CrX
   93IycB+SpaSwxMNrF0JGILEws/ceqdHy+NZsjqofP5U/k+NCIYJNL4zx+
   o=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,203,1725314400"; 
   d="scan'208";a="188782879"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 22:54:18 +0200
Date: Mon, 14 Oct 2024 22:54:17 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Abhash Jha <abhashkumarjha123@gmail.com>
cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:testing 24/26] drivers/iio/light/vl6180.c:231:3-9:
 preceding lock on line 219 (fwd)
Message-ID: <alpine.DEB.2.22.394.2410142253300.3401@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check whether an unlock is needed on line 231.


---------- Forwarded message ----------
Date: Tue, 15 Oct 2024 03:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jic23-iio:testing 24/26] drivers/iio/light/vl6180.c:231:3-9: preceding
     lock on line 219

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Abhash Jha <abhashkumarjha123@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   465644ac29536d10178b5ca4684d0b84765b9fa4
commit: acea0e6dd7d459e267efa0c4e8fa284669762e85 [24/26] iio: light: vl6180: Added Interrupt support for single shot access
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-randconfig-r052-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150357.z1206Zoq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410150357.z1206Zoq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/light/vl6180.c:231:3-9: preceding lock on line 219

vim +231 drivers/iio/light/vl6180.c

5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  211
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  212  static int vl6180_measure(struct vl6180_data *data, int addr)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  213  {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  214  	struct i2c_client *client = data->client;
acea0e6dd7d459 Abhash Jha            2024-10-07  215  	unsigned long time_left;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  216  	int tries = 20, ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  217  	u16 value;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  218
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19 @219  	mutex_lock(&data->lock);
acea0e6dd7d459 Abhash Jha            2024-10-07  220  	reinit_completion(&data->completion);
acea0e6dd7d459 Abhash Jha            2024-10-07  221
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  222  	/* Start single shot measurement */
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  223  	ret = vl6180_write_byte(client,
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  224  		vl6180_chan_regs_table[addr].start_reg, VL6180_STARTSTOP);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  225  	if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  226  		goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  227
acea0e6dd7d459 Abhash Jha            2024-10-07  228  	if (client->irq) {
acea0e6dd7d459 Abhash Jha            2024-10-07  229  		time_left = wait_for_completion_timeout(&data->completion, HZ / 10);
acea0e6dd7d459 Abhash Jha            2024-10-07  230  		if (time_left == 0)
acea0e6dd7d459 Abhash Jha            2024-10-07 @231  			return -ETIMEDOUT;
acea0e6dd7d459 Abhash Jha            2024-10-07  232  	} else {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  233  		while (tries--) {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  234  			ret = vl6180_read_byte(client, VL6180_INTR_STATUS);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  235  			if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  236  				goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  237
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  238  			if (ret & vl6180_chan_regs_table[addr].drdy_mask)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  239  				break;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  240  			msleep(20);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  241  		}
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  242
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  243  		if (tries < 0) {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  244  			ret = -EIO;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  245  			goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  246  		}
acea0e6dd7d459 Abhash Jha            2024-10-07  247  	}
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  248
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  249  	/* Read result value from appropriate registers */
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  250  	ret = vl6180_chan_regs_table[addr].word ?
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  251  		vl6180_read_word(client, vl6180_chan_regs_table[addr].value_reg) :
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  252  		vl6180_read_byte(client, vl6180_chan_regs_table[addr].value_reg);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  253  	if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  254  		goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  255  	value = ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  256
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  257  	/* Clear the interrupt flag after data read */
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  258  	ret = vl6180_write_byte(client, VL6180_INTR_CLEAR,
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  259  		VL6180_CLEAR_ERROR | VL6180_CLEAR_ALS | VL6180_CLEAR_RANGE);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  260  	if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  261  		goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  262
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  263  	ret = value;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  264
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  265  fail:
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  266  	mutex_unlock(&data->lock);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  267
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  268  	return ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  269  }
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  270

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
