Content-Type: multipart/mixed; boundary="===============6818800932550250428=="
MIME-Version: 1.0
From: Hans de Goede <hdegoede@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [pm:bleeding-edge 20/29] drivers/acpi/platform_profile.c:67:33: error: passing 'const struct platform_profile_handler to parameter of type 'struct platform_profile_handler discards qualifiers
Date: Tue, 12 Jan 2021 11:42:07 +0100
Message-ID: <5e7a4d87-52ef-e487-9cc2-8e7094beaa08@redhat.com>
In-Reply-To: <202101081623.CGkLO3Kx-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6818800932550250428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 1/8/21 9:52 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.g=
it bleeding-edge
> head:   2691096b51bae3563007c4b0188c3eec9878224b
> commit: b417d9c7404df67b9be0104585fefb2ca8d36677 [20/29] ACPI: platform-p=
rofile: Pass profile pointer to driver callbacks
> config: x86_64-randconfig-r011-20210108 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c95=
1623bc8965fa1e89660f2f5f4a2944e4981a)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm=
.git/commit/?id=3Db417d9c7404df67b9be0104585fefb2ca8d36677
>         git remote add pm https://git.kernel.org/pub/scm/linux/kernel/git=
/rafael/linux-pm.git
>         git fetch --no-tags pm bleeding-edge
>         git checkout b417d9c7404df67b9be0104585fefb2ca8d36677
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>>> drivers/acpi/platform_profile.c:67:33: error: passing 'const struct pla=
tform_profile_handler *' to parameter of type 'struct platform_profile_hand=
ler *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-q=
ualifiers]
>            err =3D cur_profile->profile_get(cur_profile, &profile);
>                                           ^~~~~~~~~~~
>    drivers/acpi/platform_profile.c:107:33: error: passing 'const struct p=
latform_profile_handler *' to parameter of type 'struct platform_profile_ha=
ndler *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards=
-qualifiers]
>            err =3D cur_profile->profile_set(cur_profile, i);
>                                           ^~~~~~~~~~~
>    2 errors generated.

Ugh, so that means that the current version of the
"ACPI: platform-profile: Pass profile pointer to driver callbacks"
patch is no good. Since this is causing compile errors I assume
that it will be dropped from the bleeding-edge branch.
Is that right Rafael?

I believe that the best fix is to just drop the const everywhere,
neither of the 2 planned uses has its platform_profile_handler defined
as const:

1. In the thinkpad_acpi case it is not const, because of using set_bit
calls to set the choices bits.

2. In the ideapad-laptop case it is not const because it will be
embedded in the dynamically allocated drv_data struct.

Jiaxun, can you do a new version where you drop the const (and
explain why this is done in the commit message)  ?

Regards,

Hans




> =

> =

> vim +67 drivers/acpi/platform_profile.c
> =

>     50	=

>     51	static ssize_t platform_profile_show(struct device *dev,
>     52						struct device_attribute *attr,
>     53						char *buf)
>     54	{
>     55		enum platform_profile_option profile =3D PLATFORM_PROFILE_BALANCE=
D;
>     56		int err;
>     57	=

>     58		err =3D mutex_lock_interruptible(&profile_lock);
>     59		if (err)
>     60			return err;
>     61	=

>     62		if (!cur_profile) {
>     63			mutex_unlock(&profile_lock);
>     64			return -ENODEV;
>     65		}
>     66	=

>   > 67		err =3D cur_profile->profile_get(cur_profile, &profile);
>     68		mutex_unlock(&profile_lock);
>     69		if (err)
>     70			return err;
>     71	=

>     72		/* Check that profile is valid index */
>     73		if (WARN_ON((profile < 0) || (profile >=3D ARRAY_SIZE(profile_nam=
es))))
>     74			return -EIO;
>     75	=

>     76		return sysfs_emit(buf, "%s\n", profile_names[profile]);
>     77	}
>     78	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20

--===============6818800932550250428==--

