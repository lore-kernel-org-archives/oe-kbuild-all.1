Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2087A328B56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890941; cv=none; b=B/zsEmVWBVp9ygRn//Pty2qhjx/A8fDzmBpionhveSig4KB+w8f4EgvlGK0j2R7tUDUi3ab2gBRoK09XIXFYRHNOuBw09/LI8KmfZTjkiwd7i4QHY8iUus3AhrafjBjWvdPsaiiD64LDxEV4265O4ZMu7FdEBEO8X0AFZYZ9lVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890941; c=relaxed/simple;
	bh=rW7rNuVo+lhdnaRKUFNJHZdHzG+zPXuaY5vW/5Xc0l8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2hWbGAtdAkOYbeOmC4PX+I1cWjbWW2HhwufV5gvqX5Am2P20vuaZADi7AD6lm6D2b9pEsVdK/JhiwIk7IrpcW0VrnuI/EBHsOVPzy/VVBi4ocX2SC49uavDlBIvun+XtdAPmvvtsjiOrshcD/qxpW7mOMXCWbEmmVhKAUCjjuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kl1v5HCe; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kl1v5HCe"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ee0291921so33065785e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 22:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768890937; x=1769495737; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yia2W4+3pfwPFkSwpFDTBERJEOO6uvKbZbLH8zgFwy8=;
        b=Kl1v5HCeboVgr6GuK7AaqrvsAYCuYvXy90N0EMMS/JP7K+mLVOkhsUqOKqFliYZu1m
         H2l1WhdJS34Lceus9zuwjZocDt4G02TQcRdwSAb7hxHd2TBINdgebhvit+S7jvlDVl1d
         Pyi/VrBCk+Yak0ULobBII3kNF/HFHZHqMQbl/Lwa129zJfUu/spAqcpBspw3/ka33lON
         pzx+yFyW/RA8gGlus2mgCAh14XyOvMzB+j1urPuQnOYkjcCpxA6IYU7N63juEL6NBtFs
         c5kf87OTjNtPGjgHRnFnTIk52PAjhbpZTvLGKWp4O8QvJqzco3NzYgIkGrYmHfSonKO9
         Ar9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890937; x=1769495737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yia2W4+3pfwPFkSwpFDTBERJEOO6uvKbZbLH8zgFwy8=;
        b=r4g+FxMTHFDFa0Wi4EjFjjAcd6xVdbgDdHErLFz7nxNf+asPEF/fhCQU/x9Bjxv4ID
         u5/0kwJ4j4Xy8pND1cGonhca7g/3T4cEfI+aZ6jHd2kOaP8wqNHk+eFLjmjMw5YdTAGA
         DCtG2Ffk0xpYBxDUqFRA0bqmBgkyOjMhqhmqVd9LdnXhi1WmiJCz9vvwSnlM0shBu9Wg
         jyQqdsaWFzkjYdYk8IXF6CzUBT+kXXij92a+QMhsGvejIxguguqSKK/3LmdQTBHeajxO
         09jN5092UA2sCxNRp3bA/qSjMqqgxlpGbZEPOPHdWQAFJs9e4UD7TewtIWcf+lxH6EiY
         0LYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk1ms+YZv3nH4WpqyDkFDegZE0hhxCtCV1J+AFn6Td3TSGYoFRedwM41v+jyxBveLCBJyAP7Wb7MdlNd+1@lists.linux.dev
X-Gm-Message-State: AOJu0YzTrZayZkk9YUXErM03E0x45oun+lN7HVefF9fvNnPp/jEE4lrp
	1ifXUNUWUwLRbZQG6dvWbGpfrz1nXWrqx5fVloXBvFuJgrjnAhvzP0W0ydhlEVVjpvo=
