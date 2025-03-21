Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236D422C32D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742575115; cv=none; b=lAv6/+FtnTckPLbh9esu9cwIljEIOqjSazD7mgJoJ5v2TVVrDJuQ/brJBhSpbUIzhC+9bOP2e3ZLDIjOco1+cylMWOqBQDZt4AxdWn7Y1b13xl2tM97+8zl4QvXl+RAEhM+09dWGBLkoT2FH4T4JFMSJGhoRiwbx4CrKFag324M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742575115; c=relaxed/simple;
	bh=SGMyVxnZ+MzTdvrIj2s8i38Iq/iGKfsChbod70j0t28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OtH0uo8HvGbZtGTlp1ub9Chj4tWn9kB9R7JiT/Ppoo13OuSqSGlurXw7Y+4ihJbl1WTvcPVjvdU6x2P+2KpWxA8JUd+j/VKesFU6EFbBNVGh5Xy5lgm1EP2dosLNYbZR+2M5KuXP7+YkCt+oizMvtqd4NgoNTW6U6T6fEUFsvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9m9+03L; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9m9+03L"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1387068f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 09:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575111; x=1743179911; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M66IomIzkzJINrakLHl9O9LuZS7ixOMTsWRGHpefK08=;
        b=o9m9+03LUBaEY6IzQl4fxAHgiUsm/UyDfmSwGFIADBgXUF28gJ8tqapCtZFsBUfdMI
         MDMOYcK6VrWtBmLbFEUBgVb6sXm/BJ1KlhiR6PRY0HJsvMaWpjinA7lmcBOATfG0b0ph
         v5sEv1sOg36/OF6MlWgynSrl8XNLWzbt5pJOHb5skfKcwkzq61KC/mOhFtQC7LwDupYu
         O97XFRn/VfPtGXUnyB+HcwxMZvw61MNuLQWSHlMdSPaVI76B6J9zLDvwakVAfPpvJQyL
         RttiVOZyl2rByLpxb05T7AMnadoLmqQM839/Fln/oQ6C0nZEdoeSaXKBSGicOOkdjPhp
         j3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575111; x=1743179911;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M66IomIzkzJINrakLHl9O9LuZS7ixOMTsWRGHpefK08=;
        b=UMli4dLnCpQtkI2KCPS1s1zaUEltWkImHIJGf1A+Es1+NqV8/y+4wKv2R+ypVfylFF
         WYldrIKJHplKv9X5IJZojficL3GAqJzlyk69WuI2aOvt0F+xlVUOarHBBS2ii3yuqKUw
         lg5gX1tyuKQf7Qd67qE7ubJqg7CP7Pgy7eUafhMVf6k/FAFKjIBjKAfSe9SIz98qXGrG
         wis6t371OoHq9iFvRSb4KwHNNpFLEW4W/pZexhBE6tVKVPzKTXt010EjN3GrvQtMBSGq
         aiUXWZGF8V3ZmRuH7MOXExYiHs51NV4zGk1KIYNC/4AhFqtqmZ+D8Mn9sr2OXvMXmCu5
         x/og==
X-Forwarded-Encrypted: i=1; AJvYcCXLG4GhuFB3iB33ZDkBgvRGRWfK2HthmRFNhG+/UJ9WxKok+gW86Q5lLo8aJymg83AOnPNwTLimyalm2EBQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyK9Xz64EvY4qpSXy4Bgs/2cbcDvxfsyErbOYNkwg4S6nMFuJj+
	HIkSOj/jfJBNO1+by6aZQk/u+JJR9focjQZs0YJFUVT/m3WKhu09XRaBbCXRSvc=
X-Gm-Gg: ASbGncvGzUdY2p/8hFy9vc4WH1vHgkaWM+p29Le7cZo6zHC4sCu1LlH4XW7XuyKHCHJ
	sVowg1TlFcy6PY4o5x+/6awlWf4X3gc1iu/hFkq0TgiXr2O7JH6asf81Bil4LQI5u8jaF3sg/5y
	QKIGkVmQC5sdQ2FjX4iPopi+7qpmIr/J/FyOrLBvp5UBYEYdzPjvdaF3zlFRGNHfZbEvJi03nVe
	shqgCn/UgMrBBe/3BVIETFl3ZwZC2e+x80iusqWX2cZOhvFd1OSV1LYXtzNGtv7ldyzxE6n3xsP
	B+7EKLzfxbKIqe33JemmYwRaczBhHa9/F7+8yM13+ngqBlt/ow==
