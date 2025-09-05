Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28E1FAC34
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757062837; cv=none; b=GUuZMZO2Ur5KPYpD6BImOihjgmM2/2pqhrrVBEys2dG3Xil5YODslSlBtxQ1qbDV0y29+NAsVWAyQQcBlKd9Oqx3YFplOvrgRTVz8c3XWmRwXENuKd8IS2j6LpKs6B/a3teCPKwDoXPUOhqdiVal5PALe9FzgMoOJMIvBJCLE+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757062837; c=relaxed/simple;
	bh=Vyrhftm0FToZce2/xnYkWkvkESmw36f++3xTRtYz8rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFwWpvWb2C6UIJj8iVZR7a1FzKSs5UwL+QPY3rYGuvPR2MZbKlAuUI+1rKMDV1XbnBzjHLYVjY1J241sef3i9qLZMJAO1P71dyK6P909SWFCBy65Q5hpLRizZhYOG/VEb1DzNUqqQczq1GSPmTfxwYeAyze0Fp9DxOE5rvq9oy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KpVqQCWY; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KpVqQCWY"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b02c719a117so359828366b.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Sep 2025 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757062834; x=1757667634; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4FRg7joCYkF/X8y74ghdzGdbt4nbhue7w8XGA2c25pI=;
        b=KpVqQCWYFH7zNYD0/QR2oooMBinj4BB8x2ovfgGS1JGQYwl3T6wHg3f7V+2iwJg3Mq
         ULmseW/xOKa13HSOtnvAEG+2YSnvgoZjDzbZnBwzf5xM+5GbEbZvwM2rtze8w9+8ZOSk
         fXIoVYV42Svl4n9WrAI7eugh8cQctCBZjcTJggSoC/wa/Ri8X3ilpUZesKrAEWRzdZvj
         xkjZI1XvcgG+1E0t4nYfB13BqIrQa7PH4JrdwQpyStV0GETE4JT+eouDH49CSF/NphID
         EwUmAdru8ksAND8/MaIIgb5I3rYA5pN8B0nCwm9mRdGEBM1ba1s+a+IQaU9aE+tJBeqV
         Rsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757062834; x=1757667634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FRg7joCYkF/X8y74ghdzGdbt4nbhue7w8XGA2c25pI=;
        b=Zj7uRFrqEG1xtmrcogXRd6lPTIa+YNXotlTxwmp9uEEKoS4uUBQqBUKqTnkvbatFOB
         R9eJOgmpeqGMVtunMcKYXzox2zpAElM6v1a0KqLJWm/fSQPQE8YAJu+rlH7DSB9sj08t
         59j6PZsOmTRqiDh8jitnRtMfSDTK7lODP3c6eBRZGT4m0dmjpjLGxd9h1UdIltTB/Szn
         zKWR0PiK+gyyG9bkbPNbGTLf8emNnjGOqYZtMUhQrx8e9+EXO5LbEkckRBRlDCr/3npt
         S/SX3vFjKb317WSFClDm2eG8sBuCNdB3PGB9jufzj18jVTwVCzr4jbBUlhTB0/o+dogO
         NOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXoZJSm6tH34H/HqguEYOHG4G7Y3DNbg/o/pwco4dFiB5pUgi96QDG60/xt0oFsnwSJ2pmjtisQwUdDlwb@lists.linux.dev
X-Gm-Message-State: AOJu0Yze1ZLPZZqu6chTS+pU99Klk6VpSoRhjUcYs6yRUY3HNe7c+z00
	jdAt00T25CFkbtnG/9SfC1C4upMRWYE50HxMwMDtHR+Xmj0reOQh8Cb1OFxTVRHFDHA=
X-Gm-Gg: ASbGncvT/ZUGj2cSHxrmWvbmrx8apLX9pIldgtoQMJk9Fz0Y+QYaM3Zora/y8qkS8fl
	lh+Iz63v10Thvy1K4n9qRazetRP1+m/MjxOkfoQmk2K8I2vqyjiF/aQTm/ysrRS7M/YfeemOHgJ
	YH2jrUFHlm+czV7YwYNMudEsLpJQznP8G+W50M8g612q/7UQd2kvpIjxDrhSu53ZRX38MG0gftU
	1PHY8z0eeRgdnFnw5Oeu3RCzuVQY/DiW+cuPEIdLLnsS6okRTIO2lho906sM8j58ie9Tbp5jQAV
	ysu6CCE3JCTmDKFG+SvwlwJIpv5/jp6ejU7ZRNYHE1QWu5yxvlI+mub9mWIvGZ8bZB4ldGtxKvu
	KStGZ5s9NOoWEL32uCcrzeswt3PeZ+SUhLdy6
X-Google-Smtp-Source: AGHT+IHUVhAkcDAy7EJgYnS55QC4yl879/t4RSjjun3yuZ1GOCFoX9tdSjD17TfA4gqevjwi0t3hfg==
X-Received: by 2002:a17:906:e285:b0:b04:d8e:3297 with SMTP id a640c23a62f3a-b040d8e3373mr1885893966b.15.1757062833624;
        Fri, 05 Sep 2025 02:00:33 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7dfesm16225764a12.7.2025.09.05.02.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:00:33 -0700 (PDT)
Date: Fri, 5 Sep 2025 11:00:31 +0200
From: Petr Mladek <pmladek@suse.com>
To: kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 6141/6355] kernel/panic.c:70:6: sparse:
 sparse: symbol 'panic_this_cpu_backtrace_printed' was not declared. Should
 it be static?
Message-ID: <aLqmrytz-w3eNSzH@pathway.suse.cz>
References: <202509050048.FMpVvh1u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509050048.FMpVvh1u-lkp@intel.com>

On Fri 2025-09-05 00:50:11, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4ac65880ebca1b68495bd8704263b26c050ac010
> commit: 28ec7e0d834d81ef8abeb6a6c1376f1fb26f1510 [6141/6355] panic: remove redundant panic-cpu backtrace
> config: i386-randconfig-r132-20250904 (https://download.01.org/0day-ci/archive/20250905/202509050048.FMpVvh1u-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050048.FMpVvh1u-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509050048.FMpVvh1u-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> kernel/panic.c:70:6: sparse: sparse: symbol 'panic_this_cpu_backtrace_printed' was not declared. Should it be static?
> 
> vim +/panic_this_cpu_backtrace_printed +70 kernel/panic.c
> 
>     68	
>     69	bool panic_triggering_all_cpu_backtrace;
>   > 70	bool panic_this_cpu_backtrace_printed;
>     71	

I see that Andrew has already fixed this.
Thanks a lot him for doing it.

Best Regards,
Petr
