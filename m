Content-Type: multipart/mixed; boundary="===============5960706960602506091=="
MIME-Version: 1.0
From: Vincent Chen <vincent.chen@sifive.com>
To: kbuild-all@lists.01.org
Subject: Re: arch/riscv/errata/sifive/errata_cip_453.S:25: Error: Improper shift amount (38)
Date: Fri, 14 May 2021 18:23:30 +0800
Message-ID: <CABvJ_xhxog_MoNZFWnog+_vSBOXAX8+_KbnfyCrue5TGzDS20w@mail.gmail.com>
In-Reply-To: <202105132239.YLq2DvEA-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5960706960602506091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,
The resolved patch "0e0d49925" lacks a change, so this error still happens.
I apologize for any inconvenience caused by this stupid mistake.

Vincent Chen

On Thu, May 13, 2021 at 10:38 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Vincent,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   c06a2ba62fc401b7aaefd23f5d0bc06d2457ccc1
> commit: 800149a77c2cb8746a94457939b1ba1e37d2c14e riscv: sifive: Apply err=
ata "cip-453" patch
> date:   2 weeks ago
> config: riscv-randconfig-r023-20210513 (attached as .config)
> compiler: riscv32-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D800149a77c2cb8746a94457939b1ba1e37d2c14e
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 800149a77c2cb8746a94457939b1ba1e37d2c14e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Driscv
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/riscv/errata/sifive/errata_cip_453.S: Assembler messages:
> >> arch/riscv/errata/sifive/errata_cip_453.S:25: Error: Improper shift am=
ount (38)
>    arch/riscv/errata/sifive/errata_cip_453.S:25: Error: Improper shift am=
ount (39)
>    arch/riscv/errata/sifive/errata_cip_453.S:35: Error: Improper shift am=
ount (38)
>    arch/riscv/errata/sifive/errata_cip_453.S:35: Error: Improper shift am=
ount (39)
>
>
> vim +25 arch/riscv/errata/sifive/errata_cip_453.S
>
>     23
>     24  ENTRY(sifive_cip_453_page_fault_trp)
>   > 25          ADD_SIGN_EXT a0, t0, t1
>     26  #ifdef CONFIG_MMU
>     27          la t0, do_page_fault
>     28  #else
>     29          la t0, do_trap_unknown
>     30  #endif
>     31          jr t0
>     32  END(sifive_cip_453_page_fault_trp)
>     33
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5960706960602506091==--

