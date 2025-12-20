Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0971A9F93
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766266728; cv=none; b=VGxacHME75XyBkqKwfaru83H6BIGX5z05RzGT4AM7a3DeAPFg9oerjfU5vzIUZmSBAGRCk7fJ0ZKtPoWOs0cQDKj12d2FiyxiyIG2OPHa8VJRSVAJgk2/J6s9r9cfDsNMZLb4cfJARHOhm4LH1xMF3FVxvsDfDluEcSiELthXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766266728; c=relaxed/simple;
	bh=JTiyrTFFjHUefTkACGMhs0gchAdhbtyAA7jdRmiwJdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Stf/fyDijuVrroJsNR6V1KEM0NDfqXb6AALzelgUFioG2pYrZjWOdOmHqU3Yvc6i0EInGkFniQZiD+4fZksAQ8ODBdxNYtFbWEXQz+ilGmqH1uR3hmZNcLurlab1/LgGavviv9sbB168xrOkNNiNgsM1VZkY4h8vYj3Haom/woo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZKeO8mX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZKeO8mX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766266726; x=1797802726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JTiyrTFFjHUefTkACGMhs0gchAdhbtyAA7jdRmiwJdI=;
  b=XZKeO8mX/p62AmOvpVIQPw67aaHRMPY8wATUNg0Gf2Uj97AsQOnII2Oh
   R5LYMF87rd9S72HDt8Y+WMPHWjWcYRPgYjUP8oByqJ9IYHuld7eYK+dVK
   rmzfuLnV3NsDGkXsO8rdHjO8cz0xSTtG1pAld7m01qz557ATSl+X/HgNC
   sdUbLIfK7Q0/VgWmFbKunaVh0HLMp/02OZlunuyb3/bKkerz07PZvV8BR
   8q45H63fNLdpTIQ30EjUzT2B1k8ky/xtfU6O+4gDXaID2z+ifWJz/gHUW
   ryEASZH075aSE86kqflIw+dd9dFjUYevsHpzI9X4BBP/xs+sBLTTI0Q8B
   w==;
X-CSE-ConnectionGUID: 1bgqHYkbSM2BxCD9rZIBPw==
X-CSE-MsgGUID: IPRUkMRRTIiaaGNGvXLE/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72032950"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72032950"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 13:38:46 -0800
X-CSE-ConnectionGUID: eUJH5GMiSzqqmwcSFevuCg==
X-CSE-MsgGUID: sggnjk1GS02Ys4PJgqr+Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199416587"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 13:38:44 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX4ew-00000000595-3Er0;
	Sat, 20 Dec 2025 21:38:42 +0000
Date: Sun, 21 Dec 2025 05:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542]
 drivers/i2c/busses/i2c-zhaoxin.c:176:5: warning: no previous prototype for
 function 'zxi2c_fifo_irq_xfer'
Message-ID: <202512211025.4cSwOTdS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 07a6747f952bd8a1ee87d6f5d74448c64fbb152e [3542/3542] i2c: zhaoxin: Add support for Zhaoxin I2C controller
config: x86_64-randconfig-012-20251215 (https://download.01.org/0day-ci/archive/20251221/202512211025.4cSwOTdS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211025.4cSwOTdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211025.4cSwOTdS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-zhaoxin.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i2c/busses/i2c-zhaoxin.c:176:5: warning: no previous prototype for function 'zxi2c_fifo_irq_xfer' [-Wmissing-prototypes]
     176 | int zxi2c_fifo_irq_xfer(struct zxi2c *i2c, bool irq)
         |     ^
   drivers/i2c/busses/i2c-zhaoxin.c:176:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     176 | int zxi2c_fifo_irq_xfer(struct zxi2c *i2c, bool irq)
         | ^
         | static 
>> drivers/i2c/busses/i2c-zhaoxin.c:314:5: warning: no previous prototype for function 'zxi2c_xfer' [-Wmissing-prototypes]
     314 | int zxi2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
         |     ^
   drivers/i2c/busses/i2c-zhaoxin.c:314:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     314 | int zxi2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
         | ^
         | static 
   drivers/i2c/busses/i2c-zhaoxin.c:540:12: warning: unused function 'zxi2c_resume' [-Wunused-function]
     540 | static int zxi2c_resume(struct device *dev)
         |            ^~~~~~~~~~~~
   4 warnings generated.


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
