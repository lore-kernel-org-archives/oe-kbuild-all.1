Content-Type: multipart/mixed; boundary="===============1246211552742406359=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [sschmidt-wpan-next:master 4/8] net/ipv4/fib_semantics.c:594:31: error: passing argument 6 of 'lwtunnel_build_state' from incompatible pointer type
Date: Sat, 29 Feb 2020 19:08:00 +0800
Message-ID: <202002291936.C66sj3Se%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1246211552742406359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan-next.=
git master
head:   ff2dfbe03c56d6b537d26025dc56b900fe6eae12
commit: c0037234c69e275990fbb4e8c006869b53220e84 [4/8] net: add net availab=
le in build_state
config: riscv-defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout c0037234c69e275990fbb4e8c006869b53220e84
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Driscv =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   net/ipv4/fib_semantics.c: In function 'fib_nh_common_init':
   net/ipv4/fib_semantics.c:593:30: warning: passing argument 1 of 'lwtunne=
l_build_state' makes integer from pointer without a cast [-Wint-conversion]
      err =3D lwtunnel_build_state(net, encap_type, encap,
                                 ^~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'u16 {aka short unsigned i=
nt}' but argument is of type 'struct net *'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:593:35: warning: passing argument 2 of 'lwtunne=
l_build_state' makes pointer from integer without a cast [-Wint-conversion]
      err =3D lwtunnel_build_state(net, encap_type, encap,
                                      ^~~~~~~~~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'struct nlattr *' but argu=
ment is of type 'u16 {aka short unsigned int}'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:593:47: warning: passing argument 3 of 'lwtunne=
l_build_state' makes integer from pointer without a cast [-Wint-conversion]
      err =3D lwtunnel_build_state(net, encap_type, encap,
                                                  ^~~~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'unsigned int' but argumen=
t is of type 'struct nlattr *'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:594:9: warning: passing argument 4 of 'lwtunnel=
_build_state' makes pointer from integer without a cast [-Wint-conversion]
            nhc->nhc_family, cfg, &lwtstate,
            ^~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'const void *' but argumen=
t is of type 'u8 {aka unsigned char}'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
>> net/ipv4/fib_semantics.c:594:31: error: passing argument 6 of 'lwtunnel_=
build_state' from incompatible pointer type [-Werror=3Dincompatible-pointer=
-types]
            nhc->nhc_family, cfg, &lwtstate,
                                  ^
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'struct netlink_ext_ack *'=
 but argument is of type 'struct lwtunnel_state **'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
>> net/ipv4/fib_semantics.c:593:9: error: too many arguments to function 'l=
wtunnel_build_state'
      err =3D lwtunnel_build_state(net, encap_type, encap,
            ^~~~~~~~~~~~~~~~~~~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: declared here
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c: In function 'fib_encap_match':
   net/ipv4/fib_semantics.c:831:29: warning: passing argument 1 of 'lwtunne=
l_build_state' makes integer from pointer without a cast [-Wint-conversion]
     ret =3D lwtunnel_build_state(net, encap_type, encap, AF_INET,
                                ^~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'u16 {aka short unsigned i=
nt}' but argument is of type 'struct net *'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:831:34: warning: passing argument 2 of 'lwtunne=
l_build_state' makes pointer from integer without a cast [-Wint-conversion]
     ret =3D lwtunnel_build_state(net, encap_type, encap, AF_INET,
                                     ^~~~~~~~~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'struct nlattr *' but argu=
ment is of type 'u16 {aka short unsigned int}'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:831:46: warning: passing argument 3 of 'lwtunne=
l_build_state' makes integer from pointer without a cast [-Wint-conversion]
     ret =3D lwtunnel_build_state(net, encap_type, encap, AF_INET,
                                                 ^~~~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'unsigned int' but argumen=
t is of type 'struct nlattr *'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   In file included from net/ipv4/fib_semantics.c:19:0:
   include/linux/socket.h:165:18: warning: passing argument 4 of 'lwtunnel_=
build_state' makes pointer from integer without a cast [-Wint-conversion]
    #define AF_INET  2 /* Internet IP Protocol  */
                     ^
   net/ipv4/fib_semantics.c:831:53: note: in expansion of macro 'AF_INET'
     ret =3D lwtunnel_build_state(net, encap_type, encap, AF_INET,
                                                        ^~~~~~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'const void *' but argumen=
t is of type 'int'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:832:8: error: passing argument 5 of 'lwtunnel_b=
uild_state' from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]
           cfg, &lwtstate, extack);
           ^~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'struct lwtunnel_state **'=
 but argument is of type 'const struct fib_config *'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:832:13: error: passing argument 6 of 'lwtunnel_=
build_state' from incompatible pointer type [-Werror=3Dincompatible-pointer=
-types]
           cfg, &lwtstate, extack);
                ^
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: expected 'struct netlink_ext_ack *'=
 but argument is of type 'struct lwtunnel_state **'
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:831:8: error: too many arguments to function 'l=
wtunnel_build_state'
     ret =3D lwtunnel_build_state(net, encap_type, encap, AF_INET,
           ^~~~~~~~~~~~~~~~~~~~
   In file included from net/ipv4/fib_semantics.c:44:0:
   include/net/lwtunnel.h:212:19: note: declared here
    static inline int lwtunnel_build_state(u16 encap_type,
                      ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/lwtunnel_build_state +594 net/ipv4/fib_semantics.c

   572	=

   573	int fib_nh_common_init(struct net *net, struct fib_nh_common *nhc,
   574			       struct nlattr *encap, u16 encap_type,
   575			       void *cfg, gfp_t gfp_flags,
   576			       struct netlink_ext_ack *extack)
   577	{
   578		int err;
   579	=

   580		nhc->nhc_pcpu_rth_output =3D alloc_percpu_gfp(struct rtable __rcu *,
   581							    gfp_flags);
   582		if (!nhc->nhc_pcpu_rth_output)
   583			return -ENOMEM;
   584	=

   585		if (encap) {
   586			struct lwtunnel_state *lwtstate;
   587	=

   588			if (encap_type =3D=3D LWTUNNEL_ENCAP_NONE) {
   589				NL_SET_ERR_MSG(extack, "LWT encap type not specified");
   590				err =3D -EINVAL;
   591				goto lwt_failure;
   592			}
 > 593			err =3D lwtunnel_build_state(net, encap_type, encap,
 > 594						   nhc->nhc_family, cfg, &lwtstate,
   595						   extack);
   596			if (err)
   597				goto lwt_failure;
   598	=

   599			nhc->nhc_lwtstate =3D lwtstate_get(lwtstate);
   600		}
   601	=

   602		return 0;
   603	=

   604	lwt_failure:
   605		rt_fibinfo_free_cpus(nhc->nhc_pcpu_rth_output);
   606		nhc->nhc_pcpu_rth_output =3D NULL;
   607		return err;
   608	}
   609	EXPORT_SYMBOL_GPL(fib_nh_common_init);
   610	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1246211552742406359==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1246211552742406359==--

