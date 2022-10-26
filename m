Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD191C3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Oct 2022 18:29:07 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id o70so20056422yba.7
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Oct 2022 11:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O8IiTfGeQB5Y3mkjoWFeOPnCtwqMovKFDnR4ImruD2M=;
        b=W4EMgsQMZ/YQdhAqr05QsRU2KXWsLprQ8IwBKTRTL/uUw/qJsSkHEJfFsr9trlTqQF
         aoTsxlqhWuv5/FMWyq1dJF5SF1Mr+xlcwIpcv48qaEU32MjOlY9kEmvG7WOmybgGafPT
         bbrJGDh4NsMjJr6i45qOBeGFu9hHWWj19Q4M4uZZMaUOrhiFq92bBtyzx7GDrGjW/IJw
         MUwus7v6x9k41Pe1sVHAKnGOET0BoRpv7TnL2ou1OoLH3F6cUEIO+ssUifOj7OHkRuzD
         LWhlMsJ0hqnyEy+Ch4DyBiyb9N4TBH+wlPp3GsoPR9OG5LT3uaE7rOfuDOYWKIZavh25
         fbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8IiTfGeQB5Y3mkjoWFeOPnCtwqMovKFDnR4ImruD2M=;
        b=eHTMuys20ZOOBL8hPGBp7ai3sx+4CKyKb6zO4nBUnFpw0g4DA0bQC7Ea2M/jEgNKYi
         TT7Q7KkrT1FAZIuBi6dFxR6MNwCYDrwjlQvDleVmBXoKctvMpxXSs45x5zQ+0wHoX2xd
         bT8gHMFVwohlRqfDECCwDHh3lQ51gcmP+p2X+1n2F02+pKvTnoxWHr8+/ppDbGxnBMpf
         Hp7Z0t0G7qLSUI7R3JjU+XsVqIgjUOWThE5LMXjdzsRojRMvYNebMlkUiEdj+KUvLH+8
         TEosAoymfDgLfLsn9dWgtplPNiQVpNq26xbrtI5THksZOyVJ4zzZcQLJ7Kv+peZDRe/H
         M4Mw==
X-Gm-Message-State: ACrzQf19qezm/8lLSKh/9QZfL++TWvDFvXWhAmKiczLUJdbpVDP0PkRr
	4bVDkp3PC5XommnwFtcfqhfj4ycvuTs6kCCX0SYg8Q==
X-Google-Smtp-Source: AMsMyM4S0R8IwLL6RX0ovQbPyD2cUFlpv46gno8czEJm63ie+RKRwg1ZzCo33Fg1nlz2h3r9YR7jCDA2jCIh/QPyfLw=
X-Received: by 2002:a25:3812:0:b0:6cb:446b:69fd with SMTP id
 f18-20020a253812000000b006cb446b69fdmr12824294yba.59.1666808945858; Wed, 26
 Oct 2022 11:29:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210260945.cCKjgJe3-lkp@intel.com> <Y1j8I2qf78jHfLWs@hirez.programming.kicks-ass.net>
In-Reply-To: <Y1j8I2qf78jHfLWs@hirez.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 26 Oct 2022 11:28:54 -0700
Message-ID: <CAJuCfpHBMKbxWkJG4YRYvmaFPiXO42iVPZxgwUeWnKQb4CtDDg@mail.gmail.com>
Subject: Re: [peterz-queue:sched/core 16/18] kernel/sched/psi.c:983:35: error:
 too few arguments to function call, expected 3, have 2
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022 at 2:21 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Oct 26, 2022 at 09:58:58AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> > head:   7005e3c43be6b6297440e85cb7d8c12a94540b49
> > commit: 95a70934458341dc43db09be8e7b88c98fba9b89 [16/18] psi: stop relying on timer_pending for poll_work rescheduling
> > config: i386-randconfig-a004-20221024 (attached as .config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=95a70934458341dc43db09be8e7b88c98fba9b89
> >         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
> >         git fetch --no-tags peterz-queue sched/core
> >         git checkout 95a70934458341dc43db09be8e7b88c98fba9b89
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from kernel/sched/build_utility.c:97:
> > >> kernel/sched/psi.c:983:35: error: too few arguments to function call, expected 3, have 2
> >                            psi_schedule_poll_work(group, 1);
> >                            ~~~~~~~~~~~~~~~~~~~~~~         ^
> >    kernel/sched/psi.c:568:13: note: 'psi_schedule_poll_work' declared here
> >    static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> >                ^
> >    1 error generated.
> >
> >
>
> Droping for now; Suren could you fix up and repost please?

Sorry, I missed the report. Will post a fix by EOD. Thanks!
