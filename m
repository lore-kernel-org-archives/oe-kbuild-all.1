Content-Type: multipart/mixed; boundary="===============2502976071248507002=="
MIME-Version: 1.0
From: Guenter Roeck <groeck@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [chrome-os:chromeos-5.4 39/53] include/asm-generic/div64.h:(.text.msdc_set_mclk+0x3a4): undefined reference to `clk_get_parent'
Date: Tue, 06 Oct 2020 12:14:50 -0700
Message-ID: <CABXOdTdFTU=Z4-2w0ZRB_xCdwuaE4Ni-EjQYacAEyXkz2+X3zw@mail.gmail.com>
In-Reply-To: <202010061253.nW3t7iOQ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2502976071248507002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2020 at 9:09 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel c=
hromeos-5.4
> head:   0f9629d12fc2c6db782988dd65f088bc42a4e2c8
> commit: d1f5806f0f2638aab294fde12c3361c50cb3628c [39/53] UPSTREAM: mmc: m=
ediatek: refine msdc timeout api
> config: mips-randconfig-r002-20201005 (attached as .config)
> compiler: mips-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add chrome-os https://chromium.googlesource.com/chromi=
umos/third_party/kernel
>         git fetch --no-tags chrome-os chromeos-5.4
>         git checkout d1f5806f0f2638aab294fde12c3361c50cb3628c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    mips-linux-ld: drivers/gpu/drm/ingenic/ingenic-drm.o: in function `ing=
enic_drm_probe':
>    drivers/gpu/drm/ingenic/ingenic-drm.c:(.text.ingenic_drm_probe+0x3f4):=
 undefined reference to `clk_get_parent'
>    mips-linux-ld: drivers/mmc/host/mtk-sd.o: in function `msdc_set_mclk':
> >> include/asm-generic/div64.h:(.text.msdc_set_mclk+0x3a4): undefined ref=
erence to `clk_get_parent'
> >> mips-linux-ld: include/asm-generic/div64.h:(.text.msdc_set_mclk+0x3c4)=
: undefined reference to `clk_get_parent'
>    mips-linux-ld: drivers/iio/adc/ingenic-adc.o: in function `jz4725b_adc=
_init_clk_div':
>    arch/mips/include/asm/io.h:(.text.jz4725b_adc_init_clk_div+0x24): unde=
fined reference to `clk_get_parent'
>
The same problem exists in mainline with the same configuration. It is
related to CONFIG_LANTIQ
which selects CLKDEV_LOOKUP and with it HAVE_CLK, but without actually
providing all of the
necessary functionality. This is quite easy to trigger in the upstream
kernel with, for example,
xway_defconfig+CONFIG_IIO+CONFIG_INGENIC_ADC.

Copying Stephen, but I think this is really for mips folks to resolve.

Guenter

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2502976071248507002==--

