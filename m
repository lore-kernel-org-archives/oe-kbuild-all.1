Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F34331A6E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 08:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788549; cv=none; b=g+deNYJDi3xmkp4Vd+iwFyWO3+BQ6vDGI1y6x0KFWxeL3fqUWqblKZecPQFEqoCIirGddDL2f2Tpx+GFg1AR4f8S1pOZ6qVx8uW0/uNP+sMRyuG+jpdH/ndohLl9rMDgOv8XoxfGm4RbHX5gFvMJ91c0RuAQYJ7MGAIWDUZSnjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788549; c=relaxed/simple;
	bh=ZrkONi14EATwCWJXKTFPaqlHRRu1AonXYRPwikwG+V4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCo+3D5l1WHdY57GDarvvjsHzEEUdWZECcjd3VFAN2r6US+SsYCWxJO9VXTC7QG03jen3uXlvq/GcWgjqP/alaf9XiYyEDt9x3rxd9hmlfY3pgkB9nO8Az7hWQlS5l+o1AqtXVyohx1VCCvjmOq9QrF8+zd5LDhEBP+EsL3xt6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kWV6dpHI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kWV6dpHI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a1c28778so36330725e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 00:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765788546; x=1766393346; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXX6/Gyp319fyuZ1CgEDDpVMkH0WK+bxqYFBYsL9gQE=;
        b=kWV6dpHIqYuH2nPB92W/RXrNaXUlv6mbyb8bA81yHzmkjUF2vojKfELZv4zPc/YPMv
         21Yb4UH2GZZdVrZ513Nns1TnSIGw1Gg4vtQs8rF/62dPQkov7t5D/xDtQGnzqpVA0Zs0
         +JjPWO63O0rJezGBhR0kKtcSn2UPiwz53DPedIKO2yKt/A7HvBsUvcxS2nhddHL/AIRc
         4GEFvzUjEjIAkVdNLdr5sC2msvay55nmJ4MFEherbxCWJiQkTnqSQxh7SB6aFTAwvlDQ
         L8VZk6Uy1Rm1/KYUJRIowJDJURQ2BKwlm3uXjyeS/7ACZsYTEP2gvxSjf4sOt45JeFHs
         u5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788546; x=1766393346;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXX6/Gyp319fyuZ1CgEDDpVMkH0WK+bxqYFBYsL9gQE=;
        b=BXAyzm7JP3SnAvWskirc3E1SO5IEY5gu4U5eDBXJMfbkaYUl6yKyR+4mrf+N9tUnlI
         62F+094QrJQLgPnkN59Bowt66uLPSUJdYrRd3HU9EnBsl8a3Nl0frGR2sdesdCrrmlsQ
         a930XFEm8EJyEx3u67PYZzz/UKR2KE5KyGBo8bAzHmjI7UEzRG+zpiQaldnOPGFclmiF
         d1IgYFEKHhvIb8MZh2vjBFJJCwWmmjfIFICRyD+PplU920LPMEJFFmuXwjdn6KfIvjCh
         XWwprnFIOUllqMv+LeFvsMVnGmiMYdAuHYwyQQ78BAgzYlN35KJepQtOv2RogEDUXcBj
         cxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3PSeJiG2YQfDq8mCXCXaxWdkbAoGkC2URlCiygVfmunNF2EhV8hz3HQQKmRmCw/VWcNXVJXg/8aO3PIoH@lists.linux.dev
X-Gm-Message-State: AOJu0YxBEvGeAqY62zZzHVUgRlUcoxB4lrnlGzNRexXOhMYrl6wp2qkx
	frCHGMoofZhE6ssyI+OwURQUR3nXU9dQAtSch9IQjoAWAAET+iy7Sj81BIPSSsCyB/E=
