Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FEC22F74A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 06:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769407315; cv=none; b=junIHvv2GCcqmUgM/+QsFXxCyFD1Kxu5gkpDX2DmznQ2tIEOKfeBXcG66QYZVjH0I7czji39B0diV50d5itYy1tr2ZR2F57nlPckipVMV4NHzy0AcTtEwI0Xru7Z95lxrFso4gPIVRx2K4czV5W2GVAZ3JU0/Sh1TZb1olzp/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769407315; c=relaxed/simple;
	bh=zfJms8HVFIfaIizz5BmAoF1CMsRoguti44/YqgZ36Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DBtf0lw3BN90angHDL46m8NHPZCDYwigLjU1UzsUDM5nTeTarbzyVLOjh+7NO3hsk+yddngXD5oWRXL2EyKjmHtUN2922qbW/MEt9RM1WKTTnMoYyMWS9a4gvKHpd43/pnjoaevpqWM+izjybNyoFlw9hQ2iu9qnMdK9T/YlP1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OumMmVCN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OumMmVCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769407314; x=1800943314;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zfJms8HVFIfaIizz5BmAoF1CMsRoguti44/YqgZ36Hw=;
  b=OumMmVCNZrH0s5HlkAX2uiFysw8DW+GcWiONn5E23zj1YZx5SsrSaJpp
   Na53hT0FqqU6J+WJkTWo/YwP8Fz8x9sNcJGedDSA50FXdhkj/Ek4HDuQe
   6sg9wH30GGNtUQVUATGExuAfHNlXALTRqN79LRT6KlE7ipH6Ceozxu2Gs
   3JFDMMqMDHw1MmwoK6QvuBTxsN1a1mPWoT6AKoa/Wxiu9iX0DtOhbWWna
   4+IXZJ1b6ytuxdEoN3T+entDx0eGbNXL5wmA02bgnH8VjW1cllcPvE5AA
   O5cj+idhaGtW5NEhSepBn/IsmpSewJj1GKnqdctnQcD0m1i8zAHJ5Q4+O
   A==;
X-CSE-ConnectionGUID: 2YQFCpOeRLS4xfJU3DrqTg==
X-CSE-MsgGUID: uq77xzFgSI6EBnpTxoiDNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="96048942"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="96048942"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:01:52 -0800
X-CSE-ConnectionGUID: NM0E9PPnTGC+fQVc5jUOeA==
X-CSE-MsgGUID: OzRgfu+5RfW9Mq3XgJqh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="206718574"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Jan 2026 22:01:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkFfY-00000000WyJ-0HbU;
	Mon, 26 Jan 2026 06:01:48 +0000
Date: Mon, 26 Jan 2026 14:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 16/17]
 drivers/pci/pci-driver.c:191:35: sparse: sparse: incorrect type in
 initializer (different modifiers)
