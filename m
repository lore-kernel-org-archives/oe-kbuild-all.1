Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BC6197
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 17:18:16 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-17213c961dfso273668fac.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 09:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35PGRLtjsjSa+3EItqYEIxiwSUdQKu7BSFkIqr4eHiA=;
        b=FPbjkoaUUCjZrsp2x8uiFWlSNb1cFDvHsUqO6szAjslr73ID/KwsSnmaqFkrU3uwqI
         9o6M6/C0VAOEL7T0txK/FHERz3uNBvITiVMIvrLJKe1MMBKscgvBpu2esEIE8ZC1awzO
         lDUC6huxdiJu9QMflmT1osEqWnZTmzVHPHcw+ku5ZdbiF/cwtotHBHUQHjFeSfdhZ3r6
         4PnRdhGoQG+LTK3QJHrUQ03Ny1GKNA/bzN8tucpuxnLDotVGT6fAtNi+Tbm+jFwkyzAS
         fT0Yaazn5alQq9+htwYxI0xN33lYPP21YeVX8ZORmwNAlrLkRE2hIYlBgXq5UodfSBp+
         /fOw==
X-Gm-Message-State: AO0yUKWGzdlrO4KIxD5gI1Tva4bTyJC61nxMn0ThrcRiNhIb/opAXfrc
	yij1KWjTHjIr8u4Klab/vklRBreDglIBhA==
X-Google-Smtp-Source: AK7set+vaZ0OGDvWmQ2aKGX/HkDSkXJY1LfqMQbb/AFzQZI2t5h/Xq+okf7wtFF5Kx9Ht34NZ5W8Yw==
X-Received: by 2002:a05:6870:391e:b0:166:d847:3350 with SMTP id b30-20020a056870391e00b00166d8473350mr15806765oap.56.1677259095862;
        Fri, 24 Feb 2023 09:18:15 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id i64-20020a37b843000000b007417affecdcsm7694249qkf.69.2023.02.24.09.18.14
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 09:18:15 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-53852143afcso154879277b3.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 09:18:14 -0800 (PST)
X-Received: by 2002:a81:ad43:0:b0:533:91d2:9d94 with SMTP id
 l3-20020a81ad43000000b0053391d29d94mr5193404ywk.5.1677259094700; Fri, 24 Feb
 2023 09:18:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302240951.roaFGUy5-lkp@intel.com> <20230224084559.x2ceoc6r24uh3wms@pengutronix.de>
In-Reply-To: <20230224084559.x2ceoc6r24uh3wms@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Feb 2023 18:18:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOr5OFwte3FNVXRUERRwJiqxVXgwCjGC_y6jxmftxrLA@mail.gmail.com>
Message-ID: <CAMuHMdXOr5OFwte3FNVXRUERRwJiqxVXgwCjGC_y6jxmftxrLA@mail.gmail.com>
Subject: Re: drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used uninitialized
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marco,

On Fri, Feb 24, 2023 at 9:58 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> On 23-02-24, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   e4bc15889506723d7b93c053ad4a75cd58248d74
> > commit: 80a21da360516fa602f3a50eb9792f9dfbfb5fdb media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver
> > date:   4 months ago
> > config: arc-randconfig-r031-20230223 (https://download.01.org/0day-ci/archive/20230224/202302240951.roaFGUy5-lkp@intel.com/config)
> > compiler: arceb-elf-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=80a21da360516fa602f3a50eb9792f9dfbfb5fdb
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 80a21da360516fa602f3a50eb9792f9dfbfb5fdb
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/media/i2c/
>
> This is still a false positive, should we initialize p_best to make the
> compiler happy? I think Hans did this once, but he said that this will
> be gone with gcc-13 if I remember correctly.

Are you sure this is a false positive?

> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202302240951.roaFGUy5-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/media/i2c/tc358746.c: In function 'tc358746_find_pll_settings':
> > >> drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used uninitialized [-Wuninitialized]
> >      817 |         u16 p_best, p;
> >          |             ^~~~~~
> > >> drivers/media/i2c/tc358746.c:816:13: warning: 'm_best' is used uninitialized [-Wuninitialized]
> >      816 |         u16 m_best, mul;
> >          |             ^~~~~~
> >
> >
> > vim +/p_best +817 drivers/media/i2c/tc358746.c
> >
> >    805
> >    806        static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
> >    807                                                        unsigned long refclk,
> >    808                                                        unsigned long fout)
> >    809
> >    810        {
> >    811                struct device *dev = tc358746->sd.dev;
> >    812                unsigned long best_freq = 0;
> >    813                u32 min_delta = 0xffffffff;
> >    814                u16 prediv_max = 17;
> >    815                u16 prediv_min = 1;
> >  > 816                u16 m_best, mul;
> >  > 817                u16 p_best, p;
> >    818                u8 postdiv;
> >    819
> >    820                if (fout > 1000 * HZ_PER_MHZ) {
> >    821                        dev_err(dev, "HS-Clock above 1 Ghz are not supported\n");
> >    822                        return 0;
> >    823                }
> >    824
> >    825                if (fout >= 500 * HZ_PER_MHZ)
> >    826                        postdiv = 1;
> >    827                else if (fout >= 250 * HZ_PER_MHZ)
> >    828                        postdiv = 2;
> >    829                else if (fout >= 125 * HZ_PER_MHZ)
> >    830                        postdiv = 4;
> >    831                else
> >    832                        postdiv = 8;
> >    833
> >    834                for (p = prediv_min; p <= prediv_max; p++) {
> >    835                        unsigned long delta, fin;
> >    836                        u64 tmp;
> >    837
> >    838                        fin = DIV_ROUND_CLOSEST(refclk, p);
> >    839                        if (fin < 4 * HZ_PER_MHZ || fin > 40 * HZ_PER_MHZ)
> >    840                                continue;
> >    841
> >    842                        tmp = fout * p * postdiv;
> >    843                        do_div(tmp, fin);
> >    844                        mul = tmp;
> >    845                        if (mul > 511)
> >    846                                continue;
> >    847
> >    848                        tmp = mul * fin;
> >    849                        do_div(tmp, p * postdiv);
> >    850
> >    851                        delta = abs(fout - tmp);
> >    852                        if (delta < min_delta) {

So you assume this branch will be taken at least once.
However, if the smallest delta is 0xffffffff, this is never true.
Moreover, tmp is u64, while delta is unsigned long, which is
either 32-bit or 64-bit (it is 32-bit on ARC, I think).

So I think the code can definitely be improved by cleaning up
the types, possibly killing the warning as well...

> >    853                                p_best = p;
> >    854                                m_best = mul;
> >    855                                min_delta = delta;
> >    856                                best_freq = tmp;
> >    857                        };
> >    858
> >    859                        if (delta == 0)
> >    860                                break;
> >    861                };
> >    862
> >    863                if (!best_freq) {
> >    864                        dev_err(dev, "Failed find PLL frequency\n");
> >    865                        return 0;
> >    866                }
> >    867
> >    868                tc358746->pll_post_div = postdiv;
> >    869                tc358746->pll_pre_div = p_best;
> >    870                tc358746->pll_mul = m_best;
> >    871
> >    872                if (best_freq != fout)
> >    873                        dev_warn(dev, "Request PLL freq:%lu, found PLL freq:%lu\n",
> >    874                                 fout, best_freq);
> >    875
> >    876                dev_dbg(dev, "Found PLL settings: freq:%lu prediv:%u multi:%u postdiv:%u\n",
> >    877                        best_freq, p_best, m_best, postdiv);
> >    878
> >    879                return best_freq;
> >    880        }
> >    881

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
