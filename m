Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3605564D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737960469; cv=none; b=Zn9oCOCz5S84BXE7wXpaXcVOEgZKvVc5AlFeDdrJj9g/4qunHZ2rm+8mgX1GTxQNwqAbz6pBf+8EtKLdiLEPJTMf2mhjXYlF1voEtdNQMoltqdHgJvgT6SLTTlTXVQDsW5HgYsMMWDjZpx5hMSDBRCiGAoz916fEiY0xni4EA1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737960469; c=relaxed/simple;
	bh=XAihpJ5AQAiB3ebIbTkbW5RwQa9XtRTY3lFp/PXUopE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/U3E7Cp5bxJ640tcfSd/gQ368hYbC0N4ZEuGcrcF9NdMLT8KyN6ZxfsS+VQJgl60w5H5dqaxoGUEz8Yr1i+EItjw81sPVysNFYbonsou0REtC4nuI6CvVj6I/uEXNl79jU/o5RNOUByWkqlh/Ac+RRRd1YSkHLF0w/9nhfOMWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rGYHWjt8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rGYHWjt8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361f796586so43569535e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 22:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737960465; x=1738565265; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zwuRELpobOY4MZ7Rc/xLs7uKZ36RheFmDnk+8zGrALU=;
        b=rGYHWjt8CFfKBx0ObwslnxVQSa07B/Dm1li9hb/1wnbYUfyn0q6I3RSgsUHuvjhVwm
         r5rkapqJyyxEhKAs46sUDT8vcZivcjbGbFkzmz3tsxw78mUtdn5mWOG6hn7eujuxYjmo
         XKiAwYtpXwj9Gt/f/E9mgxTOBEvXEteslDLEq0iwtFIt5XYwgayliuGoMZFFlE6F9rH7
         QoBka8g3i1XmBKg5XcXNSx0OnY4YP+s668dd+WPWop0e93QdMcFmkaCrpqm+k/p+t/oQ
         p8RFzLW/qD1/yAUBg4gmux+hlEi0pZjnqxXrw6jtca1aJkRgbM+vEHgZtr2/v0YVnDrX
         nmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737960465; x=1738565265;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwuRELpobOY4MZ7Rc/xLs7uKZ36RheFmDnk+8zGrALU=;
        b=Ww+Ik+xEzcPrCUTaQRuJXlNcw/+/IMGXgmJshyo/oTnueK/AoO669mT0nJHCsSUCQK
         COoz2NGzlE4e3f974aBvU5ANmT3BRC7jCYGtJqyR5RG10V/aDlMY9v4BLLOmaE/r2vxS
         L/EFBDqrW8St7dlkHC2wpUlo9id6N+ZtAKTwRgwfDs3F4lC78X1tnkcegnfNUVfG6V67
         ENxhOlVxGTiqfqmFWRUVZOWva7i247fUh/s2CBQSvkJM9OdEl23bPvEJAIu4cnzjADyk
         hhohPEJIQjrZOQ0IeEQ6xQofZDhs5Sai2HQeGJyGS5rn94h3bwHE1mLzDPdcBqDQjOkQ
         Fq6A==
X-Forwarded-Encrypted: i=1; AJvYcCUruJtQocyOGfJw8u+clcz9gTmgnuicJEUSgz42T+HsU9LXeQ/Zyp9lE/8Ap+xkyYps3e2xewedfXtKk+Eb@lists.linux.dev
X-Gm-Message-State: AOJu0YxGLAMVtc8l5XGoUvLf2vmy45u4mk18D3aZLR2YDPyfx1LInUiF
	O4O8qM7zOBGvkMtuof7J4dXdyb8eJy+dOQNLiCRLYLL6ReiGPcluCgY751iuBvhX+Qj9al6rGes
	A
X-Gm-Gg: ASbGncuH8H0MpbZ4k4ciuSQmFjZIDO8YO3lZKKa97N4aIguA7aWeAdUga00J4z7Nwib
	AaZBUD3mwea9fTVz82Ck74gXX/Qu+/orJxJb3Lq3Ki3SBWqazcvpDxqDpY0DgHQmCG1sZBF00G/
	ZN0et49xU9HDOHiXID8exlIgLmcfmwn2LUuKVJYRQKVo6gypWehJyExxZ+9z4igiwMXYwi2C0qG
	cGHLkxQIyljwv1cDNu4fm+ZKz2W8sXMKyvujzynfjL9MHhnCVCPj8sxL/m6riEwFWiJdq8T3qa4
	gDsv2ZTCnA==