X-Gm-Gg: AY/fxX7HWPExl/gYpE4nj/O6OckqVg+WRYYugiEEDYLO0sx4rp3HuZokbQr7sGCGMzj
	QHNwVsTxfnjIJDRYdDOCV/Byljzfc/WpkJdoDWrim3kUOLIphfp41egCeaPYgmQtsaZ9ALrSeiC
	TNzRbcBlXTvn11ym9XXZG7H0drxwPns8acoJ/8mSj/b02J3y1mNJPdSV6WXj5ZtXxDbwKTxPqxr
	FzWbuFcwBVh3FCsqoSGDbzcinEbGjWZ1M/Oe35QylwLdkFEZp9jwRNqIVcEY3dXVHvTWBVuh9rr
	EPRvBEWgDQ13fyTyg9dJoMVLK4wIIyZTCR0rzBO5+jcO1YQohrFSqq87ySbLK5msMDGZ8548R+e
	Zp0Ph0lNsgZxPLU318JmIYz+3yVXft7V5IcuRgrYSnCCIuOmpWQ/O8kyHI1+ltZUbA5jdSrYQXb
	JyhgLBcZ4JuGOuEjN0ZvXDupzweEo=
X-Received: by 2002:a05:600c:4e90:b0:47e:e20e:bba3 with SMTP id 5b1f17b1804b1-4801eab54ccmr170546535e9.7.1768890936817;
        Mon, 19 Jan 2026 22:35:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9daaabsm97155355e9.4.2026.01.19.22.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:35:36 -0800 (PST)
Date: Tue, 20 Jan 2026 09:35:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 196/196]
 drivers/usb/gadget/composite.c:919 set_config() warn: iterator used outside
 loop: 'c'
Message-ID: <202601200312.6pgHQsnw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: 1624cd20387974d94299c111e7316f766c331400 [196/196] usb: gadget: Set self-powered based on MaxPower and bmAttributes
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260120/202601200312.6pgHQsnw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601200312.6pgHQsnw-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/composite.c:919 set_config() warn: iterator used outside loop: 'c'

Old smatch warnings:
drivers/usb/gadget/composite.c:919 set_config() error: we previously assumed 'c' could be null (see line 853)
drivers/usb/gadget/composite.c:2369 composite_suspend() error: we previously assumed 'cdev->config' could be null (see line 2358)

vim +/c +919 drivers/usb/gadget/composite.c

