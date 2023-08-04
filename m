Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90908BA4F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 14:09:30 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-997c4107d62so303690866b.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 04 Aug 2023 07:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691158167; x=1691762967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwW5Q2M6AjXWAB+1icBhvQ77itKOd8GQunKGa5u2rS0=;
        b=eIYF9KaxBr4XTwuEewPtxymxCEEuA5k3rPSqtpTNMqQ/QmCGXH87v2kEgvWrmRPr8U
         2KRLTVnn6lYBADANQ0ViOp806Htd4CGdeXUIYEJ3ZbASkp4G+D0qFJNBpYFcXlpXc+1c
         jyM4W+WxLT37zS87G+FTIr4EvhB7nX11NjCUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691158167; x=1691762967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwW5Q2M6AjXWAB+1icBhvQ77itKOd8GQunKGa5u2rS0=;
        b=BO95wYfq4kB54PE0+kDf1K88xVZqO0jYsBLkYKS324rPYnr1i2hn/nvxcLNOluZ9cA
         xq2+N9Fu5ToUT/uDUTvOw7JAorEGAI7UNAqtOWA1x8ql037wXMpAOcG0hHMl00Y+f/Tg
         UA3KnbngiW7rzI6EMAwJ8Qinyp3z3rcVmpwJeGfOR310bHIkqT6/fPkIq/c8EUEIhR8s
         BtwPqJmkVfFHjxBFekQ3msRETlDz7BdEDAd/SYMvzAZ6uklI3tl/A3GKkC3s8wEjmYMW
         PKetuBFN6yxX/Ovn7PFosYSwTjkU7hmRotiqafQY7GtMjQxKUkQ5XOBNlv/t+018Gn/y
         YNJg==
X-Gm-Message-State: AOJu0YxROZ9qmv34wM5NlY0HMRBpOT14mIwET2SA9SFIRmQojsqkPlNW
	vlfPcM8rtDQiFQxDF4d+unF/fv4twZvHDJuL51SmaGET
X-Google-Smtp-Source: AGHT+IGM5UmDhQDe8cvbfVZiUYT3xDPsbg7bEzfoeAaDVEu+jUnj4K8RZnsISuSIgQM0VD2WKPdRLA==
X-Received: by 2002:a17:907:2c42:b0:99b:ef86:60d8 with SMTP id hf2-20020a1709072c4200b0099bef8660d8mr1404120ejc.5.1691158167109;
        Fri, 04 Aug 2023 07:09:27 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id dt20-20020a170906b79400b0098e16f8c198sm1374752ejb.18.2023.08.04.07.09.26
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 07:09:26 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so9471a12.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 04 Aug 2023 07:09:26 -0700 (PDT)
X-Received: by 2002:a50:d610:0:b0:522:41c9:9b9 with SMTP id
 x16-20020a50d610000000b0052241c909b9mr59434edi.5.1691158166384; Fri, 04 Aug
 2023 07:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308041501.2T8kM1gb-lkp@intel.com>
In-Reply-To: <202308041501.2T8kM1gb-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Aug 2023 07:09:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjeDqVd6gCwk68WWdLXw8p2cBk9Q9RqCtdmcC3NCJhGQ@mail.gmail.com>
Message-ID: <CAD=FV=UjeDqVd6gCwk68WWdLXw8p2cBk9Q9RqCtdmcC3NCJhGQ@mail.gmail.com>
Subject: Re: [linux-next:master 6492/7272] kernel/watchdog.c:111:12: warning:
 'hardlockup_all_cpu_backtrace_proc_handler' defined but not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 4, 2023 at 12:19=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   bdffb18b5dd8071cd25685b966f380a30b1fadaa
> commit: 838b3b76220d5b1bc53e4186d8936c5ec6810bf0 [6492/7272] watchdog/har=
dlockup: avoid large stack frames in watchdog_hardlockup_check()
> config: x86_64-randconfig-x012-20230731 (https://download.01.org/0day-ci/=
archive/20230804/202308041501.2T8kM1gb-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041501=
.2T8kM1gb-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308041501.2T8kM1gb-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/watchdog.c:111:12: warning: 'hardlockup_all_cpu_backtrace_proc_=
handler' defined but not used [-Wunused-function]
>      111 | static int hardlockup_all_cpu_backtrace_proc_handler(struct ct=
l_table *table, int write,
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/hardlockup_all_cpu_backtrace_proc_handler +111 kernel/watchdog.c
>
>    110
>  > 111  static int hardlockup_all_cpu_backtrace_proc_handler(struct ctl_t=
able *table, int write,

Leaving breadcrumbs here. The expected plan to fix this is to replace
the v2 patch with v4:

https://lore.kernel.org/r/20230804065935.v4.2.I501ab68cb926ee33a7c87e063d20=
7abf09b9943c@changeid/

-Doug
