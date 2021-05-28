Content-Type: multipart/mixed; boundary="===============4465535712710869409=="
MIME-Version: 1.0
From: Florian Westphal <fw@strlen.de>
To: kbuild-all@lists.01.org
Subject: Re: [nf-next:master 4/14] net/netfilter/nft_set_pipapo.c:412:6: error: static declaration of 'nft_pipapo_lookup' follows non-static declaration
Date: Fri, 28 May 2021 23:30:01 +0200
Message-ID: <20210528213001.GA10732@breakpoint.cc>
In-Reply-To: <202105290441.yixDLttm-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4465535712710869409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:
> All errors (new ones prefixed by >>):
> =

> >> net/netfilter/nft_set_pipapo.c:412:6: error: static declaration of 'nf=
t_pipapo_lookup' follows non-static declaration
>      412 | bool nft_pipapo_lookup(const struct net *net, const struct nft=
_set *set,
>          |      ^~~~~~~~~~~~~~~~~
>    In file included from net/netfilter/nft_set_pipapo.c:343:
>    net/netfilter/nft_set_pipapo.h:181:6: note: previous declaration of 'n=
ft_pipapo_lookup' was here
>      181 | bool nft_pipapo_lookup(const struct net *net, const struct nft=
_set *set,
>          |      ^~~~~~~~~~~~~~~~~
> =

> =

> vim +/nft_pipapo_lookup +412 net/netfilter/nft_set_pipapo.c
> =

> 3c4287f62044a9 Stefano Brivio   2020-01-22  399  =

> 3c4287f62044a9 Stefano Brivio   2020-01-22  400  /**
> 3c4287f62044a9 Stefano Brivio   2020-01-22  401   * nft_pipapo_lookup() -=
 Lookup function
> 3c4287f62044a9 Stefano Brivio   2020-01-22  402   * @net:	Network namespa=
ce
> 3c4287f62044a9 Stefano Brivio   2020-01-22  403   * @set:	nftables API se=
t representation
> 3db86c397f608b Andrew Lunn      2020-07-13  404   * @key:	nftables API el=
ement representation containing key data
> 3c4287f62044a9 Stefano Brivio   2020-01-22  405   * @ext:	nftables API ex=
tension pointer, filled with matching reference
> 3c4287f62044a9 Stefano Brivio   2020-01-22  406   *
> 3c4287f62044a9 Stefano Brivio   2020-01-22  407   * For more details, see=
 DOC: Theory of Operation.
> 3c4287f62044a9 Stefano Brivio   2020-01-22  408   *
> 3c4287f62044a9 Stefano Brivio   2020-01-22  409   * Return: true on match=
, false otherwise.
> 3c4287f62044a9 Stefano Brivio   2020-01-22  410   */
> a890630241c76a Florian Westphal 2021-05-13  411  INDIRECT_CALLABLE_SCOPE

This line needs to be dropped after the nf merge.
--===============4465535712710869409==--

