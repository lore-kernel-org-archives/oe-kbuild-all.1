Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5E31DED57
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434938; cv=none; b=SDz3dIy0wLoNkoNybZ9QLr7Duk8gSKBSBosSigBwnvOvrxK1Le0kDu6RkMIQZ2qiKe/xf9EwIgTD1mJUA8PkFSiyO0TydMs6+I5rvme8Y/DdRYp8bvNOSN9BimIvWJJ+P0Ot5prUDHGEwuyfdQRwJm1hUB4PRUKJba12khAq0XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434938; c=relaxed/simple;
	bh=UguDFeNm3rR92PuEs88LFVrDqZAmJVW1/LezdGratSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bLOAFnrBSq5AfMur04SWQQqjP3tSh92c54MTIqvsax1n76dAdOXoWfEL4m/v+CrTwnp74XDo5nX88bqa+3oENWrQxCSh2BaZolYq0Uprhf3BL2Rtkcz7047xbamqJ26Ic2Nqqy6q+CgDWO7L2EPvwXZtRCxWb5ipxi+BTY+8u7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x3NqfgOf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x3NqfgOf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso22404235e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764434934; x=1765039734; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PLn4jfKsrHWTW4/4+B+0A89DBI80RuILUmevDYeHCmM=;
        b=x3NqfgOfr/DUny+lG+4EmgIxVD+9/LgNAx6+e8c6Q9flPDguYgqWRY+1lmxXOjgLLy
         h/scsudqFvU1BQGdt2h5LmJ8iIV5+LdME4+MYKLxapYZzIrBRFubbxBWiuT9QVbejvGD
         zujHIm8E/CeMAmub8hdXMEDClibhLLFV14WNvYvQzAJiPPtZ1ZWDJBnoiHMHUcd70L2Z
         KSWmBJR1oJ9H1t9kc6ivIsNg5sAUlgUBJddYQ5IRmKnpZ2V8mNWqk3fBw7e2vn/Ub8Tq
         5mKOJ/66V396ubq9rDY0dekvgV+dviasGZQ/ayPA0uqvFMFNgLegx8ztss362+RGqdpd
         PZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434934; x=1765039734;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLn4jfKsrHWTW4/4+B+0A89DBI80RuILUmevDYeHCmM=;
        b=kk7Ddbtw4nryW63ExC9Dr+4w8uLLqm8hc3+rqCzyTMU+JhMk4s433MtEthVKYb9uiO
         Mii3qzWQVRVHFaXES0Ptk/TF3YzP4p6pHTZB6v5YsZP6klIXj+mcA7cKOj4vnTn7Z4UN
         zbA86AwVXDioeAdmylwNQQdsTkzjnMfMLKCVxdK2lOs/Zln1Gahc6RvRAENDk9/WodS+
         nJPWCJdRv8ONtDMi9tLemvwa8BvViKCNkgRo0g5Qlru7Rxyno/wWIXU6q00F+aIIp0io
         wD7TepNypX070XPLobB99DW2sI2nOYsbgbRLsMV1sB9dEILm7GgN0wyHOcUrBX9Nkm1x
         e4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2mVHG4hdUIB46OVORivZyY9WmXHTiYC3EGCkrbSo8kRyr+rs5M/ZiVJQP4Q7KnRh1wzJ37rfpdYA+aTd@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4/fUCjup5qqgP7oIHsVBetARNV0efXN6GktyWyNQS2ZgJxDcw
	tGw2cxykSmLkJia2XxCvsT29wudUpUroH3jiFTXVsE1Jj4c7sWHvkri1Y7CFrCfd8yY=
X-Gm-Gg: ASbGnctenO9RFiXkWzvAqV5poU4kEzuO5APPaN/s4jEetZx60kzAZgu7H82FGxIeCKd
	4ZQfcbS/11men+Xj46C9MVycxVpG9Op3qhaMSk5ge1miZoda44RbmrriT6TaFIig4Lt5NGTOCBN
	stjIRXOhR/qh2bva0yM4GjgSAyljTOofH/9bWMPnIGav3wwh+Z2PwBUESIFPNBlB7MRGgZ0JiUl
	jpbDeDS2VD4W93sbPUwfvOS1/6nKUlhXNMHzPVnWqcjbDkrzfsYU2cXuiXfmUEi33U+gnORKCze
	sqMwH0ompN0UnbWF6rSdAvrnLNIe+B4ENMjwxvO2vz6HwONL7I34avwbFS1aPgzoNWSlyuJH1xm
	JKeVuGaZMGSwjUTKHICUHWaJKW8662Gq/1Rc9U2hnffW4AY66BWFD/2TVu2KbVTREF+/ZhuS/yR
	FJVDgkw1/8xfSU7wuqJQTlm5kDpbQ=
X-Google-Smtp-Source: AGHT+IEsqge+IGONOcaIskW/dh2jD1PHOkthfQu/5sraz9Ssx6DPunUiwRL9a/P5xS6kCYesirvopQ==
X-Received: by 2002:a05:600c:204b:b0:477:9d31:9f76 with SMTP id 5b1f17b1804b1-477b9ee4fd0mr266912685e9.12.1764434934210;
        Sat, 29 Nov 2025 08:48:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479052cfe70sm112532625e9.10.2025.11.29.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:48:53 -0800 (PST)
