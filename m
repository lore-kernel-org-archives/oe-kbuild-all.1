Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441C489885
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392809; cv=none; b=fNnCQSu/Pz9SFQHvNHD+s6avpTyi6rYX5tEXH9CtLYeVKgTNxOvgNydorAA+SW8FCIWq24SjoX6miEbsK+HbGJKM9P4o8Cmnrk3MAQPeY/7z9YGuCsluSsRoSaUMpSaDkvptg5gpuDPU+9e04fUJtAcO7gWICikKJOUESgqWje0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392809; c=relaxed/simple;
	bh=d4Ns9MrcjrkL74lU3nY8b1EUlzF1MbtrTa1z9FgniQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHZdlbAN1UqYZ6WP23X8nhEAlibWPowUo3+h7V/WDLq7GBb02y20IHvz4bOy0DGZXX27x0VqO8MI/WOH3gdn6iJLInUbQnCaPGgmbiivqfyo5w+cO573R3qdUG1ArPBUE460ED1VrtIfj/gDxfD1Pf6oHKDLGS8C6rbHKuld0yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso15161e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 23:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392807; x=1792997607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cjJM139EIVeGEh8rWsgMbCEX7knwMHfAW0CurdOdiu8=;
        b=cGzwx9AfuWrwujNDwJtCZbyC9fWI8MqMGK0h9fvwh1JboFZjHnhjbR5B9rM7AOaVPN
         xWn+H+oKwPgNhOVixmdlmNNiEPzMFCnZ69VL5cV8M3m6VOTKmi7WaPRXWCpSmFuovVUJ
         qI1vsRqej88/Pi9CKsl1DTJWfTtF5BmIkULFefCOs2yiQDleW06qru4E6KAK0Nnw0XEs
         gEVg9IlM/O9WOxYzv1f4MR5othMcFEwDPfCOPsy+ahXyEkVA/E12pk4woRtbRNbTPpA0
         CfZLcFDk3i6SxzdYhYZlC72WrX55OjoRtdwcldCYnTt4AQSQ1DMjcB0dcxiltQbpHK8m
         CBJA==
X-Forwarded-Encrypted: i=1; AKwUvBy63rxIqbIhAZmrUNFHqTnf1WdtvX78Hpeab0Xt8e9uDyKwhGgsQNNiyM1czz77NplsxsSSZQtRhr9BBYq3@lists.linux.dev
X-Gm-Message-State: AFq9FYKL5cRvFkE8jqFIDKW412JbrdZYSzPGaGbuAOwXcuOX61DLL3j7
	hmtDruN4eBEtdUff2Cl5KJLiiYi5qOn27GURMYWFdJfwUGUSTpZjMy/ms3yqBWQ/
X-Gm-Gg: AYBFou2b5BsFuYvkYMIiw+uKkNz93nxL4DBAVcGKVdJVACvNnuT7bKPBfiWhT4d8jXh
	GuE8i/dXhgAOE3T8nERR9N1FirlCF32jXT8GRCNM7I3VTtgA4kYUR8gr6d+tDd6IpobjGZoA3ck
	0dloAiXf96mTsNAYXFmzKIGW3AKLDxiM/Vl+B6G2kF+pGvoS2JIwAUvZjxOQPoWQ/WWX5xy/Wcu
	Dc4Rd0uH7l1XmM45MzvU9JG7fTm3T2o7l+6qI9hQ0gzH8nGrBIshOowlnLffD+6z2QOBQlfgL8r
	V6CmqJgcE3Fh8EGy4gPa5AGd8EsbFFtS1pDkziyYVLu1OZ9Jj4ioUDphJpk5IHbvxHdt/GOwL4s
	la1p35XBDO7Frlzzah+0cI098yjj7AopRqBzfDOd6R6FI5y21lZ3DZ4bxUfKh3tFfd+AxYlrz2U
	GCQ6L/kwwXZK9kKKZhWPvJ8I2V111KYzmWXJDbGm8/NGivhyxmTInGV0rVfKfLrHDULc1XHM8xL
	D949/Ujp0Fh64aB4j7fFO6MFNgzpY7P4bRowQhK
X-Received: by 2002:a05:6122:6202:b0:5c9:c60e:3a43 with SMTP id 71dfb90a1353d-5eaaa8a4a7cmr1893889e0c.21.1792392806580;
        Sun, 18 Oct 2026 23:53:26 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eacd020162sm1494759e0c.10.2026.10.18.23.53.24
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:53:24 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso270225e0c.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 23:53:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZCdRaTlMmM2OLXS179LBzqZnQZAJXjpmFwHHlkUHetYMIJtz+ItNuDTUUFBn/RgVIj1DiK5jyzcYzlomZ@lists.linux.dev
X-Received: by 2002:a05:6102:1492:b0:7a1:f980:e93b with SMTP id
 ada2fe7eead31-7cc36a1726amr1724652137.23.1792392804446; Sun, 18 Oct 2026
 23:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261010065442.23780-1-rosenp@gmail.com> <202610131201.wWk11MLy-lkp@intel.com>
 <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 08:53:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
X-Gm-Features: AclHuK-hkOaUNvhawt4bfdwYbTv8-8VXt4ePnbu5KtWM6yoyqBrlCyoN2rObGDw
Message-ID: <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>, linux-mips@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maciej,

On Mon, 19 Oct 2026 at 01:26, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Tue, 13 Oct 2026, kernel test robot wrote:
> > config: mips-rbtx49xx_defconfig (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/config)
> > compiler: mips-linux-gcc (GCC) 16.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610131201.wWk11MLy-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    Assembler messages:
> > >> arch/mips/lib/csum_partial.S:202: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x100($4)'
> >    arch/mips/lib/csum_partial.S:203: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x120($4)'
> >    arch/mips/lib/csum_partial.S:204: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x140($4)'
> >    arch/mips/lib/csum_partial.S:205: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x160($4)'
>
>  So oddly enough we're missing Tx49 support in the toolchain and we've
> only managed to survive with CPU_HAS_PREFETCH enabled for CPU_TX49XX
> because it also implies DMA_NONCOHERENT via MACH_TX49XX -> MACH_TXX9,
> which in turn disables stuff in arch/mips/lib/memcpy.S.
>
>  Quite straighforward to fix in binutils since docs are available (as in:
> I have a copy), but do we have any users?  Geert?

Yes, I still boot test rbtx4927 regularly.
I never touched binutils sources, though...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
