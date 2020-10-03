Content-Type: multipart/mixed; boundary="===============9082856112479542664=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 11/15] sctp: add udphdr to overhead when udp_port is set
Date: Sat, 03 Oct 2020 19:23:33 +0800
Message-ID: <CADvbK_eXnzjDCypRkep9JqxBFV=cMXNkSZr4nyAaMiDc1VGXJg@mail.gmail.com>
In-Reply-To: <CADvbK_cPX1f5jrGsKuvya7ssOFPTsG7daBCkOP-NGN9hpzf5Vw@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9082856112479542664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2020 at 4:12 PM Xin Long <lucien.xin@gmail.com> wrote:
>
> On Sat, Oct 3, 2020 at 12:08 PM Marcelo Ricardo Leitner
> <marcelo.leitner@gmail.com> wrote:
> >
> > On Wed, Sep 30, 2020 at 03:00:42AM +0800, kernel test robot wrote:
> > > Hi Xin,
> > >
> > > Thank you for the patch! Yet something to improve:
> >
> > I wonder how are you planning to fix this. It is quite entangled.
> > This is not performance critical. Maybe the cleanest way out is to
> > move it to a .c file.
> >
> > Adding a
> > #if defined(CONFIG_IP_SCTP) || defined(CONFIG_IP_SCTP_MODULE)
> > in there doesn't seem good.
> >
> > >    In file included from include/net/sctp/checksum.h:27,
> > >                     from net/netfilter/nf_nat_proto.c:16:
> > >    include/net/sctp/sctp.h: In function 'sctp_mtu_payload':
> > > >> include/net/sctp/sctp.h:583:31: error: 'struct net' has no member =
named 'sctp'; did you mean 'ct'?
> > >      583 |   if (sock_net(&sp->inet.sk)->sctp.udp_port)
> > >          |                               ^~~~
> > >          |                               ct
> > >
> Here is actually another problem, I'm still thinking how to fix it.
>
> Now sctp_mtu_payload() returns different value depending on
> net->sctp.udp_port. but net->sctp.udp_port can be changed by
> "sysctl -w" anytime. so:
>
> In sctp_packet_config() it gets overhead/headroom by calling
> sctp_mtu_payload(). When 'udp_port' is 0, it's IP+MAC header
> size. Then if 'udp_port' is changed to 9899 by 'sysctl -w',
> udphdr will also be added to the packet in sctp_v4_xmit(),
> and later the headroom may not be enough for IP+MAC headers.
>
> I'm thinking to add sctp_sock->udp_port, and it'll be set when
> the sock is created with net->udp_port. but not sure if we should
> update sctp_sock->udp_port with  net->udp_port when sending packets?
something like:

diff --git a/net/sctp/output.c b/net/sctp/output.c
index 6614c9fdc51e..c379d805b9df 100644
--- a/net/sctp/output.c
+++ b/net/sctp/output.c
@@ -91,6 +91,7 @@ void sctp_packet_config(struct sctp_packet *packet,
__u32 vtag,
        if (asoc) {
                sk =3D asoc->base.sk;
                sp =3D sctp_sk(sk);
+               sctp_sock_check_udp_port(sock_net(sk), sp, asoc);
        }
        packet->overhead =3D sctp_mtu_payload(sp, 0, 0);
        packet->size =3D packet->overhead;
diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
index 21d0ff1c6ab9..f5aba9086d33 100644
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -1250,6 +1250,7 @@ static inline struct sctp_chunk
*sctp_make_op_error_limited(
        if (asoc) {
                size =3D min_t(size_t, size, asoc->pathmtu);
                sp =3D sctp_sk(asoc->base.sk);
+               sctp_sock_check_udp_port(sock_net(sk), sp, asoc);
        }

        size =3D sctp_mtu_payload(sp, size, sizeof(struct sctp_errhdr));
diff --git a/net/sctp/sm_statefuns.c b/net/sctp/sm_statefuns.c
index 8edab1533057..3e7f81d63d2e 100644
--- a/net/sctp/sm_statefuns.c
+++ b/net/sctp/sm_statefuns.c
@@ -6276,6 +6276,8 @@ static struct sctp_packet *sctp_ootb_pkt_new(
        sctp_transport_route(transport, (union sctp_addr *)&chunk->dest,
                             sctp_sk(net->sctp.ctl_sock));

+       sctp_sock_check_udp_port(net, net->sctp.ctl_sock, NULL);
+
        packet =3D &transport->packet;
        sctp_packet_init(packet, transport, sport, dport);
        sctp_packet_config(packet, vtag, 0);
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index d793dfa94682..e5de5f98be0c 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -1550,6 +1550,17 @@ static int sctp_error(struct sock *sk, int
flags, int err)
        return err;
 }

+void sctp_sock_check_udp_port(struct net* net, struct sctp_sock *sp,
+                             struct sctp_association *asoc)
+{
+       if (likely(sp->udp_port =3D=3D net->sctp.udp_port))
+               return;
+
+       if (asoc && (!sp->udp_port || !net->sctp.udp_port))
+               sctp_assoc_update_frag_point(asoc);
+       sp->udp_port =3D net->sctp.udp_port;
+}
+
 /* API 3.1.3 sendmsg() - UDP Style Syntax
  *
  * An application uses sendmsg() and recvmsg() calls to transmit data to
@@ -1795,6 +1806,8 @@ static int sctp_sendmsg_to_asoc(struct
sctp_association *asoc,
                        goto err;
        }

+       sctp_sock_check_udp_port(net, sp, asoc);
+
        if (sp->disable_fragments && msg_len > asoc->frag_point) {
                err =3D -EMSGSIZE;
                goto err;
--===============9082856112479542664==--

