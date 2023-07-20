Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7A1DDCE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 16:31:05 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so4491141a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689870663; x=1690475463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ru3sLDNmYFNjzH9CWC02FN9HFpPBpy7nrGJ/WVLA51Q=;
        b=FDp8Ts2c5nbBA12pHvaiI98wAuONOeqgT/q/9AM4t9yvrNW/02GTKyfC9UgvJL2xo9
         VIlY3hR4abL1F3n4C7P6SByfTzDqv9bKTXgOGkAU0lqFHIK7YGBc46yR83j75bA5K1nj
         kRAGX3MZFGr3q2G0yMkCU77+tBaDrOcm4tMTokvQNcf4U/jjGOYT+PaZhEtemxcFghyf
         yo/LdjqknzCzPqRo78rvo4vMBuSwoYd5T3iNB+5hVslED9VDizXaS8wHlDWvxW33ql8S
         Khh0umABX5K53xfslcFqV5VQntfT9HCgidrQm8I2gWHsT351ZrHCsLNoFz06XtCPX9xx
         FcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689870663; x=1690475463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ru3sLDNmYFNjzH9CWC02FN9HFpPBpy7nrGJ/WVLA51Q=;
        b=ORYYI7Zmve7t+r5eEYo5HPrJ3ASa+g9Ck3G00OgK4NF8fiNk+QkuS8PzX+j3f40HVt
         Djp0izd9AbkQLeTib9asUYX8Qzn6N+tXF6hEcEfxBFE3gYaLGjg361f/ZDAqnDq+LvpP
         0NMLI6FA9Egdup6hWiY5JV1dmuSiVNPWetB/wsXfSkBeNvixbMUVlv6dsmk70Li9BoSW
         ERdK90kT9qAsd00yWd4ma+4pH6V34f7dOkxrnsiSl4FnSWTE6xpqKuiZn5zdbxiAqB/W
         WTFpcibkmtzV54wQXRLYH3Lpn3GxifVXvZfd0XW3ZKOdRqNCCThznoP7/BBzgyjed5j5
         jcOg==
X-Gm-Message-State: ABy/qLb1G1XD49eGi9jekcrJfxcLgkvCK1O6fYyjtLcKHmAv797SaTiP
	k+IQGFLvF5canZ2cUvMxmjzGOoBoxpKAfDe7Zw4=
X-Google-Smtp-Source: APBJJlHwvqOuGJQ86PlXXGUqH6U918TRE/87sBooJnbBfkSdmuwYMiismKaRhFZ9LeDOwZL4XpTcEQvZ2M/Ev1P+Pzg=
X-Received: by 2002:a17:906:779a:b0:997:e9a3:9c4f with SMTP id
 s26-20020a170906779a00b00997e9a39c4fmr6605482ejm.30.1689870663618; Thu, 20
 Jul 2023 09:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307210041.jT6femhS-lkp@intel.com>
In-Reply-To: <202307210041.jT6femhS-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Jul 2023 19:30:27 +0300
Message-ID: <CAHp75VfKuvcih6ZZ3yiOEO0E=GF_g7E-kWVocdeWQ6L-pXkjZg@mail.gmail.com>
Subject: Re: [linux-next:master 2315/3762] drivers/iio/adc/max14001.c:81:29:
 sparse: sparse: incorrect type in initializer (different base types)
To: kernel test robot <lkp@intel.com>
Cc: Kim Seer Paller <kimseer.paller@analog.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 7:14=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   c58c49dd89324b18a812762a2bfa5a0458e4f252
> commit: ba2c3e63b681b624e0158775620ee2f89cc7e266 [2315/3762] iio: adc: ma=
x14001: New driver
> config: arc-randconfig-r093-20230720 (https://download.01.org/0day-ci/arc=
hive/20230721/202307210041.jT6femhS-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210041=
.jT6femhS-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307210041.jT6femhS-lkp=
@intel.com/

Exactly why I asked to elaborate on the algorithm documentation and
hence developing proper driver updates to fix this issue in
particular.


--=20
With Best Regards,
Andy Shevchenko
