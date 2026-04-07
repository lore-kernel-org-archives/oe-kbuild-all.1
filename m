Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EFD374195
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533825; cv=none; b=rBEZUGtPYJFc2KuvSF26MR0tbWYsn/eAWZoFiiyRkH8tkgSqmrJmykDJ89h3fn5SWZuM996ekeXLsO8ryZmi7nwBD+gOtzEWOaUhqLetG62Yb1GdcelZatWLVCPDC8Qqu3CXweRVguT3zYWBU56VApbn+PY94tqgku/xLMfnYZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533825; c=relaxed/simple;
	bh=eggKW91VskUF6BrOoQcowDqVe1scLleHeCZipnMQyc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iGQVgPbhabaLLwvXdP3bvT7o5HCpjr/GZ+uhHbCjOS/16rtbXg8K0cIGoFBBiYPouIiJoS+QGXgO0U9ZsyaDBJlMihMmYvgF7OUJUhvXeDggGNV5OeFEJLTKEtRlQJ7Anl0vWZ3TKKEQsVrDYNXjF7U+1TP8PPCCTZvaBeWI8Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ttkyu82h; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ttkyu82h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533824; x=1807069824;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eggKW91VskUF6BrOoQcowDqVe1scLleHeCZipnMQyc8=;
  b=Ttkyu82hDjYNE99RbbCRJkLTrRC+s5N8YqBzs1ZoqBOPsWmt9i7AqEHN
   lQDJnx30oth4c42aWoT7BGSfdX08jGK9nbu/Fsp8PkzEBgDUug9l2RAbi
   Xcmma7vDbguI8/YhCBZSHHl4dAsjYQNHIAgYDzPQtB6C5b7B0u34d4+V5
   5uxaA12DxIAYt5zbHrzBcERQvowT/8Xg+zUsierQ3RyFfj8NUzeKPxG1o
   HpgD4w0+n0imj5SemGR/xAXmFbYl4aSmHYD2PSxR9Ze57O9hIAg7YKfm3
   qhKoE6ExA/8V8MidDDI4dMX/rPuVAUm/Cf0VQa4ePws8xIRcDO/EKlH2h
   A==;
X-CSE-ConnectionGUID: HiHGFkPJT9yE5zrkJTn2qw==
X-CSE-MsgGUID: tf2Mg3oJSbamvE6IxZYMXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87113616"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87113616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:50:22 -0700
X-CSE-ConnectionGUID: miadmwkBT2SO6JtyoVRVgA==
X-CSE-MsgGUID: fxDlHrhxROiZPWsBEExubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223258475"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 20:50:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xSE-0000000001t-1XqV;
	Tue, 07 Apr 2026 03:50:18 +0000
Date: Tue, 07 Apr 2026 11:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 28/28] mm/memory.c:1709:
 warning: Function parameter or member 'start_t' not described in 'unmap_vmas'
