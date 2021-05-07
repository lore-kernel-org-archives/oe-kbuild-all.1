Content-Type: multipart/mixed; boundary="===============5715524652337757296=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [kvm:queue 11/44] arch/x86/kernel/kvm.c:672:2: error: implicit declaration of function 'kvm_guest_cpu_offline'; did you mean 'kvm_guest_cpu_init'?
Date: Fri, 07 May 2021 10:33:01 +0200
Message-ID: <87y2crvt8i.fsf@vitty.brq.redhat.com>
In-Reply-To: <202105070437.l17T7fhB-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5715524652337757296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   c6d517aecd40b25ea05c593962b2c4b085092343
> commit: 9140e381e0f2f8cb1c628c29730ece2a52cb4cbc [11/44] x86/kvm: Teardow=
n PV features on boot CPU as well
> config: x86_64-randconfig-c022-20210506 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=3D91=
40e381e0f2f8cb1c628c29730ece2a52cb4cbc
>         git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
>         git fetch --no-tags kvm queue
>         git checkout 9140e381e0f2f8cb1c628c29730ece2a52cb4cbc
>         # save the attached .config to linux build tree
>         make W=3D1 W=3D1 ARCH=3Dx86_64 =

>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/x86/kernel/kvm.c: In function 'kvm_suspend':
>>> arch/x86/kernel/kvm.c:672:2: error: implicit declaration of function 'k=
vm_guest_cpu_offline'; did you mean 'kvm_guest_cpu_init'? [-Werror=3Dimplic=
it-function-declaration]
>      672 |  kvm_guest_cpu_offline();
>          |  ^~~~~~~~~~~~~~~~~~~~~
>          |  kvm_guest_cpu_init
>    arch/x86/kernel/kvm.c: In function 'kvm_resume':
>>> arch/x86/kernel/kvm.c:679:2: error: implicit declaration of function 'k=
vm_cpu_online'; did you mean 'irq_cpu_online'? [-Werror=3Dimplicit-function=
-declaration]
>      679 |  kvm_cpu_online(raw_smp_processor_id());
>          |  ^~~~~~~~~~~~~~
>          |  irq_cpu_online
>    cc1: some warnings being treated as errors
>


Oh well, we just need a quantum PC and something like =

'make allpossibleconfig' to make issues like this one go away forever
:-)

I'm on it, soemthing needs to be done for !CONFIG_SMP case.


-- =

Vitaly

--===============5715524652337757296==--

