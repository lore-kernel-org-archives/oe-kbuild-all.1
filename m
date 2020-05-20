Content-Type: multipart/mixed; boundary="===============6408561472091760206=="
MIME-Version: 1.0
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 8243/10701] ld: drivers/usb/typec/tps6598x.c:208: undefined reference to `usb_role_switch_set_role'
Date: Wed, 20 May 2020 11:09:07 +0100
Message-ID: <4460a74b-498f-5feb-bfb4-067228aea316@linaro.org>
In-Reply-To: <202005201755.z478VxFI%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6408561472091760206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 20/05/2020 10:21, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: 18a6c866bb191f360a16db6a79e005247dd3fd70 [8243/10701] usb: typec:=
 tps6598x: Add USB role switching logic
> config: x86_64-randconfig-a005-20200519 (attached as .config)
> compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010
> reproduce:
>          git checkout 18a6c866bb191f360a16db6a79e005247dd3fd70
>          # save the attached .config to linux build tree
>          make ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> ld: drivers/usb/typec/tps6598x.o: in function `tps6598x_set_data_role':
> drivers/usb/typec/tps6598x.c:208: undefined reference to `usb_role_switch=
_set_role'
>>> ld: drivers/usb/typec/tps6598x.c:208: undefined reference to `usb_role_=
switch_set_role'
> ld: drivers/usb/typec/tps6598x.o: in function `tps6598x_remove':
> drivers/usb/typec/tps6598x.c:604: undefined reference to `usb_role_switch=
_put'
> ld: drivers/usb/typec/tps6598x.o: in function `tps6598x_set_data_role':
> drivers/usb/typec/tps6598x.c:208: undefined reference to `usb_role_switch=
_set_role'
> ld: drivers/usb/typec/tps6598x.o: in function `tps6598x_probe':
> drivers/usb/typec/tps6598x.c:522: undefined reference to `fwnode_usb_role=
_switch_get'
> ld: drivers/usb/typec/tps6598x.c:591: undefined reference to `usb_role_sw=
itch_put'
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =


Fixed here.

https://lore.kernel.org/linux-usb/20200520100526.2729-1-bryan.odonoghue(a)l=
inaro.org/T/#u

Since this is still stuff in the usb-next tree I don't think I need a =

fixes tag ... ?
--===============6408561472091760206==--

