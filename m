Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091296;
	b=F+eM85ggaJwOXy0CTqSTOJLa+/PqWpS7eScJU/4uFBkt2Lge6ZF9BI5HOm5OfAP149Yq
	 H5OdaHVJZd95hEsMUWOcIC+mlQqKsbQbJPT8LfTR5xSAiaQ18iTyi/WQbxgi3IuHvKdXy
	 H+0a0HpKKqEY7kyZMxHrWGmoFCS4/H3VNHGb89xlY2YCq0AJbx8icIhxDmC+s322PmvUa
	 TJcw8pNazFzReNJNfDxHGHNn5ElyK373m6Ue9fTshrQvSUhH94RzwBuEW3V4C0wzVMrLh
	 1KKMkgVZZ6Su9ZvcQzA0j1Ni781bCpy+7Fojr/PJGIziBrYa3OXBiRJy2V6A4+h5Iyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091296;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=q/zK9MK+JtNT/3BmLVV6s5XjDuhiLY2qSuU66HYPfp8=;
	b=tvNyoKn2NndbzNB5BTgyjOA3d5hiXG+DSf19dUhIAVjYrtsPpCJ3i2KD7PLnDhluPNUX
	 +xJXfotYN8iuT9z1LJevNwst3kDt+HDI5a7MQ/NgixMSYCJPvMKkqAzV0Jjr++lwps5ic
	 mL8hNWCSrl7LKhb9KnwKvcRr8OQrJd+IUYCsX04X4CHx1x3SCtTGuMUbDlBTIA/lkeST2
	 xhhrZWzCtXq1hEGtWBRDTJQZDJjmALpZ1zGGPLMdvX+SALTeTwIPcuB5JtOXYukOPEss+
	 uzbNOOi+gGfC1tZkUjMcsScS8J9AGWsluD54/wgRVm1d9hxkLT7RBZP+p6U2uKvy37g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b29Wuu74;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCBC606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 08:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCBC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b29Wuu74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793091295; x=1824627295;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bKDQukRvQlemTU2BTr5CZuIdX7214CjTa9DHSb9Qv4k=;
  b=b29Wuu74jtZed9SAS9ZupDooju09N3u8sdADEwTKQYE203y/Hjn/UeJT
   i0mh0Sy9q883rYVx3Rfb8JJBHR8omYiAgeosAv7ZyTxzn/zGaTiGzgD4I
   mcDCRGyL3ZgqmS9Bi24hfJIcTwvNMvz4EgsPoAuTVAHI351TXrnpqEnwf
   4ZGogeV0C3grWtyu4zPwmfuOu6pg5m0y39XJz38mhVjLxCnfM+Hn5W8SD
   9Mn9LYtrJ/wWm+Up0HQumqQQcDG0e2Xuj3NIlz107sYsmiOpww0beTppp
   rDOzbMgzxhaFCf4384oFWuL0X3k+49XMX+AodE7gorCt781LQrywMmi3C
   g==;
X-CSE-ConnectionGUID: qu3jXWWRSByv01fdp/oNPA==
X-CSE-MsgGUID: bQzAXpsGRaGOQ1LlP2emuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1787806"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1787806"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:54:54 -0700
X-CSE-ConnectionGUID: JhpvewtxQD6GJwXC64vcwg==
X-CSE-MsgGUID: JkHgHe1LReS5716rItiREA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4575585"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2026 01:54:53 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLcxG-000000004S3-39bf;
	Tue, 27 Oct 2026 08:54:50 +0000
Date: Tue, 27 Oct 2026 09:54:45 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 mm/memory.c:1709: warning: Function parameter or member 'mm_wr_locked' not
 described in 'unmap_vmas'
Message-ID: <202610270904.FFxiPAfr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   6b915aa34a0d468d55e46535173b0d946dfcf9a5
commit: 2ff3b23c7fde9ad4a23158d219b9e9a5a0e90982 [353/353] UPSTREAM: mm: in=
troduce __vm_flags_mod and use it in untrack_pfn
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/202=
61027/202610270904.FFxiPAfr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261027/202610270904.FFxiPAfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270904.FFxiPAfr-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c:1709: warning: Function parameter or member 'start_t' not de=
scribed in 'unmap_vmas'
   mm/memory.c:1709: warning: Function parameter or member 'end_t' not desc=
ribed in 'unmap_vmas'
>> mm/memory.c:1709: warning: Function parameter or member 'mm_wr_locked' n=
ot described in 'unmap_vmas'


