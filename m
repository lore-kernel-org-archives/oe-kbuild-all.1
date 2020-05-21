Content-Type: multipart/mixed; boundary="===============7178265235246702918=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [dhowells-fs:fscache-iter 21/61] fs/fscache/obj.c:278:27: warning: comparison is always false due to limited range of data type
Date: Thu, 21 May 2020 23:41:20 +0100
Message-ID: <508924.1590100880@warthog.procyon.org.uk>
In-Reply-To: <202005220246.emIuqDjI%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7178265235246702918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kbuild test robot <lkp@intel.com> wrote:

> In file included from include/linux/export.h:43:0,
> from include/linux/linkage.h:7,
> from include/linux/kernel.h:8,
> from include/linux/list.h:9,
> from include/linux/module.h:12,
> from fs/fscache/obj.c:12:
> fs/fscache/obj.c: In function 'fscache_drop_object':
> >> fs/fscache/obj.c:278:27: warning: comparison is always false due to li=
mited range of data type [-Wtype-limits]
> ASSERTCMP(cookie->stage, =3D=3D, FSCACHE_COOKIE_STAGE_DEAD);
> ^
> include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
> # define unlikely(x) __builtin_expect(!!(x), 0)
> ^
> >> fs/fscache/obj.c:278:2: note: in expansion of macro 'ASSERTCMP'
> ASSERTCMP(cookie->stage, =3D=3D, FSCACHE_COOKIE_STAGE_DEAD);
> ^

This looks like a false error.  It doesn't seem to happen with more recent
gccs.

David

--===============7178265235246702918==--

