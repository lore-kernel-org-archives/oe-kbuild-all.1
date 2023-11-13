Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCAF1A58B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5afabb23900so49420747b3.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 01:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699868800; x=1700473600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwzQbtIpe+t3wqED8YWdB5pI957h93jq9NhhCumia7w=;
        b=q6K3U2fZL8S0nSHtGiskZEvIiuucepcWMlmqjgbHerSjULb4bw1sV9BmG8yjBx4Tox
         tPZPYbAiAgo8eUBzmwDyYF+7eRco6MfqH2tDPdH3p8D3Tld1Sh9f7ZfFiqv/cV1AeUZr
         OrGvTLbEN5Z6iYibxEEkHwDz+cuNdOQLMhU57qW5G+5qgMHmZjqTxC23WALf7DsBZZTv
         IUloA21JjYAVRZ6IQv5WuHGoPCiCv9lNvdmxF10AA+6/zrT3vc7SKVwfBxQX/K6+W05P
         Sd7VtkUhlKWLh6zY8R5qr4grm5eZnfocBLzNPLqpOiXVmSaXuf/KSyVZDCuWh1htHHOg
         1vEQ==
X-Gm-Message-State: AOJu0YxaJpuCOYnuQiPmyeXxRh2mntSZYrD9fbGF+qxzT4ur2vYoZg0A
	2sUp/qRTC0wF68MublshNcom4M51WIsMzA==
X-Google-Smtp-Source: AGHT+IH/S7JIisoNGvBTXEZaxjNq5r1GDVgmrbNp97OUhs4V0yA8fROC6ehfS2RcXaQtPAzRdH/lZw==
X-Received: by 2002:a0d:ed06:0:b0:59f:5361:d18c with SMTP id w6-20020a0ded06000000b0059f5361d18cmr6135967ywe.41.1699868800236;
        Mon, 13 Nov 2023 01:46:40 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id h84-20020a815357000000b0057087e7691bsm1681371ywb.56.2023.11.13.01.46.39
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 01:46:39 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d865854ef96so4273689276.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 01:46:39 -0800 (PST)
X-Received: by 2002:a25:42d2:0:b0:da0:c8d1:5c5 with SMTP id
 p201-20020a2542d2000000b00da0c8d105c5mr5227362yba.41.1699868799056; Mon, 13
 Nov 2023 01:46:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231108125843.3806765-18-arnd@kernel.org> <202311090843.b8ISrsV1-lkp@intel.com>
 <87h6lu8ed8.fsf@mail.lhotse>
In-Reply-To: <87h6lu8ed8.fsf@mail.lhotse>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2023 10:46:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxpKwkvU5fcZXLdjRAuaBqj3JxE4JtBcEW55EzidxhCQ@mail.gmail.com>
Message-ID: <CAMuHMdVxpKwkvU5fcZXLdjRAuaBqj3JxE4JtBcEW55EzidxhCQ@mail.gmail.com>
Subject: Re: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Fri, Nov 10, 2023 at 4:42=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> kernel test robot <lkp@intel.com> writes:
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on next-20231108]
> > [cannot apply to v6.6]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/id=
a-make-ida_dump-static/20231109-005742
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20231108125843.3806765-18-arnd=
%40kernel.org
> > patch subject: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic =
prototype
> > config: powerpc64-randconfig-001-20231109 (https://download.01.org/0day=
-ci/archive/20231109/202311090843.b8ISrsV1-lkp@intel.com/config)
> > compiler: powerpc64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20231109/202311090843.b8ISrsV1-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202311090843.b8ISrsV1-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    arch/powerpc/platforms/ps3/gelic_udbg.c:59:1: warning: alignment 1 o=
f 'struct debug_block' is less than 32 [-Wpacked-not-aligned]
> >       59 | } __packed;
> >          | ^
> >>> arch/powerpc/platforms/ps3/gelic_udbg.c:240:6: error: redefinition of=
 'udbg_shutdown_ps3gelic'
> >      240 | void udbg_shutdown_ps3gelic(void)
> >          |      ^~~~~~~~~~~~~~~~~~~~~~
> >    In file included from arch/powerpc/platforms/ps3/gelic_udbg.c:17:
> >    arch/powerpc/include/asm/ps3.h:520:20: note: previous definition of =
'udbg_shutdown_ps3gelic' with type 'void(void)'
> >      520 | static inline void udbg_shutdown_ps3gelic(void) {}
> >          |                    ^~~~~~~~~~~~~~~~~~~~~~
>
> As pointed out by Arnd this is due to there being two symbols that
> control the gelic_udbg.c code.
>
> I don't see the need for PS3GELIC_UDBG, without PPC_EARLY_DEBUG_PS3GELIC
> it just causes gelic_udbg.c to be built, but never called.

My first thought was: PPC_EARLY_DEBUG_PS3GELIC is meant as an early
debugging console, while PS3GELIC_UDBG can be used with xmon later,
but that does not seem to be the case.

> The diff below fixes the error AFAICS.

So your changes on top LGTM.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
