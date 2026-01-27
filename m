Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF86334320A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510545; cv=none; b=Kh8YX9zsDDOz+KCfrgyDj/lQXoa+WArH2wq/IMbux06Odrz1WLmFMjf5FqcHOY4A5kEA3GprCXnk+twDUMjurFxzGZyjrdbuwAU0Qzw0fKf+Ju4vixr8X3uJylPZi+nd9MBImVmnENyj5YBfp1ZDRkPwbTivmsMtxUDpruQCm5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510545; c=relaxed/simple;
	bh=gSqNemBd0PR8B3jO7ewdHUoRSynu+khvBHQdpE+xdX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LpeIIxvG0+2IM8/mUo0FYoWlT6uuaV/DCvTbEQK3GqK3X3dnTJ3tgtPzc5a5NJBSJEZxj+Sfmpd4+6HG1nn16HBt+aXVJGzyxS4/qL0UOc7GCIX8vnEEwxynKJfpMXB9qz59wdHhWjrgLSszU7UQr87yef6p7/fm6Nd0z+abYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHsfXoqr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHsfXoqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769510541; x=1801046541;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gSqNemBd0PR8B3jO7ewdHUoRSynu+khvBHQdpE+xdX8=;
  b=PHsfXoqreYP1PueZj80d1N4VjfOfGeYq3+1Yh4kOpUrMgRjpgKyZYV0w
   w0gKZCRqGqZhlzGy+kOh482XE8n9yPCMV/cpFA1aTxOXIKbH9SGclBe1F
   5+2p+oNMyU9N0e7BzzHXXGuZhmV/q4ygj2vwBwM9j80yH051WOP1t3cYV
   F5h6ME0tmW0cio4cVYIHkjRnyrES6BVsgt5XrYRK9898iTNMMN92LmHQ0
   GTsHB30qKZzqoJBPPgtONX/iZ7KGu1ni4gdJSjgUnFqOzMPJh5LpJgvfr
   zCEWkpMm3m4+yBI+atz2063ylDYntb56xyRrF9xiENv38QYwO6N1jVl/J
   w==;
X-CSE-ConnectionGUID: fgXcRmxST26eeSCYE6cFkw==
X-CSE-MsgGUID: Ciqd4lC7Rg+XZAK0esJD8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96166280"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="96166280"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:42:20 -0800
X-CSE-ConnectionGUID: aRUzkE+9SP6uooRnmp6uHA==
X-CSE-MsgGUID: oFgcNYf0Sd6XQYbQH2lr9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208374244"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jan 2026 02:42:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkgWW-00000000YLg-1BOS;
	Tue, 27 Jan 2026 10:42:16 +0000
Date: Tue, 27 Jan 2026 18:41:28 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 34/38]
 drivers/tty/serial/serial_core.c:1940:1: warning: 'optnone' attribute
 directive ignored
Message-ID: <202601271805.pHjwD2rS-lkp@intel.com>
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
config: openrisc-randconfig-r073-20260127 (https://download.01.org/0day-ci/=
archive/20260127/202601271805.pHjwD2rS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260127/202601271805.pHjwD2rS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271805.pHjwD2rS-lkp@i=
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
