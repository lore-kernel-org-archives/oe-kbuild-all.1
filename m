Content-Type: multipart/mixed; boundary="===============2923682813488468673=="
MIME-Version: 1.0
From: Guenter Roeck <linux@roeck-us.net>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 1249/1397] drivers/hwmon/axi-fan-control.c:418 axi_fan_control_probe() error: potentially dereferencing uninitialized 'res'.
Date: Tue, 11 Feb 2020 05:28:40 -0800
Message-ID: <a0a787d8-68cd-8d2d-8c2a-4600a1b7e4b1@roeck-us.net>
In-Reply-To: <20200211104642.GA7838@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2923682813488468673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/11/20 2:46 AM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   ac431e2d7b1be81bfe58163b9f81ba79bc987dc3
> commit: 690dd9ce04f6a1b319bcb211ee0b3e125a4fa4f2 [1249/1397] hwmon: Suppo=
rt ADI Fan Control IP
> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> smatch warnings:
> drivers/hwmon/axi-fan-control.c:418 axi_fan_control_probe() error: potent=
ially dereferencing uninitialized 'res'.
> =

> # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3D690dd9ce04f6a1b319bcb211ee0b3e125a4fa4f2
> git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git=
/next/linux-next.git
> git remote update linux-next
> git checkout 690dd9ce04f6a1b319bcb211ee0b3e125a4fa4f2
> vim +/res +418 drivers/hwmon/axi-fan-control.c
> =

> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  386  static int axi_fan_control_p=
robe(struct platform_device *pdev)
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  387  {
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  388  	struct axi_fan_control_data=
 *ctl;
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  389  	struct clk *clk;
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  390  	const struct of_device_id *=
id;
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  391  	const char *name =3D "axi_f=
an_control";
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  392  	struct resource *res;
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  393  	u32 version;
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  394  	int ret;
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  395
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  396  	id =3D of_match_node(axi_fa=
n_control_of_match, pdev->dev.of_node);
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  397  	if (!id)
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  398  		return -EINVAL;
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  399
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  400  	ctl =3D devm_kzalloc(&pdev-=
>dev, sizeof(*ctl), GFP_KERNEL);
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  401  	if (!ctl)
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  402  		return -ENOMEM;
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  403
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  404  	ctl->base =3D devm_platform=
_ioremap_resource(pdev, 0);
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  405  	if (IS_ERR(ctl->base))
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  406  		return PTR_ERR(ctl->base);
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  407
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  408  	clk =3D devm_clk_get(&pdev-=
>dev, NULL);
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  409  	if (IS_ERR(clk)) {
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  410  		dev_err(&pdev->dev, "clk_g=
et failed with %ld\n", PTR_ERR(clk));
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  411  		return PTR_ERR(clk);
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  412  	}
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  413
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  414  	ctl->clk_rate =3D clk_get_r=
ate(clk);
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  415  	if (!ctl->clk_rate)
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  416  		return -EINVAL;
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  417
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09 @418  	dev_dbg(&pdev->dev, "Re-map=
ped from 0x%08llX to %p\n",
> 690dd9ce04f6a1 Nuno S=C3=A1 2019-10-09  419  		(unsigned long long)res->s=
tart, ctl->base);
>                                                                          =
    ^^^^^^^^^^
> "res" is never set or used anywhere.
> =


Already fixed (dropped offending code since it doesn't add any value anyway)
in current hwmon-next.

Thanks,
Guenter
--===============2923682813488468673==--

