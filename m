Content-Type: multipart/mixed; boundary="===============2915496767426006445=="
MIME-Version: 1.0
From: Hans de Goede <hdegoede@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 3/5] mfd: arizona: Add support for ACPI enumeration of WM5102 connected over SPI
Date: Sun, 17 Jan 2021 21:20:36 +0100
Message-ID: <128c932f-d2b6-c9f6-dc67-585244a39d7a@redhat.com>
In-Reply-To: <202101180352.D075IBWE-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2915496767426006445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 1/17/21 8:06 PM, kernel test robot wrote:
> Hi Hans,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on lee-mfd/for-mfd-next]
> [also build test ERROR on asoc/for-next v5.11-rc3 next-20210115]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/MFD-ASoC-A=
dd-support-for-Intel-Bay-Trail-boards-with-WM5102-codec/20210117-235249
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-m=
fd-next
> config: arm-randconfig-r021-20210118 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project bfd7=
5bdf3fd62d4f5e7028d4122f9ffa517f2a09)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://github.com/0day-ci/linux/commit/ff3c43e0ca3dd07a3b671ee=
3be84b9c607dff305
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Hans-de-Goede/MFD-ASoC-Add-suppo=
rt-for-Intel-Bay-Trail-boards-with-WM5102-codec/20210117-235249
>         git checkout ff3c43e0ca3dd07a3b671ee3be84b9c607dff305
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>>> drivers/mfd/arizona-spi.c:194:7: error: assigning to 'int' from incompa=
tible type 'void'
>                    ret =3D arizona_spi_acpi_probe(arizona);>             =
           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.

UGh, the test-robot gave the same errors for v1 of this patch-set; and I ch=
ecked,
but I could not find the problem. Since there was some time between v1 and =
v2
I assumed that I had already fixed this in my local tree, but I now see that
this is caused by a bug in the #else block of the
#ifdef CONFIG_ACPI
#else
#endif

in this patch. I will submit a v3 of this patch-set fixing this.

Regards,

Hans

--===============2915496767426006445==--

