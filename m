Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B278F4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 15:26:15 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-986d8332f50so86899966b.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687533972; x=1690125972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEygwpmPKBIe/+wIIjlwllgE+n9i6VP3iuRyYCaWYt0=;
        b=GXjHtxBpxKs7LU9c0qpX4cDobZQJvWcQDP0/u84r6tUMiJYpXSs1GbFe8mUE/S/Mbu
         r0/8AmTh8ERm4kuMMcBfLNzZ401AnFvXVYJ7Ij/Abv16r3NVhU5jO/w7fiv70ZgzxmwP
         w7ayED6w7yY0pTv/yAfLjH3jgq6GZPnZJp3b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687533972; x=1690125972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEygwpmPKBIe/+wIIjlwllgE+n9i6VP3iuRyYCaWYt0=;
        b=VHUAphJXBU1jYd/k4G8fRQMTFOomWWhlWs99AkiQopqd66oFnxAQla4cE47UPalWgx
         BemghHC96AcJaPFyqHgwFPGkBCqot5S6ie2KAMaMMTeEnbpOElmyNUlJ2o5i2Pm/ke/M
         Mr+kyVWa3HqHum8AdgDLZgz1XXSRHmX27ec4R17ns6qegfJWYDasyYFsk4qOBd5wY7r9
         b56tFJf7nC33yoxjkergiZ7dKpw9o1BzngAYO5e+m3DlRF6zlt/bwDPE27A4nDURHJm9
         7eEoRxTrAOcGHD/EvezthCuRNXqmy3uWLOAvDKmkCrwv+DipeWCY8PQv877N5tGoucOf
         DVBQ==
X-Gm-Message-State: AC+VfDy6qyOyalh/TPtCnBnwFrK9PfUD911W+kXwtEbR1aUe5hkxUSZr
	4yt82BmHTHBfoV9HGXkdxP9TJaIWNSXJ+0fBDo4Uew==
X-Google-Smtp-Source: ACHHUZ7+Wjel3FS9A5DSM//QmgBIyRcI1BMX7b07SIyibEtcy1jgyp/6BpakvFja8CtSzoALgctTjQ==
X-Received: by 2002:a17:906:730e:b0:989:444a:dd57 with SMTP id di14-20020a170906730e00b00989444add57mr9148671ejc.26.1687533972362;
        Fri, 23 Jun 2023 08:26:12 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id h8-20020a1709062dc800b00977cc21ddd8sm6114843eji.54.2023.06.23.08.26.11
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 08:26:11 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-513ea2990b8so11450a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 08:26:11 -0700 (PDT)
X-Received: by 2002:a50:931d:0:b0:51a:1ffd:10e with SMTP id
 m29-20020a50931d000000b0051a1ffd010emr71827eda.3.1687533971159; Fri, 23 Jun
 2023 08:26:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306232330.luFAk63S-lkp@intel.com>
In-Reply-To: <202306232330.luFAk63S-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Jun 2023 08:25:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4dpQr_tqB4SqkkOoWj6qZkVFDR7D9TrHzcC0hHfaCFg@mail.gmail.com>
Message-ID: <CAD=FV=X4dpQr_tqB4SqkkOoWj6qZkVFDR7D9TrHzcC0hHfaCFg@mail.gmail.com>
Subject: Re: [linux-next:master 11921/12162] include/linux/nmi.h:160:
 undefined reference to `arch_trigger_cpumask_backtrace'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 23, 2023 at 8:22=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8d2be868b42c08290509c60515865f4de24ea704
> commit: 1141ba8fc84c333b138946d4cf973f5ade78b9ed [11921/12162] powerpc: m=
ove arch_trigger_cpumask_backtrace from nmi.h to irq.h
> config: powerpc-randconfig-r025-20230622 (https://download.01.org/0day-ci=
/archive/20230623/202306232330.luFAk63S-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230623/202306232330=
.luFAk63S-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306232330.luFAk63S-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    powerpc-linux-ld: kernel/panic.o: in function `trigger_all_cpu_backtra=
ce':
> >> include/linux/nmi.h:160: undefined reference to `arch_trigger_cpumask_=
backtrace'
> >> powerpc-linux-ld: include/linux/nmi.h:160: undefined reference to `arc=
h_trigger_cpumask_backtrace'
> >> powerpc-linux-ld: include/linux/nmi.h:160: undefined reference to `arc=
h_trigger_cpumask_backtrace'
>    powerpc-linux-ld: kernel/sched/core.o: in function `trigger_single_cpu=
_backtrace':
>    include/linux/nmi.h:178: undefined reference to `arch_trigger_cpumask_=
backtrace'
>    powerpc-linux-ld: kernel/watchdog.o: in function `trigger_allbutself_c=
pu_backtrace':
>    include/linux/nmi.h:166: undefined reference to `arch_trigger_cpumask_=
backtrace'
>    powerpc-linux-ld: drivers/tty/sysrq.o:include/linux/nmi.h:160: more un=
defined references to `arch_trigger_cpumask_backtrace' follow

Thanks for the report! This was already addressed yesterday and the
fixed patch has already been merged into Andrew Morton's tree.

My response to a similar report yesterday:

https://lore.kernel.org/r/CAD=3DFV=3DVqnC8o_Bsx8GWYNbp+mRb2kGdfkucy2+RV4tyy=
GBjK1A@mail.gmail.com

The indication that v2 landed was at:

https://lore.kernel.org/r/20230623033257.B9307C433C0@smtp.kernel.org

I confirmed that the git hash included in ${SUBJECT} report was the
old v1 version.

-Doug
