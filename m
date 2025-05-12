Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246151DE8B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059441; cv=none; b=j0txzo4w5u0gNc3bjvyXj0Co5DNG8/gb0MSelQfZn9zMs5B7zJl68rfyrxPbLFMl+Uul5GX9iAAzjCs6CPr878wKXnk3tDkagzz+4Az8XXnVTBTa3/CgTfdp+o4a0RqmfRZE2T7hUCNEGFt7293Zegx5sN4B69YYWA5UN6iubV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059441; c=relaxed/simple;
	bh=2IyyNXNnQSfbvykHq8rn1B+uBUbYbh7+8zI3pXsppGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOwcgnhkriG1uvIlUQZKR5sW0Mw+WogZmcPVe9C9iGSgonbnMIoKKzQLFaHBb9CUGa3VLVSsBFrA4vnI5EOUO/YdNO/t0c+/ra9xRu9+H+79bRcnq1XfOWI+5vQKw1wQv+NqEm63mj9eU4QyXN3bdsbrTiCtfw7wtcEKWgWj9yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso4482305276.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 07:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059438; x=1747664238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+uGFXyTYFqNhdsh1y5nDVvPcnH9qAzMoSdfww0Dh/E=;
        b=jvS9YrP01M8ZHgoCIHxiOvHaAJvac/k7QXTuYA0GySadeMmcDkEriZRV4CZO46VJda
         54H1n7h5j8dJGob7JOVC2L9IDLE6BLo/KoUHN0iGQ33JVAbiYCKoEtkfDHHf3qfORGzm
         5kni2hdaksTjXGq0HTIeFwg4nkqKu3khIh67qUnlzho+ZYAVklxgyLaMjlyYTrWPlSMX
         CjQVYpKhdWs+7bpWv3m85T7YR87uX+RIKUB0p2RrYUIF2AyomTvaF3S5IiLflL4+ofYc
         9S3ZiXOx4FknhOQ2nbgJb06STAQ1BjmNOhCTC7TqkAnty774X65YfNIfBwclgFAm5F+n
         FiMg==
X-Forwarded-Encrypted: i=1; AJvYcCWG3s9DppppeNuN7Xl4EC5nQ5WFsWWOcYqipBxzGkOXKzp0ltMVFuya8Y6MF9YoHfwyjP/nPIpLLo4pmT8i@lists.linux.dev
X-Gm-Message-State: AOJu0YxRrfgSeGApQDOFy+yb5Vjx4M9Nirshl+2YNza91Q7Afbc0I0mn
	irSVze1pAv9RXfQvw3bYq1rhroiE8cQoy6Wb6pPd4B3CPAdSLy6QNuIv4AbO
X-Gm-Gg: ASbGncvHtJYovsjWOjSXLpc7WeCuO+R8SokflPlppU9iv/Hk79VML6MY2SUAaBac5fC
	Aq3PTmqEbHLW4Ga1x/UUkCacz1j4i52B6sBnUMlEkB4PchWnPc0do5Sc4++O4Q1U2B9mWIkEfB/
	tTmY1hSJ9i/hYQM3M6JXgAGcxxwDdMpoRzGWG+CIh9dvDa8F2ySbM6mcs6qqQed6gwR145np3/x
	aSU7QX1VeokAoMdcUqF8Lf8isMIqXTLO+fQ/6XxWz+Zw9e15/tDDFlv5/G39CtwnWB5qxtZj17E
	bcHIR647hZOZcc6JcyrJVJHujsQGYANcFCXtxdbXRBdWlh/+kw9M0TDQTdXYGGKgQqWeMAlnb7Z
	XvsOufQfxcFCOIPXrag==