Message-ID: <202604040029.73mME86z-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2ae5f5ed1b2f5c49e06cf1e40ed7d7249cf74aa0
commit: e9fdabfc2aeb273168e60795e68896dfdeed6fdd [28/28] FROMLIST: BACKPORT=
: mm: Change do_vmi_align_munmap() side tree index
config: x86_64-randconfig-r061-20260403 (https://download.01.org/0day-ci/ar=
chive/20260404/202604040029.73mME86z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260404/202604040029.73mME86z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040029.73mME86z-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:1709: warning: Function parameter or member 'start_t' not de=
scribed in 'unmap_vmas'
>> mm/memory.c:1709: warning: Function parameter or member 'end_t' not desc=
ribed in 'unmap_vmas'


vim +1709 mm/memory.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1685 =20
f5cc4eef9987d0 Al Viro         2012-03-05  1686  /**
f5cc4eef9987d0 Al Viro         2012-03-05  1687   * unmap_vmas - unmap a ra=
nge of memory covered by a list of vma's
f5cc4eef9987d0 Al Viro         2012-03-05  1688   * @tlb: address of the ca=
ller's struct mmu_gather
763ecb035029f5 Liam R. Howlett 2022-09-06  1689   * @mt: the maple tree
f5cc4eef9987d0 Al Viro         2012-03-05  1690   * @vma: the starting vma
f5cc4eef9987d0 Al Viro         2012-03-05  1691   * @start_addr: virtual ad=
dress at which to start unmapping
f5cc4eef9987d0 Al Viro         2012-03-05  1692   * @end_addr: virtual addr=
ess at which to end unmapping
f5cc4eef9987d0 Al Viro         2012-03-05  1693   *
f5cc4eef9987d0 Al Viro         2012-03-05  1694   * Unmap all pages in the =
vma list.
f5cc4eef9987d0 Al Viro         2012-03-05  1695   *
f5cc4eef9987d0 Al Viro         2012-03-05  1696   * Only addresses between =
`start' and `end' will be unmapped.
f5cc4eef9987d0 Al Viro         2012-03-05  1697   *
f5cc4eef9987d0 Al Viro         2012-03-05  1698   * The VMA list must be so=
rted in ascending virtual address order.
f5cc4eef9987d0 Al Viro         2012-03-05  1699   *
f5cc4eef9987d0 Al Viro         2012-03-05  1700   * unmap_vmas() assumes th=
at the caller will flush the whole unmapped address
f5cc4eef9987d0 Al Viro         2012-03-05  1701   * range after unmap_vmas(=
) returns.  So the only responsibility here is to
f5cc4eef9987d0 Al Viro         2012-03-05  1702   * ensure that any thus-fa=
r unmapped pages are flushed before unmap_vmas()
f5cc4eef9987d0 Al Viro         2012-03-05  1703   * drops the lock and sche=
dules.
f5cc4eef9987d0 Al Viro         2012-03-05  1704   */
763ecb035029f5 Liam R. Howlett 2022-09-06  1705  void unmap_vmas(struct mmu=
_gather *tlb, struct maple_tree *mt,
f5cc4eef9987d0 Al Viro         2012-03-05  1706  		struct vm_area_struct *v=
ma, unsigned long start_addr,
e9fdabfc2aeb27 Liam R. Howlett 2023-04-28  1707  		unsigned long end_addr, =
unsigned long start_t,
e9fdabfc2aeb27 Liam R. Howlett 2023-04-28  1708  		unsigned long end_t)
f5cc4eef9987d0 Al Viro         2012-03-05 @1709  {
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse   2018-12-28  1710  	struct mmu_noti=
fier_range range;
999dad824c39ed Peter Xu        2022-05-12  1711  	struct zap_details detail=
s =3D {
04ada095dcfc4a Mike Kravetz    2022-11-14  1712  		.zap_flags =3D ZAP_FLAG_=
DROP_MARKER | ZAP_FLAG_UNMAP,
999dad824c39ed Peter Xu        2022-05-12  1713  		/* Careful - we need to =
zap private pages too! */
999dad824c39ed Peter Xu        2022-05-12  1714  		.even_cows =3D true,
999dad824c39ed Peter Xu        2022-05-12  1715  	};
e9fdabfc2aeb27 Liam R. Howlett 2023-04-28  1716  	MA_STATE(mas, mt, start_t=
, start_t);
f5cc4eef9987d0 Al Viro         2012-03-05  1717 =20
6f4f13e8d9e27c J=C3=A9r=C3=B4me Glisse   2019-05-13  1718  	mmu_notifier_ra=
nge_init(&range, MMU_NOTIFY_UNMAP, 0, vma, vma->vm_mm,
6f4f13e8d9e27c J=C3=A9r=C3=B4me Glisse   2019-05-13  1719  				start_addr, =
end_addr);
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse   2018-12-28  1720  	mmu_notifier_in=
validate_range_start(&range);
763ecb035029f5 Liam R. Howlett 2022-09-06  1721  	do {
999dad824c39ed Peter Xu        2022-05-12  1722  		unmap_single_vma(tlb, vm=
a, start_addr, end_addr, &details);
e9fdabfc2aeb27 Liam R. Howlett 2023-04-28  1723  	} while ((vma =3D mas_fin=
d(&mas, end_t - 1)) !=3D NULL);
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse   2018-12-28  1724  	mmu_notifier_in=
validate_range_end(&range);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1725  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1726 =20

:::::: The code at line 1709 was first introduced by commit
:::::: f5cc4eef9987d0b517364d01e290d6438e47ee5d VM: make zap_page_range() c=
allers that act on a single VMA use separate helper

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
