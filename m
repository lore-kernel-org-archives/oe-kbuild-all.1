Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA123DB8A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aRTWt2nb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40b422a274dso75325e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 Dec 2023 06:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701872001; x=1702476801; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjpC//5PaH5MlpglOBWONfwPHMO5yUu2Cca+8Nxj9q0=;
        b=aRTWt2nbz4SYPhsnYjITQ7fjgDcjbC6Bx7WQAy4HykuZr+Zm8QWlzN+jKX02WYWhIx
         5UxOWlGcfz+mWekEEVXyRJLj8UHaHw4EMWwQAQDIHPCE7NL7lbQPGmhL3MJL4NL3DXig
         idRAUF/W1mToSlnxFGauic3yb+bEmg29PTKHNySK5WUhlI3Cwp0tKSuis0G1ryhprTFF
         zHBqGkjK8RUhG5s6C1bT2RJBTVsNIJ+QohXoIbPdSoZYBtT3rQ+FPdmvti7zSWD9DBJM
         cJ6HuZkEHzjYqsNbJ8Bu1EREOsKoYCVSpmzyZIY3Fdg7bSBmrH+VLHcBLZVMd9nubxeN
         LB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701872001; x=1702476801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjpC//5PaH5MlpglOBWONfwPHMO5yUu2Cca+8Nxj9q0=;
        b=UP1sZprstxXbdSYJvgxX4HEgs4hjSDiqsPo7WKMmV0OrZlllWCkwlhzo1ztHh0JM4I
         ytpQ/+AFDWWlNndOC7OD6jsXtx7GIY267ePrQV7MX8hia6C8pRVIB2XRT/ErrLVWNx0v
         ttHG8plJiMgNpRUOaF7hQL0IU92qizLMOCr8gOt2HwRW37sHlDisux8Ro3QExaggJTlJ
         dw6LofCsPvPGMDFfLpMti9UgWhsZOFmIkZuxs8LHmZtMtlP95J+s9VnnwGs5Iv8HDMC1
         5qrNrjRxHVGzaZbEGeD1+iIQfeFckS2h7TwUspS6wAJ12gp3jr7qT1nQnKeW/xlaQfS3
         7jbw==
X-Gm-Message-State: AOJu0YwRhrMuQnljMfuAfGlTzKibpHWdJbDXa2QR5Z/8PsJrUm/ewS3q
	KJ0IYxPeqLGkIwGT31vuhrNysKoGMq+Swlv3jcqgsQ==
X-Google-Smtp-Source: AGHT+IGQR5NPLFVEchfqvNqbri00T+JO4NSUyiGhhrdE1QU7cwsmaJU0Jm6pxGdLckM5ONyaIBylIVkZ4bhIrncAY7s=
X-Received: by 2002:a05:600c:b46:b0:40b:5972:f56b with SMTP id
 k6-20020a05600c0b4600b0040b5972f56bmr62615wmr.3.1701872001127; Wed, 06 Dec
 2023 06:13:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204195252.2004515-1-maze@google.com> <202312060307.EaL1FRwu-lkp@intel.com>
 <CANP3RGf-G1+OnBYrNpc1c_bzL1b-X4gzc=XtXs+5qArztxm1ug@mail.gmail.com>
 <CANP3RGcCNj1nFT9+Q_c06ox=LidhjBRcH-NWHA_75399fQdVhg@mail.gmail.com> <CANP3RGcgBUAqT1fqX7GRyfCu_snXzaKxzfCtWWiTi_eDNbraeA@mail.gmail.com>