Message-ID: <202601261322.C9yNgO6e-lkp@intel.com>
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
config: i386-randconfig-061-20260126 (https://download.01.org/0day-ci/archi=
ve/20260126/202601261322.C9yNgO6e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260126/202601261322.C9yNgO6e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261322.C9yNgO6e-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/pci-driver.c:191:35: sparse: sparse: incorrect type in initi=
alizer (different modifiers) @@     expected struct pci_driver *pdrv @@    =
 got struct pci_driver const * @@
   drivers/pci/pci-driver.c:191:35: sparse:     expected struct pci_driver =
*pdrv
   drivers/pci/pci-driver.c:191:35: sparse:     got struct pci_driver const=
 *
   drivers/pci/pci-driver.c:260:35: sparse: sparse: incorrect type in initi=
alizer (different modifiers) @@     expected struct pci_driver *pdrv @@    =
 got struct pci_driver const * @@
   drivers/pci/pci-driver.c:260:35: sparse:     expected struct pci_driver =
*pdrv
   drivers/pci/pci-driver.c:260:35: sparse:     got struct pci_driver const=
 *
   drivers/pci/pci-driver.c:520:42: sparse: sparse: restricted pci_power_t =
degrades to integer
   drivers/pci/pci-driver.c:520:61: sparse: sparse: restricted pci_power_t =
degrades to integer

vim +191 drivers/pci/pci-driver.c

1f40704bb01b9fb Zhenzhong Duan        2020-11-17  179 =20
^1da177e4c3f415 Linus Torvalds        2005-04-16  180  /**
2f0cd59c6ff91b4 Mauro Carvalho Chehab 2020-10-23  181   * new_id_store - sy=
sfs frontend to pci_add_dynid()
8f7020d36374dda Randy Dunlap          2005-10-23  182   * @driver: target d=
evice driver
8f7020d36374dda Randy Dunlap          2005-10-23  183   * @buf: buffer for =
scanning device ID data
8f7020d36374dda Randy Dunlap          2005-10-23  184   * @count: input size
^1da177e4c3f415 Linus Torvalds        2005-04-16  185   *
9dba910e9de2c4a Tejun Heo             2009-09-03  186   * Allow PCI IDs to =
be added to an existing driver via sysfs.
^1da177e4c3f415 Linus Torvalds        2005-04-16  187   */
445ba0f479b21cc Thomas Wei=C3=9Fschuh      2026-01-25  188  static ssize_t =
new_id_store(const struct device_driver *driver, const char *buf,
3c78bc61f5ef3bc Ryan Desfosses        2014-04-18  189  			    size_t count)
^1da177e4c3f415 Linus Torvalds        2005-04-16  190  {
9d887b3bf2fb75d Thomas Wei=C3=9Fschuh      2026-01-25 @191  	struct pci_dri=
ver *pdrv =3D ptr_unqual(to_pci_driver(driver));
b41d6cf38e27a94 Jean Delvare          2008-08-17  192  	const struct pci_de=
vice_id *ids =3D pdrv->id_table;
20a796a969efe37 Logan Gunthorpe       2019-02-08  193  	u32 vendor, device,=
 subvendor =3D PCI_ANY_ID,
^1da177e4c3f415 Linus Torvalds        2005-04-16  194  		subdevice =3D PCI_=
ANY_ID, class =3D 0, class_mask =3D 0;
^1da177e4c3f415 Linus Torvalds        2005-04-16  195  	unsigned long drive=
r_data =3D 0;
a49287d32d57b1b Bjorn Helgaas         2020-10-06  196  	int fields;
8895d3bcb8ba960 Bandan Das            2014-04-01  197  	int retval =3D 0;
^1da177e4c3f415 Linus Torvalds        2005-04-16  198 =20
b41d6cf38e27a94 Jean Delvare          2008-08-17  199  	fields =3D sscanf(b=
uf, "%x %x %x %x %x %x %lx",
^1da177e4c3f415 Linus Torvalds        2005-04-16  200  			&vendor, &device,=
 &subvendor, &subdevice,
^1da177e4c3f415 Linus Torvalds        2005-04-16  201  			&class, &class_ma=
sk, &driver_data);
6ba186361ed2cda Jean Delvare          2007-04-07  202  	if (fields < 2)
^1da177e4c3f415 Linus Torvalds        2005-04-16  203  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds        2005-04-16  204 =20
8895d3bcb8ba960 Bandan Das            2014-04-01  205  	if (fields !=3D 7) {
8895d3bcb8ba960 Bandan Das            2014-04-01  206  		struct pci_dev *pd=
ev =3D kzalloc(sizeof(*pdev), GFP_KERNEL);
8895d3bcb8ba960 Bandan Das            2014-04-01  207  		if (!pdev)
8895d3bcb8ba960 Bandan Das            2014-04-01  208  			return -ENOMEM;
8895d3bcb8ba960 Bandan Das            2014-04-01  209 =20
8895d3bcb8ba960 Bandan Das            2014-04-01  210  		pdev->vendor =3D v=
endor;
8895d3bcb8ba960 Bandan Das            2014-04-01  211  		pdev->device =3D d=
evice;
8895d3bcb8ba960 Bandan Das            2014-04-01  212  		pdev->subsystem_ve=
ndor =3D subvendor;
8895d3bcb8ba960 Bandan Das            2014-04-01  213  		pdev->subsystem_de=
vice =3D subdevice;
8895d3bcb8ba960 Bandan Das            2014-04-01  214  		pdev->class =3D cl=
ass;
8895d3bcb8ba960 Bandan Das            2014-04-01  215 =20
3853f9123c185eb Zhenzhong Duan        2020-11-17  216  		if (pci_match_devi=
ce(pdrv, pdev))
8895d3bcb8ba960 Bandan Das            2014-04-01  217  			retval =3D -EEXIS=
T;
8895d3bcb8ba960 Bandan Das            2014-04-01  218 =20
8895d3bcb8ba960 Bandan Das            2014-04-01  219  		kfree(pdev);
8895d3bcb8ba960 Bandan Das            2014-04-01  220 =20
8895d3bcb8ba960 Bandan Das            2014-04-01  221  		if (retval)
8895d3bcb8ba960 Bandan Das            2014-04-01  222  			return retval;
8895d3bcb8ba960 Bandan Das            2014-04-01  223  	}
8895d3bcb8ba960 Bandan Das            2014-04-01  224 =20
b41d6cf38e27a94 Jean Delvare          2008-08-17  225  	/* Only accept driv=
er_data values that match an existing id_table
b41d6cf38e27a94 Jean Delvare          2008-08-17  226  	   entry */
2debb4d2019fa05 Chris Wright          2008-11-25  227  	if (ids) {
b41d6cf38e27a94 Jean Delvare          2008-08-17  228  		retval =3D -EINVAL;
b41d6cf38e27a94 Jean Delvare          2008-08-17  229  		while (ids->vendor=
 || ids->subvendor || ids->class_mask) {
b41d6cf38e27a94 Jean Delvare          2008-08-17  230  			if (driver_data =
=3D=3D ids->driver_data) {
b41d6cf38e27a94 Jean Delvare          2008-08-17  231  				retval =3D 0;
b41d6cf38e27a94 Jean Delvare          2008-08-17  232  				break;
b41d6cf38e27a94 Jean Delvare          2008-08-17  233  			}
b41d6cf38e27a94 Jean Delvare          2008-08-17  234  			ids++;
b41d6cf38e27a94 Jean Delvare          2008-08-17  235  		}
b41d6cf38e27a94 Jean Delvare          2008-08-17  236  		if (retval)	/* No =
match */
b41d6cf38e27a94 Jean Delvare          2008-08-17  237  			return retval;
2debb4d2019fa05 Chris Wright          2008-11-25  238  	}
b41d6cf38e27a94 Jean Delvare          2008-08-17  239 =20
9dba910e9de2c4a Tejun Heo             2009-09-03  240  	retval =3D pci_add_=
dynid(pdrv, vendor, device, subvendor, subdevice,
9dba910e9de2c4a Tejun Heo             2009-09-03  241  			       class, cla=
ss_mask, driver_data);
b19441af1855591 Greg Kroah-Hartman    2006-08-28  242  	if (retval)
b19441af1855591 Greg Kroah-Hartman    2006-08-28  243  		return retval;
^1da177e4c3f415 Linus Torvalds        2005-04-16  244  	return count;
^1da177e4c3f415 Linus Torvalds        2005-04-16  245  }
445ba0f479b21cc Thomas Wei=C3=9Fschuh      2026-01-25  246  static const DR=
IVER_ATTR_WO(new_id);
^1da177e4c3f415 Linus Torvalds        2005-04-16  247 =20

:::::: The code at line 191 was first introduced by commit
:::::: 9d887b3bf2fb75db857ad0aa0aef1598f4f1111d pci: ptr_unqual

:::::: TO: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
:::::: CC: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
