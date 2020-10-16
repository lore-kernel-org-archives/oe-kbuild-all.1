Content-Type: multipart/mixed; boundary="===============0477163525811193761=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5] net: can: Introduce MEN 16Z192-00 CAN controller driver
Date: Fri, 16 Oct 2020 09:55:36 +0200
Message-ID: <81bbd71a-ff79-9f15-753a-d47b36b91756@pengutronix.de>
In-Reply-To: <202010160751.lNyADAMs-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0477163525811193761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/16/20 1:49 AM, kernel test robot wrote:
> Hi Abhijeet,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on 549738f15da0e5a00275977623be199fbbf7df50]
> =

> url:    https://github.com/0day-ci/linux/commits/Abhijeet-Badurkar/net-ca=
n-Introduce-MEN-16Z192-00-CAN-controller-driver/20201005-192132
> base:    549738f15da0e5a00275977623be199fbbf7df50
> config: openrisc-randconfig-s031-20201015 (attached as .config)
> compiler: or1k-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-rc1-dirty
>         # https://github.com/0day-ci/linux/commit/267876771a434b2be3278c2=
c87d36146c0fac77d
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Abhijeet-Badurkar/net-can-Introd=
uce-MEN-16Z192-00-CAN-controller-driver/20201005-192132
>         git checkout 267876771a434b2be3278c2c87d36146c0fac77d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dopenrisc =


I think it's the openrisc arch to blame^w ask here, since their iounmap doe=
sn't
have __iomem annotation.

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> "sparse warnings: (new ones prefixed by >>)"
>>> drivers/net/can/men_z192_can.c:1057:17: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void *addr @@     =
got void [noderef] __iomem *[assigned] dev_base @@
>>> drivers/net/can/men_z192_can.c:1057:17: sparse:     expected void *addr
>>> drivers/net/can/men_z192_can.c:1057:17: sparse:     got void [noderef] =
__iomem *[assigned] dev_base
>>> drivers/net/can/men_z192_can.c:1071:21: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void *addr @@     =
got void [noderef] __iomem *dev_base @@
>    drivers/net/can/men_z192_can.c:1071:21: sparse:     expected void *addr
>>> drivers/net/can/men_z192_can.c:1071:21: sparse:     got void [noderef] =
__iomem *dev_base
> =

> vim +1057 drivers/net/can/men_z192_can.c
> =

>    962	=

