Content-Type: multipart/mixed; boundary="===============8790483727388276817=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] net/ipv4/ip_fragment:fix missing Flags reserved bit set in iphdr
Date: Thu, 06 May 2021 12:37:31 +0300
Message-ID: <202105060033.tDmPYOCg-lkp@intel.com>
In-Reply-To: <20210505132557.197964-1-meijusan@163.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8790483727388276817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi meijusan,

url:    https://github.com/0day-ci/linux/commits/meijusan/net-ipv4-ip_fragm=
ent-fix-missing-Flags-reserved-bit-set-in-iphdr/20210505-212826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git mast=
er
config: i386-randconfig-m021-20210505 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv4/ip_output.c:655 ip_fraglist_prepare() error: uninitialized symbol =
'ip_evil'.

vim +/ip_evil +655 net/ipv4/ip_output.c

c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  631  void ip_fraglist_prepare(=
struct sk_buff *skb, struct ip_fraglist_iter *iter)
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  632  {
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  633  	unsigned int hlen =3D it=
er->hlen;
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  634  	struct iphdr *iph =3D it=
er->iph;
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  635  	struct sk_buff *frag;
c6cde148fcd3bf meijusan          2021-05-05  636  	bool ip_evil;
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  637  =

c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  638  	frag =3D iter->frag;
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  639  	frag->ip_summed =3D CHEC=
KSUM_NONE;
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  640  	skb_reset_transport_head=
er(frag);
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  641  	__skb_push(frag, hlen);
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  642  	skb_reset_network_header=
(frag);
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  643  	memcpy(skb_network_heade=
r(frag), iph, hlen);
c6cde148fcd3bf meijusan          2021-05-05  644  	if (ntohs(iph->frag_off)=
 & IP_EVIL)
c6cde148fcd3bf meijusan          2021-05-05  645  		ip_evil =3D true;

"ip_evil" is never set to false.

c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  646  	iter->iph =3D ip_hdr(fra=
g);
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  647  	iph =3D iter->iph;
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  648  	iph->tot_len =3D htons(f=
rag->len);
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  649  	ip_copy_metadata(frag, s=
kb);
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  650  	iter->offset +=3D skb->l=
en - hlen;
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  651  	iph->frag_off =3D htons(=
iter->offset >> 3);
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  652  	if (frag->next)
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  653  		iph->frag_off |=3D hton=
s(IP_MF);
c6cde148fcd3bf meijusan          2021-05-05  654  =

c6cde148fcd3bf meijusan          2021-05-05 @655  	if (ip_evil)
c6cde148fcd3bf meijusan          2021-05-05  656  		iph->frag_off |=3D hton=
s(IP_EVIL);
c6cde148fcd3bf meijusan          2021-05-05  657  =

c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  658  	/* Ready, complete check=
sum */
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  659  	ip_send_check(iph);
c8b17be0b7a45d Pablo Neira Ayuso 2019-05-29  660  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8790483727388276817==--

