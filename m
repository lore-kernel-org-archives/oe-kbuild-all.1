Content-Type: multipart/mixed; boundary="===============1350213154049136312=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: hppa64-linux-ld: mm/hugetlb.o(.text+0x50dc): cannot reach printk
Date: Mon, 25 Jan 2021 12:58:35 -0800
Message-ID: <CAKwvOd=RHb5yQj5kKuvt9BnywNUmRtivPu_qebLG8XXDyr8cCA@mail.gmail.com>
In-Reply-To: <20210125204720.GA28462@ls3530.fritz.box>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1350213154049136312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 12:47 PM Helge Deller <deller@gmx.de> wrote:
>
> > >> On Sat, Jan 16, 2021 at 6:37 AM kernel test robot <lkp@intel.com> =
wrote:
> > >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
> > >>> head:   1d94330a437a573cfdf848f6743b1ed169242c8a
> > >>> commit: eff8728fe69880d3f7983bec3fb6cea4c306261f vmlinux.lds.h: Add=
 PGO and AutoFDO input sections
> > >>> date:   5 months ago
> > >>> config: parisc-randconfig-r032-20210116 (attached as .config)
> > >>> compiler: hppa64-linux-gcc (GCC) 9.3.0
> > >>> reproduce (this is a W=3D1 build):
> > >>>         wget https://raw.githubusercontent.com/intel/lkp-tests/mast=
er/sbin/make.cross -O ~/bin/make.cross
> > >>>         chmod +x ~/bin/make.cross
> > >>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/commit/?id=3Deff8728fe69880d3f7983bec3fb6cea4c306261f
> > >>>         git remote add linus https://git.kernel.org/pub/scm/linux/k=
ernel/git/torvalds/linux.git
> > >>>         git fetch --no-tags linus master
> > >>>         git checkout eff8728fe69880d3f7983bec3fb6cea4c306261f
> > >>>         # save the attached .config to linux build tree
> > >>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 mak=
e.cross ARCH=3Dparisc
> > >>>
> > >>> If you fix the issue, kindly add following tag as appropriate
> > >>> Reported-by: kernel test robot <lkp@intel.com>
> > >>>
> > >>> All errors (new ones prefixed by >>):
> > >>>
> > >>>    hppa64-linux-ld: mm/page_alloc.o(.ref.text+0x110): cannot reach =
unknown
> > >>>    hppa64-linux-ld: mm/memblock.o(.text+0x27c): cannot reach __warn=
_printk
> > >>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0xc4): cannot reach=
 printk
> ....
>
> The problem with this .config is, that both CONFIG_MODULES and
> CONFIG_MLONGCALLS are set to "n".
> The Kconfig autodetection needs fixing to enable CONFIG_MLONGCALLS in
> this case.
>
>
> This patch fixes it for me:
>
> [PATCH] Require -mlong-calls gcc option for !CONFIG_MODULES
>
> When building a kernel without module support, the CONFIG_MLONGCALL
> option needs to be enabled. This patch fixes the autodetection in the
> Kconfig script and uses a far call to preempt_schedule_irq() in
> intr_do_preempt().
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reported-by: kernel test robot <lkp@intel.com>
>
> ---
>
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 78b17621ee4a..278462186ac4 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -202,9 +202,8 @@ config PREFETCH
>         depends on PA8X00 || PA7200
>
>  config MLONGCALLS
> -       bool "Enable the -mlong-calls compiler option for big kernels"
> -       default y if !MODULES || UBSAN || FTRACE
> -       default n
> +       def_bool y if !MODULES || UBSAN || FTRACE
> +       bool "Enable the -mlong-calls compiler option for big kernels" if=
 MODULES && !UBSAN && !FTRACE

^ this looks like the same constraints specified twice?  Am I
understanding that correctly? (I don't understand why this isn't
specified _once_).

>         depends on PA8X00
>         help
>           If you configure the kernel to include many drivers built-in in=
stead
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index beba9816cc6c..6320f6a8397c 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -997,10 +997,19 @@ intr_do_preempt:
>         bb,<,n  %r20, 31 - PSW_SM_I, intr_restore
>         nop
>
> -       BL      preempt_schedule_irq, %r2
> -       nop
> +       /* ssm PSW_SM_I done later in intr_restore */
> +#ifdef CONFIG_MLONGCALLS
> +       ldil    L%intr_restore, %r2
> +       load32  preempt_schedule_irq, %r1
> +       bv      %r0(%r1)
> +       ldo     R%intr_restore(%r2), %r2
> +#else
> +       ldil    L%intr_restore, %r2
> +       BL      preempt_schedule_irq
> +       ldo     R%intr_restore(%r2), %r2
> +#endif
> +
>
> -       b,n     intr_restore            /* ssm PSW_SM_I done by intr_rest=
ore */
>  #endif /* CONFIG_PREEMPTION */
>
>         /*
>
>


-- =

Thanks,
~Nick Desaulniers
--===============1350213154049136312==--

