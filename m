Content-Type: multipart/mixed; boundary="===============6006361089560260016=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [vireshk-pm:opp/linux-next 4/9] drivers/opp/core.c:1076: undefined reference to `icc_put'
Date: Thu, 14 May 2020 12:08:04 +0530
Message-ID: <20200514063804.mwwf2n5o6cp4np53@vireshk-i7>
In-Reply-To: <d230ab5e-54a6-56f0-77fc-1cc16f24e387@linaro.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6006361089560260016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 14-05-20, 09:24, Georgi Djakov wrote:
> On 5/13/20 20:58, Matthias Kaehlcke wrote:
> > On Thu, May 14, 2020 at 12:43:38AM +0800, kbuild test robot wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git=
 opp/linux-next
> >> head:   b9fd171ae7781c5eb2ecc5f3a59cb41b33c05be0
> >> commit: 6b6c64a05ad880d425db18c52b7ff79d4be148a6 [4/9] OPP: Add suppor=
t for parsing interconnect bandwidth
> >> config: x86_64-randconfig-a002-20200513 (attached as .config)
> >> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> >> reproduce:
> >>         git checkout 6b6c64a05ad880d425db18c52b7ff79d4be148a6
> >>         # save the attached .config to linux build tree
> >>         make ARCH=3Dx86_64 =

> >>
> >> If you fix the issue, kindly add following tag as appropriate
> >> Reported-by: kbuild test robot <lkp@intel.com>
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >> ld: drivers/opp/core.o: in function `_opp_table_kref_release':
> >>>> drivers/opp/core.c:1076: undefined reference to `icc_put'
> >> ld: drivers/opp/of.o: in function `dev_pm_opp_of_find_icc_paths':
> >>>> drivers/opp/of.c:364: undefined reference to `of_icc_get_by_index'
> >>>> ld: drivers/opp/of.c:383: undefined reference to `icc_put'
> > =

> > the .config has 'CONFIG_INTERCONNECT=3Dm' which supposedly is verboten =
by
> > =

> >   depends on INTERCONNECT || !INTERCONNECT

I tried to do some testing and looks like this test isn't good enough
anyway. I tried with new definitions to avoid any external factors:

diff --git a/drivers/opp/Kconfig b/drivers/opp/Kconfig
index 230d2b84436c..a41dbc390361 100644
--- a/drivers/opp/Kconfig
+++ b/drivers/opp/Kconfig
@@ -13,3 +12,10 @@ config PM_OPP
          representing individual voltage domains and provides SOC
          implementations a ready to use framework to manage OPPs.
          For more information, read <file:Documentation/power/opp.rst>
+
+config PM_OPP_TEST
+       bool "Test1"
+       depends on PM_OPP_TEST2 || !PM_OPP_TEST2
+
+config PM_OPP_TEST2
+       tristate "Test"

Whatever state I choose for TEST2, TEST1 can always be selected. So
this test is surely bogus. I then replaced the depends on line with:

+       depends on PM_OPP_TEST2 !=3D m

and it works fine then. So this is what you need instead of the
standard way you are trying it.

That said, there are more complex dependencies everywhere it seems and
so things look broken. I have removed your patches from linux-next for
the time being though.

-- =

viresh
--===============6006361089560260016==--

