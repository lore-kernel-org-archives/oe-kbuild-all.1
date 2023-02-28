Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D9C627
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 08:52:50 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id bo10so6325226qvb.12
        for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 00:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wN8i0lhIRlq7JZ60dmkvEMuRfVA9M6TH4YRMsbOofOU=;
        b=lzvIvCCFUQ7xCjvMc4nIzLWYU47Xhexvz+ewrFr9G/DOiLXT2J9NOhyIXcG/bf3Omq
         uW1XZcmnEbax2EVP8cKN1qvyjxvExMRzuWN1oB6IXbqyMzlg+tDmibOzRBGgl4fy+CdB
         /TbyW3i3AzHg2TO8t5s2OEraDNLVAajnojuScBvMT6LMQ/X1p+nVX/DKWg9z50TEppSe
         5KsvuxcVfOj32/umYI5GJ9+HZE8agCGjTW8HEfS6aFCY5X/u1bvsKwPfPIK+NuKBoNu6
         a6M3eosC1p/t+nNeSVkILyjoBsLy3NXs+7nS8qnxiI+l6YqEp9bJtmaaPIVFl24Czs+d
         2tAQ==
X-Gm-Message-State: AO0yUKUU0xJTzlsHI11+lqZP9lzVJ/M2YJ7wgwHzrp1GNeEpJfyTl6kX
	t7fUYA/CNdUG5jo6RBhgrAJuBANbf0rwQA==
X-Google-Smtp-Source: AK7set9WybfaZQvzSF/CkjdcOBOiEK9OzVIhgnpZWSebUQq7Ltidx4L1/6qICX5cBbQ6WnF2b7+Afg==
X-Received: by 2002:a05:6214:2426:b0:56f:556:1236 with SMTP id gy6-20020a056214242600b0056f05561236mr4292885qvb.35.1677574369694;
        Tue, 28 Feb 2023 00:52:49 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id bl32-20020a05620a1aa000b007423e52f9d2sm6494306qkb.71.2023.02.28.00.52.49
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:52:49 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-536be69eadfso252151607b3.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 00:52:49 -0800 (PST)
X-Received: by 2002:a05:6902:d2:b0:a8f:a6cc:9657 with SMTP id
 i18-20020a05690200d200b00a8fa6cc9657mr800670ybs.7.1677574368976; Tue, 28 Feb
 2023 00:52:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302280619.kO2cWoIT-lkp@intel.com>
In-Reply-To: <202302280619.kO2cWoIT-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Feb 2023 09:52:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0ufx4FaoXR8ai53xeact4DC4HNhA8N6KwoOsw3yUMOg@mail.gmail.com>
Message-ID: <CAMuHMdX0ufx4FaoXR8ai53xeact4DC4HNhA8N6KwoOsw3yUMOg@mail.gmail.com>
Subject: Re: include/asm-generic/div64.h:238:36: error: passing argument 1 of
 '__div64_32' from incompatible pointer type
To: kernel test robot <lkp@intel.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 27, 2023 at 11:33 PM kernel test robot <lkp@intel.com> wrote:
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   982818426a0ffaf93b0621826ed39a84be3d7d62
> commit: 29e8142b5623b5949587bcc4f591c4e6595c4aca power: supply: Introduce Qualcomm PMIC GLINK power supply
> date:   2 weeks ago
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280619.kO2cWoIT-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=29e8142b5623b5949587bcc4f591c4e6595c4aca
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 29e8142b5623b5949587bcc4f591c4e6595c4aca
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302280619.kO2cWoIT-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from ./arch/arc/include/generated/asm/div64.h:1,
>                     from include/linux/math.h:6,
>                     from include/linux/math64.h:6,
>                     from include/linux/time64.h:5,
>                     from include/linux/restart_block.h:10,
>                     from include/linux/thread_info.h:14,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/arc/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:78,
>                     from include/linux/rcupdate.h:27,
>                     from include/linux/rculist.h:11,
>                     from include/linux/pid.h:5,
>                     from include/linux/sched.h:14,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from include/linux/auxiliary_bus.h:11,
>                     from drivers/power/supply/qcom_battmgr.c:6:
>    drivers/power/supply/qcom_battmgr.c: In function 'qcom_battmgr_sm8350_callback':
>    include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
>      222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>          |                                   ^~
>    drivers/power/supply/qcom_battmgr.c:1130:25: note: in expansion of macro 'do_div'
>     1130 |                         do_div(battmgr->status.percent, 100);
>          |                         ^~~~~~
>    In file included from include/linux/dev_printk.h:14:
>    include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
>      234 |         } else if (likely(((n) >> 32) == 0)) {          \
>          |                                ^~
>    include/linux/compiler.h:77:45: note: in definition of macro 'likely'
>       77 | # define likely(x)      __builtin_expect(!!(x), 1)
>          |                                             ^
>    drivers/power/supply/qcom_battmgr.c:1130:25: note: in expansion of macro 'do_div'
>     1130 |                         do_div(battmgr->status.percent, 100);
>          |                         ^~~~~~
> >> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      238 |                 __rem = __div64_32(&(n), __base);       \
>          |                                    ^~~~
>          |                                    |
>          |                                    unsigned int *
>    drivers/power/supply/qcom_battmgr.c:1130:25: note: in expansion of macro 'do_div'
>     1130 |                         do_div(battmgr->status.percent, 100);
>          |                         ^~~~~~
>    include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
>      213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
>          |                            ~~~~~~~~~~^~~~~~~~
>    cc1: some warnings being treated as errors

Fix available for two weeks:
https://lore.kernel.org/all/20230214132052.1556699-1-arnd@kernel.org

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
