Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8201F176
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYFdNOVY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-53f34f2718cso9204a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 04:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697629095; x=1698233895; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STTsMbTBgObpgELyLV78+gcE/8OGGsU57S4LliLB9Kw=;
        b=GYFdNOVYbNH4otBU+1u9Ev+AjGONpSxXpSpsWJ5M0ofipn+EO1tc3skHsMTIFsHmoP
         8/y7RvdjOdhVD1NzNDhaiWiHk+MGlQK/aCAz9oEVVtvCYbf3Ul/ubr5DaHjSC4LUqMen
         GZmIHZkJ+d8IJGS82NB6Cc5ZmQn/zk7goQ+4XUPVUlMHjwQQPy5B97tir31ETjuqF/hp
         sBb+m2hPeaTDgqId2Hq3mSoNeqUf+1hjdoLu4ueO3hKo4Sta90bC14LCVrtWNUXSJyoi
         Wjk2Y20R5fMAsZl/RUSA3mCohvpSxnMbdhp3SDssmCANgrSF3AptK6b6MrxPB/CNlVg7
         RyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697629095; x=1698233895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STTsMbTBgObpgELyLV78+gcE/8OGGsU57S4LliLB9Kw=;
        b=LeZpXGFU2gNLEVyuVjSijJDAvcuAGNZso8Jai5ZcnHzRHr/DiZqVA/fPtz2E99hShL
         DJvy2K1Pbd6XUIlacbPps/uJ7FJrvMw855z1THA0NY/NLevqtw6Cs8vfwvY6+iqOZzmr
         BH3wkHys2sWFWLC/y/2GsV/5VN7xZ/7nBnhLr4QYuqNCjEPdu7LFF3JybW+4UP2bgRJK
         iUqa8YFCr2zprKCd+tu0KGzeiFm4ffmDnQcKaWnfrs3XCG1oHUIO7B0xDRedY7gurLmU
         IgHlQrW34V2Vuen9Z6RPGRvfugyXHahdTW71uNxVed++HAc/NWVxSjTnQXsf10xVf/dn
         qTow==
X-Gm-Message-State: AOJu0Yy12B57VMhrA91kokblr84iXIUG53Zwr1qAw8OhJ8PQJ4fpMpuh
	n6/Vv9cw3ZI7MGFil2w2WRb25Kn2VDScC8j1PCqPbw==
X-Google-Smtp-Source: AGHT+IHwq4M8H0UkofKAF/TVzR3Jad70qARCpa9At1fuSuTdH+L4pAXvFz8M9hj4k+RlrzYZvH3tJ3K86NKruAecKtE=
X-Received: by 2002:a50:ab17:0:b0:53f:2694:c3d4 with SMTP id
 s23-20020a50ab17000000b0053f2694c3d4mr113577edc.4.1697629094350; Wed, 18 Oct
 2023 04:38:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310181854.pKtHd7fD-lkp@intel.com>
In-Reply-To: <202310181854.pKtHd7fD-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 18 Oct 2023 13:38:00 +0200
Message-ID: <CANn89iKdMVNrV_0QienhpCJ98D7hj2sqOOYFhhSHBVHzvtkgWQ@mail.gmail.com>
Subject: Re: [linux-next:master 5136/13299] include/asm-generic/rwonce.h:44:26:
 warning: array subscript 0 is outside array bounds of '__u8[0]' {aka
 'unsigned char[]'}
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 1:01=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Eric,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   2dac75696c6da3c848daa118a729827541c89d33
> commit: fa17a6d8a5bd0cd7565b613cb804242cd0f6b7ab [5136/13299] ipv6: lockl=
ess IPV6_ADDR_PREFERENCES implementation
> config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231018=
/202310181854.pKtHd7fD-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231018/202310181854.pKtHd7fD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310181854.pKtHd7fD-lkp=
@intel.com/
>

I have no idea why this compiler is not happy.

I would probably contact a compiler maintainer perhaps ?


> All warnings (new ones prefixed by >>):
>
>    In file included from arch/alpha/include/asm/rwonce.h:33,
>                     from include/linux/compiler.h:246,
>                     from include/linux/string.h:5,
>                     from net/sunrpc/xprtsock.c:23:
>    In function 'ip6_sock_set_addr_preferences',
>        inlined from 'xs_tcp_finish_connecting' at net/sunrpc/xprtsock.c:2=
325:4,
>        inlined from 'xs_tcp_setup_socket' at net/sunrpc/xprtsock.c:2405:1=
1:
> >> include/asm-generic/rwonce.h:44:26: warning: array subscript 0 is outs=
ide array bounds of '__u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=3D]
>       44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_type=
of(x) *)&(x))
>          |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
>    include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WR=
ITE_ONCE'
>       55 |         *(volatile typeof(x) *)&(x) =3D (val);                =
            \
>          |                                        ^~~
>    include/net/ipv6.h:1365:9: note: in expansion of macro 'WRITE_ONCE'
>     1365 |         WRITE_ONCE(inet6_sk(sk)->srcprefs,
>          |         ^~~~~~~~~~
>    include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ=
_ONCE'
>       50 |         __READ_ONCE(x);                                       =
          \
>          |         ^~~~~~~~~~~
>    include/net/ipv6.h:1366:21: note: in expansion of macro 'READ_ONCE'
>     1366 |                    (READ_ONCE(inet6_sk(sk)->srcprefs) & prefma=
sk) | pref);
>          |                     ^~~~~~~~~
>    In function 'xs_tcp_setup_socket':
>    cc1: note: source object is likely at address zero
>    In function 'ip6_sock_set_addr_preferences',
>        inlined from 'xs_tcp_finish_connecting' at net/sunrpc/xprtsock.c:2=
325:4,
>        inlined from 'xs_tcp_setup_socket' at net/sunrpc/xprtsock.c:2405:1=
1:
>    include/asm-generic/rwonce.h:55:37: warning: array subscript 0 is outs=
ide array bounds of '__u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=3D]
>       55 |         *(volatile typeof(x) *)&(x) =3D (val);                =
            \
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
>    include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRIT=
E_ONCE'
>       61 |         __WRITE_ONCE(x, val);                                 =
          \
