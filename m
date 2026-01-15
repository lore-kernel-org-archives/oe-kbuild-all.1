Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26EC84039
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768515742; cv=none; b=BjXFMqvSXz98MN2GdN+yhYAu1PKOaWMCtWv2a4X86lIAmyHslvjKsoZsbcGlq4qdH156Ka6Vg+O2cuoz1KoQA+4HCUOeL/hwj4rH+S2vZvnDJIv9rKvY5yES2WV2DTmkapzOpvjhNLRUsvnWqkOvKe0xODcKIBERnihdd4yzXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768515742; c=relaxed/simple;
	bh=qcFLX8X/qNnW1hp9gz9BtO2UHS3kSK5Q2dlyvop2W8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FLChArNsMsVZx5PnjfXlhNylhLeUR4+MKUYdzYED9uSECFgeuO5EamFZqYzdzQ5+Nfn6VA+/D3hVO5jnXiUqvhUPgPYVo/F4ZpUE34h9eGqBdaypnvt0ub8IoX1iM+UCHGampblfNDROWoQ3zspgFD913zBkD//kRL7QmG63tRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d53B4YdV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d53B4YdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768515740; x=1800051740;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qcFLX8X/qNnW1hp9gz9BtO2UHS3kSK5Q2dlyvop2W8E=;
  b=d53B4YdVXLW+iMdFPTDu/LkyrQcvmItYRkHqQK8ynzPHJBTMIFQinmGj
   V8CVvL/YXaGLpevBjK7COquM9FjiOo6squk9o2nZjuOZzRTwNVkhpFC2J
   Gml6a76GX5Y8CbaFy9EjVVYlMz4Oik5YYgJO3/gIw5CkBcm3E5wOgzHs+
   BuePBy7ptUo37HG8f+V9zGr5iLXSToVcPChXRq6IC57fcriqLq1Flh0he
   8zlICNBF4PX6QOzZaDdTL9f5PcTjVE1jMCZV4pUhXyWTdG/U5ILVSIkaU
   SPOwtWQJgt8QfD/s+4jivNtonxrAlkLOPOR+XJ/a/9bJwrCsKxzufV3kQ
   A==;
X-CSE-ConnectionGUID: AzjMiSu7SxCuFpJA+Zt95g==
X-CSE-MsgGUID: VJ9ynVaWQ1SstgJR/kYkkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81279990"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="81279990"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 14:22:20 -0800
X-CSE-ConnectionGUID: 64OU2Ph9RY2L5Gdyw/ljpQ==
X-CSE-MsgGUID: 3DxfcPJ0Rw2/0jzbXc08Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="210103339"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jan 2026 14:22:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgVjM-00000000K3u-0zSA;
	Thu, 15 Jan 2026 22:22:16 +0000
Date: Fri, 16 Jan 2026 06:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 19/19]
 drivers/net/usb/hso.c:1477:13: sparse: sparse: cast to restricted __le16
