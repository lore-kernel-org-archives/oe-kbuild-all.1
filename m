Content-Type: multipart/mixed; boundary="===============0142331989635257099=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: drivers/mmc/host/sunxi-mmc.c:1181:34: warning: unused variable 'sunxi_mmc_of_match'
Date: Mon, 26 Oct 2020 12:35:05 +0100
Message-ID: <CAJKOXPdj2R3dQh5ZBALP_PCy5FTBVdYOtuU+dF50NAeRsDp1cw@mail.gmail.com>
In-Reply-To: <202010261451.N9cm8bod-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0142331989635257099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2020 at 07:01, kernel test robot <lkp@intel.com> wrote:
>
> Hi Krzysztof,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   3650b228f83adda7e5ee532e2b90429c03f7b9ec
> commit: 54d8454436a205682bd89d66d8d9eedbc8452d15 mmc: host: Enable compil=
e testing of multiple drivers
> date:   7 weeks ago
> config: x86_64-randconfig-r036-20201026 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project f2c2=
5c70791de95d2466e09b5b58fc37f6ccd7a4)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D54d8454436a205682bd89d66d8d9eedbc8452d15
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 54d8454436a205682bd89d66d8d9eedbc8452d15
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/mmc/host/sunxi-mmc.c:1181:34: warning: unused variable 'sunxi_=
mmc_of_match' [-Wunused-const-variable]
>    static const struct of_device_id sunxi_mmc_of_match[] =3D {

I'll send a fix.

Best regards,
Krzysztof
--===============0142331989635257099==--

