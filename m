Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDB62FD1B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768412081; cv=none; b=FugvSwShqddNFTKU1mbmJ4BdAwrxDMf2Dq0oFULX80ruc8a3mk9eMJOwVwLJIYjybCSy2J50P3S/iXBoGRDkH+l/gtSX6WS8TpEokhnk8tdQdfrEYz8Pnc7IbdMD6p2GyQSzmomaLcYiW/3M+pRPHlHTfyAeh2tmxXq7+i1pxe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768412081; c=relaxed/simple;
	bh=kObkP2DRo5mXrlxriPjEDWheb0/mwzFmw+8s1z659rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GV/qPRlePD/HWzMyr7sZNoWtxDOD2xZ0EGynL6xhLUoikDYCIQ3Syq3W3QGN7hQ63NEONb6ocbS99KiGMdiXcOSogJfQCiK25pDh5JLy/XvZyaDThHObao6PVdRR56bPy3B5VS3C35AQi9pPYYkwKIoKYpr0XS8rNl8BjrjDMTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzRlkPZP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzRlkPZP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so575445e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768412077; x=1769016877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJ7m2Kae0rt7KDMZbiJnTHcyU/qgip1RiScuagqlCWo=;
        b=QzRlkPZPAiwLTnIrUoHU662q5aCUwB2kz7khaBeXX0amDEGOLAAhb/OaA1QADURmOM
         Fz9NRAwedHq3yJ0+P2T+iGPEjD2XD264HZCfXWpLuzGRAue/EbggoUFY3+0xEF2NGXt/
         dcGPeypa5wrKIbTUIOkcoq0KJvvFXL/ad179r5sFdO2EwvFkwtZW2J/8C6Mo8NlvlLrF
         owJcRgkDCzrV3X0biwChxzzNJRTUz5pMwoqiL2nqf8TrqojUKWBikPbBihi4dAa04QUZ
         5L0APPmVl48S7OgN4vRIH1GpzM6Q4VCiVFCo5M7c0r2jzyxjFyd4jmHGdY+TPizcgRCJ
         /dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768412077; x=1769016877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJ7m2Kae0rt7KDMZbiJnTHcyU/qgip1RiScuagqlCWo=;
        b=RpiiLjeRIKv1x9C6fklKZb02yUYpaRrS2SN8ooelwkFMkCXSto5bAY4y11ezBOvaE1
         8qHcLoTHdjnf1cXyg//BdmwquAfP5ub6KTDNxz9Yx2a38ajkq0T4QMkS8f2KD9K9MeWB
         1/uyRM/3cCB0rSzaMjKC6MMDKXGCTYZ9dce+ONv9kKK3kFgXG+NdCFQaxfS0wD4H9j74
         QgudvJSCicLjCzngnkUcG45y+3u07Ipz2fjj2pUqy5UBUNG82gF7X5HZws8nvhRwY41/
         XHIlsO2xzIf+SgfXMZogiyU5zZdgH3ttkd6L/aGew4oNpse6wq+7AQMstHebSy2GwxY4
         dwyA==
X-Forwarded-Encrypted: i=1; AJvYcCX3dTPdQeXnhda4+2gTbCw5HkYYVaPKclBv6I3ho4BhII9uXHY7jgowSWGeBoZwapMF3CZ0J/1a0oR6CxLx@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+FaEClz4in6XVhwoWOqOWszF8ZnGTE8SBKqTJIeXqXJtG07rl
	3Qqdz3s+CISevVCZ1EirQmtm2YSI152JwZj9iaLI4iqrXB47aAjq7QOg
X-Gm-Gg: AY/fxX7OJOcOZZfJWx1ctFQZ89LxldD1D2X6BUS1XaNYp4rjmoyhs1Bro7YYXvargfY
	+26VpGa+T4qa6BPDVL+vlVJERCvQuq+NZ+JMpMAVGrzPWzKp6FD8whIqFvJSBjskYuWmOeDYgYo
	TprDBmrIB1JbM2QZowX8AXHu5oJQpdB2Ivvdlu1jP8mgxZ7eIlS9CyaJ8A+EfH4eu7f+lEaOmXL
	rGwkwDycsHygZx7Pn38cb6TAdXdKJpTgxMnSFX9gfzIPlyy/JVJnZsgsfxPpIeToNpYTGzLaSfa
	38Igc1Tftj5wwaIRfFJeLKpAbO2k769d+tEMOiCnMy1fcnEZCnzmv7CZg9d43svg/VfHCbnCquf
	K2NS1kvHSb8S8KppCeFejWtriRZtpeNHJZ/9w/eG0x/kixSqZAOJBbrMrrHBipe6pJQuHFOh1DH
	0yD71vPj3fNOj/Dro2qGxk/bDqmLs8dVV4d4UKG5b7X/T3/EVMoUL1