X-Google-Smtp-Source: AGHT+IGs2Xs5NA9UgDikP21BJ+dhSnlUUOV2e0GxK4LQKHW92AIbM5FNZTZmXDjI3Jxw+OyKtJ/5AQ==
X-Received: by 2002:a05:6000:401f:b0:391:22a9:4427 with SMTP id ffacd0b85a97d-3997f90f413mr3856367f8f.12.1742575111321;
        Fri, 21 Mar 2025 09:38:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9efe61sm2829454f8f.97.2025.03.21.09.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:38:30 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:38:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
	You-Sheng Yang <vicamo.yang@canonical.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 1/8] media: i2c: add OV02E10 image sensor driver
Message-ID: <e1f7b80c-7b7f-40d1-ab0c-051198b245e3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-1-bd924634b889@linaro.org>

Hi Bryan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/media-i2c-add-OV02E10-image-sensor-driver/20250317-084316
base:   f2151613e040973c868d28c8b00885dfab69eb75
patch link:    https://lore.kernel.org/r/20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-1-bd924634b889%40linaro.org
patch subject: [PATCH 1/8] media: i2c: add OV02E10 image sensor driver
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250322/202503220055.pt1r9P7M-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503220055.pt1r9P7M-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ov02e10.c:903 ov02e10_probe() warn: missing unwind goto?

vim +903 drivers/media/i2c/ov02e10.c

62323d3b3c4dc1 Jingjing Xiong 2025-03-17  862  static int ov02e10_probe(struct i2c_client *client)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  863  {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  864  	struct ov02e10 *ov02e;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  865  	int ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  866  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  867  	/* Check HW config */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  868  	ret = ov02e10_check_hwcfg(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  869  	if (ret)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  870  		return ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  871  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  872  	ov02e = devm_kzalloc(&client->dev, sizeof(*ov02e), GFP_KERNEL);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  873  	if (!ov02e)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  874  		return -ENOMEM;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  875  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  876  	/* Initialize subdev */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  877  	ov02e->regmap = devm_cci_regmap_init_i2c(client, 8);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  878  	if (IS_ERR(ov02e->regmap))
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  879  		return PTR_ERR(ov02e->regmap);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  880  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  881  	v4l2_i2c_subdev_init(&ov02e->sd, client, &ov02e10_subdev_ops);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  882  	ov02e10_get_pm_resources(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  883  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  884  	ret = ov02e10_power_on(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  885  	if (ret) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  886  		dev_err_probe(&client->dev, ret, "failed to power on\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  887  		goto error_power_off;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  888  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  889  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  890  	/* Check module identity */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  891  	ret = ov02e10_identify_module(ov02e);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  892  	if (ret) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  893  		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  894  		goto error_power_off;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  895  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  896  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  897  	/* Set default mode to max resolution */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  898  	ov02e->cur_mode = &supported_modes[0];
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  899  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  900  	dev_dbg(&client->dev, "will Init controls\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  901  	ret = ov02e10_init_controls(ov02e);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  902  	if (ret)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17 @903  		return ret;

goto error_power_off;?

62323d3b3c4dc1 Jingjing Xiong 2025-03-17  904  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  905  	/* Initialize subdev */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  906  	ov02e->sd.internal_ops = &ov02e10_internal_ops;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  907  	ov02e->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  908  	ov02e->sd.entity.ops = &ov02e10_subdev_entity_ops;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  909  	ov02e->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  910  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  911  	/* Initialize source pad */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  912  	ov02e->pad.flags = MEDIA_PAD_FL_SOURCE;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  913  	ret = media_entity_pads_init(&ov02e->sd.entity, 1, &ov02e->pad);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  914  	if (ret) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  915  		dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  916  		goto error_handler_free;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  917  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  918  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  919  	ret = v4l2_async_register_subdev_sensor(&ov02e->sd);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  920  	if (ret < 0) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  921  		dev_err(&client->dev, "async reg subdev error\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  922  		goto error_media_entity;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  923  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  924  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  925  	/*
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  926  	 * Device is already turned on by i2c-core with ACPI domain PM.
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  927  	 * Enable runtime PM and turn off the device.
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  928  	 */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  929  	pm_runtime_set_active(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  930  	pm_runtime_enable(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  931  	pm_runtime_idle(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  932  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  933  	return 0;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  934  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  935  error_media_entity:
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  936  	media_entity_cleanup(&ov02e->sd.entity);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  937  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  938  error_handler_free:
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  939  	v4l2_ctrl_handler_free(ov02e->sd.ctrl_handler);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  940  	mutex_destroy(&ov02e->mutex);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  941  	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  942  error_power_off:
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  943  	ov02e10_power_off(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  944  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  945  	dev_dbg(&client->dev, "probe done\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  946  	return ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  947  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

