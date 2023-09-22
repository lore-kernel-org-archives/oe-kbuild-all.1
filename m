Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5286377
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 01:53:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4052755d5bbso17850465e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 18:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695347595; x=1695952395; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWG5Cr/URo6om9dDoGNWRX1ofAGukQSqmfRjr+ASakU=;
        b=fj0swfYb7WlBVyNKI3TZDdFr7Q6nnAxMKrEOtReF/zPDTS40MJXN1waK5WGl6g+I1o
         P4s4W0lfRHQBzKTGjnZtPg0buY6X53tepGTaOwUgppbMevBXrPvNQjuHsg5umF+JHJ+U
         KTx0k7NVH5KbKgTgy+Hoi6FL7Rw4jIjoi80u9G6rMH1tE59byJUC6ylJ8x5aL31l+PSn
         e1c9T1hf/TvSuWd/ttCGa7pXU4UPITv94m83OPQVf2wefytGkpSVW3c6mUYWTC3UY8Zp
         JvGfTzgpIW5JsPybMrDhYdgD0nuGen2ziLTNsSJ2J1O4bAwyzAiU0GEqn+4TyslZlzWp
         Isig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695347595; x=1695952395;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pWG5Cr/URo6om9dDoGNWRX1ofAGukQSqmfRjr+ASakU=;
        b=gYpNDPe8+IUwK8NEk06CFIp7t1hyH0qRBPJ3GObREFuO5heWwkbc7RP5jAOLn+CkIr
         HFu/l4niv0sbvLtxQKgBtKAh5hgBTjo/l5fj0jD0z0QtJBVYOk/FypL5xPejq4tfSyGk
         9Ju4wPe37eA+85j+I/29FtTXFKRlgziNHb2/M3MWDCL+fKWGWOOlNaTvy25haFVmxHn7
         doh7jesZ2FAPdbI6Rz0btucfyMi6dchMoDmL40ZX+lYHPShu3gwSUvQFiMkoEh3/t6gk
         pymxDGvd8wrNGUs/KQpIjtHHb7HfxuhOHs9YMZGO9RGfFAEOkRpcC2AEx4Pz5hNLpXUY
         8kPQ==
X-Gm-Message-State: AOJu0Ywkl22vnW+BkRZACpWKaYG8P+Cr4z/Baj4LY5/pERv6W2ru5ULi
	B4i5uguhmPaeBgdPvGBpOng=
X-Google-Smtp-Source: AGHT+IE6VMM8fZvXMtEZpy6J/0+KRj8mxtNRIEQeFpdKCP0/7G8jsnYnQdVu1PEcgGwtSo38u5Ph1g==
X-Received: by 2002:a5d:5184:0:b0:320:6f4:a200 with SMTP id k4-20020a5d5184000000b0032006f4a200mr6018539wrv.10.1695347594742;
        Thu, 21 Sep 2023 18:53:14 -0700 (PDT)
Received: from [192.168.1.6] (dynamic-093-132-179-053.93.132.pool.telefonica.de. [93.132.179.53])
        by smtp.googlemail.com with ESMTPSA id r8-20020a5d4e48000000b00315af025098sm3071139wrt.46.2023.09.21.18.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 18:53:14 -0700 (PDT)
Subject: Re: arch/m68k/include/asm/raw_io.h:91:13: warning: array subscript 0
 is outside array bounds of 'volatile u16[0]' {aka 'volatile short unsigned
 int[]'}
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>
References: <202309192013.vI4DKHmw-lkp@intel.com>
 <CAL_JsqJ0BoR7Dan3=oyWPa6HU3YV=eOFTO5fx7u5zz2i=eB-jQ@mail.gmail.com>
 <a57afd40-71a2-aa68-84cb-44d2a88a1e2b@roeck-us.net>
 <CAL_JsqJYPJVTxH=d5nYK78+ZWhZAfh4VhEyBLqzyg4MzMhrX0g@mail.gmail.com>
 <194e2d22-9eff-ec6c-9bc9-13b62bda870a@roeck-us.net>
 <CAL_JsqKcD4AttSVUEi5zuF8S1E4xNdqdZVKiHmk0r79SRW5Cqw@mail.gmail.com>
 <ad1f36ab-29a6-98b6-8782-3980323760e1@roeck-us.net>
 <CAMuHMdXsiSfp3DGnLXfuENVLOdG91a+GXj3+g9p8Yp6aGTuqDQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fe7e6c19-916e-a30b-6f59-df03812fa431@gmail.com>
Date: Fri, 22 Sep 2023 13:53:13 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXsiSfp3DGnLXfuENVLOdG91a+GXj3+g9p8Yp6aGTuqDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Geert,

Am 21.09.23 um 19:08 schrieb Geert Uytterhoeven:
> Hi Günter, Rob,
>
> CC Michael
>
> On Wed, Sep 20, 2023 at 11:09 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 9/20/23 09:20, Rob Herring wrote:
>> [....]
>>
>>>> Sure, but I still argue that this isn't worth it for drivers like this one.
>>>> Are you going to submit a fix ? Because otherwise I'll submit a patch
>>>> to drop COMPILE_TEST from MACHZ_WDT.
> I think dropping COMPILE_TEST from MACHZ_WDT is the right thing to do
> anyway.  Unlike most other drivers, this is not a driver that can be
> compiled in, and doesn't do anything if the hardware is not present.
> In fact it is a very dangerous driver: its probe function "reads" the
> ZF version register, but that involves doing an unconditional write,
> which might crash any non-X86 system.
>
> IMHO a driver must not be enabled for compile-testing if its presence
> can harm the system.
>
>>> I honestly don't know what the fix is. There's a compiler flag to
>>> allow 0 address, but that seems like a big hammer. From what I read on
>>> the fix for gcc-12, we shouldn't be getting this, but I haven't
>>> confirmed. I was hoping for comment from Geert as the issue doesn't
>>> appear to be the driver, but the arch code.
> Well, Atari ROM port ISA accesses are really weird, due to the really
> weird way the bus is wired to the address/data lines...

Putting it mildly ...

> The issue is that gcc considers accessing these addresses as "not
> done"...
That an new GCC problem?
>>> Furthermore, I just built the same HEAD and config as reported and
>>> don't see this error. I'm using kernel.org nolibc gcc 13.2.0 which
>>> should be the same version.
>> Exactly my point. So now we are stuck with a report like this on a
>> driver which probably has 0 users and we don't know how to fix it,
>> all to get the benefit of being able to compile it for an architecture
>> and platform which will never use it.
>>
>> I seem to recall similar errors with m68k and COMPILE_TEST last time
>> I tried to enable it on watchdog drivers, so I am not sure if this is
>> entirely new.
> Probably not.
>
> Michael: original build failure report in
> https://lore.kernel.org/r/202309192013.vI4DKHmw-lkp@intel.com/

From what I can see, DATA_W appears to be zero - maybe the driver needs
to set 'sane' values for IO ports if compile tested on non-ISA
architectures?

In the alternative, we might have to prevent setting ATARI_ROM_ISA if
COMPILE_TEST is set.

Cheers,

    Michael


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
