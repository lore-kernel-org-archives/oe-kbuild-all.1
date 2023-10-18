Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC94374F3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 16:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kj9HegR6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40790b0a224so17351445e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697648227; x=1698253027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYmsSISabCHstva6nGawNe+Di4bmrOcot5BGgorDSxY=;
        b=kj9HegR66TMZr3X8EG8QpqlxavfryCvkC/g/JBj9F0isAGQqwHHAkk1vWBjPKJB0FG
         eBvkSeoIZzUbGyIi93n//c/llEYYqpRRuD5lKS755u2B2J1+sBtvX8XfQDDlYXhlOfLD
         AUlPwuAcOHfqsTUgzE5HYhSMacDTDHN1D0/jFezoHybCDe2XjoocUUUW0WRF4R1CoM9y
         nznW29Q21Aw3j9nV4bBowbjJtkBd5+euabf/XHN4e8CdTE/uKgK0w/UMJcd/QzTPDPy2
         S+YajvYUoH5HLD/+LYD1a0sV2e3BkAfxOVjD0pDKlUhoMuG5Ijgo3M2rCtentc5AMsdM
         v83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697648227; x=1698253027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYmsSISabCHstva6nGawNe+Di4bmrOcot5BGgorDSxY=;
        b=mVEwzqjdBdAgcfJZSkUzrwMpF5XPpP6Vjd49rmleID+b3vE32yVM1tFd2DO/BY9oQi
         Akw6+hm7Pi/R0wAIu6Q4vO5qt+ptH4VQJVtt3oL9la4WoA/2Udz/nRygrjCPeEITyYgt
         kzkttevKuXDoC7KLtlj2PTQqCIpzKWBJRmNu3kdZclatL4GObDpWBKs/wPnQD5+N7E9u
         dlNLKltXKqqZbJkWvFcIJT0p12tWKtAOWlEJ8ygmUz10Xu2Z14Rt23Z/cZ1p2GCzFejF
         koRbw6lpQdRl+3ywRhL8/5Z1lR7OUb1iu4EUmANwbxQC1H/L6doWF0VS/NhOlBJf1DUR
         hrCA==
X-Gm-Message-State: AOJu0YzKKY1/xtvNTr/NnFGmwd8qtMnPzmaLGAT78U0i100CbQJMUjKk
	4Ljwh3+tb4KmHkMmzQGz+j5xjQ68Skt40u4Kc5g=
X-Google-Smtp-Source: AGHT+IFZa2wA2CIROTWJeB6fsyTJmkUokbQ7GdV+6ursfwa9CrMwVReyAdVgxJm0LX783pQDf7YK4g==
X-Received: by 2002:a5d:55d1:0:b0:32d:a0ab:9bae with SMTP id i17-20020a5d55d1000000b0032da0ab9baemr4486184wrw.57.1697648226822;
        Wed, 18 Oct 2023 09:57:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l16-20020adfe590000000b0032da46648dasm2521880wrm.8.2023.10.18.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:57:06 -0700 (PDT)
Date: Wed, 18 Oct 2023 19:57:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [char-misc:char-misc-testing 21/23] drivers/parport/share.c:486
 parport_register_port() warn: '&tmp->full_list' not removed from list
Message-ID: <1eb66e9a-8c68-4a56-8239-82c74849cfc7@kadam.mountain>
References: <2171426a-1784-41e9-8614-2d3a7a602831@kadam.mountain>
 <ZS/R/H9JujiaJ0x2@smile.fi.intel.com>
 <ZS/35oVuyZxqueBH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS/35oVuyZxqueBH@smile.fi.intel.com>

On Wed, Oct 18, 2023 at 06:21:10PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 18, 2023 at 03:39:24PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 18, 2023 at 12:57:52PM +0300, Dan Carpenter wrote:
> 
> ...
> 
> > > Old smatch warnings:
> > > drivers/parport/share.c:826 parport_register_dev_model() warn: possible memory leak of 'par_dev'
> > 
> > Means this was already be in the code?
> 
> How is it not a false positive?
> 
> devmodel is false (so kfree _is_ called) until we get device_register() called.
> After that it's done via put_device() in both possible error cases.
> 
> What did I miss?

Oh, yeah.  You're right.  (I hadn't looked at the code before, I only
see what's in the email and hit the forward button).  This check is
normally super reliable but also useless because it missing 95% of
leaks.

I suspect it will be complicated to silence this false positive.

regards,
dan carpenter

