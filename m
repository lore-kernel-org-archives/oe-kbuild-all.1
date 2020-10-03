Content-Type: multipart/mixed; boundary="===============1205943393488298583=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 11/15] sctp: add udphdr to overhead when udp_port is set
Date: Sat, 03 Oct 2020 16:12:58 +0800
Message-ID: <CADvbK_cPX1f5jrGsKuvya7ssOFPTsG7daBCkOP-NGN9hpzf5Vw@mail.gmail.com>
In-Reply-To: <20201003040824.GG70998@localhost.localdomain>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1205943393488298583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2020 at 12:08 PM Marcelo Ricardo Leitner
<marcelo.leitner@gmail.com> wrote:
>
> On Wed, Sep 30, 2020 at 03:00:42AM +0800, kernel test robot wrote:
> > Hi Xin,
> >
> > Thank you for the patch! Yet something to improve:
>
> I wonder how are you planning to fix this. It is quite entangled.
> This is not performance critical. Maybe the cleanest way out is to
> move it to a .c file.
>
> Adding a
> #if defined(CONFIG_IP_SCTP) || defined(CONFIG_IP_SCTP_MODULE)
> in there doesn't seem good.
>
> >    In file included from include/net/sctp/checksum.h:27,
> >                     from net/netfilter/nf_nat_proto.c:16:
> >    include/net/sctp/sctp.h: In function 'sctp_mtu_payload':
> > >> include/net/sctp/sctp.h:583:31: error: 'struct net' has no member na=
med 'sctp'; did you mean 'ct'?
> >      583 |   if (sock_net(&sp->inet.sk)->sctp.udp_port)
> >          |                               ^~~~
> >          |                               ct
> >
Here is actually another problem, I'm still thinking how to fix it.

Now sctp_mtu_payload() returns different value depending on
net->sctp.udp_port. but net->sctp.udp_port can be changed by
"sysctl -w" anytime. so:

In sctp_packet_config() it gets overhead/headroom by calling
sctp_mtu_payload(). When 'udp_port' is 0, it's IP+MAC header
size. Then if 'udp_port' is changed to 9899 by 'sysctl -w',
udphdr will also be added to the packet in sctp_v4_xmit(),
and later the headroom may not be enough for IP+MAC headers.

I'm thinking to add sctp_sock->udp_port, and it'll be set when
the sock is created with net->udp_port. but not sure if we should
update sctp_sock->udp_port with  net->udp_port when sending packets?
--===============1205943393488298583==--

