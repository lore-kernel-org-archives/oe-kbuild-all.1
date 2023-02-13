Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE61C06
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 04:21:36 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id z5so12582296qtn.8
        for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 20:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6A5XSgvR39GYU2abmQga80QTZjZWKpkP/5SlbkX/l4=;
        b=TDzCXSputnLsEX/eX4ty2UYSIlm+aVPOr+uaoPcGlwMHfrvg6+gFoPwW+bX/ohGDEm
         VoZkbPYOQZp/n+DKa9c/eBKOo1FzM2lgBn751gsOW2bPhzf7YD+eSOQLIR8RooWqKdyk
         5p3+5Rwjf0//SA/I5qcywC8ir93XYSt7zak51IpVrA5BMC5m0QJrluSYXU/tvsk/I4U8
         hA/PodnOakk7Zx48WuSXpipTvp0rdxmh0ugCUb+Inyni0yUPptgJSYkn+Effr+jIdOVo
         v8ny1fLMj5kjITN5z376GzuK6paB0byFZhPu43QumnpJMesYJrF2KE1n7uVRaajsrAjR
         MpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6A5XSgvR39GYU2abmQga80QTZjZWKpkP/5SlbkX/l4=;
        b=BDOW7RKj3idlS/F8EDXVJzDz7oZ2rqgNjo23wb4NeH7a1qfpaV/PKTLFdsL3Wghblg
         705ajeQeyKl5sOiJg75Sj5CZ31DJkYT/L69z+lw0qrFjbOWlcLHTvQ5XSISD1JWoNv2B
         FSWJRWiv47xcEYFE8o1jEbQr8aIgEzsKcWlN6rg9US8jXXkUrdPUOL0XsQpVCY2zDX0y
         oYt9wBKv3heSBDsbe/pf6X1+bP2xy4xwNTbOjskXIqEzSq4E7/B77HnSwCLZoDta4r0D
         eJeH+E5ASJixOI9c7C83n8Y6EkOiXry2gR6LVtzaeG0Z0OJf6BeezDSCUk//acsTiOyf
         Gv5g==
X-Gm-Message-State: AO0yUKUeYREgwrzEyu0gV60LHwogOPfCy43/mW6V/jRVf1IEXs6Q7h5m
	2dkb6WM+uYSh12NEQKvFHFC6LTQ6PF94kioAjdDUJya0Hm0dXrCt
X-Google-Smtp-Source: AK7set9XKYcJFnb1yoh1yJGxInhypil03htqx/PYIV7Nq/j026lOFOSKxeYVvTfbVvXcj/Vo0qzCv0eFA/urG/H0vF8=
X-Received: by 2002:a05:622a:1a1b:b0:3b8:6ceb:ada9 with SMTP id
 f27-20020a05622a1a1b00b003b86cebada9mr3154061qtb.98.1676262095348; Sun, 12
 Feb 2023 20:21:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302130750.679RaRog-lkp@intel.com>
In-Reply-To: <202302130750.679RaRog-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 13 Feb 2023 12:20:59 +0800
Message-ID: <CALOAHbBwyEgW58RD-0Hw_Rn42bTRvFX6dzyCX-4_JyCyPaRR=Q@mail.gmail.com>
Subject: Re: [trace:trace/urgent 13/13] kernel/trace/trace_events.c:158:5:
 warning: no previous prototype for 'trace_define_field_ext'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 13, 2023 at 7:30 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/urgent
> head:   b6c7abd1c28a63ad633433d037ee15a1bc3023ba
> commit: b6c7abd1c28a63ad633433d037ee15a1bc3023ba [13/13] tracing: Fix TASK_COMM_LEN in trace event format file
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230213/202302130750.679RaRog-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/commit/?id=b6c7abd1c28a63ad633433d037ee15a1bc3023ba
>         git remote add trace git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
>         git fetch --no-tags trace trace/urgent
>         git checkout b6c7abd1c28a63ad633433d037ee15a1bc3023ba
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/trace/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302130750.679RaRog-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/trace/trace_events.c:158:5: warning: no previous prototype for 'trace_define_field_ext' [-Wmissing-prototypes]
>      158 | int trace_define_field_ext(struct trace_event_call *call, const char *type,
>          |     ^~~~~~~~~~~~~~~~~~~~~~
>

Thanks for the report.
Should make trace_define_field_ext static.
I will send a fix.

>
> vim +/trace_define_field_ext +158 kernel/trace/trace_events.c
>
>    157
>  > 158  int trace_define_field_ext(struct trace_event_call *call, const char *type,
>    159                         const char *name, int offset, int size, int is_signed,
>    160                         int filter_type, int len)
>    161  {
>    162          struct list_head *head;
>    163
>    164          if (WARN_ON(!call->class))
>    165                  return 0;
>    166
>    167          head = trace_get_fields(call);
>    168          return __trace_define_field(head, type, name, offset, size,
>    169                                      is_signed, filter_type, len);
>    170  }
>    171
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests



-- 
Regards
Yafang
