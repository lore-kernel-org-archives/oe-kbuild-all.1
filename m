Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E07252902
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197259; cv=none; b=lujmSPSfJtzPVeoZ/Ift/DPxhdfd7dG+tNbWy2f2qbq7FO9iW0jusdUhpoyPkHqsX0+8ZifwG6qoLrdaTgbZzpXyEmAbZusIc7MXAD9SsZI2Ol1MM631GP/fYXTjYd+qr4g8AV0bQrNXLyZXwGLMhkpsW7opkHKCTBKVJJx5hIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197259; c=relaxed/simple;
	bh=BZQ2UfCw3l9fNDxVIzxAMbZ0wdKtfAIgPDsOoGvr6ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meoRMqI032B1Wl/VNWXwJ4LePvJmuJuoO7GRLx/EjIZK4nPmY5qubIljTW+2gzcbkCNwAEwMASsbx9BYx+9ninHu0FObxAfzkbkUuxi1D9LP7IXiTAkWyWx//D1Ab3VdqMIjce+COELRd0AYFLfq+SULPqxsfAfzExmtlzuq04U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oos3+iKt; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oos3+iKt"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47191bcb2afso8001501cf.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 06:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739197256; x=1739802056; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nd1ObVE5Z00Ryg9gpKxx1Rw+GEaVsA6tcK1PYNFiI18=;
        b=Oos3+iKt1hoeDEu3PiLZCZOPY0+Z5X6g/YQUSReYl5BlTw0pr4pqDgk3OqahyJ07zs
         Vb/0cQtlDacHZNY7bbgPymxV+E1U+DX0blsNW4xEJJ3JnSNT5bp6YvFdXfu6Mu8lHHUY
         k55xA2B2zBwC7kh95zIQtSvOPq5iHXt637TupCQevY0Xg/N8l4U9wlql08WJAXHLLKEr
         m3xzTgz+anVj4oZx6HHb/O3eFRnEzVJM+bh2IgRf5vfPTNfCN/154jjwzYFvBTAdYyIc
         16/lKBFvX3zIhz8fSBl8WCTprXZpSEATJvZTVp3C8nPGymwIuMN3yA9gRobGxMSSzER0
         jItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197256; x=1739802056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nd1ObVE5Z00Ryg9gpKxx1Rw+GEaVsA6tcK1PYNFiI18=;
        b=RJF7jmXSE7WG2zxnvkXxUddob/czrOOqAL0D81Rbk1qzqzwF+vnBUUH21aEZx4ZuFE
         UWXDdp+aFKPC6x2ChwC6JB6IDlPYvx1t5OV8daAQVEI0PsbbdQLkIAH6VwV7EdjNlNOW
         59QodPrSJ7jLYoJyPIPMq5b4CbGWbCr7Cw8lU59Q8Zurv8T4da2fx3Yb4S2KjRP9Mpkl
         i/Jzncr4rV95jUAIapKVqxxpuJWfwOnOUkwRktaLb9ZlG2YIiBTW1Pyy31NDdgB8HOP8
         Z3jBcKkUexZQMyiSMN29R8ZGfAq6WE+iEljTA6QjdtGzfYqSgwoFV9JrJtxaApDoK1RI
         uaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0h0qJNzUBs+7dwlbhr59UKMR8KdBBLWd1XaQcf6IaLvGh/D4LLkQP4IEQZcylVBIa1OFwAdsEmMrtCT7u@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/xkQFdr47Q3o6pY3335mf0VMKqsCnezYfhfYQkvhqZhTJByJr
	q4N/3Fc7F/hllwWE0T+3UmQDdqFyIh5hz7KWKmYvExsGfNS6YIbz
X-Gm-Gg: ASbGncvKtXOvMLBYARs+R0ot8GhvuIri2dJKoMlG7vU+FdHNGmQ5gbZA/ClarAskDkA
	620fvz6SF+ELrRvlfB9znpIUoOu285XxTLk4qv7sqeMagExQNLuLbdwpMPotGp3xh31PhJox9pk
	vZuav5N9LkpYUkR/+e+0QfMqmL0KHGIaObKvI2tlC3LlCvBS88vfd7kP+zkJd0QTd4Pvwh1sNPh
	zzLLpcnrD5ZpXyJdbOKr5IO80lOg9dls/le1z3Nl7L9wRqkflPV60Oy1NE+YQLZ9rhPdGJesR6o
	5xmTkGXBaawt8jbcggIn41LPc4G3nEtX1UaEW1MGxPeljCFvKg==
