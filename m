Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E2F14A97
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 21:35:30 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f957a45b10so1456909e87.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 14:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687556127; x=1690148127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce2hSnC2a6RnZFjCDjugGmpFjSLpWb0uqSzSXaQCs/g=;
        b=Y1pvlYbo5zq+56C0Wcpt+2LDltVljjfwpzB7xHmN/YPtIYvti/AQXtMyQuvKgrCyfN
         zQe44hcJrXWMyTpTFREQ/SICEczTlnwZoyb9MzuvlkE7M75O5qeI9MCBIB+KMhb53EtN
         +7jxcYX8uLvKVrKj7oXmUEg8JwBUCqCJ2fzA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687556127; x=1690148127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce2hSnC2a6RnZFjCDjugGmpFjSLpWb0uqSzSXaQCs/g=;
        b=hVp7V22xsXNg2VE6VAiJgEh4HH2o23N2TZWugDtqkCvQJH69J3W0HhAdNGnxb7ebBA
         idVVq7dSFpLCVr+j+7L04kceY+1kmuVD01fpHHhtX6TvLAZMXM9+iD6aZBsd3ZJgDu5a
         FqK+eR9JPXlFy/uhetRjNPPFNZVe/m24Dxi8FYIaNjvBR5eOJPeFF+jiyEzTYI4x0/B/
         Rur+wZZrV0M1QUWBj+aXw5QrwuyadsncBKm6wbWsnL68qycSJjYP+Lh2+Wq16wy/ut+F
         8etcdW7BUgzJKzNctq5uK3PlNxlQhg5aRRdblryphfU/nLjjzEqHHeVT9yIGkpezlIgu
         OGJA==
X-Gm-Message-State: AC+VfDzgHOlBYkCpBspDfh99d2sd/wJWwRbb6iIlEABYR9h9HFQLqB98
	XjJm/imE2Mu/BkR2OS1gPO2A5vgzXy2R3hbRRIOJxQ==
X-Google-Smtp-Source: ACHHUZ5yEcfNoUpRp3TIx77VZjFhvKjUgiKiEUjMhSemnOZ4Rv79gQ475wY3QRVaYTFqWFjUwnej3A==
X-Received: by 2002:a19:6748:0:b0:4f8:6bca:50d7 with SMTP id e8-20020a196748000000b004f86bca50d7mr9862329lfj.13.1687556126920;
        Fri, 23 Jun 2023 14:35:26 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a22-20020aa7d756000000b0051be4cb7f54sm3231059eds.84.2023.06.23.14.35.26
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 14:35:26 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-513ea2990b8so2919a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 14:35:26 -0700 (PDT)
X-Received: by 2002:a50:9f64:0:b0:519:6a72:aeea with SMTP id
 b91-20020a509f64000000b005196a72aeeamr10413edf.7.1687556125796; Fri, 23 Jun
 2023 14:35:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306240558.jm85FlCG-lkp@intel.com>
In-Reply-To: <202306240558.jm85FlCG-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Jun 2023 14:35:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XR8uMrRiQ=jmHk7XcV092OjF-9JpQM_eJ5QQrMnLx0Ag@mail.gmail.com>
Message-ID: <CAD=FV=XR8uMrRiQ=jmHk7XcV092OjF-9JpQM_eJ5QQrMnLx0Ag@mail.gmail.com>
Subject: Re: [linux-next:master 11921/12162] panic.c:undefined reference to `arch_trigger_cpumask_backtrace'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 23, 2023 at 2:31=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8d2be868b42c08290509c60515865f4de24ea704
> commit: 1141ba8fc84c333b138946d4cf973f5ade78b9ed [11921/12162] powerpc: m=
ove arch_trigger_cpumask_backtrace from nmi.h to irq.h
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/202=
30624/202306240558.jm85FlCG-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240558=
.jm85FlCG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306240558.jm85FlCG-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    powerpc-linux-ld: kernel/panic.o: in function `panic':
> >> panic.c:(.text.panic+0x2f8): undefined reference to `arch_trigger_cpum=
ask_backtrace'
> >> powerpc-linux-ld: panic.c:(.text.panic+0x33c): undefined reference to =
`arch_trigger_cpumask_backtrace'
>    powerpc-linux-ld: kernel/panic.o: in function `oops_enter':
> >> panic.c:(.text.oops_enter+0x58): undefined reference to `arch_trigger_=
cpumask_backtrace'
>    powerpc-linux-ld: kernel/sched/core.o: in function `dump_cpu_task':
> >> core.c:(.text.dump_cpu_task+0xe8): undefined reference to `arch_trigge=
r_cpumask_backtrace'
>    powerpc-linux-ld: kernel/hung_task.o: in function `check_hung_uninterr=
uptible_tasks':
> >> hung_task.c:(.text.check_hung_uninterruptible_tasks+0x584): undefined =
reference to `arch_trigger_cpumask_backtrace'
>    powerpc-linux-ld: kernel/watchdog.o:watchdog.c:(.text.watchdog_timer_f=
n+0x4cc): more undefined references to `arch_trigger_cpumask_backtrace' fol=
low

Same as the report I already responded to:

https://lore.kernel.org/r/202306232330.luFAk63S-lkp@intel.com

...just a different config (powerpc-allmodconfig vs.
powerpc-randconfig-r025-20230622). Specifically this is the same
commit git hash and thus also points to v1 of the patch instead of the
newer v2.

-Doug
