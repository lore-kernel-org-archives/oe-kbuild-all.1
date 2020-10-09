Content-Type: multipart/mixed; boundary="===============6407624314303959238=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCHv2 net-next 17/17] sctp: enable udp tunneling socks
Date: Fri, 09 Oct 2020 10:02:09 +0800
Message-ID: <CADvbK_f+Z=Z72bHuf0tGbQBAw4+hq5R=r7buxV_dGDgJTt632Q@mail.gmail.com>
In-Reply-To: <202010082357.BLEOWVCz-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6407624314303959238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2020 at 11:46 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Xin,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on net-next/master]
>
> url:    https://github.com/0day-ci/linux/commits/Xin-Long/sctp-Implement-=
RFC6951-UDP-Encapsulation-of-SCTP/20201008-175211
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t 9faebeb2d80065926dfbc09cb73b1bb7779a89cd
> config: i386-randconfig-s002-20201008 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.2-218-gc0e96d6d-dirty
>         # https://github.com/0day-ci/linux/commit/7dab31e8c96fab2089a651d=
5a6d06bcf92b011ad
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Xin-Long/sctp-Implement-RFC6951-=
UDP-Encapsulation-of-SCTP/20201008-175211
>         git checkout 7dab31e8c96fab2089a651d5a6d06bcf92b011ad
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' AR=
CH=3Di386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> echo
> echo "sparse warnings: (new ones prefixed by >>)"
> echo
> >> net/sctp/sysctl.c:532:39: sparse: sparse: incorrect type in assignment=
 (different base types) @@     expected restricted __be16 [usertype] udp_po=
rt @@     got int udp_port @@
> >> net/sctp/sysctl.c:532:39: sparse:     expected restricted __be16 [user=
type] udp_port
> >> net/sctp/sysctl.c:532:39: sparse:     got int udp_port
>
> vim +532 net/sctp/sysctl.c
>
>    500
>    501  static int proc_sctp_do_udp_port(struct ctl_table *ctl, int write,
>    502                                   void *buffer, size_t *lenp, loff=
_t *ppos)
>    503  {
>    504          struct net *net =3D current->nsproxy->net_ns;
>    505          unsigned int min =3D *(unsigned int *)ctl->extra1;
>    506          unsigned int max =3D *(unsigned int *)ctl->extra2;
>    507          struct ctl_table tbl;
>    508          int ret, new_value;
>    509
>    510          memset(&tbl, 0, sizeof(struct ctl_table));
>    511          tbl.maxlen =3D sizeof(unsigned int);
>    512
>    513          if (write)
>    514                  tbl.data =3D &new_value;
>    515          else
>    516                  tbl.data =3D &net->sctp.udp_port;
>    517
>    518          ret =3D proc_dointvec(&tbl, write, buffer, lenp, ppos);
>    519          if (write && ret =3D=3D 0) {
>    520                  struct sock *sk =3D net->sctp.ctl_sock;
>    521
>    522                  if (new_value > max || new_value < min)
>    523                          return -EINVAL;
>    524
>    525                  net->sctp.udp_port =3D new_value;
>    526                  sctp_udp_sock_stop(net);
>    527                  ret =3D sctp_udp_sock_start(net);
>    528                  if (ret)
>    529                          net->sctp.udp_port =3D 0;
>    530
>    531                  lock_sock(sk);
>  > 532                  sctp_sk(sk)->udp_port =3D net->sctp.udp_port;
>    533                  release_sock(sk);
>    534          }
>    535
>    536          return ret;
>    537  }
>    538
I will add the restricted __be16 in these 3 patches.

Thanks.
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6407624314303959238==--

