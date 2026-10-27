Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139755;
	b=4o+TT+EqMcU+ipGibYiruHhr4kqEuq38LXyJLGaqeaHDPo2hKSRYDSL279uGqYUhuwnK
	 WDppfgIMi2EC1p8tGmkfhTcJdXjmUkz7nZRBfNvw1oN0an3Mc+xMhVlimB143BMQJtSQS
	 VqlGE7x7mr25Zkv7GRRZ5KHdImUpN/2YXBn4baQdNYVQDqlQDMWxnUuR9TGZgECQ0umh0
	 Wt9SL/xEm4QOzDgbtwOtqQLh6osWPUR3OtkvZkQCKu5Gug/NijtLXE029BFGcHzv6hyh8
	 fXo34aBmmE+DHytxuHrsaQEt6PLLuUaDhejUrvNdLN5Ov9U60sahDUDnMNH4kJKAk/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139755;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hTQcx0ZdhHX9elVBIG/uXUNtXHAcJox1+ReBcPt1fFc=;
	b=Ficw4IUVhGf5k/Vtj90NaN4EzI8aU5epYyrcIk8qZxEtD0uQ+UPGYU0stIUNpofyIGSN
	 OA6vov0x3qbiqMczAmsaWCknfo7pXR1gHRTxl0lHbrqaR/bTMuRqbpk86Zny9ksaiodUs
	 mXB0ngoIPxtyAzW29QWvdGiZFIoS4Hajn3CM1c73Scp1KIzvYHUD7U+SPUsXyBrczug7h
	 zmit8lYkc+d0CaGR8Kb5Pq8d1qHFhcKukzTcBcJUKPi25iLFjhhOrAgEZ52NM89HrgDkC
	 rIxtU2ZDDs7WtCMOn0oze3xoKgStGkqMDIzkMHvz8XTZy8krhVCULmnhZtAqnqnn69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bLMeIOdR;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED40606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 22:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bLMeIOdR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793139754; x=1824675754;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aI7xSBanabWHehAiA+FIMHyZBxCyjl3T9El9Y/I53L8=;
  b=bLMeIOdRQm0GqUPqVbhT2zAFQMkR53aqHOoCxzMn0WvPB7XKTpf2Twtv
   hTHL50xmDXmKWF17SCLcUH2djICkCJ4YnrKYmx57rsQGeV+WOPOsUHMYz
   TVJuGuDHzdPhzSzjrr0XarHqAUwvfem2kZK7gGGpO/IsG76pxNco4bexL
   1hNjHlblvtGZkxYa7+yDZgu3I9NO0fbFJ0guB6r5mvd2vF6LW+0cs5gSG
   DGZ6nZaA6lGQNVAiVdvYV9WE389HBUBV9lAzYfssYo8ZHIqk4eq3cxp27
   Uo2oVYABGh7OY3QxLQ5bE2o3XM5D1P6LOQYh3RHWZi6Fpn8hVmaqeUQCu
   w==;
X-CSE-ConnectionGUID: widbBIS9Ti6ghpg9PT3dLQ==
X-CSE-MsgGUID: 56jInqoSSxGsOqfdndpK9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1730936"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1730936"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 15:22:33 -0700
X-CSE-ConnectionGUID: KQyYugCWT1mb31ayiMCMvA==
X-CSE-MsgGUID: k1NncnfmQiu2XFyaZRT7bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4776143"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2026 15:22:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLpYr-00000000XpE-1djF;
	Tue, 27 Oct 2026 22:22:29 +0000
Date: Wed, 28 Oct 2026 06:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 mm/memory.c:1709: warning: Function parameter or member 'start_t' not
 described in 'unmap_vmas'
Message-ID: <202610280605.9280ey5y-lkp@intel.com>
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

Hi Liam,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   6b915aa34a0d468d55e46535173b0d946dfcf9a5
commit: e9fdabfc2aeb273168e60795e68896dfdeed6fdd [353/353] FROMLIST: BACKPO=
RT: mm: Change do_vmi_align_munmap() side tree index
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261028/=
202610280605.9280ey5y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261028/202610280605.9280ey5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280605.9280ey5y-lkp@i=
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
