Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049C238178
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515781; cv=none; b=OXzcgZHxKnkwNgyD/pj4ugcG/a0dbq9zvKk0nz2q73IJFfRCXhgHkpFSaR5+3nSbWdRWW7NsV6w1xJbeXPQHPcYMX66J3G74RQpSfXydjQC7CC6owUNcmsXnmPEF1HRpSwrSfCJqueF04DQC401FS2zbtnYyD1stfDV2Aa8w5ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515781; c=relaxed/simple;
	bh=EQXIRbIV/Oxiwpd1zAJN8hm28N2QpdIlpTGkvhvMHTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QkRpkKYNYfIbdjWP/hMbb0iyoG9E47zPYKBZLRwWKPfN6wgxUURbB5wJkAY/CReeM/Llp/ZH/l7z92l5Deqjxb7D0orvBfmVuS/7W3W0UTG7Zw6+Z9595LcXwD8NjvX8wwnGzEFfyuMXpwc1I4MOV4VNFf3EgmCVW3khWSLgxSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RabC91Ib; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RabC91Ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769515779; x=1801051779;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EQXIRbIV/Oxiwpd1zAJN8hm28N2QpdIlpTGkvhvMHTA=;
  b=RabC91IbBUlHPvNiQXbqCmDvsqqpMTF4UE7535eVn5M34HY+19mhedXW
   c4/izC/gOCd3XYgj0PBlpS7GQVCkHOZrb7OcVWux+jtsePPuoWUdcaelV
   B/QYO2/MuZcY56LTsQt0N7JlWVeMtQ+dgjyJ2SC0SOlfHH8XKM8GRLWd8
   1j6k2uqhw9cmy+9mdxvSI5vxDlxP6EClRL6zstMLQKB08My3uA8SvenIj
   qzz6eqRn6c6jpp6iAksG4eIhcxZ+397kjLqm2Pl0Ty/goy8FsbozKxpuA
   bJWK8pc6tRAkdjlc2ehE3pn9rscuhs5KLYLMSNXpti1g5GYGmyjTpFnLD
   Q==;
X-CSE-ConnectionGUID: EENt5tiQTVmCVLxoTNgj1g==
X-CSE-MsgGUID: OZk/4n0dS5WbHE0J8W88pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70427990"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70427990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:09:39 -0800
X-CSE-ConnectionGUID: YWyQSLwYQ4WTZ8Qn3zAOXQ==
X-CSE-MsgGUID: emFLy25XTDaSFC0GNgog0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212501548"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2026 04:09:37 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkht0-000000001s5-1pIt;
	Tue, 27 Jan 2026 12:09:34 +0000
Date: Tue, 27 Jan 2026 13:09:19 +0100
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 34/38]
 drivers/tty/serial/serial_core.c:1940:1: warning: 'optnone' attribute
 directive ignored
Message-ID: <202601271345.PNHprJ4h-lkp@intel.com>
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
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: a3b0b5e10734352dc6a204aa0b2c04893ff5187f [34/38] hexagon: work arou=
nd QEMU uart_port_activate codegen bug
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/202601=
27/202601271345.PNHprJ4h-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260127/202601271345.PNHprJ4h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271345.PNHprJ4h-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:1940:1: warning: 'optnone' attribute di=
rective ignored [-Wattributes]
    1940 | {
         | ^


vim +/optnone +1940 drivers/tty/serial/serial_core.c

1c7b13c4886f5c drivers/tty/serial/serial_core.c Jiri Slaby     2011-11-09  =
1932 =20
a3b0b5e1073435 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1933  /*
a3b0b5e1073435 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1934   * Work around QEMU hexagon emulation bug: the conditional
a3b0b5e1073435 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1935   * memd + dealloc_return packet generated at -O2 corrupts
a3b0b5e1073435 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1936   * callee-saved registers due to incorrect packet semantics.
a3b0b5e1073435 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1937   */
a3b0b5e1073435 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
1938  static int __attribute__((optnone))
a3b0b5e1073435 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  =
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
