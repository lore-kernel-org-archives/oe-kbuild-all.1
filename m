Content-Type: multipart/mixed; boundary="===============2516005483554697245=="
MIME-Version: 1.0
From: Tony Chuang <yhchuang@realtek.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2957/8703] drivers/net/wireless/realtek/rtw88/rtw8822c.c:1039:2: warning: missing braces around initializer
Date: Fri, 22 May 2020 03:49:06 +0000
Message-ID: <06f65d3990b94913a087a215e188cf1a@realtek.com>
In-Reply-To: <F09C421E5D2EBE40AFD7EEA977444DDC4D77F535@SHSMSX103.ccr.corp.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2516005483554697245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> =

> > Kalle Valo <kvalo@codeaurora.org> writes:
> >
> > >
> > > + linux-wireless
> > >
> > > kbuild test robot <lkp@intel.com> writes:
> > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git
> > > master
> > > > head:   e098d7762d602be640c53565ceca342f81e55ad2
> > > > commit: 5ad4d8957b69f3ebf95ac02212c388bda75aeb30 [2957/8703]
> > > rtw88:
> > > > set power trim according to efuse PG values
> > > > config: i386-randconfig-a002-20200514 (attached as .config)
> > > > compiler: gcc-4.9 (Ubuntu 4.9.3-13ubuntu2) 4.9.3
> > > > reproduce:
> > > >         git checkout 5ad4d8957b69f3ebf95ac02212c388bda75aeb30
> > > >         # save the attached .config to linux build tree
> > > >         make ARCH=3Di386
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > >
> > > > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > > >
> > > > drivers/net/wireless/realtek/rtw88/rtw8822c.c: In function
> > > 'rtw8822c_power_trim':
> > > >>> drivers/net/wireless/realtek/rtw88/rtw8822c.c:1039:2: warning:
> > > >> missing braces around initializer [-Wmissing-braces]
> > > > s8 bb_gain[2][8] =3D {0};
> > > > ^
> > > > drivers/net/wireless/realtek/rtw88/rtw8822c.c:1039:2: warning: (near
> > > > initialization for 'bb_gain[0]') [-Wmissing-braces]
> > >
> > > Tony, please check this and fix it. If it's a false warning please let
> > > us know.
> > >
> >
> > I tried to re-pro by:
> >          git checkout 5ad4d8957b69f3ebf95ac02212c388bda75aeb30
> >          # save the attached .config to linux build tree
> >          make ARCH=3Di386
> >
> > But cannot see it. And I checked the code, looks fine to me.
> > It seems to be a false warning.
> =

> Hi, what's your compiler? we can reproduce by gcc-4.9 and follow above st=
eps.
> =

> From https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53119 , the warning
> should be only on old compilers.
> If made below change, the warning will disappear.
> @@ -1036,7 +1036,7 @@ static void rtw8822c_set_power_trim(struct
> rtw_dev *rtwdev, s8 bb_gain[2][8])
>  static void rtw8822c_power_trim(struct rtw_dev *rtwdev)
>  {
>         u8 pg_pwr =3D 0xff, i, path, idx;
> -       s8 bb_gain[2][8] =3D {0};
> +       s8 bb_gain[2][8] =3D {};
>         u16 rf_efuse_2g[3] =3D {PPG_2GL_TXAB, PPG_2GM_TXAB,
> PPG_2GH_TXAB};
> =

> Similar fix could be seen, as an example, on
> https://lkml.org/lkml/2017/9/12/159
> =


Oh, my gcc version is 5.5.0 20171010.
OK, then I know it should be fixed for old gcc versions.
Thanks!

Yen-Hsuan
--===============2516005483554697245==--