In-Reply-To: <CANP3RGcgBUAqT1fqX7GRyfCu_snXzaKxzfCtWWiTi_eDNbraeA@mail.gmail.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Wed, 6 Dec 2023 06:13:03 -0800
Message-ID: <CANP3RGeJ1fFqKSnLf0xCY5PwDLQw4+aBgPHRtGJ3JzsTU+5m9g@mail.gmail.com>
Subject: Re: [PATCH net] net: ipv6: support reporting otherwise unknown prefix
 flags in RTM_NEWPREFIX
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Network Development Mailing List <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 3:13=E2=80=AFAM Maciej =C5=BBenczykowski <maze@googl=
e.com> wrote:
>
> On Wed, Dec 6, 2023 at 3:05=E2=80=AFAM Maciej =C5=BBenczykowski <maze@goo=
gle.com> wrote:
> >
> > On Wed, Dec 6, 2023 at 3:00=E2=80=AFAM Maciej =C5=BBenczykowski <maze@g=
oogle.com> wrote:
> > >
> > > On Tue, Dec 5, 2023 at 11:12=E2=80=AFAM kernel test robot <lkp@intel.=
com> wrote:
> > > >
> > > > Hi Maciej,
> > > >
> > > > kernel test robot noticed the following build errors:
> > > >
> > > > [auto build test ERROR on net/main]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-enczy=
kowski/net-ipv6-support-reporting-otherwise-unknown-prefix-flags-in-RTM_NEW=
PREFIX/20231205-035333
> > > > base:   net/main
> > > > patch link:    https://lore.kernel.org/r/20231204195252.2004515-1-m=
aze%40google.com
> > > > patch subject: [PATCH net] net: ipv6: support reporting otherwise u=
nknown prefix flags in RTM_NEWPREFIX
> > > > config: arm-rpc_defconfig (https://download.01.org/0day-ci/archive/=
20231206/202312060307.EaL1FRwu-lkp@intel.com/config)
> > > > compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20231206/202312060307.EaL1FRwu-lkp@intel.com/reproduce)
> > >
> > > I followed these steps, and it built just fine...
> > >
> > > maze@laptop:~/K$ git log -n2 --oneline
> > > 57cde6e635d5 (HEAD) net: ipv6: support reporting otherwise unknown
> > > prefix flags in RTM_NEWPREFIX
> > > 7037d95a047c (net/main) r8152: add vendor/device ID pair for ASUS USB=
-C2500
> > >
> > > maze@laptop:~/K$ file -sL build_dir/vmlinux
> > > build_dir/vmlinux: ELF 32-bit LSB executable, ARM, EABI5 version 1
> > > (SYSV), statically linked,
> > > BuildID[sha1]=3Dae5a34fc35b264d707b3f16e920282b96c080508, not strippe=
d
> >
> > ah, the reproduction steps don't actually fetch the .config
>
> the struct *somehow* comes out to be 36 bytes (it was 32 before this patc=
h)
>
> this tentatively looks like it might be triggering a compiler bug?
> will dig deeper.

Looks like it can be fixed by adding attribute packed to both the new
union and struct.
I guess there's some arm32 ABI reason why this is needed...

>
> >
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202312060307.EaL1FR=
wu-lkp@intel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > >    In file included from include/linux/container_of.h:5,
> > > >                     from include/linux/list.h:5,
> > > >                     from include/linux/module.h:12,
> > > >                     from fs/lockd/svc.c:16:
> > > > >> include/linux/build_bug.h:78:41: error: static assertion failed:=
 "sizeof(struct prefix_info) =3D=3D 32"
> > > >       78 | #define __static_assert(expr, msg, ...) _Static_assert(e=
xpr, msg)
> > > >          |                                         ^~~~~~~~~~~~~~
> > > >    include/linux/build_bug.h:77:34: note: in expansion of macro '__=
static_assert'
> > > >       77 | #define static_assert(expr, ...) __static_assert(expr, #=
#__VA_ARGS__, #expr)
> > > >          |                                  ^~~~~~~~~~~~~~~
> > > >    include/net/addrconf.h:58:1: note: in expansion of macro 'static=
_assert'
> > > >       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
> > > >          | ^~~~~~~~~~~~~
> > > > --
> > > >    In file included from lib/vsprintf.c:21:
> > > > >> include/linux/build_bug.h:78:41: error: static assertion failed:=
 "sizeof(struct prefix_info) =3D=3D 32"
> > > >       78 | #define __static_assert(expr, msg, ...) _Static_assert(e=
xpr, msg)
> > > >          |                                         ^~~~~~~~~~~~~~
> > > >    include/linux/build_bug.h:77:34: note: in expansion of macro '__=
static_assert'
> > > >       77 | #define static_assert(expr, ...) __static_assert(expr, #=
#__VA_ARGS__, #expr)
> > > >          |                                  ^~~~~~~~~~~~~~~
> > > >    include/net/addrconf.h:58:1: note: in expansion of macro 'static=
_assert'
> > > >       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
> > > >          | ^~~~~~~~~~~~~
> > > >    lib/vsprintf.c: In function 'va_format':
> > > >    lib/vsprintf.c:1683:9: warning: function 'va_format' might be a =
candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=3Dformat]
> > > >     1683 |         buf +=3D vsnprintf(buf, end > buf ? end - buf : =
0, va_fmt->fmt, va);
> > > >          |         ^~~
> > > > --
> > > >    In file included from include/linux/container_of.h:5,
> > > >                     from include/linux/list.h:5,
> > > >                     from include/linux/module.h:12,
> > > >                     from net/ipv4/route.c:63:
> > > > >> include/linux/build_bug.h:78:41: error: static assertion failed:=
 "sizeof(struct prefix_info) =3D=3D 32"
