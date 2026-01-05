Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAFE31064B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608312; cv=none; b=MYARv520TbRNXre2Yz/eV+pjZq5q6WDpTwnWhlDzxJssF1qVnluI76PbHHxsNr6/tiDKYDfwqh26ZOHh+RyJVSF9SV6idBmOo+jFWFKgrYI+2Vdp3DAk0yxxUF681/3WrTeh9hqOOXXtg+Ktw6KuN0tCx4CY6RWZusKNy4P+RfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608312; c=relaxed/simple;
	bh=/zvuWHM1k4odcHvcqxJJ1VczO0tRQWELExsu9oh7CMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwAw7JmwojCuEWl5isMjAkReR40xiMN5BAHk9jjQs+ktWAizsY+XkuDXftbCMGAFpjMS7xL1vTr++dCAqXbxIMaVDJU1M5NYGhusyCQS3fqe4DlJxcnmu1W7G9mMOUmYO8aE8NbjfKL4f8dV5YdGMZuCa3/LUEX23VXofP6MHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so6240439137.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 02:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608309; x=1768213109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mxgg0TVTriwmzO5IEgl3p/Leeual4hKEowiAsVk7T8=;
        b=NXV/JZiP1t50TzyzThMRq4gsox87fnAMlIW7/wy5/fChiJSVGDZ365lWGhbOtl3j5y
         KLxz/9/WLTnGsorBI8MJRRvmY+ayLHplV3euJmwXn/3mjKXZwC3KD3T8S2Uh8hDMqbwE
         Cz2wzFRkfzch3dxWjZDHhRuZCv8Pp6QrWis+D7c6IUDIwKicGNLh/2afFZzIV00UAJqf
         sQvg1sjVRbQ86cgS9s6B0WZBA9E2sJ8oBe241Nxmlkcb4S1UXQbEJLqCmg9zxmYpUr7D
         MIO/39byiBz9BHHGo93XyVxSXiY6OB6dTpyMLb/ZM1HrQpP0XUJv3anOI+oJY6SlyEmg
         NIxw==
X-Forwarded-Encrypted: i=1; AJvYcCVX3xJ/agmfGCRAAG3v3ehZFRRJyYnyombp3CB5S/7+K/ETJruxZnU887oqN1/K99MsNTiPR8To9lMu3Sdd@lists.linux.dev
X-Gm-Message-State: AOJu0YzvhoOHUm+LhF3/CmS48jIcQNl/jHbOKRuHDzFpZQYO21KntLtt
	ioHb9pejqiIhz7yaqTZcItsWXiMGYWWkZHxk6meSe+p4wqlGVQ6HWwy4W4VL+W73
X-Gm-Gg: AY/fxX5nL0kloWk1sJZd+TNfCpPnpLb+nGSsNels98+zCA+lHV05poJvdKm4YwCyylV
	cu7rg/TkDrnkfqG42Zk5OwAejmwJucDzE28scyFYLq/+qmTkIR07dlOxfSPv5tI5Vv4gJ6p2CQl
	j5sKHOxjmdQqWEW2Zlxm0JxUj5YfelIheQ2u5em8jqd5DN0vVWAQXoLS4kwlgPOaja2dqaqjdfP
	CRfFH6gI3ne5YJrHMtXqXj70j5PARh4rCcXWD7lzR9fp2+eOY3RjrnQZIkjRP53yCPb3gZg3Dw+
	uey9hgsd6wpfte8yNfTwMh2PpYK5ImfNzW+UKgkRxkgXCpKSCeSVy3EOIEkWgpewDU2P+AbMqxG
	TJKYLvRuuCUp3NoBGprtl9Jdeen+rDMNYgGgTxvY/Al3iNy6H3lkcJMiG1Z29cTzVPCJfDeO1dc
	S6VL3UUrzF2NJDO0P1AQB/x149vguLmu52Mt0G9WXr3BBWeCo8AcfV
X-Google-Smtp-Source: AGHT+IGN3k5oo/RDTXZdeUgFK7FIBOvNSD5KAW/QnG3U2/Ohe+XDRaQKoCUmGSmYf/6/SBt5CCN0jA==
X-Received: by 2002:a05:6102:2b88:b0:5db:dbd1:5540 with SMTP id ada2fe7eead31-5eb1a630f39mr12988227137.9.1767608308781;
        Mon, 05 Jan 2026 02:18:28 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac90a6asm14651580137.13.2026.01.05.02.18.28
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 02:18:28 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b265f5122so2518809e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 02:18:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzHNJngvbkkMObxCz8Bzv/MFQ99uT94ZjN4XVoc6nfzbgILCF3PbpfK0FSU0eIGn+knWTS1jZjfMOw4b+j@lists.linux.dev
X-Received: by 2002:a05:6122:4692:b0:559:6960:bdf9 with SMTP id
 71dfb90a1353d-5615be91e87mr13750452e0c.16.1767608308216; Mon, 05 Jan 2026
 02:18:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601022306.Dll2Dylo-lkp@intel.com>
In-Reply-To: <202601022306.Dll2Dylo-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Jan 2026 11:18:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUx36N=-36v0wj8T20qgM1_SxJM_=NWUNjLVqLhj9P=SQ@mail.gmail.com>
X-Gm-Features: AQt7F2rkDIujkbNgRwKOsOO6bLW2dwWAQ6OBl6PAT1wTZ-WAPicfKwUPCq1-mk0
Message-ID: <CAMuHMdUx36N=-36v0wj8T20qgM1_SxJM_=NWUNjLVqLhj9P=SQ@mail.gmail.com>
Subject: Re: fs/hfsplus/unicode_test.c:43:2-7: WARNING: NULL check before some
 freeing functions is not needed.
To: kernel test robot <lkp@intel.com>
Cc: Viacheslav Dubeyko <slava@dubeyko.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Jan 2026 at 16:18, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
> commit: 6f84ceb98538523f49d544aa7c671c87cc23d1b1 hfsplus: introduce KUnit tests for HFS+ string operations
> date:   6 weeks ago
> config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601022306.Dll2Dylo-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601022306.Dll2Dylo-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> fs/hfsplus/unicode_test.c:43:2-7: WARNING: NULL check before some freeing functions is not needed.
>
> vim +43 fs/hfsplus/unicode_test.c
>
>     39
>     40  static void free_mock_str_env(struct test_mock_string_env *env)
>     41  {
>     42          if (env->buf)

Perhaps the intention was to check the env pointer instead?
Note that it is (currently) always a valid pointer.

>   > 43                  kfree(env->buf);
>     44          kfree(env);
>     45  }
>     46

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
