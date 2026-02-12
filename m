Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94128286416
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 05:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770874278; cv=none; b=OvtRD3sPftZsiQihu00yIYFGXWyuRJMAyiyPR2aP8VRE8cfuisiE4QyobgiIxNsuQXaV7WFtwKAZcycWI1AcTikj7D/Uf5PxknxT6bEXlClO0BoXv62Z95jZZHF4IhaX7nftg7J+Wdl+bgevsxQLf8EE1wSZvRgPBZygwCTxbUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770874278; c=relaxed/simple;
	bh=IPj99+CAjQCFOyC62JeYeciGSmJzGTFGySVzAYJSdms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MQPHHW+yQt+vXnI7Y9kJir9Udrk2weD7QDjgKm0uX8kXyUt6fBYDeQ6MPr49EyNjFYM/V2WqpTnx5Z9o33liPut029e+pdtKBB9VvfnJxYNTuGG/BAHLJH2nv0Y7vpojzwFM8g9mxR8RRNCEEuaX6O8N+IG6IUNq+ifpynhhIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QeZ+5mog; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QeZ+5mog"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4832701b9b7so33941425e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 21:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770874275; x=1771479075; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WF/dx0Rr8xIVi+ZgBnigIYzsCPl9NNLZZ4DZuS/3Rw0=;
        b=QeZ+5mogv75i001TrSmtFy5XyHD2qx1ZUBqmPJM4vG3Ay1Xc0qfgzo383nltaaQkJy
         4jR9fWzdZk7LmDy2i4o0/AJFD6xpMyVSTgx0/bxyaEiU02BEbrhXH8hEmTQbSGk6P6EB
         7K/+pqJsrHmdrOQ0vhwZ15tI9VAOABYPTxflxd9wMUZmHEl87k9AY/9zMTU22H7gGLwo
         AUNYv0CDdG48Xq7M5V5nR5HuOsPHgkZbIwkls8c/aKj9XFA0/bmn2u2sJ+SYpa1ek8xx
         /wNWK+X8N3NQjQPghtBDZIm3rlug53OmgIqgnYEZSeGs0ktHaQR4pEqSJtRbeviKKHVp
         dqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770874275; x=1771479075;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WF/dx0Rr8xIVi+ZgBnigIYzsCPl9NNLZZ4DZuS/3Rw0=;
        b=e4y6bHY+3FmsK4rWQhUMkuayMtiRgSd7oBegToXCsEc8uGKYNrr6oAahdZjiMY2mO8
         VAlKFrCNZtO3jPRTD3lXzYaoICQUZZYvtxTPU6ZNFmovgaMH/b8XQIFRSBLaXSbgVgdf
         xYOIVeg50sZ5l5u2zn1+kybjEs+d0yK80MMgmWzby5U2TyQ6NG6nzliW3dbSgakNngWS
         kyC6E5gR0WckywzyBcmSDqG1T2WVn8IGrclMvEPVNUv/ykDQrYwIaBRh7Ux2cqMrDn26
         a3ADiobtWy/cbhXTiCJdO5fXYHN/wCcIm4ovhbU7C+kbuO9bc2AW7YHQDA/TWn/SS7GA
         ZmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbKlU2bozNf3l70MClvRngMtburM5OYGcPJG7bEH5uuECh/RJRIQhMSpOVcNPHNa3arSzVx4PYuRRNNSKG@lists.linux.dev
X-Gm-Message-State: AOJu0YxBdSweGILkLm0nZDDnCVGLrfF+sofjtXYQo1Ode9qwV+Q9dROd
	4p1RacL4vWn6WTG2xc2tLOd3gxjXsid8dxMl48qhWpwn7lWZ3ElpYoK540KGPPqER5c=
X-Gm-Gg: AZuq6aLdlgXheQmpR+yx30tAeQ9f5yDH2tC5e9NpNN5ifbXFF3W9Ei6UmwjCr4MO6XB
	7w6rJ+/pjrQrbkbpjXWzB+0Oj5XcU44vyov/Hl0TLtB5dwPz32TRCBxT21P8xbjSSj/Q6s3tmil
	qL42FylZZ1Oc0SpJcJSZ0hxwmRQJRuEF3gaeg2Ulawbofn5r6uIYDjnVnMWy5qXCtqs54zq7MGM
	+lS0iV+NNdqjX0Jaei8rOO5Bqrw3PC9O6BYgNUMtd3swYDKWzQM9vp6UqmHLfjuPqhKRxoE3eEs
	Pp3HRwgOYAnOQw/bqYvufhcX43XGiv+8kcwAYuJ2P7GesuyJCuZhf6QWaVSBgyQICUw+KZSJD0v
	KLeDWBRV/nQgv1Ne0r+sUcOx/PvASMO0qbDZUC+ooxfNA7AFHb+UbWQIg9hrny3c6lKvrMqsKDT
	dwAjQJCpUER2s4vDNDgST9h3zrZIt5
X-Received: by 2002:a05:600c:5287:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-48365716538mr18082855e9.29.1770874274694;
        Wed, 11 Feb 2026 21:31:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd1bsm187141565e9.6.2026.02.11.21.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 21:31:14 -0800 (PST)
Date: Thu, 12 Feb 2026 08:31:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ivan Gorinov <linux-kernel@altimeter.info>,
	Jiri Kosina <jikos@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] HID: winwing: Enable rumble effects
Message-ID: <202602120209.xYKh9QQp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211053116.GA20357@altimeter-info>