> > > >       78 | #define __static_assert(expr, msg, ...) _Static_assert(e=
xpr, msg)
> > > >          |                                         ^~~~~~~~~~~~~~
> > > >    include/linux/build_bug.h:77:34: note: in expansion of macro '__=
static_assert'
> > > >       77 | #define static_assert(expr, ...) __static_assert(expr, #=
#__VA_ARGS__, #expr)
> > > >          |                                  ^~~~~~~~~~~~~~~
> > > >    include/net/addrconf.h:58:1: note: in expansion of macro 'static=
_assert'
> > > >       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
> > > >          | ^~~~~~~~~~~~~
> > > >    net/ipv4/route.c: In function 'ip_rt_send_redirect':
> > > >    net/ipv4/route.c:880:13: warning: variable 'log_martians' set bu=
t not used [-Wunused-but-set-variable]
> > > >      880 |         int log_martians;
> > > >          |             ^~~~~~~~~~~~
> > > > --
> > > >    In file included from include/linux/container_of.h:5,
> > > >                     from include/linux/list.h:5,
> > > >                     from include/linux/timer.h:5,
> > > >                     from include/linux/workqueue.h:9,
> > > >                     from include/linux/bpf.h:10,
> > > >                     from net/ipv6/ip6_fib.c:18:
> > > > >> include/linux/build_bug.h:78:41: error: static assertion failed:=
 "sizeof(struct prefix_info) =3D=3D 32"
> > > >       78 | #define __static_assert(expr, msg, ...) _Static_assert(e=
xpr, msg)
> > > >          |                                         ^~~~~~~~~~~~~~
> > > >    include/linux/build_bug.h:77:34: note: in expansion of macro '__=
static_assert'
> > > >       77 | #define static_assert(expr, ...) __static_assert(expr, #=
#__VA_ARGS__, #expr)
> > > >          |                                  ^~~~~~~~~~~~~~~
> > > >    include/net/addrconf.h:58:1: note: in expansion of macro 'static=
_assert'
> > > >       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
> > > >          | ^~~~~~~~~~~~~
> > > >    net/ipv6/ip6_fib.c: In function 'fib6_add':
> > > >    net/ipv6/ip6_fib.c:1384:32: warning: variable 'pn' set but not u=
sed [-Wunused-but-set-variable]
> > > >     1384 |         struct fib6_node *fn, *pn =3D NULL;
> > > >          |                                ^~
> > > >
> > > >
> > > > vim +78 include/linux/build_bug.h
> > > >
> > > > bc6245e5efd70c Ian Abbott       2017-07-10  60
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - =
check integer constant expression at build time
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() =
is a wrapper for the C11 _Static_assert, with a
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro mag=
ic to make the message optional (defaulting to the
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification =
of the tested expression).
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUIL=
D_BUG_ON(), static_assert() can be used at global
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requi=
res the expression to be an integer constant
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e.=
, it is not enough that __builtin_constant_p() is
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that B=
UILD_BUG_ON() fails the build if the condition is
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while stat=
ic_assert() fails the build if the expression is
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_asse=
rt(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_as=
sert(expr, msg, ...) _Static_assert(expr, msg)
> > > > 6bab69c65013be Rasmus Villemoes 2019-03-07  79
> > > > 07a368b3f55a79 Maxim Levitsky   2022-10-25  80
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://github.com/intel/lkp-tests/wikiMaciej =C5=BBenczykowski, Ke=
rnel Networking Developer @ GoogleMaciej =C5=BBenczykowski, Kernel Networki=
ng Developer @ GoogleMaciej =C5=BBenczykowski, Kernel Networking Developer =
@ GoogleMaciej =C5=BBenczykowski, Kernel Networking Developer @ Google
