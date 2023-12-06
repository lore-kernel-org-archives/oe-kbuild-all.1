Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9E30676
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 11:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ow+nRxFs"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so10193a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 Dec 2023 03:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701861236; x=1702466036; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBVUF8HStFhoeBqQa7yskGof2bnIAS9H+Ru2+C87s3c=;
        b=Ow+nRxFsBStrUmU8yK4fEvwPFu6pmiteP8/XOFvjzNfaAXZ5JH9KP4cCB+ar7BbkVJ
         aIhoYgVwqzm8N0Vg92OkMsa05deUUXyTHsjhH+VF44juEFoDcV+fYImPGTmy/o4G3xrg
         sTkLX8/usGJnxF2er3LTGoID3FVa+2nMtRQy4RQhvQNvqLHLjXxqbJkU/kKaywkFnW9U
         rRVPUy4e1/Mw+Kas0VCJBM29e+u/+x0gRSAyvvcBIq4SukxByPLgmEbKC+bYPNQJJY3x
         FCa1fhJ9rH9XZB9jxVjRgIZD0FymK90RuNVetrwhIV83aOK1Abw6AS1ncHXAJHrq8gCj
         Rq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701861236; x=1702466036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBVUF8HStFhoeBqQa7yskGof2bnIAS9H+Ru2+C87s3c=;
        b=paN6fiKJQQmy5dhN6uvqGavDVAkYkVzsD8txgijUph/ILhTcxNNMRsSHgR/ve3L3FV
         OKY3AQ1+jp4aPX3ikk+89ezxsw0ERmSdmmrMEyY0r9LdhvUG4UW6WsxL5U3x6d52yz/W
         DfZLjubbpbTisQCcaDnvYBALn7QKKXBOCatbvtJSGkTHiTkjPFHJ5+5WA77Zo8y/qkTJ
         o0dF9lQ4LGlFcf3t+GrmFJukQ1GK3VAezJhbzrbNr6ylSVM3x68QN3zS7LOBrXGZNSPd
         ZFJ5xuywd5uk19vR+HJqpyuT/eoOcrIHCmsshJJXdu4YBccgmWcXi+8E6aqIEH5LE2yX
         2gGQ==
X-Gm-Message-State: AOJu0YyYv6t+MmCO/NWzxXNVNnTn4VEW81SB1O5vSGaxCggeL0LOXNPg
	G2G+2ZavBUyzq+ees2c2yXBqtAsQ1VxkMtf5gQwtZQ==
X-Google-Smtp-Source: AGHT+IFbUR4C0Fuxnjl1elkyXCs0mJ8VYp3DnR01pI4e2NVnxxQp/bxilpMPdWHzgVXH/ikNG3ersjRkq6MEyfvEn2g=
X-Received: by 2002:a50:d744:0:b0:54c:384b:e423 with SMTP id
 i4-20020a50d744000000b0054c384be423mr58065edj.5.1701861235875; Wed, 06 Dec
 2023 03:13:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204195252.2004515-1-maze@google.com> <202312060307.EaL1FRwu-lkp@intel.com>
 <CANP3RGf-G1+OnBYrNpc1c_bzL1b-X4gzc=XtXs+5qArztxm1ug@mail.gmail.com> <CANP3RGcCNj1nFT9+Q_c06ox=LidhjBRcH-NWHA_75399fQdVhg@mail.gmail.com>
