Content-Type: multipart/mixed; boundary="===============6897074950440269085=="
MIME-Version: 1.0
From: Cristian Marussi <cristian.marussi@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 1/4] firmware: arm_scmi: Add Voltage Domain Support
Date: Tue, 27 Oct 2020 11:07:25 +0000
Message-ID: <20201027110725.GE20482@e120937-lin>
In-Reply-To: <202010271312.r4CIynpy-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6897074950440269085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 02:04:39PM +0800, kernel test robot wrote:
> Hi Cristian,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on soc/for-next]
> [also build test WARNING on next-20201026]
> [cannot apply to regulator/for-next robh/for-next rockchip/for-next keyst=
one/next arm64/for-next/core linux/master linux-rpi/for-rpi-next at91/at91-=
next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Cristian-Marussi/Add-sup=
port-for-SCMIv3-0-Voltage-Domain-Protocol-and-SCMI-Regulator/20201027-043404
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-n=
ext
> config: arm-randconfig-c004-20201026 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> "coccinelle warnings: (new ones prefixed by >>)"
> >> drivers/firmware/arm_scmi/voltage.c:381:11-17: ERROR: application of s=
izeof to pointer
> =

This is a false positive because the intention here was in fact to
allocate an array of pointers with devm_kcalloc().
Maybe I could explicitly use a sizeof(void *) to avoid fooling
coccicheck ?

Thanks

Cristian

> Please review and possibly fold the followup patch.
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============6897074950440269085==--

