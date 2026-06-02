Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E88392C32
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 20:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433972; cv=none; b=q8+tEjXpJhcnMgmdcboXSbRJ2sNB/ZSUqPSz9ro3iAREoXq0ZpSW9X18/d+nmj6Y9/t7VDTwOfI4272toE+GuFOkUQSd8JKyqe7Mtrz9GpXmLkFFUFoUXkOfAGpXhshf5vkCj/yJIxOPYi31Zi4VoUAVxJk/RkTTd7g0TSfZ5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433972; c=relaxed/simple;
	bh=+1CnGK300WWFt3AJ4FWCfAzCr6oV3MfPrikRKEaRTco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZJBvBGt/GCF6/rzFzNhHyrLpu6iGNOdX682kwohvUSF3pwLjn/nR0dfQ+CQonvLwW2Ia9tfyCNTHVJ4TjEaXSSwDGDGDiut8H/LlGlJn4CGBV9pzj6ctN+jpCS8w3RfD5twNA7o7VDWKQP3TUHesPKp/VWiz4BshPDh4E+ga3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHhYinvI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHhYinvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780433970; x=1811969970;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+1CnGK300WWFt3AJ4FWCfAzCr6oV3MfPrikRKEaRTco=;
  b=EHhYinvIK5SSpjlNKItebwBdcJOiPZUmFCm7U4L4HLU42eThQEtIU6ux
   UtlBu0fhT5uvNE7xR08NrwcjntM9YWVCdUi/IC58K+/8vVvAzWDxcKGbc
   cg7NaM6x4X5l4nOtogHfEj0I+4QkJn9B1Er4v4j8I2nE6sz16NtuJS1Cy
   6emHshXbgnNIun28DOXQHxIx+ERGk9IHVgXfkYgY9GQjAeFJEPEJREO6n
   a00BjnaozvH/dZMmecAYC0AEcPKrweY1PpoFmnxEPdOQlyKby7QkUlU8c
   pPIIEFoL1b7q6UuSzXJy+HHMdLfIKcJi+4fcYARICsxZAg6tsN/aTWJMj
   g==;
X-CSE-ConnectionGUID: cS+0pj9ARC2Gxp0QqqVGiA==
X-CSE-MsgGUID: Mwc79CjzTvOraVNP/R0Czg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81091758"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81091758"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 13:59:29 -0700
X-CSE-ConnectionGUID: iFy7ETdSQO+koak248GMwg==
X-CSE-MsgGUID: WGeOUzDRQFq6ufVhartyyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="244103650"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jun 2026 13:59:27 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUWCq-00000000CVi-3Io4;
	Tue, 02 Jun 2026 20:59:24 +0000
Date: Wed, 03 Jun 2026 04:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 34/45]
 drivers/tty/serial/serial_core.c:1943:1: warning: 'optnone' attribute
 directive ignored
Message-ID: <202606030443.VPwkJP55-lkp@intel.com>
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
in/boot_qemu
head:   b39dc087b7930287802c7d4fd54d5ddc11068b90
commit: e5e55349c5f8c59a06d5cb1f42d8f463a7843067 [34/45] hexagon: work arou=
nd QEMU uart_port_activate codegen bug
config: arm-randconfig-001-20260603 (https://download.01.org/0day-ci/archiv=
e/20260603/202606030443.VPwkJP55-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260603/202606030443.VPwkJP55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030443.VPwkJP55-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:1943:1: warning: 'optnone' attribute di=
rective ignored [-Wattributes]
    1943 | {
         | ^


vim +/optnone +1943 drivers/tty/serial/serial_core.c

1c7b13c4886f5c drivers/tty/serial/serial_core.c Jiri Slaby     2011-11-09  =
1935 =20
e5e55349c5f8c5 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1936  /*
e5e55349c5f8c5 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1937   * Work around QEMU hexagon emulation bug: the conditional
e5e55349c5f8c5 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1938   * memd + dealloc_return packet generated at -O2 corrupts
e5e55349c5f8c5 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1939   * callee-saved registers due to incorrect packet semantics.
e5e55349c5f8c5 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1940   */
e5e55349c5f8c5 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1941  static int __attribute__((optnone))
e5e55349c5f8c5 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1942  uart_port_activate(struct tty_port *port, struct tty_struct *tty)
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22 @=
1943  {
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1944  	struct uart_state *state =3D container_of(port, struct uart_state, p=
ort);
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1945  	struct uart_port *uport;
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1946  	int ret;
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1947 =20
4047b37122d1be drivers/tty/serial/serial_core.c Peter Hurley   2016-04-09  =
1948  	uport =3D uart_port_check(state);
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1949  	if (!uport || uport->flags & UPF_DEAD)
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  =
1950  		return -ENXIO;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1951 =20
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1952  	/*
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1953  	 * Start up the serial port.
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1954  	 */
dcd794c6ed631b drivers/tty/serial/serial_core.c Ilpo J=C3=A4rvinen  2023-01=
-17  1955  	ret =3D uart_startup(tty, state, false);
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1956  	if (ret > 0)
9b5aa54986fc85 drivers/tty/serial/serial_core.c Ilpo J=C3=A4rvinen  2023-01=
-17  1957  		tty_port_set_active(port, true);
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1958 =20
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  =
1959  	return ret;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1960  }
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  =
1961 =20

:::::: The code at line 1943 was first introduced by commit
:::::: b3b57646186400d4f54652ab7bbf55f5764d9467 tty: serial_core: convert u=
art_open to use tty_port_open

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
