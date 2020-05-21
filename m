Content-Type: multipart/mixed; boundary="===============5782430758139846913=="
MIME-Version: 1.0
From: Guillaume Nault <gnault@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 1/2] flow_dissector: Parse multiple MPLS Label Stack Entries
Date: Thu, 21 May 2020 12:09:02 +0200
Message-ID: <20200521100902.GA24550@pc-3.home>
In-Reply-To: <202005210931.kHcrKMdv%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5782430758139846913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 09:24:25AM +0800, kbuild test robot wrote:
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> In file included from include/linux/build_bug.h:5,
> from include/linux/bitfield.h:10,
> from drivers/net/ethernet/netronome/nfp/flower/match.c:4:
> drivers/net/ethernet/netronome/nfp/flower/match.c: In function 'nfp_flowe=
r_compile_mac':
> >> drivers/net/ethernet/netronome/nfp/flower/match.c:100:57: error: 'stru=
ct flow_dissector_key_mpls' has no member named 'mpls_label'
> =

Sorry, I didn't realise this was used by NFP.
I'll respin.

--===============5782430758139846913==--

