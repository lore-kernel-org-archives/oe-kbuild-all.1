Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E5D40B6EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 12:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623110; cv=none; b=Et2Jwi0/hOmyvxRZ4dn95KZcgCi/Eb4Cy0DA8e5hfoHoNEEB8qdJKkZk1IP2aJz+iTLcy7axIxNysNj8ghEuBCg+h3T3PDoo53Kqd0GTdQz2K/UA1ju6V7rLZDtpPmByqhepAuBlTgrKZHHVKIiLwSL8qGik+ZBoixsex2gF3bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623110; c=relaxed/simple;
	bh=HAfTrQnTX39kcyw68ZIDYe25H2swz4Ieiu1DyXqrDJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gve7vhykDWoF17u+anGFfyeGKVCniyCvFiPdc4qleYB1/mtPX6XGaBiLwwq82WMlpS5F+5h9M1uuWWTpDyMF7/O4Kg6EtZK4K/vD1XNZjNfY7l/6eaAm65wywLfvo6BU2UIAadqMr/Due3d6Wn7N9gNkbzQzH+r7Lr3XSxTDMWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-76535268562so524618137.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 05:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786623107; x=1787227907;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RdxXrILZwaYPWt9Xc6Pu+dsaJd3C+knkX0xIddP7LTg=;
        b=QAhgo12/QteDdzKb8weZTO0bvWr1N/9TZ334AhRGclsfI7jh2pm18yPot3HHsVrw6X
         7O6coHPsrqk5Y8VwT0f1a4Q8+cZP2r4zh6YBUwLeCP4NLsd/mJGVrJOOZS0c31/jLJqQ
         /WinYSaLUQPu5EuG3kdSftsuL4VRYysUHNMLobMrtmidAg1LfnIxGWB7Vxv9BjjEzPXR
         1BsT8frM3CdGPPR4+Gh/6KUfR6AopdMTgJRoI9s9s5iY4ysRuVrN6D2Rin+SqmgxuNUn
         /RK+TTawKwzD5qMF/xCbWr/XRLv3DrDwn8vr83L5wXxGm14YyNioI4pStnLS3ZT93/e8
         SPUw==
X-Gm-Message-State: AOJu0Yx/5NeyBoXgTnSYX7t2IJFFv8e1INcSmhGocakiI8bgYOFN2Un9
	YcdgOannOpT1O7mvz6MbDC/Ic5qCj0W+NyAxpNnm/gf/Q1UEm0DxIKP2PzZK4bsf
X-Gm-Gg: AR+sD138T4TpOPpv+jreNbQs8S4KIMyn/2/SgFInNm6xPzSaBZTKROQqROzFepMarYW
	ZIC0oHQXy1uIUvCe61ywznG69xe4KgNYibj5otxlKG8hMriGw3pmGH6PdqrCKPr5IRlqs3gNoaW
	/hcAVBwtFlxgM0HGTRLhvNjdwE0kzQ7QjqPqQ6ogIiS3vHV2nNSJF4vLRZ7ClU254Hrs3zLKsxP
	5Drr3QGIlq0WvepyV47BGLbrMyOl36CK2WcXv0NgrFVXV6S1t847bBZHIXtBmnelIJkttbb7BAk
	y3QdvUYuVb4yFjJ7sCgi+EpkFr33z2gskW0xyhA4inEsjziXtBKs846mTKsLUEwYwy8yGXTdk4W
	LD4qB3vnkY9VmTHTIggfyzty60jnnxPnKEtlstVf/0qHTEw54fEJKs9bAg3xtx0Y0LGuiqyvZaP
	AJy+HAfzmcz9LWeDdb67aMWMMjOhQkawuvphqCNFziacWO5N5KYBVtShOi/lD9YSfoy7nvDL/uA
	OYxBv8SpFcWEArlU0HXK/4lkbSRCsHPHU81
X-Received: by 2002:a05:6102:c09:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-76db5c7db09mr1103060137.6.1786623107171;
        Thu, 13 Aug 2026 05:11:47 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becae7d19sm805317241.4.2026.08.13.05.11.45
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 05:11:45 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-977cf5cae50so444398241.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 05:11:45 -0700 (PDT)
X-Received: by 2002:a05:6102:1496:b0:740:2d81:c2a2 with SMTP id
 ada2fe7eead31-76db85675b9mr1299667137.10.1786623105091; Thu, 13 Aug 2026
 05:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202608131917.ZNBnMX82-lkp@intel.com>
In-Reply-To: <202608131917.ZNBnMX82-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 14:11:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyR4iHO_L+nk+Ut4p0dO4Yv=2pe3ovb+Tqo28TKO40Yg@mail.gmail.com>
X-Gm-Features: AUfX_mwFwbhIu8ckhLEfRSRUMQo1NcCEGh67guPk3wLF3-vi7ljBnw1D6f4-R2M
Message-ID: <CAMuHMdUyR4iHO_L+nk+Ut4p0dO4Yv=2pe3ovb+Tqo28TKO40Yg@mail.gmail.com>
Subject: Re: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel Test Robot,

On Thu, 13 Aug 2026 at 13:36, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3d6d817622b0a9721e3cc404df3469171582be13
> commit: f47c1b77d0a2a9c0d49ec14302e74f933398d1a3 clk: Move clk_{save,restore}_context() to COMMON_CLK section
> date:   7 months ago
> config: m68k-randconfig-r071-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131917.ZNBnMX82-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 10.5.0
> smatch: v0.5.0-9187-g5189e3fb
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131917.ZNBnMX82-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: f47c1b77d0a2 ("clk: Move clk_{save,restore}_context() to COMMON_CLK section")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608131917.ZNBnMX82-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    m68k-linux-ld: arch/m68k/coldfire/nettel.o: in function `init_nettel':
> >> arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
> >> m68k-linux-ld: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
> >> m68k-linux-ld: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
>    m68k-linux-ld: arch/m68k/include/asm/nettel.h:61: undefined reference to `ppdata'
> >> m68k-linux-ld: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
>    m68k-linux-ld: arch/m68k/coldfire/nettel.o:arch/m68k/include/asm/nettel.h:61: more undefined references to `ppdata' follow

This looks like a false positive, as this commit cannot cause these
additional failures.  In fact the parent commit doesn't even build
with the provided .config?

> vim +60 arch/m68k/include/asm/nettel.h
>
> ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  55
> ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  56  static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
> ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  57  {
> ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  58   volatile unsigned short *pp;
> 732c611e5bbb76 arch/m68k/include/asm/nettel.h sfking@fdwdc.com 2009-06-19  59   pp = (volatile unsigned short *) MCFSIM_PADAT;
> ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16 @60   ppdata = (ppdata & ~mask) | bits;
> ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  61   *pp = ppdata;
> ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  62  }
> ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  63  #endif
> ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  64

The provided .config has CLEOPATRA enabled:

    arch/m68k/Kconfig.machine:config CLEOPATRA
    arch/m68k/Kconfig.machine:      bool "Feith CLEOPATRA board support"
    arch/m68k/Kconfig.machine-      depends on (M5307 || M5407)

while ppdata is not provided by M5307 or M5407, but only by
M5272 and M5307:

    arch/m68k/coldfire/m5272.c:unsigned short ppdata;
    arch/m68k/coldfire/m5307.c:unsigned short ppdata;

There is a similar issue with NETtel:

    arch/m68k/Kconfig.machine:config NETtel
    arch/m68k/Kconfig.machine:      bool "SecureEdge/NETtel board support"
    arch/m68k/Kconfig.machine-      depends on (M5206e || M5272 || M5307)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