X-Received: by 2002:a05:600c:a46:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-47ee338c00cmr46093135e9.35.1768412076765;
        Wed, 14 Jan 2026 09:34:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee2725b54sm27307345e9.1.2026.01.14.09.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:34:36 -0800 (PST)
Date: Wed, 14 Jan 2026 17:34:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Nicolas Pitre
 <npitre@baylibre.com>, linux-mips@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
Message-ID: <20260114173435.51cf556d@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2601141530510.6421@angie.orcam.me.uk>
References: <202601140146.hMLODc6v-lkp@intel.com>
	<20260113200455.3dffe121@pumpkin>
	<alpine.DEB.2.21.2601140453090.6421@angie.orcam.me.uk>
	<20260114103103.216aa122@pumpkin>
	<alpine.DEB.2.21.2601141530510.6421@angie.orcam.me.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 15:50:09 +0000 (GMT)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> On Wed, 14 Jan 2026, David Laight wrote:
> 
> > > > Looking at the git log for that file there is a comment that includes:
> > > > 	"we wouldn't expect any calls to __multi3 to be generated from
> > > > 	 kernel code".
> > > > Not true....
> > > > Not sure why the link didn't fail before though, something subtle must
> > > > have changed.
> > > > 
> > > > I think the fix is just to remove the gcc version check.    
> > > 
> > >  Or rather fix the version check.  The GCC fix went in with GCC 10:  
> > 
> > Does that mean the GCC 10 generates the multiply instructions and never calls
> > __multi3?
> > (Rather than just not using __multi3() for that specific example.)  
> 
>  Of course it still does call `__multi3' for 128x128bit multiplication.  
> It doesn't for widening 64x64bit one though, which was a missed case for 
> MIPS64r6 only, having been supported by GCC ever since MIPS III ISA.  I 
> think we do want to fail link in the 128x128bit case.

That's fine by me.
I only get blamed for the widening one :-)

...
>  Distinct RTL insns are produced, so all the usual RTL optimisations 
> apply (in addition to any tree optimisations already made):
> 
> mul_u64_u64_add_u64:
> 	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
> 	.mask	0x00000000,0
> 	.fmask	0x00000000,0
> 	.set	noreorder
> 	.set	nomacro
> 	dmul	$2,$5,$6	 # 9	[c=20 l=4]  muldi3_mul3_nohilo
> 	dmuhu	$5,$5,$6	 # 10	[c=44 l=4]  umuldi3_highpart_r6
> 	daddu	$7,$2,$7	 # 14	[c=4 l=4]  *adddi3/1
> 	sltu	$2,$7,$2	 # 16	[c=4 l=4]  *sltu_didi
> 	sd	$7,0($4)	 # 21	[c=4 l=4]  *movdi_64bit/4
> 	jr	$31	 # 44	[c=0 l=4]  *simple_return
> 	daddu	$2,$2,$5	 # 29	[c=4 l=4]  *adddi3/1
> 
> (hmm, I wonder why the cost for the high-part RTX is over twice that for 
> the low-part one; this seems outright wrong, also taking the possibility 
> of fusing into account).

They might be different, if the wide multiply is implemented with multiple
narrow ones then the high result bits don't need to be generated if only
the low result bits are needed.
If the data is clocked through a single multiplier that might be significant,
but probably not double (I think you need 3/4 of the products).
If the results of separate narrow multipliers have to be added together
then the carry-ripple of all the adds might make a small difference, but I'd
only expect 1 (perhaps 2) clocks for that.
If those are gcc's costs I suspect they may not match reality, after all they
usually only have to be 'good enough' or 'reasonable'.

I nearly got the 32x32 multiply to run in a single clock on my Nios-II
re-implementation, but the 64bit ripple carry delayed things too much for
the other logic that needed to happen to feed the product back into the ALU.
The product itself could be latched - so it wasn't far off.
I think I could have fed back the low bits, but that would have been
complicated. Detecting 'short' (18bit by 18bit) unsigned multiplies
would have been more use - they are common for array indexes.
(That was a 'fun' project... Nios-II is, AFICT, basically MIPS 32.)

	David

> 
>   Maciej
> 

