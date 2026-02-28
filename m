Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0F818A6A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Feb 2026 05:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772258073; cv=none; b=qSYLcGse5l4hP9DpxuRotcBDdS1jxNIYq+8+9MbQYQ3aZEzkQ4x0mQYXiBEVHmTmwdOMfUhJOsDjl7zI3pvG3F/NgEeOPRmIKFY20LhryXnXMbezQnLH8oVRzmu0DO6DL/Ui33QgP1ALFoBdSqudrB4Co9cezYYqCPSQLESJprY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772258073; c=relaxed/simple;
	bh=38e/9bhyqD6L0Z1Ry3h1fDjv1caWFmpiq1ThBnCfS68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NAIJCIyEdLbvOxjIISNRVLbhk+S8ehnpOHWmcfyH7FSIBCjoqVRdGu0F8wJ3vatWfagYcKQdblF1b8UGKO7ccW8wHa/EX0Spf1X3hg8HuQ9XZgv5P4pbZEn8O9XI7UnG+vV+9K3AmyFf02uuiS/+dKidpg2LK62G9BD9TE4jBo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I08sIf0r; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I08sIf0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772258071; x=1803794071;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=38e/9bhyqD6L0Z1Ry3h1fDjv1caWFmpiq1ThBnCfS68=;
  b=I08sIf0rr4J3iFahEWvmYkjOYjLL7Ga3SV6GDhWuH65TX61/9UdVezzN
   POuqQwNgkPIF5D0Hwt48lzUC8893CLAlltOs14adrePbfXSK6OTrlXfBX
   oUl3kiIFepsnpc4cPs2PCjwyusrNDZzkq7gx2IezDiNJYXpoOuJa+Pkx/
   jMhrl3ZFAkldQ3OT42PVPSwYqZu3TMIRO/NtVCZ9T9MEAMS7IkR6I32t9
   TnRbZm9odbdizE1QXb2sSVgxIgzc0eOpNdagJTBi8g9T1L29FnfMjfJb9
   LA5lpgvl3U5/Y6OtNAB09V135u/Q/nHUT1TsAy7s8FRwTbk7vFM82R0AP
   Q==;
X-CSE-ConnectionGUID: TdmNE4A4Sjq9u7iq1ksLww==
X-CSE-MsgGUID: wEQyEqL7RKKeLuZCPArMYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73045244"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="73045244"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 21:54:31 -0800
X-CSE-ConnectionGUID: LfzuqNsyR5yymZjMAIx+vQ==
X-CSE-MsgGUID: AkxuN2yFQR6PR3/zFKlMlg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2026 21:54:28 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwDHV-00000000BKZ-3Q4Q;
	Sat, 28 Feb 2026 05:54:25 +0000
Date: Sat, 28 Feb 2026 13:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 2629/2633]
 arch/um/drivers/ubd_kern.c:1308:21: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202602281319.yqOdyCtI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: f5129f2f71ebf72c309430225b05d509abce6180 [2629/2633] Merge branch '=
