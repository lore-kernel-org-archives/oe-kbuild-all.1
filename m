Content-Type: multipart/mixed; boundary="===============1024145054048219783=="
MIME-Version: 1.0
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 8243/10701] ld: drivers/usb/typec/tps6598x.c:208: undefined reference to `usb_role_switch_set_role'
Date: Wed, 20 May 2020 14:06:48 +0100
Message-ID: <2babb0ef-980a-b18f-e073-14bae6b09b87@linaro.org>
In-Reply-To: <4460a74b-498f-5feb-bfb4-067228aea316@linaro.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1024145054048219783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 20/05/2020 11:09, Bryan O'Donoghue wrote:
> On 20/05/2020 10:21, kbuild test robot wrote:
>> tree:   =

>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git =

>> master
>> head:=C2=A0=C2=A0 fb57b1fabcb28f358901b2df90abd2b48abc1ca8
>> commit: 18a6c866bb191f360a16db6a79e005247dd3fd70 [8243/10701] usb: =

>> typec: tps6598x: Add USB role switching logic
>> config: x86_64-randconfig-a005-20200519 (attached as .config)
>> compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010
>> reproduce:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout 18a6c866bb=
191f360a16db6a79e005247dd3fd70
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .co=
nfig to linux build tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 make ARCH=3Dx86_64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>> ld: drivers/usb/typec/tps6598x.o: in function `tps6598x_set_data_role':
>> drivers/usb/typec/tps6598x.c:208: undefined reference to =

>> `usb_role_switch_set_role'
>>>> ld: drivers/usb/typec/tps6598x.c:208: undefined reference to =

>>>> `usb_role_switch_set_role'
>> ld: drivers/usb/typec/tps6598x.o: in function `tps6598x_remove':
>> drivers/usb/typec/tps6598x.c:604: undefined reference to =

>> `usb_role_switch_put'
>> ld: drivers/usb/typec/tps6598x.o: in function `tps6598x_set_data_role':
>> drivers/usb/typec/tps6598x.c:208: undefined reference to =

>> `usb_role_switch_set_role'
>> ld: drivers/usb/typec/tps6598x.o: in function `tps6598x_probe':
>> drivers/usb/typec/tps6598x.c:522: undefined reference to =

>> `fwnode_usb_role_switch_get'
>> ld: drivers/usb/typec/tps6598x.c:591: undefined reference to =

>> `usb_role_switch_put'
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
> =

> Fixed here.
> =

> https://lore.kernel.org/linux-usb/20200520100526.2729-1-bryan.odonoghue(a=
)linaro.org/T/#u =

> =

> =

> Since this is still stuff in the usb-next tree I don't think I need a =

> fixes tag ... ?

Better fix here

https://lore.kernel.org/linux-usb/20200520123312.320281-1-bryan.odonoghue(a=
)linaro.org/T/#t
--===============1024145054048219783==--

