Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE001C07E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 08:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176201; cv=none; b=nPqF960cQvXk6CRjSsXEaP0HkwWP1FpgNu6s0sax3fmWo5yvNXiLtkuS0evZoNGfpXGhuBgBb2iqWrOvqTbFR5Hj0kY6tk/3AqixgIYkEAcNAl/ByjuhUDtX/Xx7J7vnqIHq5Wc71ckQPwX/y45xCYriolx70N1fKV4XAl9A+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176201; c=relaxed/simple;
	bh=i2174Id52GqMouP/BEBSMSZ+Y1z53wkIsdxjVoC3E5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DI8ddjUrjU+5vfssBuIJaXkpluQ4pG8AH0+L2hiw+PTzD+oAojnRDLp2u0EuM0sUrBgGSYFsd3o+tpclEz+E+xMGasjlySvy1QIbwDCs/iCpg+xtOZSCXJT3jKvOo2P7omYleRp6aESpt4aKI2xIv/fP8GtWyxms+s0mScjLncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-866f61c01e5so1232763241.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 00:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176198; x=1739780998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2IQQCwNpClXgU9K0l4BmRYWyRtzcRSzHjZOGJEymbg=;
        b=QQPziEmYdOMTI4ElCJoSDAv1dWsLAdpgIZUzTpa3m0nv/5lUYhUypH7W1Hr4civLid
         urua0ICtZv74ek0ryp/esLhSP0jV5QJVnLnoD7C+4BzD0VB9U9C1ejyGvvxjmD+REB2/
         shZ11Db0kjcT73iYKLClMdZuWBsgp4p2gUnjOWxSKIOjTm3q/DXz1r4YYC5OjSdvpQ1o
         JiWDnD29UnuMYXsWyvRvspuAL0RRYaTS9fY1MqZlZGHVSnizo1AJime/UPJjY8wL6dCT
         8XtlSmU+oY5rAs2LOyIIu3NjQFBBmK6Gsb2NktXIzihRqlINadrX3/wabi4KfCdmae0F
         eejQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjQzmnvmLV1mQox1zq/DAHO2T1aVc6qdy19hdgDZ3OO2WLJVcapUUlnYgUHd04arQMMaC7g1hs4GgvzLwL@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgi/vRu/fXYzhZSgIJshdC8AtIc/JgmanfVVvhhQflU84QgDKO
	lXclpN5nRQhuLjG19FuSR7HKiBqnkqpzE+ujwcSyb+4JJ+P/obH/Qje7c7p5
X-Gm-Gg: ASbGncuGz865AHw0LtxFqnuei1Vnv6nV/gfDkovXiuxoe8EeNm/MEV0V6QKDHkz2GaN
	Wh37FchR4DCdI5gcQQlIYIywkTRoAIcpKiaOCmlJeAnoVQ96gf8a4e2Gsv03h4/zHdxHZ8u8MMw
	Fs5m18EbFffwOOxnjlKgufeysdFDVbdujsWwCy87LwQCPzY1DPiBWREELWmzTyDl+dmJl0O8Sux
	ia4sR49A9DHNPHVo3+knNpatNo9s1TOZpklpCV7XlnAF/1e41+I3ZE8jkseFIyLXlV4rDdhtLGF
	Y9hKhnrTyu1h7uY5nYP6BgRMBL5o0bQfZRufMpVWssXaYMbxfD596w==
X-Google-Smtp-Source: AGHT+IEIfw/OsCMBdVNxJxuj8Wlfy2uJSNQVfFqfc+ONJJWblQkssEQxV8HJsF7WtwM/pH+NoyWbFg==
X-Received: by 2002:a05:6102:50a1:b0:4bb:b589:9db4 with SMTP id ada2fe7eead31-4bbb5899fedmr2593570137.18.1739176197896;
        Mon, 10 Feb 2025 00:29:57 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbd6cf875dsm90499137.26.2025.02.10.00.29.57
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:29:57 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4aff31b77e8so1115630137.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 00:29:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJ9hFRiAan8YMXFxwx81NR2vOQNxXir71quMi+KK/VHhVz2o6l0x0hwZvWSVyN+nAMy2Pueryvbyj6u8js@lists.linux.dev
X-Received: by 2002:a05:6102:2b8a:b0:4bb:dba6:99d4 with SMTP id
 ada2fe7eead31-4bbdba69d6cmr45871137.7.1739176197458; Mon, 10 Feb 2025
 00:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502051703.2QcrfJ0B-lkp@intel.com> <Z6N76QX8uLeZQYIK@glsmbp.wifi.local.cmu.edu>
 <CAMuHMdXonYO8fj5kUZTXCo4s1QNHZ8zLWJ8La7CBEqTGvfGjYw@mail.gmail.com> <Z6kX4jvAJPh_1pLH@errol.ini.cmu.edu>
