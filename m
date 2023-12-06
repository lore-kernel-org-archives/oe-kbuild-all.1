Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196A930654
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DajrcTU3"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50bf1de91c6so2024e87.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 Dec 2023 03:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701860419; x=1702465219; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMmFaZvS5h7RToi/+q85mvu4ziKR87LzF0o4UNMVquo=;
        b=DajrcTU3lo0p2d6LoiD7Hlm87BOfl4VU5ohLJwC9mwz7l75mO1Xwc4nsKPRGJME7Id
         MpUvB+5aHv69YmIsah0uckEPz5l3cF6uxq1KzQWMBHBUZu+ol/Yxgru7pKzKBtMsvLIY
         X3G/9exzl6ruYqnObLdJ1lW5xOY8FJAIqu4AAxd1WCii2KlsqJKpt6gdn+JbYsQ90tWU
         Hu/Mc6l5c+KnSBz61q15Ul85m8Jc9S174u95KDLBgPYVKBzejXepTo4iP0jG0t3+eP7A
         6HpUxMddgbtEFw5t1my9gNCTKjQ7rs5DS6KEFsmZ81W1GFdU1+owoxekrEMKCYP46T1T
         DS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701860419; x=1702465219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMmFaZvS5h7RToi/+q85mvu4ziKR87LzF0o4UNMVquo=;
        b=Ve9kPYG8wVzReUaOIRR3NaWJCF49pv1W78sDvrHc85c/7zuqy2kcAPo/ScmMyopAf6
         9iYfdYemoSPvgK2L6iHoivIMc6e5SJG0vCw7RjO37/8MC/DByuFppSDeI+wIBWT+pF+P
         K0DGvQoStr3FotyCC2rufcZjv3GHw3b7K9O1dVRqIWsi6WZ6t/9ekgi/LJuwQLqj/j19
         rQdx5ey7vfyRnNb6SUl1vWIYHBmOvePvHaIOHEW2dwiMQa3kEL0Jho2HG3vX0Y9CHiij
         /4IZrVD697q8dI4WGWccH8e3Og9AynQNX+lN4N+/IUdF1fT3KpMrVIMwUXVozuQqfMkg
         Totw==
X-Gm-Message-State: AOJu0YwFX0m2+ZRL1X8xbJsqXpdxMlPpQFkhcxhrRHltBEZ2r+s0G7/C
	e1u51gdKQn0o+TWU1rly0vKyPJri4ft4e+uqjDJQgw==
X-Google-Smtp-Source: AGHT+IENucUE82TjA2D5ix61H2xEyJajRb/c5mDoL6ZpULdZJYGqBFYgXmv/DlWZBwbBxxWQ7aZ5cKn1yJnS5HkmmNk=
X-Received: by 2002:ac2:549c:0:b0:50b:fcb7:15af with SMTP id
 t28-20020ac2549c000000b0050bfcb715afmr23062lfk.3.1701860418766; Wed, 06 Dec
 2023 03:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231204195252.2004515-1-maze@google.com> <202312060307.EaL1FRwu-lkp@intel.com>
In-Reply-To: <202312060307.EaL1FRwu-lkp@intel.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Wed, 6 Dec 2023 03:00:00 -0800
Message-ID: <CANP3RGf-G1+OnBYrNpc1c_bzL1b-X4gzc=XtXs+5qArztxm1ug@mail.gmail.com>
Subject: Re: [PATCH net] net: ipv6: support reporting otherwise unknown prefix
 flags in RTM_NEWPREFIX
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Network Development Mailing List <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shirley Ma <mashirle@us.ibm.com>, David Ahern <dsahern@kernel.org>, 
	Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 11:12=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Maciej,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-enczykowski=
/net-ipv6-support-reporting-otherwise-unknown-prefix-flags-in-RTM_NEWPREFIX=
/20231205-035333
> base:   net/main
> patch link:    https://lore.kernel.org/r/20231204195252.2004515-1-maze%40=
google.com
> patch subject: [PATCH net] net: ipv6: support reporting otherwise unknown=
 prefix flags in RTM_NEWPREFIX
> config: arm-rpc_defconfig (https://download.01.org/0day-ci/archive/202312=
06/202312060307.EaL1FRwu-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231206/202312060307.EaL1FRwu-lkp@intel.com/reproduce)

I followed these steps, and it built just fine...

maze@laptop:~/K$ git log -n2 --oneline
57cde6e635d5 (HEAD) net: ipv6: support reporting otherwise unknown
prefix flags in RTM_NEWPREFIX
7037d95a047c (net/main) r8152: add vendor/device ID pair for ASUS USB-C2500

