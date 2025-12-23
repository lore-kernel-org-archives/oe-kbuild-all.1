Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D171E8320
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 00:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766449947; cv=none; b=RT/6bFy+gS68zlPw05G4AS0USOEdEUCc4YIz++OKpDkrabS791kj+Svkyxc/cQtVdbjBmS65gQzb80hfyOAEBTKOPd0eSta44hqQh0L5N/JWvFSMC5sTqUX0bwOPkqdoVAtD1mlu1E1EZWePvzGUbIPCcchtm520sii0vvzM9fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766449947; c=relaxed/simple;
	bh=Eza7K8Hl4yp9MxEzmTsAFTND0l3DA0PL5Z+ptFQ0JzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S6Fc8+DaS2IL4fYo0KX9Q0k/qIUn6T5gaJHtkqSEWyKR9PI4EdAsNS3GtJ7K4N/BuHWsnyUGUjpswxQlbQKG8HhvpuvPP/pLrrPTsN9LlEb3k0HZoD8PEV6yF5z5/IDztpu5TAYz9Gdgw8LuxxJmGetLrbKZLmC3uQYXtZGqt/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEZHldmg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEZHldmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766449945; x=1797985945;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Eza7K8Hl4yp9MxEzmTsAFTND0l3DA0PL5Z+ptFQ0JzU=;
  b=lEZHldmgT4PnOFQStbf0MCHGxDRIEl8rMwJGjTGtvkeKhAb6X9zKAWtK
   2NHMesYPZIP5gXXtKOsFjefXFSB7eb6DX5/o8bDZ87KPGYE29EcG6Tl5g
   kXm9jSS9HBFQWxqlJjzpTklBBUEZK84Z+BEslAdnghqvggRejOyys9zLa
   BtA+ENw3KgdFGhZ1nofntJxj87TOVBksZMImYQgFahg0dRimk0124j5yV
   DQ0F59UGhUocQahkVOPwjSfx9P9DtGXd6s0XfhYk+xRGgflN2Yzt9kRrz
   jjXLFE3jj8JkPSFxOj3urMpgNxCd7F4CAhqHvSGdfY9jKhTAsXK/BkXL/
   g==;
X-CSE-ConnectionGUID: uYEZ/v+pT+mx0py6RNab4Q==
X-CSE-MsgGUID: FlIYFXrrRsGg7dg1gVTfWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68198850"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68198850"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 16:32:23 -0800
X-CSE-ConnectionGUID: 28DGTStPSIOZkBmfeSxobA==
X-CSE-MsgGUID: Z00yP19ZRqeYQ8QtAwMTTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="237055158"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 16:31:58 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXqJa-000000001Fv-2z1M;
	Tue, 23 Dec 2025 00:31:51 +0000
Date: Tue, 23 Dec 2025 08:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] mm/memory.c:1709:
 warning: Function parameter or member 'start_t' not described in 'unmap_vmas'
