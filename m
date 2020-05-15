Content-Type: multipart/mixed; boundary="===============0671917847901871668=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/kcsan 12/21] net/netfilter/core.c:585:26: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Fri, 15 May 2020 18:29:37 +0800
Message-ID: <202005151825.baqb0FFR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0671917847901871668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/kcsan
head:   ffed638b6a2180da8fd002a46632d746af72b299
commit: bbfa112b46bdbbdfc2f5bfb9c2dcbef780ff6417 [12/21] READ_ONCE: Simplif=
y implementations of {READ,WRITE}_ONCE()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout bbfa112b46bdbbdfc2f5bfb9c2dcbef780ff6417
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> net/netfilter/core.c:585:26: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@    expected void ( **__xp )( ... ) @@    g=
ot void ( *[noderef] void ( **__xp )( ... ) @@
>> net/netfilter/core.c:585:26: sparse:    expected void ( **__xp )( ... )
   net/netfilter/core.c:585:26: sparse:    got void ( *[noderef] <asn:4> * =
)( ... )
   net/netfilter/core.c:585:26: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   net/netfilter/core.c:585:26: sparse:    void ( [noderef] <asn:4> * )( ..=
. )
   net/netfilter/core.c:585:26: sparse:    void ( * )( ... )

vim +585 net/netfilter/core.c

2c205dd3981f79c Pablo Neira Ayuso 2018-05-23  578  =

312a0c16c1fa9dd Patrick McHardy   2013-07-28  579  void nf_ct_attach(struct=
 sk_buff *new, const struct sk_buff *skb)
f6ebe77f955d77a Harald Welte      2005-08-09  580  {
312a0c16c1fa9dd Patrick McHardy   2013-07-28  581  	void (*attach)(struct s=
k_buff *, const struct sk_buff *);
f6ebe77f955d77a Harald Welte      2005-08-09  582  =

a9e419dc7be6997 Florian Westphal  2017-01-23  583  	if (skb->_nfct) {
c3a47ab3e5ad626 Patrick McHardy   2007-02-12  584  		rcu_read_lock();
c3a47ab3e5ad626 Patrick McHardy   2007-02-12 @585  		attach =3D rcu_derefer=
ence(ip_ct_attach);
c3a47ab3e5ad626 Patrick McHardy   2007-02-12  586  		if (attach)
f6ebe77f955d77a Harald Welte      2005-08-09  587  			attach(new, skb);
c3a47ab3e5ad626 Patrick McHardy   2007-02-12  588  		rcu_read_unlock();
f6ebe77f955d77a Harald Welte      2005-08-09  589  	}
f6ebe77f955d77a Harald Welte      2005-08-09  590  }
f6ebe77f955d77a Harald Welte      2005-08-09  591  EXPORT_SYMBOL(nf_ct_atta=
ch);
de6e05c49f8b4ed Yasuyuki Kozakai  2007-03-23  592  =


:::::: The code at line 585 was first introduced by commit
:::::: c3a47ab3e5ad62601449e4e5401352271b777e28 [NETFILTER]: Properly use R=
CU in nf_ct_attach

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0671917847901871668==--