X-Gm-Gg: AY/fxX60q4i75894C6ONX842qx77E2KbgkuSIEKVPfPmOzJl5nbjfPRBZcmxPqhbKqp
	IsShm3o2drQwkb9KCG0EEuur98qFyZNl4tkltcQwTIxFr+wCuKjgt22i8YOSbBxGOHpcjbg7JB7
	iozGraxPPn1WQnSRDChXfhPESpDi6UMaNaV9TdBFBymwRMfJwpSFYiTvqPbvxXoFu+Z0BwEeAs5
	ZjJN3hSrEK46JHJuc8KrMHqAUm9eer5FmpCWQkoTC+7la4Mge3Ao9v8ZgJEhgXIp3HOBFnir6Q+
	HaeC9m7/0H2jzRuQxoLHkiv5OTxZlwrFuxBKkqFhHFvGs+oagHy7aEPrySwtZhrn984Px60hQtD
	sxJ8QeQvXHfD4IpkuqhCh9NSz6MT/6JDhfmns/FDNFharX3PUimlOQ5W+Bwbp8s7JL5/FG6sq2Z
	ABuCdOkgiO73AwzazWyKuW/GXdV9s=
X-Google-Smtp-Source: AGHT+IHcftv0KI8Inll9XVmeQOklc9PvBHH4enrnwNQAhd43X74uNyQzn1bO75MeaxIO5TyJAgEwmQ==
X-Received: by 2002:a05:600c:3b05:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47a8f8ab546mr105583835e9.6.1765788545445;
        Mon, 15 Dec 2025 00:49:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f6e5baasm185099285e9.13.2025.12.15.00.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:49:04 -0800 (PST)
Date: Mon, 15 Dec 2025 11:49:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Stanley Chu <yschu@nuvoton.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: drivers/i3c/master/svc-i3c-master.c:566 svc_i3c_master_ibi_isr()
 error: uninitialized symbol 'dev'.
Message-ID: <202512131016.YCKIsDXM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 8d29fa6d921ca4f9f63f73598833e53ece1d3b4e i3c: master: svc: Receive IBI requests in interrupt context
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131016.YCKIsDXM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512131016.YCKIsDXM-lkp@intel.com/

New smatch warnings:
drivers/i3c/master/svc-i3c-master.c:566 svc_i3c_master_ibi_isr() error: uninitialized symbol 'dev'.

vim +/dev +566 drivers/i3c/master/svc-i3c-master.c