In-Reply-To: <CANP3RGcCNj1nFT9+Q_c06ox=LidhjBRcH-NWHA_75399fQdVhg@mail.gmail.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Wed, 6 Dec 2023 03:13:44 -0800
Message-ID: <CANP3RGcgBUAqT1fqX7GRyfCu_snXzaKxzfCtWWiTi_eDNbraeA@mail.gmail.com>
Subject: Re: [PATCH net] net: ipv6: support reporting otherwise unknown prefix
 flags in RTM_NEWPREFIX
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Network Development Mailing List <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 3:05=E2=80=AFAM Maciej =C5=BBenczykowski <maze@googl=
e.com> wrote:
>
> On Wed, Dec 6, 2023 at 3:00=E2=80=AFAM Maciej =C5=BBenczykowski <maze@goo=
gle.com> wrote:
> >
> > On Tue, Dec 5, 2023 at 11:12=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > Hi Maciej,
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on net/main]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-enczyko=
wski/net-ipv6-support-reporting-otherwise-unknown-prefix-flags-in-RTM_NEWPR=
EFIX/20231205-035333
> > > base:   net/main
> > > patch link:    https://lore.kernel.org/r/20231204195252.2004515-1-maz=
e%40google.com
> > > patch subject: [PATCH net] net: ipv6: support reporting otherwise unk=
nown prefix flags in RTM_NEWPREFIX
> > > config: arm-rpc_defconfig (https://download.01.org/0day-ci/archive/20=
231206/202312060307.EaL1FRwu-lkp@intel.com/config)
> > > compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20231206/202312060307.EaL1FRwu-lkp@intel.com/reproduce)
> >
> > I followed these steps, and it built just fine...
> >
> > maze@laptop:~/K$ git log -n2 --oneline
> > 57cde6e635d5 (HEAD) net: ipv6: support reporting otherwise unknown
> > prefix flags in RTM_NEWPREFIX
> > 7037d95a047c (net/main) r8152: add vendor/device ID pair for ASUS USB-C=
2500
> >
> > maze@laptop:~/K$ file -sL build_dir/vmlinux
> > build_dir/vmlinux: ELF 32-bit LSB executable, ARM, EABI5 version 1
> > (SYSV), statically linked,
> > BuildID[sha1]=3Dae5a34fc35b264d707b3f16e920282b96c080508, not stripped
>
> ah, the reproduction steps don't actually fetch the .config

the struct *somehow* comes out to be 36 bytes (it was 32 before this patch)

this tentatively looks like it might be triggering a compiler bug?
will dig deeper.

>
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202312060307.EaL1FRwu=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from include/linux/container_of.h:5,
> > >                     from include/linux/list.h:5,
> > >                     from include/linux/module.h:12,
> > >                     from fs/lockd/svc.c:16:
> > > >> include/linux/build_bug.h:78:41: error: static assertion failed: "=
sizeof(struct prefix_info) =3D=3D 32"
> > >       78 | #define __static_assert(expr, msg, ...) _Static_assert(exp=
r, msg)
> > >          |                                         ^~~~~~~~~~~~~~
> > >    include/linux/build_bug.h:77:34: note: in expansion of macro '__st=
atic_assert'
> > >       77 | #define static_assert(expr, ...) __static_assert(expr, ##_=
_VA_ARGS__, #expr)
> > >          |                                  ^~~~~~~~~~~~~~~
> > >    include/net/addrconf.h:58:1: note: in expansion of macro 'static_a=
ssert'
> > >       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
> > >          | ^~~~~~~~~~~~~
> > > --
> > >    In file included from lib/vsprintf.c:21:
> > > >> include/linux/build_bug.h:78:41: error: static assertion failed: "=
sizeof(struct prefix_info) =3D=3D 32"
> > >       78 | #define __static_assert(expr, msg, ...) _Static_assert(exp=
r, msg)
> > >          |                                         ^~~~~~~~~~~~~~
> > >    include/linux/build_bug.h:77:34: note: in expansion of macro '__st=
atic_assert'
> > >       77 | #define static_assert(expr, ...) __static_assert(expr, ##_=
_VA_ARGS__, #expr)
> > >          |                                  ^~~~~~~~~~~~~~~
> > >    include/net/addrconf.h:58:1: note: in expansion of macro 'static_a=
ssert'
> > >       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
> > >          | ^~~~~~~~~~~~~
> > >    lib/vsprintf.c: In function 'va_format':
> > >    lib/vsprintf.c:1683:9: warning: function 'va_format' might be a ca=
ndidate for 'gnu_printf' format attribute [-Wsuggest-attribute=3Dformat]
> > >     1683 |         buf +=3D vsnprintf(buf, end > buf ? end - buf : 0,=
 va_fmt->fmt, va);
