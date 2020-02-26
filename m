Content-Type: multipart/mixed; boundary="===============4493631917807064706=="
MIME-Version: 1.0
From: Coly Li <colyli@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.5.y 978/1046] include/linux/compiler.h:188:26: warning: 'sb_page' may be used uninitialized in this function
Date: Wed, 26 Feb 2020 09:55:58 +0800
Message-ID: <6289350d-eef9-0380-fe11-45783c448988@suse.de>
In-Reply-To: <202002260112.SLwtrobY%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4493631917807064706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020/2/26 1:18 =E4=B8=8A=E5=8D=88, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git linux-5.5.y
> head:   d542c06f7665ee93cf6983dac472a1dd12050401
> commit: a81d1c887b5c9f37200578e3d7bbb9134b6ef0a1 [978/1046] bcache: rewor=
k error unwinding in register_bcache
> config: x86_64-randconfig-d001-20200225 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> reproduce:
>         git checkout a81d1c887b5c9f37200578e3d7bbb9134b6ef0a1
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =


This problem was fixed in following patches,

- commit 29cda393bcaa ("bcache: properly initialize 'path' and 'err' in
register_bcache()")
- commit ae3cd299919a ("bcache: fix use-after-free in register_bcache()")

If stable tree has them, it should be OK. And I see these patches are in
stable now.

Thanks.

Coly Li



> Note: it may well be a FALSE warning. FWIW you are at least aware of it n=
ow.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
> =

> All warnings (new ones prefixed by >>):
> =

>    In file included from include/linux/kernel.h:15:0,
>                     from include/linux/list.h:9,
>                     from include/linux/wait.h:7,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:6,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bio.h:8,
>                     from drivers/md/bcache/bcache.h:182,
>                     from drivers/md/bcache/super.c:10:
>    drivers/md/bcache/super.c: In function 'register_bcache':
>    include/linux/printk.h:310:2: warning: 'path' may be used uninitialize=
d in this function [-Wmaybe-uninitialized]
>      printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
>      ^~~~~~
>    drivers/md/bcache/super.c:2379:8: note: 'path' was declared here
>      char *path;
>            ^~~~
>    In file included from include/linux/kernel.h:15:0,
>                     from include/linux/list.h:9,
>                     from include/linux/wait.h:7,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:6,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bio.h:8,
>                     from drivers/md/bcache/bcache.h:182,
>                     from drivers/md/bcache/super.c:10:
>    include/linux/printk.h:310:2: warning: 'err' may be used uninitialized=
 in this function [-Wmaybe-uninitialized]
>      printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
>      ^~~~~~
>    drivers/md/bcache/super.c:2378:14: note: 'err' was declared here
>      const char *err;
>                  ^~~
>    In file included from include/linux/export.h:43:0,
>                     from include/linux/linkage.h:7,
>                     from include/linux/fs.h:5,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bio.h:8,
>                     from drivers/md/bcache/bcache.h:182,
>                     from drivers/md/bcache/super.c:10:
>>> include/linux/compiler.h:188:26: warning: 'sb_page' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
>      case 8: *(__u64 *)res =3D *(volatile __u64 *)p; break;  \
>                              ^
>    drivers/md/bcache/super.c:2382:15: note: 'sb_page' was declared here
>      struct page *sb_page;
>                   ^~~~~~~
> --
>    In file included from include/linux/kernel.h:15:0,
>                     from include/linux/list.h:9,
>                     from include/linux/wait.h:7,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:6,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bio.h:8,
>                     from drivers/md//bcache/bcache.h:182,
>                     from drivers/md//bcache/super.c:10:
>    drivers/md//bcache/super.c: In function 'register_bcache':
>    include/linux/printk.h:310:2: warning: 'path' may be used uninitialize=
d in this function [-Wmaybe-uninitialized]
>      printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
>      ^~~~~~
>    drivers/md//bcache/super.c:2379:8: note: 'path' was declared here
>      char *path;
>            ^~~~
>    In file included from include/linux/kernel.h:15:0,
>                     from include/linux/list.h:9,
>                     from include/linux/wait.h:7,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:6,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bio.h:8,
>                     from drivers/md//bcache/bcache.h:182,
>                     from drivers/md//bcache/super.c:10:
>    include/linux/printk.h:310:2: warning: 'err' may be used uninitialized=
 in this function [-Wmaybe-uninitialized]
>      printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
>      ^~~~~~
>    drivers/md//bcache/super.c:2378:14: note: 'err' was declared here
>      const char *err;
>                  ^~~
>    In file included from include/linux/export.h:43:0,
>                     from include/linux/linkage.h:7,
>                     from include/linux/fs.h:5,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bio.h:8,
>                     from drivers/md//bcache/bcache.h:182,
>                     from drivers/md//bcache/super.c:10:
>>> include/linux/compiler.h:188:26: warning: 'sb_page' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
>      case 8: *(__u64 *)res =3D *(volatile __u64 *)p; break;  \
>                              ^
>    drivers/md//bcache/super.c:2382:15: note: 'sb_page' was declared here
>      struct page *sb_page;
>                   ^~~~~~~
> =

> vim +/sb_page +188 include/linux/compiler.h
> =

> 230fa253df6352 Christian Borntraeger 2014-11-25  181  =

> d976441f44bc5d Andrey Ryabinin       2015-10-19  182  #define __READ_ONCE=
_SIZE						\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  183  ({									\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  184  	switch (size) {			=
				\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  185  	case 1: *(__u8 *)r=
es =3D *(volatile __u8 *)p; break;		\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  186  	case 2: *(__u16 *)=
res =3D *(volatile __u16 *)p; break;		\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  187  	case 4: *(__u32 *)=
res =3D *(volatile __u32 *)p; break;		\
> d976441f44bc5d Andrey Ryabinin       2015-10-19 @188  	case 8: *(__u64 *)=
res =3D *(volatile __u64 *)p; break;		\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  189  	default:							\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  190  		barrier();						\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  191  		__builtin_memcpy(=
(void *)res, (const void *)p, size);	\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  192  		barrier();						\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  193  	}								\
> d976441f44bc5d Andrey Ryabinin       2015-10-19  194  })
> d976441f44bc5d Andrey Ryabinin       2015-10-19  195  =

> =

> :::::: The code at line 188 was first introduced by commit
> :::::: d976441f44bc5d48635d081d277aa76556ffbf8b compiler, atomics, kasan:=
 Provide READ_ONCE_NOCHECK()
> =

> :::::: TO: Andrey Ryabinin <aryabinin@virtuozzo.com>
> :::::: CC: Ingo Molnar <mingo@kernel.org>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =



-- =


Coly Li
--===============4493631917807064706==--

