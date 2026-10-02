Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ABA1DF98F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934818; cv=none; b=lLG94GoY23eCeLswT/ixz0Pcb7YoEHsiTWDBgIs1FEub1tP8KCveCl01xF/fRXMhw6A577J9NICyT/KIeuX8IceSHQ8euCYMzaQE9JE6TJziUTXHXexGF7T2tORu14J6tR+XTz3dQjQwY2R67tU3qLvZSbx+mTvcOXjHnja/n+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934818; c=relaxed/simple;
	bh=zt3Vto8vq19QPh6KBS6XymZhc2OLvztLzf1Qnpyz4zY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTuTapLPCT6fRRPgkMsGJJj/RJWZeUbLZcQuIHxWyxFhnh/W0Df7Ts6CxFB7DaiF6LJ3LPGV2TYhO40ZYVqUxyQy6eEfkVEHbQ9vpqZgqcxfRgxtaAPfxikdK6H+Bkrb6eBqfszje32fR22irah1wfWFSdlpCAy3lj+tRBHVNmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdDdc94k; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdDdc94k"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a01ff8c098so11359455e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 02 Oct 2026 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790934815; x=1791539615; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uNC9YCP8AT7IxNNn4b5VtrbR3K2PgY3ERGLBHswr9ww=;
        b=WdDdc94kL5LXfIwsltJkR5EBUmhdiCgTgiBpeSJYUDZ3mSpLKzLgBKBA0WYT4hKdDb
         Wwx1cHPpRlWzCeioHmd3rF/pC5Ei+m7UPHuiigwKCBaiTgQJsj9J7a4oI+GsLCKXb1ji
         xXR8mlV9ruM7AKHpAw/3rPxQEp8pCv2b0mSjARqY6aLdEdVTpsl6xJ91yKQdjQOO7BNh
         l4XYX4CkZE3og1elDQ4kXyiC5bpKYLA0KVScCGY5tOw4G+VgIm853RddpqYmSyl9KX7V
         WfQwQUVJmPzn+1QPSu1hKWywPlDJI4aYTtT+MePn2hqa32YthOE+MHSlmc9Umf8f9O4N
         AUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934815; x=1791539615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNC9YCP8AT7IxNNn4b5VtrbR3K2PgY3ERGLBHswr9ww=;
        b=AiBl547DdDAtBPI0X8vNh1Iu+WeL7gbLgoViIHI0b9LCfgRBvs9AxK/edrZR75yHXh
         p8VkDMK4bZM6d1izOIO481knLa3DZeatAi2GylmEyvMZ39uI21znKYrvmsv7JyUt1Vz+
         edMguaOlsPCLofa4FTxUYOZltTFD7LVl95Ov5MWCDFTJOFLdscLq1x69PO9xUj5sRaQi
         cvHsU0jfY1ccIoci0CSEAJE+qgyNNPCgVQq+gt2lCZDBazh70FiRPQpBeL15DRQCt61U
         ufczACv7w5oj6bm8NDBPqkGjQsMjp4ezYmoLsNh8dwVOsF0SfqyO42dv5aei0zGbvMFW
         9rUw==
X-Forwarded-Encrypted: i=1; AKwUvBz6ryiUFxLP4zyr1JaR2TjZxriBBfVEUhMToMRXRIsqXTVrZL5wU6Pj2xKkMgzHEVxgtRkOJMlDm1rH+j2b@lists.linux.dev
X-Gm-Message-State: AFuF++mO7yH2hR61niBdeWLdH1CZ9D8oBfsIb+FpPdyxDiBcGHk8hw2q
	KEnZ0L9zsfUFTH29bcUNdc09btiitAN3lkJu4ZEN+l1rEI0lWyaLf9k8
X-Gm-Gg: AYBFou2PVNOcF8MP756UPdIoHzZqmFg/eq9dSYJrsVMkqdp11Z+Z3S3IcvM/bPvrvuU
	qXh2hzTR5LKC6omJQcMbWPFIjMwYU/bzS5NnQ1tV+mKttkALmU3hsNQVf24Ga7CNS6ZxOr6tYrD
	3cfk6dm6i4797lxoX00J1X8kuXEnyuSqbqJ0qJue3t+ZwEjJL2ed7oH3skNt2aVnSsOWS2M0Vgs
	vVUuA8KzAIg0+Pvo1AZrd5aQPBQdAZ97rzy/aSf8S4I3mRwV+D+M593chx9DRdn+Tu91zzyIq2z
	S2kX9UHw321ef7HR/8XS5MBsSls4ptWKQeb5W++D2SUbBjC44UpIVmWCEeRWxVbqL4IRi4bbqxt
	RoPVCZo2UJzHXIjmrmn6/XwsDHEY9Gz/0RF+T+Z90z1TyQseeZO7Dl+LvL6vCskgkXx5HDzsG2C
	BgyMu5+ySyfdPCUGX/V/PaRV09+i4AMpKxGatwh3SX0maAJrtLwr+Kv2CiFY8BI1x9w80OLfw66
	qlYbZopC29z2CYH8R+4gnu4K+rgk/1NILgQ9RDtVpJrRQ==
