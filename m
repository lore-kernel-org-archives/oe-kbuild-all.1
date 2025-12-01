Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3F733345E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 16:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605554; cv=none; b=LT1z+jgkKMF3ZJPMGjIsp4xYPyREQKUFIxXA6p6BdJgS0UGBg5d2qicx7L9uWr2/LX7T2ulaVg0b9/EKRuxO9hYh95UPmFFbBLpHrLsvXAFhrDXOt1maDYIFFa7ugYtlevId+uJIR5f8jll+DI32mQm6rGyzeyiwh8Frll8hcV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605554; c=relaxed/simple;
	bh=78c/0rE5EWCRhtEeUPXUNH4QZ7U6Ujg8xpVbJH3FCmY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4c1Thd+0LEIkOkHKEsLe34vb/QLtCx6WByd8ACGzkeJE2wIOaHmBMaTHthlpOIeViCSNdUolr4j3z2vXF8eYV4AR94r/TCXlcgPfu96k0wXRyEr19ulHKPhjpS+vhMrOeAPApQNwkBYmEjkRt2QnQPfP+ltFajLB7CHSQPprMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5dwJFFj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5dwJFFj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so26531905e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Dec 2025 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764605550; x=1765210350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTKTe5CNXRYsiyooSYTXj7glljWEJJiq5jLfmo4RYbA=;
        b=S5dwJFFjTflGHZcB/cmz4cq0zBZdaMat2I5nFY+qmqb38e63Plg6JqfolTXWBfR6fz
         HIU4qLiZAEEyYlL1iPDlIX3x+c/6LJVWRYpzP2GRdmUmPii0+JExtV5QV7n3Xox6mz8L
         xCHJ0nG2mnauLmLbgOMZwMY+vGI9kuPJoOOS+uKfWTEQ/lbl3a4h4Ppox8dFXO9zvnHC
         JubLHLybIOMtc/pARrBgQ4iWLY5tbrHUwBbiu7rBMRgMhCGtMOBIY2CiCo4tftd4uZ0A
         hO3zDaE1ezeHPvh3eIsn3/5z9lD+W/nzTiVQrvnA5XG2fz3PVwBRqNYEZ8N1UHH+ki39
         pNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764605550; x=1765210350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oTKTe5CNXRYsiyooSYTXj7glljWEJJiq5jLfmo4RYbA=;
        b=uCfbxgQvB/ELptVbWz55ZHJeMK3+ZahPNh97tc0SGnznYrZvOyF4UR5whdMQsdy/Uy
         WQK62xUdUvg+uTIDB8sZZGyiCjUERrv4YvTFuVm1KU17DyAqQd99uayB9pQZeYNntorO
         ohzO65kcHJFwsm8bdrlWN4K7NV8C3zz5ep6MKT1rv1sGLcP7jwtrZfHwOkFYiEETxcbe
         7kJMuT10tSJ2zdWtnySC8GG5lSN4Twb7eJr6mqeP+tFBwZNiqpNqJFylVDouRXobh0Z6
         Qo7dEDHanGbrS9eJOpS7bfYfzEM/kcYDDvif2Z4cxGaYW7sFmqEBZLZvGGRujxown/Ue
         tQEg==
X-Forwarded-Encrypted: i=1; AJvYcCXojTamW7fjQvmZQmfRVWzkmd2x544XdY2pH3RQt1jpLB22gIKgLtnnzMubIHj7gLmfsMY3m2qVn8rwZG9M@lists.linux.dev
X-Gm-Message-State: AOJu0YwbRVjjS5uGOK+wM8Gf2Ww1OtzbGe7YcElDgdaJJ/vAeSU5m4YX
	VDU38GIv9JqyANwXHIdgX0T8UWFAgb9jRYyNaCPBO1X2zg7TuyKki7gN
