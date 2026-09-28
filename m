Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C163A5038EE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 23:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639001; cv=pass; b=Mba8Dwg2ru6VTLAkEt6hqcQ6l5Q/ysH495CbW/B/rcolmSLJaRNsp0pnSrArxUax60JUa/tWUDrKcGuXgm+/d8338D2uBLfrWA/pB+dJoCrsa6TZj16T5Bqg3GO/jPk4hLmo2nrz0dNE0PmtS2X+dRvwoHdCqka5avgsF/LHsGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639001; c=relaxed/simple;
	bh=5ynqZFtARzy4/UiXIBasA48ciZPqgZS98dfTbePs/AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlezEp+Py0+LCB/lUBOZ7Dmi+UaPrqIBlNfaEvp+9GNLfmDWeDSpWf7nr0VPVs4h/BMMOEn7shHlvbLB6trqvjN+ZqIu62U90X1GBrI8AvnhK96IbEbx3kaf5lBUVzBRwZIjirzKczel8ATMIY6GUcvW92bJr0y6pZvEVlrUPhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBzUP1cF; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBzUP1cF"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab201ebso3529256d50.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 16:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790638999; cv=none;
        d=google.com; s=arc-20260327;
        b=pkMhIB3KqVQMoL2RDnai9k8MwD6A1fQeCjy5QLTprKcrAWUNPUOXKNT42dba7DlEcx
         ta8yfS65xDYvTiVMyAixOqbmPhghsvq1cj0kTRtAWEWPjRZoyi3CWe0PcRT8Ruwc79r3
         T/W/EopIe711t2lIvJZljRK7jTXTtPDHbh/NM/OZhn+MzeYUcX9lkDZhXovmi7jnYyWs
         I/NjZbegB6rJ+z1IGnPYuon3gKILaR5mbK1ZHIdQU7P8fbyzzxn/EtStyC5Rjwaaa0o/
         PiAabtwIZI5q4mNN9VCU42WKwTfAfEjSMkq9k4TfR/k0M+a4dYc9vvoMW6ai8noYLuwW
         reaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3stsNDX4Bh3Ny6i8aR14gWuGQnZxgXq7uTLEco9N880=;
        fh=61acwNysGOdd75a0rG25DC5pnnnVR8by9oXFbE+XNcw=;
        b=Qin9i2fNxMKYshVKNBrRNX7x0Z3kjv94m81y5rWAXIt1jZCcPV0NNQu50OgmqfqxsK
         cOohJ4DjF9TflUe5DFb+FpQj1A+yWQ+KfZe/aIMJ8wB7CEVyPufBG2Mpw0heQERjOVVW
         hTsqBhfypQQ54daYcaTDKqBTT62HNujdSUFQhojnyiXxYJYVirOKfHWkuWmVpGtB6XHi
         HMufJfkwxB71oLOMzvSSmdgl38VGUxaFfaP7QRwe+n8x/98MMLF7MkbDM9MxM6g2yWP8
         s59E6a7uS+LV5gCGtiEVFVHhm2B9UkgtTRqJ0keL093ie/nwVsOzV4gHK6ExTro9+S5F
         GtCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790638999; x=1791243799; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3stsNDX4Bh3Ny6i8aR14gWuGQnZxgXq7uTLEco9N880=;
        b=EBzUP1cF8mBaAaNcdIKCuD+NJQsqNl4mEGoHGYld4riHA6hm261T3koQuEvygvIQGY
         nFc85/G6jZNJ5Bud2dwOSoIX3Mqk0+7CA1VFMeR/ltphgcobOVefIojm5dJjlOJPwyzt
         bExPp2ckhGLQOEXOydg78SmT4WCOhRVeZu7lj+AJlrvzPJjgFkWQYriGKXl4nJQogNVV
         OrhwHj1DOtAfwFqzWrTqD0sAUy4DxnSlEyv/W2S8A21g8fMGsmxfBbPXMqeBAXYbvRe0
         U1/LiAcfWygA28iOV41Rox3m7b87iRgrbiQLfAmbNOsV4oMDwYo5TDhnTcAipDwqt4Wh
         +dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790638999; x=1791243799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3stsNDX4Bh3Ny6i8aR14gWuGQnZxgXq7uTLEco9N880=;
        b=shCXNuQXpXH8gbOg+6sppE//NWL7/9/irUj0i8EluplTuwtuuiFqLW3zIvXqsEGFlh
         ZkwO6KWKzAihm7LZQNqqa72Vxoxhl6IpGFEmWXKVw7R0d3uAK1Nf1dYTHiBOECN6ns0l
         cbTsx5pdE4/4625GUEMaoRRbBcswF3FO3KIIpTU2HcXNyb6mvSR9ILwDKCUuV92poEtg
         SHoVHtzY1w07+qq1/m9Yz2v62WOpePBkw/rpLU4KMgJQ8HKK7w8XxcqSTo3DGrPwPxuL
         jCVe5zPNvlgnW4YtnLyRr+zSS41m8Z/7x+k2EGzj7rAF2Fq4U3Q1f3iifXqOs3jE7vyM
         tvlA==
