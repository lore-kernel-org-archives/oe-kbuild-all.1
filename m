Content-Type: multipart/mixed; boundary="===============0055846383761176034=="
MIME-Version: 1.0
From: Marc Zyngier <maz@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: WARNING: modpost: vmlinux.o(.text.unlikely+0x11494): Section mismatch in reference from the function bcm2836_arm_irqchip_smp_init() to the function .init.text:set_smp_ipi_range()
Date: Sun, 25 Oct 2020 11:12:28 +0000
Message-ID: <87wnzeo8yr.wl-maz@kernel.org>
In-Reply-To: <202010250818.1HZGcXvo-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0055846383761176034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 25 Oct 2020 01:09:21 +0100,
kernel test robot <lkp@intel.com> wrote:
> =

> [1  <text/plain; us-ascii (7bit)>]
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d76913908102044f14381df865bb74df17a538cb
> commit: 0809ae724904c3c5dbdddf4169d48aac9c6fcdc8 irqchip/bcm2836: Configu=
re mailbox interrupts as standard interrupts
> date:   5 weeks ago
> config: arm64-randconfig-p001-20201025 (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D0809ae724904c3c5dbdddf4169d48aac9c6fcdc8
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 0809ae724904c3c5dbdddf4169d48aac9c6fcdc8
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Fix queued, thanks for the report.

	M.

-- =

Without deviation from the norm, progress is not possible.
--===============0055846383761176034==--

