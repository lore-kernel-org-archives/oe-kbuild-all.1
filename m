Content-Type: multipart/mixed; boundary="===============0170505394774417999=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: drivers/net/dsa/ocelot/felix.c:1329 felix_check_xtr_pkt() error: uninitialized symbol 'err'.
Date: Mon, 17 May 2021 16:15:12 +0300
Message-ID: <202105172026.SG93CMim-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0170505394774417999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d07f6ca923ea0927a1024dfccafc5b53b61cfecc
commit: 0a6f17c6ae2116809a7b7eb6dd3eab59ef5460ef net: dsa: tag_ocelot_8021q=
: add support for PTP timestamping
config: i386-randconfig-m021-20210517 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/dsa/ocelot/felix.c:1329 felix_check_xtr_pkt() error: uninitiali=
zed symbol 'err'.

vim +/err +1329 drivers/net/dsa/ocelot/felix.c

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1286  static bool felix_check_x=
tr_pkt(struct ocelot *ocelot, unsigned int ptp_type)
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1287  {
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1288  	struct felix *felix =3D =
ocelot_to_felix(ocelot);
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1289  	int err, grp =3D 0;
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1290  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1291  	if (felix->tag_proto !=
=3D DSA_TAG_PROTO_OCELOT_8021Q)
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1292  		return false;
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1293  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1294  	if (!felix->info->quirk_=
no_xtr_irq)
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1295  		return false;
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1296  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1297  	if (ptp_type =3D=3D PTP_=
CLASS_NONE)
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1298  		return false;
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1299  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1300  	while (ocelot_read(ocelo=
t, QS_XTR_DATA_PRESENT) & BIT(grp)) {

The static checker can't know whether we always enter this loop.

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1301  		struct sk_buff *skb;
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1302  		unsigned int type;
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1303  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1304  		err =3D ocelot_xtr_poll=
_frame(ocelot, grp, &skb);
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1305  		if (err)
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1306  			goto out;
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1307  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1308  		/* We trap to the CPU p=
ort module all PTP frames, but
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1309  		 * felix_rxtstamp() onl=
y gets called for event frames.
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1310  		 * So we need to avoid =
sending duplicate general
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1311  		 * message frames by ru=
nning a second BPF classifier
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1312  		 * here and dropping th=
ose.
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1313  		 */
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1314  		__skb_push(skb, ETH_HLE=
N);
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1315  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1316  		type =3D ptp_classify_r=
aw(skb);
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1317  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1318  		__skb_pull(skb, ETH_HLE=
N);
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1319  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1320  		if (type =3D=3D PTP_CLA=
SS_NONE) {
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1321  			kfree_skb(skb);
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1322  			continue;
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1323  		}
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1324  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1325  		netif_rx(skb);
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1326  	}
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1327  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1328  out:
0a6f17c6ae21168 Vladimir Oltean 2021-02-14 @1329  	if (err < 0)
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1330  		ocelot_drain_cpu_queue(=
ocelot, 0);
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1331  =

0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1332  	return true;
0a6f17c6ae21168 Vladimir Oltean 2021-02-14  1333  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============0170505394774417999==--