> > >          |         ^~~
> > > --
> > >    In file included from include/linux/container_of.h:5,
> > >                     from include/linux/list.h:5,
> > >                     from include/linux/module.h:12,
> > >                     from net/ipv4/route.c:63:
> > > >> include/linux/build_bug.h:78:41: error: static assertion failed: "=
sizeof(struct prefix_info) =3D=3D 32"
> > >       78 | #define __static_assert(expr, msg, ...) _Static_assert(exp=
r, msg)
> > >          |                                         ^~~~~~~~~~~~~~
> > >    include/linux/build_bug.h:77:34: note: in expansion of macro '__st=
atic_assert'
> > >       77 | #define static_assert(expr, ...) __static_assert(expr, ##_=
_VA_ARGS__, #expr)
> > >          |                                  ^~~~~~~~~~~~~~~
> > >    include/net/addrconf.h:58:1: note: in expansion of macro 'static_a=
ssert'
> > >       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
> > >          | ^~~~~~~~~~~~~
> > >    net/ipv4/route.c: In function 'ip_rt_send_redirect':
> > >    net/ipv4/route.c:880:13: warning: variable 'log_martians' set but =
not used [-Wunused-but-set-variable]
> > >      880 |         int log_martians;
> > >          |             ^~~~~~~~~~~~
> > > --
> > >    In file included from include/linux/container_of.h:5,
> > >                     from include/linux/list.h:5,
> > >                     from include/linux/timer.h:5,
> > >                     from include/linux/workqueue.h:9,
> > >                     from include/linux/bpf.h:10,
> > >                     from net/ipv6/ip6_fib.c:18:
> > > >> include/linux/build_bug.h:78:41: error: static assertion failed: "=
sizeof(struct prefix_info) =3D=3D 32"
> > >       78 | #define __static_assert(expr, msg, ...) _Static_assert(exp=
r, msg)
> > >          |                                         ^~~~~~~~~~~~~~
> > >    include/linux/build_bug.h:77:34: note: in expansion of macro '__st=
atic_assert'
> > >       77 | #define static_assert(expr, ...) __static_assert(expr, ##_=
_VA_ARGS__, #expr)
> > >          |                                  ^~~~~~~~~~~~~~~
> > >    include/net/addrconf.h:58:1: note: in expansion of macro 'static_a=
ssert'
> > >       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
> > >          | ^~~~~~~~~~~~~
> > >    net/ipv6/ip6_fib.c: In function 'fib6_add':
> > >    net/ipv6/ip6_fib.c:1384:32: warning: variable 'pn' set but not use=
d [-Wunused-but-set-variable]
> > >     1384 |         struct fib6_node *fn, *pn =3D NULL;
> > >          |                                ^~
> > >
> > >
> > > vim +78 include/linux/build_bug.h
> > >
> > > bc6245e5efd70c Ian Abbott       2017-07-10  60
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - ch=
eck integer constant expression at build time
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is=
 a wrapper for the C11 _Static_assert, with a
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic=
 to make the message optional (defaulting to the
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of=
 the tested expression).
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_=
BUG_ON(), static_assert() can be used at global
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but require=
s the expression to be an integer constant
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., =
it is not enough that __builtin_constant_p() is
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUI=
LD_BUG_ON() fails the build if the condition is
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static=
_assert() fails the build if the expression is
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert=
(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_asse=
rt(expr, msg, ...) _Static_assert(expr, msg)
> > > 6bab69c65013be Rasmus Villemoes 2019-03-07  79
> > > 07a368b3f55a79 Maxim Levitsky   2022-10-25  80
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wikiMaciej =C5=BBenczykowski, Kern=
el Networking Developer @ GoogleMaciej =C5=BBenczykowski, Kernel Networking=
 Developer @ GoogleMaciej =C5=BBenczykowski, Kernel Networking Developer @ =
Google
