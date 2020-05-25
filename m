Content-Type: multipart/mixed; boundary="===============6948615578501284731=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [tglx-devel:x86/entry 4/119] drivers/xen/events/events_base.c:1664:6: warning: no previous prototype for function 'xen_setup_callback_vector'
Date: Mon, 25 May 2020 09:56:38 +0200
Message-ID: <87pnas8n2h.fsf@vitty.brq.redhat.com>
In-Reply-To: <202005241841.gT8c6PVb%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6948615578501284731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kbuild test robot <lkp@intel.com> writes:

> Hi Vitaly,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x8=
6/entry
> head:   7f5a4e54ac5fab86776ca040aa9b998e35bf7a86
> commit: fad1940a6a856f59b073e8650e02052ce531154c [4/119] x86/xen: Split H=
VM vector callback setup and interrupt gate allocation
> config: x86_64-randconfig-a001-20200524 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 3393=
cc4cebf9969db94dc424b7a2b6195589c33b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout fad1940a6a856f59b073e8650e02052ce531154c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>>> drivers/xen/events/events_base.c:1664:6: warning: no previous prototype=
 for function 'xen_setup_callback_vector' [-Wmissing-prototypes]
> void xen_setup_callback_vector(void) {}
> ^
> drivers/xen/events/events_base.c:1664:1: note: declare 'static' if the fu=
nction is not intended to be used outside of this translation unit
> void xen_setup_callback_vector(void) {}
> ^
> static
> 1 warning generated.

I sent
https://lore.kernel.org/lkml/20200520161600.361895-1-vkuznets(a)redhat.com/
last week, it should fix the issue.

-- =

Vitaly

--===============6948615578501284731==--

