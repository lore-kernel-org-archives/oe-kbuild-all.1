Content-Type: multipart/mixed; boundary="===============5352816993817717147=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [kvm:queue 11/44] arch/x86/kernel/kvm.c:672:2: error: implicit declaration of function 'kvm_guest_cpu_offline'
Date: Fri, 07 May 2021 09:44:40 +0200
Message-ID: <e671b62d-0324-2835-2726-6b28a0202b7a@redhat.com>
In-Reply-To: <202105070840.f1TZQ4rC-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5352816993817717147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/05/21 02:13, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   c6d517aecd40b25ea05c593962b2c4b085092343
> commit: 9140e381e0f2f8cb1c628c29730ece2a52cb4cbc [11/44] x86/kvm: Teardow=
n PV features on boot CPU as well
> config: x86_64-randconfig-a001-20210506 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a=
2a5836cc8e4c1def2bdeb022e7b496623439)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=3D9=
140e381e0f2f8cb1c628c29730ece2a52cb4cbc
>          git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.g=
it
>          git fetch --no-tags kvm queue
>          git checkout 9140e381e0f2f8cb1c628c29730ece2a52cb4cbc
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

kvm_guest_cpu_offline must be placed outside #ifdef CONFIG_SMP.  I fixed =

it up.

Paolo

> =

> All errors (new ones prefixed by >>):
> =

>>> arch/x86/kernel/kvm.c:672:2: error: implicit declaration of function 'k=
vm_guest_cpu_offline' [-Werror,-Wimplicit-function-declaration]
>             kvm_guest_cpu_offline();
>             ^
>     arch/x86/kernel/kvm.c:672:2: note: did you mean 'kvm_guest_cpu_init'?
>     arch/x86/kernel/kvm.c:332:13: note: 'kvm_guest_cpu_init' declared here
>     static void kvm_guest_cpu_init(void)
>                 ^
>>> arch/x86/kernel/kvm.c:679:2: error: implicit declaration of function 'k=
vm_cpu_online' [-Werror,-Wimplicit-function-declaration]
>             kvm_cpu_online(raw_smp_processor_id());
>             ^
>     2 errors generated.
> =

> =

> vim +/kvm_guest_cpu_offline +672 arch/x86/kernel/kvm.c
> =

>     669	=

>     670	static int kvm_suspend(void)
>     671	{
>   > 672		kvm_guest_cpu_offline();
>     673	=

>     674		return 0;
>     675	}
>     676	=

>     677	static void kvm_resume(void)
>     678	{
>   > 679		kvm_cpu_online(raw_smp_processor_id());
>     680	}
>     681	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20

--===============5352816993817717147==--

