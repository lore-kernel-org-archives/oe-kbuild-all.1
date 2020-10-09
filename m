Content-Type: multipart/mixed; boundary="===============5458990995158603365=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/power/supply/mp2629_charger.c:522:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'.
Date: Fri, 09 Oct 2020 17:27:14 +0300
Message-ID: <CAHp75VdX_uxbrkX=XF11WDBcuXjpQYWjjOzVzJ8ffj46oGw_JA@mail.gmail.com>
In-Reply-To: <20201009133734.GE8133@xsang-OptiPlex-9020>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5458990995158603365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2020 at 4:23 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   549738f15da0e5a00275977623be199fbbf7df50
> commit: 3bc6d790c39dfc4539c36525e6bcb617abbae467 power: supply: Add suppo=
rt for mps mp2629 battery charger
> date:   4 months ago
> :::::: branch date: 12 hours ago
> :::::: commit date: 4 months ago
> compiler: sh4-linux-gcc (GCC) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

...

> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  514          unsigned int rval;
> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  515          int ret;
> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  516
> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  517          ret =3D regmap_re=
ad(charger->regmap, MP2629_REG_IMPEDANCE_COMP, &rval);
> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  518          if (ret)
> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  519                  return re=
t;
> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  520
> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  521          rval =3D (rval >>=
 4) * 10;
> 3bc6d790c39dfc Saravanan Sekar 2020-05-26 @522          return sprintf(bu=
f, "%d mohm\n", rval);
> 3bc6d790c39dfc Saravanan Sekar 2020-05-26  523  }

Right, should be %u. Can LKP generate this type of patches?

-- =

With Best Regards,
Andy Shevchenko
--===============5458990995158603365==--

