Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82B333D1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 14:19:09 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id g8so13766214qtq.13
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 06:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rtsocPBgrP5t5SQoU56fedGlfvRQ93RglLTLhJ6D5ps=;
        b=OP4pVrdWqBoFbXYD+fd7y0wrcUfXBhwnh7iaXREukxZrf/qKN9hpG8nUO4cmwbur1y
         jNi0s1kIHmd3myhrrMOy0Z91WBM7khs+lSOjtuWNKkZOxaRAhxS97EjglHC0W9v646Wl
         9aI3tlNXn2hauBkqR19H8oqH/y+8kYKGAtLRWmRpgK4Y0cRE6tXDCGo1IRWUtwJjsgPs
         Vx4/fV8lH7Ql8DXNpgxmNeNHifW2+E056SUzq20b7wTYgT69Q4ZQX+egOrebkP8Dkrw1
         WadmzuYodNrfCeVxUArjDZWYXqkldou1B29HbAV47STxQoshEz6Ozwk63GbBH2+g8+vt
         Stuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtsocPBgrP5t5SQoU56fedGlfvRQ93RglLTLhJ6D5ps=;
        b=IYxL1u7XRKSIkuHk/AxYuvUa+Mqc7BOAJjwiGURGBaszreTYzL04CTovFmpKwx239E
         BD508h3nEp5QzUGJoGExObw3TbcpF4UlrOfhSGKQ6+8eGebh/xqOFQo/PXv7OoJjpyZw
         XdlUn2CImd7Veqws2ZqNDkREvkgTK2X+rT5P9ktGCF31TR1N5Icv61ZMPdSrBz/dWXBf
         by+dmHcBclcpOirc19pnDtVWWwZR8YwwMXs9ashLWoUhO2OF9hxd6R+UUAo2A2EQwSTE
         aNgtbQqA2+mcu6Vow87nzp7P7YaewgoiaZcaGjtBVk8ZXJPUb3MjfBQa/lf4OqsfvccU
         TM/Q==
X-Gm-Message-State: AO0yUKVQYecYmaYO8iQ6lB528u66P5LXSkRX7q0ss8/ZRw9pUDlPJT6s
	jMv5CA230AZlLz/cHHdcxHapf3Jgqqei2/SFuAyuHL/0Y9+EOg==
X-Google-Smtp-Source: AK7set/uKCjygvmTOc34DJPM5Jsv0LCYR3VXvtQLAf4FB/EDw3VcowZzcchZ8/ZmnXQo1PMmuQClyQ0lbWBZjmHd098=
X-Received: by 2002:ac8:7e86:0:b0:3ba:23f2:2d29 with SMTP id
 w6-20020ac87e86000000b003ba23f22d29mr2685221qtj.355.1676297948611; Mon, 13
 Feb 2023 06:19:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302130750.679RaRog-lkp@intel.com> <CALOAHbBwyEgW58RD-0Hw_Rn42bTRvFX6dzyCX-4_JyCyPaRR=Q@mail.gmail.com>
 <FFFF116D-A7F6-44DF-AC38-10B5E569290C@goodmis.org>
In-Reply-To: <FFFF116D-A7F6-44DF-AC38-10B5E569290C@goodmis.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 13 Feb 2023 22:18:32 +0800
Message-ID: <CALOAHbBTbVLB9EdOXpn5LM+T499Nh5O1aJLgfqP9Ywkxm0ymfQ@mail.gmail.com>
Subject: Re: [trace:trace/urgent 13/13] kernel/trace/trace_events.c:158:5:
 warning: no previous prototype for 'trace_define_field_ext'
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 13, 2023 at 4:38 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
>
>
> On February 12, 2023 11:20:59 PM EST, Yafang Shao <laoar.shao@gmail.com> wrote:
> >On Mon, Feb 13, 2023 at 7:30 AM kernel test robot <lkp@intel.com> wrote:
> >>
> >> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/urgent
> >> head:   b6c7abd1c28a63ad633433d037ee15a1bc3023ba
> >> commit: b6c7abd1c28a63ad633433d037ee15a1bc3023ba [13/13] tracing: Fix TASK_COMM_LEN in trace event format file
> >> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230213/202302130750.679RaRog-lkp@intel.com/config)
> >> compiler: sh4-linux-gcc (GCC) 12.1.0
> >> reproduce (this is a W=1 build):
> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         # https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/commit/?id=b6c7abd1c28a63ad633433d037ee15a1bc3023ba
> >>         git remote add trace git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
> >>         git fetch --no-tags trace trace/urgent
> >>         git checkout b6c7abd1c28a63ad633433d037ee15a1bc3023ba
> >>         # save the config file
> >>         mkdir build_dir && cp config build_dir/.config
> >>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
> >>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/trace/
> >>
> >> If you fix the issue, kindly add following tag where applicable
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Link: https://lore.kernel.org/oe-kbuild-all/202302130750.679RaRog-lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >> >> kernel/trace/trace_events.c:158:5: warning: no previous prototype for 'trace_define_field_ext' [-Wmissing-prototypes]
> >>      158 | int trace_define_field_ext(struct trace_event_call *call, const char *type,
> >>          |     ^~~~~~~~~~~~~~~~~~~~~~
> >>
> >
> >Thanks for the report.
> >Should make trace_define_field_ext static.
> >I will send a fix.
>
> No need, I already made one and it just passed my tests. I'll be sending a pull request shortly.

Thanks for the work!

-- 
Regards
Yafang
