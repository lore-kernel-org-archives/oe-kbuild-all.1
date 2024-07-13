Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A505E125B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 03:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720841913; cv=none; b=dL54Bcwq2WRJNFh69rgJ21XfYhc6Xu2QLpX7/TVIA/541qiDLiMIVoxraSlFGzL33DlSZ6UdeaPmLDzaEUkkukWWkXuwFtjM0yXQWW+/kLye2KqbQUpmYa0hdBed3ED4xbqVtTcy7u3J6cKbxiTfuWmc7MTlK4lEw3w/EZGFJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720841913; c=relaxed/simple;
	bh=X6Qp96o9O2h23wGl7RqUxUBSDdHabvChWZnIw3q/YE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vz65u2bVgWbmzxIQBT2pHGXf3mkf8Zg4Tprqp9ag3gRPWmDYZmq1qV7MKUUBEmKwDvF+OTYXUebE53/xwP2RSrc/RyMn3zQ4ZzYFoFtFF7kwOKPu23xP/uAUZ+4Rs8oysB9DQlh8aINZAi/bwzWXDJFVIM8dq5AePibeghLmIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDCsQOhe; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDCsQOhe"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3cabac56b38so1677056b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 20:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720841910; x=1721446710; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FiBsGcQmLRaVsI2yv7YiaCnQue9naqNPK/YXyR7mxPE=;
        b=aDCsQOheUAFFAJEDi1dKZ6XMxsSMGpJ4HxdApwUVIHKBQ80wbw3EQf+qFG1CBFy27J
         fs7u/cTO3GPJ86mbDkbYcRFs6uRzqttXL+2LEv25l7ZUoBIjzF0SwahbOshVDdFK4pKC
         f2oY1IyvD1xdS7v80ctLTxhjFhJuKTnuDNwTXCk2ZPJ1YVuD2PZPvzdS+t3hZTiixBxS
         0/7xssws4R4i7xhSjp6LjnEvI68wkFUtqBloqk+bmZi3OiBRVSQAAdA+nLjPp1muvBUG
         m8pMh3l5LjR5RfvZWx1E5ysmCEXgoAJC81KlGHCKI1neYO7h+d+GrsYZd+FT1nexT0cL
         /F2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720841910; x=1721446710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiBsGcQmLRaVsI2yv7YiaCnQue9naqNPK/YXyR7mxPE=;
        b=poe+ZmCYR3s8vyEIUHh1b/H0ERfJK0isi7UQWMWKqOuqFRWlPL7/k/usI9mM1uIAJA
         m461bAg5pFbib+nEbY08hk+d8WtYhfYdU71aEtpJ6bjDIuOBmy187vTaoK6jbT1Zp2If
         W4vldYq1vLEfWqAhbfMLbINMEH+QZu6+p0YzhXLqA+1r5Vw8tKi2zFojhexus7hOqwnt
         WW8fSLmJOIzt/g4/HG2poZcK0lCFr9b0F6/cpUopvmZSbsj7m80Cm/VKMLU60ETv9OBy
         VeoQhgkbqXcU29BoZC3aZcJl0ZPC8e+DT0H2BeVvGi+og/8Oq+ziB8aK8eS7fYPOpOR0
         Hilw==
X-Gm-Message-State: AOJu0Yzgo2cVrX/PUrMtG/zZTNe/YZMSvEG7NN+QU4aiIw/NP10rlD7T
	cF0cXr9U2zD6zUiCRRQe+gSAp+kSV5R5pu9+fva1ds44myApzKUp
X-Google-Smtp-Source: AGHT+IHKSLleoWrUikSg/5b6R7jJq5HF+hMXp3QQpWu+LHrOABQrh/dctWcAIiwSM7ohEgQG7zCHKQ==
X-Received: by 2002:a05:6808:2384:b0:3da:a5fa:9905 with SMTP id 5614622812f47-3daa5faa07fmr6916088b6e.41.1720841910261;
        Fri, 12 Jul 2024 20:38:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:669e:eb9d:e30c:18b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ebc4637sm301622b3a.88.2024.07.12.20.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 20:38:29 -0700 (PDT)
Date: Fri, 12 Jul 2024 20:38:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 11606/12643] arm-linux-gnueabi-ld:
 arch/arm/mach-pxa/devices.o:undefined reference to `gpio_set_wake'
Message-ID: <ZpH2s4byt7aby7_p@google.com>
References: <202407112039.cyyIQ3Js-lkp@intel.com>
 <ZpC_xsx0t9KFgCCh@google.com>
 <0de0aeba-da02-4fa6-a1f8-a468dcbfac58@app.fastmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0de0aeba-da02-4fa6-a1f8-a468dcbfac58@app.fastmail.com>

On Fri, Jul 12, 2024 at 08:41:58AM +0200, Arnd Bergmann wrote:
> On Fri, Jul 12, 2024, at 07:31, Dmitry Torokhov wrote:
> > @@ -684,6 +685,7 @@ struct platform_device pxa27x_device_gpio = {
> >  		.platform_data	= &pxa2xx_gpio_info,
> >  	},
> >  };
> > +#endif /* CONFIG_PXA25x || CONFIG_PXA27x */
> > 
> >  static struct resource pxa_dma_resource[] = {
> >  	[0] = {
> >
> > If you are OK with this I'll submit proper patch.
> 
> Right, that's probably the easiest way. I was trying a more
> elaborate change (see below), but there is a good chance I
> introduce another regression in that, so let's go with
> your patch. Please send it directly to soc@kernel.org
> Cc:linux-arm-kernel and I'll pick it up.

Done.

> 
> One more thing I noticed: if you are doing more patches
> to convert devices in board files to use software nodes,
> we should probably try to move them away from static
> platform_device definitions towards a dynamic
> platform_device_register_simple() or similar interface
> at the same time.

Sometimes platform_device_register_full() which operates on
platform_device_info structure is very handy, but in general
what is the issue with statically defined devices (when they
are never unregistered)?

Thanks.

-- 
Dmitry