for-next/kspp' of https://git.kernel.org/pub/scm/linux/kernel/git/kees/linu=
x.git
config: um-randconfig-r123-20260228 (https://download.01.org/0day-ci/archiv=
e/20260228/202602281319.yqOdyCtI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260228/202602281319.yqOdyCtI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602281319.yqOdyCtI-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/um/drivers/ubd_kern.c:1308:21: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected int res @@     got restrict=
ed blk_status_t [usertype] @@
   arch/um/drivers/ubd_kern.c:1308:21: sparse:     expected int res
   arch/um/drivers/ubd_kern.c:1308:21: sparse:     got restricted blk_statu=
s_t [usertype]
   arch/um/drivers/ubd_kern.c:1315:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected int res @@     got restrict=
ed blk_status_t [usertype] @@
   arch/um/drivers/ubd_kern.c:1315:29: sparse:     expected int res
   arch/um/drivers/ubd_kern.c:1315:29: sparse:     got restricted blk_statu=
s_t [usertype]
   arch/um/drivers/ubd_kern.c:1317:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected int res @@     got restrict=
ed blk_status_t [usertype] @@
   arch/um/drivers/ubd_kern.c:1317:29: sparse:     expected int res
   arch/um/drivers/ubd_kern.c:1317:29: sparse:     got restricted blk_statu=
s_t [usertype]
>> arch/um/drivers/ubd_kern.c:1320:16: sparse: sparse: incorrect type in re=
turn expression (different base types) @@     expected restricted blk_statu=
s_t @@     got int res @@
   arch/um/drivers/ubd_kern.c:1320:16: sparse:     expected restricted blk_=
status_t
   arch/um/drivers/ubd_kern.c:1320:16: sparse:     got int res
>> arch/um/drivers/ubd_kern.c:450:30: sparse: sparse: restricted blk_status=
_t degrades to integer
>> arch/um/drivers/ubd_kern.c:456:47: sparse: sparse: incorrect type in arg=
ument 2 (different base types) @@     expected restricted blk_status_t [use=
rtype] error @@     got int error @@
   arch/um/drivers/ubd_kern.c:456:47: sparse:     expected restricted blk_s=
tatus_t [usertype] error
   arch/um/drivers/ubd_kern.c:456:47: sparse:     got int error
>> arch/um/drivers/ubd_kern.c:1074:25: sparse: sparse: Using plain integer =
as NULL pointer
   arch/um/drivers/ubd_kern.c:1083:24: sparse: sparse: Using plain integer =
as NULL pointer
>> arch/um/drivers/ubd_kern.c:1372:24: sparse: sparse: incorrect type in re=
turn expression (different base types) @@     expected int @@     got restr=
icted blk_status_t [usertype] @@
   arch/um/drivers/ubd_kern.c:1372:24: sparse:     expected int
   arch/um/drivers/ubd_kern.c:1372:24: sparse:     got restricted blk_statu=
s_t [usertype]
   arch/um/drivers/ubd_kern.c:1374:24: sparse: sparse: incorrect type in re=
turn expression (different base types) @@     expected int @@     got restr=
icted blk_status_t [usertype] @@
   arch/um/drivers/ubd_kern.c:1374:24: sparse:     expected int
   arch/um/drivers/ubd_kern.c:1374:24: sparse:     got restricted blk_statu=
s_t [usertype]
   arch/um/drivers/ubd_kern.c:1376:16: sparse: sparse: incorrect type in re=
turn expression (different base types) @@     expected int @@     got restr=
icted blk_status_t [usertype] @@
   arch/um/drivers/ubd_kern.c:1376:16: sparse:     expected int
   arch/um/drivers/ubd_kern.c:1376:16: sparse:     got restricted blk_statu=
s_t [usertype]
>> arch/um/drivers/ubd_kern.c:1474:36: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected int error @@     got restri=
cted blk_status_t [usertype] @@
   arch/um/drivers/ubd_kern.c:1474:36: sparse:     expected int error
   arch/um/drivers/ubd_kern.c:1474:36: sparse:     got restricted blk_statu=
s_t [usertype]

vim +1308 arch/um/drivers/ubd_kern.c

53766defb8c860 Anton Ivanov                   2018-11-14  1286 =20
4e6da0fe8058df Richard Weinberger             2017-11-26  1287  static blk_=
status_t ubd_queue_rq(struct blk_mq_hw_ctx *hctx,
4e6da0fe8058df Richard Weinberger             2017-11-26  1288  				 const =
struct blk_mq_queue_data *bd)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1289  {
6961cd4d0fde97 Jens Axboe                     2018-11-07  1290  	struct ubd=
 *ubd_dev =3D hctx->queue->queuedata;
4e6da0fe8058df Richard Weinberger             2017-11-26  1291  	struct req=
uest *req =3D bd->rq;
53766defb8c860 Anton Ivanov                   2018-11-14  1292  	int ret =
=3D 0, res =3D BLK_STS_OK;
a0044bdf60c212 Jeff Dike                      2007-05-06  1293 =20
4e6da0fe8058df Richard Weinberger             2017-11-26  1294  	blk_mq_sta=
rt_request(req);
a0044bdf60c212 Jeff Dike                      2007-05-06  1295 =20
6961cd4d0fde97 Jens Axboe                     2018-11-07  1296  	spin_lock_=
irq(&ubd_dev->lock);
6961cd4d0fde97 Jens Axboe                     2018-11-07  1297 =20
53766defb8c860 Anton Ivanov                   2018-11-14  1298  	switch (re=
q_op(req)) {
53766defb8c860 Anton Ivanov                   2018-11-14  1299  	case REQ_O=
P_FLUSH:
53766defb8c860 Anton Ivanov                   2018-11-14  1300  	case REQ_O=
P_READ:
53766defb8c860 Anton Ivanov                   2018-11-14  1301  	case REQ_O=
P_WRITE:
50109b5a03b402 Anton Ivanov                   2018-11-14  1302  	case REQ_O=
P_DISCARD:
50109b5a03b402 Anton Ivanov                   2018-11-14  1303  	case REQ_O=
P_WRITE_ZEROES:
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1304  		ret =3D u=
bd_submit_request(ubd_dev, req);
50109b5a03b402 Anton Ivanov                   2018-11-14  1305  		break;
53766defb8c860 Anton Ivanov                   2018-11-14  1306  	default:
53766defb8c860 Anton Ivanov                   2018-11-14  1307  		WARN_ON_O=
NCE(1);
53766defb8c860 Anton Ivanov                   2018-11-14 @1308  		res =3D B=
LK_STS_NOTSUPP;
2adcec21978973 Jeff Dike                      2007-05-06  1309  	}
53766defb8c860 Anton Ivanov                   2018-11-14  1310 =20
6961cd4d0fde97 Jens Axboe                     2018-11-07  1311  	spin_unloc=
k_irq(&ubd_dev->lock);
6961cd4d0fde97 Jens Axboe                     2018-11-07  1312 =20
d848074b2f1eb1 Anton Ivanov                   2019-10-29  1313  	if (ret < =
0) {
d848074b2f1eb1 Anton Ivanov                   2019-10-29  1314  		if (ret =
=3D=3D -ENOMEM)
d848074b2f1eb1 Anton Ivanov                   2019-10-29 @1315  			res =3D =
BLK_STS_RESOURCE;
d848074b2f1eb1 Anton Ivanov                   2019-10-29  1316  		else
d848074b2f1eb1 Anton Ivanov                   2019-10-29 @1317  			res =3D =
BLK_STS_DEV_RESOURCE;
d848074b2f1eb1 Anton Ivanov                   2019-10-29  1318  	}
6961cd4d0fde97 Jens Axboe                     2018-11-07  1319 =20
53766defb8c860 Anton Ivanov                   2018-11-14 @1320  	return res;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1321  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1322 =20
4fc8728aa34f54 Al Viro                        2024-05-21  1323  static int =
ubd_getgeo(struct gendisk *disk, struct hd_geometry *geo)
a885c8c4316e1c Christoph Hellwig              2006-01-08  1324  {
4fc8728aa34f54 Al Viro                        2024-05-21  1325  	struct ubd=
 *ubd_dev =3D disk->private_data;
a885c8c4316e1c Christoph Hellwig              2006-01-08  1326 =20
a885c8c4316e1c Christoph Hellwig              2006-01-08  1327  	geo->heads=
 =3D 128;
a885c8c4316e1c Christoph Hellwig              2006-01-08  1328  	geo->secto=
rs =3D 32;
7d314e346d6081 Paolo 'Blaisorblade' Giarrusso 2006-10-30  1329  	geo->cylin=
ders =3D ubd_dev->size / (128 * 32 * 512);
a885c8c4316e1c Christoph Hellwig              2006-01-08  1330  	return 0;
a885c8c4316e1c Christoph Hellwig              2006-01-08  1331  }
a885c8c4316e1c Christoph Hellwig              2006-01-08  1332 =20
05bdb9965305bb Christoph Hellwig              2023-06-08  1333  static int =
ubd_ioctl(struct block_device *bdev, blk_mode_t mode,
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1334  		     unsi=
gned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1335  {
a625c998e638c5 Al Viro                        2008-03-02  1336  	struct ubd=
 *ubd_dev =3D bdev->bd_disk->private_data;
73855e13b2bce2 Bartlomiej Zolnierkiewicz      2009-04-01  1337  	u16 ubd_id=
[ATA_ID_WORDS];
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1338 =20
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1339  	switch (cm=
d) {
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1340  		struct cd=
rom_volctrl volume;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1341  	case HDIO_=
GET_IDENTITY:
73855e13b2bce2 Bartlomiej Zolnierkiewicz      2009-04-01  1342  		memset(&u=
bd_id, 0, ATA_ID_WORDS * 2);
73855e13b2bce2 Bartlomiej Zolnierkiewicz      2009-04-01  1343  		ubd_id[AT=
A_ID_CYLS]	=3D ubd_dev->size / (128 * 32 * 512);
73855e13b2bce2 Bartlomiej Zolnierkiewicz      2009-04-01  1344  		ubd_id[AT=
A_ID_HEADS]	=3D 128;
73855e13b2bce2 Bartlomiej Zolnierkiewicz      2009-04-01  1345  		ubd_id[AT=
A_ID_SECTORS]	=3D 32;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1346  		if(copy_t=
o_user((char __user *) arg, (char *) &ubd_id,
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1347  				 sizeof=
(ubd_id)))
dc764e5087bcee Jeff Dike                      2007-05-06  1348  			return -=
EFAULT;
dc764e5087bcee Jeff Dike                      2007-05-06  1349  		return 0;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1350 =20
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1351  	case CDROM=
VOLREAD:
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1352  		if(copy_f=
rom_user(&volume, (char __user *) arg, sizeof(volume)))
dc764e5087bcee Jeff Dike                      2007-05-06  1353  			return -=
EFAULT;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1354  		volume.ch=
annel0 =3D 255;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1355  		volume.ch=
annel1 =3D 255;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1356  		volume.ch=
annel2 =3D 255;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1357  		volume.ch=
annel3 =3D 255;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1358  		if(copy_t=
o_user((char __user *) arg, &volume, sizeof(volume)))
dc764e5087bcee Jeff Dike                      2007-05-06  1359  			return -=
EFAULT;
dc764e5087bcee Jeff Dike                      2007-05-06  1360  		return 0;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1361  	}
dc764e5087bcee Jeff Dike                      2007-05-06  1362  	return -EI=
NVAL;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1363  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1364 =20
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1365  static int =
map_error(int error_code)
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1366  {
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1367  	switch (er=
ror_code) {
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1368  	case 0:
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1369  		return BL=
K_STS_OK;
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1370  	case ENOSY=
S:
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1371  	case EOPNO=
TSUPP:
a43c83161a5ec1 Anton Ivanov                   2018-11-14 @1372  		return BL=
K_STS_NOTSUPP;
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1373  	case ENOSP=
C:
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1374  		return BL=
K_STS_NOSPC;
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1375  	}
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1376  	return BLK=
_STS_IOERR;
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1377  }
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1378 =20
a41421edb926fc Anton Ivanov                   2018-11-14  1379  /*
a41421edb926fc Anton Ivanov                   2018-11-14  1380   * Everythi=
ng from here onwards *IS NOT PART OF THE KERNEL*
a41421edb926fc Anton Ivanov                   2018-11-14  1381   *
a41421edb926fc Anton Ivanov                   2018-11-14  1382   * The foll=
owing functions are part of UML hypervisor code.
a41421edb926fc Anton Ivanov                   2018-11-14  1383   * All func=
tions from here onwards are executed as a helper
a41421edb926fc Anton Ivanov                   2018-11-14  1384   * thread a=
nd are not allowed to execute any kernel functions.
a41421edb926fc Anton Ivanov                   2018-11-14  1385   *
a41421edb926fc Anton Ivanov                   2018-11-14  1386   * Any comm=
unication must occur strictly via shared memory and IPC.
a41421edb926fc Anton Ivanov                   2018-11-14  1387   *
a41421edb926fc Anton Ivanov                   2018-11-14  1388   * Do not a=
dd printks, locks, kernel memory operations, etc - it
a41421edb926fc Anton Ivanov                   2018-11-14  1389   * will res=
ult in unpredictable behaviour and/or crashes.
a41421edb926fc Anton Ivanov                   2018-11-14  1390   */
a41421edb926fc Anton Ivanov                   2018-11-14  1391 =20
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1392  static int =
update_bitmap(struct io_thread_req *req, struct io_desc *segment)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1393  {
91acb21f084aa2 Jeff Dike                      2005-10-10  1394  	int n;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1395 =20
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1396  	if (segmen=
t->cow_offset =3D=3D -1)
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1397  		return ma=
p_error(0);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1398 =20
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1399  	n =3D os_p=
write_file(req->fds[1], &segment->bitmap_words,
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1400  			  sizeof=
(segment->bitmap_words), segment->cow_offset);
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1401  	if (n !=3D =
sizeof(segment->bitmap_words))
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1402  		return ma=
p_error(-n);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1403 =20
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1404  	return map=
_error(0);
09ace81c1d737b Jeff Dike                      2005-09-03  1405  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1406 =20
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1407  static void=
 do_io(struct io_thread_req *req, struct io_desc *desc)
91acb21f084aa2 Jeff Dike                      2005-10-10  1408  {
50109b5a03b402 Anton Ivanov                   2018-11-14  1409  	char *buf =
=3D NULL;
91acb21f084aa2 Jeff Dike                      2005-10-10  1410  	unsigned l=
ong len;
91acb21f084aa2 Jeff Dike                      2005-10-10  1411  	int n, nse=
ctors, start, end, bit;
91acb21f084aa2 Jeff Dike                      2005-10-10  1412  	__u64 off;
91acb21f084aa2 Jeff Dike                      2005-10-10  1413 =20
50109b5a03b402 Anton Ivanov                   2018-11-14  1414  	/* FLUSH i=
s really a special case, we cannot "case" it with others */
50109b5a03b402 Anton Ivanov                   2018-11-14  1415 =20
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1416  	if (req_op=
(req->req) =3D=3D REQ_OP_FLUSH) {
805f11a0d51565 Richard Weinberger             2013-08-18  1417  		/* fds[0]=
 is always either the rw image or our cow file */
a41421edb926fc Anton Ivanov                   2018-11-14  1418  		req->erro=
r =3D map_error(-os_sync_file(req->fds[0]));
805f11a0d51565 Richard Weinberger             2013-08-18  1419  		return;
805f11a0d51565 Richard Weinberger             2013-08-18  1420  	}
805f11a0d51565 Richard Weinberger             2013-08-18  1421 =20
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1422  	nsectors =
=3D desc->length / req->sectorsize;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1423  	start =3D =
0;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1424  	do {
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1425  		bit =3D u=
bd_test_bit(start, (unsigned char *) &desc->sector_mask);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1426  		end =3D s=
tart;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1427  		while((en=
d < nsectors) &&
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1428  		      (ub=
d_test_bit(end, (unsigned char *) &desc->sector_mask) =3D=3D bit))
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1429  			end++;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1430 =20
91acb21f084aa2 Jeff Dike                      2005-10-10  1431  		off =3D r=
eq->offset + req->offsets[bit] +
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1432  			start * =
req->sectorsize;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1433  		len =3D (=
end - start) * req->sectorsize;
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1434  		if (desc-=
>buffer !=3D NULL)
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1435  			buf =3D =
&desc->buffer[start * req->sectorsize];
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1436 =20
50109b5a03b402 Anton Ivanov                   2018-11-14  1437  		switch (r=
eq_op(req->req)) {
50109b5a03b402 Anton Ivanov                   2018-11-14  1438  		case REQ_=
OP_READ:
91acb21f084aa2 Jeff Dike                      2005-10-10  1439  			n =3D 0;
91acb21f084aa2 Jeff Dike                      2005-10-10  1440  			do {
91acb21f084aa2 Jeff Dike                      2005-10-10  1441  				buf =3D =
&buf[n];
91acb21f084aa2 Jeff Dike                      2005-10-10  1442  				len -=
=3D n;
8c6157b6b30a76 Anton Ivanov                   2015-12-21  1443  				n =3D o=
s_pread_file(req->fds[bit], buf, len, off);
91acb21f084aa2 Jeff Dike                      2005-10-10  1444  				if (n <=
 0) {
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1445  					req->e=
rror =3D map_error(-n);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1446  					return;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1447  				}
91acb21f084aa2 Jeff Dike                      2005-10-10  1448  			} while(=
(n < len) && (n !=3D 0));
91acb21f084aa2 Jeff Dike                      2005-10-10  1449  			if (n < =
len) memset(&buf[n], 0, len - n);
50109b5a03b402 Anton Ivanov                   2018-11-14  1450  			break;
50109b5a03b402 Anton Ivanov                   2018-11-14  1451  		case REQ_=
OP_WRITE:
8c6157b6b30a76 Anton Ivanov                   2015-12-21  1452  			n =3D os=
_pwrite_file(req->fds[bit], buf, len, off);
91acb21f084aa2 Jeff Dike                      2005-10-10  1453  			if(n !=
=3D len){
a43c83161a5ec1 Anton Ivanov                   2018-11-14  1454  				req->er=
ror =3D map_error(-n);
91acb21f084aa2 Jeff Dike                      2005-10-10  1455  				return;
91acb21f084aa2 Jeff Dike                      2005-10-10  1456  			}
50109b5a03b402 Anton Ivanov                   2018-11-14  1457  			break;
50109b5a03b402 Anton Ivanov                   2018-11-14  1458  		case REQ_=
OP_DISCARD:
50109b5a03b402 Anton Ivanov                   2018-11-14  1459  			n =3D os=
_falloc_punch(req->fds[bit], off, len);
50109b5a03b402 Anton Ivanov                   2018-11-14  1460  			if (n) {
50109b5a03b402 Anton Ivanov                   2018-11-14  1461  				req->er=
ror =3D map_error(-n);
50109b5a03b402 Anton Ivanov                   2018-11-14  1462  				return;
50109b5a03b402 Anton Ivanov                   2018-11-14  1463  			}
50109b5a03b402 Anton Ivanov                   2018-11-14  1464  			break;
d2a0a616ab2246 Fr=C3=A9d=C3=A9ric Danis                 2022-01-25  1465  	=
	case REQ_OP_WRITE_ZEROES:
d2a0a616ab2246 Fr=C3=A9d=C3=A9ric Danis                 2022-01-25  1466  	=
		n =3D os_falloc_zeroes(req->fds[bit], off, len);
d2a0a616ab2246 Fr=C3=A9d=C3=A9ric Danis                 2022-01-25  1467  	=
		if (n) {
d2a0a616ab2246 Fr=C3=A9d=C3=A9ric Danis                 2022-01-25  1468  	=
			req->error =3D map_error(-n);
d2a0a616ab2246 Fr=C3=A9d=C3=A9ric Danis                 2022-01-25  1469  	=
			return;
d2a0a616ab2246 Fr=C3=A9d=C3=A9ric Danis                 2022-01-25  1470  	=
		}
d2a0a616ab2246 Fr=C3=A9d=C3=A9ric Danis                 2022-01-25  1471  	=
		break;
50109b5a03b402 Anton Ivanov                   2018-11-14  1472  		default:
50109b5a03b402 Anton Ivanov                   2018-11-14  1473  			WARN_ON_=
ONCE(1);
50109b5a03b402 Anton Ivanov                   2018-11-14 @1474  			req->err=
or =3D BLK_STS_NOTSUPP;
50109b5a03b402 Anton Ivanov                   2018-11-14  1475  			return;
91acb21f084aa2 Jeff Dike                      2005-10-10  1476  		}
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1477 =20
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1478  		start =3D =
end;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1479  	} while(st=
art < nsectors);
91acb21f084aa2 Jeff Dike                      2005-10-10  1480 =20
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1481  	req->offse=
t +=3D len;
fc6b6a872dcd48 Gabriel Krisman Bertazi        2020-11-21  1482  	req->error=
 =3D update_bitmap(req, desc);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1483  }
91acb21f084aa2 Jeff Dike                      2005-10-10  1484 =20

:::::: The code at line 1308 was first introduced by commit
:::::: 53766defb8c860a47e2a965f5b4b05ed2848e2d0 um: Clean-up command proces=
sing in UML UBD driver

:::::: TO: Anton Ivanov <anton.ivanov@cambridgegreys.com>
:::::: CC: Richard Weinberger <richard@nod.at>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
