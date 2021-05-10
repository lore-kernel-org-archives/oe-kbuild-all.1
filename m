Content-Type: multipart/mixed; boundary="===============0812213693120874246=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 3/3] asm-generic/io.h: warn in inb() and friends with undefined PCI_IOBASE
Date: Mon, 10 May 2021 15:43:08 +0200
Message-ID: <CAK8P3a0CiVFvgpJJMcutHv6gdfeKWN2=AWYDuAX-ohEg3+L3gQ@mail.gmail.com>
In-Reply-To: <202105102111.SyGVczHt-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0812213693120874246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 3:30 PM kernel test robot <lkp@intel.com> wrote:
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/kernel.h:10,
>                     from include/linux/list.h:9,
>                     from include/linux/module.h:12,
>                     from drivers/net/arcnet/com20020.c:31:
>    drivers/net/arcnet/com20020.c: In function 'com20020_reset':
> >> include/linux/compiler.h:70:32: warning: 'inbyte' is used uninitialize=
d in this function [-Wuninitialized]
>       70 |   (__if_trace.miss_hit[1]++,1) :  \
>          |                                ^
>    drivers/net/arcnet/com20020.c:286:9: note: 'inbyte' was declared here
>      286 |  u_char inbyte;
>          |         ^~~~~~

This looks like a real problem with the patch: the insb()/insw()/insl() hel=
pers
should memset(buffer, 0xff, size) to avoid using random stack data.

        Arnd
--===============0812213693120874246==--

