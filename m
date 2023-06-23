Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4153136A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 02:42:21 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-989d03eae11so6786666b.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 19:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687488139; x=1690080139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndjko3S2hirKMFAnIuo1tX8IBCKyfYQP4ApAN6KDs7o=;
        b=EFn/Ga15ZGJpZokz5kA4WkUkjXOYehQoJdkIS0I3gMXB3DM8B8j9fLbHXUgHBYnyJg
         wjVU4KicWhn8mlFVAQ/hqmhItgPwvbFw460BJC3EYgfXMa/ww6/cIqkB9IZPRAV8V6df
         Br7hLJ44oT4z7s2MIu1wSnDfHEl274pRv10uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687488139; x=1690080139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndjko3S2hirKMFAnIuo1tX8IBCKyfYQP4ApAN6KDs7o=;
        b=PirpRObA0PqCHlT0cRZEnvfKA+E8zJYsPeEcwVeLx3rAmiX9XbGI18HGrLbTbHhPNg
         b4oJVzB8KCMrvUd6TPU6cHm/F7vyYUFrCAMbSYdGgECtFhvlkdm1pM7Yo9FCyweeY22S
         9hmSOl3U50pGExQ7V2WMP59z8WBdSz5jRdNddG2Usg+AQtP+SGAyYm3s3n1CX+lRhKfy
         ABMWWjhi6u8uVYu7HbHQFfxXS3KbQ+Li828Nll/9R3pnMngoogd28wD7EiBoCKZzsIk9
         e5mRKFQ9M5QDEVcXm+wsHlXlBdSUXTBtVTeb2Rlk8Yn7ncsG5WAqRAMATbsFidRN8ct1
         0sGQ==
X-Gm-Message-State: AC+VfDz7qmf5Y6hc2lCYoahqTwI3MyBygqUHCUUSdfdHCwr7IwhVHPAJ
	jpRcsfVBwlIpUBOFdNngMUfGtgmKi3SKKBRCYi51kA==
X-Google-Smtp-Source: ACHHUZ5p8qX9MLL4DMW8syLGIwleI1ijypEsjaLyY9cFvkVJSWLw8rwTaJaK0iZQkqXyw2o4u0K3wQ==
X-Received: by 2002:a17:906:730c:b0:988:9d0f:db52 with SMTP id di12-20020a170906730c00b009889d0fdb52mr14096668ejc.35.1687488139262;
        Thu, 22 Jun 2023 19:42:19 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id cf14-20020a170906b2ce00b00984822540c9sm5317760ejb.96.2023.06.22.19.42.18
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 19:42:18 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-516500163b2so3765a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 19:42:18 -0700 (PDT)
X-Received: by 2002:a50:9ec2:0:b0:51a:1fd1:952f with SMTP id
 a60-20020a509ec2000000b0051a1fd1952fmr12395edf.1.1687488137869; Thu, 22 Jun
 2023 19:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306230940.cAAzoBuj-lkp@intel.com>
In-Reply-To: <202306230940.cAAzoBuj-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 22 Jun 2023 19:42:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VqnC8o_Bsx8GWYNbp+mRb2kGdfkucy2+RV4tyyGBjK1A@mail.gmail.com>
Message-ID: <CAD=FV=VqnC8o_Bsx8GWYNbp+mRb2kGdfkucy2+RV4tyyGBjK1A@mail.gmail.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 69/70] panic.c:undefined reference to `arch_trigger_cpumask_backtrace'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 22, 2023 at 6:27=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-no=
nmm-unstable
> head:   2f300c1db6849096050b341817208f97d55586b9
> commit: 7cf0441a9e57e752c39bb70ceb2e74bbf66ec958 [69/70] powerpc: move ar=
ch_trigger_cpumask_backtrace from nmi.h to irq.h
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/202=
30623/202306230940.cAAzoBuj-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230940=
.cAAzoBuj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306230940.cAAzoBuj-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    powerpc-linux-ld: kernel/panic.o: in function `panic':
> >> panic.c:(.text+0xa9c): undefined reference to `arch_trigger_cpumask_ba=
cktrace'
> >> powerpc-linux-ld: panic.c:(.text+0xae0): undefined reference to `arch_=
trigger_cpumask_backtrace'
>    powerpc-linux-ld: kernel/panic.o: in function `oops_enter':
>    panic.c:(.text+0x1518): undefined reference to `arch_trigger_cpumask_b=
acktrace'
>    powerpc-linux-ld: kernel/sched/core.o: in function `dump_cpu_task':
> >> core.c:(.text+0x1dd70): undefined reference to `arch_trigger_cpumask_b=
acktrace'
>    powerpc-linux-ld: kernel/hung_task.o: in function `check_hung_uninterr=
uptible_tasks':
> >> hung_task.c:(.text+0x11e0): undefined reference to `arch_trigger_cpuma=
sk_backtrace'
>    powerpc-linux-ld: kernel/watchdog.o:watchdog.c:(.text+0x8f0): more und=
efined references to `arch_trigger_cpumask_backtrace' follow

Argh. Since this is in Andrew's unstable, I'll send a v2 of my patch right =
away.

-Doug
