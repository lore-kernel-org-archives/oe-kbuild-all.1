Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027683164C5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769356212; cv=none; b=dSEnUti6YbV3QdNy8305sJYiwGBDqDOoQAAE9cxfPdOOaaKLEV2+qNFV9Wb236KxmG764AgtP76xM/ubcB/xwdaEVOxsqkaCKwnrrYhvD1WxfXRjVvFaDldxgP+Gt8OdXROTsq/o5zILoIzG6Lxz33YL+SCIpEksz8sc8eErMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769356212; c=relaxed/simple;
	bh=weuvHyBpLxBxGtR3yHoAfWMUTIGaF+Uo/7hp4Ff9lRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mFk5qJONSWxEiDdRJmkNxN4SUtaf7kgtXAWdo01iR9OHjKIKWtFMs5HIuSxrjkEEQT4TYsN1DNonKhq9JQjxlnKVC9TdOUiMTH0LYkKSXlM/s+ab0EJgkrOy9aDOWDkxS2N5MMeQ3HZ4ihqsNLTAhgcl+RIoQ1XifSa0bdklrx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dr0c4BEa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dr0c4BEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769356211; x=1800892211;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=weuvHyBpLxBxGtR3yHoAfWMUTIGaF+Uo/7hp4Ff9lRw=;
  b=Dr0c4BEaDOkcgHgQ48JLri/MrHrxJIeXHZw1wSedDSS63sjP0Xh+uFCq
   ZDiU1o8pztkcTFn15+fA8mIAJu+CYi8DxLw7h5AXQFkxVdfSuOBZbwJIz
   h0S4JsdPdkYSJrjh9g9lR7ijR7qenTtE4npISZ/HbjNohAR7UJEkwo5FJ
   nM4lo20aUS2Pgp2Khe1Zu8T+9v16WhqYQj7XhRMA+STjZWL0QS893cQVT
   dnP0xXwPn91fRy1Z5WWhmnkRZOD2NnP87nN7fV8EFxlrQ46hOU15b/r5D
   OVopM2cLegB+kN3Qdx+puHYBokNZJiTYp30o8+A6ACh/ftr/j31pIPSXs
   g==;
X-CSE-ConnectionGUID: DZcoJy0kRdSUKVirML43nA==
X-CSE-MsgGUID: 5R9QKb+ORpSmXWFY9U4Vpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70451474"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70451474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 07:50:10 -0800
X-CSE-ConnectionGUID: a8SHuUVyTp6wj++O/oA0vg==
X-CSE-MsgGUID: riNIZYrwR7WWGc3byJlx/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207375104"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2026 07:50:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk2NK-00000000W7L-2yUi;
	Sun, 25 Jan 2026 15:50:06 +0000
Date: Sun, 25 Jan 2026 23:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 16/17]
 include/linux/compiler.h:253:26: warning: initialization discards 'const'
 qualifier from pointer target type
Message-ID: <202601252330.ScrOAVDI-lkp@intel.com>
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
config: sparc64-randconfig-001-20260125 (https://download.01.org/0day-ci/ar=
chive/20260125/202601252330.ScrOAVDI-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601252330.ScrOAVDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252330.ScrOAVDI-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from drivers/usb/core/driver.c:28:
   drivers/usb/core/driver.c: In function 'new_id_show':
>> include/linux/compiler.h:253:26: warning: initialization discards 'const=
' qualifier from pointer target type [-Wdiscarded-qualifiers]
     253 | #define ptr_unqual(_ptr) ((TYPEOF_UNQUAL(*(_ptr)) *)(_ptr))
         |                          ^
   drivers/usb/core/driver.c:134:38: note: in expansion of macro 'ptr_unqua=
l'
     134 |         struct usb_driver *usb_drv =3D ptr_unqual(to_usb_driver(=
driver));
         |                                      ^~~~~~~~~~
   drivers/usb/core/driver.c: In function 'new_id_store':
>> include/linux/compiler.h:253:26: warning: initialization discards 'const=
' qualifier from pointer target type [-Wdiscarded-qualifiers]
     253 | #define ptr_unqual(_ptr) ((TYPEOF_UNQUAL(*(_ptr)) *)(_ptr))
         |                          ^
   drivers/usb/core/driver.c:142:38: note: in expansion of macro 'ptr_unqua=
l'
     142 |         struct usb_driver *usb_drv =3D ptr_unqual(to_usb_driver(=
driver));
         |                                      ^~~~~~~~~~
   drivers/usb/core/driver.c: In function 'remove_id_store':
>> include/linux/compiler.h:253:26: warning: initialization discards 'const=
' qualifier from pointer target type [-Wdiscarded-qualifiers]
     253 | #define ptr_unqual(_ptr) ((TYPEOF_UNQUAL(*(_ptr)) *)(_ptr))
         |                          ^
   drivers/usb/core/driver.c:155:41: note: in expansion of macro 'ptr_unqua=
l'
     155 |         struct usb_driver *usb_driver =3D ptr_unqual(to_usb_driv=
er(driver));
         |                                         ^~~~~~~~~~


vim +/const +253 include/linux/compiler.h

ac053946f5c40c Uros Bizjak      2025-01-27  252 =20
050e991b39389f Thomas Wei=C3=9Fschuh 2026-01-25 @253  #define ptr_unqual(_p=
tr) ((TYPEOF_UNQUAL(*(_ptr)) *)(_ptr))
050e991b39389f Thomas Wei=C3=9Fschuh 2026-01-25  254 =20

:::::: The code at line 253 was first introduced by commit
:::::: 050e991b39389f7ff8ed2529193bac1f1a3a91ea ptr_unqual()

:::::: TO: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
:::::: CC: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
