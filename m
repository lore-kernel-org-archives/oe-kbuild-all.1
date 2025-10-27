Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CF82F3C3D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761560539; cv=none; b=VBsoKL23HoDEIj4nGFd9iik8m3to9p5brb11t/rSfXekKkz/hWiYitqFk0BnSqnUjoLgZgRwslNX+94oa05m5ZxxNQoywHrzSmrCoRBSdkOjXQ+nV8JN7H96eeP28sdRpx5JMo3bSfCEEf9Yhe7lIy3YSwzTyGflFhLWdgCJNg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761560539; c=relaxed/simple;
	bh=hA4Y5y9eyPbbNJjw3lWOGza4GJyLBBv2tFQmIILKANU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQRYKC/hvAcrbZcM52DU4lYWovXDR8mSUbQWKCq8TbbBrvVhvBVH3sZ4U8NXDhf0U1a9fvO55X2MznSZoXx/gs4pBAo53kBS9KpWmLODNKrimP/ePXY/VF85Nkh4weiAqRHsAzGEnUp3x/Jgancvq0i4kKok95+MNcB7MdLAaXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-934c9de5cacso1683246241.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 03:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761560534; x=1762165334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpRhztl5yGUADah2U0CZ74pjALefcmDaH74Bx7Y9Njk=;
        b=Y3AeVRM56QhJE7F26FVlX7QBT/OjtO2L3t4IfnqTN2HsS43ktFxbotCUsBqEtWL8zO
         kcIsSFSPuBR42EPgZ4WVCuD20F2MyFZUbsmUKku5Mj+AGWKURtsvWh5rKuv52tv710zg
         uAT9X4jWVW09003LOEi/vEPv9fHrupAv7biGCVMvzUPeqkCuGC3sQIV2W1WZYYuiNOK5
         mPz1+EsANYfwl6QKL9Rswa66WkFpxBk15dCC1wb7oEDu3ELozdPaNXAclwCX6cGBvBKX
         zy47n94cTeUH1nNjILtUDMyFhcaZ7jlIUpjiYGHA2KA0sCqBpNdGDmFAZT1OxbEvS7CX
         AGNw==
X-Forwarded-Encrypted: i=1; AJvYcCUcuvWQAUDbJuzD1n5ySDXfxZczSdtb9QhyQNda8mZwSH9ZLlgV3RuA2f1Sl5GwZskrxWd2pf23A9Ca6SyO@lists.linux.dev
X-Gm-Message-State: AOJu0YzL8Y8rXwwQ1KTNW4cIcx7dxf4EKbzDNnXtd/RI8EAybQGLsvhA
	Pva+rdbMD9JCJJyNoOU1w+5Ym8qmkqzA8YRL1BSYUGMOEimq3W5eowcegNC/kcE5
X-Gm-Gg: ASbGncsJQwwYEptay6z5KoNBAAKEJRZty7dE1odrP6I+yGH6TfkyZPqGZCrbbtiRerJ
	RaPmH4/7sapimw2/F5lPSov937ByO2iLZAL3imVb8dmuctSPRpYNPZgUrvR12lHoDJ+QuOAPNU0
	eSIMflkNYxlL9nWcz5z5nOCR5JGP58wELB41NX470gCf4+dS5XqPCXdUFSaKbfhcKv8nIKvh1q1
	XuQW7VZxaUeBbXlXZMDjTDxpSOwfxDrmJoWz/+PPIcjctrp0UCtzRAL8OzUx6hih+tl6SZ7qzoZ
	VXWrDd6Uc3fgaNhJiHJSLjUp6O7+72YYHNO1qUtoKqPavpmgBp/WeXYqYPy7UcbSs2lRkObf2np
	sAyig0Fo8SQddiRSOvzFJB0tn+InjLU+eecpsuPTWm91tdii3fTyiPj7z3FirnC/wEC++twWIKp
	FBtRKEOB7f35sZ5Itx2bsjYGEtLwQn5kPclGxNP2aZywZcgSCx
X-Google-Smtp-Source: AGHT+IHPjEXJzQ2c6Jw23D4ESEnM87o48XkPHJFD9zLg/Sw3mYRvkXvw6wJS4MkTR9K9ZqilTPhHzA==
X-Received: by 2002:a05:6102:418d:b0:5ca:a978:8a with SMTP id ada2fe7eead31-5d7dd6d63dcmr13222297137.33.1761560532729;
        Mon, 27 Oct 2025 03:22:12 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb9c3b8sm2697116e0c.20.2025.10.27.03.22.12
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 03:22:12 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-934c9de5cacso1683224241.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 03:22:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZk0rkb7hmWwraGCRHIiuI/gqFM2Jmqoxx4AlpRyciDHSt9fWfIOeydixFwIUgZtYY6g4sJy/Kmv+/pKA3@lists.linux.dev
X-Received: by 2002:a05:6102:4243:b0:5db:350f:2c69 with SMTP id
 ada2fe7eead31-5db350f2e78mr4456633137.10.1761560532379; Mon, 27 Oct 2025
 03:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510240817.vt3eQ3qL-lkp@intel.com> <265B8FE9306198E5+0131c750-3995-4158-84e7-ad73792e6934@uniontech.com>
In-Reply-To: <265B8FE9306198E5+0131c750-3995-4158-84e7-ad73792e6934@uniontech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 11:22:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeE3xQKkyLWDxoaA_E=cukZSz6UvvjJF0vsbRtt0fVgw@mail.gmail.com>
X-Gm-Features: AWmQ_bkGtOS6n5Tt95yA4b1F79G6tzC66mnufa9EUYGGpFJKzTdqD0y2RmwXxEM
Message-ID: <CAMuHMdUeE3xQKkyLWDxoaA_E=cukZSz6UvvjJF0vsbRtt0fVgw@mail.gmail.com>
Subject: Re: drivers/hwmon/gpd-fan.c:231:9: error: implicit declaration of
 function 'outb'
To: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"

Hi Cryolitia,

On Sat, 25 Oct 2025 at 15:49, Cryolitia PukNgae <cryolitia@uniontech.com> wrote:
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   266ee584e55eed108583ab4f45b5de734522502d
> > commit: 0ab88e2394392f475b8857ac82c0c987841217f8 hwmon: add GPD devices sensor driver
> > date:   6 weeks ago
> > config: i386-buildonly-randconfig-002-20251024 (https://download.01.org/0day-ci/archive/20251024/202510240817.vt3eQ3qL-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240817.vt3eQ3qL-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202510240817.vt3eQ3qL-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/hwmon/gpd-fan.c: In function 'gpd_ecram_read':
> >>> drivers/hwmon/gpd-fan.c:231:9: error: implicit declaration of function 'outb' [-Wimplicit-function-declaration]
> >      231 |         outb(0x2E, addr_port);
> >          |         ^~~~
> >>> drivers/hwmon/gpd-fan.c:244:16: error: implicit declaration of function 'inb' [-Wimplicit-function-declaration]
> >      244 |         *val = inb(data_port);
> >          |                ^~~
> >
>
> I don't understand...... I have already added CONFIG_HAS_IOPORT to depends. If this is not enough, what else should I do?

Missing #include <linux/io.h>?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
