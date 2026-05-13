Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5202D12ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778655768; cv=none; b=NljNs0sgKeKm/8hYHgazzIte2l8NUQXs6tEe3IjIUwGtF3I2ip4Z1SL5YfQXoUBIcqwNLepyTEoNprrad1t5qRO7yu0rABjS3NnJdtyJPW2TM3LpcnsjkwFWKS85LOJ7EjAYr4jlRb99fLGFM8o7wx3Ztlk69BdjhBZ3YMO2e24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778655768; c=relaxed/simple;
	bh=mpUKT8TUWOu+NvHjj4khiUsbazgnG3/DSa9HDdzmuIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAbdYfqmJkIeTLZ+90KTzCtyH0rmcKmHwFRQ99YDt3+7EUIHmRcq92yfcD5g79bbqmbUibCbLvXXQyNU6pwPdlfLeOnkOHna4lCQJUoSZ3ytg+rKLE+9P5skHAgT/VJuba1AY9bxbOB5ELgsvDyAnpWEgytSNxfJwwQjNUa5/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyCQKVRE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyCQKVRE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so56767215e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778655766; x=1779260566; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biEAIKt2WrI79RD7D4WpxXDh5BCllZmpXOMRLRH//Fg=;
        b=dyCQKVRENJPSQc73o6/z9SOCtGYyQxgjDcQ/ZUZgPtaa1+CzPQ8HYh3KM1MMd46qAh
         JD7l4eNPgnlfE9o/Nu/K/Ng+buZ8szxx4/FpbaItRInfeqOHGQcUnV5WUlGTiVWlc3Ec
         oxURvvu2xlmwHg6D0D96flpOq36Go7jNGfaoE+xQCwGpybGtW5nP2oPl6MH6AcTqi8T+
         Qg/e5ki1ZTh3Vc249K5KqnQnZEeONY1gy4mpjdgKnSU+JEl+pKKo7jxVkDK6gVo1JyFU
         c5h5Ghc59t8aa5TdB3TTnGS79FYXn7OSLp0xC/oLLAFCuZq6MKl0ye72zfdrzQ3kVP5F
         8v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778655766; x=1779260566;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biEAIKt2WrI79RD7D4WpxXDh5BCllZmpXOMRLRH//Fg=;
        b=gHRABaCdKPyIehdW3KeELNCvgYk7UBYrSjWdRx0jXwvwZcubQLnJvJdb+ZwVgudJsG
         1tPWucLsgPRq4HB1airLfhMVoMXSs38HrHNjPC+TWfOpUCTkF9o5i4pDdOjvPO3SzzVB
         7lWlvPY9CnKVjmcVjR4wdp1cnXerav1AJMVHz6zMhcBbThmwehCN2SYWOEyhliYleeMt
         NEgr7sAqcGt9fzW/YXAU8UyZAnjSqCG/GMUP+jAgBlYiQU8uV6HlP/FBRctS8YtY/2Ux
         C+RSyfgsVqVrfxK0gI8uFsSDHModHA+WkziVw7rt04GAVp2Khse00fF95zRRrIbw4yZQ
         2g4w==
X-Forwarded-Encrypted: i=1; AFNElJ/tuW5IaiMqIHvUsVoaHGphPnCMZ2TTMA4oqohpQ7af+zFB1qs68YReMMeqF4JN/XDWaCsmgB6MHxYEj06c@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0QoW0P2a3rAWuxixf7uz0CKeTRQSCf8qfJL984ys6o0mgamay
	/nSVxgNqWiU8kIbMcKpIm2euuTRwvyceHaPgPwCMkjmvYZclt1r2XPd4
X-Gm-Gg: Acq92OF/vF6I1jmJHdf5ORVxAzOeJzINfMdMJ0lkO/vfA/iGpq+7/VBSnTySdxV2ROw
	Zg4+8rLHZcEYkoj56wGcfytG2mgPaz1DShhnZ1Lox82HXUBWvZ6BYne1kX/Tsy7U6aBKbMqFEjY
	IHDJgqs1LvGIsyTeU6EXiu4VqwCORaVYoyHJewRkQc84BGpabPAOc9ldyDGZhcrZhAweVpmzzDO
	Pe+8FU0wswgPn0Zj+UVTiyzYq9z5WPOZrdjxLW2R5uUdSn9960ma0ia79EPaVnS4qE6kmXC16Qw
	duBmTYvexJVToXOLbczsy+nm6dAwkkY7kHCcJukdK6RtIuSix7ukmy7zym22eg/k8S8GdBwpTtM
	sHtBjjtc+l14bLabi5iaBlWSY5N6925vzf9z5Gm1BM1LJWwWE8nWyfK5QgYxwy+7Ot49aTBvpES
	a56dSr3GBBwKiZ+AEK+fA=
