Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A5419BC4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 16:20:30 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99bdf08860dso868926166b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 09:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690820428; x=1691425228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJrbOYv6i5PeF0wtsFoLOFvwpUVFe5rN1cgTxxjnkV8=;
        b=RLq43g84OMso7mZZtBLTZ1HW3YvHbYBi7H3SSBO8ulU1RdttcZ/Y2hxFpVUp9GvSC5
         f2bmj7Hqg9GoFYBtF+4z3PbJxsTDBkqal5MV11egsOdIjBgRjLd5eckOCpyjk9Ppcs9L
         UZ79HnTL2Rk13OE6Ag9z67X9PH8Uu5PHqXPrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690820428; x=1691425228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJrbOYv6i5PeF0wtsFoLOFvwpUVFe5rN1cgTxxjnkV8=;
        b=fusNGdcIQHnym5aWtZCIxf/lSGBr57CWfvUwrlSGYFcMbjxrxNFIlfXFwlWefo3/y7
         YOUkkdcOmKMULtvcx/s+uE39KdGdziXpVrAITB1amxIWpJT/BUp5DUixHk0GEVOnF6LN
         IALpqMI4RGjq6KivbLRLE3NhbPI5KuEAMK3unHIwAUGL2KveWz2x9h6XEFG+1F8ldWkF
         LbWl11h1ZJylcYVDjhd7Ah54nuRfN4vd6SU0HLuOeOVFF4286Hk1X0ZbrLX3bO/beQXh
         zJpWi8Fj9y2kMNGf4kKWSLwyZdkYjP5cThrKG6ksCZiKxhh8yfiH6fCtEnVJFV6t1s9u
         OAoA==
X-Gm-Message-State: ABy/qLZe5PM0/kvs8jlWkSC3BoP4gOUGnA+MxOiN+R9lss+QvzveiZvi
	qC5DTzcuy4ik8GDv/zbvau0oonm4ZFo7xh9+HaMLMg==
X-Google-Smtp-Source: APBJJlEfrw0tEH15ivpVxG2iquJmVmFqopiK6R7b9Yz6XO3+vKlYzsyEUUeQ4OZJNPmu3LJaDxDy5g==
X-Received: by 2002:a17:907:a079:b0:993:f611:7c97 with SMTP id ia25-20020a170907a07900b00993f6117c97mr316159ejc.33.1690820427924;
        Mon, 31 Jul 2023 09:20:27 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id lu20-20020a170906fad400b00993664a9987sm6353246ejb.103.2023.07.31.09.20.27
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 09:20:27 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5223910acf2so18519a12.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 09:20:27 -0700 (PDT)
X-Received: by 2002:a50:d510:0:b0:522:2dd2:afa5 with SMTP id
 u16-20020a50d510000000b005222dd2afa5mr154984edi.7.1690820426772; Mon, 31 Jul
 2023 09:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307310955.pLZDhpnl-lkp@intel.com>
In-Reply-To: <202307310955.pLZDhpnl-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Jul 2023 09:20:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMnns_tBG+pgKFaFB3EL7oKw=KXEkraLUF852LEkHjfw@mail.gmail.com>
Message-ID: <CAD=FV=UMnns_tBG+pgKFaFB3EL7oKw=KXEkraLUF852LEkHjfw@mail.gmail.com>
Subject: Re: kernel/watchdog.c:162:1: warning: the frame size of 1248 bytes is
 larger than 1024 bytes
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jul 30, 2023 at 6:24=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
> commit: 77c12fc95980d100fdc49e88a5727c242d0dfedc watchdog/hardlockup: add=
 a "cpu" param to watchdog_hardlockup_check()
> date:   7 weeks ago
> config: x86_64-intel-next-customedconfig-intel_next_rpm_defconfig (https:=
//download.01.org/0day-ci/archive/20230731/202307310955.pLZDhpnl-lkp@intel.=
com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310955=
.pLZDhpnl-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307310955.pLZDhpnl-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    kernel/watchdog.c: In function 'watchdog_hardlockup_check':
> >> kernel/watchdog.c:162:1: warning: the frame size of 1248 bytes is larg=
er than 1024 bytes [-Wframe-larger-than=3D]
>      162 | }
>          | ^
>
>
> vim +162 kernel/watchdog.c
>
> 81972551df9d16 Douglas Anderson 2023-05-19  116
> 77c12fc95980d1 Douglas Anderson 2023-05-19  117  void watchdog_hardlockup=
_check(unsigned int cpu, struct pt_regs *regs)
> 81972551df9d16 Douglas Anderson 2023-05-19  118  {
> 1610611aadc224 Douglas Anderson 2023-05-19  119         /*
> 1610611aadc224 Douglas Anderson 2023-05-19  120          * Check for a ha=
rdlockup by making sure the CPU's timer
> 1610611aadc224 Douglas Anderson 2023-05-19  121          * interrupt is i=
ncrementing. The timer interrupt should have
> 81972551df9d16 Douglas Anderson 2023-05-19  122          * fired multiple=
 times before we overflow'd. If it hasn't
> 81972551df9d16 Douglas Anderson 2023-05-19  123          * then this is a=
 good indication the cpu is stuck
> 81972551df9d16 Douglas Anderson 2023-05-19  124          */
> 77c12fc95980d1 Douglas Anderson 2023-05-19  125         if (is_hardlockup=
(cpu)) {
> 1610611aadc224 Douglas Anderson 2023-05-19  126                 unsigned =
int this_cpu =3D smp_processor_id();
> 77c12fc95980d1 Douglas Anderson 2023-05-19  127                 struct cp=
umask backtrace_mask =3D *cpu_online_mask;

Ah, so I assume the problem is right here where I put a "struct
cpumask" on the stack. FWIW, the direct copy above changed to:

  struct cpumask backtrace_mask;
  cpumask_copy(&backtrace_mask, cpu_online_mask);

...in commit 7a71d8e650b0 ("watchdog/hardlockup: in
watchdog_hardlockup_check() use cpumask_copy()"), but that won't
change the stack usage...

The failing config says:

  CONFIG_NR_CPUS=3D8192

That means that this structure is taking 8192 / 8 =3D 1024 bytes and so
just having this structure on the stack at all will cause the yell.
Indeed, grepping through the source code shows that putting `struct
cpumask` is not common presumably because of this exact issue.

OK, so this doesn't look too hard to solve. We only ever do the
backtrace on one CPU anyway (see the test and set of
`watchdog_hardlockup_all_cpu_dumped`) so I can just make the structure
`static` and only mess with it if we're actually dumping the stack.
It'll use up 1KB of "static" memory all the time if you've set max
CPUs to 8K, but that seems better than trying to do a malloc when we
know the system is hard locked.

Patch to fix this is posted at:

https://lore.kernel.org/r/20230731091754.1.I501ab68cb926ee33a7c87e063d207ab=
f09b9943c@changeid

-Doug