In-Reply-To: <Z6kX4jvAJPh_1pLH@errol.ini.cmu.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 09:29:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBtdgdZ_nt3Nmu4oDaR4qtNAM5JHZKWRvjrbnSV2JSSg@mail.gmail.com>
X-Gm-Features: AWEUYZmnlmoD1e5OxcXSu6x_BrSzGPiG2WFORAJk6179h2OjcAqbl782rr1v0AU
Message-ID: <CAMuHMdVBtdgdZ_nt3Nmu4oDaR4qtNAM5JHZKWRvjrbnSV2JSSg@mail.gmail.com>
Subject: Re: [litex-hub:litex-rebase 11/15] drivers/fpga/litex-fpga.c:114:17:
 sparse: sparse: cast to restricted __be32
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Robert Winkler <rwinkler@antmicro.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Gabriel,

On Sun, 9 Feb 2025 at 22:02, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> On Wed, Feb 05, 2025 at 04:55:05PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 5 Feb 2025 at 15:55, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> > > On Wed, Feb 05, 2025 at 06:06:11PM +0800, kernel test robot wrote:
>
> [...]
>
> > > > sparse warnings: (new ones prefixed by >>)
> > > > >> drivers/fpga/litex-fpga.c:114:17: sparse: sparse: cast to restricted __be32
> > > >
> > > > vim +114 drivers/fpga/litex-fpga.c
> > > >
> > > >     89
> > > >     90        static int litex_fpga_write(struct fpga_manager *mgr,
> > > >     91                                    const char *buf, size_t count)
> > > >     92        {
> > > >     93                const struct litex_fpga *fpga_s = (const struct litex_fpga *) mgr->priv;
> > > >     94                uint32_t *buf32;
> > >
> > > changed this to s/uint32_t/__be32/
> >
> > LGTM
> >
> > > >     95                int i, count32;
> > > >     96
> > > >     97                /* Bitstream should consist of 32bit words*/
> > > >     98                if (!bit_is_aligned((uint8_t *) buf, count)) {
> > > >     99                        dev_err(&mgr->dev, "Invalid bitstream alignment\n");
> > > >    100                        return -EINVAL;
> > > >    101                }
> > > >    102
> > > >    103                /* Correct bitstream contains sync word */
> > > >    104                if (!bit_has_sync((uint8_t *) buf, count)) {
> > > >    105                        dev_err(&mgr->dev, "Bitstream has no sync word\n");
> > > >    106                        return -EINVAL;
> > > >    107                }
> > > >    108
> > > >    109                buf32 = (uint32_t *) buf;
> > >
> > > also changed this to s/uint32_t/__be32/
> >
> > Likewise.
> >
> > Note: If fpga_manager_ops.write() would take a "const void *buf",
> > no casts would be needed...
>
> Would I not still need some sort of 32-bit cast for where this stuff
> is actually accessed, a few lines below:
>
>         buf32 = (__be32 *) buf;
>         count32 = count / BITSTREAM_INSTR_SIZE;
>         for (i = 0; i < count32; ++i) {
>                 while (!READ_SINK_READY(fpga_s->membase))
>                         ;
>                 WRITE_SINK_DATA(fpga_s->membase, be32_to_cpu(buf32[i]));
>                                                              ^^^^^^^^
> ... here? I could presumably use `be32_to_cpu(buf + sizeof(__be32) * i)`,
> but not sure the legibility would benefit from that...

I think you misunderstood. You still need the buf32 intermediate.
But if buf would be "const void *", you could drop the casts,
as you can assign a "void *" to any other type of pointer without a cast:

    -       buf32 = (__be32 *) buf;
    +       buf32 = buf;

Likewise:

    -        if (!bit_has_sync((uint8_t *) buf, count)) {
    +       if (!bit_has_sync(buf, count)) {

Note that changing fpga_manager_ops.write() means changing all users
of fpga_manager_ops, not just this driver.

>
> LMK what you think. As stated earlier, I'm not actually set up to test
> this myself, so I'm a bit paranoid about breaking it while trying to
> fix it :D

Me neither, but ...

> > FWIW, no change in the generated assembler output.

... i.e. if it worked before, it should still work...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
