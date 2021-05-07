Content-Type: multipart/mixed; boundary="===============1116568586434808225=="
MIME-Version: 1.0
From: Toke Høiland-Jørgensen <toke@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7] mac80211: Switch to a virtual time-based airtime scheduler
Date: Fri, 07 May 2021 10:19:02 +0200
Message-ID: <87r1ijufbd.fsf@toke.dk>
In-Reply-To: <20210507055512.GC2687475@shao2-debian>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1116568586434808225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <rong.a.chen@intel.com> writes:

> Hi "Toke,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on mac80211-next/master]
> [also build test WARNING on next-20210505]
> [cannot apply to mac80211/master v5.12]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Toke-H-iland-J-rgensen/m=
ac80211-Switch-to-a-virtual-time-based-airtime-scheduler/20210505-224557
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-ne=
xt.git master
> config: i386-randconfig-s002-20210505 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://github.com/0day-ci/linux/commit/4ff38b3940e58b3d8e44594=
f44f2f700e5b930b5
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Toke-H-iland-J-rgensen/mac80211-=
Switch-to-a-virtual-time-based-airtime-scheduler/20210505-224557
>         git checkout 4ff38b3940e58b3d8e44594f44f2f700e5b930b5
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=
=3D1 ARCH=3Di386 =

>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
>>> net/mac80211/tx.c:4020:6: sparse: sparse: context imbalance in 'ieee802=
11_txq_may_transmit' - wrong count at exit

Oops, seems the unlock somehow got moved to above the out: label - will
fix!

-Toke

--===============1116568586434808225==--

