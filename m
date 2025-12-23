Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AEB33A710
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494875; cv=none; b=oB31t0v8GS7U2U6wqse/3aLljk82SO9KL85QIvC//ic46aWtlkrnJbIhzo+CJfrbo0vO6Kqwa0SIKLvEwI8SXvpM61dQVSsFNhNxDvImBL0aMHI5JzVj6hmF46jrLM0JxglcKywPaSq42iD3nsN+R43T3PhrF5J/WiJhex3jCEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494875; c=relaxed/simple;
	bh=TevvI3rU/AuIv5eN3JEJ7iY2d31Wf0hWbYdepAL2FJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fzxGmxLm60hmDmirKqKHzU8sU4NvB4XBztcbEzoWaastrQ0FkM1FSx7GQZOXb6nuqL6dHydgUv9+A5f31kTuQV5en/DFoFfBK8OfW6BV7udP+uKda/xV0VdHrauOygIVxCj+QXax/C+jDyrHVrmdNd4/GB3FN4VATGvd6tj6Juw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6bx0KiV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6bx0KiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766494873; x=1798030873;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TevvI3rU/AuIv5eN3JEJ7iY2d31Wf0hWbYdepAL2FJM=;
  b=a6bx0KiV4rJSAFswaPTzmM1uByPNznHI3n0GQQ1lAOcQT3VgBrMhYgT2
   zYsk7Dm1TmFyTmycYTlcsqVua2cRoVNlTByFLRH9JjqsSY9SFWbsvQ7Wg
   xv8IJc5LkMFDNWX0dgN+eMUsY6jAxMuofW6Ncj4450bVWSxfCggEsvSWv
   bWHLfXuhLuBKnNwAq8kRaK4PM5DsuMSj1Ms0Hq0pnfaymCHI6INaT7hVW
   FrLZYzHTbSlUoYxoOeVPZrEyfQG52BFq18749XuKW/hqabEvUwYZAcyYZ
   chdTyEUcS4/RLnjhePm8IR8Iw8M8xWIy5HTm4I/EJNEOGYBh4KGhZIeQb
   g==;
X-CSE-ConnectionGUID: DrE+oimcRkyIO3cRcK7QjA==
X-CSE-MsgGUID: ypUHsFHgS8qjBrGdDx/P4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79062539"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79062539"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:01:12 -0800
X-CSE-ConnectionGUID: H9bbzZSWTA686IX1iG6plw==
X-CSE-MsgGUID: poBDjUXkRm2A0fDXNk7FSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199757678"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Dec 2025 05:01:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY20i-000000001wH-3TQf;
	Tue, 23 Dec 2025 13:01:08 +0000
Date: Tue, 23 Dec 2025 21:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] mm/memory.c:1709:
 warning: Function parameter or member 'mm_wr_locked' not described in
 'unmap_vmas'
Message-ID: <202512232002.uJ519OY9-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b952cc514e6f0e92951693f5131909bb1264ded3
commit: 2ff3b23c7fde9ad4a23158d219b9e9a5a0e90982 [1/1] UPSTREAM: mm: introd=
uce __vm_flags_mod and use it in untrack_pfn
config: x86_64-randconfig-r071-20251223 (https://download.01.org/0day-ci/ar=
chive/20251223/202512232002.uJ519OY9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251223/202512232002.uJ519OY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232002.uJ519OY9-lkp@i=
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
