Content-Type: multipart/mixed; boundary="===============7804456696201136661=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-rt-devel:linux-5.9.y-rt-rebase 60/234] kernel/printk/printk.c:2581:6: error: implicit declaration of function 'kernel_sync_mode'
Date: Wed, 21 Oct 2020 18:34:46 +0200
Message-ID: <20201021163446.oqnj7mmfxo3ydl5k@linutronix.de>
In-Reply-To: <202010220023.Ww0uDiBG-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7804456696201136661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-10-22 00:23:26 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git linux-5.9.y-rt-rebase
> head:   fccd942429797174ebfca28a778701a9df9c1277
> commit: 1029cb12f2704d89fabdc62b7581e17be7662245 [60/234] printk: introdu=
ce kernel sync mode
> config: riscv-allnoconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-dev=
el.git/commit/?id=3D1029cb12f2704d89fabdc62b7581e17be7662245
>         git remote add linux-rt-devel https://git.kernel.org/pub/scm/linu=
x/kernel/git/rt/linux-rt-devel.git
>         git fetch --no-tags linux-rt-devel linux-5.9.y-rt-rebase
>         git checkout 1029cb12f2704d89fabdc62b7581e17be7662245
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Driscv =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

The allnoconfig is probably !CONFIG_PRINTK which is currently known to
be broken. But since you complain let me look what I can do=E2=80=A6

Sebastian
--===============7804456696201136661==--

