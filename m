Content-Type: multipart/mixed; boundary="===============3566853565547750717=="
MIME-Version: 1.0
From: Peter Chen <peter.chen@nxp.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 3/9] usb: cdns3: imx: add glue layer runtime pm implementation
Date: Mon, 25 May 2020 06:31:10 +0000
Message-ID: <20200525063134.GD16948@b29397-desktop>
In-Reply-To: <202005251215.nsp7iG6y%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3566853565547750717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 20-05-25 12:53:11, kbuild test robot wrote:
> Hi Peter,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on usb/usb-testing]
> [also build test WARNING on balbi-usb/testing/next next-20200522]
> [cannot apply to shawnguo/for-next v5.7-rc7]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://eur01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fstackoverflow.com%2Fa%2F37406982&amp;d=
ata=3D02%7C01%7Cpeter.chen%40nxp.com%7Cd98349851abc4e0abf1408d8006799d7%7C6=
86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637259792390096024&amp;sdata=3DyR=
FR26%2FjlA8dg0wS4xGplfPvXtG8tYa1qb2lroSsq0Y%3D&amp;reserved=3D0]
> =

> url:    https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FPeter-Chen%2Fusb-some-PM-change=
s-for-cdns3-and-xhci-plat%2F20200524-072451&amp;data=3D02%7C01%7Cpeter.chen=
%40nxp.com%7Cd98349851abc4e0abf1408d8006799d7%7C686ea1d3bc2b4c6fa92cd99c5c3=
01635%7C0%7C0%7C637259792390096024&amp;sdata=3DmJmxpr0897Sk415jiIGMg0Q7jIxA=
O93t%2FvUoJxAOXIg%3D&amp;reserved=3D0
> base:   https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fgregkh%2Fusb.git&amp=
;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Cd98349851abc4e0abf1408d8006799d7%7=
C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637259792390096024&amp;sdata=3D=
nrCKZGGd4%2FFUKaIGm1PTn2OzeJ3XbSZvb9sn7GHgFBw%3D&amp;reserved=3D0 usb-testi=
ng
> config: s390-randconfig-s002-20200524 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-240-gf0fe1cd9-dirty
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 ARCH=3Ds390 CF=3D'-fdiagnostic-prefix -D__CHECK_=
ENDIAN__'
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> drivers/usb/cdns3/cdns3-imx.c:150:12: warning: 'cdns_imx_platform_susp=
end' used but never defined

Will fix it at next revision, thanks.

Peter
> 150 | static int cdns_imx_platform_suspend(struct device *dev,
> |            ^~~~~~~~~~~~~~~~~~~~~~~~~
> =

> vim +/cdns_imx_platform_suspend +150 drivers/usb/cdns3/cdns3-imx.c
> =

>    149	=

>  > 150	static int cdns_imx_platform_suspend(struct device *dev,
>    151		bool suspend, bool wakeup);
>    152	static struct cdns3_platform_data cdns_imx_pdata =3D {
>    153		.platform_suspend =3D cdns_imx_platform_suspend,
>    154	};
>    155	=

> =



-- =


Thanks,
Peter Chen
--===============3566853565547750717==--

