Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C841B21AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739376607; cv=none; b=bkQR6QgCd/GkZsL4FfkyHjAcpDhUbYuhcdx7Ojo4OCm5JXStWAlRIDU+/VgZUvc1NegbFjIVjcOpqDS00xEI312gbzSb7tRCoaLKkNXY3wNgl5PU643PtbT1UWrBSiLoEV6gEAGCySC6dV0Ei9RzL6Z0dZz0klF4ROSHN8tUODg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739376607; c=relaxed/simple;
	bh=f8vtER1ac7COAZDAIpiKHEoNgiPTVW+94JGYtK2UU2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6F2vo5SlXwEo9bshEPa/cHiVJGrgf+/Y9LFV8F0G/qwIb6Yj0KVJ35VW5xy0FG8nysHmP3b+fl1bz30HscAMFDs1m2dkI1s27RS959tBB84p9sPGQaGdyh5MCgR2+BTTqk07J4q9iCu9vivfxmyZyArPcEC/AzndbWQDeJ+30k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pklauf3K; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pklauf3K"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c07351d2feso105155285a.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 08:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739376605; x=1739981405; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ois65fJkvAitigmv/dEu6kVW/mF29Nh3BerNgEJ3pkY=;
        b=Pklauf3KUwj80UUsQJcSuJ8EuxecNTEtoKll8hnIMuG6o5CLqeuZ65mP5wx5POJOxl
         kWCmmcGikWBFplfqMM8J7Nw+CZvuxiIBc6fd6rlCmTiC4RzNoGAw8AsKTma05XR3nmWS
         53pdgqk80MXtdPbGRho5LKuOzSp9UCLPThQLoVfG4sGYz3/uuCX1vRVlstc8YnRCsnYj
         FXnbnH+3q9YqHV7akN5ZEP3hUd+w/Gxmh7v14Fi+vrMefraR7XenQ4Ljft7CWO6vkjMl
         eY4uR0vRIBnIhnEdXy6qPv3wtgH12NRn90ZnOMaMygh1cnZMOnBcwMYBawfojgEGCs3I
         SFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376605; x=1739981405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ois65fJkvAitigmv/dEu6kVW/mF29Nh3BerNgEJ3pkY=;
        b=s8ntgh9VK/hNURf+6rRkg9cXC0McX014z7OHcAVpM3h11wcNJP0+E5U7Mw/juNqKET
         5aQ6AeDYyLpRikV0U+1C9L1eapQYC/SW6msPydFqqTzo/C0CyDvYeqGvDnUgs6bQCydW
         Zfxnzq3CQCprjtQ4YQA4OKMnS4i63V/PkArHeOvIKn9rTKpClHReUBPfXdsc0hjgpjzl
         hpA4S3OYuR/6z5rKp2f0wNXE5idUQVEDOAIm7FUtnDbaKwvdhGni+RlkTZYzKdSdcljM
         TmPhFQtDJp8CDX3mlI7UpBdfCl4UlEGtd6EBdDgsrtXUUTpqkYJqy9tg9hsOsFsForSS
         NbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPjxdagYqo74Nludbm1iXi0Eg6TUWze9n4pCaXG3mwaskxZ9dnpx+ETr2CcfD7WZPHWuQyK/crP91FYSng@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8XAGd3406NLil68m/F+1z7LzkWriG7N6PDyGfaenVnH+vOagk
	ZVDHqebYr0guW++21QEmGnfm4XtRe/bHCK6qY7u2iWw0Pl2RtuTANA1gJA==
X-Gm-Gg: ASbGncuFbmeXq4lN5tQrGOQD3+jQaUTmEf4QlAukLyc0zyY8AFo6XmbSyimzg9kqCAn
	vfevIHRWNkM1rA+0O6LMf9ax1HxEnJ/npAfMfEjj+JfwuZbT7hzkSP2SeFkEzbv/hJG/OszOwbr
	FoQo8Cx+XsZEZOOCgQSA3PNQTcwu3Uetg6BeKlZTO8/3FHMp6PTI5ldiA2z9m4IBG/lVfPXBlQe
	PdC38zz/XT8PUYz79tB+Zc6/tyI/pHQ2T60hrYk3Vaibeym5rCdLWIZ+vEG9q5I1TYdhSb8XWao
	IhVsL1DGE+vU0DI+a+UM8KrkHAdH79qN6PoVUMIftjYn71lMyQ==
