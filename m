Content-Type: multipart/mixed; boundary="===============6408064050730348135=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [kvm:queue 11/44] arch/x86/kernel/kvm.c:672:2: error: implicit declaration of function 'kvm_guest_cpu_offline'
Date: Fri, 07 May 2021 10:52:25 +0200
Message-ID: <87v97vvsc6.fsf@vitty.brq.redhat.com>
In-Reply-To: <e671b62d-0324-2835-2726-6b28a0202b7a@redhat.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6408064050730348135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 07/05/21 02:13, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
>> head:   c6d517aecd40b25ea05c593962b2c4b085092343
>> commit: 9140e381e0f2f8cb1c628c29730ece2a52cb4cbc [11/44] x86/kvm: Teardo=
wn PV features on boot CPU as well
>> config: x86_64-randconfig-a001-20210506 (attached as .config)
>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5=
a2a5836cc8e4c1def2bdeb022e7b496623439)
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install x86_64 cross compiling tool for clang build
>>          # apt-get install binutils-x86-64-linux-gnu
>>          # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=3D=
9140e381e0f2f8cb1c628c29730ece2a52cb4cbc
>>          git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.=
git
>>          git fetch --no-tags kvm queue
>>          git checkout 9140e381e0f2f8cb1c628c29730ece2a52cb4cbc
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 ARCH=3Dx86_64
>> =

>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>
> kvm_guest_cpu_offline must be placed outside #ifdef CONFIG_SMP.  =


... and kvm_guest_cpu_online() too.

> I fixed  it up.
>

Thanks!

-- =

Vitaly

--===============6408064050730348135==--

