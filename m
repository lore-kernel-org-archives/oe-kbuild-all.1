Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E33E40FDAD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385705; cv=none; b=bQZ8ZWXZFMhQJ/mGCg2hJ5ac1+PEKKyOTe0zIPFHhMXTG9/AlEvH25VZPcXeEKUq1SQ+sUPHjcLmG7jX+XcluNCZmXZMhjnHDywCJeAgt5BiAgF0IHhDJ5/OYnfQcYJX0ozmF0+OtZ9eaUl84czc4FgtxEsZAMd1VpfeOXE5E5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385705; c=relaxed/simple;
	bh=SmOLG+anIgF1SGzQ6pgO1W9YxZey2PvLLoZYQ/HNZNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sR4RfofToYsNmfxY0S1+PTyVx2ejdZceOp2wEweenH2RpFA+kDcnYkhL/jFekTU65gxUWLj951KUxcPFQKBf9tOD8lhREaCEubrUuw7yHr04dlIDophax2QzY6Ym1VwUr7XyRTOZ+mUSx59QOwzz81CoCK/SiElV1Bg7pQsWxN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/Ye/C3X; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/Ye/C3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777385703; x=1808921703;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SmOLG+anIgF1SGzQ6pgO1W9YxZey2PvLLoZYQ/HNZNY=;
  b=M/Ye/C3XRcPpluQcGsMMklwAx0PtI9IL194jnszRiDfIubHTGWBgAV3p
   728JQOK3cCvwZ4vK3pbx/L1StkMfmlsEuzw85FGHvP01rVTGd0Y7+shfw
   Ck5F0lJd5uZUM3itgMPXZPMWHj0EgDxic3cnxzOV5jpRZxZccnHWTqDGg
   /jN/X2vYORKw/H8PnGELEZ/mL7O7RkyjCM7vjqItIDjFWtmZwIyCOP8zC
   qNTjBis4WTYr9e/ppkdJw+j6G3i2vyIZatEA2ivO3DA4MaaRbdV8cjIel
   6J9ShLaZR6Xc2TJ02pHUWpDqYGsCgiRpdR4gjiw0pW+HKGDtaBScuGAWr
   w==;
X-CSE-ConnectionGUID: jkIfFCNwTxuNDuzeJolnuw==
X-CSE-MsgGUID: b6cUw0vzS3656WtzAWZPEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78278767"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78278767"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 07:15:01 -0700
X-CSE-ConnectionGUID: EeV+Mhs8SOWOkbzTFhS7gA==
X-CSE-MsgGUID: EaPCcGg4TXOKyA99a/sETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="229394489"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2026 07:14:59 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHjDF-000000009sG-2hrQ;
	Tue, 28 Apr 2026 14:14:57 +0000
Date: Tue, 28 Apr 2026 22:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/hmx 34/66]
 drivers/tty/serial/serial_core.c:1940:1: warning: 'optnone' attribute
 directive ignored
Message-ID: <202604282221.hTze3sds-lkp@intel.com>
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
in/hmx
head:   1d0fb0b4cf1764f00775cff1c17c2b3494b6b94e
commit: 02dae980d1d802c25ce0094ce029db34e6dff330 [34/66] hexagon: work arou=
nd QEMU uart_port_activate codegen bug
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260428=
/202604282221.hTze3sds-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260428/202604282221.hTze3sds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604282221.hTze3sds-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:1940:1: warning: 'optnone' attribute di=
rective ignored [-Wattributes]
    1940 | {
         | ^


vim +/optnone +1940 drivers/tty/serial/serial_core.c

1c7b13c4886f5c drivers/tty/serial/serial_core.c Jiri Slaby     2011-11-09  =
1932 =20
02dae980d1d802 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1933  /*
02dae980d1d802 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1934   * Work around QEMU hexagon emulation bug: the conditional
02dae980d1d802 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1935   * memd + dealloc_return packet generated at -O2 corrupts
02dae980d1d802 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1936   * callee-saved registers due to incorrect packet semantics.
02dae980d1d802 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1937   */
02dae980d1d802 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1938  static int __attribute__((optnone))
02dae980d1d802 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1939  uart_port_activate(struct tty_port *port, struct tty_struct *tty)
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22 @=
1940  {
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1941  	struct uart_state *state =3D container_of(port, struct uart_state, p=
ort);
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1942  	struct uart_port *uport;
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1943  	int ret;
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1944 =20
4047b37122d1be drivers/tty/serial/serial_core.c Peter Hurley   2016-04-09  =
1945  	uport =3D uart_port_check(state);
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1946  	if (!uport || uport->flags & UPF_DEAD)
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1947  		return -ENXIO;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1948 =20
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1949  	/*
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1950  	 * Start up the serial port.
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1951  	 */
dcd794c6ed631b drivers/tty/serial/serial_core.c Ilpo J=C3=A4rvinen  2023-01=
-17  1952  	ret =3D uart_startup(tty, state, false);
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1953  	if (ret > 0)
9b5aa54986fc85 drivers/tty/serial/serial_core.c Ilpo J=C3=A4rvinen  2023-01=
-17  1954  		tty_port_set_active(port, true);
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1955 =20
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1956  	return ret;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1957  }
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1958 =20

:::::: The code at line 1940 was first introduced by commit
:::::: b3b57646186400d4f54652ab7bbf55f5764d9467 tty: serial_core: convert u=
art_open to use tty_port_open

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
