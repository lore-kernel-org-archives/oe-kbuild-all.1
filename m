Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D398148F83D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 18:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731229; cv=none; b=RCeLaXFP8Lg/s/pOe6AaHZWJe+dBe8lBXg+7YhEklrI2Yz5lf14sNeyDH01+fjobSSP73uN/q25gjlpi+48L7G1WhKEqBdTpxdGrKsGSozhalzNXVydezvWroSuPyYos+98AthOVsFNwkPXbtRXGQb2QLK9HeSyWLPzUCspkFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731229; c=relaxed/simple;
	bh=yQxUVMABbjhrvOigwmA5d7fGFyUsx4J25VFDrAPK/1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mb+gTLvtu4eNIO2J4w3vfnyQwDrtepTxtxye4N+gwhr/rYOMr1+sC8Zwn23m9bRNatq2dXw2Z8KPFSFvIilGv7RJAa5PmOV3QtKq1TADXlU7FP6j2QqFwf01PB0Nip5jg05qshRIuBG93YfjuCpxCzFghREplx40JhuCL+jznlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRyqhw5N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRyqhw5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786731227; x=1818267227;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yQxUVMABbjhrvOigwmA5d7fGFyUsx4J25VFDrAPK/1o=;
  b=hRyqhw5NzTvmiiwIXHloSfbvSQeqeBcmK4dssP5LeAlK64ikAq/T6+lY
   H3AAgR4Y771jIneZiwY5KbOdQrEd6Ehk5kR1i7cn6Y3d4FNYgxPkwuoNA
   hW8rrMeg8Cyqty7UFVaKlQiCLn+8p7gSUROeMNGxtnf3wrE5DS+yY1iuw
   R5h6wpFLk5jaaMtCVCQTHmPl8cNA5Z/mTJ6OpJQIIIIpLPi+DrrfQ9n74
   4Ze5jYfF4wa0tDfM0H29mvTeFDGeqY73KUi9tjdcm7T58gnEH6Iiwl0PX
   0kldR278sZQOkvvaTl0H4BVpLdzx/UlD2i5TG11tlzh7aGFrlQkVxIzrJ
   w==;
X-CSE-ConnectionGUID: j3XsxUwTRRSvmJ9V7NGSbQ==
X-CSE-MsgGUID: kyctA3cHTjGmFdDfpP+7hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98829035"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98829035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 11:13:46 -0700
X-CSE-ConnectionGUID: 4WbQgbTSSbe3tdpSZarJkw==
X-CSE-MsgGUID: rU3sGGerR3CQtR3voy0bww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="294213554"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 14 Aug 2026 11:13:45 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuwPW-000000006Iz-2Euf;
	Fri, 14 Aug 2026 18:13:42 +0000
Date: Fri, 14 Aug 2026 20:13:10 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 34/87]
 drivers/tty/serial/serial_core.c:1939:1: warning: 'optnone' attribute
 directive ignored
Message-ID: <202608142032.jgN7nmru-lkp@intel.com>
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
head:   f5debfeae808bae06ccbc26605a5c1404eba2588
commit: 520783c1a795b1b4bd4c87483c2300e9f8e866c6 [34/87] hexagon: work arou=
nd QEMU uart_port_activate codegen bug
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/202608=
14/202608142032.jgN7nmru-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260814/202608142032.jgN7nmru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608142032.jgN7nmru-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:1939:1: warning: 'optnone' attribute di=
rective ignored [-Wattributes]
    1939 | {
         | ^


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
