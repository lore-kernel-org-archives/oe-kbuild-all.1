Content-Type: multipart/mixed; boundary="===============4568765396681698360=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 12558/12912] net/ipv4/tcp_ipv4.c:576 tcp_v4_err() error: uninitialized symbol 'skb'.
Date: Wed, 27 May 2020 07:36:17 -0700
Message-ID: <CANn89iJB1Rm817dLhucGRunr54aMpzs_r+2cJvoaaGR-rREeVg@mail.gmail.com>
In-Reply-To: <20200527140835.GD30374@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4568765396681698360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 7:08 AM Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8
> commit: 45af29ca761c275e350cca659856bc56f1035ef9 [12558/12912] tcp: allow=
 traceroute -Mtcp for unpriv users
>
> config: i386-randconfig-m021-20200526 (attached as .config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Well, this has been fixed yesterday already, I won't be able to add
these tags :)

Thanks.


> smatch warnings:
> net/ipv4/tcp_ipv4.c:576 tcp_v4_err() error: uninitialized symbol 'skb'.
>
> # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3D45af29ca761c275e350cca659856bc56f1035ef9
> git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git=
/next/linux-next.git
> git remote update linux-next
> git checkout 45af29ca761c275e350cca659856bc56f1035ef9
> vim +/skb +576 net/ipv4/tcp_ipv4.c
>
> 32bbd8793f24b0 Stefano Brivio    2018-11-08  422  int tcp_v4_err(struct s=
k_buff *icmp_skb, u32 info)
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  423  {
> b71d1d426d263b Eric Dumazet      2011-04-22  424        const struct iphd=
r *iph =3D (const struct iphdr *)icmp_skb->data;
> 4d1a2d9ec1c17d Damian Lukowski   2009-08-26  425        struct tcphdr *th=
 =3D (struct tcphdr *)(icmp_skb->data + (iph->ihl << 2));
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  426        struct inet_conne=
ction_sock *icsk;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  427        struct tcp_sock *=
tp;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  428        struct inet_sock =
*inet;
> 4d1a2d9ec1c17d Damian Lukowski   2009-08-26  429        const int type =
=3D icmp_hdr(icmp_skb)->type;
> 4d1a2d9ec1c17d Damian Lukowski   2009-08-26  430        const int code =
=3D icmp_hdr(icmp_skb)->code;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  431        struct sock *sk;
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  432        struct sk_buff *s=
kb;
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  433        struct request_so=
ck *fastopen;
> 9a568de4818dea Eric Dumazet      2017-05-16  434        u32 seq, snd_una;
> 9a568de4818dea Eric Dumazet      2017-05-16  435        s32 remaining;
> 9a568de4818dea Eric Dumazet      2017-05-16  436        u32 delta_us;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  437        int err;
> 4d1a2d9ec1c17d Damian Lukowski   2009-08-26  438        struct net *net =
=3D dev_net(icmp_skb->dev);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  439
> 26e3736090e103 Eric Dumazet      2015-03-22  440        sk =3D __inet_loo=
kup_established(net, &tcp_hashinfo, iph->daddr,
> 26e3736090e103 Eric Dumazet      2015-03-22  441                         =
              th->dest, iph->saddr, ntohs(th->source),
> 3fa6f616a7a4d0 David Ahern       2017-08-07  442                         =
              inet_iif(icmp_skb), 0);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  443        if (!sk) {
> 5d3848bc33b7d1 Eric Dumazet      2016-04-27  444                __ICMP_IN=
C_STATS(net, ICMP_MIB_INERRORS);
> 32bbd8793f24b0 Stefano Brivio    2018-11-08  445                return -E=
NOENT;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  446        }
>
> I guess can "sk->sk_state" start as TCP_SYN_SENT/RECV?  Smatch doesn't
> know.
>
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  447        if (sk->sk_state =
=3D=3D TCP_TIME_WAIT) {
> 9469c7b4aa210c YOSHIFUJI Hideaki 2006-10-10  448                inet_twsk=
_put(inet_twsk(sk));
> 32bbd8793f24b0 Stefano Brivio    2018-11-08  449                return 0;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  450        }
> 26e3736090e103 Eric Dumazet      2015-03-22  451        seq =3D ntohl(th-=
>seq);
> 32bbd8793f24b0 Stefano Brivio    2018-11-08  452        if (sk->sk_state =
=3D=3D TCP_NEW_SYN_RECV) {
> 32bbd8793f24b0 Stefano Brivio    2018-11-08  453                tcp_req_e=
rr(sk, seq, type =3D=3D ICMP_PARAMETERPROB ||
> 9cf7490360bf2c Eric Dumazet      2016-02-02  454                         =
            type =3D=3D ICMP_TIME_EXCEEDED ||
> 9cf7490360bf2c Eric Dumazet      2016-02-02  455                         =
            (type =3D=3D ICMP_DEST_UNREACH &&
> 9cf7490360bf2c Eric Dumazet      2016-02-02  456                         =
             (code =3D=3D ICMP_NET_UNREACH ||
> 9cf7490360bf2c Eric Dumazet      2016-02-02  457                         =
              code =3D=3D ICMP_HOST_UNREACH)));
> 32bbd8793f24b0 Stefano Brivio    2018-11-08  458                return 0;
> 32bbd8793f24b0 Stefano Brivio    2018-11-08  459        }
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  460
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  461        bh_lock_sock(sk);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  462        /* If too many IC=
MPs get dropped on busy
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  463         * servers this n=
eeds to be solved differently.
> 563d34d0578626 Eric Dumazet      2012-07-23  464         * We do take car=
e of PMTU discovery (RFC1191) special case :
> 563d34d0578626 Eric Dumazet      2012-07-23  465         * we can receive=
 locally generated ICMP messages while socket is held.
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  466         */
> b74aa930ef49a3 Eric Dumazet      2013-01-19  467        if (sock_owned_by=
_user(sk)) {
> b74aa930ef49a3 Eric Dumazet      2013-01-19  468                if (!(typ=
e =3D=3D ICMP_DEST_UNREACH && code =3D=3D ICMP_FRAG_NEEDED))
> 02a1d6e7a6bb02 Eric Dumazet      2016-04-27  469                        _=
_NET_INC_STATS(net, LINUX_MIB_LOCKDROPPEDICMPS);
> b74aa930ef49a3 Eric Dumazet      2013-01-19  470        }
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  471        if (sk->sk_state =
=3D=3D TCP_CLOSE)
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  472                goto out;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  473
> 97e3ecd112ba45 stephen hemminger 2010-03-18  474        if (unlikely(iph-=
>ttl < inet_sk(sk)->min_ttl)) {
> 02a1d6e7a6bb02 Eric Dumazet      2016-04-27  475                __NET_INC=
_STATS(net, LINUX_MIB_TCPMINTTLDROP);
> 97e3ecd112ba45 stephen hemminger 2010-03-18  476                goto out;
> 97e3ecd112ba45 stephen hemminger 2010-03-18  477        }
> 97e3ecd112ba45 stephen hemminger 2010-03-18  478
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  479        icsk =3D inet_csk=
(sk);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  480        tp =3D tcp_sk(sk);
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  481        /* XXX (TFO) - tp=
->snd_una should be ISN (tcp_create_openreq_child() */
> d983ea6f16b835 Eric Dumazet      2019-10-10  482        fastopen =3D rcu_=
dereference(tp->fastopen_rsk);
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  483        snd_una =3D fasto=
pen ? tcp_rsk(fastopen)->snt_isn : tp->snd_una;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  484        if (sk->sk_state =
!=3D TCP_LISTEN &&
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  485            !between(seq,=
 snd_una, tp->snd_nxt)) {
> 02a1d6e7a6bb02 Eric Dumazet      2016-04-27  486                __NET_INC=
_STATS(net, LINUX_MIB_OUTOFWINDOWICMPS);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  487                goto out;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  488        }
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  489
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  490        switch (type) {
> 55be7a9c6074f7 David S. Miller   2012-07-11  491        case ICMP_REDIREC=
T:
> 45caeaa5ac0b4b Jon Maxwell       2017-03-10  492                if (!sock=
_owned_by_user(sk))
> 55be7a9c6074f7 David S. Miller   2012-07-11  493                        d=
o_redirect(icmp_skb, sk);
> 55be7a9c6074f7 David S. Miller   2012-07-11  494                goto out;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  495        case ICMP_SOURCE_=
QUENCH:
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  496                /* Just s=
ilently ignore these. */
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  497                goto out;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  498        case ICMP_PARAMET=
ERPROB:
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  499                err =3D E=
PROTO;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  500                break;
>
> Then we hit a break statement
>
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  501        case ICMP_DEST_UN=
REACH:
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  502                if (code =
> NR_ICMP_UNREACH)
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  503                        g=
oto out;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  504
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  505                if (code =
=3D=3D ICMP_FRAG_NEEDED) { /* PMTU discovery (RFC1191) */
> 0d4f0608619de5 Eric Dumazet      2013-03-18  506                        /=
* We are not interested in TCP_LISTEN and open_requests
> 0d4f0608619de5 Eric Dumazet      2013-03-18  507                         =
* (SYN-ACKs send out by Linux are always <576bytes so
> 0d4f0608619de5 Eric Dumazet      2013-03-18  508                         =
* they should go through unfragmented).
> 0d4f0608619de5 Eric Dumazet      2013-03-18  509                         =
*/
> 0d4f0608619de5 Eric Dumazet      2013-03-18  510                        i=
f (sk->sk_state =3D=3D TCP_LISTEN)
> 0d4f0608619de5 Eric Dumazet      2013-03-18  511                         =
       goto out;
> 0d4f0608619de5 Eric Dumazet      2013-03-18  512
> 563d34d0578626 Eric Dumazet      2012-07-23  513                        t=
p->mtu_info =3D info;
> 144d56e9104418 Eric Dumazet      2012-08-20  514                        i=
f (!sock_owned_by_user(sk)) {
> 563d34d0578626 Eric Dumazet      2012-07-23  515                         =
       tcp_v4_mtu_reduced(sk);
> 144d56e9104418 Eric Dumazet      2012-08-20  516                        }=
 else {
> 7aa5470c2c0926 Eric Dumazet      2016-12-03  517                         =
       if (!test_and_set_bit(TCP_MTU_REDUCED_DEFERRED, &sk->sk_tsq_flags))
> 144d56e9104418 Eric Dumazet      2012-08-20  518                         =
               sock_hold(sk);
> 144d56e9104418 Eric Dumazet      2012-08-20  519                        }
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  520                        g=
oto out;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  521                }
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  522
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  523                err =3D i=
cmp_err_convert[code].errno;
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  524                /* check =
if icmp_skb allows revert of backoff
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  525                 * (see d=
raft-zimmermann-tcp-lcd) */
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  526                if (code =
!=3D ICMP_NET_UNREACH && code !=3D ICMP_HOST_UNREACH)
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  527                        b=
reak;
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  528                if (seq !=
=3D tp->snd_una  || !icsk->icsk_retransmits ||
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  529                    !icsk=
->icsk_backoff || fastopen)
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  530                        b=
reak;
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  531
> 8f49c2703b3351 David S. Miller   2010-11-12  532                if (sock_=
owned_by_user(sk))
> 8f49c2703b3351 David S. Miller   2010-11-12  533                        b=
reak;
> 8f49c2703b3351 David S. Miller   2010-11-12  534
> 2c4cc9712364c0 Eric Dumazet      2019-02-15  535                skb =3D t=
cp_rtx_queue_head(sk);
> 2c4cc9712364c0 Eric Dumazet      2019-02-15  536                if (WARN_=
ON_ONCE(!skb))
> 2c4cc9712364c0 Eric Dumazet      2019-02-15  537                        b=
reak;
> 2c4cc9712364c0 Eric Dumazet      2019-02-15  538
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  539                icsk->ics=
k_backoff--;
> fcdd1cf4dd63ae Eric Dumazet      2014-09-22  540                icsk->ics=
k_rto =3D tp->srtt_us ? __tcp_set_rto(tp) :
> fcdd1cf4dd63ae Eric Dumazet      2014-09-22  541                         =
                      TCP_TIMEOUT_INIT;
> fcdd1cf4dd63ae Eric Dumazet      2014-09-22  542                icsk->ics=
k_rto =3D inet_csk_rto_backoff(icsk, TCP_RTO_MAX);
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  543
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  544
> 9a568de4818dea Eric Dumazet      2017-05-16  545                tcp_mstam=
p_refresh(tp);
> 2fd66ffba50716 Eric Dumazet      2018-09-21  546                delta_us =
=3D (u32)(tp->tcp_mstamp - tcp_skb_timestamp_us(skb));
> 7faee5c0d51416 Eric Dumazet      2014-09-05  547                remaining=
 =3D icsk->icsk_rto -
> 9a568de4818dea Eric Dumazet      2017-05-16  548                         =
   usecs_to_jiffies(delta_us);
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  549
> 9a568de4818dea Eric Dumazet      2017-05-16  550                if (remai=
ning > 0) {
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  551                        i=
net_csk_reset_xmit_timer(sk, ICSK_TIME_RETRANS,
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  552                         =
                         remaining, TCP_RTO_MAX);
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  553                } else {
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  554                        /=
* RTO revert clocked out retransmission.
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  555                         =
* Will retransmit now */
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  556                        t=
cp_retransmit_timer(sk);
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  557                }
> f1ecd5d9e73666 Damian Lukowski   2009-08-26  558
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  559                break;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  560        case ICMP_TIME_EX=
CEEDED:
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  561                err =3D E=
HOSTUNREACH;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  562                break;
>
> Or this break statement.
>
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  563        default:
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  564                goto out;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  565        }
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  566
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  567        switch (sk->sk_st=
ate) {
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  568        case TCP_SYN_SENT:
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  569        case TCP_SYN_RECV:
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  570                /* Only i=
n fast or simultaneous open. If a fast open socket is
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  571                 * is alr=
eady accepted it is treated as a connected one below.
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  572                 */
> 51456b2914a34d Ian Morris        2015-04-03  573                if (fasto=
pen && !fastopen->sk)
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  574                        b=
reak;
> 0a672f74131dd6 Yuchung Cheng     2014-05-11  575
> 45af29ca761c27 Eric Dumazet      2020-05-24 @576                ip_icmp_e=
rror(sk, skb, err, th->dest, info, (u8 *)th);
>                                                                          =
         ^^^
> Smatch thinks this can be uninitialized.
>
> 45af29ca761c27 Eric Dumazet      2020-05-24  577
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  578                if (!sock=
_owned_by_user(sk)) {
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  579                        s=
k->sk_err =3D err;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  580
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  581                        s=
k->sk_error_report(sk);
>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4568765396681698360==--