vim +1709 mm/memory.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  1685 =20
f5cc4eef9987d0b Al Viro            2012-03-05  1686  /**
f5cc4eef9987d0b Al Viro            2012-03-05  1687   * unmap_vmas - unmap =
a range of memory covered by a list of vma's
f5cc4eef9987d0b Al Viro            2012-03-05  1688   * @tlb: address of th=
e caller's struct mmu_gather
763ecb035029f50 Liam R. Howlett    2022-09-06  1689   * @mt: the maple tree
f5cc4eef9987d0b Al Viro            2012-03-05  1690   * @vma: the starting =
vma
f5cc4eef9987d0b Al Viro            2012-03-05  1691   * @start_addr: virtua=
l address at which to start unmapping
f5cc4eef9987d0b Al Viro            2012-03-05  1692   * @end_addr: virtual =
address at which to end unmapping
f5cc4eef9987d0b Al Viro            2012-03-05  1693   *
f5cc4eef9987d0b Al Viro            2012-03-05  1694   * Unmap all pages in =
the vma list.
f5cc4eef9987d0b Al Viro            2012-03-05  1695   *
f5cc4eef9987d0b Al Viro            2012-03-05  1696   * Only addresses betw=
een `start' and `end' will be unmapped.
f5cc4eef9987d0b Al Viro            2012-03-05  1697   *
f5cc4eef9987d0b Al Viro            2012-03-05  1698   * The VMA list must b=
e sorted in ascending virtual address order.
f5cc4eef9987d0b Al Viro            2012-03-05  1699   *
f5cc4eef9987d0b Al Viro            2012-03-05  1700   * unmap_vmas() assume=
s that the caller will flush the whole unmapped address
f5cc4eef9987d0b Al Viro            2012-03-05  1701   * range after unmap_v=
mas() returns.  So the only responsibility here is to
f5cc4eef9987d0b Al Viro            2012-03-05  1702   * ensure that any thu=
s-far unmapped pages are flushed before unmap_vmas()
f5cc4eef9987d0b Al Viro            2012-03-05  1703   * drops the lock and =
schedules.
f5cc4eef9987d0b Al Viro            2012-03-05  1704   */
763ecb035029f50 Liam R. Howlett    2022-09-06  1705  void unmap_vmas(struct=
 mmu_gather *tlb, struct maple_tree *mt,
f5cc4eef9987d0b Al Viro            2012-03-05  1706  		struct vm_area_struc=
t *vma, unsigned long start_addr,
e9fdabfc2aeb273 Liam R. Howlett    2023-04-28  1707  		unsigned long end_ad=
dr, unsigned long start_t,
2ff3b23c7fde9ad Suren Baghdasaryan 2023-01-26  1708  		unsigned long end_t,=
 bool mm_wr_locked)
f5cc4eef9987d0b Al Viro            2012-03-05 @1709  {
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  1710  	struct mmu_=
notifier_range range;
999dad824c39ed1 Peter Xu           2022-05-12  1711  	struct zap_details de=
tails =3D {
04ada095dcfc4ae Mike Kravetz       2022-11-14  1712  		.zap_flags =3D ZAP_F=
LAG_DROP_MARKER | ZAP_FLAG_UNMAP,
999dad824c39ed1 Peter Xu           2022-05-12  1713  		/* Careful - we need=
 to zap private pages too! */
999dad824c39ed1 Peter Xu           2022-05-12  1714  		.even_cows =3D true,
999dad824c39ed1 Peter Xu           2022-05-12  1715  	};
e9fdabfc2aeb273 Liam R. Howlett    2023-04-28  1716  	MA_STATE(mas, mt, sta=
rt_t, start_t);
f5cc4eef9987d0b Al Viro            2012-03-05  1717 =20
6f4f13e8d9e27ce J=C3=A9r=C3=B4me Glisse      2019-05-13  1718  	mmu_notifie=
r_range_init(&range, MMU_NOTIFY_UNMAP, 0, vma, vma->vm_mm,
6f4f13e8d9e27ce J=C3=A9r=C3=B4me Glisse      2019-05-13  1719  				start_ad=
dr, end_addr);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  1720  	mmu_notifie=
r_invalidate_range_start(&range);
763ecb035029f50 Liam R. Howlett    2022-09-06  1721  	do {
2ff3b23c7fde9ad Suren Baghdasaryan 2023-01-26  1722  		unmap_single_vma(tlb=
, vma, start_addr, end_addr, &details,
2ff3b23c7fde9ad Suren Baghdasaryan 2023-01-26  1723  				 mm_wr_locked);
e9fdabfc2aeb273 Liam R. Howlett    2023-04-28  1724  	} while ((vma =3D mas=
_find(&mas, end_t - 1)) !=3D NULL);
ac46d4f3c43241f J=C3=A9r=C3=B4me Glisse      2018-12-28  1725  	mmu_notifie=
r_invalidate_range_end(&range);
^1da177e4c3f415 Linus Torvalds     2005-04-16  1726  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  1727 =20

:::::: The code at line 1709 was first introduced by commit
:::::: f5cc4eef9987d0b517364d01e290d6438e47ee5d VM: make zap_page_range() c=
allers that act on a single VMA use separate helper

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
