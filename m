Content-Type: multipart/mixed; boundary="===============5838923559724332742=="
MIME-Version: 1.0
From: Stephen Boyd <swboyd@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2620/2633] include/linux/kernel.h:53:43: error: dereferencing pointer to incomplete type 'struct module'
Date: Wed, 12 May 2021 08:09:46 -0700
Message-ID: <CAE-0n50yT4qsBiYRqd2V1hQfSTygMrmCDTHcD1Hwghuw86o2CQ@mail.gmail.com>
In-Reply-To: <202105122158.G3BQuv9R-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5838923559724332742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting kernel test robot (2021-05-12 06:20:09)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   ec85c95b0c90a17413901b018e8ade7b9eae7cad
> commit: fecf694f2b4b583d7740d55f584411b3062afa7e [2620/2633] module: add =
printk formats to add module build ID to stacktraces
> config: m68k-randconfig-r034-20210512 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3Dfecf694f2b4b583d7740d55f584411b3062afa7e
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout fecf694f2b4b583d7740d55f584411b3062afa7e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dm68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    kernel/kallsyms.c: In function 'kallsyms_lookup_size_offset':
>    kernel/kallsyms.c:310:11: error: too many arguments to function 'modul=
e_address_lookup'
>      310 |  return !!module_address_lookup(addr, symbolsize, offset, NULL=
, NULL, namebuf) ||
>          |           ^~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/kallsyms.h:14,
>                     from kernel/kallsyms.c:15:
>    include/linux/module.h:745:27: note: declared here
>      745 | static inline const char *module_address_lookup(unsigned long =
addr,
>          |                           ^~~~~~~~~~~~~~~~~~~~~

This needs the fixup applied, I see it as commit
014c2869360b4cef79a73873c62adf671f19fc41 in linux-next.
--===============5838923559724332742==--

