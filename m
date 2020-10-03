Content-Type: multipart/mixed; boundary="===============3495820527149469040=="
MIME-Version: 1.0
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 11/15] sctp: add udphdr to overhead when udp_port is set
Date: Sat, 03 Oct 2020 01:08:24 -0300
Message-ID: <20201003040824.GG70998@localhost.localdomain>
In-Reply-To: <202009300218.2AcHEN0L-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3495820527149469040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 03:00:42AM +0800, kernel test robot wrote:
> Hi Xin,
> =

> Thank you for the patch! Yet something to improve:

I wonder how are you planning to fix this. It is quite entangled.
This is not performance critical. Maybe the cleanest way out is to
move it to a .c file.

Adding a
#if defined(CONFIG_IP_SCTP) || defined(CONFIG_IP_SCTP_MODULE)
in there doesn't seem good.

>    In file included from include/net/sctp/checksum.h:27,
>                     from net/netfilter/nf_nat_proto.c:16:
>    include/net/sctp/sctp.h: In function 'sctp_mtu_payload':
> >> include/net/sctp/sctp.h:583:31: error: 'struct net' has no member name=
d 'sctp'; did you mean 'ct'?
>      583 |   if (sock_net(&sp->inet.sk)->sctp.udp_port)
>          |                               ^~~~
>          |                               ct
>=20
--===============3495820527149469040==--

