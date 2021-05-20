Content-Type: multipart/mixed; boundary="===============0853143421347853493=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/5] HID: magicmouse: Magic Trackpad 2 USB battery capacity
Date: Thu, 20 May 2021 17:18:51 +0800
Message-ID: <eeba0785-1d5c-7d4a-d5c4-af6ffb3f4f8b@intel.com>
In-Reply-To: <20210515185021.GA177131@elementary-os.localdomain>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0853143421347853493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/16/21 2:50 AM, Jos=C3=A9 Exp=C3=B3sito wrote:
> On Wed, May 12, 2021 at 05:39:31PM +0800, kernel test robot wrote:
>> Hi "Jos=C3=A9,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on hid/for-next]
>> [also build test ERROR on v5.13-rc1 next-20210511]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/HID-magicm=
ouse-register-power-supply/20210512-022327
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-=
next
>> config: s390-randconfig-r002-20210512 (attached as .config)
>> compiler: s390-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://github.com/0day-ci/linux/commit/701f395a5566b6d2fd3a7=
8389983237668902998
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Jos-Exp-sito/HID-magicmouse-re=
gister-power-supply/20210512-022327
>>          git checkout 701f395a5566b6d2fd3a78389983237668902998
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss W=3D1 ARCH=3Ds390
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     s390-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
>>     cistpl.c:(.text+0x3a2): undefined reference to `ioremap'
>>     s390-linux-ld: cistpl.c:(.text+0x3dc): undefined reference to `iounm=
ap'
>>     s390-linux-ld: cistpl.c:(.text+0x404): undefined reference to `iounm=
ap'
>>     s390-linux-ld: cistpl.c:(.text+0x416): undefined reference to `iorem=
ap'
>>     s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem=
':
>>     cistpl.c:(.text+0xe16): undefined reference to `iounmap'
>>     s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse=
_remove':
>>     hid-magicmouse.c:(.text+0xd2c): undefined reference to `usb_kill_urb'
>>>> s390-linux-ld: hid-magicmouse.c:(.text+0xd48): undefined reference to =
`usb_free_coherent'
>>>> s390-linux-ld: hid-magicmouse.c:(.text+0xd54): undefined reference to =
`usb_free_urb'
>>     s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse=
_battery_usb_urb_complete':
>>     hid-magicmouse.c:(.text+0xe12): undefined reference to `usb_submit_u=
rb'
>>     s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse=
_probe':
>>     hid-magicmouse.c:(.text+0x1194): undefined reference to `usb_alloc_u=
rb'
>>>> s390-linux-ld: hid-magicmouse.c:(.text+0x121a): undefined reference to=
 `usb_alloc_coherent'
>>     s390-linux-ld: hid-magicmouse.c:(.text+0x1422): undefined reference =
to `usb_free_coherent'
>>     s390-linux-ld: hid-magicmouse.c:(.text+0x142e): undefined reference =
to `usb_free_urb'
>>>> s390-linux-ld: hid-magicmouse.c:(.text+0x1462): undefined reference to=
 `usb_submit_urb'
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> Hi all,
>
> I'm a little bit confused about the build errors reported by Intel's test=
 bot and I'd really appreciate human input.
> This is the first patch I submit, so apologies in advance if I missed a b=
asic step.
>
> I compiled and tested every patch before submission and they all compiled=
 and worked on this tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>
> After receiving this email, I followed the instructions attached to build=
 it and indeed it failed.
> However, I reverted my changes and the kernel still didn't compile.
>
> Is this something I need to fix?

Hi Jos=C3=A9 Exp=C3=B3sito,

I think it's related to HAS_IOMEM in drivers/usb/Kconfig:

menuconfig USB_SUPPORT
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "USB support"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on HAS_IOMEM
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default y
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This option adds co=
re support for Universal Serial Bus (USB).
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 You will also need =
drivers from the following menu to make =

use of it.

and I found a similar issue fixed by the below commit:

commit 1f685e6adbbe3c7b1bd9053be771b898d9efa655
Author: Randy Dunlap <rdunlap@infradead.org>
Date:=C2=A0=C2=A0 Tue Jan 5 20:25:31 2021 -0800

 =C2=A0=C2=A0=C2=A0 ptp: ptp_ines: prevent build when HAS_IOMEM is not set

 =C2=A0=C2=A0=C2=A0 ptp_ines.c uses devm_platform_ioremap_resource(), which=
 is only
 =C2=A0=C2=A0=C2=A0 built/available when CONFIG_HAS_IOMEM is enabled.
 =C2=A0=C2=A0=C2=A0 CONFIG_HAS_IOMEM is not enabled for arch/s390/, so buil=
ds on S390
 =C2=A0=C2=A0=C2=A0 have a build error:

 =C2=A0=C2=A0=C2=A0 s390-linux-ld: drivers/ptp/ptp_ines.o: in function =

`ines_ptp_ctrl_probe':
 =C2=A0=C2=A0=C2=A0 ptp_ines.c:(.text+0x17e6): undefined reference to =

`devm_platform_ioremap_resource'

 =C2=A0=C2=A0=C2=A0 Prevent builds of ptp_ines.c when HAS_IOMEM is not set.

 =C2=A0=C2=A0=C2=A0 Fixes: bad1eaa6ac31 ("ptp: Add a driver for InES time s=
tamping IP =

core.")
 =C2=A0=C2=A0=C2=A0 Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
 =C2=A0=C2=A0=C2=A0 Reported-by: kernel test robot <lkp@intel.com>
 =C2=A0=C2=A0=C2=A0 Link: lore.kernel.org/r/202101031125.ZEFCUiKi-lkp(a)int=
el.com
 =C2=A0=C2=A0=C2=A0 Acked-by: Richard Cochran <richardcochran@gmail.com>
 =C2=A0=C2=A0=C2=A0 Link: =

https://lore.kernel.org/r/20210106042531.1351-1-rdunlap(a)infradead.org
 =C2=A0=C2=A0=C2=A0 Signed-off-by: Jakub Kicinski <kuba@kernel.org>

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index d2bf05ccbbe20d..f2edef0df40f5c 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -79,6 +79,7 @@ config DP83640_PHY
 =C2=A0config PTP_1588_CLOCK_INES
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "ZHAW InES PTP time st=
amping IP core"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on NETWORK_PHY_TIMESTAM=
PING
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on HAS_IOMEM
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on PHYLIB
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on PTP_1588_CLOCK
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help

Best Regards,
Rong Chen

>
> Thank you very much in advance,
> Jos=C3=A9 Exp=C3=B3sito
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============0853143421347853493==--

