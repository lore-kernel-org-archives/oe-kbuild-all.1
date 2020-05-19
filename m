Content-Type: multipart/mixed; boundary="===============8308252785364291948=="
MIME-Version: 1.0
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 6887/8703] net/qrtr/qrtr.c:857:20-24: ERROR: invalid reference to the index variable of the iterator on line 848 (fwd)
Date: Tue, 19 May 2020 23:49:06 +0530
Message-ID: <20200519181906.GA4397@Mani-XPS-13-9360>
In-Reply-To: <alpine.DEB.2.21.2005191819190.2503@hadrien>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8308252785364291948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 19, 2020 at 06:20:56PM +0200, Julia Lawall wrote:
> Hello,
> =

> Please check whether the break on line 851 is guaranteed to be taken.  If
> not, on line 857, node may point to an invalid object.
> =


This will get fixed by: https://lkml.org/lkml/2020/5/19/838

Sorry for not CCing you. I thought git send-email will add you to CC since
you're in Reported-by tag but it doesn't :/

Thanks,
Mani

> julia
> =

> ---------- Forwarded message ----------
> Date: Tue, 19 May 2020 08:08:44 +0800
> From: kbuild test robot <lkp@intel.com>
> To: kbuild(a)lists.01.org
> Cc: lkp(a)intel.com, Julia Lawall <julia.lawall@lip6.fr>
> Subject: [linux-next:master 6887/8703] net/qrtr/qrtr.c:857:20-24: ERROR: =
invalid
>      reference to the index variable of the iterator on line 848
> =

> CC: kbuild-all(a)lists.01.org
> TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> CC: Bjorn Andersson <bjorn.andersson@linaro.org>
> =

> Hi Manivannan,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   e098d7762d602be640c53565ceca342f81e55ad2
> commit: e42671084361302141a09284fde9bbc14fdd16bf [6887/8703] net: qrtr: D=
o not depend on ARCH_QCOM
> config: nds32-randconfig-c003-20200519 (attached as .config)
> :::::: branch date: 7 days ago
> :::::: commit date: 11 days ago
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> =

> =

> coccinelle warnings: (new ones prefixed by >>)
> =

> >> net/qrtr/qrtr.c:857:20-24: ERROR: invalid reference to the index varia=
ble of the iterator on line 848
> =

> # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3De42671084361302141a09284fde9bbc14fdd16bf
> git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git=
/next/linux-next.git
> git remote update linux-next
> git checkout e42671084361302141a09284fde9bbc14fdd16bf
> vim +857 net/qrtr/qrtr.c
> =

> bdabad3e363d825 Courtney Cavin  2016-05-06  839
> bdabad3e363d825 Courtney Cavin  2016-05-06  840  /* Queue packet for broa=
dcast. */
> e7044482c8ac508 Bjorn Andersson 2017-10-10  841  static int qrtr_bcast_en=
queue(struct qrtr_node *node, struct sk_buff *skb,
> e7044482c8ac508 Bjorn Andersson 2017-10-10  842  			      int type, struc=
t sockaddr_qrtr *from,
> e7044482c8ac508 Bjorn Andersson 2017-10-10  843  			      struct sockaddr=
_qrtr *to)
> bdabad3e363d825 Courtney Cavin  2016-05-06  844  {
> bdabad3e363d825 Courtney Cavin  2016-05-06  845  	struct sk_buff *skbn;
> bdabad3e363d825 Courtney Cavin  2016-05-06  846
> bdabad3e363d825 Courtney Cavin  2016-05-06  847  	mutex_lock(&qrtr_node_l=
ock);
> bdabad3e363d825 Courtney Cavin  2016-05-06 @848  	list_for_each_entry(nod=
e, &qrtr_all_nodes, item) {
> bdabad3e363d825 Courtney Cavin  2016-05-06  849  		skbn =3D skb_clone(skb=
, GFP_KERNEL);
> bdabad3e363d825 Courtney Cavin  2016-05-06  850  		if (!skbn)
> bdabad3e363d825 Courtney Cavin  2016-05-06  851  			break;
> bdabad3e363d825 Courtney Cavin  2016-05-06  852  		skb_set_owner_w(skbn, =
skb->sk);
> e7044482c8ac508 Bjorn Andersson 2017-10-10  853  		qrtr_node_enqueue(node=
, skbn, type, from, to);
> bdabad3e363d825 Courtney Cavin  2016-05-06  854  	}
> bdabad3e363d825 Courtney Cavin  2016-05-06  855  	mutex_unlock(&qrtr_node=
_lock);
> bdabad3e363d825 Courtney Cavin  2016-05-06  856
> e7044482c8ac508 Bjorn Andersson 2017-10-10 @857  	qrtr_local_enqueue(node=
, skb, type, from, to);
> bdabad3e363d825 Courtney Cavin  2016-05-06  858
> bdabad3e363d825 Courtney Cavin  2016-05-06  859  	return 0;
> bdabad3e363d825 Courtney Cavin  2016-05-06  860  }
> bdabad3e363d825 Courtney Cavin  2016-05-06  861
> =

> :::::: The code at line 857 was first introduced by commit
> :::::: e7044482c8ac5081f4775063995647787d5082a4 net: qrtr: Pass source an=
d destination to enqueue functions
> =

> :::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
> :::::: CC: David S. Miller <davem@davemloft.net>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============8308252785364291948==--

