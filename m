Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679F1DE4CD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074909; cv=none; b=obPJu/k3HDVTa0r6G5eo7AehLmpbI0h/nbEtC8oyD2pCuy8c84qRkoK/0BCrIX8IC/b00jzT25QUaBov8B5NzVoCJn7yo6hJDw8a2gx5u3mIy9SzWBdr10zkn9tOYGHbHWazwtIs841JxN47DfjmBnhS0hnV48m9mWh2+KnYWyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074909; c=relaxed/simple;
	bh=t9E7jaIRgmZ+jhjkrMSLZufPgigLkMJGG8vibrwiY9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+VoSKg1F96Qlyya+MlttTu5dO71aagILBTDkgQb/ezyW6rHA80EE8sGjelSbu6kft7h+d2il8I+zbXi324tvmeBCkJEvoeT/Jvf9GbTS0dJs9Y7FVcoN5/RfLQKNf6SqY5/9P2grzWS8gekP1thCQ42bdEQk9ohybhOFRDWQJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4df4ef9c59dso643530137.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 11:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074905; x=1747679705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faDWq4SXHnuv6JR8rza3bg7AFXqM/F53I5xb503DYJA=;
        b=WGx/VABpEK5A2kTiajpIPMhNqWIgfnZGsF1fnjLWbga7bU58q9MpxquUTwvsOnndKG
         oSvFFAKUCxFPvQUu1ytPcQziyrgI1NuRzo6UjsXqgx8jYkoMPsij2NFXGBZJdujx4wpY
         pQSIq4yzRBhchUvA3/O+uEiFHXoK6icnL68CcmX28d2z8IY1OGJwFDnRrI7sawAu0HRM
         viE90ptU7nlXBoBa+lJAzlGynoPXNtXLbxirv8lX0q2rdjTBGbwAbyuNxAisdrc0VXHN
         GJRu/R9raSqtxQWWqq1Rb2xIJ+p7O4xk8gnhcKmKIkFlLGF3SBoZyTESJGIH9/RPewJ7
         3xyw==
X-Forwarded-Encrypted: i=1; AJvYcCXhb0+KFfYw8QF2MbC35PLt2Qnb7f+XSK2kp3FUNybIduL9rNOF5/vxEg/xW8ZuhWuQgbizfl2c1ys/uQgo@lists.linux.dev
X-Gm-Message-State: AOJu0YxiCsPM6fNOjfpQ+wYyk6Iy8UVQQAyXs7pI7QpqU8PDpYlUU5Gt
	M5mDNy9GCjjB+RSJ2apPjpWZBAiE060RIXnPS9PLQjBOmLqbuyGjh5j+Aodh
X-Gm-Gg: ASbGncvaGHuBdk2lYXqD4YQUumY9Wj1mcd68qO6EbW762mhxq/ideQD9iuDJB70u5CB
	Hi9YzT2ic8Ex8DMTqeATFe55T9SkExZJjDAR7O0DAdMy3sVQiCUzMSv8wwpe6DpmYrFCeUCZ5XQ
	WiR2CkA46SHLmQvjaVUVtPgbVapp5j0qa00Nk8tJ66uB/9eZLP14mfhFE1WL0HszKPKc57YCVCh
	4BHnyl3OOAsNFj3pExenEZO1YipWyv4Fg+r6fmCSLBUFg6ZRt9Y4b7OBm10tQW+2NsrXyrDQQIw
	lkPsvJxDX+BLfIBXvUp6aY7Kp1uUK7oIzqnbkIzpITV6M9p/ejJWZQfSBCj36D/c5ZupJfTPzA6
	TP0Fjlm7VRvdC7w==
X-Google-Smtp-Source: AGHT+IHBMnbTZGomuG1n3N7c1VKKL0HHRvMz4OMNKmPTOK38skFgFA86Npic8FH8EpY2+AUeUNLQBw==
X-Received: by 2002:a05:6102:91a:b0:4da:e629:58c5 with SMTP id ada2fe7eead31-4deed3f1364mr10834711137.23.1747074905176;
        Mon, 12 May 2025 11:35:05 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85d7c32sm5442299137.15.2025.05.12.11.35.05
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:35:05 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8783bce9f84so1235601241.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 11:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTY6rheK7y0XSgswNEe16Xr7Yroc3zuvCN0GRF1HxqZlMxVRuTa5JPfM0Wdck3OMYvhuNpmNFstwkO1rod@lists.linux.dev
X-Received: by 2002:a05:6102:5345:b0:4dd:c8f6:c479 with SMTP id
 ada2fe7eead31-4deed337524mr12552678137.7.1747074904660; Mon, 12 May 2025
 11:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250509181737.997167-1-Raju.Rangoju@amd.com> <202505110641.zLT16Dv7-lkp@intel.com>
 <e84f5483-a203-4095-82cd-23fa94c87700@amd.com> <CAMuHMdUAE2umYggDdBjYZJY2-mYwim=P_=4Q00k9b8gB1tNY+Q@mail.gmail.com>
 <8c89410b-80f2-47ad-97fd-6ac10752c040@amd.com>
