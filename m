Content-Type: multipart/mixed; boundary="===============7554183349060199624=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [sschmidt-wpan-next:master 4/7] net/ipv4/fib_semantics.c:594:31: error: passing argument 6 of 'lwtunnel_build_state' from incompatible pointer type
Date: Fri, 28 Feb 2020 22:48:02 +0800
Message-ID: <202002282247.ioVTILIq%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7554183349060199624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sschmidt/wpan-next.=
git master
head:   73e85701921be77cb16a4879d6af4f79462f9eb7
commit: c0037234c69e275990fbb4e8c006869b53220e84 [4/7] net: add net availab=
le in build_state
config: um-x86_64_defconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
reproduce:
        git checkout c0037234c69e275990fbb4e8c006869b53220e84
        # save the attached .config to linux build tree
        make ARCH=3Dum SUBARCH=3Dx86_64

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

--===============7554183349060199624==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7554183349060199624==--

