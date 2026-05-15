Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E13491C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828752; cv=none; b=CxAxibiDlWGNyn5N8OMLbHiCSMTxHcMrpvpNXgZeEco2isOLRgh8LuzCyjzE8TJDiXOqkjlW7/+Vz/yiK7gCkg342jMZA9hWG0LW+rAgP3oEB0iHVUtFbmpWV+XrN7EnlTskJScQvySUailLceLEci9hnf6iTDNMDAFhO0uazIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828752; c=relaxed/simple;
	bh=ifUKlNiqiIUz6XuEs5a2WjApsp/Hmvclo3z3YNXZBv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIbhBHMDvAk7hQOhIpT8nRw7VI9Y5YqiRuB7v/hlkC1sV3VE1CznH49Vw+fa+W+Kw/alE0dVRjO6EjAMGvw1vX421TsUogWrlFHsdnPqTAw65HqpRc2rSvZrGTadYjZC6Rrxkd+yozNC3YhSGtTt5uuut4kj1Kf09QJQ2FLhrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-63169437ac7so4515595137.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 00:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778828750; x=1779433550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yshj5iEji6JLc2OKVLHN4BTSqq//L6ZmTdh1vW6YdzY=;
        b=Bxs88efdfUDE9/ywWG4IDu6NVBThk4OiDvrqwSLspwrnrybXwNKrrjNDeWBKI1wMKP
         bHFpx+pDRYt9StQvb45Ldz944cg11gTXISiLTIVxng4IymFLgrZwpl5iu4f6SZwN8x3G
         pbC6foxu1XataRn0TcPMEoGg6IiiN2PU8G7m7a4xghZFeKCAI4J5+JLrd8jnwX6itkwy
         /d3wqdw3o3LTR7IdxanQy853AQH+5DLY/cZhtB+PGkjUt/sIC8UJTFkieLavPnxLq49g
         zUK6dyKyrujpEroA5AME06GHa5Z7/qj4ksNvn2aohLy0TyUFajDuIp/Z68y8PuR9RPWH
         tz5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8VueIMxey96LsGZUdnNj0ou7lDTGpn8aloWE1PgUnJrhw3qPVVKBAX3ocMSibOXAyLDoE39VXVoXwjIZ3Y@lists.linux.dev
X-Gm-Message-State: AOJu0YxNcDa4Jgne86cGvk+KGCX9A2zzPEf1fxahqXx+OjL62CoNGAge
	q9/rT3Rq3VhPX7HOWAYrVeu5rLO2ha7runppilZhsycYK9qYga1Ryro9bPOA2xsU
X-Gm-Gg: Acq92OHIwPPOER8bF4gtyEAkuqNEwYVD57tSy5C+JVVVUIaNXT/54WMbyarHVjJ25y9
	R9qn0VQ/jL/xWSZxu28GIhdof8LsfXsqEXnmb1Jn0GYKEt2RRBFbWyIFMhKyS91drCkAIA6Esp2
	KM2OLwC0VeeZG8xgxH2kM6buYrA/YG1dE6K1k7HATGKbFlJGEkVPRHzH6XsO6h1/6wyp1z34F8V
	5Ini1GK5nJMUCm5QL4vobTVO7vayrT2XiGWS6z4qqdizFs0mlXEXwoJKzrBfURjDafxu5QJJigQ
	gYl5ZCnDGSyUuHP7zgwYNjgXmsM7b/v4/ulhqMrYgzw99S06Bnztyq2IYj+rac2u2h5yeJ3FJ6Z
	jVGdufG+wLFhVGUP7ZFZk6pD2eEiFv+6xsaGQaklTxG/ww200ETeJ+H1Y6mUvN/zHvNs3vT43Mw
	IBzBS8bj+Xx512NhreXnKBUzbCV00DFn9s/+mA5BHPjpNQb13fN+eZDHdLYVGG
X-Received: by 2002:a05:6102:cce:b0:633:4d1a:65e4 with SMTP id ada2fe7eead31-63a3d6345a3mr1298235137.12.1778828749802;
        Fri, 15 May 2026 00:05:49 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2f8aed0sm632291241.8.2026.05.15.00.05.48
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:05:48 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so4761716241.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 00:05:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ94ZLXoldePQ070Jl+ejH7+Nd1TuvQHA/ycgvE7O9kgKb2vDUUkqr1FbJ4uI4mLc3i0xcg7JsXUz0u9OksD@lists.linux.dev
X-Received: by 2002:a05:6102:41a6:b0:636:984a:1e5d with SMTP id
 ada2fe7eead31-63a3d4294famr1297887137.11.1778828747821; Fri, 15 May 2026
 00:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605141850.qvidrpg9-lkp@intel.com>
In-Reply-To: <202605141850.qvidrpg9-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:05:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkjDh7Cb00ysqqzhSPBMw19e2LnppADp+n20ot3CUZ0g@mail.gmail.com>
X-Gm-Features: AVHnY4JSunA9_0F0sJoSz4EwkRZ2X5U1fmE09DgBP_ROwuACXVhOPHYiGr_bN2E
Message-ID: <CAMuHMdUkjDh7Cb00ysqqzhSPBMw19e2LnppADp+n20ot3CUZ0g@mail.gmail.com>
Subject: Re: drivers/char/nvram.c:56:21: warning: 'nvram_mutex' defined but
 not used
To: kernel test robot <lkp@intel.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 12:27, kernel test robot <lkp@intel.com> wrote:
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   e1914add2799225a87502051415fc5c32aeb02ae
> commit: 25500ba7e77ce9d3d9b5a1929d41a2ee2e23f6fe locking/mutex: Remove the list_head from struct mutex
> date:   10 weeks ago
> config: powerpc64-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141850.qvidrpg9-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141850.qvidrpg9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 25500ba7e77c ("locking/mutex: Remove the list_head from struct mutex")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605141850.qvidrpg9-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/seqlock.h:20,
>                     from include/linux/mmzone.h:17,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:18,
>                     from drivers/char/nvram.c:34:
> >> drivers/char/nvram.c:56:21: warning: 'nvram_mutex' defined but not used [-Wunused-variable]
>     static DEFINE_MUTEX(nvram_mutex);
>                         ^~~~~~~~~~~
>    include/linux/mutex.h:87:15: note: in definition of macro 'DEFINE_MUTEX'
>      struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
>                   ^~~~~~~~~

Posted fix is "[PATCH v5] char/nvram: Remove redundant nvram_mutex", see
https://lore.kernel.org/20260428061540.73668-1-venkat88@linux.ibm.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
