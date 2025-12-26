Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341D635898
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 01:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766712565; cv=none; b=MNsX+qs5odeg/Ex7TfKjnxMndRG+97qmr5saEAe9rTPbfemva0XyI4JosqQEV6zd7jO0sw2L2O5tD2liGKPL2paJNWFrUtU9nQTVUQAPbwr1I3TDCP9DcY8JULDwCFwiaSSQESXshwuoW76bTRt8W5hpj9ITwXF2UJ+tZ7xLLMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766712565; c=relaxed/simple;
	bh=Atd5t3s8QLIcBa9a0rwiY7SUMxD0Fe4DnKpWInqivHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s16619zx1C/Gc8j1ZhyG5CG9SiSM3AI1d+gOah4b4rz3UzIIx554jTgkP5yjgEJgJORatdkuI8uNAEbr9HDhp10bVQI4EZGyRhYiySjmfhLmXq4fZVjwFSxolXL/R12sGEZ5Ww4q+7v9jdG/mRAGcStjZ3pSZetURObL3MbAO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5k2SUfe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5k2SUfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766712563; x=1798248563;
  h=date:from:to:cc:subject:message-id;
  bh=Atd5t3s8QLIcBa9a0rwiY7SUMxD0Fe4DnKpWInqivHk=;
  b=C5k2SUfeuEqH68+o4pmUZ97T0Tc937z4tnKxUWtxuIIeJ9/N0zLZQdxe
   W9I9GRotYgam/YdouxbqrlhwcM4tYT2TrJQNskI1mIwSfS4hxok51FrwS
   bqfS0/AFz79xDZazMTsIUPJm8V5QsSt1siXpRwU9NMqgGyv7YKj6uHJfR
   V2Ek5WCPxvV0xJ7ao6Gr9FIN16lewjGovBuPcxlzeXqTRe4POEPCHHfYE
   Qjqv/bvgfLbNlzEZXVgC5v2Flp8PmT5Q76z3V0RqoapdQGM1v/v2Ds1Ef
   9NxgC5mFhksVOpw34dH8aWeIFQjflSXOvhdkVn1qilHU8gs7krrybaeAJ
   w==;
X-CSE-ConnectionGUID: 6O5vDsB2SSKFOX6TYOLEhg==
X-CSE-MsgGUID: 5oepyHlQRAWMFwwxx+Q5sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79606518"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79606518"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 17:29:22 -0800
X-CSE-ConnectionGUID: ht+ZpO8PT1uOzZ5gtwWxXQ==
X-CSE-MsgGUID: mwxvMCJmSA27Y6QkFyQY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="204799267"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2025 17:29:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYwdq-000000004aj-2LkH;
	Fri, 26 Dec 2025 01:29:18 +0000
Date: Fri, 26 Dec 2025 09:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/i2c/busses/i2c-zhaoxin.c:176:5: sparse: sparse: symbol
 'zxi2c_fifo_irq_xfer' was not declared. Should it be static?
Message-ID: <202512260925.ARcUlz1W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: 07a6747f952bd8a1ee87d6f5d74448c64fbb152e [13/13] i2c: zhaoxin: Add support for Zhaoxin I2C controller
config: x86_64-randconfig-r132-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260925.ARcUlz1W-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260925.ARcUlz1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260925.ARcUlz1W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-zhaoxin.c:176:5: sparse: sparse: symbol 'zxi2c_fifo_irq_xfer' was not declared. Should it be static?
>> drivers/i2c/busses/i2c-zhaoxin.c:314:5: sparse: sparse: symbol 'zxi2c_xfer' was not declared. Should it be static?

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
   235		void __iomem *base = i2c->base;
   236		u8 status;
   237	
   238		/* save the status and write-clear it */
   239		status = readw(base + ZXI2C_REG_ISR);
   240		if (!status)
   241			return IRQ_NONE;
   242	
   243		writew(status, base + ZXI2C_REG_ISR);
   244	
   245		i2c->ret = 0;
   246		if (status & ZXI2C_ISR_NACK_ADDR)
   247			i2c->ret = -EIO;
   248	
   249		if (!i2c->ret) {
   250			if (i2c->mode == ZXI2C_BYTE_MODE)
   251				i2c->ret = zxi2c_irq_xfer(i2c);
   252			else
   253				i2c->ret = zxi2c_fifo_irq_xfer(i2c, true);
   254		}
   255	
   256		if (i2c->ret)
   257			complete(&i2c->complete);
   258	
   259		return IRQ_HANDLED;
   260	}
   261	
   262	static int zxi2c_write(struct zxi2c *i2c, struct i2c_msg *msg, int last)
   263	{
   264		u16 tcr_val = i2c->tcr;
   265		void __iomem *base = i2c->base;
   266	
   267		i2c->last = last;
   268	
   269		writew(msg->buf[0] & 0xFF, base + ZXI2C_REG_CDR);
   270	
   271		reinit_completion(&i2c->complete);
   272	
   273		tcr_val |= msg->addr & 0x7f;
   274	
   275		writew(tcr_val, base + ZXI2C_REG_TCR);
   276	
   277		if (!wait_for_completion_timeout(&i2c->complete, ZXI2C_TIMEOUT))
   278			return -ETIMEDOUT;
   279	
   280		return i2c->ret;
   281	}
   282	
   283	static int zxi2c_read(struct zxi2c *i2c, struct i2c_msg *msg, bool first)
   284	{
   285		u16 val, tcr_val = i2c->tcr;
   286		void __iomem *base = i2c->base;
   287	
   288		val = readw(base + ZXI2C_REG_CR);
   289		val &= ~(ZXI2C_CR_TX_END | ZXI2C_CR_RX_END);
   290	
   291		if (msg->len == 1)
   292			val |= ZXI2C_CR_RX_END;
   293	
   294		writew(val, base + ZXI2C_REG_CR);
   295	
   296		reinit_completion(&i2c->complete);
   297	
   298		tcr_val |= ZXI2C_TCR_READ | (msg->addr & 0x7f);
   299	
   300		writew(tcr_val, base + ZXI2C_REG_TCR);
   301	
   302		if (!first) {
   303			val = readw(base + ZXI2C_REG_CR);
   304			val |= ZXI2C_CR_CPU_RDY;
   305			writew(val, base + ZXI2C_REG_CR);
   306		}
   307	
   308		if (!wait_for_completion_timeout(&i2c->complete, ZXI2C_TIMEOUT))
   309			return -ETIMEDOUT;
   310	
   311		return i2c->ret;
   312	}
   313	
 > 314	int zxi2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
   315	{
   316		struct i2c_msg *msg;
   317		int i;
   318		int ret = 0;
   319		struct zxi2c *i2c = i2c_get_adapdata(adap);
   320	
   321		i2c->mode = ZXI2C_BYTE_MODE;
   322		for (i = 0; ret >= 0 && i < num; i++) {
   323			i2c->msg = msg = &msgs[i];
   324			i2c->xfered_len = 0;
   325			if (msg->len == 0)
   326				return -EIO;
   327	
   328			if (msg->flags & I2C_M_RD)
   329				ret = zxi2c_read(i2c, msg, i == 0);
   330			else
   331				ret = zxi2c_write(i2c, msg, (i + 1) == num);
   332		}
   333	
   334		return (ret < 0) ? ret : i;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