X-Google-Smtp-Source: AGHT+IG0si38E+SEZt4tSWuz6wIthkpRjHLbCd7SAKYB3V8sDZJ9i9AyDvZRl1vj2fuHIFaVLCkvnQ==
X-Received: by 2002:a05:6902:1616:b0:e7a:b1e6:65d4 with SMTP id 3f1490d57ef6-e7ab1e667a7mr7808814276.35.1747059438268;
        Mon, 12 May 2025 07:17:18 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e78fd4a72f0sm2067845276.20.2025.05.12.07.17.18
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:17:18 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70a2d8a8396so35928037b3.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 07:17:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWn/Kq6h94kInPbXYYqPHLNxOc+Kb99Kfk1Wd6jAzYWC0opot/23ygEmTvWDwNM0OaJBQY5vWNd+H2Iul02@lists.linux.dev
X-Received: by 2002:a05:690c:7406:b0:703:afd6:42e3 with SMTP id
 00721157ae682-70a3fb68ed7mr176247997b3.37.1747059437816; Mon, 12 May 2025
 07:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250509181737.997167-1-Raju.Rangoju@amd.com> <202505110641.zLT16Dv7-lkp@intel.com>
 <e84f5483-a203-4095-82cd-23fa94c87700@amd.com>
In-Reply-To: <e84f5483-a203-4095-82cd-23fa94c87700@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 16:17:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAE2umYggDdBjYZJY2-mYwim=P_=4Q00k9b8gB1tNY+Q@mail.gmail.com>
X-Gm-Features: AX0GCFvPeCVVWJSx_u6CiKRqRCs9Wi8eoap8nT8SCO-AJVBCg084LJ1ts4ptq_o
Message-ID: <CAMuHMdUAE2umYggDdBjYZJY2-mYwim=P_=4Q00k9b8gB1tNY+Q@mail.gmail.com>
Subject: Re: [PATCH] spi: spi_amd: Add HIDDMA basic write support
To: "Rangoju, Raju" <raju.rangoju@amd.com>
Cc: kernel test robot <lkp@intel.com>, broonie@kernel.org, oe-kbuild-all@lists.linux.dev, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krishnamoorthi M <krishnamoorthi.m@amd.com>, 
	Akshata MukundShetty <akshata.mukundshetty@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rangoju,

On Mon, 12 May 2025 at 09:29, Rangoju, Raju <raju.rangoju@amd.com> wrote:
> On 5/11/2025 3:51 AM, kernel test robot wrote:
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on v6.15-rc5]
> > [also build test WARNING on linus/master]
> > [cannot apply to broonie-spi/for-next next-20250509]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Raju-Rangoju/spi-spi_amd-Add-HIDDMA-basic-write-support/20250510-021954
> > base:   v6.15-rc5
> > patch link:    https://lore.kernel.org/r/20250509181737.997167-1-Raju.Rangoju%40amd.com
> > patch subject: [PATCH] spi: spi_amd: Add HIDDMA basic write support
> > config: m68k-randconfig-r111-20250511 (https://download.01.org/0day-ci/archive/20250511/202505110641.zLT16Dv7-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 14.2.0
>
> Thanks for reporting this. We do not support m68k.

All write[bwlq]() functions take a volatile void __iomem pointer
(https://elixir.bootlin.com/linux/v6.14.6/source/include/asm-generic/io.h#L174)
while you are passing a void *, so sparse should complain about this
on all architectures.  And sparse is right, this driver is using MMIO
accessors on allocated DMA memory, which is just plain wrong:

    amd_spi->dma_virt_addr = dma_alloc_coherent(dev, AMD_SPI_HID2_DMA_SIZE,
            &amd_spi->phy_dma_buf, GFP_KERNEL);

     for (i = 0; left_data >= 8; i++, left_data -= 8)
            *buf_64++ = readq((u8 __iomem *)amd_spi->dma_virt_addr + (i * 8));

> Will re-spin v2 with necessary changes in Kconfig.

Please fix the real issue instead ;-)

> > reproduce: (https://download.01.org/0day-ci/archive/20250511/202505110641.zLT16Dv7-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505110641.zLT16Dv7-lkp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> >>> drivers/spi/spi-amd.c:594:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
> >     drivers/spi/spi-amd.c:594:57: sparse:     expected void volatile [noderef] __iomem *addr
> >     drivers/spi/spi-amd.c:594:57: sparse:     got void *

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