Hi Ivan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Gorinov/HID-winwing-Enable-rumble-effects/20260211-133322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260211053116.GA20357%40altimeter-info
patch subject: [PATCH RESEND] HID: winwing: Enable rumble effects
config: parisc-randconfig-r071-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120209.xYKh9QQp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602120209.xYKh9QQp-lkp@intel.com/

smatch warnings:
drivers/hid/hid-winwing.c:235 winwing_haptic_rumble() warn: address of NULL pointer 'data->hdev'
drivers/hid/hid-winwing.c:308 winwing_haptic_rumble_cb() warn: can 'data' even be NULL?
drivers/hid/hid-winwing.c:339 winwing_init_ff() warn: variable dereferenced before check 'data' (see line 333)

vim +235 drivers/hid/hid-winwing.c

c4c97b07cd09c03 Ivan Gorinov 2026-02-11  221  static int winwing_haptic_rumble(struct winwing_drv_data *data)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  222  {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  223  	__u8 *buf;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  224  	__u8 m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  225  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  226  	if (!data)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  227  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  228  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  229  	buf = data->report_rumble;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  230  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  231  	if (!buf)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  232  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  233  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  234  	if (!data->hdev) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11 @235  		hid_err(data->hdev, "data->hdev == NULL\n");
                                                                ^^^^^^^^^^
This doesn't end up getting dereferenced because of dev_err() magic
but passing a NULL here is pointless.

c4c97b07cd09c03 Ivan Gorinov 2026-02-11  236  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  237  	}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  238  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  239  	if (!data->hdev->ll_driver) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  240  		hid_err(data->hdev, "data->hdev->ll_driver == NULL\n");
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  241  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  242  	}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  243  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  244  	m = convert_magnitude(data->rumble.strong_magnitude);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  245  	if (m != data->rumble_left) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  246  		int ret;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  247  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  248  		buf[0] = 0x02;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  249  		buf[1] = 0x01;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  250  		buf[2] = 0xbf;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  251  		buf[3] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  252  		buf[4] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  253  		buf[5] = 0x03;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  254  		buf[6] = 0x49;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  255  		buf[7] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  256  		buf[8] = m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  257  		buf[9] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  258  		buf[10] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  259  		buf[11] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  260  		buf[12] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  261  		buf[13] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  262  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  263  		ret = hid_hw_output_report(data->hdev, buf, 14);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  264  		if (ret < 0) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  265  			hid_err(data->hdev, "error %d (%*ph)\n", ret, 14, buf);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  266  			return ret;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  267  		}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  268  		data->rumble_left = m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  269  	}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  270  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  271  	m = convert_magnitude(data->rumble.weak_magnitude);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  272  	if (m != data->rumble_right) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  273  		int ret;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  274  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  275  		buf[0] = 0x02;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  276  		buf[1] = 0x03;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  277  		buf[2] = 0xbf;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  278  		buf[3] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  279  		buf[4] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  280  		buf[5] = 0x03;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  281  		buf[6] = 0x49;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  282  		buf[7] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  283  		buf[8] = m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  284  		buf[9] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  285  		buf[10] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  286  		buf[11] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  287  		buf[12] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  288  		buf[13] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  289  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  290  		ret = hid_hw_output_report(data->hdev, buf, 14);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  291  		if (ret < 0) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  292  			hid_err(data->hdev, "error %d (%*ph)\n", ret, 14, buf);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  293  			return ret;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  294  		}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  295  		data->rumble_right = m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  296  	}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  297  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  298  	return 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  299  }
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  300  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  301  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  302  static void winwing_haptic_rumble_cb(struct work_struct *work)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  303  {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  304  	struct winwing_drv_data *data;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  305  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  306  	data = container_of(work, struct winwing_drv_data, rumble_work);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  307  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11 @308  	if (data)

"data" can't be NULL.  It's work minus an offset.

c4c97b07cd09c03 Ivan Gorinov 2026-02-11  309  		winwing_haptic_rumble(data);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  310  }
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  311  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  312  static int winwing_play_effect(struct input_dev *dev, void *context,
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  313  		struct ff_effect *effect)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  314  {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  315  	struct winwing_drv_data *data = (struct winwing_drv_data *) context;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  316  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  317  	if (effect->type != FF_RUMBLE)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  318  		return 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  319  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  320  	if (!data)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  321  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  322  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  323  	data->rumble = effect->u.rumble;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  324  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  325  	return schedule_work(&data->rumble_work);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  326  }
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  327  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  328  static int winwing_init_ff(struct hid_device *hdev, struct hid_input *hidinput)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  329  {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  330  	struct winwing_drv_data *data;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  331  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  332  	data = (struct winwing_drv_data *) hid_get_drvdata(hdev);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11 @333  	data->report_rumble = devm_kzalloc(&hdev->dev, MAX_REPORT, GFP_KERNEL);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  334  	data->rumble_left = -1;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  335  	data->rumble_right = -1;
                                                ^^^^^^^^^^^^^^^^^^
Dereferences here.

c4c97b07cd09c03 Ivan Gorinov 2026-02-11  336  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  337  	input_set_capability(hidinput->input, EV_FF, FF_RUMBLE);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  338  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11 @339  	if (!data)
                                                    ^^^^^^
Checked too late.

c4c97b07cd09c03 Ivan Gorinov 2026-02-11  340  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  341  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  342  	return input_ff_create_memless(hidinput->input, data,
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  343  			winwing_play_effect);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  344  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