maze@laptop:~/K$ file -sL build_dir/vmlinux
build_dir/vmlinux: ELF 32-bit LSB executable, ARM, EABI5 version 1
(SYSV), statically linked,
BuildID[sha1]=3Dae5a34fc35b264d707b3f16e920282b96c080508, not stripped

>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312060307.EaL1FRwu-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/container_of.h:5,
>                     from include/linux/list.h:5,
>                     from include/linux/module.h:12,
>                     from fs/lockd/svc.c:16:
> >> include/linux/build_bug.h:78:41: error: static assertion failed: "size=
of(struct prefix_info) =3D=3D 32"
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, m=
sg)
>          |                                         ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static=
_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_=
ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    include/net/addrconf.h:58:1: note: in expansion of macro 'static_asser=
t'
>       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
>          | ^~~~~~~~~~~~~
> --
>    In file included from lib/vsprintf.c:21:
> >> include/linux/build_bug.h:78:41: error: static assertion failed: "size=
of(struct prefix_info) =3D=3D 32"
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, m=
sg)
>          |                                         ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static=
_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_=
ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    include/net/addrconf.h:58:1: note: in expansion of macro 'static_asser=
t'
>       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
>          | ^~~~~~~~~~~~~
>    lib/vsprintf.c: In function 'va_format':
>    lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candid=
ate for 'gnu_printf' format attribute [-Wsuggest-attribute=3Dformat]
>     1683 |         buf +=3D vsnprintf(buf, end > buf ? end - buf : 0, va_=
fmt->fmt, va);
>          |         ^~~
> --
>    In file included from include/linux/container_of.h:5,
>                     from include/linux/list.h:5,
>                     from include/linux/module.h:12,
>                     from net/ipv4/route.c:63:
> >> include/linux/build_bug.h:78:41: error: static assertion failed: "size=
of(struct prefix_info) =3D=3D 32"
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, m=
sg)
>          |                                         ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static=
_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_=
ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    include/net/addrconf.h:58:1: note: in expansion of macro 'static_asser=
t'
>       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
>          | ^~~~~~~~~~~~~
>    net/ipv4/route.c: In function 'ip_rt_send_redirect':
>    net/ipv4/route.c:880:13: warning: variable 'log_martians' set but not =
used [-Wunused-but-set-variable]
>      880 |         int log_martians;
>          |             ^~~~~~~~~~~~
> --
>    In file included from include/linux/container_of.h:5,
>                     from include/linux/list.h:5,
>                     from include/linux/timer.h:5,
>                     from include/linux/workqueue.h:9,
>                     from include/linux/bpf.h:10,
>                     from net/ipv6/ip6_fib.c:18:
> >> include/linux/build_bug.h:78:41: error: static assertion failed: "size=
of(struct prefix_info) =3D=3D 32"
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, m=
sg)
>          |                                         ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static=
_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_=
ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    include/net/addrconf.h:58:1: note: in expansion of macro 'static_asser=
t'
>       58 | static_assert(sizeof(struct prefix_info) =3D=3D 32);
>          | ^~~~~~~~~~~~~
>    net/ipv6/ip6_fib.c: In function 'fib6_add':
>    net/ipv6/ip6_fib.c:1384:32: warning: variable 'pn' set but not used [-=
Wunused-but-set-variable]
>     1384 |         struct fib6_node *fn, *pn =3D NULL;
>          |                                ^~
>
>
> vim +78 include/linux/build_bug.h
>
> bc6245e5efd70c Ian Abbott       2017-07-10  60
> 6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
> 6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check =
integer constant expression at build time
> 6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
> 6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a w=
rapper for the C11 _Static_assert, with a
> 6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to =
make the message optional (defaulting to the
> 6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the=
 tested expression).
> 6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
> 6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_=
ON(), static_assert() can be used at global
> 6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires th=
e expression to be an integer constant
> 6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it i=
s not enough that __builtin_constant_p() is
> 6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
> 6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
> 6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_B=
UG_ON() fails the build if the condition is
> 6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_ass=
ert() fails the build if the expression is
> 6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
> 6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
> 6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(exp=
r, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
> 6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(e=
xpr, msg, ...) _Static_assert(expr, msg)
> 6bab69c65013be Rasmus Villemoes 2019-03-07  79
> 07a368b3f55a79 Maxim Levitsky   2022-10-25  80
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wikiMaciej =C5=BBenczykowski, Kernel N=
etworking Developer @ Google
