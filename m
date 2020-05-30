Content-Type: multipart/mixed; boundary="===============1217077213477398633=="
MIME-Version: 1.0
From: Marc Zyngier <maz@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [arm-platforms:irq/irqchip-next 16/21] drivers/irqchip/irq-loongson-htvec.c:59:3: error: implicit declaration of function 'spurious_interrupt'
Date: Sat, 30 May 2020 13:45:28 +0100
Message-ID: <87r1v1zj4n.wl-maz@kernel.org>
In-Reply-To: <202005301945.PVvYjB6R%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1217077213477398633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 30 May 2020 12:28:47 +0100,
kbuild test robot <lkp@intel.com> wrote:
> =

> [1  <text/plain; us-ascii (7bit)>]
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms=
.git irq/irqchip-next
> head:   da10a4b626657387845f32d37141fc7d48ebbdb3
> commit: 818e915fbac518e8c78e1877a0048d92d4965e5a [16/21] irqchip: Add Loo=
ngson HyperTransport Vector support
> config: arm-allyesconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 818e915fbac518e8c78e1877a0048d92d4965e5a
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> drivers/irqchip/irq-loongson-htvec.c: In function 'htvec_irq_dispatch':
> >> drivers/irqchip/irq-loongson-htvec.c:59:3: error: implicit declaration=
 of function 'spurious_interrupt' [-Werror=3Dimplicit-function-declaration]
> 59 |   spurious_interrupt();
> |   ^~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors

Meh, yet another MIPS special.

I've dropped the COMPILE_TEST dependency, and pushed out this fix [1].

Thanks a lot for the report.

	M.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/c=
ommit/?h=3Dirq/irqchip-next&id=3D4a786cc36028b1917c823993a325eb09c2863ab7

-- =

Without deviation from the norm, progress is not possible.
--===============1217077213477398633==--

