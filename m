Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422118;
	b=fzqAS9TJS1MtTlCZpc6T4X2kgaS8516QebWN06dL7TGgLYastMtqD1WTY+595+pe4kmP
	 sG4XKA/u/YtKrROl2H5P4ycMu4V1zLThE3CQalbitl7hySB4BmrKaoJqclOzzWIE2fDKU
	 lTLn4t8TGsbK+6tQtgiKF4YtTWAYuhfRxfSMSrIWTZkfCaVA7Qzy9GyMfQYEU7hjBKOlp
	 UoXNTz9UKvML1klFZ052UvhjCK/Ac9y7f1oBk9OBVic0ksbCdWsHRqbbR3iJj4bp3rcSJ
	 dAC3JsxG8Zj+Er+bdO/aA1LXveyD0Re86wwTNsGtyGod3Z3sKPHQeuKW0HfYVLcibig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422118;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=V5Scv+S8IrXgj+5/CeTTqsxC/iiG0yrpaL3kmiKglBQ=;
	b=euxHnQQsCz8+msi+ZDFL9oxvWQUgZSJHOYcw+8bMXYd8JhHF/w83sNnPuzqN/pjqUcaW
	 3LSEARw+M4n33P4yPT0PXAn+dSmxmOKyfu7HG7VnXeV2UZYgfUpes03pmqw30oNxC8dGQ
	 kY3cgv/e/ikKEoqovYF7jETwDn/bIsLojy/Xuya4Lk+GNB/Hu9jv7105tCktmRWA0WGL5
	 nUEaf+sAreLHlR7KfvuKRChwyy9AK4U3n7RvE51ADlv2+W6ptnG+pNMtJfjkmulyqHokH
	 ybh0yfWrsF6vAjKFVBttE/b4ZS5fM45yiaZPO2d/bm9LIe15PFP2J5xkmOi+Db7/VLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166C7607AF36
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 15:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166C7607AF36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so131504e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 08:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422116; x=1793026916;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V5Scv+S8IrXgj+5/CeTTqsxC/iiG0yrpaL3kmiKglBQ=;
        b=MwsjETDxjUFHpLyOT6EWMZU3Df3lPyDP17KUFIbgJsI3VHmGj4CPjQvOhvlmIs3Ev+
         cSr5LIG9Kcd5LGTUPy8jC69JFw7y8IzpMHjupBW0hUShxmydRLtMWWJfVO7EvK0GusBp
         9FP1e52+iHFr1Cru1jsfX3adILarvejP7qCER7kYDqiAzGyTaxrEfSqL+5klSekGzLub
         tL2GS8za680UIu601MfZ1awOBecXKzq/iyd6olxky5rwezCJyVz7WhZ0AY7TkQ/q3nQN
         /XVUl7YU9OWTZldT5Ipr4OnnAzrsKDnumTYNupu0P3aI4qczWH8DDiD7oI3U9cGAy4dx
         rIeA==
X-Forwarded-Encrypted: i=1; AKwUvBxQMPToQvxaWEvP/bO/9iQ35SDj1addUZAKmz3NNKaxDnGIZNxV9m5Tbf66U286Rc0Bkc1xI3nZBwFEl599@lists.linux.dev
X-Gm-Message-State: AFq9FYKPCl44+PrT48G6VA7FKXNjRc0qYR0/MxX9eaD8cKpA8Oi4Jk1Q
	pC75g0xZsCqM9RQJ3g/vfsD96bwSdNwWfJRZCBACVv+JvileQktUmkfvBnDA4UNth8M=
