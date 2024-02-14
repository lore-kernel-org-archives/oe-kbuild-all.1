Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F479DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707901223; cv=none; b=aq8O32vwQbyyd5zvF4NErgbaxndnmOI0J9QNNWSqNOy5J19/4zYbZM6xl1nHHrk+g9Y72pBR7stGYpbHt+X07DySzCkA4R7jwoAYO+GRCc+sZoYxih2HKzF3SceTPYPZlIu7yQZN0W/WrqTdUPlN+s0REtBDWCCA7lVGxoSBrAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707901223; c=relaxed/simple;
	bh=AfPibrcqDsxvdthbZKnaV+C6vZ2ntirzjX5KshFvZv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=gGMujPLOCqmJUW88p2g2IWxrZoGTwFmpBDd7OZa9oEuMjaHAJUOq8xh+mFio79cK6uZPpNj3EZLdWc916ww/U6X8ZXhTgc0m2O0YVvqErguJ5ubbeRhri2M5tp/FEwflnd9pwCH6fLkMsmYw8EC8PEqCqu5S9hq0J1mxFwMzW6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5kjX3V7; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5kjX3V7"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so7574254a12.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707901218; x=1708506018; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rUIdnkiSb9ACc7Aso/SmUid/GgndJZt6FDfwx7qEexg=;
        b=a5kjX3V7sFg+4lnZ1g/+Mgd1I5w399zHeWqiAcBkje4TaMasNksgrBhaiTPlT+OK7j
         Gxyq9xTdAASAPABwXXOj3re+qXG9P/o/QchFEhIfd9gHIBiW5liBfB/42TpSL1INrclA
         KC0iF8ne6x0ODttI7G65QFRWx2Den8TbBxez+4hCzeJl4R874aIL2eKx9qC/E9j+QykD
         iZ5oOufYWF7hX553fTKFizurvZUx0iJKfG51ifVaDuHt79sMotmrITuV/+FjxZbEfaIB
         Bu6WcahHDodrB+46yvAckisv5hGhH9qWXcU8FcKgDJ7SmPYbr2LYVmvGhBLg3uw21G1I
         JVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901218; x=1708506018;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUIdnkiSb9ACc7Aso/SmUid/GgndJZt6FDfwx7qEexg=;
        b=hffOv5VP9FqFo8p8RJyaNhfo1YOw2PygZbE9yhwjSYrIT0LLZkVrwCK81kbACltmBy
         y+T528jcim3UNQESOvoH2zsgwEfXuLFcJGT81hAKJgkRMDFLm+ZZPHRIWpyq44udumeW
         840C60uRQcVn5w8rBWTXHOf01xtRHu+EXNDhYLg3u2i0KeaBNyDN/TzsDLv9JQSb1kLW
         gHD8M8DbNBPR4w/Re4BE+d5B/AG8fA5LJXx9AeKYdP0rufsjFCNWpXYsH3q0thvJPb7B
         hChwdsEoQHmrRDMmHlXMLbEEz7NBDGvji9QVQnIekQaExhWUcJuxaHUaKLjTqSls8xhs
         9D7g==
X-Forwarded-Encrypted: i=1; AJvYcCUfNuKVui5owwRO7vxi8/ipXZdlRX/xWQ/yceDlKz7J51CfpckgePEeVvNM/f9MuQi/kECdAjL3rvOsqcXzZdEp1FdI5hYhsaL6J7hVyA==
X-Gm-Message-State: AOJu0YwA0oWdygDMriPjv4zQlZzuWO59v9kPuCtXGQKL+9oS8XuzkWkY
	pxOypGiTIFL4bMpyC1W0a1GQSgcWpypmGSM0QowS9poX1ao3BRURPzNDgMLh3Ak=
