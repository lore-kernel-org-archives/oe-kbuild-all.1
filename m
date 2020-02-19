Content-Type: multipart/mixed; boundary="===============3737529820207158249=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [android-common:android-3.18 373/383] drivers/net/can/slcan.c:652:9: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Thu, 20 Feb 2020 07:02:07 +0800
Message-ID: <202002200701.TJ7sQ5yt%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3737529820207158249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android-3.18
head:   e683046ccd492897e37ea92e1627813519f5bf67
commit: e25292ab5dbdf84e24c464d6fa3ff232eda091e8 [373/383] can, slip: Prote=
ct tty->disc_data in write_wakeup and close with RCU
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout e25292ab5dbdf84e24c464d6fa3ff232eda091e8
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/can/slcan.c:352:14: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   drivers/net/can/slcan.c:352:14: sparse:    void [noderef] <asn:4> *
   drivers/net/can/slcan.c:352:14: sparse:    void *
>> drivers/net/can/slcan.c:652:9: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
>> drivers/net/can/slcan.c:652:9: sparse:    expected void *volatile
>> drivers/net/can/slcan.c:652:9: sparse:    got void [noderef] <asn:4> *
--
   drivers/net/slip/slip.c:458:14: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   drivers/net/slip/slip.c:458:14: sparse:    void [noderef] <asn:4> *
   drivers/net/slip/slip.c:458:14: sparse:    void *
>> drivers/net/slip/slip.c:897:9: sparse: sparse: incorrect type in assignm=
ent (different address spaces)
>> drivers/net/slip/slip.c:897:9: sparse:    expected void *volatile
>> drivers/net/slip/slip.c:897:9: sparse:    got void [noderef] <asn:4> *

vim +652 drivers/net/can/slcan.c

   634	=

   635	/*
   636	 * Close down a SLCAN channel.
   637	 * This means flushing out any pending queues, and then returning. T=
his
   638	 * call is serialized against other ldisc functions.
   639	 *
   640	 * We also use this method for a hangup event.
   641	 */
   642	=

   643	static void slcan_close(struct tty_struct *tty)
   644	{
   645		struct slcan *sl =3D (struct slcan *) tty->disc_data;
   646	=

   647		/* First make sure we're connected. */
   648		if (!sl || sl->magic !=3D SLCAN_MAGIC || sl->tty !=3D tty)
   649			return;
   650	=

   651		spin_lock_bh(&sl->lock);
 > 652		rcu_assign_pointer(tty->disc_data, NULL);
   653		sl->tty =3D NULL;
   654		spin_unlock_bh(&sl->lock);
   655	=

   656		synchronize_rcu();
   657		flush_work(&sl->tx_work);
   658	=

   659		/* Flush network side */
   660		unregister_netdev(sl->dev);
   661		/* This will complete via sl_free_netdev */
   662	}
   663	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3737529820207158249==--

