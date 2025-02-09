Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F2223AE7A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 21:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739134952; cv=none; b=Xv/V08toH42mKReHc0WOoWD+oJWIHZdLQIqkg9fuKExyVYXe16YVvolU4zcQdVPmLyvLvomO7JTh5aym+A3hnwhuBvrR4i17j29I64S/5TlR2wtBiJYjcXbt6H+XaVmZCZfK/zIJvHLJ+RYX/PYZKkfS7st8bvlmCFVZz2ricPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739134952; c=relaxed/simple;
	bh=4SVxuKZLLsKLapg3peIJUvAfuw38TL2/jgXgew7C5gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWwuFRxI89BX3T9MNivQJvAQjGUyTwVHAy2D65M8VM5Jx8ZpuMFdAfAOsoaG6/K9JBfVexsea2ifopKidNtdnT+Pk6RvsNti62i3MotC8K2A1PdA6/X9jyWj5wWvFGl+YfS7fPeC+1cHEWMSgGzOQ9gLohXGLBUQbQTxpM46BWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfUbXaNd; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfUbXaNd"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4717bb7e7deso11664341cf.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 09 Feb 2025 13:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739134950; x=1739739750; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZTeYoZ8aMOr0omJJEej1ScbEw8FjdkOq2Wv5fHMVJw=;
        b=YfUbXaNdq4xNyhMcYXOX2ZNuxtjJI5y4TTyKQGa5iGollWJ49+PWY5S1wUzAvnIebR
         wZ2YYkeEnK0c202HIqdJP3iduWpI29aoVaxoCT796j3gf8vyNAbm1Iova0Y71s8s10TO
         Va4oLOmEFTX3fXd+XLGKedNW9xXMr/SdCsalUX/PhSovmnBEHPRaIUemAWQsfjf7yG9g
         6OJU6PFo+SP/cGmkrTrwIuK5SiDfbfQyuP1WKCZgVex0FNqW+lzAirKoFObX5Fx1c7W7
         xMKvnydBTILET5QTJ759pfrh5TOqwjSG4tAP3DvlQoxnQ2rO+ajzgdtbEWV0lgQlv/W9
         ASOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739134950; x=1739739750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZTeYoZ8aMOr0omJJEej1ScbEw8FjdkOq2Wv5fHMVJw=;
        b=XwU5fHP2MVp6+w6QraD2jVrxycr44Q4GvAnusv5tiFnZIYQFCesGLvNvFuusABgbUb
         m5ZsbP+5CdvNFnkPqkiabk8N2M/UAcTfjiEdnVBZC+PX0Etbcz7T09qaxzlfGZ28zV8E
         we5UAcHNjp6WJaOndWcOpdopZC1b/zFmNUZoPkNXAjl5/76lWWcYAUfFcI24K1mH7GSx
         nC4aTh0D/xTHhfg+ograGJT1XVTPoZjr2NC7YNJg7ddqso9FHFZtT0Nn1IXyZUOiAGb4
         b5DNq93QOSBRFeF5bvxM8eTx+OQN3zDY2Z0ldMB/RBAumgxgSd6PSk/AFa7y6YBCWisU
         sODg==
X-Forwarded-Encrypted: i=1; AJvYcCVhCcBoH3+JaxY4GX8LTiblndrjsfbN9WciTUpuddnodEH2kJT6z83KHaMjePSdN/vhql5sXegTCXKgRwfv@lists.linux.dev
X-Gm-Message-State: AOJu0YxFd0HLBictghvTf6dRbAX9MWTZkWIePWpn4fV4HBfK79xeSNZL
	5uW7EMMCJuUjG09pQU6SORrOxZbCTgoBECBZ9DHWS6q2tQetVuwQ
X-Gm-Gg: ASbGnctuA1Z+eQgmQrg6/j7d1n1QHRqnmVTZbErDwpEy1MlE8FMFHWWkpHCP8FjtzBM
	B68C5Ui2I39VYSbdG+GZSyZP0bDpNO/WRJIPYtB4aNdz2BRL9jXypDzBsTZpj0FTJySoLddfcmp
	WWfBzzypBB0ZmQ+dtAgzfxQhdq+4CK90lVj/W+SvVddWWVTuN9xUubTmjgAovoxCBcaqibCLYus
	VjrEXNelnX0fwsfDELZwysxTUEPmzJyUcHdSeT5xT+NvXBBYyyasWtGPzLueCQvls2qRdz7R4so
	as7AOq3TaHWSxjf1dyQHBWiXYMwexAErh/+bi11E80vhwmsGCFYi9buYdvH0/6fpzA==