Message-ID: <202601160614.sn50AX9z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   e5a4b798e710861426579bea24f769032504de8b
commit: e5a4b798e710861426579bea24f769032504de8b [19/19] TMP: Revert "modul=
e: Add compile-time check for embedded NUL characters"
config: nios2-randconfig-r132-20260116 (https://download.01.org/0day-ci/arc=
hive/20260116/202601160614.sn50AX9z-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260116/202601160614.sn50AX9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160614.sn50AX9z-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/usb/hso.c:1477:13: sparse: sparse: cast to restricted __le16
   drivers/net/usb/hso.c:1478:13: sparse: sparse: cast to restricted __le16
   drivers/net/usb/hso.c:1479:13: sparse: sparse: cast to restricted __le16
   drivers/net/usb/hso.c:1487:37: sparse: sparse: cast to restricted __le16
   drivers/net/usb/hso.c:1631:37: sparse: sparse: cast to restricted __le16
   drivers/net/usb/hso.c: note: in included file (through include/uapi/linu=
x/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.=
h, ...):
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many argum=
ents for function __builtin_custom_ini

vim +1477 drivers/net/usb/hso.c

542f5482361491 Denis Joseph Barrow       2009-01-02  1439 =20
542f5482361491 Denis Joseph Barrow       2009-01-02  1440  static void tioc=
mget_intr_callback(struct urb *urb)
542f5482361491 Denis Joseph Barrow       2009-01-02  1441  {
542f5482361491 Denis Joseph Barrow       2009-01-02  1442  	struct hso_seri=
al *serial =3D urb->context;
542f5482361491 Denis Joseph Barrow       2009-01-02  1443  	struct hso_tioc=
mget *tiocmget;
542f5482361491 Denis Joseph Barrow       2009-01-02  1444  	int status =3D =
urb->status;
542f5482361491 Denis Joseph Barrow       2009-01-02  1445  	u16 UART_state_=
bitmap, prev_UART_state_bitmap;
542f5482361491 Denis Joseph Barrow       2009-01-02  1446  	struct uart_ico=
unt *icount;
542f5482361491 Denis Joseph Barrow       2009-01-02  1447  	struct hso_seri=
al_state_notification *serial_state_notification;
542f5482361491 Denis Joseph Barrow       2009-01-02  1448  	struct usb_devi=
ce *usb;
64bea46e3ff287 Aleksander Morgado        2015-02-17  1449  	struct usb_inte=
rface *interface;
e5e97ee956d8c5 Dan Williams              2014-01-06  1450  	int if_num;
542f5482361491 Denis Joseph Barrow       2009-01-02  1451 =20
542f5482361491 Denis Joseph Barrow       2009-01-02  1452  	/* Sanity check=
s */
542f5482361491 Denis Joseph Barrow       2009-01-02  1453  	if (!serial)
542f5482361491 Denis Joseph Barrow       2009-01-02  1454  		return;
542f5482361491 Denis Joseph Barrow       2009-01-02  1455  	if (status) {
68a351c501ad22 Jan Dumon                 2010-01-05  1456  		handle_usb_err=
or(status, __func__, serial->parent);
542f5482361491 Denis Joseph Barrow       2009-01-02  1457  		return;
542f5482361491 Denis Joseph Barrow       2009-01-02  1458  	}
e5e97ee956d8c5 Dan Williams              2014-01-06  1459 =20
e5e97ee956d8c5 Dan Williams              2014-01-06  1460  	/* tiocmget is =
only supported on HSO_PORT_MODEM */
542f5482361491 Denis Joseph Barrow       2009-01-02  1461  	tiocmget =3D se=
rial->tiocmget;
542f5482361491 Denis Joseph Barrow       2009-01-02  1462  	if (!tiocmget)
542f5482361491 Denis Joseph Barrow       2009-01-02  1463  		return;
e5e97ee956d8c5 Dan Williams              2014-01-06  1464  	BUG_ON((serial-=
>parent->port_spec & HSO_PORT_MASK) !=3D HSO_PORT_MODEM);
e5e97ee956d8c5 Dan Williams              2014-01-06  1465 =20
542f5482361491 Denis Joseph Barrow       2009-01-02  1466  	usb =3D serial-=
>parent->usb;
64bea46e3ff287 Aleksander Morgado        2015-02-17  1467  	interface =3D s=
erial->parent->interface;
64bea46e3ff287 Aleksander Morgado        2015-02-17  1468 =20
64bea46e3ff287 Aleksander Morgado        2015-02-17  1469  	if_num =3D inte=
rface->cur_altsetting->desc.bInterfaceNumber;
e5e97ee956d8c5 Dan Williams              2014-01-06  1470 =20
e5e97ee956d8c5 Dan Williams              2014-01-06  1471  	/* wIndex shoul=
d be the USB interface number of the port to which the
e5e97ee956d8c5 Dan Williams              2014-01-06  1472  	 * notification=
 applies, which should always be the Modem port.
e5e97ee956d8c5 Dan Williams              2014-01-06  1473  	 */
af0de1303c4e8f Oliver Neukum             2019-10-17  1474  	serial_state_no=
tification =3D tiocmget->serial_state_notification;
542f5482361491 Denis Joseph Barrow       2009-01-02  1475  	if (serial_stat=
e_notification->bmRequestType !=3D BM_REQUEST_TYPE ||
542f5482361491 Denis Joseph Barrow       2009-01-02  1476  	    serial_stat=
e_notification->bNotification !=3D B_NOTIFICATION ||
542f5482361491 Denis Joseph Barrow       2009-01-02 @1477  	    le16_to_cpu=
(serial_state_notification->wValue) !=3D W_VALUE ||
e5e97ee956d8c5 Dan Williams              2014-01-06  1478  	    le16_to_cpu=
(serial_state_notification->wIndex) !=3D if_num ||
542f5482361491 Denis Joseph Barrow       2009-01-02  1479  	    le16_to_cpu=
(serial_state_notification->wLength) !=3D W_LENGTH) {
542f5482361491 Denis Joseph Barrow       2009-01-02  1480  		dev_warn(&usb-=
>dev,
542f5482361491 Denis Joseph Barrow       2009-01-02  1481  			 "hso receive=
d invalid serial state notification\n");
542f5482361491 Denis Joseph Barrow       2009-01-02  1482  		DUMP(serial_st=
ate_notification,
9ce673d5e91996 Antti Kaijanm=C3=A4ki          2009-11-23  1483  		     size=
of(struct hso_serial_state_notification));
542f5482361491 Denis Joseph Barrow       2009-01-02  1484  	} else {
12c4de4bcc23ec Sebastian Andrzej Siewior 2018-06-20  1485  		unsigned long =
flags;
542f5482361491 Denis Joseph Barrow       2009-01-02  1486 =20
542f5482361491 Denis Joseph Barrow       2009-01-02  1487  		UART_state_bit=
map =3D le16_to_cpu(serial_state_notification->
542f5482361491 Denis Joseph Barrow       2009-01-02  1488  						UART_state=
_bitmap);
542f5482361491 Denis Joseph Barrow       2009-01-02  1489  		prev_UART_stat=
e_bitmap =3D tiocmget->prev_UART_state_bitmap;
542f5482361491 Denis Joseph Barrow       2009-01-02  1490  		icount =3D &ti=
ocmget->icount;
12c4de4bcc23ec Sebastian Andrzej Siewior 2018-06-20  1491  		spin_lock_irqs=
ave(&serial->serial_lock, flags);
542f5482361491 Denis Joseph Barrow       2009-01-02  1492  		if ((UART_stat=
e_bitmap & B_OVERRUN) !=3D
542f5482361491 Denis Joseph Barrow       2009-01-02  1493  		   (prev_UART_=
state_bitmap & B_OVERRUN))
542f5482361491 Denis Joseph Barrow       2009-01-02  1494  			icount->parit=
y++;
542f5482361491 Denis Joseph Barrow       2009-01-02  1495  		if ((UART_stat=
e_bitmap & B_PARITY) !=3D
542f5482361491 Denis Joseph Barrow       2009-01-02  1496  		   (prev_UART_=
state_bitmap & B_PARITY))
542f5482361491 Denis Joseph Barrow       2009-01-02  1497  			icount->parit=
y++;
542f5482361491 Denis Joseph Barrow       2009-01-02  1498  		if ((UART_stat=
e_bitmap & B_FRAMING) !=3D
542f5482361491 Denis Joseph Barrow       2009-01-02  1499  		   (prev_UART_=
state_bitmap & B_FRAMING))
542f5482361491 Denis Joseph Barrow       2009-01-02  1500  			icount->frame=
++;
542f5482361491 Denis Joseph Barrow       2009-01-02  1501  		if ((UART_stat=
e_bitmap & B_RING_SIGNAL) &&
542f5482361491 Denis Joseph Barrow       2009-01-02  1502  		   !(prev_UART=
_state_bitmap & B_RING_SIGNAL))
542f5482361491 Denis Joseph Barrow       2009-01-02  1503  			icount->rng++;
542f5482361491 Denis Joseph Barrow       2009-01-02  1504  		if ((UART_stat=
e_bitmap & B_BREAK) !=3D
542f5482361491 Denis Joseph Barrow       2009-01-02  1505  		   (prev_UART_=
state_bitmap & B_BREAK))
542f5482361491 Denis Joseph Barrow       2009-01-02  1506  			icount->brk++;
542f5482361491 Denis Joseph Barrow       2009-01-02  1507  		if ((UART_stat=
e_bitmap & B_TX_CARRIER) !=3D
542f5482361491 Denis Joseph Barrow       2009-01-02  1508  		   (prev_UART_=
state_bitmap & B_TX_CARRIER))
542f5482361491 Denis Joseph Barrow       2009-01-02  1509  			icount->dsr++;
542f5482361491 Denis Joseph Barrow       2009-01-02  1510  		if ((UART_stat=
e_bitmap & B_RX_CARRIER) !=3D
542f5482361491 Denis Joseph Barrow       2009-01-02  1511  		   (prev_UART_=
state_bitmap & B_RX_CARRIER))
542f5482361491 Denis Joseph Barrow       2009-01-02  1512  			icount->dcd++;
542f5482361491 Denis Joseph Barrow       2009-01-02  1513  		tiocmget->prev=
_UART_state_bitmap =3D UART_state_bitmap;
12c4de4bcc23ec Sebastian Andrzej Siewior 2018-06-20  1514  		spin_unlock_ir=
qrestore(&serial->serial_lock, flags);
542f5482361491 Denis Joseph Barrow       2009-01-02  1515  		tiocmget->intr=
_completed =3D 1;
542f5482361491 Denis Joseph Barrow       2009-01-02  1516  		wake_up_interr=
uptible(&tiocmget->waitq);
542f5482361491 Denis Joseph Barrow       2009-01-02  1517  	}
542f5482361491 Denis Joseph Barrow       2009-01-02  1518  	memset(serial_s=
tate_notification, 0,
542f5482361491 Denis Joseph Barrow       2009-01-02  1519  	       sizeof(s=
truct hso_serial_state_notification));
542f5482361491 Denis Joseph Barrow       2009-01-02  1520  	tiocmget_submit=
_urb(serial,
542f5482361491 Denis Joseph Barrow       2009-01-02  1521  			    tiocmget,
542f5482361491 Denis Joseph Barrow       2009-01-02  1522  			    serial->p=
arent->usb);
542f5482361491 Denis Joseph Barrow       2009-01-02  1523  }
542f5482361491 Denis Joseph Barrow       2009-01-02  1524 =20

:::::: The code at line 1477 was first introduced by commit
:::::: 542f54823614915780c3459b0e6062f06c0c0f99 tty: Modem functions for th=
e HSO driver

:::::: TO: Denis Joseph Barrow <D.Barow@option.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
