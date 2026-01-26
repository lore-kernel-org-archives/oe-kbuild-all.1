Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D5262A6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 05:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769404849; cv=none; b=tjW+SRzjhFuxvZL1/hAIlR4Ksdpai52IQpqqVtPzhn6CVEaP6iMVuDiqlySiAksIXMwBlQ/CKZ7YE03Ha5FN8A70ubSDdqAZ9PcjvCey71iieOy5W6E83zmAL62YnT1NZFpFNwICPEm1q4nYwM/We2OPpM47XjdDzMfWH0lT38g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769404849; c=relaxed/simple;
	bh=m/SqDp10g2NrVA6doGfluragC7c1jscZ5Tg7ztaY+e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fmc+CHydbkkiH/q7DAVOC2UFodJEx6sQj1DwSffTzWSvahMPnWWzIUSFoyLprRJOsJZe37UzgB3XbYtZsFfu/CLik23m9l6FmaWsygbhAxzrbhq80wAFAhP31t3/xkybmYsflrayNxxJHwLsE4UJXVorXhuob7Tjc1zOx89Qjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZ1LsIKd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZ1LsIKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769404847; x=1800940847;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=m/SqDp10g2NrVA6doGfluragC7c1jscZ5Tg7ztaY+e4=;
  b=eZ1LsIKdht/7j2r/61rctOJDZpcu6/w/iTulbfYFe4X/r1a2kuFyPY5o
   0XJnqG5LLGG3s8VJKGq5Hg5ZA+nuhw0kG4ajJ/B7QM6AeDxj5ZblRt7/J
   og5NvNFoWwfJ89YvpQUkVZ+7QK4QYlkwEw5X+T0Z2erepq4zyUQxuZAas
   JUZHNUM73ddWuzDpqY0ugmksKJnTlnV0QUGK4p4SH1wGPBryiV8o5g9aL
   X1TIGDyME2lIdmutuLaPp46Zc/eJgs9kNlA0p7DmxssuAcicgK7N0nO9N
   zECX1WrqNhw7xejqOu3NQosWCMAl7MEJmNWgHaps+L4S3D6MZXgt4LNkz
   A==;
X-CSE-ConnectionGUID: xLVGQfbjTtWBSR4R0xjNsg==
X-CSE-MsgGUID: RQrUnT33QgKPgvfBvo5yWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70487473"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70487473"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 21:20:46 -0800
X-CSE-ConnectionGUID: g9dnZ470RL+wvv9r0wVFYg==
X-CSE-MsgGUID: uA29fu3fTveatCinTf4FZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="230549470"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2026 21:20:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkF1m-00000000Wvg-21RU;
	Mon, 26 Jan 2026 05:20:42 +0000
Date: Mon, 26 Jan 2026 13:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 16/17]
 drivers/dax/bus.c:138:28: sparse: sparse: incorrect type in argument 1
 (different modifiers)
Message-ID: <202601261304.nZ0r05dT-lkp@intel.com>
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
config: sh-randconfig-r132-20260126 (https://download.01.org/0day-ci/archiv=
e/20260126/202601261304.nZ0r05dT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260126/202601261304.nZ0r05dT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261304.nZ0r05dT-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dax/bus.c:19:1: sparse: sparse: symbol 'dax_region_rwsem' was no=
t declared. Should it be static?
   drivers/dax/bus.c:25:1: sparse: sparse: symbol 'dax_dev_rwsem' was not d=
eclared. Should it be static?
>> drivers/dax/bus.c:138:28: sparse: sparse: incorrect type in argument 1 (=
different modifiers) @@     expected struct device_driver *drv @@     got s=
truct device_driver const * @@
   drivers/dax/bus.c:138:28: sparse:     expected struct device_driver *drv
   drivers/dax/bus.c:138:28: sparse:     got struct device_driver const *
   drivers/dax/bus.c:145:28: sparse: sparse: incorrect type in argument 1 (=
different modifiers) @@     expected struct device_driver *drv @@     got s=
truct device_driver const * @@
   drivers/dax/bus.c:145:28: sparse:     expected struct device_driver *drv
   drivers/dax/bus.c:145:28: sparse:     got struct device_driver const *
--
>> drivers/usb/core/driver.c:134:38: sparse: sparse: incorrect type in init=
ializer (different modifiers) @@     expected struct usb_driver *usb_drv @@=
     got struct usb_driver const * @@
   drivers/usb/core/driver.c:134:38: sparse:     expected struct usb_driver=
 *usb_drv
   drivers/usb/core/driver.c:134:38: sparse:     got struct usb_driver cons=
t *
   drivers/usb/core/driver.c:142:38: sparse: sparse: incorrect type in init=
ializer (different modifiers) @@     expected struct usb_driver *usb_drv @@=
     got struct usb_driver const * @@
   drivers/usb/core/driver.c:142:38: sparse:     expected struct usb_driver=
 *usb_drv
   drivers/usb/core/driver.c:142:38: sparse:     got struct usb_driver cons=
t *
>> drivers/usb/core/driver.c:155:41: sparse: sparse: incorrect type in init=
ializer (different modifiers) @@     expected struct usb_driver *usb_driver=
 @@     got struct usb_driver const * @@
   drivers/usb/core/driver.c:155:41: sparse:     expected struct usb_driver=
 *usb_driver
   drivers/usb/core/driver.c:155:41: sparse:     got struct usb_driver cons=
t *
--
>> drivers/usb/serial/bus.c:109:45: sparse: sparse: incorrect type in initi=
alizer (different modifiers) @@     expected struct usb_serial_driver *usb_=
drv @@     got struct usb_serial_driver const * @@
   drivers/usb/serial/bus.c:109:45: sparse:     expected struct usb_serial_=
driver *usb_drv
   drivers/usb/serial/bus.c:109:45: sparse:     got struct usb_serial_drive=
r const *
   drivers/usb/serial/bus.c:123:45: sparse: sparse: incorrect type in initi=
alizer (different modifiers) @@     expected struct usb_serial_driver *usb_=
drv @@     got struct usb_serial_driver const * @@
   drivers/usb/serial/bus.c:123:45: sparse:     expected struct usb_serial_=
driver *usb_drv
   drivers/usb/serial/bus.c:123:45: sparse:     got struct usb_serial_drive=
r const *

vim +138 drivers/dax/bus.c

d200781ef237a3 Dan Williams     2018-11-07  134 =20
445ba0f479b21c Thomas Wei=C3=9Fschuh 2026-01-25  135  static ssize_t new_id=
_store(const struct device_driver *drv, const char *buf,
d200781ef237a3 Dan Williams     2018-11-07  136  		size_t count)
d200781ef237a3 Dan Williams     2018-11-07  137  {
6488e1afce77b1 Thomas Wei=C3=9Fschuh 2026-01-25 @138  	return do_id_store(p=
tr_unqual(drv), buf, count, ID_ADD);
d200781ef237a3 Dan Williams     2018-11-07  139  }
d200781ef237a3 Dan Williams     2018-11-07  140  static DRIVER_ATTR_WO(new_=
id);
d200781ef237a3 Dan Williams     2018-11-07  141 =20

:::::: The code at line 138 was first introduced by commit
:::::: 6488e1afce77b1f23ff40dde7ded5df3f0fd789f dax: ptr_unqual

:::::: TO: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
:::::: CC: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
