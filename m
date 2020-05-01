Content-Type: multipart/mixed; boundary="===============6412291804528242449=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next] net_sched: sch_fq: add horizon attribute
Date: Fri, 01 May 2020 06:57:14 -0700
Message-ID: <CANn89i+5Qe1qC-YaxLFRWpYuHnL7ehaaig0WWmWuxGOUOOe0Aw@mail.gmail.com>
In-Reply-To: <202005011815.an8L9pEE%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6412291804528242449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2020 at 3:43 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Eric,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on net-next/master]
> [also build test WARNING on net/master linus/master v5.7-rc3 next-2020043=
0]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Eric-Dumazet/net_sched-s=
ch_fq-add-horizon-attribute/20200501-135537
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t 37ecb5b8b8cd3156e739fd1c56a8e3842b72ebad
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Di386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    net/sched/sch_fq.c: In function 'fq_init':
> >> net/sched/sch_fq.c:938:18: warning: integer overflow in expression [-W=
overflow]
>      q->horizon =3D 10 * NSEC_PER_SEC; /* 10 seconds */

Thanks, I will use 10ULL in v2



>                      ^
>
> vim +938 net/sched/sch_fq.c
>
>    913
>    914  static int fq_init(struct Qdisc *sch, struct nlattr *opt,
>    915                     struct netlink_ext_ack *extack)
>    916  {
>    917          struct fq_sched_data *q =3D qdisc_priv(sch);
>    918          int err;
>    919
>    920          sch->limit              =3D 10000;
>    921          q->flow_plimit          =3D 100;
>    922          q->quantum              =3D 2 * psched_mtu(qdisc_dev(sch)=
);
>    923          q->initial_quantum      =3D 10 * psched_mtu(qdisc_dev(sch=
));
>    924          q->flow_refill_delay    =3D msecs_to_jiffies(40);
>    925          q->flow_max_rate        =3D ~0UL;
>    926          q->time_next_delayed_flow =3D ~0ULL;
>    927          q->rate_enable          =3D 1;
>    928          q->new_flows.first      =3D NULL;
>    929          q->old_flows.first      =3D NULL;
>    930          q->delayed              =3D RB_ROOT;
>    931          q->fq_root              =3D NULL;
>    932          q->fq_trees_log         =3D ilog2(1024);
>    933          q->orphan_mask          =3D 1024 - 1;
>    934          q->low_rate_threshold   =3D 550000 / 8;
>    935
>    936          q->timer_slack =3D 10 * NSEC_PER_USEC; /* 10 usec of hrti=
mer slack */
>    937
>  > 938          q->horizon =3D 10 * NSEC_PER_SEC; /* 10 seconds */
>    939          q->horizon_drop =3D 1; /* by default, drop packets beyond=
 horizon */
>    940
>    941          /* Default ce_threshold of 4294 seconds */
>    942          q->ce_threshold         =3D (u64)NSEC_PER_USEC * ~0U;
>    943
>    944          qdisc_watchdog_init_clockid(&q->watchdog, sch, CLOCK_MONO=
TONIC);
>    945
>    946          if (opt)
>    947                  err =3D fq_change(sch, opt, extack);
>    948          else
>    949                  err =3D fq_resize(sch, q->fq_trees_log);
>    950
>    951          return err;
>    952  }
>    953
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6412291804528242449==--