X-Received: by 2002:a05:600c:1547:b0:48e:8499:4bd7 with SMTP id 5b1f17b1804b1-48fce9eb099mr19219965e9.17.1778655765222;
        Wed, 13 May 2026 00:02:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce066eeasm24734955e9.7.2026.05.13.00.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:02:44 -0700 (PDT)
Date: Wed, 13 May 2026 10:02:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Salah Triki <salah.triki@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jic23@kernel.org>
Subject: [jic23-iio:fixes-togreg 31/32]
 drivers/iio/potentiostat/lmp91000.c:353 lmp91000_probe() warn: missing
 unwind goto?
Message-ID: <202605130437.SgMZ43gQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git fixes-togreg
head:   2ec11ebb4d0dea4aa9604f8336cd1e1c390d5dcb
commit: 82764dcb3643c70649f14fe8e92e667955574a8c [31/32] iio: potentiostat: lmp91000: fix probe order and cleanup paths
config: i386-randconfig-141-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130437.SgMZ43gQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605130437.SgMZ43gQ-lkp@intel.com/

smatch warnings:
drivers/iio/potentiostat/lmp91000.c:353 lmp91000_probe() warn: missing unwind goto?

vim +353 drivers/iio/potentiostat/lmp91000.c

7d8b3e100abeeff Uwe Kleine-König 2022-11-18  295  static int lmp91000_probe(struct i2c_client *client)
67e17300dc1d760 Matt Ranostay    2016-09-24  296  {
67e17300dc1d760 Matt Ranostay    2016-09-24  297  	struct device *dev = &client->dev;
67e17300dc1d760 Matt Ranostay    2016-09-24  298  	struct lmp91000_data *data;
67e17300dc1d760 Matt Ranostay    2016-09-24  299  	struct iio_dev *indio_dev;
67e17300dc1d760 Matt Ranostay    2016-09-24  300  	int ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  301  
67e17300dc1d760 Matt Ranostay    2016-09-24  302  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
67e17300dc1d760 Matt Ranostay    2016-09-24  303  	if (!indio_dev)
67e17300dc1d760 Matt Ranostay    2016-09-24  304  		return -ENOMEM;
67e17300dc1d760 Matt Ranostay    2016-09-24  305  
67e17300dc1d760 Matt Ranostay    2016-09-24  306  	indio_dev->info = &lmp91000_info;
67e17300dc1d760 Matt Ranostay    2016-09-24  307  	indio_dev->channels = lmp91000_channels;
67e17300dc1d760 Matt Ranostay    2016-09-24  308  	indio_dev->num_channels = ARRAY_SIZE(lmp91000_channels);
67e17300dc1d760 Matt Ranostay    2016-09-24  309  	indio_dev->name = LMP91000_DRV_NAME;
67e17300dc1d760 Matt Ranostay    2016-09-24  310  	indio_dev->modes = INDIO_DIRECT_MODE;
67e17300dc1d760 Matt Ranostay    2016-09-24  311  	i2c_set_clientdata(client, indio_dev);
67e17300dc1d760 Matt Ranostay    2016-09-24  312  
67e17300dc1d760 Matt Ranostay    2016-09-24  313  	data = iio_priv(indio_dev);
67e17300dc1d760 Matt Ranostay    2016-09-24  314  	data->dev = dev;
67e17300dc1d760 Matt Ranostay    2016-09-24  315  	data->regmap = devm_regmap_init_i2c(client, &lmp91000_regmap_config);
67e17300dc1d760 Matt Ranostay    2016-09-24  316  	if (IS_ERR(data->regmap)) {
67e17300dc1d760 Matt Ranostay    2016-09-24  317  		dev_err(dev, "regmap initialization failed.\n");
67e17300dc1d760 Matt Ranostay    2016-09-24  318  		return PTR_ERR(data->regmap);
67e17300dc1d760 Matt Ranostay    2016-09-24  319  	}
67e17300dc1d760 Matt Ranostay    2016-09-24  320  
4d031666560da23 Gwendal Grignou  2021-03-09  321  	data->trig = devm_iio_trigger_alloc(dev, "%s-mux%d",
15ea2878bfb2550 Jonathan Cameron 2021-04-26  322  					    indio_dev->name,
15ea2878bfb2550 Jonathan Cameron 2021-04-26  323  					    iio_device_id(indio_dev));
368e8718875f17a Dixit Parmar     2025-08-22  324  	if (!data->trig)
67e17300dc1d760 Matt Ranostay    2016-09-24  325  		return -ENOMEM;
67e17300dc1d760 Matt Ranostay    2016-09-24  326  
67e17300dc1d760 Matt Ranostay    2016-09-24  327  	init_completion(&data->completion);
67e17300dc1d760 Matt Ranostay    2016-09-24  328  
67e17300dc1d760 Matt Ranostay    2016-09-24  329  	ret = lmp91000_read_config(data);
67e17300dc1d760 Matt Ranostay    2016-09-24  330  	if (ret)
67e17300dc1d760 Matt Ranostay    2016-09-24  331  		return ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  332  
82764dcb3643c70 Salah Triki      2026-05-07  333  	data->cb_buffer = iio_channel_get_all_cb(dev, &lmp91000_buffer_cb, indio_dev);
82764dcb3643c70 Salah Triki      2026-05-07  334  	if (IS_ERR(data->cb_buffer)) {
82764dcb3643c70 Salah Triki      2026-05-07  335  		if (PTR_ERR(data->cb_buffer) == -ENODEV)
82764dcb3643c70 Salah Triki      2026-05-07  336  			ret = -EPROBE_DEFER;
82764dcb3643c70 Salah Triki      2026-05-07  337  		else
82764dcb3643c70 Salah Triki      2026-05-07  338  			ret = PTR_ERR(data->cb_buffer);
82764dcb3643c70 Salah Triki      2026-05-07  339  
82764dcb3643c70 Salah Triki      2026-05-07  340  		goto error_unreg_buffer;
82764dcb3643c70 Salah Triki      2026-05-07  341  	}
82764dcb3643c70 Salah Triki      2026-05-07  342  
67e17300dc1d760 Matt Ranostay    2016-09-24  343  	ret = iio_trigger_set_immutable(iio_channel_cb_get_iio_dev(data->cb_buffer),
67e17300dc1d760 Matt Ranostay    2016-09-24  344  					data->trig);
67e17300dc1d760 Matt Ranostay    2016-09-24  345  	if (ret) {
67e17300dc1d760 Matt Ranostay    2016-09-24  346  		dev_err(dev, "cannot set immutable trigger.\n");
67e17300dc1d760 Matt Ranostay    2016-09-24  347  		return ret;

Need to goto cleanup before returning

67e17300dc1d760 Matt Ranostay    2016-09-24  348  	}
67e17300dc1d760 Matt Ranostay    2016-09-24  349  
67e17300dc1d760 Matt Ranostay    2016-09-24  350  	ret = iio_trigger_register(data->trig);
67e17300dc1d760 Matt Ranostay    2016-09-24  351  	if (ret) {
67e17300dc1d760 Matt Ranostay    2016-09-24  352  		dev_err(dev, "cannot register iio trigger.\n");
67e17300dc1d760 Matt Ranostay    2016-09-24 @353  		return ret;

Same.

67e17300dc1d760 Matt Ranostay    2016-09-24  354  	}
67e17300dc1d760 Matt Ranostay    2016-09-24  355  
67e17300dc1d760 Matt Ranostay    2016-09-24  356  	ret = iio_triggered_buffer_setup(indio_dev, NULL,
67e17300dc1d760 Matt Ranostay    2016-09-24  357  					 &lmp91000_buffer_handler,
67e17300dc1d760 Matt Ranostay    2016-09-24  358  					 &lmp91000_buffer_setup_ops);
67e17300dc1d760 Matt Ranostay    2016-09-24  359  	if (ret)
67e17300dc1d760 Matt Ranostay    2016-09-24  360  		goto error_unreg_trigger;
67e17300dc1d760 Matt Ranostay    2016-09-24  361  
67e17300dc1d760 Matt Ranostay    2016-09-24  362  	data->adc_chan = iio_channel_cb_get_channels(data->cb_buffer);
67e17300dc1d760 Matt Ranostay    2016-09-24  363  
67e17300dc1d760 Matt Ranostay    2016-09-24  364  	ret = iio_device_register(indio_dev);
67e17300dc1d760 Matt Ranostay    2016-09-24  365  	if (ret)
67e17300dc1d760 Matt Ranostay    2016-09-24  366  		goto error_unreg_cb_buffer;
67e17300dc1d760 Matt Ranostay    2016-09-24  367  
67e17300dc1d760 Matt Ranostay    2016-09-24  368  	return 0;
67e17300dc1d760 Matt Ranostay    2016-09-24  369  
67e17300dc1d760 Matt Ranostay    2016-09-24  370  error_unreg_cb_buffer:
67e17300dc1d760 Matt Ranostay    2016-09-24  371  	iio_channel_release_all_cb(data->cb_buffer);
67e17300dc1d760 Matt Ranostay    2016-09-24  372  
67e17300dc1d760 Matt Ranostay    2016-09-24  373  error_unreg_trigger:
67e17300dc1d760 Matt Ranostay    2016-09-24  374  	iio_trigger_unregister(data->trig);
67e17300dc1d760 Matt Ranostay    2016-09-24  375  
82764dcb3643c70 Salah Triki      2026-05-07  376  error_unreg_buffer:
82764dcb3643c70 Salah Triki      2026-05-07  377  	iio_triggered_buffer_cleanup(indio_dev);
82764dcb3643c70 Salah Triki      2026-05-07  378  
67e17300dc1d760 Matt Ranostay    2016-09-24  379  	return ret;
67e17300dc1d760 Matt Ranostay    2016-09-24  380  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