X-Google-Smtp-Source: AGHT+IG+/WMO4rGl/AY+NFFLsBCfJq8xmKImxkzLt4XM6DMiRMlFf/x9i3f5BY8wuOQGIZKxxlL1uA==
X-Received: by 2002:ad4:5caf:0:b0:6da:dc79:a3cd with SMTP id 6a1803df08f44-6e4453fdde1mr215486246d6.0.1739197254843;
        Mon, 10 Feb 2025 06:20:54 -0800 (PST)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device.nat.cmu.net. [128.2.149.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44c1aba8asm33384446d6.42.2025.02.10.06.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:20:54 -0800 (PST)
Date: Mon, 10 Feb 2025 09:20:52 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>,
	Robert Winkler <rwinkler@antmicro.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [litex-hub:litex-rebase 11/15] drivers/fpga/litex-fpga.c:114:17:
 sparse: sparse: cast to restricted __be32
Message-ID: <Z6oLRFM1PuHz9zwv@glsmbp.wifi.local.cmu.edu>
References: <202502051703.2QcrfJ0B-lkp@intel.com>
 <Z6N76QX8uLeZQYIK@glsmbp.wifi.local.cmu.edu>
 <CAMuHMdXonYO8fj5kUZTXCo4s1QNHZ8zLWJ8La7CBEqTGvfGjYw@mail.gmail.com>
 <Z6kX4jvAJPh_1pLH@errol.ini.cmu.edu>
 <CAMuHMdVBtdgdZ_nt3Nmu4oDaR4qtNAM5JHZKWRvjrbnSV2JSSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVBtdgdZ_nt3Nmu4oDaR4qtNAM5JHZKWRvjrbnSV2JSSg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Mon, Feb 10, 2025 at 09:29:45AM +0100, Geert Uytterhoeven wrote:
> Hi Gabriel,
> 
> On Sun, 9 Feb 2025 at 22:02, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> > On Wed, Feb 05, 2025 at 04:55:05PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, 5 Feb 2025 at 15:55, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> > > > On Wed, Feb 05, 2025 at 06:06:11PM +0800, kernel test robot wrote:
> >
> > [...]
> >
> > > > > sparse warnings: (new ones prefixed by >>)
> > > > > >> drivers/fpga/litex-fpga.c:114:17: sparse: sparse: cast to restricted __be32
> > > > >
> > > > > vim +114 drivers/fpga/litex-fpga.c
> > > > >
> > > > >     89
> > > > >     90        static int litex_fpga_write(struct fpga_manager *mgr,
> > > > >     91                                    const char *buf, size_t count)
> > > > >     92        {
> > > > >     93                const struct litex_fpga *fpga_s = (const struct litex_fpga *) mgr->priv;
> > > > >     94                uint32_t *buf32;
> > > >
> > > > changed this to s/uint32_t/__be32/
> > >
> > > LGTM
> > >
> > > > >     95                int i, count32;
> > > > >     96
> > > > >     97                /* Bitstream should consist of 32bit words*/
> > > > >     98                if (!bit_is_aligned((uint8_t *) buf, count)) {
> > > > >     99                        dev_err(&mgr->dev, "Invalid bitstream alignment\n");
> > > > >    100                        return -EINVAL;
> > > > >    101                }
> > > > >    102
> > > > >    103                /* Correct bitstream contains sync word */
> > > > >    104                if (!bit_has_sync((uint8_t *) buf, count)) {
> > > > >    105                        dev_err(&mgr->dev, "Bitstream has no sync word\n");
> > > > >    106                        return -EINVAL;
> > > > >    107                }
> > > > >    108
> > > > >    109                buf32 = (uint32_t *) buf;
> > > >
> > > > also changed this to s/uint32_t/__be32/
> > >
> > > Likewise.
> > >
> > > Note: If fpga_manager_ops.write() would take a "const void *buf",
> > > no casts would be needed...
> >
> > Would I not still need some sort of 32-bit cast for where this stuff
> > is actually accessed, a few lines below:
> >
> >         buf32 = (__be32 *) buf;
> >         count32 = count / BITSTREAM_INSTR_SIZE;
> >         for (i = 0; i < count32; ++i) {
> >                 while (!READ_SINK_READY(fpga_s->membase))
> >                         ;
> >                 WRITE_SINK_DATA(fpga_s->membase, be32_to_cpu(buf32[i]));
> >                                                              ^^^^^^^^
> > ... here? I could presumably use `be32_to_cpu(buf + sizeof(__be32) * i)`,
> > but not sure the legibility would benefit from that...
> 
> I think you misunderstood. You still need the buf32 intermediate.
> But if buf would be "const void *", you could drop the casts,
> as you can assign a "void *" to any other type of pointer without a cast:
> 
>     -       buf32 = (__be32 *) buf;
>     +       buf32 = buf;
> 
> Likewise:
> 
>     -        if (!bit_has_sync((uint8_t *) buf, count)) {
>     +       if (!bit_has_sync(buf, count)) {
> 
> Note that changing fpga_manager_ops.write() means changing all users
> of fpga_manager_ops, not just this driver.

Oh, I see, this would be an act of "community cleanup" -- making
things a tiny bit nicer for everyone involved. I'm considering it,
as it is a good suggestion -- although it will most likely be a week
or two before I get enough spare cycles for this type of volunteer
work :)
 
> >
> > LMK what you think. As stated earlier, I'm not actually set up to test
> > this myself, so I'm a bit paranoid about breaking it while trying to
> > fix it :D
> 
> Me neither, but ...
> 
> > > FWIW, no change in the generated assembler output.
> 
> ... i.e. if it worked before, it should still work...

Got it. Thanks again, I think I'm finally catching up to the rest of
the class... :D

Cheers,
--Gabriel