>    963	static int men_z192_probe(struct mcb_device *mdev,
>    964				  const struct mcb_device_id *id)
>    965	{
>    966		struct device *dev =3D &mdev->dev;
>    967		struct men_z192 *priv;
>    968		struct net_device *ndev;
>    969		void __iomem *dev_base;
>    970		struct resource *mem;
>    971		u32 timebase;
>    972		int ret =3D 0;
>    973		int irq;
>    974	=

>    975		mem =3D mcb_request_mem(mdev, dev_name(dev));
>    976		if (IS_ERR(mem)) {
>    977			dev_err(dev, "failed to request device memory");
>    978			return PTR_ERR(mem);
>    979		}
>    980	=

>    981		dev_base =3D ioremap(mem->start, resource_size(mem));
>    982		if (!dev_base) {
>    983			dev_err(dev, "failed to ioremap device memory");
>    984			ret =3D -ENXIO;
>    985			goto out_release;
>    986		}
>    987	=

>    988		irq =3D mcb_get_irq(mdev);
>    989		if (irq <=3D 0) {
>    990			ret =3D -ENODEV;
>    991			goto out_unmap;
>    992		}
>    993	=

>    994		ndev =3D alloc_candev(sizeof(struct men_z192), 0);
>    995		if (!ndev) {
>    996			dev_err(dev, "failed to allocat the can device");
>    997			ret =3D -ENOMEM;
>    998			goto out_unmap;
>    999		}
>   1000	=

>   1001		ndev->netdev_ops =3D &men_z192_netdev_ops;
>   1002		ndev->irq =3D irq;
>   1003		ndev->flags |=3D IFF_ECHO;
>   1004	=

>   1005		priv =3D netdev_priv(ndev);
>   1006		priv->ndev =3D ndev;
>   1007		priv->dev =3D dev;
>   1008	=

>   1009		priv->mem =3D mem;
>   1010		priv->dev_base =3D dev_base;
>   1011		priv->regs =3D priv->dev_base + MEN_Z192_REGS_OFFS;
>   1012	=

>   1013		timebase =3D readl(&priv->regs->timebase);
>   1014		if (!timebase) {
>   1015			dev_err(dev, "invalid timebase configured (timebase=3D%d)\n",
>   1016				timebase);
>   1017			ret =3D -EINVAL;
>   1018			goto out_free_candev;
>   1019		}
>   1020	=

>   1021		priv->can.clock.freq =3D timebase;
>   1022		priv->can.bittiming_const =3D &men_z192_bittiming_const;
>   1023		priv->can.do_set_mode =3D men_z192_set_mode;
>   1024		priv->can.do_get_berr_counter =3D men_z192_get_berr_counter;
>   1025		priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LISTENONLY |
>   1026					       CAN_CTRLMODE_3_SAMPLES |
>   1027					       CAN_CTRLMODE_LOOPBACK;
>   1028	=

>   1029		spin_lock_init(&priv->lock);
>   1030	=

>   1031		netif_napi_add(ndev, &priv->napi, men_z192_poll,
>   1032			       NAPI_POLL_WEIGHT);
>   1033	=

>   1034		skb_queue_head_init(&priv->echoq);
>   1035	=

>   1036		mcb_set_drvdata(mdev, ndev);
>   1037		SET_NETDEV_DEV(ndev, dev);
>   1038	=

>   1039		ndev->ethtool_ops =3D &men_z192_ethtool_ops;
>   1040	=

>   1041		ret =3D men_z192_register(ndev);
>   1042		if (ret) {
>   1043			dev_err(dev, "failed to register CAN device");
>   1044			goto out_free_candev;
>   1045		}
>   1046	=

>   1047		devm_can_led_init(ndev);
>   1048	=

>   1049		dev_info(dev, "MEN 16z192 CAN driver successfully registered\n");
>   1050	=

>   1051		return 0;
>   1052	=

>   1053	out_free_candev:
>   1054		netif_napi_del(&priv->napi);
>   1055		free_candev(ndev);
>   1056	out_unmap:
>> 1057		iounmap(dev_base);
>   1058	out_release:
>   1059		mcb_release_mem(mem);
>   1060		return ret;
>   1061	}
>   1062	=

>   1063	static void men_z192_remove(struct mcb_device *mdev)
>   1064	{
>   1065		struct net_device *ndev =3D mcb_get_drvdata(mdev);
>   1066		struct men_z192 *priv =3D netdev_priv(ndev);
>   1067	=

>   1068		unregister_candev(ndev);
>   1069		netif_napi_del(&priv->napi);
>   1070	=

>> 1071		iounmap(priv->dev_base);
>   1072		mcb_release_mem(priv->mem);
>   1073	=

>   1074		free_candev(ndev);
>   1075	}
>   1076	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =


Marc

-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--===============0477163525811193761==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQWwrSlVma0FDZ2tRcWNsYWl2cnQKNzZrL1hBZjhDV0c1R3pvb2x3
R001VXA1Qmp0WDcxUjc5QVpaTEZvQjA3RzJKaFJkYXpzSFpVbnE0bGR0Rjl5SAo0eGNoY05CdkVz
bkxaNHhuTXV0MzE2c2NqVmJFTHREczNEWkg0QTFBcjNoakY5a1B0cC8yMW9sYVhBTExLeksrClVI
L25wNEFOZTlhcG1GZHdqL0hmRzFFcGNRTnhjWkxlam9tOC84OFhJazIzSjhVdmtvZVJ6QzV0aDkw
bzV1VEkKb3QrcU04SUp4eDVLZllZVnIybmpyWVIrem80N2hUMGxWYkNxNHMwMDdoVVJWVmxwVWcx
WnFESnVkS3phN2VQUApKQ3MvOFI4dW9zalU1cVRaMEV5Z0xwR0dMZlVoTmZZTVpEdzdlWFNYMHNu
N1V4d3l1V28rVUlFeVl4QVFkVFVTCnA0VDlSK0ppd0h2WE9CUFdrUStsZzE5eHFUQVRQZz09Cj1T
L1VCCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0477163525811193761==--

