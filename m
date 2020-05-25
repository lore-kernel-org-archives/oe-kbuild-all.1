Content-Type: multipart/mixed; boundary="===============2840203063759244967=="
MIME-Version: 1.0
From: Ahmed S. Darwish <a.darwish@linutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 01/25] net: core: device_rename: Use rwsem instead of a seqcount
Date: Mon, 25 May 2020 18:22:07 +0200
Message-ID: <20200525162206.GB375786@debian-buster-darwi.lab.linutronix.de>
In-Reply-To: <20200520143706.GB30374@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2840203063759244967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 05:37:07PM +0300, Dan Carpenter wrote:
...
>
> smatch warnings:
> net/core/dev.c:953 netdev_get_name() warn: inconsistent returns 'devnet_r=
ename_sem'.
>
...
>
> 5dbe7c178d3f0a4 Nicolas Schichan 2013-06-26  935  int netdev_get_name(str=
uct net *net, char *name, int ifindex)
> 5dbe7c178d3f0a4 Nicolas Schichan 2013-06-26  936  {
> 5dbe7c178d3f0a4 Nicolas Schichan 2013-06-26  937  	struct net_device *dev;
> 5dbe7c178d3f0a4 Nicolas Schichan 2013-06-26  938
> 2354e271ada778b Ahmed S. Darwish 2020-05-19  939  	down_read(&devnet_rena=
me_sem);
>                                                       ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^
>
> 2354e271ada778b Ahmed S. Darwish 2020-05-19  940
> 5dbe7c178d3f0a4 Nicolas Schichan 2013-06-26  941  	rcu_read_lock();
> 5dbe7c178d3f0a4 Nicolas Schichan 2013-06-26  942  	dev =3D dev_get_by_ind=
ex_rcu(net, ifindex);
> 5dbe7c178d3f0a4 Nicolas Schichan 2013-06-26  943  	if (!dev) {
> 5dbe7c178d3f0a4 Nicolas Schichan 2013-06-26  944  		rcu_read_unlock();
> 5dbe7c178d3f0a4 Nicolas Schichan 2013-06-26  945  		return -ENODEV;
>                                                               ^^^^^^^^^^^=
^^^

Oh, shouldn't have missed that. Will fix in v2.

Thanks,
--===============2840203063759244967==--