40982be52d8f64 David Brownell    2008-06-19  818  static int set_config(struct usb_composite_dev *cdev,
40982be52d8f64 David Brownell    2008-06-19  819  		const struct usb_ctrlrequest *ctrl, unsigned number)
40982be52d8f64 David Brownell    2008-06-19  820  {
40982be52d8f64 David Brownell    2008-06-19  821  	struct usb_gadget	*gadget = cdev->gadget;
40982be52d8f64 David Brownell    2008-06-19  822  	struct usb_configuration *c = NULL;
40982be52d8f64 David Brownell    2008-06-19  823  	int			result = -EINVAL;
40982be52d8f64 David Brownell    2008-06-19  824  	unsigned		power = gadget_is_otg(gadget) ? 8 : 100;

power is 8 or 100.

40982be52d8f64 David Brownell    2008-06-19  825  	int			tmp;
40982be52d8f64 David Brownell    2008-06-19  826  
40982be52d8f64 David Brownell    2008-06-19  827  	if (number) {
40982be52d8f64 David Brownell    2008-06-19  828  		list_for_each_entry(c, &cdev->configs, list) {
40982be52d8f64 David Brownell    2008-06-19  829  			if (c->bConfigurationValue == number) {
bdb64d727216b4 Tatyana Brokhman  2011-06-29  830  				/*
bdb64d727216b4 Tatyana Brokhman  2011-06-29  831  				 * We disable the FDs of the previous
bdb64d727216b4 Tatyana Brokhman  2011-06-29  832  				 * configuration only if the new configuration
bdb64d727216b4 Tatyana Brokhman  2011-06-29  833  				 * is a valid one
bdb64d727216b4 Tatyana Brokhman  2011-06-29  834  				 */
bdb64d727216b4 Tatyana Brokhman  2011-06-29  835  				if (cdev->config)
bdb64d727216b4 Tatyana Brokhman  2011-06-29  836  					reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19  837  				result = 0;
40982be52d8f64 David Brownell    2008-06-19  838  				break;
40982be52d8f64 David Brownell    2008-06-19  839  			}
40982be52d8f64 David Brownell    2008-06-19  840  		}
40982be52d8f64 David Brownell    2008-06-19  841  		if (result < 0)
40982be52d8f64 David Brownell    2008-06-19  842  			goto done;

If we don't hit the break statement then we goto done.

bdb64d727216b4 Tatyana Brokhman  2011-06-29  843  	} else { /* Zero configuration value - need to reset the config */
bdb64d727216b4 Tatyana Brokhman  2011-06-29  844  		if (cdev->config)
bdb64d727216b4 Tatyana Brokhman  2011-06-29  845  			reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19  846  		result = 0;
bdb64d727216b4 Tatyana Brokhman  2011-06-29  847  	}
40982be52d8f64 David Brownell    2008-06-19  848  
1cbfb8c4f62d66 Joel Stanley      2019-09-30  849  	DBG(cdev, "%s config #%d: %s\n",
e538dfdae85244 Michal Nazarewicz 2011-08-30  850  	    usb_speed_string(gadget->speed),
e538dfdae85244 Michal Nazarewicz 2011-08-30  851  	    number, c ? c->label : "unconfigured");
40982be52d8f64 David Brownell    2008-06-19  852  
40982be52d8f64 David Brownell    2008-06-19  853  	if (!c)
40982be52d8f64 David Brownell    2008-06-19  854  		goto done;
40982be52d8f64 David Brownell    2008-06-19  855  
6027f3173e797b Peter Chen        2014-04-29  856  	usb_gadget_set_state(gadget, USB_STATE_CONFIGURED);
40982be52d8f64 David Brownell    2008-06-19  857  	cdev->config = c;
40982be52d8f64 David Brownell    2008-06-19  858  
40982be52d8f64 David Brownell    2008-06-19  859  	/* Initialize all interfaces by setting them to altsetting zero. */
40982be52d8f64 David Brownell    2008-06-19  860  	for (tmp = 0; tmp < MAX_CONFIG_INTERFACES; tmp++) {
40982be52d8f64 David Brownell    2008-06-19  861  		struct usb_function	*f = c->interface[tmp];
5242658d1b9777 Laurent Pinchart  2009-10-21  862  		struct usb_descriptor_header **descriptors;
40982be52d8f64 David Brownell    2008-06-19  863  
40982be52d8f64 David Brownell    2008-06-19  864  		if (!f)
40982be52d8f64 David Brownell    2008-06-19  865  			break;
40982be52d8f64 David Brownell    2008-06-19  866  
5242658d1b9777 Laurent Pinchart  2009-10-21  867  		/*
5242658d1b9777 Laurent Pinchart  2009-10-21  868  		 * Record which endpoints are used by the function. This is used
5242658d1b9777 Laurent Pinchart  2009-10-21  869  		 * to dispatch control requests targeted at that endpoint to the
5242658d1b9777 Laurent Pinchart  2009-10-21  870  		 * function's setup callback instead of the current
5242658d1b9777 Laurent Pinchart  2009-10-21  871  		 * configuration's setup callback.
5242658d1b9777 Laurent Pinchart  2009-10-21  872  		 */
f3bdbe36682631 John Youn         2016-02-05  873  		descriptors = function_descriptors(f, gadget->speed);
5242658d1b9777 Laurent Pinchart  2009-10-21  874  
5242658d1b9777 Laurent Pinchart  2009-10-21  875  		for (; *descriptors; ++descriptors) {
5242658d1b9777 Laurent Pinchart  2009-10-21  876  			struct usb_endpoint_descriptor *ep;
5242658d1b9777 Laurent Pinchart  2009-10-21  877  			int addr;
5242658d1b9777 Laurent Pinchart  2009-10-21  878  
5242658d1b9777 Laurent Pinchart  2009-10-21  879  			if ((*descriptors)->bDescriptorType != USB_DT_ENDPOINT)
5242658d1b9777 Laurent Pinchart  2009-10-21  880  				continue;
5242658d1b9777 Laurent Pinchart  2009-10-21  881  
5242658d1b9777 Laurent Pinchart  2009-10-21  882  			ep = (struct usb_endpoint_descriptor *)*descriptors;
5242658d1b9777 Laurent Pinchart  2009-10-21  883  			addr = ((ep->bEndpointAddress & 0x80) >> 3)
5242658d1b9777 Laurent Pinchart  2009-10-21  884  			     |  (ep->bEndpointAddress & 0x0f);
5242658d1b9777 Laurent Pinchart  2009-10-21  885  			set_bit(addr, f->endpoints);
5242658d1b9777 Laurent Pinchart  2009-10-21  886  		}
5242658d1b9777 Laurent Pinchart  2009-10-21  887  
40982be52d8f64 David Brownell    2008-06-19  888  		result = f->set_alt(f, tmp, 0);
40982be52d8f64 David Brownell    2008-06-19  889  		if (result < 0) {
40982be52d8f64 David Brownell    2008-06-19  890  			DBG(cdev, "interface %d (%s/%p) alt 0 --> %d\n",
40982be52d8f64 David Brownell    2008-06-19  891  					tmp, f->name, f, result);
40982be52d8f64 David Brownell    2008-06-19  892  
40982be52d8f64 David Brownell    2008-06-19  893  			reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19  894  			goto done;
40982be52d8f64 David Brownell    2008-06-19  895  		}
1b9ba000177ee4 Roger Quadros     2011-05-09  896  
1b9ba000177ee4 Roger Quadros     2011-05-09  897  		if (result == USB_GADGET_DELAYED_STATUS) {
1b9ba000177ee4 Roger Quadros     2011-05-09  898  			DBG(cdev,
1b9ba000177ee4 Roger Quadros     2011-05-09  899  			 "%s: interface %d (%s) requested delayed status\n",
1b9ba000177ee4 Roger Quadros     2011-05-09  900  					__func__, tmp, f->name);
1b9ba000177ee4 Roger Quadros     2011-05-09  901  			cdev->delayed_status++;
1b9ba000177ee4 Roger Quadros     2011-05-09  902  			DBG(cdev, "delayed_status count %d\n",
1b9ba000177ee4 Roger Quadros     2011-05-09  903  					cdev->delayed_status);
1b9ba000177ee4 Roger Quadros     2011-05-09  904  		}
40982be52d8f64 David Brownell    2008-06-19  905  	}
40982be52d8f64 David Brownell    2008-06-19  906  
40982be52d8f64 David Brownell    2008-06-19  907  	/* when we return, be sure our power usage is valid */
03f4492dbff3d7 Jack Pham         2021-07-20  908  	if (c->MaxPower || (c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
03f4492dbff3d7 Jack Pham         2021-07-20  909  		power = c->MaxPower;
03f4492dbff3d7 Jack Pham         2021-07-20  910  	else
03f4492dbff3d7 Jack Pham         2021-07-20  911  		power = CONFIG_USB_GADGET_VBUS_DRAW;
03f4492dbff3d7 Jack Pham         2021-07-20  912  
a2035411fa1d12 Jack Pham         2020-01-30  913  	if (gadget->speed < USB_SPEED_SUPER)
a2035411fa1d12 Jack Pham         2020-01-30  914  		power = min(power, 500U);
a2035411fa1d12 Jack Pham         2020-01-30  915  	else
a2035411fa1d12 Jack Pham         2020-01-30  916  		power = min(power, 900U);
40982be52d8f64 David Brownell    2008-06-19  917  done:
1624cd20387974 Prashanth K       2025-02-17  918  	if (power > USB_SELF_POWER_VBUS_MAX_DRAW ||

USB_SELF_POWER_VBUS_MAX_DRAW is 100 so power is <= USB_SELF_POWER_VBUS_MAX_DRAW.

1624cd20387974 Prashanth K       2025-02-17 @919  	    !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
                                                              ^^^^^^^^^^^^^^^
c is an invalid pointer here.

5e5caf4fa8d303 Thinh Nguyen      2020-02-03  920  		usb_gadget_clear_selfpowered(gadget);
1624cd20387974 Prashanth K       2025-02-17  921  	else
1624cd20387974 Prashanth K       2025-02-17  922  		usb_gadget_set_selfpowered(gadget);
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  923  
40982be52d8f64 David Brownell    2008-06-19  924  	usb_gadget_vbus_draw(gadget, power);
1b9ba000177ee4 Roger Quadros     2011-05-09  925  	if (result >= 0 && cdev->delayed_status)
1b9ba000177ee4 Roger Quadros     2011-05-09  926  		result = USB_GADGET_DELAYED_STATUS;
40982be52d8f64 David Brownell    2008-06-19  927  	return result;
40982be52d8f64 David Brownell    2008-06-19  928  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

