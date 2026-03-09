Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B133D6D4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 23:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773099039; cv=none; b=aZghkqklSmZ9kwlyS9yMUctkMLsG/WMw3t/oF5bdB0x5APn7qImOwgr0KQJQ5hodcKKGNHeE2L2h5yagElWdLEJO0nAYkeHdJ7dNWsLQ56pw+h/c3edNseITvWieTNKiGttzxn4izFCYH+dGWwrBIV1azpkJcreDNg7AFUUmGjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773099039; c=relaxed/simple;
	bh=3TEgJYVMLw8eIH6XVuSjpr6so+uVJsWEYPncMkMOLOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gOSSAi7c3S2KAIU6k5RajtpeKSfX3AvqzU/Pnyeu6a++/X25hTwU+/KSupU2nnAZLmYh380OVJHv9T3FUE7B1x//XwCSLBqTdKxK1Vg/k1T6r7+B+E+UsmgyGA0GQe2+3BZIe7smP+mzwENSIZJfpxeBzFgE8dfC/Xn/H6+VHhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wep8RToz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wep8RToz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773099037; x=1804635037;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3TEgJYVMLw8eIH6XVuSjpr6so+uVJsWEYPncMkMOLOc=;
  b=Wep8RTozeSLgherauoUnxG/oTsE5Po5n5aDQ3RZb35PZ9MQ6fhyl4rYp
   qfeqznX2WdMTkg2a/JdlNxgmwWx8jnUJCn3W3byVEnx4bv1iHMD74zhuO
   Tmmli6bVTw/EK3Wsv430xFK9n1wT6SBGU03HjlPYZNdmOiedMBS07lODN
   hzXi4mrrlv/3QnadE9++5nT4GXSTj1F00Q/ODjNDrSdRQAlT3eA0KuEFg
   J0tdvZS3uQJJusW5L6ni0X9ITQKsLRI8C4gdcGQ/fCojGK67VGGhTW2tT
   bwJj23hXMOCtQLT59pl/iaD9Gh6UUfc6yxyFnAp8Pcf+duq7FNQeSHTPE
   g==;
X-CSE-ConnectionGUID: t2+8bwUSSvKnKOyC6x6KMg==
X-CSE-MsgGUID: ZSfRubK/RCiyoZOESs+ocQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78016008"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="78016008"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 16:30:37 -0700
X-CSE-ConnectionGUID: DAvNcxe1TY2E3TzDwuRr2Q==
X-CSE-MsgGUID: mfuLhsmLROmCoNInYfn2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="217929390"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Mar 2026 16:30:35 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzk3U-000000000xw-3B3T;
	Mon, 09 Mar 2026 23:30:32 +0000
Date: Tue, 10 Mar 2026 07:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master /4750]
 drivers/gpu/drm/radeon/radeon_device.c:1592:22: error: implicit declaration
 of function 'drm_fb_helper_gem_is_fb'; did you mean
 'drm_fb_helper_from_client'?
