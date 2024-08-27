Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126DF4414
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 05:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724736058; cv=none; b=nXrRAU4b8b9GHMpVAt7jJCa7+AZ5EAhN40UQYtOUlyf7NmB/K5BeQC1rUfqSQRu6ZmvL+V0Hcknezixc+tbg15ELorv7OWOfjDPjt9tGbM/4I2QAJOuOMpoepzlSPCfqMPQB8K4OFw4QYEd2wb+gmbvP+CUX2lInR8jmYf46kt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724736058; c=relaxed/simple;
	bh=y5S5bYVmiVGZtITz18LTurlpifmcMLS6arSMQuEdHoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fs0invqXVYMcAvGQpc9hsIz4CrSNk6s+lhgLgsmr27Gfr4iNsj/HXsTPS2gNfzXGo47bKRgxdSPu4ZpnoRuopv8c7BXyqsiYQLHWJr1DVbDrdtEwNlLwiTzXcgsraH1D3Cp9HgzfdL12s6ZjSmAk0ULsADotovyEWS2ir/EEBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBSL4cbv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBSL4cbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724736056; x=1756272056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y5S5bYVmiVGZtITz18LTurlpifmcMLS6arSMQuEdHoI=;
  b=iBSL4cbvYfJzu8xB7ZpLSNnhOnO12du6jzvOWxwPeHyBbiCFEGfEoMuS
   NbKjRIqVhNQx4N+y/7pIYZlkVmQc5hd2dOu7EaCYlnW02en5WnEDqCcoE
   CJVCdNLmJlmyP3zNKZo0d8XpnQBGHMClGPkEh/3jnBMhhebGfb/hMRe+o
   qp5eo/NZtK8PM3FGA0t4Qh9PPl4T18QEa6uU/Q/BrzDPD/Xdo9KmhUk5R
   Ig5YxTYi/VYFzlfb5wW9+yRuYKzTd4W6MlvqEHyOma4La6MiR99ixt7lk
   dOIVHtwoknarf2Ebv3l3VxeuIwHt01vvZP92pPrqmam3lBnRvmNCYWJ8X
   g==;
X-CSE-ConnectionGUID: mzXU2bVsT3ePFQAt9cvd8g==
X-CSE-MsgGUID: Ciw/E1QRSf2wbMUcRb60kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23373187"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="23373187"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 22:20:55 -0700
X-CSE-ConnectionGUID: B8YQu6Z9TIC7Cn8gdL+UPw==
X-CSE-MsgGUID: 2Nf5S6TSQyCSbVEcnOlc2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62705303"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Aug 2024 22:20:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siodN-000I14-1l;
	Tue, 27 Aug 2024 05:20:49 +0000
Date: Tue, 27 Aug 2024 13:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9922/9936] drivers/i2c/busses/i2c-zhaoxin.c:176:5:
 sparse: sparse: symbol 'zxi2c_fifo_irq_xfer' was not declared. Should it be
 static?