Date: Sat, 29 Nov 2025 19:48:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jie Deng <dengjie03@kylinos.cn>,
	laurent.pinchart@ideasonboard.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, hansg@kernel.org,
	mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: Re: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during
 USB device hot-unplug
Message-ID: <202511290057.kQLrar4L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122072558.2604753-1-dengjie03@kylinos.cn>

Hi Jie,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Deng/media-usb-uvc-Fix-NULL-pointer-dereference-during-USB-device-hot-unplug/20251122-152814
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251122072558.2604753-1-dengjie03%40kylinos.cn
patch subject: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during USB device hot-unplug
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290057.kQLrar4L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511290057.kQLrar4L-lkp@intel.com/

smatch warnings:
drivers/media/usb/uvc/uvc_video.c:2357 uvc_video_stop_streaming() error: we previously assumed 'stream' could be null (see line 2323)

vim +/stream +2357 drivers/media/usb/uvc/uvc_video.c

571e70dbd421056 Kieran Bingham   2018-11-05  2318  void uvc_video_stop_streaming(struct uvc_streaming *stream)
571e70dbd421056 Kieran Bingham   2018-11-05  2319  {
18ffa9a4cf426a8 Jie Deng         2025-11-22  2320  	struct usb_host_config *config;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2321  	int i;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2322  
18ffa9a4cf426a8 Jie Deng         2025-11-22 @2323  	if (!stream || !stream->dev || !stream->dev->udev || !stream->intf)

I don't think "stream" can be NULL,

18ffa9a4cf426a8 Jie Deng         2025-11-22  2324  		goto cleanup_clock;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2325  
fb58e16bb783833 Kieran Bingham   2018-11-05  2326  	uvc_video_stop_transfer(stream, 1);
571e70dbd421056 Kieran Bingham   2018-11-05  2327  
18ffa9a4cf426a8 Jie Deng         2025-11-22  2328  	config = stream->dev->udev->actconfig;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2329  	if (stream->intf->num_altsetting > 1 && config) {
18ffa9a4cf426a8 Jie Deng         2025-11-22  2330  		/* Security Check: Check if the interface exists and is valid */
18ffa9a4cf426a8 Jie Deng         2025-11-22  2331  		for (i = 0; i < config->desc.bNumInterfaces; i++) {
18ffa9a4cf426a8 Jie Deng         2025-11-22  2332  			if (config->interface[i] &&
18ffa9a4cf426a8 Jie Deng         2025-11-22  2333  			    config->interface[i]->altsetting[0]
18ffa9a4cf426a8 Jie Deng         2025-11-22  2334  				.desc.bInterfaceNumber == stream->intfnum) {
571e70dbd421056 Kieran Bingham   2018-11-05  2335  				usb_set_interface(stream->dev->udev, stream->intfnum, 0);
18ffa9a4cf426a8 Jie Deng         2025-11-22  2336  				break;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2337  			}
18ffa9a4cf426a8 Jie Deng         2025-11-22  2338  		}
571e70dbd421056 Kieran Bingham   2018-11-05  2339  	} else {
699b9a86a3f03ad Laurent Pinchart 2022-06-08  2340  		/*
699b9a86a3f03ad Laurent Pinchart 2022-06-08  2341  		 * UVC doesn't specify how to inform a bulk-based device
571e70dbd421056 Kieran Bingham   2018-11-05  2342  		 * when the video stream is stopped. Windows sends a
571e70dbd421056 Kieran Bingham   2018-11-05  2343  		 * CLEAR_FEATURE(HALT) request to the video streaming
571e70dbd421056 Kieran Bingham   2018-11-05  2344  		 * bulk endpoint, mimic the same behaviour.
571e70dbd421056 Kieran Bingham   2018-11-05  2345  		 */
571e70dbd421056 Kieran Bingham   2018-11-05  2346  		unsigned int epnum = stream->header.bEndpointAddress
571e70dbd421056 Kieran Bingham   2018-11-05  2347  				   & USB_ENDPOINT_NUMBER_MASK;
571e70dbd421056 Kieran Bingham   2018-11-05  2348  		unsigned int dir = stream->header.bEndpointAddress
571e70dbd421056 Kieran Bingham   2018-11-05  2349  				 & USB_ENDPOINT_DIR_MASK;
571e70dbd421056 Kieran Bingham   2018-11-05  2350  		unsigned int pipe;
571e70dbd421056 Kieran Bingham   2018-11-05  2351  
571e70dbd421056 Kieran Bingham   2018-11-05  2352  		pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
571e70dbd421056 Kieran Bingham   2018-11-05  2353  		usb_clear_halt(stream->dev->udev, pipe);
571e70dbd421056 Kieran Bingham   2018-11-05  2354  	}
571e70dbd421056 Kieran Bingham   2018-11-05  2355  
18ffa9a4cf426a8 Jie Deng         2025-11-22  2356  cleanup_clock:
141270bd95d48ea Ricardo Ribalda  2024-03-23 @2357  	uvc_video_clock_cleanup(&stream->clock);
                                                                                ^^^^^^^^^^^^^^
But if it is then we are toasted.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