X-Google-Smtp-Source: AGHT+IH79jZnJDd2W40dA1GRM9vdj0ZNbSRCsOcRGqGBOI0ttCIK8wcMpYHxazg9xaHJG4cXPjN0vg==
X-Received: by 2002:aa7:c1d2:0:b0:562:80:fe95 with SMTP id d18-20020aa7c1d2000000b005620080fe95mr1487803edp.39.1707901218292;
        Wed, 14 Feb 2024 01:00:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZEeJ+lsjC6i5ICjt1PV9aoDnEvKejy1OZ/S4xfGXqyS12H3nCGmspTiCcICS+xfBnapwNj5S6HFNtMpD12rtVIdENj22g7NdiQ8voaBVEDu5fMuEbmfU6UnjaczVJe+y9iP9bv8HJbPKCtzxk0GvQVE5y8mpzv7dFLvAnHYIxCdO++zBiB25sPk8jCOEmzHXgCUrCrlpqFfYWabHxdWp3Ok3UR3owWh0njC8QLSFRDic0K2teyRIaGaZbzYLV2B/aXte9es9TvKhlh1V3LGk1cnDowL4Ihx3jqUsA8XBfYAnl+lQGa8yacXqBfG2DkUsaP3Gk1fAaSJVSUx01p0pxmNc43pFO9Bh+dz7HIUKV92BGY1WSmYDJR4FMqBdYU2qJ+u1qPDi8jplNxMbekktk9M18/0zgWoyUji+cOtqb2KaevNzRbzj+6IDJg30VEPzk9Wwn3cNsPEuFID2mQpRDkqTCjcf410XmJqSrkacwupctA1yB87vNKu46pIfmVvmSV9nflpi5hBWwUREoS2UDwhkQRbXVnluD1/WAhyRj1seNYx59Cqb117VnZ3xsUhmkQC8XCvyw1E8b5HynadIc3u2mssjoIzOI1dDwVZPc/6uixZiIFKxxYmudEADQ6+Y0IhA=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s7-20020a05640217c700b005602346c3f5sm4481965edy.79.2024.02.14.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 01:00:17 -0800 (PST)
Date: Wed, 14 Feb 2024 12:00:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tony Lindgren <tony@atomide.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 4/6] serial: core: Add support for DEVNAME:0.0 style
 naming for kernel console
Message-ID: <aa4b1b2e-50b8-419c-bf0d-526711f1aaea@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213084545.40617-5-tony@atomide.com>

Hi Tony,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/printk-Save-console-options-for-add_preferred_console_match/20240213-171012
base:   6cc3028f797a549f256d593867a769ab6a8265f2
patch link:    https://lore.kernel.org/r/20240213084545.40617-5-tony%40atomide.com
patch subject: [PATCH v6 4/6] serial: core: Add support for DEVNAME:0.0 style naming for kernel console
config: i386-randconfig-141-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141619.BqEGGzwm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402141619.BqEGGzwm-lkp@intel.com/

smatch warnings:
drivers/tty/serial/serial_base_bus.c:255 serial_base_add_preferred_console() error: uninitialized symbol 'port_match'.

vim +/port_match +255 drivers/tty/serial/serial_base_bus.c

a2020a9ccacd63 Tony Lindgren 2024-02-13  252  int serial_base_add_preferred_console(struct uart_driver *drv,
a2020a9ccacd63 Tony Lindgren 2024-02-13  253  				      struct uart_port *port)
a2020a9ccacd63 Tony Lindgren 2024-02-13  254  {
a2020a9ccacd63 Tony Lindgren 2024-02-13 @255  	const char *port_match __free(kfree);

Someone should add this to checkpatch.  These always need to be
initialized to NULL.

a2020a9ccacd63 Tony Lindgren 2024-02-13  256  	int ret;
a2020a9ccacd63 Tony Lindgren 2024-02-13  257  
a2020a9ccacd63 Tony Lindgren 2024-02-13  258  	ret = serial_base_add_prefcon(drv->dev_name, port->line);
a2020a9ccacd63 Tony Lindgren 2024-02-13  259  	if (ret)
a2020a9ccacd63 Tony Lindgren 2024-02-13  260  		return ret;
a2020a9ccacd63 Tony Lindgren 2024-02-13  261  
a2020a9ccacd63 Tony Lindgren 2024-02-13  262  	port_match = kasprintf(GFP_KERNEL, "%s:%i.%i", dev_name(port->dev),
a2020a9ccacd63 Tony Lindgren 2024-02-13  263  			       port->ctrl_id, port->port_id);
a2020a9ccacd63 Tony Lindgren 2024-02-13  264  	if (!port_match)
a2020a9ccacd63 Tony Lindgren 2024-02-13  265  		return -ENOMEM;
a2020a9ccacd63 Tony Lindgren 2024-02-13  266  
a2020a9ccacd63 Tony Lindgren 2024-02-13  267  	/* Translate a hardware addressing style console=DEVNAME:0.0 */
a2020a9ccacd63 Tony Lindgren 2024-02-13  268  	return serial_base_add_one_prefcon(port_match, drv->dev_name, port->line);
a2020a9ccacd63 Tony Lindgren 2024-02-13  269  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

