Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6307F1B21AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739376130; cv=none; b=kQ4hub7xe9ajm30dzv2oBNxDsvK4CDyuncG1qMmE+nI43R/9YrbAEg2r0gz0PjZ0lX5ReqknalEfRrTnOwgHVD0udt8dMGDInfoLKgNu/+Pr21ZLK+6fMK6PnmzXPphQT22++6tAKpHfIAdTQhIIvX6NWQFoSJn3Z3TQ3j28Qys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739376130; c=relaxed/simple;
	bh=AHVCPIzo5miXfKdUymwRzGD3sCat//UWfq0Wy3NLwE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/rywJPhlJcrwoRPrXjnoUuvvZ/pLsTl6pnSl0RFNEKJ+52KM4Pv/8eFZ1BcCJcjJZApFH1DVcMMj1aUSrShd5E0W0rwJ5C/pxy3jR7LRNP4iC7y82Rd25aWeWElO6y7YsBs/uNCqujXozQr8oG2GDZcXaWwR65UawH1/nr0dTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e442b79de4so56896276d6.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 08:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376127; x=1739980927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGs+tbCOhdiyG8Nnll9hsy8+2cCeLNAoMskLOsDHpmk=;
        b=WH/OZHlKL6FTVIEu568koewxwCRAlNh4T6hCiBYm0FIlYqAzF7AVbXU32DgRLfwlwj
         452/vAVB43ILIHexyX+J7yK19KaEC62ShkRzxCnncSMi6ramhabbTkbAbUiNlyT3hVXu
         2sG29lTbhvNb90ZyfyWGvRotb2zu4npIYdbmz9Cfc4IHgYElj5FkXyqO8arhHax8bEjX
         8AiBb6zcJJnrBAxOy7Mea83Mx8+e91Bb0wTtZSjub44zQ9BZlyoXibgLh1CQyshK5gdE
         Gne8SVKdzhPm9xfivQXpaGVaJiSL+Fq6M6MhOcqa38TU+UiM26EJbw2QOksEHKQrvnVu
         H8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHqC3lf4l2ODZNWQFyoQc/HeIWqMu/C8DmXGYP0tlJqPPqmjJkKYc55MK9ITy6OnND/96gN+ZdeiG8UaHR@lists.linux.dev
X-Gm-Message-State: AOJu0YxMdAj/LLcs17DeRxHFPQYgic/NeDmtk4ZkY78exi0wkT8ej8N3
	uaIOjBXQNMfIF7IRilJkdFpHEYtsugLd/XJe4NHO0WKV0oEnxxXIXOTlAyYu5IM=
X-Gm-Gg: ASbGncuMFOg2U0c88F7drK9We4Vk4BB0hrZc3hy4aRKJvYtNGJMYBfsa2EdMN8gGumw
	whIMtfT9zc+45m7fI3tJA+gi9eOviLKFsxAajH6FzwNqRl9KkVl2KfnQJlXwpfXzNZhPtlklbOF
	59kkaxznXoYBRrPpc6dkGfYCfd81kVEWvEN7G9byG6fhIzhAxHeqlRwlAVc4BcsUuZe0T6M3f5D
	Hs/rRnHBCJLLyoJ7bfwxPcFIntH1PiIHCvmDcKfaZQPcORaNwSbPvVdjhIOMLlzRrU1pxGB08/0
	hJx2QtOJSgWciaakB6/cdBx1AqVeMwvYgIK0x4a2IdjA/2X7+a9eWlxVgw==
X-Google-Smtp-Source: AGHT+IHHpSc5osAFPY3XIgEJAzkghDK4dubLm8zoYi8R/Y97z6At1TclqNsWPamzh49mXCcrYa7h2w==
X-Received: by 2002:ad4:5dc8:0:b0:6d8:7ccf:b692 with SMTP id 6a1803df08f44-6e46ed83177mr44578136d6.11.1739376126585;
        Wed, 12 Feb 2025 08:02:06 -0800 (PST)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e444b5ad24sm72316786d6.103.2025.02.12.08.02.05
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:02:05 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-471bc8eaf3fso3044021cf.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 08:02:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWw13g9DgshNvEj1UiIjRfCjQIqB03eeA19rZsf+wf7yB8v07e4K3u++xxR/4jVGwklk/MacIfdJh/QLuj4@lists.linux.dev
X-Received: by 2002:a05:622a:1a18:b0:471:9813:11f0 with SMTP id
 d75a77b69052e-471afde1db8mr40374821cf.10.1739376125436; Wed, 12 Feb 2025
 08:02:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502120833.dMbQRzZi-lkp@intel.com> <Z6zDaw33CbeXFgyJ@glsmbp.wifi.local.cmu.edu>
