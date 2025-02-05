Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635F18DF65
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770923; cv=none; b=nS3RLQciqF+g4DUGrPZ0XmFmgOPusEDnw2XY5tTxlSw2fwNF4TamUrvnONY31rdV460naluMY/k1vXPwtX3AVRNJOatQk+seaWpACQC9Da4c+QTwmBrVop5LcY1oQjm+UgQMpJgiucstLpsiVhaumY0zAcftqiOCJfxiLRglO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770923; c=relaxed/simple;
	bh=4NXurgLuHno147UmQBKIloAwgjMwE/wzj7LPYojOwRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8hYQfheWojdUK1BM9YlKOKSYI//65M0Sc2vFA/oAYDuLk7LjoLBNRHW9WMmm0BCGZMIOC/VHe1qA4b4UStn/CnpTaSY+ukG5ZJ+YJTgwVF3jWSI1dEJiQsG7uVslZMyHAVm7D6f/W8o+4Kyxk8IFxM1o1Yxw+DSeXh6Jwt4o7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso2303396e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Feb 2025 07:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770918; x=1739375718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaYuM2Hcw7PBsvDFKxLZHCWf9qTRRGOvbo+7Eykm+wE=;
        b=HAPzFS8dYBpZ0HI1A3Rk7lSlY8j+KOF20l9gbyx9BZsZQ7N+nlh81E4ok/RRU+55Fk
         T+0Nc3mJQ5DECR/CgY9aKSGUsHRpQqURaBNk/Q2ezDUyK358w1g3KGiWfcFUmUoI2Y9O
         byvakdpfI8rFjSdsRRZmhAV17Q/8Oms6B1fzlAtfsVUBTZuIYq0HlKp5O1NuD6lz7Twn
         wtWoZPVfaUDrnHkP8o4W577ix4T9120Acqrtsc6J4D6Wacb/pH/+m/e8XfFYGJ7WuAiT
         pa4asSanjYa7R09y3H35ffM3ot/iUhE54BpgxWuNr2sNypJkHb+DGlxmrpXUhXv58FWe
         Kw8g==
X-Forwarded-Encrypted: i=1; AJvYcCWCIXxcIG30Z2DXEBiXN0k02NZRE8bTacI2ks08/kQJrYQk5BdF1DXSLteqOfNe7BUBdosAp1g38Z69zuFl@lists.linux.dev
X-Gm-Message-State: AOJu0Yzprkrl05FIeUfsPVzk5RxsAkYNqeRxkM0sWvlA96hDJQyvDcAf
	nh/4z58IZmpfTOAA5nq4/UBkqUYCFCH19oOQghSsE7+ywBmRkv1GODCvPaVO
X-Gm-Gg: ASbGncvXwDqB+a7OC5KxaMlJjlPNvMlVtxzp5+MHEb/uQ8YIxDv/gn1hP7HSGWRurTy
	ecFMvxg9BW966aVFJEeRAIcnF0DK+eFFqrXy0XBc7D0G3BsGeOTP6AfIUMM29nc8uUrSCrjWebF
	E9QWOrkVr9HuGH/dZnR0pTXg/U1JWMDLOpQN4hiizne+IuKdNtTzxxt3qVyowIWvx+ghpfXMW/M
	tBzKyKOHSQ9OkaxVtbu8j2G5tQzBID1+ZsJ//rc+2Wqegp6jBavPYLFB8xucqJ/31CBmoleUwAR
	YYFgKRXMfMb+q7mvlldjzpPDatt15eMOjCUNfymCupAMFCeeeaqP8w==