8d29fa6d921ca4 Stanley Chu       2025-04-15  488  static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
dd3c52846d5954 Miquel Raynal     2021-01-21  489  {
dd3c52846d5954 Miquel Raynal     2021-01-21  490  	struct svc_i3c_i2c_dev_data *data;
dd3c52846d5954 Miquel Raynal     2021-01-21  491  	unsigned int ibitype, ibiaddr;
dd3c52846d5954 Miquel Raynal     2021-01-21  492  	struct i3c_dev_desc *dev;
dd3c52846d5954 Miquel Raynal     2021-01-21  493  	u32 status, val;
dd3c52846d5954 Miquel Raynal     2021-01-21  494  	int ret;
dd3c52846d5954 Miquel Raynal     2021-01-21  495  
f36f6624cbacb3 Frank Li          2024-10-02  496  	/*
f36f6624cbacb3 Frank Li          2024-10-02  497  	 * According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
f36f6624cbacb3 Frank Li          2024-10-02  498  	 *
f36f6624cbacb3 Frank Li          2024-10-02  499  	 * The I3C Controller shall hold SCL low while the Bus is in ACK/NACK Phase of I3C/I2C
f36f6624cbacb3 Frank Li          2024-10-02  500  	 * transfer. But maximum stall time is 100us. The IRQs have to be disabled to prevent
f36f6624cbacb3 Frank Li          2024-10-02  501  	 * schedule during the whole I3C transaction, otherwise, the I3C bus timeout may happen if
f36f6624cbacb3 Frank Li          2024-10-02  502  	 * any irq or schedule happen during transaction.
f36f6624cbacb3 Frank Li          2024-10-02  503  	 */
8d29fa6d921ca4 Stanley Chu       2025-04-15  504  	guard(spinlock)(&master->xferqueue.lock);
f36f6624cbacb3 Frank Li          2024-10-02  505  
38baed9b860000 Frank Li          2024-05-06  506  	/*
38baed9b860000 Frank Li          2024-05-06  507  	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
38baed9b860000 Frank Li          2024-05-06  508  	 * readl_relaxed_poll_timeout() to return immediately. Consequently,
38baed9b860000 Frank Li          2024-05-06  509  	 * ibitype will be 0 since it was last updated only after the 8th SCL
38baed9b860000 Frank Li          2024-05-06  510  	 * cycle, leading to missed client IBI handlers.
38baed9b860000 Frank Li          2024-05-06  511  	 *
38baed9b860000 Frank Li          2024-05-06  512  	 * A typical scenario is when IBIWON occurs and bus arbitration is lost
38baed9b860000 Frank Li          2024-05-06  513  	 * at svc_i3c_master_priv_xfers().
38baed9b860000 Frank Li          2024-05-06  514  	 *
38baed9b860000 Frank Li          2024-05-06  515  	 * Clear SVC_I3C_MINT_IBIWON before sending SVC_I3C_MCTRL_REQUEST_AUTO_IBI.
38baed9b860000 Frank Li          2024-05-06  516  	 */
38baed9b860000 Frank Li          2024-05-06  517  	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
38baed9b860000 Frank Li          2024-05-06  518  
dd3c52846d5954 Miquel Raynal     2021-01-21  519  	/* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
dd3c52846d5954 Miquel Raynal     2021-01-21  520  	writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
dd3c52846d5954 Miquel Raynal     2021-01-21  521  	       SVC_I3C_MCTRL_IBIRESP_AUTO,
dd3c52846d5954 Miquel Raynal     2021-01-21  522  	       master->regs + SVC_I3C_MCTRL);
dd3c52846d5954 Miquel Raynal     2021-01-21  523  
dd3c52846d5954 Miquel Raynal     2021-01-21  524  	/* Wait for IBIWON, should take approximately 100us */
f36f6624cbacb3 Frank Li          2024-10-02  525  	ret = readl_relaxed_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS, val,
f36f6624cbacb3 Frank Li          2024-10-02  526  					 SVC_I3C_MSTATUS_IBIWON(val), 0, 100);
dd3c52846d5954 Miquel Raynal     2021-01-21  527  	if (ret) {
dd3c52846d5954 Miquel Raynal     2021-01-21  528  		dev_err(master->dev, "Timeout when polling for IBIWON\n");
dfd7cd6aafdb1f Frank Li          2023-10-23  529  		svc_i3c_master_emit_stop(master);
8d29fa6d921ca4 Stanley Chu       2025-04-15  530  		return;
dd3c52846d5954 Miquel Raynal     2021-01-21  531  	}
dd3c52846d5954 Miquel Raynal     2021-01-21  532  
dd3c52846d5954 Miquel Raynal     2021-01-21  533  	status = readl(master->regs + SVC_I3C_MSTATUS);
dd3c52846d5954 Miquel Raynal     2021-01-21  534  	ibitype = SVC_I3C_MSTATUS_IBITYPE(status);
dd3c52846d5954 Miquel Raynal     2021-01-21  535  	ibiaddr = SVC_I3C_MSTATUS_IBIADDR(status);
dd3c52846d5954 Miquel Raynal     2021-01-21  536  
dd3c52846d5954 Miquel Raynal     2021-01-21  537  	/* Handle the critical responses to IBI's */
dd3c52846d5954 Miquel Raynal     2021-01-21  538  	switch (ibitype) {
dd3c52846d5954 Miquel Raynal     2021-01-21  539  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
dd3c52846d5954 Miquel Raynal     2021-01-21  540  		dev = svc_i3c_master_dev_from_addr(master, ibiaddr);

Only initialized here.

05b26c31a4859a Frank Li          2023-12-01  541  		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
dd3c52846d5954 Miquel Raynal     2021-01-21  542  			svc_i3c_master_nack_ibi(master);
dd3c52846d5954 Miquel Raynal     2021-01-21  543  		else
dd3c52846d5954 Miquel Raynal     2021-01-21  544  			svc_i3c_master_handle_ibi(master, dev);
dd3c52846d5954 Miquel Raynal     2021-01-21  545  		break;
dd3c52846d5954 Miquel Raynal     2021-01-21  546  	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
05b26c31a4859a Frank Li          2023-12-01  547  		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
dd3c52846d5954 Miquel Raynal     2021-01-21  548  			svc_i3c_master_ack_ibi(master, false);
05b26c31a4859a Frank Li          2023-12-01  549  		else
05b26c31a4859a Frank Li          2023-12-01  550  			svc_i3c_master_nack_ibi(master);
dd3c52846d5954 Miquel Raynal     2021-01-21  551  		break;
dd3c52846d5954 Miquel Raynal     2021-01-21  552  	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
dd3c52846d5954 Miquel Raynal     2021-01-21  553  		svc_i3c_master_nack_ibi(master);
dd3c52846d5954 Miquel Raynal     2021-01-21  554  		break;
dd3c52846d5954 Miquel Raynal     2021-01-21  555  	default:
dd3c52846d5954 Miquel Raynal     2021-01-21  556  		break;
dd3c52846d5954 Miquel Raynal     2021-01-21  557  	}
dd3c52846d5954 Miquel Raynal     2021-01-21  558  
dd3c52846d5954 Miquel Raynal     2021-01-21  559  	/*
dd3c52846d5954 Miquel Raynal     2021-01-21  560  	 * If an error happened, we probably got interrupted and the exchange
dd3c52846d5954 Miquel Raynal     2021-01-21  561  	 * timedout. In this case we just drop everything, emit a stop and wait
dd3c52846d5954 Miquel Raynal     2021-01-21  562  	 * for the slave to interrupt again.
dd3c52846d5954 Miquel Raynal     2021-01-21  563  	 */
dd3c52846d5954 Miquel Raynal     2021-01-21  564  	if (svc_i3c_master_error(master)) {
dd3c52846d5954 Miquel Raynal     2021-01-21  565  		if (master->ibi.tbq_slot) {
dd3c52846d5954 Miquel Raynal     2021-01-21 @566  			data = i3c_dev_get_master_data(dev);
                                                                                                       ^^^
Do we know that ibitype is SVC_I3C_MSTATUS_IBITYPE_IBI here?

dd3c52846d5954 Miquel Raynal     2021-01-21  567  			i3c_generic_ibi_recycle_slot(data->ibi_pool,
dd3c52846d5954 Miquel Raynal     2021-01-21  568  						     master->ibi.tbq_slot);
dd3c52846d5954 Miquel Raynal     2021-01-21  569  			master->ibi.tbq_slot = NULL;
dd3c52846d5954 Miquel Raynal     2021-01-21  570  		}
dd3c52846d5954 Miquel Raynal     2021-01-21  571  
dd3c52846d5954 Miquel Raynal     2021-01-21  572  		svc_i3c_master_emit_stop(master);
dd3c52846d5954 Miquel Raynal     2021-01-21  573  
8d29fa6d921ca4 Stanley Chu       2025-04-15  574  		return;
dd3c52846d5954 Miquel Raynal     2021-01-21  575  	}
dd3c52846d5954 Miquel Raynal     2021-01-21  576  
dd3c52846d5954 Miquel Raynal     2021-01-21  577  	/* Handle the non critical tasks */
dd3c52846d5954 Miquel Raynal     2021-01-21  578  	switch (ibitype) {
dd3c52846d5954 Miquel Raynal     2021-01-21  579  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
dd3c52846d5954 Miquel Raynal     2021-01-21  580  		if (dev) {
dd3c52846d5954 Miquel Raynal     2021-01-21  581  			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
dd3c52846d5954 Miquel Raynal     2021-01-21  582  			master->ibi.tbq_slot = NULL;
dd3c52846d5954 Miquel Raynal     2021-01-21  583  		}
dd3c52846d5954 Miquel Raynal     2021-01-21  584  		svc_i3c_master_emit_stop(master);
dd3c52846d5954 Miquel Raynal     2021-01-21  585  		break;
dd3c52846d5954 Miquel Raynal     2021-01-21  586  	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
05b26c31a4859a Frank Li          2023-12-01  587  		svc_i3c_master_emit_stop(master);
05b26c31a4859a Frank Li          2023-12-01  588  		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
dd3c52846d5954 Miquel Raynal     2021-01-21  589  			queue_work(master->base.wq, &master->hj_work);
dd3c52846d5954 Miquel Raynal     2021-01-21  590  		break;
dd3c52846d5954 Miquel Raynal     2021-01-21  591  	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
0430bf9bc1ac06 Stanley Chu       2025-03-18  592  		svc_i3c_master_emit_stop(master);
e8d2d287e26d9b Nathan Chancellor 2025-03-19  593  		break;
dd3c52846d5954 Miquel Raynal     2021-01-21  594  	default:
dd3c52846d5954 Miquel Raynal     2021-01-21  595  		break;
dd3c52846d5954 Miquel Raynal     2021-01-21  596  	}
dd3c52846d5954 Miquel Raynal     2021-01-21  597  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

