Content-Type: multipart/mixed; boundary="===============7866265785333501518=="
MIME-Version: 1.0
From: Matthias Kaehlcke <mka@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [vireshk-pm:opp/linux-next 4/9] drivers/opp/core.c:1076: undefined reference to `icc_put'
Date: Wed, 13 May 2020 10:58:45 -0700
Message-ID: <20200513175845.GL4525@google.com>
In-Reply-To: <202005140035.UfD5FLs8%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7866265785333501518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 12:43:38AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git op=
p/linux-next
> head:   b9fd171ae7781c5eb2ecc5f3a59cb41b33c05be0
> commit: 6b6c64a05ad880d425db18c52b7ff79d4be148a6 [4/9] OPP: Add support f=
or parsing interconnect bandwidth
> config: x86_64-randconfig-a002-20200513 (attached as .config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce:
>         git checkout 6b6c64a05ad880d425db18c52b7ff79d4be148a6
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> ld: drivers/opp/core.o: in function `_opp_table_kref_release':
> >> drivers/opp/core.c:1076: undefined reference to `icc_put'
> ld: drivers/opp/of.o: in function `dev_pm_opp_of_find_icc_paths':
> >> drivers/opp/of.c:364: undefined reference to `of_icc_get_by_index'
> >> ld: drivers/opp/of.c:383: undefined reference to `icc_put'

the .config has 'CONFIG_INTERCONNECT=3Dm' which supposedly is verboten by

  depends on INTERCONNECT || !INTERCONNECT

in drivers/opp/Kconfig

I stumbled across this during the review and I'm still doubtful that
depending on an option actually means that it is builtin.

A couple of drivers use something like

  depends on INTERCONNECT !=3D m

However this still doesn't fix the build error. It seems the dependency is
ignored because PM_DEVFREQ enables OPP:

  Selected by [y]:                                                         =
                                                                           =
                                                               =E2=94=82
  =E2=94=82   - PM_DEVFREQ [=3Dy]

> vim +1076 drivers/opp/core.c
> =

>   1061	=

>   1062	static void _opp_table_kref_release(struct kref *kref)
>   1063	{
>   1064		struct opp_table *opp_table =3D container_of(kref, struct opp_tab=
le, kref);
>   1065		struct opp_device *opp_dev, *temp;
>   1066		int i;
>   1067	=

>   1068		_of_clear_opp_table(opp_table);
>   1069	=

>   1070		/* Release clk */
>   1071		if (!IS_ERR(opp_table->clk))
>   1072			clk_put(opp_table->clk);
>   1073	=

>   1074		if (opp_table->paths) {
>   1075			for (i =3D 0; i < opp_table->path_count; i++)
> > 1076				icc_put(opp_table->paths[i]);
>   1077			kfree(opp_table->paths);
>   1078		}
>   1079	=

>   1080		WARN_ON(!list_empty(&opp_table->opp_list));
>   1081	=

>   1082		list_for_each_entry_safe(opp_dev, temp, &opp_table->dev_list, nod=
e) {
>   1083			/*
>   1084			 * The OPP table is getting removed, drop the performance state
>   1085			 * constraints.
>   1086			 */
>   1087			if (opp_table->genpd_performance_state)
>   1088				dev_pm_genpd_set_performance_state((struct device *)(opp_dev->d=
ev), 0);
>   1089	=

>   1090			_remove_opp_dev(opp_dev, opp_table);
>   1091		}
>   1092	=

>   1093		mutex_destroy(&opp_table->genpd_virt_dev_lock);
>   1094		mutex_destroy(&opp_table->lock);
>   1095		list_del(&opp_table->node);
>   1096		kfree(opp_table);
>   1097	=

>   1098		mutex_unlock(&opp_table_lock);
>   1099	}
>   1100	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============7866265785333501518==--

