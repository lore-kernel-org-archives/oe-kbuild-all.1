Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FD941B358
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519523; cv=none; b=jXsBvSHew7dPRIPHthX3X7EjpAjBC75cqGKWp2UAIJFn2m6pZkQfWflQum1f+V3bhYkCA2ZCaYnDEpmp6P45bw8wRlSF92DwwauOe1CPjD4KXRm7DtRkXiX/DTw/gMzW7DfLH/IHi6tds57LgQkRxmNF+rmL37f1Bp168uAuANk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519523; c=relaxed/simple;
	bh=oraQC1ngy8yUNC8DO8ykzJf8UuSYUfiqvSZyHz1fWb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mHDN8Q7Prs+i5zA/45uuLGNJ/aSvku4zdEGedbt8w3OZe1++Gn6WQIHQQlIaLNgWOsX22Iv451vQCHHjI022XdXiIwQQn3pJxI8iKk1jmizm+ZCoh7BDPXMkD+8KtcvlJRkAkFMIP0rJm03GfK0w7bU3x+LmqSGotnzsEsiv3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHuZNIbN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHuZNIbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783519522; x=1815055522;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oraQC1ngy8yUNC8DO8ykzJf8UuSYUfiqvSZyHz1fWb0=;
  b=mHuZNIbNvb6ss4V7rVTmdUy+NkcaoIfmjZNLNuMMbsu8K5I8NdPG9cga
   S5AqOAqxkqhAwKGtmztfAHq8aM1FTx3CpBm+SZ4EdrJZ8ir/ApzVQb1uD
   yqR115bhtlDA4vmn05LiC6jvgRXcc/nofFRG2yZNNP4Sw6AbNb3JU3au4
   iN0c11vNDiPOgpKUw1s3sn9142mNs6BqstAM29ace/muBnsecUCUxek3u
   AO778yVV0gz4oUTs3jFqNrgOVcInX1dHTswclwOo/GvFeeCVSD7vIUHzb
   jp00HhHsk2LaaWVc8ktX/xbWOmf896aEa/qmEUW6/ptkvpYXrDG7VWiRk
   A==;
X-CSE-ConnectionGUID: UqW690xXREWenP1p+kdM3A==
X-CSE-MsgGUID: NHsMRyXfRYitts/K9XDxsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87864511"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="87864511"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 07:05:21 -0700
X-CSE-ConnectionGUID: Xex9AlNzTsaN3qhGXQ+mdA==
X-CSE-MsgGUID: cgGpl+MBSVmZlpw5F+5g6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="259204690"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jul 2026 07:05:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whSto-00000000GTf-314m;
	Wed, 08 Jul 2026 14:05:16 +0000
Date: Wed, 08 Jul 2026 22:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 34/69]
 drivers/tty/serial/serial_core.c:1939:1: warning: 'optnone' attribute
 directive ignored
Message-ID: <202607082212.JvXYzx6q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bca=
in/qemu_boot
head:   89efd48e5609f41280973bc49df20ffe80177690
commit: 520783c1a795b1b4bd4c87483c2300e9f8e866c6 [34/69] hexagon: work arou=
nd QEMU uart_port_activate codegen bug
config: nios2-randconfig-002-20260708 (https://download.01.org/0day-ci/arch=
ive/20260708/202607082212.JvXYzx6q-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260708/202607082212.JvXYzx6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607082212.JvXYzx6q-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:1939:1: warning: 'optnone' attribute di=
rective ignored [-Wattributes]
    {
    ^


vim +/optnone +1939 drivers/tty/serial/serial_core.c

1c7b13c4886f5c drivers/tty/serial/serial_core.c Jiri Slaby     2011-11-09  =
1931 =20
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1932  /*
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1933   * Work around QEMU hexagon emulation bug: the conditional
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1934   * memd + dealloc_return packet generated at -O2 corrupts
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1935   * callee-saved registers due to incorrect packet semantics.
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1936   */
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1937  static int __attribute__((optnone))
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1938  uart_port_activate(struct tty_port *port, struct tty_struct *tty)
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22 @=
1939  {
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1940  	struct uart_state *state =3D container_of(port, struct uart_state, p=
ort);
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1941  	struct uart_port *uport;
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1942  	int ret;
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1943 =20
4047b37122d1be drivers/tty/serial/serial_core.c Peter Hurley   2016-04-09  =
1944  	uport =3D uart_port_check(state);
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1945  	if (!uport || uport->flags & UPF_DEAD)
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1946  		return -ENXIO;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1947 =20
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1948  	/*
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1949  	 * Start up the serial port.
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1950  	 */
dcd794c6ed631b drivers/tty/serial/serial_core.c Ilpo J=C3=A4rvinen  2023-01=
-17  1951  	ret =3D uart_startup(tty, state, false);
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1952  	if (ret > 0)
9b5aa54986fc85 drivers/tty/serial/serial_core.c Ilpo J=C3=A4rvinen  2023-01=
-17  1953  		tty_port_set_active(port, true);
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1954 =20
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1955  	return ret;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1956  }
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1957 =20

:::::: The code at line 1939 was first introduced by commit
:::::: b3b57646186400d4f54652ab7bbf55f5764d9467 tty: serial_core: convert u=
art_open to use tty_port_open

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
