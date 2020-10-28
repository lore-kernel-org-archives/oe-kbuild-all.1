Content-Type: multipart/mixed; boundary="===============5554770358102842738=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [tglx-devel:x86/apic 15/35] drivers/pci/controller/vmd.c:133:2: warning: 'memset' will always overflow; destination buffer has size 8, but size argument is 16
Date: Wed, 28 Oct 2020 13:46:15 -0700
Message-ID: <202010281343.76EEA6C7@keescook>
In-Reply-To: <202010290312.InCvU8eM-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5554770358102842738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 03:20:16AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x8=
6/apic
> head:   32960489e2caa56bb259f8a8137b53576a2fa102
> commit: 176cfd8483128d01c05548162119c4b985f4f2ed [15/35] PCI: vmd: Use ms=
i_msg shadow structs
> config: x86_64-randconfig-a003-20201028 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 50df=
a19cc799ae7cddd39a95dbfce675a12672ad)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/=
commit/?id=3D176cfd8483128d01c05548162119c4b985f4f2ed
>         git remote add tglx-devel https://git.kernel.org/pub/scm/linux/ke=
rnel/git/tglx/devel.git
>         git fetch --no-tags tglx-devel x86/apic
>         git checkout 176cfd8483128d01c05548162119c4b985f4f2ed
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

> >> drivers/pci/controller/vmd.c:133:2: warning: 'memset' will always over=
flow; destination buffer has size 8, but size argument is 16 [-Wfortify-sou=
rce]
>            memset(&msg, 0, sizeof(*msg));
>            ^
>    1 warning generated.
> =

> vim +/memset +133 drivers/pci/controller/vmd.c
> =

>    118	=

>    119	/*
>    120	 * Drivers managing a device in a VMD domain allocate their own IR=
Qs as before,
>    121	 * but the MSI entry for the hardware it's driving will be program=
med with a
>    122	 * destination ID for the VMD MSI-X table.  The VMD muxes interrup=
ts in its
>    123	 * domain into one of its own, and the VMD driver de-muxes these f=
or the
>    124	 * handlers sharing that VMD IRQ.  The vmd irq_domain provides the=
 operations
>    125	 * and irq_chip to set this up.
>    126	 */
>    127	static void vmd_compose_msi_msg(struct irq_data *data, struct msi_=
msg *msg)
>    128	{
>    129		struct vmd_irq *vmdirq =3D data->chip_data;
>    130		struct vmd_irq_list *irq =3D vmdirq->irq;
>    131		struct vmd_dev *vmd =3D irq_data_get_irq_handler_data(data);
>    132	=

>  > 133		memset(&msg, 0, sizeof(*msg));

Legit. That should be "msg" not &msg.

-- =

Kees Cook
--===============5554770358102842738==--