X-Gm-Gg: AYBFou05sVBGmZk5i+7pnwmZ1QY6rztSRff+IEtmfyFKaxjGK2uMjq3eLes63CSbpsA
	dxsNbZTd0YSVByLixRT4QDzhlZSDGuIfc+INACbjJWTGbcUpSVRwUjy4F7LwWWIRZTGglxfI741
	eeG7Idfd4dgK9SFeNVW8A9TNFQa62l/QOIJc7XImMh4Ix+OqyzKzZ9CLSPPTxmhO77tUs8VxmzR
	f97A4hHxUH3BXJ+6T6VXMpGm9c+8d0QWu4fhdwXIEYl2ig6U5TonOe9+ZqIFitR1L3jgpKEMaAz
	CnK8Pd010ijggzk/DefIjOb5sqh/5wAI+IQVH+Z8qGMf9YjvyxnDSFihIEMo0VVSHSfXUeHjlpv
	u6Q7s8LA1CwsA/a1rHPgDoRNisBtipfGCbNFYBR6cHvPfJcf4F8lfgiV1sGXcBTKKIseO1TAR8p
	nIYlhGPv/VGHoVexNDi8G1PVgy6QcTbnb8EJ7Qv/2JKk0TgZYjByQnI7CDmERJN1c9PPE7o944E
	K1fHTaviuzoVFlHR9KotysXCpT4p0rJYUgYrDtW
X-Received: by 2002:a05:6122:4f9a:b0:5ea:c984:5ad4 with SMTP id 71dfb90a1353d-5eac9845f53mr826652e0c.2.1792422115422;
        Mon, 19 Oct 2026 08:01:55 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b476852sm10350661e0c.6.2026.10.19.08.01.54
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 08:01:54 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaa1b5b84aso2618146e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 08:01:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7RkU0+MKg0L1gmsEWAaTMmmVbYmRBE7fjwzvVgIxJlKYia35/HvfjxKXZrfrX4XcqRmT9xvaL1v3UJB6p@lists.linux.dev
X-Received: by 2002:a05:6122:25f9:b0:5ea:bc01:a2f9 with SMTP id
 71dfb90a1353d-5eabc01a9b5mr1023930e0c.0.1792422113935; Mon, 19 Oct 2026
 08:01:53 -0700 (PDT)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261010065442.23780-1-rosenp@gmail.com> <202610131201.wWk11MLy-lkp@intel.com>
 <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk> <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
 <alpine.DEB.2.21.2610191519120.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610191519120.22065@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 17:01:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCKXN5PiDwRJiEj9aBGcU0J+H=q5tQoO7OfPEboCWGJg@mail.gmail.com>
X-Gm-Features: AclHuK-kMNll2TJ6SQ0HmyWWYBoxtNWt2Z3yCcXPLPClFSyKDfXs1dfr7tIH4kE
Message-ID: <CAMuHMdXCKXN5PiDwRJiEj9aBGcU0J+H=q5tQoO7OfPEboCWGJg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>, linux-mips@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maciej,

On Mon, 19 Oct 2026 at 16:47, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> > >  So oddly enough we're missing Tx49 support in the toolchain and we've
> > > only managed to survive with CPU_HAS_PREFETCH enabled for CPU_TX49XX
> > > because it also implies DMA_NONCOHERENT via MACH_TX49XX -> MACH_TXX9,
> > > which in turn disables stuff in arch/mips/lib/memcpy.S.
> > >
> > >  Quite straighforward to fix in binutils since docs are available (as in:
> > > I have a copy), but do we have any users?  Geert?
> >
> > Yes, I still boot test rbtx4927 regularly.
>
>  Thanks for confirming.
>
> > I never touched binutils sources, though...
>
>  No worries, this seems straightforward: just PREF, MADD/U plus [D]MULT/U
> extensions, and DERET/SDBBP debug stuff, much of which shared with the
> Tx39 we already support, so just a matter of sticking another flag onto
> the existing opcode table entries.
>
>  I'd estimate it as one day worth of engineering effort plus maybe another
> one for machines to work through verification, for the binutils side and
> the associated changes needed for GCC, i.e. a `-march=' option update plus
> maybe enabling a couple of existing machine description patterns for the
> Tx49 too.  Would you be able to run GCC verification with your system?

The rbtx4927 is about the slowest system I still do regular testing on.
It uses a Debian 8 nfsroot (over 10 Mbps Ethernet), which is the latest
Debian release still supporting the instruction subset suppported
by TX49XX.
So as long as no native compilation of large packages is required,
it can be done.  I can also give you remote access?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
