Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B187617736
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Jul 2025 23:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752364120; cv=none; b=rcOI5o8a0GnPsTvvJtYn+DvvFK7aW5JcAsg1VVHz2D6kQ/gB9UzHzvMKNYdtSs7WrI766NUnAQ8Lq52iU9u/KCchp0KlsS3OjA/15wRUE92bEr6t+w7BLfyjOauQsyRT2hrBd2J6kohErNGrywzS/qljtOQGBMAszRJ4cTVryVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752364120; c=relaxed/simple;
	bh=Q42O1kzZwokTumrNjvc8vDOoYHDSHYJDIUKAqgw/0GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0/R8fX7XDUrXVHCnbBkf1FFA975bHQ78KDhR5gch8ra3hVOzyc4emNc8cT6tK6LKJ27DNqh8Mg76FVPVLQRGMv7LMOW60a+J0VNOlJyuLEEn6EwwVkJ8DK4894RIbQ89buodc8Pv2ayV4OgKawPVonpu8AsB2ft+Bj4AngSiZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM4Axzz4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM4Axzz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752364119; x=1783900119;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Q42O1kzZwokTumrNjvc8vDOoYHDSHYJDIUKAqgw/0GQ=;
  b=RM4Axzz42EUjU2tU4wrpnGzwnKSYA2BGJpT1o6zcRJwtR3f8OzAVPfl/
   j0GJR/CQPXXYU38aXDkZOCg4AZAhYcdcOTw0/v5LO53nq7wrnQdYMk0vM
   CQInejNJo93KDfN/hStw7cHW7owOrj1ioa3LFxbelfKMI3ggzv2P+ZmWi
   /Spx5Ot57uHdcwEbu94Tp1k9TAlWadQ/B/oOSfPVxDXOFwoLBgF7Ghn9s
   rBg8YFtnmsy4rUcY0OIrn/bU8Ph2zpGkAx1TRen9o+uDGo55BoAGun/ri
   pirLV5lm/l5yu2Rr16FCZ1wVsMoCCgc7/1x1nNJo0JobWNvUwB1W3fC6H
   g==;
X-CSE-ConnectionGUID: Xk5W6RaIT9qq8T6hagrBOg==
X-CSE-MsgGUID: suXWyGriQXedbsquglUQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65964164"
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="65964164"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 16:48:37 -0700
X-CSE-ConnectionGUID: as8W6+MwS8KajyI9mTOYtQ==
X-CSE-MsgGUID: k3sPHsqoS1GUbZbNxIEtHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="156727171"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2025 16:48:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uajxK-0007lX-05;
	Sat, 12 Jul 2025 23:48:34 +0000
Date: Sun, 13 Jul 2025 07:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 11/11] mm/hmm.c:595:21:
 error: implicit declaration of function 'mmu_interval_check_retry'
Message-ID: <202507130727.deZ6Vccv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Ryan,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   dc1cbab31745422f559829a3be0cc2bcfd2967ae
commit: e481300819c9576070aa3b7b8edc2da716d0e3c4 [11/11] ANDROID: GKI: x86: add HMM_MIRROR as DRM hidden dep
config: x86_64-randconfig-104-20250712 (https://download.01.org/0day-ci/archive/20250713/202507130727.deZ6Vccv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130727.deZ6Vccv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507130727.deZ6Vccv-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_range_fault':
>> mm/hmm.c:595:21: error: implicit declaration of function 'mmu_interval_check_retry' [-Werror=implicit-function-declaration]
     595 |                 if (mmu_interval_check_retry(range->notifier,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]


vim +/mmu_interval_check_retry +595 mm/hmm.c

7b86ac3371b70c Christoph Hellwig 2019-08-28  562  
9a4903e49e495b Christoph Hellwig 2019-07-25  563  /**
9a4903e49e495b Christoph Hellwig 2019-07-25  564   * hmm_range_fault - try to fault some address in a virtual address range
f970b977e068aa Jason Gunthorpe   2020-03-27  565   * @range:	argument structure
9a4903e49e495b Christoph Hellwig 2019-07-25  566   *
be957c886d92aa Jason Gunthorpe   2020-05-01  567   * Returns 0 on success or one of the following error codes:
73231612dc7c90 Jérôme Glisse     2019-05-13  568   *
9a4903e49e495b Christoph Hellwig 2019-07-25  569   * -EINVAL:	Invalid arguments or mm or virtual address is in an invalid vma
9a4903e49e495b Christoph Hellwig 2019-07-25  570   *		(e.g., device file vma).
73231612dc7c90 Jérôme Glisse     2019-05-13  571   * -ENOMEM:	Out of memory.
9a4903e49e495b Christoph Hellwig 2019-07-25  572   * -EPERM:	Invalid permission (e.g., asking for write and range is read
9a4903e49e495b Christoph Hellwig 2019-07-25  573   *		only).
9a4903e49e495b Christoph Hellwig 2019-07-25  574   * -EBUSY:	The range has been invalidated and the caller needs to wait for
9a4903e49e495b Christoph Hellwig 2019-07-25  575   *		the invalidation to finish.
f970b977e068aa Jason Gunthorpe   2020-03-27  576   * -EFAULT:     A page was requested to be valid and could not be made valid
f970b977e068aa Jason Gunthorpe   2020-03-27  577   *              ie it has no backing VMA or it is illegal to access
74eee180b935fc Jérôme Glisse     2017-09-08  578   *
f970b977e068aa Jason Gunthorpe   2020-03-27  579   * This is similar to get_user_pages(), except that it can read the page tables
f970b977e068aa Jason Gunthorpe   2020-03-27  580   * without mutating them (ie causing faults).
74eee180b935fc Jérôme Glisse     2017-09-08  581   */
be957c886d92aa Jason Gunthorpe   2020-05-01  582  int hmm_range_fault(struct hmm_range *range)
74eee180b935fc Jérôme Glisse     2017-09-08  583  {
d28c2c9a487708 Ralph Campbell    2019-11-04  584  	struct hmm_vma_walk hmm_vma_walk = {
d28c2c9a487708 Ralph Campbell    2019-11-04  585  		.range = range,
d28c2c9a487708 Ralph Campbell    2019-11-04  586  		.last = range->start,
d28c2c9a487708 Ralph Campbell    2019-11-04  587  	};
a22dd506400d0f Jason Gunthorpe   2019-11-12  588  	struct mm_struct *mm = range->notifier->mm;
74eee180b935fc Jérôme Glisse     2017-09-08  589  	int ret;
74eee180b935fc Jérôme Glisse     2017-09-08  590  
42fc541404f249 Michel Lespinasse 2020-06-08  591  	mmap_assert_locked(mm);
74eee180b935fc Jérôme Glisse     2017-09-08  592  
a3e0d41c2b1f86 Jérôme Glisse     2019-05-13  593  	do {
a3e0d41c2b1f86 Jérôme Glisse     2019-05-13  594  		/* If range is no longer valid force retry. */
a22dd506400d0f Jason Gunthorpe   2019-11-12 @595  		if (mmu_interval_check_retry(range->notifier,

:::::: The code at line 595 was first introduced by commit
:::::: a22dd506400d0f4784ad596f073b9eb5ed7c6a2a mm/hmm: remove hmm_mirror and related

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