Message-ID: <202408271350.o2tzuXP9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   304e0163925d5bb281ad9846c091c122b6cc42a9
commit: 18e7175498c21442a65f86418ce83f2ca2c3cea1 [9922/9936] i2c/zhaoxin: I2C controller driver enhancement and optimization
config: x86_64-randconfig-121-20240827 (https://download.01.org/0day-ci/archive/20240827/202408271350.o2tzuXP9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271350.o2tzuXP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271350.o2tzuXP9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-zhaoxin.c:176:5: sparse: sparse: symbol 'zxi2c_fifo_irq_xfer' was not declared. Should it be static?
>> drivers/i2c/busses/i2c-zhaoxin.c:311:5: sparse: sparse: symbol 'zxi2c_xfer' was not declared. Should it be static?

vim +/zxi2c_fifo_irq_xfer +176 drivers/i2c/busses/i2c-zhaoxin.c

   174	
   175	/* 'irq == true' means in interrupt context */
 > 176	int zxi2c_fifo_irq_xfer(struct zxi2c *i2c, bool irq)
   177	{
   178		u16 i;
   179		u8 tmp;
   180		struct i2c_msg *msg = i2c->msg;
   181		void __iomem *base = i2c->base;
   182		bool read = !!(msg->flags & I2C_M_RD);
   183	
   184		if (irq) {
   185			/* get the received data */
   186			if (read)
   187				for (i = 0; i < i2c->xfer_len; i++)
   188					msg->buf[i2c->xfered_len + i] = ioread8(base + ZXI2C_REG_HRDR);
   189	
   190			i2c->xfered_len += i2c->xfer_len;
   191			if (i2c->xfered_len == msg->len)
   192				return 1;
   193		}
   194	
   195		/* reset fifo buffer */
   196		tmp = ioread8(base + ZXI2C_REG_HCR);
   197		iowrite8(tmp | ZXI2C_HCR_RST_FIFO, base + ZXI2C_REG_HCR);
   198	
   199		/* set xfer len */
   200		i2c->xfer_len = min_t(u16, msg->len - i2c->xfered_len, ZXI2C_FIFO_SIZE);
   201		if (read) {
   202			iowrite8(i2c->xfer_len - 1, base + ZXI2C_REG_HRLR);
   203		} else {
   204			iowrite8(i2c->xfer_len - 1, base + ZXI2C_REG_HTLR);
   205			/* set write data */
   206			for (i = 0; i < i2c->xfer_len; i++)
   207				iowrite8(msg->buf[i2c->xfered_len + i], base + ZXI2C_REG_HTDR);
   208		}
   209	
   210		/* prepare to stop transmission */
   211		if (i2c->hrv && msg->len == (i2c->xfered_len + i2c->xfer_len)) {
   212			tmp = ioread8(base + ZXI2C_REG_CR);
   213			tmp |= read ? ZXI2C_CR_RX_END : ZXI2C_CR_TX_END;
   214			iowrite8(tmp, base + ZXI2C_REG_CR);
   215		}
   216	
   217		if (irq) {
   218			/* continue transmission */
   219			tmp = ioread8(base + ZXI2C_REG_CR);
   220			iowrite8(tmp |= ZXI2C_CR_CPU_RDY, base + ZXI2C_REG_CR);
   221		} else {
   222			u16 tcr_val = i2c->tcr;
   223	
   224			/* start transmission */
   225			tcr_val |= read ? ZXI2C_TCR_READ : 0;
   226			writew(tcr_val | msg->addr, base + ZXI2C_REG_TCR);
   227		}
   228	
   229		return 0;
   230	}
   231	
   232	static irqreturn_t zxi2c_isr(int irq, void *data)
   233	{
   234		struct zxi2c *i2c = data;
   235		u8 status;
   236	
   237		/* save the status and write-clear it */
   238		status = readw(i2c->base + ZXI2C_REG_ISR);
   239		if (!status)
   240			return IRQ_NONE;
   241	
   242		writew(status, i2c->base + ZXI2C_REG_ISR);
   243	
   244		i2c->ret = 0;
   245		if (status & ZXI2C_ISR_NACK_ADDR)
   246			i2c->ret = -EIO;
   247	
   248		if (!i2c->ret) {
   249			if (i2c->mode == ZXI2C_BYTE_MODE)
   250				i2c->ret = zxi2c_irq_xfer(i2c);
   251			else
   252				i2c->ret = zxi2c_fifo_irq_xfer(i2c, true);
   253		}
   254	
   255		if (i2c->ret)
   256			complete(&i2c->complete);
   257	
   258		return IRQ_HANDLED;
   259	}
   260	
   261	static int zxi2c_write(struct zxi2c *i2c, struct i2c_msg *msg, int last)
   262	{
   263		u16 tcr_val = i2c->tcr;
   264	
   265		i2c->last = last;
   266	
   267		writew(msg->buf[0] & 0xFF, i2c->base + ZXI2C_REG_CDR);
   268	
   269		reinit_completion(&i2c->complete);
   270	
   271		tcr_val |= msg->addr & 0x7f;
   272	
   273		writew(tcr_val, i2c->base + ZXI2C_REG_TCR);
   274	
   275		if (!wait_for_completion_timeout(&i2c->complete, ZXI2C_TIMEOUT))
   276			return -ETIMEDOUT;
   277	
   278		return i2c->ret;
   279	}
   280	
   281	static int zxi2c_read(struct zxi2c *i2c, struct i2c_msg *msg, bool first)
   282	{
   283		u16 val, tcr_val = i2c->tcr;
   284	
   285		val = readw(i2c->base + ZXI2C_REG_CR);
   286		val &= ~(ZXI2C_CR_TX_END | ZXI2C_CR_RX_END);
   287	
   288		if (msg->len == 1)
   289			val |= ZXI2C_CR_RX_END;
   290	
   291		writew(val, i2c->base + ZXI2C_REG_CR);
   292	
   293		reinit_completion(&i2c->complete);
   294	
   295		tcr_val |= ZXI2C_TCR_READ | (msg->addr & 0x7f);
   296	
   297		writew(tcr_val, i2c->base + ZXI2C_REG_TCR);
   298	
   299		if (!first) {
   300			val = readw(i2c->base + ZXI2C_REG_CR);
   301			val |= ZXI2C_CR_CPU_RDY;
   302			writew(val, i2c->base + ZXI2C_REG_CR);
   303		}
   304	
   305		if (!wait_for_completion_timeout(&i2c->complete, ZXI2C_TIMEOUT))
   306			return -ETIMEDOUT;
   307	
   308		return i2c->ret;
   309	}
   310	
 > 311	int zxi2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
   312	{
   313		struct i2c_msg *msg;
   314		int i;
   315		int ret = 0;
   316		struct zxi2c *i2c = i2c_get_adapdata(adap);
   317	
   318		i2c->mode = ZXI2C_BYTE_MODE;
   319		for (i = 0; ret >= 0 && i < num; i++) {
   320			i2c->msg = msg = &msgs[i];
   321			i2c->xfered_len = 0;
   322			if (msg->len == 0)
   323				return -EIO;
   324	
   325			if (msg->flags & I2C_M_RD)
   326				ret = zxi2c_read(i2c, msg, i == 0);
   327			else
   328				ret = zxi2c_write(i2c, msg, (i + 1) == num);
   329		}
   330	
   331		return (ret < 0) ? ret : i;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
