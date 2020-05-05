Content-Type: multipart/mixed; boundary="===============6236952848218935404=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [martineau:kbuild-force-failure 1/1] net/mptcp/protocol.c:55:13: error: invalid storage class for function '__mptcp_needs_tcp_fallback'
Date: Wed, 06 May 2020 07:56:50 +0800
Message-ID: <202005060746.4LcGjWYS%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6236952848218935404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martineau/linux.git=
 kbuild-force-failure
head:   7b9033fbfc792cc54e9d65b2a2adf6cf86734261
commit: 7b9033fbfc792cc54e9d65b2a2adf6cf86734261 [1/1] Deliberately break t=
he automated build, making sure defconfig is working as expected.
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 7b9033fbfc792cc54e9d65b2a2adf6cf86734261
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   net/mptcp/protocol.c: In function '__mptcp_nmpc_socket':
>> net/mptcp/protocol.c:55:13: error: invalid storage class for function '_=
_mptcp_needs_tcp_fallback'
      55 | static bool __mptcp_needs_tcp_fallback(const struct mptcp_sock *=
msk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:55:1: warning: ISO C90 forbids mixed declarations a=
nd code [-Wdeclaration-after-statement]
      55 | static bool __mptcp_needs_tcp_fallback(const struct mptcp_sock *=
msk)
         | ^~~~~~
>> net/mptcp/protocol.c:60:23: error: invalid storage class for function 'm=
ptcp_is_tcpsk'
      60 | static struct socket *mptcp_is_tcpsk(struct sock *sk)
         |                       ^~~~~~~~~~~~~~
>> net/mptcp/protocol.c:87:23: error: invalid storage class for function '_=
_mptcp_tcp_fallback'
      87 | static struct socket *__mptcp_tcp_fallback(struct mptcp_sock *ms=
k)
         |                       ^~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:103:13: error: invalid storage class for function '=
__mptcp_can_create_subflow'
     103 | static bool __mptcp_can_create_subflow(const struct mptcp_sock *=
msk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:108:23: error: invalid storage class for function '=
__mptcp_socket_create'
     108 | static struct socket *__mptcp_socket_create(struct mptcp_sock *m=
sk, int state)
         |                       ^~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:142:13: error: invalid storage class for function '=
__mptcp_move_skb'
     142 | static void __mptcp_move_skb(struct mptcp_sock *msk, struct sock=
 *ssk,
         |             ^~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:157:13: error: invalid storage class for function '=
mptcp_subflow_dsn_valid'
     157 | static bool mptcp_subflow_dsn_valid(const struct mptcp_sock *msk,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:177:13: error: invalid storage class for function '=
__mptcp_move_skbs_from_subflow'
     177 | static bool __mptcp_move_skbs_from_subflow(struct mptcp_sock *ms=
k,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:257:13: error: invalid storage class for function '=
move_skbs_to_msk'
     257 | static bool move_skbs_to_msk(struct mptcp_sock *msk, struct sock=
 *ssk)
         |             ^~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:305:13: error: invalid storage class for function '=
__mptcp_flush_join_list'
     305 | static void __mptcp_flush_join_list(struct mptcp_sock *msk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:315:13: error: invalid storage class for function '=
mptcp_set_timeout'
     315 | static void mptcp_set_timeout(const struct sock *sk, const struc=
t sock *ssk)
         |             ^~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:325:13: error: invalid storage class for function '=
mptcp_timer_pending'
     325 | static bool mptcp_timer_pending(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:330:13: error: invalid storage class for function '=
mptcp_reset_timer'
     330 | static void mptcp_reset_timer(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:360:13: error: invalid storage class for function '=
mptcp_stop_timer'
     360 | static void mptcp_stop_timer(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:368:13: error: invalid storage class for function '=
mptcp_ext_cache_refill'
     368 | static bool mptcp_ext_cache_refill(struct mptcp_sock *msk)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:376:21: error: invalid storage class for function '=
mptcp_subflow_recv_lookup'
     376 | static struct sock *mptcp_subflow_recv_lookup(const struct mptcp=
_sock *msk)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:391:13: error: invalid storage class for function '=
mptcp_skb_can_collapse_to'
     391 | static bool mptcp_skb_can_collapse_to(u64 write_seq,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:402:13: error: invalid storage class for function '=
mptcp_frag_can_collapse_to'
     402 | static bool mptcp_frag_can_collapse_to(const struct mptcp_sock *=
msk,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mptcp/protocol.c:410:13: error: invalid storage class for function '=
dfrag_uncharge'
     410 | static void dfrag_uncharge(struct sock *sk, int len)
         |             ^~~~~~~~~~~~~~
   net/mptcp/protocol.c:416:13: error: invalid storage class for function '=
dfrag_clear'
     416 | static void dfrag_clear(struct sock *sk, struct mptcp_data_frag =
*dfrag)
         |             ^~~~~~~~~~~
   net/mptcp/protocol.c:425:13: error: invalid storage class for function '=
mptcp_clean_una'
     425 | static void mptcp_clean_una(struct sock *sk)
         |             ^~~~~~~~~~~~~~~
   net/mptcp/protocol.c:463:13: error: invalid storage class for function '=
mptcp_page_frag_refill'
     463 | static bool mptcp_page_frag_refill(struct sock *sk, struct page_=
frag *pfrag)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:475:1: error: invalid storage class for function 'm=
ptcp_carve_data_frag'
     475 | mptcp_carve_data_frag(const struct mptcp_sock *msk, struct page_=
frag *pfrag,
         | ^~~~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:491:12: error: invalid storage class for function '=
mptcp_sendmsg_frag'
     491 | static int mptcp_sendmsg_frag(struct sock *sk, struct sock *ssk,
         |            ^~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:656:21: error: invalid storage class for function '=
mptcp_subflow_get_send'
     656 | static struct sock *mptcp_subflow_get_send(struct mptcp_sock *ms=
k)
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:693:13: error: invalid storage class for function '=
ssk_check_wmem'
     693 | static void ssk_check_wmem(struct mptcp_sock *msk, struct sock *=
ssk)
         |             ^~~~~~~~~~~~~~
   net/mptcp/protocol.c:710:12: error: invalid storage class for function '=
mptcp_sendmsg'
     710 | static int mptcp_sendmsg(struct sock *sk, struct msghdr *msg, si=
ze_t len)
         |            ^~~~~~~~~~~~~
   net/mptcp/protocol.c:800:13: error: invalid storage class for function '=
mptcp_wait_data'
     800 | static void mptcp_wait_data(struct sock *sk, long *timeo)
         |             ^~~~~~~~~~~~~~~
   net/mptcp/protocol.c:815:12: error: invalid storage class for function '=
__mptcp_recvmsg_mskq'
     815 | static int __mptcp_recvmsg_mskq(struct mptcp_sock *msk,
         |            ^~~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:853:13: error: invalid storage class for function '=
__mptcp_move_skbs'
     853 | static bool __mptcp_move_skbs(struct mptcp_sock *msk)
         |             ^~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:872:12: error: invalid storage class for function '=
mptcp_recvmsg'
     872 | static int mptcp_recvmsg(struct sock *sk, struct msghdr *msg, si=
ze_t len,
         |            ^~~~~~~~~~~~~
   net/mptcp/protocol.c:979:13: error: invalid storage class for function '=
mptcp_retransmit_handler'
     979 | static void mptcp_retransmit_handler(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:992:13: error: invalid storage class for function '=
mptcp_retransmit_timer'
     992 | static void mptcp_retransmit_timer(struct timer_list *t)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1016:21: error: invalid storage class for function =
'mptcp_subflow_get_retrans'
    1016 | static struct sock *mptcp_subflow_get_retrans(const struct mptcp=
_sock *msk)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1050:13: error: invalid storage class for function =
'__mptcp_close_ssk'
    1050 | static void __mptcp_close_ssk(struct sock *sk, struct sock *ssk,
         |             ^~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1067:21: error: invalid storage class for function =
'mptcp_sync_mss'
    1067 | static unsigned int mptcp_sync_mss(struct sock *sk, u32 pmtu)
         |                     ^~~~~~~~~~~~~~
   net/mptcp/protocol.c:1072:13: error: invalid storage class for function =
'mptcp_check_for_eof'
    1072 | static void mptcp_check_for_eof(struct mptcp_sock *msk)
         |             ^~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1093:13: error: invalid storage class for function =
'mptcp_worker'
    1093 | static void mptcp_worker(struct work_struct *work)
         |             ^~~~~~~~~~~~
   net/mptcp/protocol.c:1160:12: error: invalid storage class for function =
'__mptcp_init_sock'
    1160 | static int __mptcp_init_sock(struct sock *sk)
         |            ^~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1183:12: error: invalid storage class for function =
'mptcp_init_sock'
    1183 | static int mptcp_init_sock(struct sock *sk)
         |            ^~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1204:13: error: invalid storage class for function =
'__mptcp_clear_xmit'
    1204 | static void __mptcp_clear_xmit(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1215:13: error: invalid storage class for function =
'mptcp_cancel_work'
    1215 | static void mptcp_cancel_work(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1223:13: error: invalid storage class for function =
'mptcp_subflow_shutdown'
    1223 | static void mptcp_subflow_shutdown(struct sock *ssk, int how,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1256:13: error: invalid storage class for function =
'mptcp_close'
    1256 | static void mptcp_close(struct sock *sk, long timeout)
         |             ^~~~~~~~~~~
   net/mptcp/protocol.c:1294:13: error: invalid storage class for function =
'mptcp_copy_inaddrs'
    1294 | static void mptcp_copy_inaddrs(struct sock *msk, const struct so=
ck *ssk)
         |             ^~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1317:12: error: invalid storage class for function =
'mptcp_disconnect'
    1317 | static int mptcp_disconnect(struct sock *sk, int flags)
         |            ^~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1327:27: error: invalid storage class for function =
'mptcp_inet6_sk'
    1327 | static struct ipv6_pinfo *mptcp_inet6_sk(const struct sock *sk)
         |                           ^~~~~~~~~~~~~~
   net/mptcp/protocol.c:1393:21: error: invalid storage class for function =
'mptcp_accept'
    1393 | static struct sock *mptcp_accept(struct sock *sk, int flags, int=
 *err,
         |                     ^~~~~~~~~~~~
   net/mptcp/protocol.c:1454:13: error: invalid storage class for function =
'mptcp_destroy'
    1454 | static void mptcp_destroy(struct sock *sk)
         |             ^~~~~~~~~~~~~
   net/mptcp/protocol.c:1464:12: error: invalid storage class for function =
'mptcp_setsockopt'
    1464 | static int mptcp_setsockopt(struct sock *sk, int level, int optn=
ame,
         |            ^~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1488:12: error: invalid storage class for function =
'mptcp_getsockopt'
    1488 | static int mptcp_getsockopt(struct sock *sk, int level, int optn=
ame,
         |            ^~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1518:13: error: invalid storage class for function =
'mptcp_release_cb'
    1518 | static void mptcp_release_cb(struct sock *sk)

vim +/__mptcp_needs_tcp_fallback +55 net/mptcp/protocol.c

d027236c41fd02 Paolo Abeni      2020-03-27   42  =

2303f994b3e187 Peter Krystad    2020-01-21   43  /* If msk has an initial s=
ubflow socket, and the MP_CAPABLE handshake has not
2303f994b3e187 Peter Krystad    2020-01-21   44   * completed yet or has fa=
iled, return the subflow socket.
2303f994b3e187 Peter Krystad    2020-01-21   45   * Otherwise return NULL.
2303f994b3e187 Peter Krystad    2020-01-21   46   */
2303f994b3e187 Peter Krystad    2020-01-21   47  static struct socket *__mp=
tcp_nmpc_socket(const struct mptcp_sock *msk)
2303f994b3e187 Peter Krystad    2020-01-21   48  {
d22f4988ffecbe Christoph Paasch 2020-01-21   49  	if (!msk->subflow || READ=
_ONCE(msk->can_ack))
2303f994b3e187 Peter Krystad    2020-01-21   50  		return NULL;
2303f994b3e187 Peter Krystad    2020-01-21   51  =

2303f994b3e187 Peter Krystad    2020-01-21   52  	return msk->subflow;
7b9033fbfc792c Mat Martineau    2020-05-05   53  =

2303f994b3e187 Peter Krystad    2020-01-21   54  =

8ab183deb26a3b Paolo Abeni      2020-01-21  @55  static bool __mptcp_needs_=
tcp_fallback(const struct mptcp_sock *msk)
8ab183deb26a3b Paolo Abeni      2020-01-21   56  {
8ab183deb26a3b Paolo Abeni      2020-01-21   57  	return msk->first && !sk_=
is_mptcp(msk->first);
8ab183deb26a3b Paolo Abeni      2020-01-21   58  }
8ab183deb26a3b Paolo Abeni      2020-01-21   59  =

0b4f33def7bbde Florian Westphal 2020-04-02  @60  static struct socket *mptc=
p_is_tcpsk(struct sock *sk)
0b4f33def7bbde Florian Westphal 2020-04-02   61  {
0b4f33def7bbde Florian Westphal 2020-04-02   62  	struct socket *sock =3D s=
k->sk_socket;
0b4f33def7bbde Florian Westphal 2020-04-02   63  =

0b4f33def7bbde Florian Westphal 2020-04-02   64  	if (sock->sk !=3D sk)
0b4f33def7bbde Florian Westphal 2020-04-02   65  		return NULL;
0b4f33def7bbde Florian Westphal 2020-04-02   66  =

0b4f33def7bbde Florian Westphal 2020-04-02   67  	if (unlikely(sk->sk_prot =
=3D=3D &tcp_prot)) {
0b4f33def7bbde Florian Westphal 2020-04-02   68  		/* we are being invoked =
after mptcp_accept() has
0b4f33def7bbde Florian Westphal 2020-04-02   69  		 * accepted a non-mp-cap=
able flow: sk is a tcp_sk,
0b4f33def7bbde Florian Westphal 2020-04-02   70  		 * not an mptcp one.
0b4f33def7bbde Florian Westphal 2020-04-02   71  		 *
0b4f33def7bbde Florian Westphal 2020-04-02   72  		 * Hand the socket over =
to tcp so all further socket ops
0b4f33def7bbde Florian Westphal 2020-04-02   73  		 * bypass mptcp.
0b4f33def7bbde Florian Westphal 2020-04-02   74  		 */
0b4f33def7bbde Florian Westphal 2020-04-02   75  		sock->ops =3D &inet_stre=
am_ops;
0b4f33def7bbde Florian Westphal 2020-04-02   76  		return sock;
0b4f33def7bbde Florian Westphal 2020-04-02   77  #if IS_ENABLED(CONFIG_MPTC=
P_IPV6)
0b4f33def7bbde Florian Westphal 2020-04-02   78  	} else if (unlikely(sk->s=
k_prot =3D=3D &tcpv6_prot)) {
0b4f33def7bbde Florian Westphal 2020-04-02   79  		sock->ops =3D &inet6_str=
eam_ops;
0b4f33def7bbde Florian Westphal 2020-04-02   80  		return sock;
0b4f33def7bbde Florian Westphal 2020-04-02   81  #endif
0b4f33def7bbde Florian Westphal 2020-04-02   82  	}
0b4f33def7bbde Florian Westphal 2020-04-02   83  =

0b4f33def7bbde Florian Westphal 2020-04-02   84  	return NULL;
0b4f33def7bbde Florian Westphal 2020-04-02   85  }
0b4f33def7bbde Florian Westphal 2020-04-02   86  =

8ab183deb26a3b Paolo Abeni      2020-01-21  @87  static struct socket *__mp=
tcp_tcp_fallback(struct mptcp_sock *msk)
cec37a6e41aae7 Peter Krystad    2020-01-21   88  {
0b4f33def7bbde Florian Westphal 2020-04-02   89  	struct socket *sock;
0b4f33def7bbde Florian Westphal 2020-04-02   90  =

cec37a6e41aae7 Peter Krystad    2020-01-21   91  	sock_owned_by_me((const s=
truct sock *)msk);
cec37a6e41aae7 Peter Krystad    2020-01-21   92  =

0b4f33def7bbde Florian Westphal 2020-04-02   93  	sock =3D mptcp_is_tcpsk((=
struct sock *)msk);
0b4f33def7bbde Florian Westphal 2020-04-02   94  	if (unlikely(sock))
0b4f33def7bbde Florian Westphal 2020-04-02   95  		return sock;
0b4f33def7bbde Florian Westphal 2020-04-02   96  =

8ab183deb26a3b Paolo Abeni      2020-01-21   97  	if (likely(!__mptcp_needs=
_tcp_fallback(msk)))
cec37a6e41aae7 Peter Krystad    2020-01-21   98  		return NULL;
cec37a6e41aae7 Peter Krystad    2020-01-21   99  =

2c22c06ce426a0 Florian Westphal 2020-02-04  100  	return msk->subflow;
8ab183deb26a3b Paolo Abeni      2020-01-21  101  }
8ab183deb26a3b Paolo Abeni      2020-01-21  102  =

2303f994b3e187 Peter Krystad    2020-01-21 @103  static bool __mptcp_can_cr=
eate_subflow(const struct mptcp_sock *msk)
2303f994b3e187 Peter Krystad    2020-01-21  104  {
8ab183deb26a3b Paolo Abeni      2020-01-21  105  	return !msk->first;
2303f994b3e187 Peter Krystad    2020-01-21  106  }
2303f994b3e187 Peter Krystad    2020-01-21  107  =

2303f994b3e187 Peter Krystad    2020-01-21 @108  static struct socket *__mp=
tcp_socket_create(struct mptcp_sock *msk, int state)
2303f994b3e187 Peter Krystad    2020-01-21  109  {
2303f994b3e187 Peter Krystad    2020-01-21  110  	struct mptcp_subflow_cont=
ext *subflow;
2303f994b3e187 Peter Krystad    2020-01-21  111  	struct sock *sk =3D (stru=
ct sock *)msk;
2303f994b3e187 Peter Krystad    2020-01-21  112  	struct socket *ssock;
2303f994b3e187 Peter Krystad    2020-01-21  113  	int err;
2303f994b3e187 Peter Krystad    2020-01-21  114  =

0b4f33def7bbde Florian Westphal 2020-04-02  115  	ssock =3D __mptcp_tcp_fal=
lback(msk);
0b4f33def7bbde Florian Westphal 2020-04-02  116  	if (unlikely(ssock))
0b4f33def7bbde Florian Westphal 2020-04-02  117  		return ssock;
0b4f33def7bbde Florian Westphal 2020-04-02  118  =

2303f994b3e187 Peter Krystad    2020-01-21  119  	ssock =3D __mptcp_nmpc_so=
cket(msk);
2303f994b3e187 Peter Krystad    2020-01-21  120  	if (ssock)
2303f994b3e187 Peter Krystad    2020-01-21  121  		goto set_state;
2303f994b3e187 Peter Krystad    2020-01-21  122  =

2303f994b3e187 Peter Krystad    2020-01-21  123  	if (!__mptcp_can_create_s=
ubflow(msk))
2303f994b3e187 Peter Krystad    2020-01-21  124  		return ERR_PTR(-EINVAL);
2303f994b3e187 Peter Krystad    2020-01-21  125  =

2303f994b3e187 Peter Krystad    2020-01-21  126  	err =3D mptcp_subflow_cre=
ate_socket(sk, &ssock);
2303f994b3e187 Peter Krystad    2020-01-21  127  	if (err)
2303f994b3e187 Peter Krystad    2020-01-21  128  		return ERR_PTR(err);
2303f994b3e187 Peter Krystad    2020-01-21  129  =

8ab183deb26a3b Paolo Abeni      2020-01-21  130  	msk->first =3D ssock->sk;
2303f994b3e187 Peter Krystad    2020-01-21  131  	msk->subflow =3D ssock;
2303f994b3e187 Peter Krystad    2020-01-21  132  	subflow =3D mptcp_subflow=
_ctx(ssock->sk);
cec37a6e41aae7 Peter Krystad    2020-01-21  133  	list_add(&subflow->node, =
&msk->conn_list);
2303f994b3e187 Peter Krystad    2020-01-21  134  	subflow->request_mptcp =
=3D 1;
2303f994b3e187 Peter Krystad    2020-01-21  135  =

2303f994b3e187 Peter Krystad    2020-01-21  136  set_state:
2303f994b3e187 Peter Krystad    2020-01-21  137  	if (state !=3D MPTCP_SAME=
_STATE)
2303f994b3e187 Peter Krystad    2020-01-21  138  		inet_sk_state_store(sk, =
state);
2303f994b3e187 Peter Krystad    2020-01-21  139  	return ssock;
2303f994b3e187 Peter Krystad    2020-01-21  140  }
2303f994b3e187 Peter Krystad    2020-01-21  141  =

6771bfd9ee2460 Florian Westphal 2020-02-26 @142  static void __mptcp_move_s=
kb(struct mptcp_sock *msk, struct sock *ssk,
6771bfd9ee2460 Florian Westphal 2020-02-26  143  			     struct sk_buff *sk=
b,
6771bfd9ee2460 Florian Westphal 2020-02-26  144  			     unsigned int offse=
t, size_t copy_len)
6771bfd9ee2460 Florian Westphal 2020-02-26  145  {
6771bfd9ee2460 Florian Westphal 2020-02-26  146  	struct sock *sk =3D (stru=
ct sock *)msk;
6771bfd9ee2460 Florian Westphal 2020-02-26  147  =

6771bfd9ee2460 Florian Westphal 2020-02-26  148  	__skb_unlink(skb, &ssk->s=
k_receive_queue);
600911ff5f72ba Florian Westphal 2020-02-26  149  	skb_set_owner_r(skb, sk);
6771bfd9ee2460 Florian Westphal 2020-02-26  150  	__skb_queue_tail(&sk->sk_=
receive_queue, skb);
6771bfd9ee2460 Florian Westphal 2020-02-26  151  =

6771bfd9ee2460 Florian Westphal 2020-02-26  152  	msk->ack_seq +=3D copy_le=
n;
6771bfd9ee2460 Florian Westphal 2020-02-26  153  	MPTCP_SKB_CB(skb)->offset=
 =3D offset;
6771bfd9ee2460 Florian Westphal 2020-02-26  154  }
6771bfd9ee2460 Florian Westphal 2020-02-26  155  =

de06f57392b60e Florian Westphal 2020-04-02  156  /* both sockets must be lo=
cked */
de06f57392b60e Florian Westphal 2020-04-02 @157  static bool mptcp_subflow_=
dsn_valid(const struct mptcp_sock *msk,
de06f57392b60e Florian Westphal 2020-04-02  158  				    struct sock *ssk)
de06f57392b60e Florian Westphal 2020-04-02  159  {
de06f57392b60e Florian Westphal 2020-04-02  160  	struct mptcp_subflow_cont=
ext *subflow =3D mptcp_subflow_ctx(ssk);
de06f57392b60e Florian Westphal 2020-04-02  161  	u64 dsn =3D mptcp_subflow=
_get_mapped_dsn(subflow);
de06f57392b60e Florian Westphal 2020-04-02  162  =

de06f57392b60e Florian Westphal 2020-04-02  163  	/* revalidate data sequen=
ce number.
de06f57392b60e Florian Westphal 2020-04-02  164  	 *
de06f57392b60e Florian Westphal 2020-04-02  165  	 * mptcp_subflow_data_ava=
ilable() is usually called
de06f57392b60e Florian Westphal 2020-04-02  166  	 * without msk lock.  Its=
 unlikely (but possible)
de06f57392b60e Florian Westphal 2020-04-02  167  	 * that msk->ack_seq has =
been advanced since the last
de06f57392b60e Florian Westphal 2020-04-02  168  	 * call found in-sequence=
 data.
de06f57392b60e Florian Westphal 2020-04-02  169  	 */
de06f57392b60e Florian Westphal 2020-04-02  170  	if (likely(dsn =3D=3D msk=
->ack_seq))
de06f57392b60e Florian Westphal 2020-04-02  171  		return true;
de06f57392b60e Florian Westphal 2020-04-02  172  =

de06f57392b60e Florian Westphal 2020-04-02  173  	subflow->data_avail =3D 0;
de06f57392b60e Florian Westphal 2020-04-02  174  	return mptcp_subflow_data=
_available(ssk);
de06f57392b60e Florian Westphal 2020-04-02  175  }
de06f57392b60e Florian Westphal 2020-04-02  176  =

6771bfd9ee2460 Florian Westphal 2020-02-26 @177  static bool __mptcp_move_s=
kbs_from_subflow(struct mptcp_sock *msk,
6771bfd9ee2460 Florian Westphal 2020-02-26  178  					   struct sock *ssk,
6771bfd9ee2460 Florian Westphal 2020-02-26  179  					   unsigned int *byte=
s)
6771bfd9ee2460 Florian Westphal 2020-02-26  180  {
6771bfd9ee2460 Florian Westphal 2020-02-26  181  	struct mptcp_subflow_cont=
ext *subflow =3D mptcp_subflow_ctx(ssk);
600911ff5f72ba Florian Westphal 2020-02-26  182  	struct sock *sk =3D (stru=
ct sock *)msk;
6771bfd9ee2460 Florian Westphal 2020-02-26  183  	unsigned int moved =3D 0;
6771bfd9ee2460 Florian Westphal 2020-02-26  184  	bool more_data_avail;
6771bfd9ee2460 Florian Westphal 2020-02-26  185  	struct tcp_sock *tp;
6771bfd9ee2460 Florian Westphal 2020-02-26  186  	bool done =3D false;
600911ff5f72ba Florian Westphal 2020-02-26  187  =

de06f57392b60e Florian Westphal 2020-04-02  188  	if (!mptcp_subflow_dsn_va=
lid(msk, ssk)) {
de06f57392b60e Florian Westphal 2020-04-02  189  		*bytes =3D 0;
de06f57392b60e Florian Westphal 2020-04-02  190  		return false;
de06f57392b60e Florian Westphal 2020-04-02  191  	}
de06f57392b60e Florian Westphal 2020-04-02  192  =

ec33916d47cbac Florian Westphal 2020-03-06  193  	if (!(sk->sk_userlocks & =
SOCK_RCVBUF_LOCK)) {
ec33916d47cbac Florian Westphal 2020-03-06  194  		int rcvbuf =3D max(ssk->=
sk_rcvbuf, sk->sk_rcvbuf);
ec33916d47cbac Florian Westphal 2020-03-06  195  =

600911ff5f72ba Florian Westphal 2020-02-26  196  		if (rcvbuf > sk->sk_rcvb=
uf)
600911ff5f72ba Florian Westphal 2020-02-26  197  			sk->sk_rcvbuf =3D rcvbu=
f;
ec33916d47cbac Florian Westphal 2020-03-06  198  	}
6771bfd9ee2460 Florian Westphal 2020-02-26  199  =

6771bfd9ee2460 Florian Westphal 2020-02-26  200  	tp =3D tcp_sk(ssk);
6771bfd9ee2460 Florian Westphal 2020-02-26  201  	do {
6771bfd9ee2460 Florian Westphal 2020-02-26  202  		u32 map_remaining, offse=
t;
6771bfd9ee2460 Florian Westphal 2020-02-26  203  		u32 seq =3D tp->copied_s=
eq;
6771bfd9ee2460 Florian Westphal 2020-02-26  204  		struct sk_buff *skb;
6771bfd9ee2460 Florian Westphal 2020-02-26  205  		bool fin;
6771bfd9ee2460 Florian Westphal 2020-02-26  206  =

6771bfd9ee2460 Florian Westphal 2020-02-26  207  		/* try to move as much d=
ata as available */
6771bfd9ee2460 Florian Westphal 2020-02-26  208  		map_remaining =3D subflo=
w->map_data_len -
6771bfd9ee2460 Florian Westphal 2020-02-26  209  				mptcp_subflow_get_map_=
offset(subflow);
6771bfd9ee2460 Florian Westphal 2020-02-26  210  =

6771bfd9ee2460 Florian Westphal 2020-02-26  211  		skb =3D skb_peek(&ssk->s=
k_receive_queue);
6771bfd9ee2460 Florian Westphal 2020-02-26  212  		if (!skb)
6771bfd9ee2460 Florian Westphal 2020-02-26  213  			break;
6771bfd9ee2460 Florian Westphal 2020-02-26  214  =

6771bfd9ee2460 Florian Westphal 2020-02-26  215  		offset =3D seq - TCP_SKB=
_CB(skb)->seq;
6771bfd9ee2460 Florian Westphal 2020-02-26  216  		fin =3D TCP_SKB_CB(skb)-=
>tcp_flags & TCPHDR_FIN;
6771bfd9ee2460 Florian Westphal 2020-02-26  217  		if (fin) {
6771bfd9ee2460 Florian Westphal 2020-02-26  218  			done =3D true;
6771bfd9ee2460 Florian Westphal 2020-02-26  219  			seq++;
6771bfd9ee2460 Florian Westphal 2020-02-26  220  		}
6771bfd9ee2460 Florian Westphal 2020-02-26  221  =

6771bfd9ee2460 Florian Westphal 2020-02-26  222  		if (offset < skb->len) {
6771bfd9ee2460 Florian Westphal 2020-02-26  223  			size_t len =3D skb->len=
 - offset;
6771bfd9ee2460 Florian Westphal 2020-02-26  224  =

6771bfd9ee2460 Florian Westphal 2020-02-26  225  			if (tp->urg_data)
6771bfd9ee2460 Florian Westphal 2020-02-26  226  				done =3D true;
6771bfd9ee2460 Florian Westphal 2020-02-26  227  =

6771bfd9ee2460 Florian Westphal 2020-02-26  228  			__mptcp_move_skb(msk, s=
sk, skb, offset, len);
6771bfd9ee2460 Florian Westphal 2020-02-26  229  			seq +=3D len;
6771bfd9ee2460 Florian Westphal 2020-02-26  230  			moved +=3D len;
6771bfd9ee2460 Florian Westphal 2020-02-26  231  =

6771bfd9ee2460 Florian Westphal 2020-02-26  232  			if (WARN_ON_ONCE(map_re=
maining < len))
6771bfd9ee2460 Florian Westphal 2020-02-26  233  				break;
6771bfd9ee2460 Florian Westphal 2020-02-26  234  		} else {
6771bfd9ee2460 Florian Westphal 2020-02-26  235  			WARN_ON_ONCE(!fin);
6771bfd9ee2460 Florian Westphal 2020-02-26  236  			sk_eat_skb(ssk, skb);
6771bfd9ee2460 Florian Westphal 2020-02-26  237  			done =3D true;
6771bfd9ee2460 Florian Westphal 2020-02-26  238  		}
6771bfd9ee2460 Florian Westphal 2020-02-26  239  =

6771bfd9ee2460 Florian Westphal 2020-02-26  240  		WRITE_ONCE(tp->copied_se=
q, seq);
6771bfd9ee2460 Florian Westphal 2020-02-26  241  		more_data_avail =3D mptc=
p_subflow_data_available(ssk);
600911ff5f72ba Florian Westphal 2020-02-26  242  =

600911ff5f72ba Florian Westphal 2020-02-26  243  		if (atomic_read(&sk->sk_=
rmem_alloc) > READ_ONCE(sk->sk_rcvbuf)) {
600911ff5f72ba Florian Westphal 2020-02-26  244  			done =3D true;
600911ff5f72ba Florian Westphal 2020-02-26  245  			break;
600911ff5f72ba Florian Westphal 2020-02-26  246  		}
6771bfd9ee2460 Florian Westphal 2020-02-26  247  	} while (more_data_avail);
6771bfd9ee2460 Florian Westphal 2020-02-26  248  =

6771bfd9ee2460 Florian Westphal 2020-02-26  249  	*bytes =3D moved;
6771bfd9ee2460 Florian Westphal 2020-02-26  250  =

6771bfd9ee2460 Florian Westphal 2020-02-26  251  	return done;
6771bfd9ee2460 Florian Westphal 2020-02-26  252  }
6771bfd9ee2460 Florian Westphal 2020-02-26  253  =


:::::: The code at line 55 was first introduced by commit
:::::: 8ab183deb26a3b79f8021afa9e83cc1bbd812031 mptcp: cope with later TCP =
fallback

:::::: TO: Paolo Abeni <pabeni@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6236952848218935404==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
+B3Le+f/AWh3QaN4kAAA
--===============6236952848218935404==--