In-Reply-To: <Z6zDaw33CbeXFgyJ@glsmbp.wifi.local.cmu.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 17:01:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVE-E=hYg=QN_-3s8MabcqGVjpe9fPina8Uqo_iFUhS2g@mail.gmail.com>
X-Gm-Features: AWEUYZlqN00yVJH_K5pr_etO8QI9G6wYLEzJ2A5IoKmZonPn9OiV6i0UQ2VsG-0
Message-ID: <CAMuHMdVE-E=hYg=QN_-3s8MabcqGVjpe9fPina8Uqo_iFUhS2g@mail.gmail.com>
Subject: Re: [litex-hub:litex-rebase 15/15] drivers/block/litesata.c:236:15:
 sparse: sparse: cast removes address space '__iomem' of expression
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Gabriel,

On Wed, 12 Feb 2025 at 16:51, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> On Wed, Feb 12, 2025 at 08:06:01AM +0800, kernel test robot wrote:
> > tree:   https://github.com/litex-hub/linux litex-rebase
> > head:   222d6093d18e20b52f2a81a4d162a17af3760fff
> > commit: 222d6093d18e20b52f2a81a4d162a17af3760fff [15/15] LiteX: LiteSATA block driver
> > config: csky-randconfig-r111-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120833.dMbQRzZi-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 14.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20250212/202502120833.dMbQRzZi-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502120833.dMbQRzZi-lkp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> > >> drivers/block/litesata.c:236:15: sparse: sparse: cast removes address space '__iomem' of expression
> >
> > vim +/__iomem +236 drivers/block/litesata.c
> >
> >    208
> >    209        static int litesata_irq_init(struct platform_device *pdev,
> >    210                                     struct litesata_dev *lbd)
> >    211        {
> >    212                struct device *dev = &pdev->dev;
> >    213                int ret;
> >    214
> >    215                ret = platform_get_irq_optional(pdev, 0);
> >    216                if (ret < 0 && ret != -ENXIO)
> >    217                        return ret;
> >    218                if (ret > 0)
> >    219                        lbd->irq = ret;
> >    220                else {
> >    221                        dev_warn(dev, "Failed to get IRQ, using polling\n");
> >    222                        goto use_polling;
> >    223                }
> >    224
> >    225                lbd->lsirq = devm_platform_ioremap_resource_byname(pdev, "irq");
> >    226                if (IS_ERR(lbd->lsirq))
> >    227                        return PTR_ERR(lbd->lsirq);
> >    228
> >    229                ret = devm_request_irq(dev, lbd->irq, litesata_interrupt, 0,
> >    230                                       "litesata", lbd);
> >    231                if (ret < 0) {
> >    232                        dev_warn(dev, "IRQ request error %d, using polling\n", ret);
> >    233                        goto use_polling;
> >    234                }
> >    235
> >  > 236                ret = devm_add_action_or_reset(dev, litesata_devm_irq_off,
> >    237                                                                (void *)lbd->lsirq);
>
> This is supposed to work in conjunction with the following (right
> before litesata_irq_init() in the source:
>
>     204 static void litesata_devm_irq_off(void *lsirq)
>     205 {
>     206        litex_write32((void __iomem *)lsirq + LITESATA_IRQ_ENA, 0);
>     207 }
>
> ... which re-applies `__iomem` to the pointer. Since I'm trying to
> pass a `void __iomem *` pointer as "data" through devm_add_action_or_reset(),
> I have to cast it to `void *` and back to `void __iomem *` before use.
>
> Not sure how to do that *and* satisfy sparse at the same time-- perhaps
> using a (__force void *) cast is needed/warranted here?

Just pass lbd instead?

    static void litesata_devm_irq_off(void *data)
    {
            struct litesata_dev *lbd = data;

            litex_write32(lbd->lsirq + LITESATA_IRQ_ENA, 0);
    }


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