X-Google-Smtp-Source: AGHT+IEkPUbSnwkaROoMEl7pmXgXeP5H7pzwP0weLPE9YaazkOdKIB5h/XmHm1jpxyIs4Cy0wc0GYw==
X-Received: by 2002:a05:6122:4f92:b0:51b:8949:c996 with SMTP id 71dfb90a1353d-51f0c4e50b8mr2155135e0c.9.1738770917891;
        Wed, 05 Feb 2025 07:55:17 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1be84f7sm1847433e0c.8.2025.02.05.07.55.17
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 07:55:17 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-866f01c2f2aso142445241.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Feb 2025 07:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsJPtyGLjPALZk0xWjJGtJa4uw6jBAFJ4dGNRuqwDuPO6BkmTllINyZW04pD400AFLO+RPTWKT1SsJmFDl@lists.linux.dev
X-Received: by 2002:a05:6102:f12:b0:4b2:48ef:3cf2 with SMTP id
 ada2fe7eead31-4ba47abd438mr2354978137.25.1738770916865; Wed, 05 Feb 2025
 07:55:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502051703.2QcrfJ0B-lkp@intel.com> <Z6N76QX8uLeZQYIK@glsmbp.wifi.local.cmu.edu>
In-Reply-To: <Z6N76QX8uLeZQYIK@glsmbp.wifi.local.cmu.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Feb 2025 16:55:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXonYO8fj5kUZTXCo4s1QNHZ8zLWJ8La7CBEqTGvfGjYw@mail.gmail.com>
X-Gm-Features: AWEUYZm--ViJ3BDY8m4KhTOpX1VbR0uoecRumt_BI91lPMQUysaUSXldCzZHIWs
Message-ID: <CAMuHMdXonYO8fj5kUZTXCo4s1QNHZ8zLWJ8La7CBEqTGvfGjYw@mail.gmail.com>
Subject: Re: [litex-hub:litex-rebase 11/15] drivers/fpga/litex-fpga.c:114:17:
 sparse: sparse: cast to restricted __be32
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Robert Winkler <rwinkler@antmicro.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Gabriel,

On Wed, 5 Feb 2025 at 15:55, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> On Wed, Feb 05, 2025 at 06:06:11PM +0800, kernel test robot wrote:
> > tree:   https://github.com/litex-hub/linux litex-rebase
> > head:   a1cd33eb9593685b8b0716cbecf1a817b6410ca2
> > commit: 8e7a6c0a5ea5b945506ef310544efdd7c64bb3ae [11/15] LiteX: driver for ICAPBitstream fpga manager
> > config: arm-randconfig-r113-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051703.2QcrfJ0B-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20250205/202502051703.2QcrfJ0B-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502051703.2QcrfJ0B-lkp@intel.com/
>
> Thanks for the report!
>
> > sparse warnings: (new ones prefixed by >>)
> > >> drivers/fpga/litex-fpga.c:114:17: sparse: sparse: cast to restricted __be32
> >
> > vim +114 drivers/fpga/litex-fpga.c
> >
> >     89
> >     90        static int litex_fpga_write(struct fpga_manager *mgr,
> >     91                                    const char *buf, size_t count)
> >     92        {
> >     93                const struct litex_fpga *fpga_s = (const struct litex_fpga *) mgr->priv;
> >     94                uint32_t *buf32;
>
> changed this to s/uint32_t/__be32/

LGTM

> >     95                int i, count32;
> >     96
> >     97                /* Bitstream should consist of 32bit words*/
> >     98                if (!bit_is_aligned((uint8_t *) buf, count)) {
> >     99                        dev_err(&mgr->dev, "Invalid bitstream alignment\n");
> >    100                        return -EINVAL;
> >    101                }
> >    102
> >    103                /* Correct bitstream contains sync word */
> >    104                if (!bit_has_sync((uint8_t *) buf, count)) {
> >    105                        dev_err(&mgr->dev, "Bitstream has no sync word\n");
> >    106                        return -EINVAL;
> >    107                }
> >    108
> >    109                buf32 = (uint32_t *) buf;
>
> also changed this to s/uint32_t/__be32/

Likewise.

Note: If fpga_manager_ops.write() would take a "const void *buf",
no casts would be needed...

> Geert: I left this as a separate "fixup" patch (for now); I'll merge
> it into the original "LiteX: driver for ICAPBitstream fpga manager"
> once we convince ourselves it was the right thing to do (I am not set
> up to test this patch at the moment).

FWIW, no change in the generated assembler output.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