In-Reply-To: <8c89410b-80f2-47ad-97fd-6ac10752c040@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 20:34:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_ugjS475udqa1oOOfbOJ+0s_JAKcCyCcdQfPhhaWOTQ@mail.gmail.com>
X-Gm-Features: AX0GCFvM4NO1qlCePh4MALJ9BqQGETeVVgnvPLy3fBf6nSRJBizZ7wMT2W-NF_U
Message-ID: <CAMuHMdX_ugjS475udqa1oOOfbOJ+0s_JAKcCyCcdQfPhhaWOTQ@mail.gmail.com>
Subject: Re: [PATCH] spi: spi_amd: Add HIDDMA basic write support
To: "Rangoju, Raju" <raju.rangoju@amd.com>
Cc: kernel test robot <lkp@intel.com>, broonie@kernel.org, oe-kbuild-all@lists.linux.dev, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krishnamoorthi M <krishnamoorthi.m@amd.com>, 
	Akshata MukundShetty <akshata.mukundshetty@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Raju,

On Mon, 12 May 2025 at 19:55, Rangoju, Raju <raju.rangoju@amd.com> wrote:
> On 5/12/2025 7:47 PM, Geert Uytterhoeven wrote:
> > On Mon, 12 May 2025 at 09:29, Rangoju, Raju <raju.rangoju@amd.com> wrote:
> >> On 5/11/2025 3:51 AM, kernel test robot wrote:
> >>> kernel test robot noticed the following build warnings:
> >>>
> >>> [auto build test WARNING on v6.15-rc5]
> >>> [also build test WARNING on linus/master]
> >>> [cannot apply to broonie-spi/for-next next-20250509]
> >>> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >>> And when submitting patch, we suggest to use '--base' as documented in
> >>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>>
> >>> url:    https://github.com/intel-lab-lkp/linux/commits/Raju-Rangoju/spi-spi_amd-Add-HIDDMA-basic-write-support/20250510-021954
> >>> base:   v6.15-rc5
> >>> patch link:    https://lore.kernel.org/r/20250509181737.997167-1-Raju.Rangoju%40amd.com
> >>> patch subject: [PATCH] spi: spi_amd: Add HIDDMA basic write support
> >>> config: m68k-randconfig-r111-20250511 (https://download.01.org/0day-ci/archive/20250511/202505110641.zLT16Dv7-lkp@intel.com/config)
> >>> compiler: m68k-linux-gcc (GCC) 14.2.0
> >>
> >> Thanks for reporting this. We do not support m68k.
> >
> > All write[bwlq]() functions take a volatile void __iomem pointer
> > (https://elixir.bootlin.com/linux/v6.14.6/source/include/asm-generic/io.h#L174)
> > while you are passing a void *, so sparse should complain about this
> > on all architectures.
>
> My bad, with the following flags included, sparse now complains this on
> all architectures.
>
> -fmax-errors=unlimited -fmax-warnings=unlimited
>
> And sparse is right, this driver is using MMIO
> > accessors on allocated DMA memory, which is just plain wrong:
> >
> >      amd_spi->dma_virt_addr = dma_alloc_coherent(dev, AMD_SPI_HID2_DMA_SIZE,
> >              &amd_spi->phy_dma_buf, GFP_KERNEL);
> >
> >       for (i = 0; left_data >= 8; i++, left_data -= 8)
> >              *buf_64++ = readq((u8 __iomem *)amd_spi->dma_virt_addr + (i * 8));
> >
> >> Will re-spin v2 with necessary changes in Kconfig.
> >
> > Please fix the real issue instead ;-)
>
> We are using read*/write* calls instead of memcpy to copy data to/from
> DMA memory due to performance concerns, as we observed better throughput
> during continuous read/write compared to the memcpy functions.

Perhaps your memcpy() copies backwards?
https://lwn.net/Articles/1016300/

There is no guarantee that read*/write* calls work on normal RAM on
all architectures. It may just crash, as some architectures return
cookies instead of real pointers when mapping MMIO.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