X-Google-Smtp-Source: AGHT+IHLcRc02wCGZAuwW/8iNuXPJuvEzTa6245xE8ZIxwm/zuozLlMIhtW8Oj7MUKO0RHdnO4YIfQ==
X-Received: by 2002:a05:620a:6189:b0:7b7:2de:7075 with SMTP id af79cd13be357-7c06fc76921mr553903685a.28.1739376603486;
        Wed, 12 Feb 2025 08:10:03 -0800 (PST)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device.nat.cmu.net. [128.2.149.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0589a7d94sm541434485a.30.2025.02.12.08.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:10:01 -0800 (PST)
Date: Wed, 12 Feb 2025 11:09:59 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [litex-hub:litex-rebase 15/15] drivers/block/litesata.c:236:15:
 sparse: sparse: cast removes address space '__iomem' of expression
Message-ID: <Z6zH108QZmdLsz-l@glsmbp.wifi.local.cmu.edu>
References: <202502120833.dMbQRzZi-lkp@intel.com>
 <Z6zDaw33CbeXFgyJ@glsmbp.wifi.local.cmu.edu>
 <CAMuHMdVE-E=hYg=QN_-3s8MabcqGVjpe9fPina8Uqo_iFUhS2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVE-E=hYg=QN_-3s8MabcqGVjpe9fPina8Uqo_iFUhS2g@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, Feb 12, 2025 at 05:01:53PM +0100, Geert Uytterhoeven wrote:
> Hi Gabriel,
> 
> On Wed, 12 Feb 2025 at 16:51, Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> > On Wed, Feb 12, 2025 at 08:06:01AM +0800, kernel test robot wrote:
> > > tree:   https://github.com/litex-hub/linux litex-rebase
> > > head:   222d6093d18e20b52f2a81a4d162a17af3760fff
> > > commit: 222d6093d18e20b52f2a81a4d162a17af3760fff [15/15] LiteX: LiteSATA block driver
> > > config: csky-randconfig-r111-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120833.dMbQRzZi-lkp@intel.com/config)
> > > compiler: csky-linux-gcc (GCC) 14.2.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20250212/202502120833.dMbQRzZi-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202502120833.dMbQRzZi-lkp@intel.com/
> > >
> > > sparse warnings: (new ones prefixed by >>)
> > > >> drivers/block/litesata.c:236:15: sparse: sparse: cast removes address space '__iomem' of expression
> > >
> > > vim +/__iomem +236 drivers/block/litesata.c
> > >
> > >    208
> > >    209        static int litesata_irq_init(struct platform_device *pdev,
> > >    210                                     struct litesata_dev *lbd)
> > >    211        {
> > >    212                struct device *dev = &pdev->dev;
> > >    213                int ret;
> > >    214
> > >    215                ret = platform_get_irq_optional(pdev, 0);
> > >    216                if (ret < 0 && ret != -ENXIO)
> > >    217                        return ret;
> > >    218                if (ret > 0)
> > >    219                        lbd->irq = ret;
> > >    220                else {
> > >    221                        dev_warn(dev, "Failed to get IRQ, using polling\n");
> > >    222                        goto use_polling;
> > >    223                }
> > >    224
> > >    225                lbd->lsirq = devm_platform_ioremap_resource_byname(pdev, "irq");
> > >    226                if (IS_ERR(lbd->lsirq))
> > >    227                        return PTR_ERR(lbd->lsirq);
> > >    228
> > >    229                ret = devm_request_irq(dev, lbd->irq, litesata_interrupt, 0,
> > >    230                                       "litesata", lbd);
> > >    231                if (ret < 0) {
> > >    232                        dev_warn(dev, "IRQ request error %d, using polling\n", ret);
> > >    233                        goto use_polling;
> > >    234                }
> > >    235
> > >  > 236                ret = devm_add_action_or_reset(dev, litesata_devm_irq_off,
> > >    237                                                                (void *)lbd->lsirq);
> >
> > This is supposed to work in conjunction with the following (right
> > before litesata_irq_init() in the source:
> >
> >     204 static void litesata_devm_irq_off(void *lsirq)
> >     205 {
> >     206        litex_write32((void __iomem *)lsirq + LITESATA_IRQ_ENA, 0);
> >     207 }
> >
> > ... which re-applies `__iomem` to the pointer. Since I'm trying to
> > pass a `void __iomem *` pointer as "data" through devm_add_action_or_reset(),
> > I have to cast it to `void *` and back to `void __iomem *` before use.
> >
> > Not sure how to do that *and* satisfy sparse at the same time-- perhaps
> > using a (__force void *) cast is needed/warranted here?
> 
> Just pass lbd instead?
> 
>     static void litesata_devm_irq_off(void *data)
>     {
>             struct litesata_dev *lbd = data;
> 
>             litex_write32(lbd->lsirq + LITESATA_IRQ_ENA, 0);
>     }

Makes perfect sense, thanks!
Wish I had thought of that myself, looks like I'm having a slow week... :D

Cheers,
--Gabriel