X-Google-Smtp-Source: AGHT+IGH4apwhfl8rhUZetM/qgFAQ62qb0c3NoxThdVS4z6eCLrJrYygu1BTHHRAdOzbCO+9xPEsZA==
X-Received: by 2002:a05:600c:cc6:b0:434:a852:ba77 with SMTP id 5b1f17b1804b1-438913f153amr379188105e9.15.1737960465446;
        Sun, 26 Jan 2025 22:47:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b16ff659sm124749185e9.0.2025.01.26.22.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 22:47:44 -0800 (PST)
Date: Mon, 27 Jan 2025 09:47:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1]
 drivers/usb/gadget/function/u_serial.c:570 gs_start_io() warn: variable
 dereferenced before check 'port->port_usb' (see line 537)
Message-ID: <27184d70-1087-4b33-a5ee-f97416e0c96e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ *********************

  QUESTION:  Does anyone read these Android reports? -dan

  ********************* ]

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   49530c73f82d0377a960e70d167621ca922d4d59
commit: 4efdfdc32d8d6307f968cd99f1db64468471bab1 [1/1] usb: gadget: u_serial: Fix the issue that gs_start_io crashed due to accessing null pointer
config: x86_64-randconfig-161-20250126 (https://download.01.org/0day-ci/archive/20250126/202501261840.WluPurER-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501261840.WluPurER-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/function/u_serial.c:570 gs_start_io() warn: variable dereferenced before check 'port->port_usb' (see line 537)

Old smatch warnings:
drivers/usb/gadget/function/u_serial.c:339 gs_start_rx() warn: variable dereferenced before check 'port->port_usb' (see line 304)

vim +570 drivers/usb/gadget/function/u_serial.c

c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  534  static int gs_start_io(struct gs_port *port)
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  535  {
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  536  	struct list_head	*head = &port->read_pool;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19 @537  	struct usb_ep		*ep = port->port_usb->out;
                                                                                                                      ^^^^^^^^^^^^^^^^
Dereference

c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  538  	int			status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  539  	unsigned		started;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  540  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  541  	/* Allocate RX and TX I/O buffers.  We can't easily do this much
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  542  	 * earlier (with GFP_KERNEL) because the requests are coupled to
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  543  	 * endpoints, as are the packet sizes we'll be using.  Different
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  544  	 * configurations may use different endpoints with a given port;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  545  	 * and high speed vs full speed changes packet sizes too.
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  546  	 */
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  547  	status = gs_alloc_requests(ep, head, gs_read_complete,
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  548  		&port->read_allocated);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  549  	if (status)
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  550  		return status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  551  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  552  	status = gs_alloc_requests(port->port_usb->in, &port->write_pool,
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  553  			gs_write_complete, &port->write_allocated);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  554  	if (status) {
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  555  		gs_free_requests(ep, head, &port->read_allocated);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  556  		return status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  557  	}
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  558  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  559  	/* queue read requests */
937ef73d507599 drivers/usb/gadget/u_serial.c          David Brownell 2008-07-07  560  	port->n_read = 0;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  561  	started = gs_start_rx(port);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  562  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  563  	if (started) {
5d48ee32116070 drivers/usb/gadget/function/u_serial.c Sergey Organov 2020-01-29  564  		gs_start_tx(port);
5d48ee32116070 drivers/usb/gadget/function/u_serial.c Sergey Organov 2020-01-29  565  		/* Unblock any pending writes into our circular buffer, in case
5d48ee32116070 drivers/usb/gadget/function/u_serial.c Sergey Organov 2020-01-29  566  		 * we didn't in gs_start_tx() */
35f95fd7f234d2 drivers/usb/gadget/u_serial.c          Jiri Slaby     2012-04-02  567  		tty_wakeup(port->port.tty);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  568  	} else {
4efdfdc32d8d63 drivers/usb/gadget/function/u_serial.c Lianqin Hu     2024-12-03  569  		/* Free reqs only if we are still connected */
4efdfdc32d8d63 drivers/usb/gadget/function/u_serial.c Lianqin Hu     2024-12-03 @570  		if (port->port_usb) {
                                                                                                    ^^^^^^^^^^^^^^
Checked too late

28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  571  			gs_free_requests(ep, head, &port->read_allocated);
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  572  			gs_free_requests(port->port_usb->in, &port->write_pool,
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  573  				&port->write_allocated);
4efdfdc32d8d63 drivers/usb/gadget/function/u_serial.c Lianqin Hu     2024-12-03  574  		}
937ef73d507599 drivers/usb/gadget/u_serial.c          David Brownell 2008-07-07  575  		status = -EIO;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  576  	}
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  577  
937ef73d507599 drivers/usb/gadget/u_serial.c          David Brownell 2008-07-07  578  	return status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  579  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

