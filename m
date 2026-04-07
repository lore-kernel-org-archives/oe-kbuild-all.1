Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D50374739
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533825; cv=none; b=RtOKSCrpBaUlDU5HasQC0u8cDa5hoFZi+SKFB56UHkVrhzXy0vqjqkLXaPildjj0T02dZxCqfyMc/G6FXcE+2qPGhq1oUXeLPdTQC/qZX/yO7xifxp+WjK9Z9/G0bY443fd7bSUYjoOVFbU3cc2nxobzpKp9Dm+mI4wip//qpf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533825; c=relaxed/simple;
	bh=dKzh/l5492GW+zOCW+c/ucWh6UxYSg6qD6OLqum5LLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kuMuSURgqWWM+5NCSUT1je6XO18Qjdnqxp8HZqR1u+9/7cazMJKxQqYTefMfBP8oM6gOcmGcpOw2boBSCsuuKex0EXi+prOLkaVLuVod7Ow1cE6dM+tUyLMe+HGrFgSQ7GS9i6RPSt95QTG7xYIvZLX0OYXmoUneGQISyu2slFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGTqQ9e2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGTqQ9e2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533825; x=1807069825;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dKzh/l5492GW+zOCW+c/ucWh6UxYSg6qD6OLqum5LLg=;
  b=ZGTqQ9e2h4/PSNuAf8Km1/r+goswVhA3Zj6V8bH4GyMXrVTqePZSOHds
   JcpSRht3FouGEZ78PfNgJtYH+EQjy6rmHOLnuc7Nd/clkEYWgabv8x+jF
   ewxdS7P/d0TnIeksVOtxs13wnvLtq5+7atY3BS3m9GB1gZznc7CmMr4lk
   b1A9yG7LOSTAZAj2z5vUcRjc6BIkGnrRwm72G2vTbyQNnz79r5cI2fg4l
   vtpVXP5Re/FfWG2373xuA5LbttqYYIhcBRT54+mSDkzG7yPH7DcGo28WT
   IwG5n1W4N0r/vrUoNFJnwFYMRFkrI3DT71KH+yasUdsz1PeISS/iR7o8F
   w==;
X-CSE-ConnectionGUID: QcFVeCXDTL6YwmKgnc3aIQ==
X-CSE-MsgGUID: D8u1hG6qR7Gi1NqLjUEUYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87113620"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87113620"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:50:22 -0700
X-CSE-ConnectionGUID: wxM50MSJQi2BfBEuwaeQrw==
X-CSE-MsgGUID: QN3w02oRQr+U3fgs1B7XZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223258477"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 20:50:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xSE-0000000001v-1iag;
	Tue, 07 Apr 2026 03:50:18 +0000
Date: Tue, 07 Apr 2026 11:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 28/28] mm/memory.c:1709:
 warning: Function parameter or member 'mm_wr_locked' not described in
 'unmap_vmas'
