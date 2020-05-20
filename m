Content-Type: multipart/mixed; boundary="===============3594236017423136406=="
MIME-Version: 1.0
From: Matthias Brugger <matthias.bgg@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [mediatek:v5.7-next/dts32 2/5] ERROR: Input tree has errors, aborting (use -f to force output)
Date: Wed, 20 May 2020 11:36:26 +0200
Message-ID: <c6b07591-96b7-30f6-57a3-7fde12f31ee7@gmail.com>
In-Reply-To: <202005201041.8V3JPXmH%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3594236017423136406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Just in case you wonder why we get this email. By error I merged your patch=
 even
as it was already applied in v5.7

I realized this already a few days ago and fixed the branch, so no problem =
to
solve here :)

Regards,
Matthias

On 20/05/2020 04:14, kbuild test robot wrote:
> tree:   https://github.com/mbgg/linux-mediatek v5.7-next/dts32
> head:   8a680e07a07ca9f79fd12629a2154496734fc0b5
> commit: 9bf6f0e6329705d790b93af143ce99b9f92435e9 [2/5] arm: dts: mediatek=
: add mt7629 pwm support
> config: arm-defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 9bf6f0e6329705d790b93af143ce99b9f92435e9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> arch/arm/boot/dts/mt7629.dtsi:258.21-270.5: ERROR (duplicate_node_names):=
 /soc/pwm(a)11006000: Duplicate node name
>>> ERROR: Input tree has errors, aborting (use -f to force output)
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============3594236017423136406==--

