Content-Type: multipart/mixed; boundary="===============7855496993026724282=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC] Bluetooth: Move scanning update into synchronous function
Date: Sat, 08 May 2021 10:06:21 +0300
Message-ID: <202105080212.p17XzwsC-lkp@intel.com>
In-Reply-To: <20210505210518.183861-1-marcel@holtmann.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7855496993026724282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Marcel,

url:    https://github.com/0day-ci/linux/commits/Marcel-Holtmann/Bluetooth-=
Move-scanning-update-into-synchronous-function/20210506-050753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
config: i386-randconfig-m021-20210507 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/bluetooth/hci_request.c:2540 bg_scan_update() error: uninitialized symb=
ol 'status'.

vim +/status +2540 net/bluetooth/hci_request.c

2e93e53b8f86fb Johan Hedberg   2015-11-11  2525  static void bg_scan_update=
(struct work_struct *work)
2e93e53b8f86fb Johan Hedberg   2015-11-11  2526  {
2e93e53b8f86fb Johan Hedberg   2015-11-11  2527  	struct hci_dev *hdev =3D =
container_of(work, struct hci_dev,
2e93e53b8f86fb Johan Hedberg   2015-11-11  2528  					    bg_scan_update);
84235d222a297a Johan Hedberg   2015-11-11  2529  	struct hci_conn *conn;
84235d222a297a Johan Hedberg   2015-11-11  2530  	u8 status;

"status" is never initialized.

84235d222a297a Johan Hedberg   2015-11-11  2531  =

05534cb7a70014 Marcel Holtmann 2021-05-05  2532  	hci_req_sync_lock(hdev);
05534cb7a70014 Marcel Holtmann 2021-05-05  2533  	update_background_scan(hd=
ev);
05534cb7a70014 Marcel Holtmann 2021-05-05  2534  	hci_req_sync_unlock(hdev);
84235d222a297a Johan Hedberg   2015-11-11  2535  =

84235d222a297a Johan Hedberg   2015-11-11  2536  	hci_dev_lock(hdev);
84235d222a297a Johan Hedberg   2015-11-11  2537  =

84235d222a297a Johan Hedberg   2015-11-11  2538  	conn =3D hci_conn_hash_lo=
okup_state(hdev, LE_LINK, BT_CONNECT);
84235d222a297a Johan Hedberg   2015-11-11  2539  	if (conn)
84235d222a297a Johan Hedberg   2015-11-11 @2540  		hci_le_conn_failed(conn,=
 status);
2e93e53b8f86fb Johan Hedberg   2015-11-11  2541  =

84235d222a297a Johan Hedberg   2015-11-11  2542  	hci_dev_unlock(hdev);
2e93e53b8f86fb Johan Hedberg   2015-11-11  2543  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7855496993026724282==--