X-Gm-Message-State: AFq9FYJwcS5SdF4i/JQIMRWuEE89fRetUioq8KIjqVjsHySgPso2Yb31
	xdN8HvZCcneX8bX/8l1df1NI5EaY/zbZGzoSFLjqjtXkwYPZTUt9unzaSw/fppBoXZMVnm7xW5b
	+I2WiQBMbzLKD6WgxgNTMnzitq2cZbIY=
X-Gm-Gg: AYBFou2rFZ0kiPovEJQrePRl+vKmB+EZj45VjetWqntDg3Uk4o808sD8PDCnjEWmSkX
	v6GOMTbad9JYXD4w1AAh38nUlvKwFFkltcT/Hw3qtWIlbIzpRAkyPFQf0rBBu/5h05zW1cY8I99
	MvgES8qT6te4B22ksH9xYR8DSwbo5MtnzXsROUBOmDhlGLa/IFFXbeK4RD3vOmM/Cpco2ZZKzbT
	aOcPlctE65YmqHJf7H92ZN9JPRlm5SBuNSvMFqV4fW2bLvqGZSlJFUFp5o+Zd1VfNci3vmORsxs
	Pf/jOn7BTlPkhUZyqUOY00u1PdrmUF1NVXg5YAr6UgJhamb97+kLvcZSlOSCAcbVd8TUAG+zUdm
	/y2/zMjypJmGuGVP7kKRuumX1VDglIo8RxqhE1cqzERQurDwRBTxSVTfPTX3vWsvkD7lCD9OENf
	+GiJL66PkOY9o8iLYMhYEgfsHw33OWyjhccRDNGPtdwFMasiTyyS8L9g==
X-Received: by 2002:a05:690e:262a:b0:672:99e1:11cf with SMTP id
 956f58d0204a3-672ed49377cmr4145065d50.108.1790638998596; Mon, 28 Sep 2026
 16:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609261313.kgFtkz2t-lkp@intel.com>
In-Reply-To: <202609261313.kgFtkz2t-lkp@intel.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Tue, 29 Sep 2026 09:43:02 +1000
X-Gm-Features: AclHuK-09VUyswb_ykHWdQTzYGpKAOWq2dd5z6j8JhQoovFv5Wwllc3aL0t0vX0
Message-ID: <CAN5rfbReCmhwCdRjXD6SXQp__Zy-HgXi4EG2PuMGhKgAqBCKyw@mail.gmail.com>
Subject: Re: drivers/video/fbdev/atafb.c:2457:17: sparse: sparse: cast removes
 address space '__iomem' of expression
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Helge,

if I read this correctly, your patch fixed the two other warnings (the
dead atafb_ioctl and pclock = 0). Since you mentioned "Fixes:
d463633d63e6" pointing at my commit, maybe you can take a look at the
line 2457, too? I'm too unfamiliar with the whole process but since I
got the warning email, I just wanted to point your attention to it.

Thanks,
Miro

