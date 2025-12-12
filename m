Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422FA2D7393
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 19:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765567781; cv=none; b=rEtjt+J+qnpQ6YMydhB0sRaTYHqP56WoVRS80n8BK+/C48zCSFh3B+plKmYSwib7SwUz/6oVGO+PaYlDqUKTmgO/gq2vU5TjIiRloXMFiBOCtn//sMgYEkSKegWpQKM5dtGA8J0NSqxyGFAFl7CfR10lsrGcIcjP7zImbTveOKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765567781; c=relaxed/simple;
	bh=kAJEIijw1h39dwP0oiHddBkEtMnWkioxlFQC1ujPckI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kg3i0w9HVbR9snYZKaUzK4LQBiR/f1bw6BaYQQ6Z5hLRM66nt1XqIwq2JNJieY/fZcVTa7VRBFk+xdf3buIWkEBlF47Zjvyi0os7db+x7OQ8+8e/OobpsQNkQBlog2UFPGjXNgFEiVfnyVdA3i4I2M3DrHr0j6XHwzlAF2Pd60o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVN/5oZp; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVN/5oZp"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37d13ddaa6aso10815811fa.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 11:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765567777; x=1766172577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iAGiWGntUzRzKLCpTz264YmDdwQESuNb3m83qNK0Aw=;
        b=FVN/5oZpaH/MTwYe/W8GDaajKA5ZCdzlxqaDbECDvRSkgyy4dVfRtbUqBLPQqCxk9D
         mozg23POkJh1A1c6frmMDEpeFlCihu8L4LygEghNw2xSD8thqmqn8D6s+2x8u9WuT7dp
         H64oEnWysv2oOCtiyfp3cSpm33yI7wzXlxolq7J9My8gJdStaX0G1/eSgmSdFugA4fml
         x5QvrGeBl7IDrqJhp87CQzTSPjjYCbasSHSTrafbMUihfIohfNjXmSWhlrU1JAsKGNaw
         mX4OzoQIL9AZ/Sb+znm2Kl6s1zCYqPswLSv/Xu5+K0IIqeWISvmkXpyoWJGOzycKMRLc
         KnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765567777; x=1766172577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+iAGiWGntUzRzKLCpTz264YmDdwQESuNb3m83qNK0Aw=;
        b=gL8KTxR8JHsxV8jiKQDqTo2s3PvkHJEXvdoS7zU3Jc7ivmmST7RO3ksMRQVfUlsJTH
         IPn8K6utI5MIzxphtHQGvKXyl+1/YaH4QJ2r2W6OKZ3GDmLdrY7OPVLD2GdpCiHQ0SZ9
         NOGYDEkGPa9Dsj5U9UOWfVFYj8S3JusUEHpB3cTSzFNpofLpvksqwyRfNR7JdtHboGq3
         5HP23Czqd9PxJR532BmWgbaP2qA/lR8OuHBFior2IIHHH4cZFiMZ5mj3vHo4YY1f4Hkh
         XrVFxJz0tQiaQHVG3AFjXXZcGgQmLkT2CGFW7fJIXeWihpoUgllEfAr0pGpvp6j4fUl9
         yrpA==
X-Forwarded-Encrypted: i=1; AJvYcCWlnj2vzX1tkcpqLbwBYZpEgg33wZn4dgCmS4S1QNiRcd5vVDIUi7YbO4wuEntEfZtG143lEEB3BHyimJma@lists.linux.dev
X-Gm-Message-State: AOJu0YxD//xRl1uUDTvvE6IrWSZbyG7GHboM+k1daodf2wGT+Dr0fLOV
	cZoRhMLUo2EAz8ZbLIdHUltS6mYL6+JpmpqPISL2Q2cYifeHuZibDjfG2dGxMw==
