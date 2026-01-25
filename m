Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AF1324707
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355554; cv=none; b=P1K+OMBNw66X+iTCwW9V0H+Fhu+XWXtuLAHj/WL1VkTJ9j/n85KE1a+NXBz+LIFb9C454CBq2E29gHqxXRcuwVPqtrV6NPIORoxLBmnlIZpthFHYgRF1bbh5QOWFJ101Emo36G7JC7GW/ZKGqAW9GEU6sOol8T9+oOvkyEWeq14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355554; c=relaxed/simple;
	bh=4VVXQqTKA5vGP/nuABHPSluJLZL5/rgrogCnS22X98E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WLtcznsF9eduLrRlatMOyrljYTk2hmvH49HJxqlt/LFjJluZgffAiGeX2P8Hebk5XjbBccLygLTqGuR2BRL2gXg1u/PSP6IbMVYxWyJc5OIP+rXW5itLtHs9oYfMNkrgTG+IS3ZgsOJDvEi5SIjXD9MznejApyeSMcQ3e2A3RW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hILn6y2V; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hILn6y2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769355553; x=1800891553;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4VVXQqTKA5vGP/nuABHPSluJLZL5/rgrogCnS22X98E=;
  b=hILn6y2VzOg7VT1mQPSH7jcPd4thDWQjZM3I+1KSb02UvCqEy5iHfG2C
   cggcX4OyIcErfyT3fhmSldkasZuj14VytErpiwuFZfqPMHi4bfFeOBCH0
   7yekznETcVkd0a2jvPbiDNU7U5hRBw1CcUGnOF3rOn+GIf5tqTjSLGXsB
   WjsPe2hRbB54P3c2wP3fC0P7l3pHOYmI1ebV+H1d/miOSA9TV76QVLmAq
   vk6v8vxN6/heUc1DdtfgctdKplLZzcRh1TXdkd4Tad9ioYm5Ix/O0eaEr
   jJjJCI0p4ITFkhn2wIYdvYQbcdvBACY7NCq0zMOUNLbjfcgfwlj98+UFP
   Q==;
X-CSE-ConnectionGUID: Rs3zBS/MRRm640wWJxSe9Q==
X-CSE-MsgGUID: hwXLnnAmSjOaEv25Ep9sYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="87962627"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="87962627"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 07:39:11 -0800
X-CSE-ConnectionGUID: buY9dGjsTbOfOwGLEmVyHQ==
X-CSE-MsgGUID: GXIcSzslSHuwY13gg0xyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207079815"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jan 2026 07:39:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk2Cg-00000000W6y-2BDJ;
	Sun, 25 Jan 2026 15:39:06 +0000
Date: Sun, 25 Jan 2026 23:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 16/17]
 drivers/input/gameport/gameport.c:712:26: error: initializing 'struct
 gameport_driver *' with an expression of type 'const struct gameport_driver
 *' discards qualifiers
Message-ID: <202601252301.ge0ljNZI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/sysfs-const-driver-attribute
head:   92cff81ee317b9c2c7c4e3bb80f46c9feddbfa9d
commit: 445ba0f479b21cc9310a99aefa9de3d53559eeb0 [16/17] x
config: x86_64-randconfig-r073-20260125 (https://download.01.org/0day-ci/ar=
chive/20260125/202601252301.ge0ljNZI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601252301.ge0ljNZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252301.ge0ljNZI-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/input/gameport/gameport.c:712:26: error: initializing 'struct ga=
meport_driver *' with an expression of type 'const struct gameport_driver *=
' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualif=
iers]
     712 |         struct gameport_driver *driver =3D to_gameport_driver(dr=
v);
         |                                 ^        ~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/input/serio/serio.c:707:23: error: initializing 'struct serio_dr=
iver *' with an expression of type 'const struct serio_driver *' discards q=
ualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     707 |         struct serio_driver *driver =3D to_serio_driver(drv);
         |                              ^        ~~~~~~~~~~~~~~~~~~~~
   drivers/input/serio/serio.c:714:23: error: initializing 'struct serio_dr=
iver *' with an expression of type 'const struct serio_driver *' discards q=
ualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     714 |         struct serio_driver *serio_drv =3D to_serio_driver(drv);
         |                              ^           ~~~~~~~~~~~~~~~~~~~~
   drivers/input/serio/serio.c:720:23: error: initializing 'struct serio_dr=
iver *' with an expression of type 'const struct serio_driver *' discards q=
ualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     720 |         struct serio_driver *serio_drv =3D to_serio_driver(drv);
         |                              ^           ~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +712 drivers/input/gameport/gameport.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  704 =20
^1da177e4c3f41 Linus Torvalds   2005-04-16  705 =20
^1da177e4c3f41 Linus Torvalds   2005-04-16  706  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  707   * Gameport driver operati=
ons
^1da177e4c3f41 Linus Torvalds   2005-04-16  708   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  709 =20
445ba0f479b21c Thomas Wei=C3=9Fschuh 2026-01-25  710  static ssize_t descri=
ption_show(const struct device_driver *drv, char *buf)
^1da177e4c3f41 Linus Torvalds   2005-04-16  711  {
^1da177e4c3f41 Linus Torvalds   2005-04-16 @712  	struct gameport_driver *d=
river =3D to_gameport_driver(drv);
^1da177e4c3f41 Linus Torvalds   2005-04-16  713  	return sprintf(buf, "%s\n=
", driver->description ? driver->description : "(none)");
^1da177e4c3f41 Linus Torvalds   2005-04-16  714  }
445ba0f479b21c Thomas Wei=C3=9Fschuh 2026-01-25  715  static const DRIVER_A=
TTR_RO(description);
^1da177e4c3f41 Linus Torvalds   2005-04-16  716 =20

:::::: The code at line 712 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
