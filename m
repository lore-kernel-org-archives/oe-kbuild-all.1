Content-Type: multipart/mixed; boundary="===============1102287543992757508=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: drivers/rtc/rtc-mxc_v2.c:361 mxc_rtc_probe() warn: 'pdata->clk' not released on lines: 341, 354, 361.
Date: Tue, 25 May 2021 16:16:15 +0300
Message-ID: <202105252102.h5r94CF9-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1102287543992757508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a050a6d2b7e80ca52b2f4141eaf3420d201b72b3
commit: 0020868f2a7037e87d6b3b196526de2fb885830d rtc: mxc{,_v2}: enable COM=
PILE_TEST
config: microblaze-randconfig-m031-20210525 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rtc/rtc-mxc_v2.c:361 mxc_rtc_probe() warn: 'pdata->clk' not release=
d on lines: 341,354,361.

vim +361 drivers/rtc/rtc-mxc_v2.c

83c880f79e88cc Patrick Bruenn      2017-12-18  279  static int mxc_rtc_prob=
e(struct platform_device *pdev)
83c880f79e88cc Patrick Bruenn      2017-12-18  280  {
83c880f79e88cc Patrick Bruenn      2017-12-18  281  	struct mxc_rtc_data *p=
data;
83c880f79e88cc Patrick Bruenn      2017-12-18  282  	void __iomem *ioaddr;
83c880f79e88cc Patrick Bruenn      2017-12-18  283  	int ret =3D 0;
83c880f79e88cc Patrick Bruenn      2017-12-18  284  =

83c880f79e88cc Patrick Bruenn      2017-12-18  285  	pdata =3D devm_kzalloc=
(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
83c880f79e88cc Patrick Bruenn      2017-12-18  286  	if (!pdata)
83c880f79e88cc Patrick Bruenn      2017-12-18  287  		return -ENOMEM;
83c880f79e88cc Patrick Bruenn      2017-12-18  288  =

874532cdeefefa Anson Huang         2019-07-17  289  	pdata->ioaddr =3D devm=
_platform_ioremap_resource(pdev, 0);
83c880f79e88cc Patrick Bruenn      2017-12-18  290  	if (IS_ERR(pdata->ioad=
dr))
83c880f79e88cc Patrick Bruenn      2017-12-18  291  		return PTR_ERR(pdata-=
>ioaddr);
83c880f79e88cc Patrick Bruenn      2017-12-18  292  =

83c880f79e88cc Patrick Bruenn      2017-12-18  293  	ioaddr =3D pdata->ioad=
dr;
83c880f79e88cc Patrick Bruenn      2017-12-18  294  =

83c880f79e88cc Patrick Bruenn      2017-12-18  295  	pdata->clk =3D devm_cl=
k_get(&pdev->dev, NULL);
83c880f79e88cc Patrick Bruenn      2017-12-18  296  	if (IS_ERR(pdata->clk)=
) {
83c880f79e88cc Patrick Bruenn      2017-12-18  297  		dev_err(&pdev->dev, "=
unable to get rtc clock!\n");
83c880f79e88cc Patrick Bruenn      2017-12-18  298  		return PTR_ERR(pdata-=
>clk);
83c880f79e88cc Patrick Bruenn      2017-12-18  299  	}
83c880f79e88cc Patrick Bruenn      2017-12-18  300  =

83c880f79e88cc Patrick Bruenn      2017-12-18  301  	spin_lock_init(&pdata-=
>lock);
83c880f79e88cc Patrick Bruenn      2017-12-18  302  	pdata->irq =3D platfor=
m_get_irq(pdev, 0);
83c880f79e88cc Patrick Bruenn      2017-12-18  303  	if (pdata->irq < 0)
83c880f79e88cc Patrick Bruenn      2017-12-18  304  		return pdata->irq;
83c880f79e88cc Patrick Bruenn      2017-12-18  305  =

83c880f79e88cc Patrick Bruenn      2017-12-18  306  	device_init_wakeup(&pd=
ev->dev, 1);
fbc5ee9a6955e6 Anson Huang         2019-04-11  307  	ret =3D dev_pm_set_wak=
e_irq(&pdev->dev, pdata->irq);
fbc5ee9a6955e6 Anson Huang         2019-04-11  308  	if (ret)
fbc5ee9a6955e6 Anson Huang         2019-04-11  309  		dev_err(&pdev->dev, "=
failed to enable irq wake\n");
83c880f79e88cc Patrick Bruenn      2017-12-18  310  =

83c880f79e88cc Patrick Bruenn      2017-12-18  311  	ret =3D clk_prepare_en=
able(pdata->clk);
83c880f79e88cc Patrick Bruenn      2017-12-18  312  	if (ret)
83c880f79e88cc Patrick Bruenn      2017-12-18  313  		return ret;
83c880f79e88cc Patrick Bruenn      2017-12-18  314  	/* initialize glitch d=
etect */
83c880f79e88cc Patrick Bruenn      2017-12-18  315  	writel(SRTC_LPPDR_INIT=
, ioaddr + SRTC_LPPDR);
83c880f79e88cc Patrick Bruenn      2017-12-18  316  =

83c880f79e88cc Patrick Bruenn      2017-12-18  317  	/* clear lp interrupt =
status */
83c880f79e88cc Patrick Bruenn      2017-12-18  318  	writel(0xFFFFFFFF, ioa=
ddr + SRTC_LPSR);
83c880f79e88cc Patrick Bruenn      2017-12-18  319  =

83c880f79e88cc Patrick Bruenn      2017-12-18  320  	/* move out of init st=
ate */
83c880f79e88cc Patrick Bruenn      2017-12-18  321  	writel((SRTC_LPCR_IE |=
 SRTC_LPCR_NSA), ioaddr + SRTC_LPCR);
83c880f79e88cc Patrick Bruenn      2017-12-18  322  	ret =3D mxc_rtc_wait_f=
or_flag(ioaddr + SRTC_LPSR, SRTC_LPSR_IES);
83c880f79e88cc Patrick Bruenn      2017-12-18  323  	if (ret) {
83c880f79e88cc Patrick Bruenn      2017-12-18  324  		dev_err(&pdev->dev, "=
Timeout waiting for SRTC_LPSR_IES\n");
83c880f79e88cc Patrick Bruenn      2017-12-18  325  		clk_disable_unprepare=
(pdata->clk);
83c880f79e88cc Patrick Bruenn      2017-12-18  326  		return ret;
83c880f79e88cc Patrick Bruenn      2017-12-18  327  	}
83c880f79e88cc Patrick Bruenn      2017-12-18  328  =

83c880f79e88cc Patrick Bruenn      2017-12-18  329  	/* move out of non-val=
id state */
83c880f79e88cc Patrick Bruenn      2017-12-18  330  	writel((SRTC_LPCR_IE |=
 SRTC_LPCR_NVE | SRTC_LPCR_NSA |
83c880f79e88cc Patrick Bruenn      2017-12-18  331  		SRTC_LPCR_EN_LP), ioa=
ddr + SRTC_LPCR);
83c880f79e88cc Patrick Bruenn      2017-12-18  332  	ret =3D mxc_rtc_wait_f=
or_flag(ioaddr + SRTC_LPSR, SRTC_LPSR_NVES);
83c880f79e88cc Patrick Bruenn      2017-12-18  333  	if (ret) {
83c880f79e88cc Patrick Bruenn      2017-12-18  334  		dev_err(&pdev->dev, "=
Timeout waiting for SRTC_LPSR_NVES\n");
83c880f79e88cc Patrick Bruenn      2017-12-18  335  		clk_disable_unprepare=
(pdata->clk);
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^

83c880f79e88cc Patrick Bruenn      2017-12-18  336  		return ret;
83c880f79e88cc Patrick Bruenn      2017-12-18  337  	}
83c880f79e88cc Patrick Bruenn      2017-12-18  338  =

5490a1e018a4b4 Alexandre Belloni   2018-05-19  339  	pdata->rtc =3D devm_rt=
c_allocate_device(&pdev->dev);
5490a1e018a4b4 Alexandre Belloni   2018-05-19  340  	if (IS_ERR(pdata->rtc))
5490a1e018a4b4 Alexandre Belloni   2018-05-19  341  		return PTR_ERR(pdata-=
>rtc);

clk_disable_unprepare(pdata->clk);

5490a1e018a4b4 Alexandre Belloni   2018-05-19  342  =

5490a1e018a4b4 Alexandre Belloni   2018-05-19  343  	pdata->rtc->ops =3D &m=
xc_rtc_ops;
95fbfa14b431d4 Alexandre Belloni   2018-05-19  344  	pdata->rtc->range_max =
=3D U32_MAX;
5490a1e018a4b4 Alexandre Belloni   2018-05-19  345  =

83c880f79e88cc Patrick Bruenn      2017-12-18  346  	clk_disable(pdata->clk=
);
83c880f79e88cc Patrick Bruenn      2017-12-18  347  	platform_set_drvdata(p=
dev, pdata);
83c880f79e88cc Patrick Bruenn      2017-12-18  348  	ret =3D
83c880f79e88cc Patrick Bruenn      2017-12-18  349  	    devm_request_irq(&=
pdev->dev, pdata->irq, mxc_rtc_interrupt, 0,
83c880f79e88cc Patrick Bruenn      2017-12-18  350  			     pdev->name, &pd=
ev->dev);
83c880f79e88cc Patrick Bruenn      2017-12-18  351  	if (ret < 0) {
83c880f79e88cc Patrick Bruenn      2017-12-18  352  		dev_err(&pdev->dev, "=
interrupt not available.\n");
83c880f79e88cc Patrick Bruenn      2017-12-18  353  		clk_unprepare(pdata->=
clk);

Should these be clk_disable_unprepare()?  I don't know.  Please tell
me the rules on this if the warning is wrong.  I also haven't looked up
exactly why this warning is displayed, I would have expected
clk_unprepare() to silence it.

83c880f79e88cc Patrick Bruenn      2017-12-18  354  		return ret;
83c880f79e88cc Patrick Bruenn      2017-12-18  355  	}
83c880f79e88cc Patrick Bruenn      2017-12-18  356  =

fdcfd854333be5 Bartosz Golaszewski 2020-11-09  357  	ret =3D devm_rtc_regis=
ter_device(pdata->rtc);
5490a1e018a4b4 Alexandre Belloni   2018-05-19  358  	if (ret < 0)
83c880f79e88cc Patrick Bruenn      2017-12-18  359  		clk_unprepare(pdata->=
clk);

Same.

83c880f79e88cc Patrick Bruenn      2017-12-18  360  =

5490a1e018a4b4 Alexandre Belloni   2018-05-19 @361  	return ret;
83c880f79e88cc Patrick Bruenn      2017-12-18  362  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1102287543992757508==--

