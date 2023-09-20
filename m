Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DBB1643E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 12:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8060C433CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695213858;
	bh=DNP01UwTuQl84B18wxyvg7e1mHU+Em/d03QG0jjIjZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I3Pbc8dc1/5G32DHXqsmBql8KwhiA4V3jzioXwi1uNekS2KnQ2hEVmmR3r2NeWKxw
	 LtjOGrvn9n1PUzW2qD3SVC/bMuNt5l2EfhrTnVdAvbKM5CWKwKwj7e64z51e1LCL89
	 YqU+TAkQ2LrnysAUseWW7aCeNTmAtpF5MsyN+k/O2Z0mOkp3IVt6Dzar/3lwHUDvQq
	 7+oGILq6V2pQELpcF+snK/3kEJODhM9NA7PREVwXoESau2WmbOaxd+UlW07fbHswWn
	 /wkL6J1Gu9CRGw/GRZEz88BJjk7DNNEL384R3YRUxXyMEz2aBmDms+a8nY3vqyqzeX
	 /Slhhrb9hL7GA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so11444700e87.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 05:44:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YwcAE/g+464uYzH5jmZ6pwR0WGG/GFbz4qasZMrxRPHguQEn/oi
	rDW5/mqwAsLre1F2rOozUv4i17s0fxwhi4uC/Q==
X-Google-Smtp-Source: AGHT+IHdUdnjoYEecOz4wBTDIC7Q29e9zLtliwOZyJGv33ujxTgyjuaawAnSQLlVKPLNqxOOxAuLffcHaOWV7gAg5D8=
X-Received: by 2002:a19:ca52:0:b0:503:3862:5ecf with SMTP id
 h18-20020a19ca52000000b0050338625ecfmr1829927lfj.61.1695213856823; Wed, 20
 Sep 2023 05:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309192013.vI4DKHmw-lkp@intel.com> <CAL_JsqJ0BoR7Dan3=oyWPa6HU3YV=eOFTO5fx7u5zz2i=eB-jQ@mail.gmail.com>
 <a57afd40-71a2-aa68-84cb-44d2a88a1e2b@roeck-us.net>
In-Reply-To: <a57afd40-71a2-aa68-84cb-44d2a88a1e2b@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Sep 2023 07:44:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJYPJVTxH=d5nYK78+ZWhZAfh4VhEyBLqzyg4MzMhrX0g@mail.gmail.com>
Message-ID: <CAL_JsqJYPJVTxH=d5nYK78+ZWhZAfh4VhEyBLqzyg4MzMhrX0g@mail.gmail.com>
Subject: Re: arch/m68k/include/asm/raw_io.h:91:13: warning: array subscript 0
 is outside array bounds of 'volatile u16[0]' {aka 'volatile short unsigned int[]'}
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 6:14=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 9/19/23 11:37, Rob Herring wrote:
> > On Tue, Sep 19, 2023 at 7:09=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> >>
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git master
> >> head:   2cf0f715623872823a72e451243bbf555d10d032
> >> commit: f1a43aadb5a690e141a3b6700e2a40c1d4dbe088 watchdog: Enable COMP=
ILE_TEST for more drivers
> >> date:   5 weeks ago
> >> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/202=
30919/202309192013.vI4DKHmw-lkp@intel.com/config)
> >> compiler: m68k-linux-gcc (GCC) 13.2.0
> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20230919/202309192013.vI4DKHmw-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202309192013.vI4DKHmw-=
lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>     In file included from arch/m68k/include/asm/io_mm.h:25,
> >>                      from arch/m68k/include/asm/io.h:8,
> >>                      from include/linux/io.h:13,
> >>                      from drivers/watchdog/machzwd.c:39:
> >>     In function 'zf_set_timer',
> >>         inlined from 'zf_timer_on' at drivers/watchdog/machzwd.c:218:2=
:
> >>>> arch/m68k/include/asm/raw_io.h:91:13: warning: array subscript 0 is =
outside array bounds of 'volatile u16[0]' {aka 'volatile short unsigned int=
[]'} [-Warray-bounds=3D]
> >>        91 |         __w =3D ((*(__force volatile u16 *) ((_addr & 0xFF=
FF0000UL) + ((__v >> 8)<<1)))); \
> >>           |         ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>     arch/m68k/include/asm/io_mm.h:228:20: note: in expansion of macro =
'rom_out_le16'
> >>       228 |                  : rom_out_le16(isa_itw(port), (val)))
> >>           |                    ^~~~~~~~~~~~
> >>     arch/m68k/include/asm/io_mm.h:356:42: note: in expansion of macro =
'isa_rom_outw'
> >>       356 | #define outw(val, port) ((port) < 1024 ? isa_rom_outw((val=
), (port)) : out_le16((port), (val)))
> >>           |                                          ^~~~~~~~~~~~
> >>     drivers/watchdog/machzwd.c:74:53: note: in expansion of macro 'out=
w'
> >>        74 | #define zf_writew(port, data)  { outb(port, INDEX); outw(d=
ata, DATA_W); }
> >>           |                                                     ^~~~
> >>     drivers/watchdog/machzwd.c:173:17: note: in expansion of macro 'zf=
_writew'
> >>       173 |                 zf_writew(COUNTER_1, new);
> >>           |                 ^~~~~~~~~
> >>     In function 'zf_timer_on':
> >>     cc1: note: source object is likely at address zero
> >
> > This seems to be some newish check in gcc which looks for fixed
> > pointers below 4KB[1]. The linked issue says more was planned for
> > gcc-13, but I haven't found what that is. AFAICT, that shouldn't
> > happen with this config because isa_itw() should be variable and the
> > compiler shouldn't be able to determine the value of _addr. However, a
> > config with CONFIG_Q40=3Dn, CONFIG_AMIGA_PCMCIA=3Dn, and
> > CONFIG_ATARI_ROM_ISA=3Dn would have a fixed NULL value and could trigge=
r
> > the warning. This should also have warnings everywhere outw() (and
> > others) are used with a constant port value.
> >
> > Rob
> >
> > [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99578
>
> A long time ago, when someone submitted a "cleanup: patch for the machzwd
> watchdog driver, I approved it but added this comment.
>
>  > If anyone is still using the HW supported by this driver, it would
>  > be a prime target for conversion to use the watchdog subsystem.
>  > This would reduce code size and improve driver stability.
>  > _That_ would be useful.
>
>  > The only reason for replacing 0 with NULL is to make a static checker
>  > happy. This kind of change adds zero value to the code. Instead, it
>  > takes time from those who have to review the patches and apply them.
>
>  > If we ignore such patches, we'll get them again and again, taking
>  > away even more time. If we don't ignore them, we encourage submitters
>  > and get even more useless patches. If we try to discourage them, we
>  > risk being accused of being unfriendly. This is a perfect lose-lose
>  > situation for maintainers.

Agreed. I keep getting one to fix "of of" in a comment. The fix is
always to drop an "of", but that's actually wrong because it's
supposed to be "OF". I keep pointing this out and *never* get the
right fix. I don't fix it myself because at this point, I find
continuing to get "fixes" entertaining.

> I do wonder if enabling BUILD_TEST on such drivers is any better.

I think that and trivial fixes on a specific driver are completely
different. If you want to test build one driver, that's not too hard.
Find its kconfig value, turn it on and build the right arch. For tree
wide stuff, it's a real pain to ensure you built everything. For
example, the only way to build many Cavium Octeon drivers is with the
Octeon defconfig which is just one of dozens configs for MIPS (which
is still a bigger mess than arm32 ever was).

Rob