Message-ID: <202512230833.oXYzqXCr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Liam,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b952cc514e6f0e92951693f5131909bb1264ded3
commit: e9fdabfc2aeb273168e60795e68896dfdeed6fdd [1/1] FROMLIST: BACKPORT: =
mm: Change do_vmi_align_munmap() side tree index
config: x86_64-randconfig-r071-20251223 (https://download.01.org/0day-ci/ar=
chive/20251223/202512230833.oXYzqXCr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251223/202512230833.oXYzqXCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230833.oXYzqXCr-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:1709: warning: Function parameter or member 'start_t' not de=
scribed in 'unmap_vmas'
>> mm/memory.c:1709: warning: Function parameter or member 'end_t' not desc=
ribed in 'unmap_vmas'


vim +1709 mm/memory.c

^1da177e4c3f415 Linus Torvalds  2005-04-16  1685 =20
f5cc4eef9987d0b Al Viro         2012-03-05  1686  /**
f5cc4eef9987d0b Al Viro         2012-03-05  1687   * unmap_vmas - unmap a r=
ange of memory covered by a list of vma's
f5cc4eef9987d0b Al Viro         2012-03-05  1688   * @tlb: address of the c=
aller's struct mmu_gather
763ecb035029f50 Liam R. Howlett 2022-09-06  1689   * @mt: the maple tree
f5cc4eef9987d0b Al Viro         2012-03-05  1690   * @vma: the starting vma
f5cc4eef9987d0b Al Viro         2012-03-05  1691   * @start_addr: virtual a=
ddress at which to start unmapping
f5cc4eef9987d0b Al Viro         2012-03-05  1692   * @end_addr: virtual add=
ress at which to end unmapping
f5cc4eef9987d0b Al Viro         2012-03-05  1693   *
f5cc4eef9987d0b Al Viro         2012-03-05  1694   * Unmap all pages in the=
 vma list.
f5cc4eef9987d0b Al Viro         2012-03-05  1695   *
f5cc4eef9987d0b Al Viro         2012-03-05  1696   * Only addresses between=
 `start' and `end' will be unmapped.
f5cc4eef9987d0b Al Viro         2012-03-05  1697   *
f5cc4eef9987d0b Al Viro         2012-03-05  1698   * The VMA list must be s=
orted in ascending virtual address order.
f5cc4eef9987d0b Al Viro         2012-03-05  1699   *
f5cc4eef9987d0b Al Viro         2012-03-05  1700   * unmap_vmas() assumes t=
hat the caller will flush the whole unmapped address
f5cc4eef9987d0b Al Viro         2012-03-05  1701   * range after unmap_vmas=
() returns.  So the only responsibility here is to
f5cc4eef9987d0b Al Viro         2012-03-05  1702   * ensure that any thus-f=
ar unmapped pages are flushed before unmap_vmas()
f5cc4eef9987d0b Al Viro         2012-03-05  1703   * drops the lock and sch=
edules.
f5cc4eef9987d0b Al Viro         2012-03-05  1704   */
763ecb035029f50 Liam R. Howlett 2022-09-06  1705  void unmap_vmas(struct mm=
u_gather *tlb, struct maple_tree *mt,
f5cc4eef9987d0b Al Viro         2012-03-05  1706  		struct vm_area_struct *=
vma, unsigned long start_addr,
e9fdabfc2aeb273 Liam R. Howlett 2023-04-28  1707  		unsigned long end_addr,=
 unsigned long start_t,
e9fdabfc2aeb273 Liam R. Howlett 2023-04-28  1708  		unsigned long end_t)
f5cc4eef9987d0b Al Viro         2012-03-05 @1709  {
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse   2018-12-28  1710  	struct mmu_not=
ifier_range range;
999dad824c39ed1 Peter Xu        2022-05-12  1711  	struct zap_details detai=
ls =3D {
04ada095dcfc4ae Mike Kravetz    2022-11-14  1712  		.zap_flags =3D ZAP_FLAG=
_DROP_MARKER | ZAP_FLAG_UNMAP,
999dad824c39ed1 Peter Xu        2022-05-12  1713  		/* Careful - we need to=
 zap private pages too! */
999dad824c39ed1 Peter Xu        2022-05-12  1714  		.even_cows =3D true,
999dad824c39ed1 Peter Xu        2022-05-12  1715  	};
e9fdabfc2aeb273 Liam R. Howlett 2023-04-28  1716  	MA_STATE(mas, mt, start_=
t, start_t);
f5cc4eef9987d0b Al Viro         2012-03-05  1717 =20
6f4f13e8d9e27ce J=C3=A9r=C3=B4me Glisse   2019-05-13  1718  	mmu_notifier_r=
ange_init(&range, MMU_NOTIFY_UNMAP, 0, vma, vma->vm_mm,
6f4f13e8d9e27ce J=C3=A9r=C3=B4me Glisse   2019-05-13  1719  				start_addr,=
 end_addr);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse   2018-12-28  1720  	mmu_notifier_i=
nvalidate_range_start(&range);
763ecb035029f50 Liam R. Howlett 2022-09-06  1721  	do {
999dad824c39ed1 Peter Xu        2022-05-12  1722  		unmap_single_vma(tlb, v=
ma, start_addr, end_addr, &details);
e9fdabfc2aeb273 Liam R. Howlett 2023-04-28  1723  	} while ((vma =3D mas_fi=
nd(&mas, end_t - 1)) !=3D NULL);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse   2018-12-28  1724  	mmu_notifier_i=
nvalidate_range_end(&range);
^1da177e4c3f415 Linus Torvalds  2005-04-16  1725  }
^1da177e4c3f415 Linus Torvalds  2005-04-16  1726 =20

:::::: The code at line 1709 was first introduced by commit
:::::: f5cc4eef9987d0b517364d01e290d6438e47ee5d VM: make zap_page_range() c=
allers that act on a single VMA use separate helper

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
