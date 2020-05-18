Content-Type: multipart/mixed; boundary="===============0654345541070209841=="
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] opp: Reorder the code for !target_freq case
Date: Mon, 18 May 2020 12:36:55 +0530
Message-ID: <20200518070655.x6njvrt4gqyh7pns@vireshk-i7>
In-Reply-To: <202005152222.bLAmMGus%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0654345541070209841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 15-05-20, 22:34, kbuild test robot wrote:
> Hi Viresh,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on linus/master]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Viresh-Kumar/opp-core-ad=
d-regulators-enable-and-disable/20200515-155824
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t 1ae7efb388540adc1653a51a3bc3b2c9cef5ec1a
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> =

> cppcheck warnings: (new ones prefixed by >>)
> =

> >> drivers/opp/core.c:833:7: warning: Variable 'ret' is reassigned a valu=
e before the old one has been used. [redundantAssignment]
>      ret =3D _set_required_opps(dev, opp_table, NULL);
>          ^
>    drivers/opp/core.c:830:8: note: ret is assigned
>       ret =3D -EINVAL;
>           ^
>    drivers/opp/core.c:833:7: note: ret is overwritten
>      ret =3D _set_required_opps(dev, opp_table, NULL);
>          ^
> =

> vim +/ret +833 drivers/opp/core.c

Fixed, thanks.

-- =

viresh
--===============0654345541070209841==--

