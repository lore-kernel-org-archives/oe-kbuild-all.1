Content-Type: multipart/mixed; boundary="===============5236253332959957444=="
MIME-Version: 1.0
From: Tony Chuang <yhchuang@realtek.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2957/8703] drivers/net/wireless/realtek/rtw88/rtw8822c.c:1039:2: warning: missing braces around initializer
Date: Tue, 19 May 2020 09:16:48 +0000
Message-ID: <08fd8d04c2d84d58ac751371cd1c4c1f@realtek.com>
In-Reply-To: <87blmljuqz.fsf@kamboji.qca.qualcomm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5236253332959957444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Kalle Valo <kvalo@codeaurora.org> writes:

> =

> + linux-wireless
> =

> kbuild test robot <lkp@intel.com> writes:
> =

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
> master
> > head:   e098d7762d602be640c53565ceca342f81e55ad2
> > commit: 5ad4d8957b69f3ebf95ac02212c388bda75aeb30 [2957/8703]
> rtw88:
> > set power trim according to efuse PG values
> > config: i386-randconfig-a002-20200514 (attached as .config)
> > compiler: gcc-4.9 (Ubuntu 4.9.3-13ubuntu2) 4.9.3
> > reproduce:
> >         git checkout 5ad4d8957b69f3ebf95ac02212c388bda75aeb30
> >         # save the attached .config to linux build tree
> >         make ARCH=3Di386
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
> > drivers/net/wireless/realtek/rtw88/rtw8822c.c: In function
> 'rtw8822c_power_trim':
> >>> drivers/net/wireless/realtek/rtw88/rtw8822c.c:1039:2: warning:
> >> missing braces around initializer [-Wmissing-braces]
> > s8 bb_gain[2][8] =3D {0};
> > ^
> > drivers/net/wireless/realtek/rtw88/rtw8822c.c:1039:2: warning: (near
> > initialization for 'bb_gain[0]') [-Wmissing-braces]
> =

> Tony, please check this and fix it. If it's a false warning please let
> us know.
> =


I tried to re-pro by:
         git checkout 5ad4d8957b69f3ebf95ac02212c388bda75aeb30
         # save the attached .config to linux build tree
         make ARCH=3Di386

But cannot see it. And I checked the code, looks fine to me.
It seems to be a false warning.

Yen-Hsuan
--===============5236253332959957444==--

