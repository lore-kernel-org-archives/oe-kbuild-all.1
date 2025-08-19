Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB682BD04
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755613617; cv=none; b=TmR4voj19xT3lq5H0jzak+VkcH5ShFU6zMCv1c/7nkZIrUSsMUVkmdCBR2+yE1xK3KLdFT6UuO/n6Dy8HOQD0q1z76O+1V7bpN+m2LBqfRzuuQZixFkJRAFiCn2JWZk1uHRfGv5KXQz5bknbkfROSIyRExxpWE2QSPsJvVcDYfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755613617; c=relaxed/simple;
	bh=vtBXPEwcqA40EUYYhlaLIYVuMj+y2nBWUemyMy1a9Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhumTX5syx9iTaqXLAptmO6gDZB5Maxjtuhr5CXgIfqdV4bO3HkhU3QLQCIuM+lFvmOo5fWMa3raRMfwuIpOKiCK5uxE4gAQgLAUExV90AA3m1Eaug16M9TIXP9sdoenROENuJQU1WBEx/X3I7to0gPA4MHxXJGhPWG3z6JTLO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-50f88bd4b96so3659617137.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 07:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755613613; x=1756218413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSDkMZAc+CmpIlhVdM0QhFKI57038VAyxYM/0TvLlJE=;
        b=w3OLfXBFDs3PcTcwkW+3F9xKQy/8sR4jPCoPxjjMNc4wZDs6sshIuV9zVO1JdX/j8C
         13tvOctkxggC7xnNUPwZnWO2zimcDAcqdch2cecYuEsmKfQtgifi/ThgzbgRYP0SHBem
         tWzLU/4/VGgwk/MY2+epf5BVMGJNM0YtJHh4vpE5BwKGeZhIMySF6hosYLUsMYQA/1pQ
         pJBuJsDusCm2GDdzXDfF8a7pwR55EvVzbzRZQbBKY/ECHnc1L3jupltV42W8M298TQae
         uslW3DFwfYdN4bzy0GwtDBU9sLRYx7UgnQseenaHcSutyh3Fh4q7Y9LGYg1lxATltceu
         gHyw==
X-Forwarded-Encrypted: i=1; AJvYcCXF+6nCaL5WdhZAjH26VlCNN9orahgDMbGAEPi5IC1uczhViBMgjJNKQz+TNeN1tVHt5e9Th7VjGVC/Rpfl@lists.linux.dev
X-Gm-Message-State: AOJu0Yxib4RFKqAiLBn6Sub8POvhBRlBx7Szcsv7XECIt9/6gfX5CBMy
	f6xodPa3zcF7lsrv3zibPTu8Lk+O+mUIZdbVwr0TlfzerqBxNQKI8rHq0tbfpXb1
X-Gm-Gg: ASbGnctxROfah43kK00XGD9/ubXxHk1httIvk2KSEDch4U7/FhKl1Nkx7FK6pmtRW0e
	6y+fIaDR3LzwK75fS0DDXxkMCbZIDHVsNL516uk3rvsFszpypoKhpwKCM+L5lTVm2AnJ1i8i5BW
	mp5f81GJg/lAbAKMyTh/WCgd8KYcCx7JUsWwaBQ0QIt0se1Z8cMG2Bp0Af2KaSonNhGLgsvCqSq
	vz8wWS6ss9qL2RKD0uHyH+vCWm7o8pGoO/K1MwoKQHD+AsPe+eRsJ/BUxdFm7ItNbB85TPt/HnA
	9G/w6oOpMqBJlcdDLfaemsNlAGbqZSsw64zga+3nwECWzdLz0oHP4VB0m/c9gDqaIbAPYz3vFLM
	Kp8Y1uYKJlzNSY08Kqycs+FRr5WdiZyvXo/HdyIeJ/5PyRnrWUemoUsAazuIep5mNP/nEo2Q=
X-Google-Smtp-Source: AGHT+IGl6MySuMZ11nPqcl3PisbPRQWR6o7OKoxJjcMqNHzqf9oNjrsE/ISRGi+foCIlz+Zwb5YG/A==
X-Received: by 2002:a05:6102:6498:10b0:519:534a:6c50 with SMTP id ada2fe7eead31-519534a72f4mr515636137.34.1755613613003;
        Tue, 19 Aug 2025 07:26:53 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bd51987sm2602890e0c.4.2025.08.19.07.26.52
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 07:26:52 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-89018fcdcd4so2928547241.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 07:26:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3YjC22numF493wL2T1iT0IbNRI/XYADHcX940S0t4hDKFVJGZyGUWoZqB2Pu8rPydQl3BdT8mh5MOtiQ6@lists.linux.dev
X-Received: by 2002:a05:6102:3048:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-51921bfbd45mr842694137.5.1755613612545; Tue, 19 Aug 2025
 07:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508192154.jtZINmab-lkp@intel.com>
In-Reply-To: <202508192154.jtZINmab-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 16:26:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQqsgfG-1ued7guLxdzDdKodZuxkuZh=JCnsgt6d0Mjg@mail.gmail.com>
X-Gm-Features: Ac12FXykjQ-V5GKAtiYNRC9m5aHHyZFU9Eh9BL1ezS5rUvusNbqwVEOq0wVVQzk
Message-ID: <CAMuHMdUQqsgfG-1ued7guLxdzDdKodZuxkuZh=JCnsgt6d0Mjg@mail.gmail.com>
Subject: Re: [geert-renesas-devel:renesas-drivers-for-v6.18 1/1]
 drivers/soc/renesas/rz-sysc.c:113:16: error: cleanup argument not a function
To: kernel test robot <lkp@intel.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Robot,

On Tue, 19 Aug 2025 at 15:54, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.18
> head:   75601ffaea537c3180f23912ce1d0ed5f716469d
> commit: 75601ffaea537c3180f23912ce1d0ed5f716469d [1/1] soc: renesas: rz-sysc: Add syscon/regmap support
> config: arm-randconfig-001-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192154.jtZINmab-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508192154.jtZINmab-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508192154.jtZINmab-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    drivers/soc/renesas/rz-sysc.c: In function 'rz_sysc_probe':
> >> drivers/soc/renesas/rz-sysc.c:113:16: error: cleanup argument not a function
>      113 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc(sizeof(*regmap_cfg), GFP_KERNEL);
>          |                ^~~~~~~~~~~~~
> >> drivers/soc/renesas/rz-sysc.c:113:58: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
>      113 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc(sizeof(*regmap_cfg), GFP_KERNEL);
>          |                                                          ^~~~~~~
> >> drivers/soc/renesas/rz-sysc.c:113:58: warning: initialization of 'struct regmap_config *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>    cc1: some warnings being treated as errors

Thank you, adding

    #include <linux/slab.h>

fixes that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