X-Received: by 2002:a05:600c:1f87:b0:4a0:1efa:c74c with SMTP id 5b1f17b1804b1-4a0275a1d54mr38515505e9.20.1790934814461;
        Fri, 02 Oct 2026 02:53:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm58305185e9.3.2026.10.02.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:53:34 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:53:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot
 <lkp@intel.com>, Josh Law <objecting@objecting.org>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Memory
 Management List <linux-mm@kvack.org>, linux-mips@vger.kernel.org, Bradley
 Morgan <brads@mainlining.org>
Subject: Re: arch/mips/boot/compressed/decompress.c:undefined reference to
 `__ashldi3'
Message-ID: <20261002105333.6f77abd0@pumpkin>
In-Reply-To: <ar4050mdKL_W8yI9@pedro-suse.tail5790ac.ts.net>
References: <202609301826.MFaFMsmd-lkp@intel.com>
	<20260930120159.7e4f29a82d461bd8b040454e@linux-foundation.org>
	<ar4050mdKL_W8yI9@pedro-suse.tail5790ac.ts.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Oct 2026 11:30:09 +0100
Pedro Falcato <pfalcato@suse.de> wrote:

> On Wed, Sep 30, 2026 at 12:01:59PM -0700, Andrew Morton wrote:
> > On Wed, 30 Sep 2026 18:36:50 +0200 kernel test robot <lkp@intel.com> wrote:
> >   
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   551c722f40809618230001baccf219193e22fc5a
> > > commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib: decompress_bunzip2: fix 32-bit shift undefined behavior
> > > date:   6 months ago
> > > config: mips-randconfig-r2300-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/config)
> > > compiler: mips-linux-gcc (GCC) 15.2.0
> > > sparse: v0.6.5-rc1
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift undefined behavior")
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202609301826.MFaFMsmd-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `get_bits':  
> > > >> arch/mips/boot/compressed/decompress.c:(.text+0xf4): undefined reference to `__ashldi3'
> > > >> mips-linux-ld: arch/mips/boot/compressed/decompress.c:(.text+0x168): undefined reference to `__ashldi3'  
> > 
> > I dunno, I'd be suspecting a toolchain issue here?
> > 
> > --- a/lib/decompress_bunzip2.c
> > +++ b/lib/decompress_bunzip2.c
> > @@ -135,7 +135,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
> >  		}
> >  		/* Avoid 32-bit overflow (dump bit buffer to top of output) */
> >  		if (bd->inbufBitCount >= 24) {
> > -			bits = bd->inbufBits&((1 << bd->inbufBitCount)-1);
> > +			bits = bd->inbufBits & ((1ULL << bd->inbufBitCount) - 1);
> >  			bits_wanted -= bd->inbufBitCount;
> >  			bits <<= bits_wanted;
> >  			bd->inbufBitCount = 0;
> > @@ -146,7 +146,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
> >  	}
> >  	/* Calculate result */
> >  	bd->inbufBitCount -= bits_wanted;
> > -	bits |= (bd->inbufBits >> bd->inbufBitCount)&((1 << bits_wanted)-1);
> > +	bits |= (bd->inbufBits >> bd->inbufBitCount) & ((1ULL << bits_wanted) - 1);
> >  
> >  	return bits;
> >  }
> > 
> > 32-bit MIPS should be able to do this?  
> 
> FWIW the patch seems entirely bogus. I don't think you can have inbufBitCount >=
> 32. If you could, then the patch would still not fix anything, because
> bd->inbufBits is an (32-bit) unsigned int.

The 1 should probably be 1U (or possibly 1UL is 64bit values can happen on
64bit) rather than 1ULL.

Wasn't the problem being solved '1 << 31' being undefined (or UB) and one of
the static checkers deciding that should never shift a signed value left?
That is entirely bogus anyway.
It is only non-portable because C allows 1's compliment and sign overpunch
for negative integers, gcc supports neither (and I think the next C standard
mandates 2's compliment).

That is separate from shift right of negative values being UB to allow for
cpu that don't have a sign replicating shift (all modern ones do).
Think about it, for a shift/rotate left you need one of 0/carry/high-bit and
for shift right 0/carry/low-bit so two instruction bits can select one of
0/carry/low-bit/high-bit (giving the often implemented but undocumented shift
left that replicates the low bit).

David

> 
> As per MIPS itself, MIPS does not link ashldi3.o into the decompressor for BZ2.
> It only does so for XZ and ZSTD.
> 
> Changing arch/mips/boot/compressed/Makefile would work, but since the change is
> entirely wrong I would suggest perhaps reverting?
> 
> 

