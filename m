Content-Type: multipart/mixed; boundary="===============5824303578177999195=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] opp: Reorder the code for !target_freq case
Date: Fri, 15 May 2020 22:34:29 +0800
Message-ID: <202005152222.bLAmMGus%lkp@intel.com>
In-Reply-To: <e5875b12062c42ba09f9b67feb5f2681ae025f63.1589528491.git.viresh.kumar@linaro.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5824303578177999195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Viresh-Kumar/opp-core-add-=
regulators-enable-and-disable/20200515-155824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
1ae7efb388540adc1653a51a3bc3b2c9cef5ec1a

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/opp/core.c:833:7: warning: Variable 'ret' is reassigned a value =
before the old one has been used. [redundantAssignment]
     ret =3D _set_required_opps(dev, opp_table, NULL);
         ^
   drivers/opp/core.c:830:8: note: ret is assigned
      ret =3D -EINVAL;
          ^
   drivers/opp/core.c:833:7: note: ret is overwritten
     ret =3D _set_required_opps(dev, opp_table, NULL);
         ^

vim +/ret +833 drivers/opp/core.c

   793	=

   794	/**
   795	 * dev_pm_opp_set_rate() - Configure new OPP based on frequency
   796	 * @dev:	 device for which we do this operation
   797	 * @target_freq: frequency to achieve
   798	 *
   799	 * This configures the power-supplies to the levels specified by the=
 OPP
   800	 * corresponding to the target_freq, and programs the clock to a val=
ue <=3D
   801	 * target_freq, as rounded by clk_round_rate(). Device wanting to ru=
n@fmax
   802	 * provided by the opp, should have already rounded to the target OP=
P's
   803	 * frequency.
   804	 */
   805	int dev_pm_opp_set_rate(struct device *dev, unsigned long target_fre=
q)
   806	{
   807		struct opp_table *opp_table;
   808		unsigned long freq, old_freq, temp_freq;
   809		struct dev_pm_opp *old_opp, *opp;
   810		struct clk *clk;
   811		int ret;
   812	=

   813		opp_table =3D _find_opp_table(dev);
   814		if (IS_ERR(opp_table)) {
   815			dev_err(dev, "%s: device opp doesn't exist\n", __func__);
   816			return PTR_ERR(opp_table);
   817		}
   818	=

   819		if (unlikely(!target_freq)) {
   820			/*
   821			 * Some drivers need to support cases where some platforms may
   822			 * have OPP table for the device, while others don't and
   823			 * opp_set_rate() just needs to behave like clk_set_rate().
   824			 */
   825			if (!_get_opp_count(opp_table))
   826				return 0;
   827	=

   828			if (!opp_table->required_opp_tables) {
   829				dev_err(dev, "target frequency can't be 0\n");
   830				ret =3D -EINVAL;
   831			}
   832	=

 > 833			ret =3D _set_required_opps(dev, opp_table, NULL);
   834			goto put_opp_table;
   835		}
   836	=

   837		clk =3D opp_table->clk;
   838		if (IS_ERR(clk)) {
   839			dev_err(dev, "%s: No clock available for the device\n",
   840				__func__);
   841			ret =3D PTR_ERR(clk);
   842			goto put_opp_table;
   843		}
   844	=

   845		freq =3D clk_round_rate(clk, target_freq);
   846		if ((long)freq <=3D 0)
   847			freq =3D target_freq;
   848	=

   849		old_freq =3D clk_get_rate(clk);
   850	=

   851		/* Return early if nothing to do */
   852		if (old_freq =3D=3D freq) {
   853			dev_dbg(dev, "%s: old/new frequencies (%lu Hz) are same, nothing t=
o do\n",
   854				__func__, freq);
   855			ret =3D 0;
   856			goto put_opp_table;
   857		}
   858	=

   859		/*
   860		 * For IO devices which require an OPP on some platforms/SoCs
   861		 * while just needing to scale the clock on some others
   862		 * we look for empty OPP tables with just a clock handle and
   863		 * scale only the clk. This makes dev_pm_opp_set_rate()
   864		 * equivalent to a clk_set_rate()
   865		 */
   866		if (!_get_opp_count(opp_table)) {
   867			ret =3D _generic_set_opp_clk_only(dev, clk, freq);
   868			goto put_opp_table;
   869		}
   870	=

   871		temp_freq =3D old_freq;
   872		old_opp =3D _find_freq_ceil(opp_table, &temp_freq);
   873		if (IS_ERR(old_opp)) {
   874			dev_err(dev, "%s: failed to find current OPP for freq %lu (%ld)\n",
   875				__func__, old_freq, PTR_ERR(old_opp));
   876		}
   877	=

   878		temp_freq =3D freq;
   879		opp =3D _find_freq_ceil(opp_table, &temp_freq);
   880		if (IS_ERR(opp)) {
   881			ret =3D PTR_ERR(opp);
   882			dev_err(dev, "%s: failed to find OPP for freq %lu (%d)\n",
   883				__func__, freq, ret);
   884			goto put_old_opp;
   885		}
   886	=

   887		dev_dbg(dev, "%s: switching OPP: %lu Hz --> %lu Hz\n", __func__,
   888			old_freq, freq);
   889	=

   890		/* Scaling up? Configure required OPPs before frequency */
   891		if (freq >=3D old_freq) {
   892			ret =3D _set_required_opps(dev, opp_table, opp);
   893			if (ret)
   894				goto put_opp;
   895		}
   896	=

   897		if (opp_table->set_opp) {
   898			ret =3D _set_opp_custom(opp_table, dev, old_freq, freq,
   899					      IS_ERR(old_opp) ? NULL : old_opp->supplies,
   900					      opp->supplies);
   901		} else if (opp_table->regulators) {
   902			ret =3D _generic_set_opp_regulator(opp_table, dev, old_freq, freq,
   903							 IS_ERR(old_opp) ? NULL : old_opp->supplies,
   904							 opp->supplies);
   905		} else {
   906			/* Only frequency scaling */
   907			ret =3D _generic_set_opp_clk_only(dev, clk, freq);
   908		}
   909	=

   910		/* Scaling down? Configure required OPPs after frequency */
   911		if (!ret && freq < old_freq) {
   912			ret =3D _set_required_opps(dev, opp_table, opp);
   913			if (ret)
   914				dev_err(dev, "Failed to set required opps: %d\n", ret);
   915		}
   916	=

   917	put_opp:
   918		dev_pm_opp_put(opp);
   919	put_old_opp:
   920		if (!IS_ERR(old_opp))
   921			dev_pm_opp_put(old_opp);
   922	put_opp_table:
   923		dev_pm_opp_put_opp_table(opp_table);
   924		return ret;
   925	}
   926	EXPORT_SYMBOL_GPL(dev_pm_opp_set_rate);
   927	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5824303578177999195==--