X-Gm-Gg: ASbGncvmB+dL3fvbUIM6ieTE1+y+n4QszXszBzYZa+PojcjnPdLP6nqF9WjJN+iBJWe
	GSe1hsccyyYuo87hCXaxPWpERhGn0kQ7Op1fxvlkFvGUiOWPBI5UQzXS+irOQ2KHog2A6Atbtts
	2yqIUPTypIP7B9PMi8/BGlRwG65XN2xvUQg6at1fICfUcR8IHxvxWoDSU5/KCdhSYa7O2YnmKGg
	9V+7ZG/I0nTJf9eff+3uE57rzM3ClgMBd2qLbGGdJfKBG7yRagJ+PoBRp/hKGuCrsrXYZXYteGM
	v8Q3URovCbyQjGXjj0WemqmRnBaMS0wbAGrHS2U8cyb7tLNW7lvaWbNw2BQpVpqXVvgy7HnasaV
	PcarNQXo6jqo0r/hcfOM9pSvQ3Q5XW0lySLFq661C19jt6NQG51Yppfn8dUP8rZ6InLGtn0NZVO
	lqTtRwEdfLypGqb4qEdcoIcYr2Xj6s4IjaPq8xj2upROPlRNtO6SYTkADurkUhjME=
X-Google-Smtp-Source: AGHT+IEcpfkxm5F30+vBZDh6L6clQ1HP9s22shKZIs0ZFx1yh3jR4dB2LAfLDHb8StMNltsc+dCYpg==
X-Received: by 2002:a05:600c:c48e:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-47904ac438bmr250402985e9.4.1764605550109;
        Mon, 01 Dec 2025 08:12:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47903c7360fsm169185205e9.0.2025.12.01.08.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:12:29 -0800 (PST)
Date: Mon, 1 Dec 2025 16:12:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: Re: [linux-next:master 12420/13171]
 include/linux/compiler_types.h:602:45: error: call to
 '__compiletime_assert_293' declared with attribute error: min(burstcnt, len
 - count - 1) signedness error
Message-ID: <20251201161228.3c09d88a@pumpkin>
In-Reply-To: <aS2ljp-MWo_7ZTjJ@kernel.org>
References: <202512012040.BkoYgkkr-lkp@intel.com>
	<20251201124256.328f4f35@pumpkin>
	<aS2ljp-MWo_7ZTjJ@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Dec 2025 16:26:22 +0200
Jarkko Sakkinen <jarkko@kernel.org> wrote:

> On Mon, Dec 01, 2025 at 12:42:56PM +0000, David Laight wrote:
> > On Mon, 1 Dec 2025 20:18:45 +0800
> > kernel test robot <lkp@intel.com> wrote:
> >   
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
> > > commit: 9ce4f8e56bd2ed2bd473572bbd4c1a7f8863487c [12420/13171] drivers/char/tpm: use min() instead of min_t()
> > > config: xtensa-randconfig-r123-20251201 (https://download.01.org/0day-ci/archive/20251201/202512012040.BkoYgkkr-lkp@intel.com/config)
> > > compiler: xtensa-linux-gcc (GCC) 11.5.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012040.BkoYgkkr-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202512012040.BkoYgkkr-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    In file included from <command-line>:
> > >    drivers/char/tpm/tpm_tis_core.c: In function 'tpm_tis_send_data':  
> > > >> include/linux/compiler_types.h:602:45: error: call to '__compiletime_assert_293' declared with attribute error: min(burstcnt, len - count - 1) signedness error    
> > ...  
> > >    drivers/char/tpm/tpm_tis_core.c:456:28: note: in expansion of macro 'min'
> > >      456 |                 burstcnt = min(burstcnt, len - count - 1);  
> > 
> > I hate compiler differences.
> > Usually the:
> > 	if (burstcnt < 0) {
> > 		...
> > 		goto out_err;
> > 	}
> > a few lines higher is enough to make the statically_true(burstcnt >= 0) pass.
> > 
> > I'm not sure why it doesn't here.
> > 
> > 	David  
> 
> It is already part of PR, which I've revised already once in order to
> drop one patch:
> 
> https://lore.kernel.org/linux-integrity/aSnQZ4pRWqJai6FW@kernel.org/T/#u
> 
> Since I don't want to end up into a cycle of iterations with this I can
> at this point drop the patch, unless better suggestions are available.
> 
> I.e., I'll update PR one more time dropping this patch.
> 
> We can revisit this during rc cycles. I'll hold on for a while before
> taking action in order to leave a bit window to respond. Just need to
> address this quickly, that's all.

I need to go through that patch set (it hit 223 patches for allmodconfig)
after the merge window and decide what to do with it.
There are a few real bugs in there where the min_t() cast does discard
significant high bits.

The pattern that failed here works most of the time.

	David

> 
> BR, Jarkko

