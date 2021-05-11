Content-Type: multipart/mixed; boundary="===============3334124873773220164=="
MIME-Version: 1.0
From: Matthias Kaehlcke <mka@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 4/5] usb: host: xhci-plat: Create platform device for onboard hubs in probe()
Date: Tue, 11 May 2021 13:51:54 -0700
Message-ID: <YJruarGVOZPdy7y1@google.com>
In-Reply-To: <202105061414.b3RnwEfI-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3334124873773220164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 02:24:53PM +0800, kernel test robot wrote:
> Hi Matthias,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on driver-core/driver-core-testing]
> [also build test ERROR on linus/master v5.12 next-20210506]
> [cannot apply to usb/usb-testing robh/for-next char-misc/char-misc-testin=
g]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Matthias-Kaehlcke/USB-mi=
sc-Add-onboard_usb_hub-driver/20210504-034618
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-cor=
e.git 9ccce092fc64d19504fa54de4fd659e279cc92e7
> config: parisc-randconfig-c024-20210505 (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/ce77fd553380117a63f633a=
b2cd2652c22a3ff98
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Matthias-Kaehlcke/USB-misc-Add-o=
nboard_usb_hub-driver/20210504-034618
>         git checkout ce77fd553380117a63f633ab2cd2652c22a3ff98
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dparisc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    hppa-linux-ld: drivers/usb/host/xhci-plat.o: in function `xhci_plat_pr=
obe':
> >> (.text+0x70c): undefined reference to `of_is_onboard_usb_hub'

The relevant config options are:

  CONFIG_COMPILE_TEST=3Dy
  CONFIG_USB_XHCI_PLATFORM=3Dy
  # CONFIG_USB_ONBOARD_HUB is not set

and include/linux/usb/onboard_hub.h has:

  #if defined(CONFIG_USB_ONBOARD_HUB) || defined(CONFIG_COMPILE_TEST)
  bool of_is_onboard_usb_hub(const struct device_node *np);
  #else
  static inline bool of_is_onboard_usb_hub(const struct device_node *np)
  {
  	return false;
  }
  #endif

So it looks like '|| defined(CONFIG_COMPILE_TEST)' should be removed to
use the stub for CONFIG_COMPILE_TEST (or the actual function if
CONFIG_USB_ONBOARD_HUB is also enabled).
--===============3334124873773220164==--

