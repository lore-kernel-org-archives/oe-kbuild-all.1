Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C536614884C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135734; cv=none; b=qj5XLh3t2VpAXcTmUC3+fqOGSePXyzwCyvjZidmA+UGVmVsX71MzDhv84aprCvS7DG9fwdK3XBh148WPl5lI/4MW8Xmr4+cL3lFcsonbiTkjTJez700bbad+BOa8vQHam6/bzcis5WXlQqsO2GQSR/y2UIQlbXTzjktKhBAtYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135734; c=relaxed/simple;
	bh=g1mm24DACTecjNAJvzrdNdg9fsLkeeEtFb5wtV+hB2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+07cWkqGPehuFZfXSIUhpJY4KQlWoPiRsFnNKTIF/G1338v7DY9kmTw3ThTBSqBrvA6IB6WhDaw/ILo9Ha9asW8iKH8u3kuLfwGUQP2CZAfosWXeY3HCCjQe+nsFuuNDn8XDwXWA+QrJ6QzIs+7FUNQB4UI00eIZ591vYOZUi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O94xhXZQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O94xhXZQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so3836447f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759135730; x=1759740530; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vltcl8v69f7bQvSIghkVp5oW+UsVhLKoUiMkT13h1P8=;
        b=O94xhXZQolVh59SaiDe+DP1ncS4eOTfdauPecnevzQPyS0XtVhT5EaV9igNbzzBlD8
         CMFVeLQGdTbW1AsV0yCuOYQ6voGVHgH1bttnwFS/EF5zEn3LvbDBtl1XRfiEkZZwxck7
         mepvAvux8wL4Y8hgAN6fcEgHMGZIOuUa+sICut9l+ENCeocIKa+qICFeQ1JfQKIo/8Ig
         E/xpVUClNZGbAUw2LZMfDQMo0qIsHaybXPdmgWBzZeAVYo6RA4J0xpKCXEFSVp5C1QkZ
         JZeLNW6l7fTqdWdPN+CyJ0AA1aFeFwZF5tMHKSwvOb0QgyegStky+q+8AHjibJuHQJ/d
         l30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135730; x=1759740530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vltcl8v69f7bQvSIghkVp5oW+UsVhLKoUiMkT13h1P8=;
        b=s+T4lvMWfqdYiPMmGa07DqqRzlNB4Tf1Rbn86J/Z93Dtba7MuIduKiYtl3C3MOsw6H
         hXu7mRM+LZ3DoO8/0mo8OQl1QJSTNiu+Byqd4gc3+cmoQhPxtt35iWfuC1UHErTOeJWd
         u03aNOqlA/1xuomT2CzZ3AhumbhQ3e5EcSlpYD/EAEA+UneYqykrjhCgvIGLk7Y2qrwo
         MW3wXujfp7eKkK8sqbXok2Lcd+2yiSMB0XTaSjkZD/Qwm00Awve5k6CE2NaWy1VtLYNN
         X/RY+IKIHccXNieUOpGDcYAUPKVW0aFV+eAHEgMRYfoX1CiNSIji2fm7gDCI9R+u1hvH
         LHAA==
X-Forwarded-Encrypted: i=1; AJvYcCWottTRe/ShiNDbEytxc2HkdYpB4xenwmEdAcimbbDNk6KkU8ylZEaEw1qwf/YQrtFOQUw0wer0/KQy2lDg@lists.linux.dev
X-Gm-Message-State: AOJu0YzfSFHU3Nit/m6vmFrgRJT3iCWN9F87EJAJcCpn4BFscPKqs8ff
	HoJaNgCBbae7UysUP0xo2OUyoB/1ACsjmgy5Thu8DtJfYz6E06t4BJkKZ3+zqnfMPQc=
X-Gm-Gg: ASbGncuJIBLi187yTH9dNKobbXLLmgDPSaj2iLUXkKsWwTCSBeI+PSOKxsFhHOGNaF/
	ccNYCx1t0q8ewDghNw7BS1Kw0CfsOT5iHxtLhOqNc7aUqngOke40/8+V/AHNDswyZvVhaS2hcoD
	4pxEq8WXJG/OqXvIpkXMxWjleHrJ7NKwKs19h6ufDFGtP/hLc+whnSqoZksqizdho8XYEE28G8J
	XGNFJnOYzNJ36NO3or5BpJ0Psr2ksAJhF80CzYDAtIXiOt2kTXgp3sjhx95+D9oHhxU1WQDJRsp
	v9lWPNjYppSlwY3ULcHF+4Z/arqYf6EHI1rx+SjyqLBTPWOwOK/3zjiP7buk7RBLxRNvFDbM873
	NSxAPVB2AHBEn7IwiDa+9fBSjkBnxvaZjRfdwLS8CEygxW0oBPw==
X-Google-Smtp-Source: AGHT+IHq24YEQ+NGSgOKpmgkwFuU/SY2eluplaIZkQeebKuol6LbVx5PSlBlDAWVI5mgbmhWjPxYOw==
X-Received: by 2002:a5d:5f45:0:b0:3ea:a496:9ba8 with SMTP id ffacd0b85a97d-40e480ca410mr14224093f8f.29.1759135730161;
        Mon, 29 Sep 2025 01:48:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fc5602efdsm17883106f8f.34.2025.09.29.01.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:48:49 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:48:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mary Strodl <mstrodl@csh.rit.edu>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <aNpH7gfhJXIBbCQZ@stanley.mountain>
References: <20250923133304.273529-2-mstrodl@csh.rit.edu>
 <202509290823.hreUi6Tp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509290823.hreUi6Tp-lkp@intel.com>

On Mon, Sep 29, 2025 at 11:46:24AM +0300, Dan Carpenter wrote:
> a14b0c5e3b0741 Mary Strodl 2025-09-23  339  		/* Make sure list consumers are finished before we tear down */
> a14b0c5e3b0741 Mary Strodl 2025-09-23  340  		synchronize_rcu();
> a14b0c5e3b0741 Mary Strodl 2025-09-23 @341  		list_for_each_entry(worker, &destructors, destroy)
> a14b0c5e3b0741 Mary Strodl 2025-09-23 @342  			gpio_mpsse_stop(worker);
> 
> This needs to be list_for_each_entry_save() because gpio_mpsse_stop()

s/save/safe/.  #CantType

regards,
dan carpenter

> frees the worker.  Or kfree_rcu() inside an rcu lock or something.
> 
> a14b0c5e3b0741 Mary Strodl 2025-09-23  343  	}
> a14b0c5e3b0741 Mary Strodl 2025-09-23  344  
> a14b0c5e3b0741 Mary Strodl 2025-09-23  345  	while ((irq_enabled = atomic_read(&priv->irq_enabled)) &&
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
