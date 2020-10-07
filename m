Content-Type: multipart/mixed; boundary="===============2053310347078330592=="
MIME-Version: 1.0
From: Jun Nie <jun.nie@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/3] power: avs: qcom-cpr: add support to msm8939
Date: Wed, 07 Oct 2020 11:22:38 +0800
Message-ID: <CABymUCPW-xKj37FghscTv2xc6fSxGwwbFCVF6kUjgG3iuj2F4A@mail.gmail.com>
In-Reply-To: <202010010818.bTfsOYy0-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2053310347078330592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> =E4=BA=8E2020=E5=B9=B410=E6=9C=881=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=889:00=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jun,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on pm/linux-next]
> [also build test WARNING on robh/for-next linus/master v5.9-rc7 next-2020=
0930]
> [cannot apply to battery/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Jun-Nie/Support-CPR-on-m=
sm8939/20200930-142825
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.g=
it linux-next
> config: x86_64-randconfig-m031-20200930 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> smatch warnings:
> drivers/power/avs/qcom-cpr.c:1957 cpr_fuse_match_tuple() warn: always tru=
e condition '(drv->cpr_fuse_map_match !=3D (-1)) =3D> (0-u16max !=3D (-1))'
>
> vim +1957 drivers/power/avs/qcom-cpr.c
>
Rob,

Thanks for your precious comments! I will fix these issue soon after holida=
y.

Regards,
Jun
--===============2053310347078330592==--