>          |         ^~~~~~~~~~~~
>    include/net/ipv6.h:1365:9: note: in expansion of macro 'WRITE_ONCE'
>     1365 |         WRITE_ONCE(inet6_sk(sk)->srcprefs,
>          |         ^~~~~~~~~~
>    In function 'xs_tcp_setup_socket':
>    cc1: note: source object is likely at address zero
>    In function 'ip6_sock_set_addr_preferences',
>        inlined from 'xs_tcp_tls_finish_connecting' at net/sunrpc/xprtsock=
.c:2478:4:
> >> include/asm-generic/rwonce.h:44:26: warning: array subscript 0 is outs=
ide array bounds of '__u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=3D]
>       44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_type=
of(x) *)&(x))
>          |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
>    include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WR=
ITE_ONCE'
>       55 |         *(volatile typeof(x) *)&(x) =3D (val);                =
            \
>          |                                        ^~~
>    include/net/ipv6.h:1365:9: note: in expansion of macro 'WRITE_ONCE'
>     1365 |         WRITE_ONCE(inet6_sk(sk)->srcprefs,
>          |         ^~~~~~~~~~
>    include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ=
_ONCE'
>       50 |         __READ_ONCE(x);                                       =
          \
>          |         ^~~~~~~~~~~
>    include/net/ipv6.h:1366:21: note: in expansion of macro 'READ_ONCE'
>     1366 |                    (READ_ONCE(inet6_sk(sk)->srcprefs) & prefma=
sk) | pref);
>          |                     ^~~~~~~~~
>    In function 'xs_tcp_tls_finish_connecting':
>    cc1: note: source object is likely at address zero
>    In function 'ip6_sock_set_addr_preferences',
>        inlined from 'xs_tcp_tls_finish_connecting' at net/sunrpc/xprtsock=
.c:2478:4:
>    include/asm-generic/rwonce.h:55:37: warning: array subscript 0 is outs=
ide array bounds of '__u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=3D]
>       55 |         *(volatile typeof(x) *)&(x) =3D (val);                =
            \
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
>    include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRIT=
E_ONCE'
>       61 |         __WRITE_ONCE(x, val);                                 =
          \
>          |         ^~~~~~~~~~~~
>    include/net/ipv6.h:1365:9: note: in expansion of macro 'WRITE_ONCE'
>     1365 |         WRITE_ONCE(inet6_sk(sk)->srcprefs,
>          |         ^~~~~~~~~~
>    In function 'xs_tcp_tls_finish_connecting':
>    cc1: note: source object is likely at address zero
>
>
> vim +44 include/asm-generic/rwonce.h
>
> e506ea451254ab Will Deacon 2019-10-15  28
> e506ea451254ab Will Deacon 2019-10-15  29  /*
> e506ea451254ab Will Deacon 2019-10-15  30   * Yes, this permits 64-bit ac=
cesses on 32-bit architectures. These will
> e506ea451254ab Will Deacon 2019-10-15  31   * actually be atomic in some =
cases (namely Armv7 + LPAE), but for others we
> e506ea451254ab Will Deacon 2019-10-15  32   * rely on the access being sp=
lit into 2x32-bit accesses for a 32-bit quantity
> e506ea451254ab Will Deacon 2019-10-15  33   * (e.g. a virtual address) an=
d a strong prevailing wind.
> e506ea451254ab Will Deacon 2019-10-15  34   */
> e506ea451254ab Will Deacon 2019-10-15  35  #define compiletime_assert_rwo=
nce_type(t)                                    \
> e506ea451254ab Will Deacon 2019-10-15  36       compiletime_assert(__nati=
ve_word(t) || sizeof(t) =3D=3D sizeof(long long),  \
> e506ea451254ab Will Deacon 2019-10-15  37               "Unsupported acce=
ss size for {READ,WRITE}_ONCE().")
> e506ea451254ab Will Deacon 2019-10-15  38
> e506ea451254ab Will Deacon 2019-10-15  39  /*
> e506ea451254ab Will Deacon 2019-10-15  40   * Use __READ_ONCE() instead o=
f READ_ONCE() if you do not require any
> 3c9184109e78ea Will Deacon 2019-10-30  41   * atomicity. Note that this m=
ay result in tears!
> e506ea451254ab Will Deacon 2019-10-15  42   */
> b78b331a3f5c07 Will Deacon 2019-10-15  43  #ifndef __READ_ONCE
> e506ea451254ab Will Deacon 2019-10-15 @44  #define __READ_ONCE(x)       (=
*(const volatile __unqual_scalar_typeof(x) *)&(x))
> b78b331a3f5c07 Will Deacon 2019-10-15  45  #endif
> e506ea451254ab Will Deacon 2019-10-15  46
>
> :::::: The code at line 44 was first introduced by commit
> :::::: e506ea451254ab17e0bf918ca36232fec2a9b10c compiler.h: Split {READ,W=
RITE}_ONCE definitions out into rwonce.h
>
> :::::: TO: Will Deacon <will@kernel.org>
> :::::: CC: Will Deacon <will@kernel.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
