Content-Type: multipart/mixed; boundary="===============8214049587517167753=="
MIME-Version: 1.0
From: Lee Jones <lee.jones@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] mfd: mfd_cell: constify platform_data
Date: Mon, 18 May 2020 09:45:25 +0100
Message-ID: <20200518084525.GM271301@dell>
In-Reply-To: <202005162129.QQOL64er%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8214049587517167753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 16 May 2020, kbuild test robot wrote:

> Hi Tomas,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on ljones-mfd/for-mfd-next]
> [also build test ERROR on v5.7-rc5 next-20200515]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Tomas-Winkler/mfd-consti=
fy-pointers/20200516-190733
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-m=
fd-next
> config: arm-randconfig-r006-20200515 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 13d4=
4b2a0c7ef404b13b16644765977cd5310fe2)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> drivers/hid/hid-sensor-hub.c:738:33: error: initializing 'struct hid_s=
ensor_hub_device *' with an expression of type 'const void *' discards qual=
ifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> struct hid_sensor_hub_device *hsdev =3D
> ^

Obviously this would need fixing before it can be considered.

> 1 error generated.
> =

> vim +738 drivers/hid/hid-sensor-hub.c
> =

> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  726  =

> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  727  static void sensor_h=
ub_remove(struct hid_device *hdev)
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  728  {
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  729  	struct sensor_hub_d=
ata *data =3D hid_get_drvdata(hdev);
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  730  	unsigned long flags;
> e651a1da442ae02 Srinivas Pandruvada 2015-02-19  731  	int i;
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  732  =

> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  733  	hid_dbg(hdev, " har=
dware removed\n");
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  734  	hid_hw_close(hdev);
> f2f13a68c37c13a Axel Lin            2012-09-19  735  	hid_hw_stop(hdev);
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  736  	spin_lock_irqsave(&=
data->lock, flags);
> e651a1da442ae02 Srinivas Pandruvada 2015-02-19  737  	for (i =3D 0; i < d=
ata->hid_sensor_client_cnt; ++i) {
> e651a1da442ae02 Srinivas Pandruvada 2015-02-19 @738  		struct hid_sensor_=
hub_device *hsdev =3D
> e651a1da442ae02 Srinivas Pandruvada 2015-02-19  739  			data->hid_sensor_=
hub_client_devs[i].platform_data;
> e651a1da442ae02 Srinivas Pandruvada 2015-02-19  740  		if (hsdev->pending=
.status)
> e651a1da442ae02 Srinivas Pandruvada 2015-02-19  741  			complete(&hsdev->=
pending.ready);
> e651a1da442ae02 Srinivas Pandruvada 2015-02-19  742  	}
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  743  	spin_unlock_irqrest=
ore(&data->lock, flags);
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  744  	mfd_remove_devices(=
&hdev->dev);
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  745  	mutex_destroy(&data=
->mutex);
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  746  }
> 401ca24fb34aee0 srinivas pandruvada 2012-09-05  747  =

> =

> :::::: The code at line 738 was first introduced by commit
> :::::: e651a1da442ae02a50081e38309dea5e89da2d41 HID: hid-sensor-hub: Allo=
w parallel synchronous reads
> =

> :::::: TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> :::::: CC: Jiri Kosina <jkosina@suse.cz>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--===============8214049587517167753==--

