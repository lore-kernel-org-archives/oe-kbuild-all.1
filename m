Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A894426B76C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 21:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751924012; cv=none; b=fykb/xoqU42zbLS6mPZMPqTC/lTsKIqaSNIDRZ547zaW7IWh4ODxkvOXenUG3mymMN5aoOH4fi7Rp5PTKGQfG+yw1zMPeMCQj1M3x1EYlCUA78GrgvfgivSUYVPP3/COz3V++i+2dkK+UbsXfi/f5FNp+GQ3WdkqP2uiF+lYCfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751924012; c=relaxed/simple;
	bh=IScrXANU3gy8kTdt2EolRmDR+MMV1A8bs6MmHNMAM8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bm3041ti1QV6U4zHP5TQqjR4aRag99GzwwFII47uLf7vopTpBjveRyt2T5VtQazSR+eCmJaOBB8bD4JdqtNwXvlr4qldW5uiaia5yG6B7vrz8lFgzfhruwvm1ZRcbW3cwMU8iaKYi5TzuvjiZuP779fmYSIDcdKLYF2NRsKCiX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENlYQsYu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENlYQsYu"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6095f07cd53so450584a12.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Jul 2025 14:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751924009; x=1752528809; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ltgx0FAElaI2g9x7RDxclBbvIyqiFXdyM4H0mdYW0U=;
        b=ENlYQsYuRD5meASRmei09jjImDdFtwlbV+Nf9dlLmPocs8TOVkqvv0gttItdgaoRN8
         FuZZz/Jw4qKRBK/d0rEEwdAk61HYeJD3xepeRgfZ5scH+Rs+8XqmrX0BSgDRqCB/sjOK
         ZDWWxhhK7sHWr6rhElLuuiVZyCHEUjvl1X96vNUUTZpMbThZVbZQQpPXd9rCKW/t2Z6v
         6PuKbyRd0knNKTYg8iFVqhwh3CuyGzGhXLlO4LcdWOoTHfAeXtrdGtXEmXoMWnVPLndK
         I10AkAgNAcavzUQ9ayaugMM0AkumlbLqII1CdlOXMzGfSk+vvhhawxU0TIldhAHbAuqB
         Q5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751924009; x=1752528809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ltgx0FAElaI2g9x7RDxclBbvIyqiFXdyM4H0mdYW0U=;
        b=Ywpxm6uqRj/6LNm/eaPXaZmMDxIPfc94MBDybixrrdNz88kjLh5AetgWy9gI2ySQKg
         HkeLWSr/jZqiQSsIZ6X9ApUfxo7UoXuE0bEqocWCqMFR7ofZTxLPZcg0D6zI+9ba1Qq8
         qzK2mUdLjTYiiDKtnlg2ZkUMr2tHul7qHo/94rcMTBlLNFjdNkZf4/2/OU95t72bi7GV
         BUl+e+Bzd2UwdF/ZWd2lrjWI8f1mRhBLhaZEX6xsWYyP5c3H/Lyvi/Y23pf/E7YHGRvb
         B+fzt6gdHb1k9C9Qjtx7zRl9QqAtn275UmCrf9oShW11UmHBjVjn1IcXuR0XGskSdLLx
         aG0g==
X-Forwarded-Encrypted: i=1; AJvYcCWvkRCOS2YmUxzB6EEz2xoEAWxk4sB2RMvUWjmhnsgUiPWWZBOOrgsNQgaaX3KyScPXpmIN6BErriaxcC6v@lists.linux.dev
X-Gm-Message-State: AOJu0YwPgWveHN4Tlb53ASuc4twGnp0DHn8mUvnarSGNZ411V35TEUuI
	+FP0aHeU9stcvbkEH1q3yKV+rEKOfnJ+mXq7fqUMAIn/Q77EnIcxRRRs
X-Gm-Gg: ASbGncuI5Oe8Wvr6JcHwIttA6Tut8Mo2NSr3G3/FHvtIHK/Um09rmfNai8AndOZjVie
	BWw5z6bMh0ySWz9e1iqynFZeWR8LonA8bnlpqeThxWKu4raiac0K+KDQWENt3Vmp2jPSSWgyRhp
	cGdR/8toAxlZU240bdA4JME16SKDG3fu+oLKcTNlGTCi7wGBByRw3N6a+VT/eP4R6h77vxDeGlz
	xk/s6RtCzS/JO6wcJ+lhnAfmK60vk8nh/Kvv+YfTMOuWsrzxkmPKbNtfc8T/E6geS7kEP9aO3JJ
	1+lh2ewcomKfDqmH780UdMu2BmpXSX1nM8Y/KQCiGJal/quo/dWaDBs=
X-Google-Smtp-Source: AGHT+IGV0fT6r+q+zuljOpEhYhveEQHE8dmGQnhNroLSXtZqCz9n3C8gmfvavRHcFo6ioSGWCeSroQ==
X-Received: by 2002:a05:6402:524e:b0:606:aea6:15f3 with SMTP id 4fb4d7f45d1cf-60fd6522d37mr3938094a12.1.1751924008734;
        Mon, 07 Jul 2025 14:33:28 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d708:da00:9ed3:c5c0:bd91:c71c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c63f9sm6041670a12.72.2025.07.07.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 14:33:27 -0700 (PDT)
Date: Tue, 8 Jul 2025 00:33:25 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
	Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
Message-ID: <20250707213325.b42szcgiuqurrx3h@skbuf>
References: <20250707003918.21607-2-rosenp@gmail.com>
 <202507080426.3RX5BOHi-lkp@intel.com>
 <CAKxU2N83JjTG19_GD-9LPJfe=aY4tU+7dFjRhFqGeLDn6beGKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKxU2N83JjTG19_GD-9LPJfe=aY4tU+7dFjRhFqGeLDn6beGKQ@mail.gmail.com>

On Mon, Jul 07, 2025 at 01:47:49PM -0700, Rosen Penev wrote:
> so it's probably better to do
> depends on OF && (ARCH_RZN1 || COMPILE_TEST)
> to match the pcs driver.
> 
> not sure it would fix this error though...

Yes, you can't select something which has "depends on", unless you
ensure that all its dependencies are satisfied.

If Kbuild has the same operator precedence as C, then "&&" has higher
precedence than "||", and "OF && ARCH_RZN1 || COMPILE_TEST" actually
evaluates to a different expression than "OF && (ARCH_RZN1 || COMPILE_TEST)".
The former can be true when OF=n, while the latter can't. Thus, OF=n is
an unsatisfied dependency for the PCS driver.