X-Gm-Gg: AY/fxX6d9v/2t21jqPDpKzFleafDk5EwSm9w34d7DFdmBjrgg3b6aJp9oMvFLMA3JkN
	ldXiX8j89igQc36fQTkJ7YvN46jyxrdIvWiSSrNurvXzXf+PLZwVxDnnD1lJSjkVBZxwngqtfA2
	VoIpSexLMcGUO+7zhUkTTJDH+vp/7W0Kwk6nzpqO73csvQeACDiUokAD7PQcLh80Y1ilHxDpRaC
	PaMKtKfyzS88cLPxTJa7TEzX4orkjJVE8ye4zDCrHIcPbPi4CO6ilbKh+ydAdOoUV/Bl9qeAEwD
	PHCvV9eDaxO/ZKRLcavFIiwMm1/ifXrjOPsQSCf1FNBAm40/9Gb1s2AqZRIyviM8eRZPMeOb93I
	LKjwAq25BYmdXq+4jz9YaeP35uisK1culOHY/bpqCtyAFadJMwF4/BHv1r/eolbpMITRrA8ABzS
	yNdXt8vxX2ZNs2kwPzBgbcfcfV9XA6lzWoPrgt/c7a8wPPgdOiaaeL
X-Google-Smtp-Source: AGHT+IE4SzG9SEUo36H+/RajRuGXQKEqi8PEHCvRAZiuCC+tFu11I+7qLmwsFCnbEjl5dXnaqDhnFA==
X-Received: by 2002:a05:600c:4451:b0:477:9fcf:3ff9 with SMTP id 5b1f17b1804b1-47a8f90f54bmr26022385e9.27.1765560968089;
        Fri, 12 Dec 2025 09:36:08 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f7676ffsm43676465e9.4.2025.12.12.09.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 09:36:07 -0800 (PST)
Date: Fri, 12 Dec 2025 17:36:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Ilya Krutskih <devsec@tpz.ru>, Andrew
 Lunn <andrew+netdev@lunn.ch>, oe-kbuild-all@lists.linux.dev, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] net: fealnx: fix possible 'card_idx' integer
 overflow in
Message-ID: <20251212173603.46f27e9b@pumpkin>
In-Reply-To: <aTwqqxPgMWG9CqJL@horms.kernel.org>
References: <20251211173035.852756-1-devsec@tpz.ru>
	<202512121907.n3Bzh2zF-lkp@intel.com>
	<aTwqqxPgMWG9CqJL@horms.kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Dec 2025 14:46:03 +0000
Simon Horman <horms@kernel.org> wrote:

> On Fri, Dec 12, 2025 at 07:30:04PM +0800, kernel test robot wrote:
> > Hi Ilya,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on net-next/main]
> > [also build test WARNING on net/main linus/master v6.18 next-20251212]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ilya-Krutskih/net-fealnx-fix-possible-card_idx-integer-overflow-in/20251212-013335
> > base:   net-next/main
> > patch link:    https://lore.kernel.org/r/20251211173035.852756-1-devsec%40tpz.ru
> > patch subject: [PATCH v2] net: fealnx: fix possible 'card_idx' integer overflow in
> > config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512121907.n3Bzh2zF-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 15.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121907.n3Bzh2zF-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512121907.n3Bzh2zF-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    drivers/net/ethernet/fealnx.c: In function 'fealnx_init_one':  
> > >> drivers/net/ethernet/fealnx.c:496:35: warning: '%d' directive writing between 1 and 11 bytes into a region of size 6 [-Wformat-overflow=]  
> >      496 |         sprintf(boardname, "fealnx%d", card_idx);
> >          |                                   ^~
> >    drivers/net/ethernet/fealnx.c:496:28: note: directive argument in the range [-2147483647, 2147483647]
> >      496 |         sprintf(boardname, "fealnx%d", card_idx);
> >          |                            ^~~~~~~~~~
> >    drivers/net/ethernet/fealnx.c:496:9: note: 'sprintf' output between 8 and 18 bytes into a destination of size 12
> >      496 |         sprintf(boardname, "fealnx%d", card_idx);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
> 
> Although I think these new warnings are not strictly for problems
> introduced by this patch. They do make me wonder
> if it would be best to cap card_index MAX_UNITS and
> return an error if that limit is exceeded.

The code seems to be written allowing for more than MAX_UNITS 'units'.

Actually it all looks pretty broken to me...
'card_idx' is incremented by every call to fealnx_init_one().
That is the pci_driver.probe() function.
So every card remove and rescan will increment it.
(Is the .probe() even serialised? I can't remember...)

Then there is the MODULE_PARAM_DESC() that states that bit 17 of 'options'
is the 'full duplex' flag, but the code checks 'options & 0x200'.

And I just don't understand the assignment: option = dev->mem_start;

The code was like this when Linux created git.

	David
