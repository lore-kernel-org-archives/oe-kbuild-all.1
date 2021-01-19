Content-Type: multipart/mixed; boundary="===============0172845609436440357=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2519/4500] ucsi.c:undefined reference to `fwnode_usb_role_switch_get'
Date: Mon, 18 Jan 2021 18:44:52 -0800
Message-ID: <96a4a684-998f-8b8e-4b19-ec690c4dfde9@infradead.org>
In-Reply-To: <20210118204040.GA19773@jackp-linux.qualcomm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0172845609436440357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[adding linux-usb list]

On 1/18/21 12:40 PM, Jack Pham wrote:
> On Mon, Jan 18, 2021 at 06:52:23PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
>> head:   93bf8b946e5f9a0b0c68155597b53fd8ccce2827
>> commit: 89795852c9c46b9b0701f7376d30a1c5ab4d146c [2519/4500] usb: typec:=
 ucsi: Add support for USB role switch
>> config: nios2-randconfig-m031-20210118 (attached as .config)
>> compiler: nios2-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git/commit/?id=3D89795852c9c46b9b0701f7376d30a1c5ab4d146c
>>         git remote add linux-next https://git.kernel.org/pub/scm/linux/k=
ernel/git/next/linux-next.git
>>         git fetch --no-tags linux-next master
>>         git checkout 89795852c9c46b9b0701f7376d30a1c5ab4d146c
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Dnios2 =

>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    nios2-linux-ld: drivers/usb/typec/ucsi/ucsi.o: in function `ucsi_regi=
ster_port':
>>>> ucsi.c:(.text+0x15a8): undefined reference to `fwnode_usb_role_switch_=
get'
>>    ucsi.c:(.text+0x15a8): relocation truncated to fit: R_NIOS2_CALL26 ag=
ainst `fwnode_usb_role_switch_get'
>>>> nios2-linux-ld: ucsi.c:(.text+0x15e8): undefined reference to `usb_rol=
e_switch_set_role'
>>    ucsi.c:(.text+0x15e8): relocation truncated to fit: R_NIOS2_CALL26 ag=
ainst `usb_role_switch_set_role'
>>    nios2-linux-ld: drivers/usb/typec/ucsi/ucsi.o: in function `ucsi_hand=
le_connector_change':
>>>> ucsi.c:(.text+0x1b50): undefined reference to `usb_role_switch_set_rol=
e'
>>    ucsi.c:(.text+0x1b50): relocation truncated to fit: R_NIOS2_CALL26 ag=
ainst `usb_role_switch_set_role'
>>    nios2-linux-ld: ucsi.c:(.text+0x1c28): undefined reference to `usb_ro=
le_switch_set_role'
>>    ucsi.c:(.text+0x1c28): relocation truncated to fit: R_NIOS2_CALL26 ag=
ainst `usb_role_switch_set_role'
>>
>> Kconfig warnings: (for reference only)
>>    WARNING: unmet direct dependencies detected for SERIAL_CORE_CONSOLE
>>    Depends on TTY && HAS_IOMEM
>>    Selected by
>>    - EARLY_PRINTK
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =

> I have no clue about the nios2, so not sure if this is an arch-specific
> linker error or not.
> =

> Hmm but the .config has the following:
> =

> CONFIG_TYPEC_UCSI=3Dy
> CONFIG_USB_ROLE_SWITCH=3Dm
> =

> So I'm guessing this patch also requires a Kconfig change to disallow
> the above combination? If so, should UCSI have a "depends" or a "select"
> on USB_ROLE_SWITCH?

Hm, there is certainly a mixture of depends and selects in the kernel source
tree. I would say "depends", based on Documentation/kbuild/kconfig-language=
.rst:
("->" added for emphasis)

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
->	In general use select only for non-visible symbols
->	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.


-- =

~Randy
You can't do anything without having to do something else first.
-- Belefant's Law
--===============0172845609436440357==--