Message-ID: <202603100745.tbDqpgNK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   343f51842f4ed7143872f3aa116a214a5619a4b9
commit: 99ece3600fdb60fef87268c6c05c66e5d02dbeb4 [/4750] Merge branch 'drm-=
next' of https://gitlab.freedesktop.org/agd5f/linux.git
config: loongarch-randconfig-001-20260310 (https://download.01.org/0day-ci/=
archive/20260310/202603100745.tbDqpgNK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260310/202603100745.tbDqpgNK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100745.tbDqpgNK-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/radeon/radeon_device.c: In function 'radeon_suspend_kms':
>> drivers/gpu/drm/radeon/radeon_device.c:1592:22: error: implicit declarat=
ion of function 'drm_fb_helper_gem_is_fb'; did you mean 'drm_fb_helper_from=
_client'? [-Werror=3Dimplicit-function-declaration]
    1592 |                 if (!drm_fb_helper_gem_is_fb(dev->fb_helper, fb-=
>obj[0])) {
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
         |                      drm_fb_helper_from_client
   cc1: some warnings being treated as errors


vim +1592 drivers/gpu/drm/radeon/radeon_device.c

771fe6b912fca5 Jerome Glisse     2009-06-05  1534 =20
771fe6b912fca5 Jerome Glisse     2009-06-05  1535 =20
771fe6b912fca5 Jerome Glisse     2009-06-05  1536  /*
771fe6b912fca5 Jerome Glisse     2009-06-05  1537   * Suspend & resume.
771fe6b912fca5 Jerome Glisse     2009-06-05  1538   */
f017853ee200d5 Lee Jones         2020-11-05  1539  /*
0c1951192a8855 Alex Deucher      2012-07-17  1540   * radeon_suspend_kms - =
initiate device suspend
0c1951192a8855 Alex Deucher      2012-07-17  1541   *
0c1951192a8855 Alex Deucher      2012-07-17  1542   * Puts the hw in the su=
spend state (all asics).
0c1951192a8855 Alex Deucher      2012-07-17  1543   * Returns 0 for success=
 or an error on failure.
0c1951192a8855 Alex Deucher      2012-07-17  1544   * Called at driver susp=
end.
0c1951192a8855 Alex Deucher      2012-07-17  1545   */
274ad65c9d02bd J=C3=A9rome Glisse     2016-03-18  1546  int radeon_suspend_=
kms(struct drm_device *dev, bool suspend,
88c79de8575c00 Thomas Zimmermann 2024-10-14  1547  		       bool notify_cli=
ents, bool freeze)
771fe6b912fca5 Jerome Glisse     2009-06-05  1548  {
875c186620e017 Darren Jenkins    2009-12-30  1549  	struct radeon_device *r=
dev;
d86a41267b32e9 Thomas Zimmermann 2020-12-01  1550  	struct pci_dev *pdev;
771fe6b912fca5 Jerome Glisse     2009-06-05  1551  	struct drm_crtc *crtc;
d8dcaa1dc50f5a Alex Deucher      2010-06-02  1552  	struct drm_connector *c=
onnector;
7465280c076d64 Alex Deucher      2011-08-25  1553  	int i, r;
771fe6b912fca5 Jerome Glisse     2009-06-05  1554 =20
875c186620e017 Darren Jenkins    2009-12-30  1555  	if (dev =3D=3D NULL || =
dev->dev_private =3D=3D NULL) {
771fe6b912fca5 Jerome Glisse     2009-06-05  1556  		return -ENODEV;
771fe6b912fca5 Jerome Glisse     2009-06-05  1557  	}
7473e830c400b2 Dave Airlie       2012-09-13  1558 =20
875c186620e017 Darren Jenkins    2009-12-30  1559  	rdev =3D dev->dev_priva=
te;
d86a41267b32e9 Thomas Zimmermann 2020-12-01  1560  	pdev =3D to_pci_dev(dev=
->dev);
875c186620e017 Darren Jenkins    2009-12-30  1561 =20
f2aba352a954d9 Alex Deucher      2016-09-19  1562  	if (dev->switch_power_s=
tate =3D=3D DRM_SWITCH_POWER_OFF)
6a9ee8af344e3b Dave Airlie       2010-02-01  1563  		return 0;
d8dcaa1dc50f5a Alex Deucher      2010-06-02  1564 =20
86698c20f71d48 Seth Forshee      2012-01-31  1565  	drm_kms_helper_poll_dis=
able(dev);
86698c20f71d48 Seth Forshee      2012-01-31  1566 =20
6adaed5bfe4f6f Simona Vetter     2015-09-23  1567  	drm_modeset_lock_all(de=
v);
d8dcaa1dc50f5a Alex Deucher      2010-06-02  1568  	/* turn off display hw =
*/
d8dcaa1dc50f5a Alex Deucher      2010-06-02  1569  	list_for_each_entry(con=
nector, &dev->mode_config.connector_list, head) {
d8dcaa1dc50f5a Alex Deucher      2010-06-02  1570  		drm_helper_connector_d=
pms(connector, DRM_MODE_DPMS_OFF);
d8dcaa1dc50f5a Alex Deucher      2010-06-02  1571  	}
6adaed5bfe4f6f Simona Vetter     2015-09-23  1572  	drm_modeset_unlock_all(=
dev);
d8dcaa1dc50f5a Alex Deucher      2010-06-02  1573 =20
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1574  	/* unpin the front buff=
ers and cursors */
771fe6b912fca5 Jerome Glisse     2009-06-05  1575  	list_for_each_entry(crt=
c, &dev->mode_config.crtc_list, head) {
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1576  		struct radeon_crtc *ra=
deon_crtc =3D to_radeon_crtc(crtc);
9a0f0c9d0c9de7 Daniel Stone      2018-03-30  1577  		struct drm_framebuffer=
 *fb =3D crtc->primary->fb;
771fe6b912fca5 Jerome Glisse     2009-06-05  1578 =20
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1579  		if (radeon_crtc->curso=
r_bo) {
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1580  			struct radeon_bo *rob=
j =3D gem_to_radeon_bo(radeon_crtc->cursor_bo);
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1581  			r =3D radeon_bo_reser=
ve(robj, false);
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1582  			if (r =3D=3D 0) {
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1583  				radeon_bo_unpin(robj=
);
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1584  				radeon_bo_unreserve(=
robj);
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1585  			}
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1586  		}
f3cbb17bcf676a Grigori Goronzy   2015-07-07  1587 =20
9a0f0c9d0c9de7 Daniel Stone      2018-03-30  1588  		if (fb =3D=3D NULL || =
fb->obj[0] =3D=3D NULL) {
771fe6b912fca5 Jerome Glisse     2009-06-05  1589  			continue;
771fe6b912fca5 Jerome Glisse     2009-06-05  1590  		}
386516744ba45d Dave Airlie       2010-03-30  1591  		/* don't unpin kernel =
fb objects */
7ba5286aad4e67 Thomas Zimmermann 2026-03-04 @1592  		if (!drm_fb_helper_gem=
_is_fb(dev->fb_helper, fb->obj[0])) {
7ba5286aad4e67 Thomas Zimmermann 2026-03-04  1593  			struct radeon_bo *rob=
j =3D gem_to_radeon_bo(fb->obj[0]);
7ba5286aad4e67 Thomas Zimmermann 2026-03-04  1594 =20
4c7886791264f0 Jerome Glisse     2009-11-20  1595  			r =3D radeon_bo_reser=
ve(robj, false);
386516744ba45d Dave Airlie       2010-03-30  1596  			if (r =3D=3D 0) {
4c7886791264f0 Jerome Glisse     2009-11-20  1597  				radeon_bo_unpin(robj=
);
4c7886791264f0 Jerome Glisse     2009-11-20  1598  				radeon_bo_unreserve(=
robj);
4c7886791264f0 Jerome Glisse     2009-11-20  1599  			}
771fe6b912fca5 Jerome Glisse     2009-06-05  1600  		}
771fe6b912fca5 Jerome Glisse     2009-06-05  1601  	}
771fe6b912fca5 Jerome Glisse     2009-06-05  1602  	/* evict vram memory */
4c7886791264f0 Jerome Glisse     2009-11-20  1603  	radeon_bo_evict_vram(rd=
ev);
8a47cc9ec1249e Christian K=C3=B6nig   2012-05-09  1604 =20
771fe6b912fca5 Jerome Glisse     2009-06-05  1605  	/* wait for gpu to fini=
sh processing current batch */
5f8f635edd8ad5 Jerome Glisse     2012-12-17  1606  	for (i =3D 0; i < RADEO=
N_NUM_RINGS; i++) {
37615527c5669f Christian K=C3=B6nig   2014-02-18  1607  		r =3D radeon_fenc=
e_wait_empty(rdev, i);
5f8f635edd8ad5 Jerome Glisse     2012-12-17  1608  		if (r) {
5f8f635edd8ad5 Jerome Glisse     2012-12-17  1609  			/* delay GPU reset to=
 resume */
eb98c709907c7a Christian K=C3=B6nig   2014-08-27  1610  			radeon_fence_dri=
ver_force_completion(rdev, i);
d6c770d2050b26 Zhenneng Li       2022-08-11  1611  		} else {
d6c770d2050b26 Zhenneng Li       2022-08-11  1612  			/* finish executing d=
elayed work */
d6c770d2050b26 Zhenneng Li       2022-08-11  1613  			flush_delayed_work(&r=
dev->fence_drv[i].lockup_work);
5f8f635edd8ad5 Jerome Glisse     2012-12-17  1614  		}
5f8f635edd8ad5 Jerome Glisse     2012-12-17  1615  	}
771fe6b912fca5 Jerome Glisse     2009-06-05  1616 =20
f657c2a7310ad5 Yang Zhao         2009-09-15  1617  	radeon_save_bios_scratc=
h_regs(rdev);
f657c2a7310ad5 Yang Zhao         2009-09-15  1618 =20
3ce0a23d2d2531 Jerome Glisse     2009-09-08  1619  	radeon_suspend(rdev);
d4877cf2293f54 Alex Deucher      2009-12-04  1620  	radeon_hpd_fini(rdev);
ec9aaaff666682 Alex Deucher      2016-10-10  1621  	/* evict remaining vram=
 memory
ec9aaaff666682 Alex Deucher      2016-10-10  1622  	 * This second call to =
evict vram is to evict the gart page table
ec9aaaff666682 Alex Deucher      2016-10-10  1623  	 * using the CPU.
ec9aaaff666682 Alex Deucher      2016-10-10  1624  	 */
4c7886791264f0 Jerome Glisse     2009-11-20  1625  	radeon_bo_evict_vram(rd=
ev);
771fe6b912fca5 Jerome Glisse     2009-06-05  1626 =20
10b06122afcc78 Jerome Glisse     2010-05-21  1627  	radeon_agp_suspend(rdev=
);
10b06122afcc78 Jerome Glisse     2010-05-21  1628 =20
d86a41267b32e9 Thomas Zimmermann 2020-12-01  1629  	pci_save_state(pdev);
820608548737e3 Alex Deucher      2017-09-15  1630  	if (freeze && rdev->fam=
ily >=3D CHIP_CEDAR && !(rdev->flags & RADEON_IS_IGP)) {
274ad65c9d02bd J=C3=A9rome Glisse     2016-03-18  1631  		rdev->asic->asic_=
reset(rdev, true);
d86a41267b32e9 Thomas Zimmermann 2020-12-01  1632  		pci_restore_state(pdev=
);
274ad65c9d02bd J=C3=A9rome Glisse     2016-03-18  1633  	} else if (suspend=
) {
771fe6b912fca5 Jerome Glisse     2009-06-05  1634  		/* Shut down the devic=
e */
d86a41267b32e9 Thomas Zimmermann 2020-12-01  1635  		pci_disable_device(pde=
v);
d86a41267b32e9 Thomas Zimmermann 2020-12-01  1636  		pci_set_power_state(pd=
ev, PCI_D3hot);
771fe6b912fca5 Jerome Glisse     2009-06-05  1637  	}
10ebc0bc09344a Dave Airlie       2012-09-17  1638 =20
612ec7c69d04cb Thomas Zimmermann 2025-07-15  1639  	if (notify_clients)
7910d69376cde3 Thomas Zimmermann 2025-10-01  1640  		drm_client_dev_suspend=
(dev);
612ec7c69d04cb Thomas Zimmermann 2025-07-15  1641 =20
771fe6b912fca5 Jerome Glisse     2009-06-05  1642  	return 0;
771fe6b912fca5 Jerome Glisse     2009-06-05  1643  }
771fe6b912fca5 Jerome Glisse     2009-06-05  1644 =20

:::::: The code at line 1592 was first introduced by commit
:::::: 7ba5286aad4e670b64053d64c04dfdf575594692 drm/radeon: Test for fbdev =
GEM object with generic helper

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