On Sat, 26 Sept 2026 at 15:09, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   5fc5768c7ca92895ccd1de94dc521e5a55ae7896
> commit: d463633d63e6aa10384683bf39971a4b00780c56 fbdev: atafb: Add support for SuperVidel's SuperBlitter
> date:   5 weeks ago
> config: m68k-randconfig-r1308-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261313.kgFtkz2t-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 16.1.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261313.kgFtkz2t-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's SuperBlitter")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609261313.kgFtkz2t-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    drivers/video/fbdev/atafb.c:2824:9: sparse: sparse: switch with no cases
>    drivers/video/fbdev/atafb.c:1092:34: sparse: sparse: Using plain integer as NULL pointer
> >> drivers/video/fbdev/atafb.c:2457:17: sparse: sparse: cast removes address space '__iomem' of expression
>    drivers/video/fbdev/atafb.c:2641:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void * @@
>    drivers/video/fbdev/atafb.c:2641:27: sparse:     expected char [noderef] __iomem *screen_base
>    drivers/video/fbdev/atafb.c:2641:27: sparse:     got void *
>    drivers/video/fbdev/atafb.c:2815:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dst @@     got char [noderef] __iomem *screen_base @@
>    drivers/video/fbdev/atafb.c:2815:32: sparse:     expected void *dst
>    drivers/video/fbdev/atafb.c:2815:32: sparse:     got char [noderef] __iomem *screen_base
>    drivers/video/fbdev/atafb.c:3353:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static [toplevel] external_screen_base @@     got void [noderef] __iomem * @@
>    drivers/video/fbdev/atafb.c:3353:38: sparse:     expected void *static [toplevel] external_screen_base
>    drivers/video/fbdev/atafb.c:3353:38: sparse:     got void [noderef] __iomem *
>    drivers/video/fbdev/atafb.c:3424:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *static [toplevel] external_screen_base @@
>    drivers/video/fbdev/atafb.c:3424:33: sparse:     expected void [noderef] __iomem *addr
>    drivers/video/fbdev/atafb.c:3424:33: sparse:     got void *static [toplevel] external_screen_base
>    drivers/video/fbdev/atafb.c:3428:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
>    drivers/video/fbdev/atafb.c:3428:34: sparse:     expected void [noderef] __iomem *addr
>    drivers/video/fbdev/atafb.c:3428:34: sparse:     got void *
>
> vim +/__iomem +2457 drivers/video/fbdev/atafb.c
>
>   2436
>   2437  static void svblit_fillrect(struct fb_info *info,
>   2438                              const struct fb_fillrect *rect)
>   2439  {
>   2440          u32 bytespp = info->var.bits_per_pixel / 8;
>   2441          u32 pitch = info->fix.line_length;
>   2442          u8 *line;
>   2443          u32 pix;
>   2444
>   2445          svblit_wait();          /* the CPU is about to touch the fb */
>   2446
>   2447          if (rect->rop != ROP_COPY || rect->height <= 1 ||
>   2448              rect->height > 4096) {
>   2449                  cfb_fillrect(info, rect);
>   2450                  return;
>   2451          }
>   2452
>   2453          pix = (info->fix.visual == FB_VISUAL_TRUECOLOR) ?
>   2454                  ((u32 *)info->pseudo_palette)[rect->color] : rect->color;
>   2455
>   2456          /* draw the first line with the CPU ... */
> > 2457          line = (u8 *)info->screen_base + rect->dy * pitch +
>   2458                 rect->dx * bytespp;
>   2459          switch (bytespp) {
>   2460          case 1:
>   2461                  memset(line, pix, rect->width);
>   2462                  break;
>   2463          case 2:
>   2464                  memset16((u16 *)line, pix, rect->width);
>   2465                  break;
>   2466          default:
>   2467                  memset32((u32 *)line, pix, rect->width);
>   2468                  break;
>   2469          }
>   2470
>   2471          /* ... and let the blitter replicate it into the other lines */
>   2472          svblit_copy(external_addr + rect->dy * pitch + rect->dx * bytespp,
>   2473                      external_addr + (rect->dy + 1) * pitch +
>   2474                      rect->dx * bytespp,
>   2475                      rect->width * bytespp, 0, pitch, rect->height - 1);
>   2476  }
>   2477
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



-- 
http://mikro.atari.org