Message-ID: <202604040222.Wljnp1le-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2ae5f5ed1b2f5c49e06cf1e40ed7d7249cf74aa0
commit: 2ff3b23c7fde9ad4a23158d219b9e9a5a0e90982 [28/28] UPSTREAM: mm: intr=
oduce __vm_flags_mod and use it in untrack_pfn
config: x86_64-randconfig-r061-20260403 (https://download.01.org/0day-ci/ar=
chive/20260404/202604040222.Wljnp1le-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260404/202604040222.Wljnp1le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040222.Wljnp1le-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c:1709: warning: Function parameter or member 'start_t' not de=
scribed in 'unmap_vmas'
   mm/memory.c:1709: warning: Function parameter or member 'end_t' not desc=
ribed in 'unmap_vmas'
>> mm/memory.c:1709: warning: Function parameter or member 'mm_wr_locked' n=
ot described in 'unmap_vmas'


vim +1709 mm/memory.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  1685 =20
f5cc4eef9987d0 Al Viro            2012-03-05  1686  /**
f5cc4eef9987d0 Al Viro            2012-03-05  1687   * unmap_vmas - unmap a=
 range of memory covered by a list of vma's
f5cc4eef9987d0 Al Viro            2012-03-05  1688   * @tlb: address of the=
 caller's struct mmu_gather
763ecb035029f5 Liam R. Howlett    2022-09-06  1689   * @mt: the maple tree
f5cc4eef9987d0 Al Viro            2012-03-05  1690   * @vma: the starting v=
ma
f5cc4eef9987d0 Al Viro            2012-03-05  1691   * @start_addr: virtual=
 address at which to start unmapping
f5cc4eef9987d0 Al Viro            2012-03-05  1692   * @end_addr: virtual a=
ddress at which to end unmapping
f5cc4eef9987d0 Al Viro            2012-03-05  1693   *
f5cc4eef9987d0 Al Viro            2012-03-05  1694   * Unmap all pages in t=
he vma list.
f5cc4eef9987d0 Al Viro            2012-03-05  1695   *
f5cc4eef9987d0 Al Viro            2012-03-05  1696   * Only addresses betwe=
en `start' and `end' will be unmapped.
f5cc4eef9987d0 Al Viro            2012-03-05  1697   *
f5cc4eef9987d0 Al Viro            2012-03-05  1698   * The VMA list must be=
 sorted in ascending virtual address order.
f5cc4eef9987d0 Al Viro            2012-03-05  1699   *
f5cc4eef9987d0 Al Viro            2012-03-05  1700   * unmap_vmas() assumes=
 that the caller will flush the whole unmapped address
f5cc4eef9987d0 Al Viro            2012-03-05  1701   * range after unmap_vm=
as() returns.  So the only responsibility here is to
f5cc4eef9987d0 Al Viro            2012-03-05  1702   * ensure that any thus=
-far unmapped pages are flushed before unmap_vmas()
f5cc4eef9987d0 Al Viro            2012-03-05  1703   * drops the lock and s=
chedules.
f5cc4eef9987d0 Al Viro            2012-03-05  1704   */
763ecb035029f5 Liam R. Howlett    2022-09-06  1705  void unmap_vmas(struct =
mmu_gather *tlb, struct maple_tree *mt,
f5cc4eef9987d0 Al Viro            2012-03-05  1706  		struct vm_area_struct=
 *vma, unsigned long start_addr,
e9fdabfc2aeb27 Liam R. Howlett    2023-04-28  1707  		unsigned long end_add=
r, unsigned long start_t,
2ff3b23c7fde9a Suren Baghdasaryan 2023-01-26  1708  		unsigned long end_t, =
bool mm_wr_locked)
f5cc4eef9987d0 Al Viro            2012-03-05 @1709  {
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  1710  	struct mmu_n=
otifier_range range;
999dad824c39ed Peter Xu           2022-05-12  1711  	struct zap_details det=
ails =3D {
04ada095dcfc4a Mike Kravetz       2022-11-14  1712  		.zap_flags =3D ZAP_FL=
AG_DROP_MARKER | ZAP_FLAG_UNMAP,
999dad824c39ed Peter Xu           2022-05-12  1713  		/* Careful - we need =
to zap private pages too! */
999dad824c39ed Peter Xu           2022-05-12  1714  		.even_cows =3D true,
999dad824c39ed Peter Xu           2022-05-12  1715  	};
e9fdabfc2aeb27 Liam R. Howlett    2023-04-28  1716  	MA_STATE(mas, mt, star=
t_t, start_t);
f5cc4eef9987d0 Al Viro            2012-03-05  1717 =20
6f4f13e8d9e27c J=C3=A9r=C3=B4me Glisse      2019-05-13  1718  	mmu_notifier=
_range_init(&range, MMU_NOTIFY_UNMAP, 0, vma, vma->vm_mm,
6f4f13e8d9e27c J=C3=A9r=C3=B4me Glisse      2019-05-13  1719  				start_add=
r, end_addr);
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  1720  	mmu_notifier=
_invalidate_range_start(&range);
763ecb035029f5 Liam R. Howlett    2022-09-06  1721  	do {
2ff3b23c7fde9a Suren Baghdasaryan 2023-01-26  1722  		unmap_single_vma(tlb,=
 vma, start_addr, end_addr, &details,
2ff3b23c7fde9a Suren Baghdasaryan 2023-01-26  1723  				 mm_wr_locked);
e9fdabfc2aeb27 Liam R. Howlett    2023-04-28  1724  	} while ((vma =3D mas_=
find(&mas, end_t - 1)) !=3D NULL);
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  1725  	mmu_notifier=
_invalidate_range_end(&range);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1726  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1727 =20

:::::: The code at line 1709 was first introduced by commit
:::::: f5cc4eef9987d0b517364d01e290d6438e47ee5d VM: make zap_page_range() c=
allers that act on a single VMA use separate helper

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