X-Google-Smtp-Source: AGHT+IGXedG5xIcJLYwQ7b9JitN+tT8qyMBZiVtrlpwz/gzVVNOcoZhjUhSr1+y5powicbGuQ4RYvQ==
X-Received: by 2002:a05:622a:244c:b0:471:86c8:c93a with SMTP id d75a77b69052e-47186c8dc59mr68691191cf.19.1739134949831;
        Sun, 09 Feb 2025 13:02:29 -0800 (PST)
Received: from errol.ini.cmu.edu (pool-108-39-141-40.pitbpa.fios.verizon.net. [108.39.141.40])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4718cb6d2b0sm8898321cf.16.2025.02.09.13.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 13:02:28 -0800 (PST)
Date: Sun, 9 Feb 2025 16:02:26 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>,
	Robert Winkler <rwinkler@antmicro.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [litex-hub:litex-rebase 11/15] drivers/fpga/litex-fpga.c:114:17:
 sparse: sparse: cast to restricted __be32
Message-ID: <Z6kX4jvAJPh_1pLH@errol.ini.cmu.edu>
References: <202502051703.2QcrfJ0B-lkp@intel.com>
 <Z6N76QX8uLeZQYIK@glsmbp.wifi.local.cmu.edu>
 <CAMuHMdXonYO8fj5kUZTXCo4s1QNHZ8zLWJ8La7CBEqTGvfGjYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXonYO8fj5kUZTXCo4s1QNHZ8zLWJ8La7CBEqTGvfGjYw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett

Hi Geert,

On Wed, Feb 05, 2025 at 04:55:05PM +0100, Geert Uytterhoeven wrote:
> On Wed, 5 Feb 2025 at 15:55, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> > On Wed, Feb 05, 2025 at 06:06:11PM +0800, kernel test robot wrote:

[...]

> > > sparse warnings: (new ones prefixed by >>)
> > > >> drivers/fpga/litex-fpga.c:114:17: sparse: sparse: cast to restricted __be32
> > >
> > > vim +114 drivers/fpga/litex-fpga.c
> > >
> > >     89
> > >     90        static int litex_fpga_write(struct fpga_manager *mgr,
> > >     91                                    const char *buf, size_t count)
> > >     92        {
> > >     93                const struct litex_fpga *fpga_s = (const struct litex_fpga *) mgr->priv;
> > >     94                uint32_t *buf32;
> >
> > changed this to s/uint32_t/__be32/
> 
> LGTM
> 
> > >     95                int i, count32;
> > >     96
> > >     97                /* Bitstream should consist of 32bit words*/
> > >     98                if (!bit_is_aligned((uint8_t *) buf, count)) {
> > >     99                        dev_err(&mgr->dev, "Invalid bitstream alignment\n");
> > >    100                        return -EINVAL;
> > >    101                }
> > >    102
> > >    103                /* Correct bitstream contains sync word */
> > >    104                if (!bit_has_sync((uint8_t *) buf, count)) {
> > >    105                        dev_err(&mgr->dev, "Bitstream has no sync word\n");
> > >    106                        return -EINVAL;
> > >    107                }
> > >    108
> > >    109                buf32 = (uint32_t *) buf;
> >
> > also changed this to s/uint32_t/__be32/
> 
> Likewise.
> 
> Note: If fpga_manager_ops.write() would take a "const void *buf",
> no casts would be needed...

Would I not still need some sort of 32-bit cast for where this stuff
is actually accessed, a few lines below:

        buf32 = (__be32 *) buf;
        count32 = count / BITSTREAM_INSTR_SIZE;
        for (i = 0; i < count32; ++i) {
                while (!READ_SINK_READY(fpga_s->membase))
                        ;
                WRITE_SINK_DATA(fpga_s->membase, be32_to_cpu(buf32[i]));
                                                             ^^^^^^^^   
... here? I could presumably use `be32_to_cpu(buf + sizeof(__be32) * i)`,
but not sure the legibility would benefit from that...

LMK what you think. As stated earlier, I'm not actually set up to test
this myself, so I'm a bit paranoid about breaking it while trying to
fix it :D

Thanks,
--Gabriel
 
> > Geert: I left this as a separate "fixup" patch (for now); I'll merge
> > it into the original "LiteX: driver for ICAPBitstream fpga manager"
> > once we convince ourselves it was the right thing to do (I am not set
> > up to test this patch at the moment).
> 
> FWIW, no change in the generated assembler output.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
