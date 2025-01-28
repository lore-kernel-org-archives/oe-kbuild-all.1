Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4905728DA1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738105486; cv=none; b=cex1Iu97lC1z8EItRKhdyr6vPD3AgIEFPmaGbIGenHdm1DupJuP77j8lzaSa4uImhTWC4ve+/8YYTT2ht4cS12EHNHLIkBs0gWcHtUCO7awlXBcBrQEshHjhj6HO8PRSiNi1Ff2W/c645pq97J/bvGW8H/ByE38MpPqr/6S7mgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738105486; c=relaxed/simple;
	bh=i+QKELCTWnf9vf2bebnCoB9AiDaTsS9AyIjF/sETrJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tD3U9/PZx+R8xWLDgXj/Gsi79YLx2tp0166UNN4zxnwu3vaVywXzOJARVyjOezArc5Y9znOpMTY24s5XhHoBoug7kHPaJiKBbxUvlQEzLNdUlmUf+Qc4CXQUFOfZSwoOEGI39ZNiMwK5w7gYA5KkRC+NeGINe4fIi3DCjPD6vPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgYLxC4J; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgYLxC4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738105484; x=1769641484;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i+QKELCTWnf9vf2bebnCoB9AiDaTsS9AyIjF/sETrJw=;
  b=dgYLxC4JrlNpXS98NSUlvLX1u1SoLRsKz74SucEaktOykqVH3BrO75iV
   Uk693OAXBGvShlck97g8EHy2QX9qxDh1G/xVzACt3osc3Y47vkbq6rXhO
   72g4qIJv/YYDCt2/5xKpc7d/oCFmfieeQ+dAZ+dYe8uB9c77dSdoUUb77
   Wknf9MzpbLGICWgti33LN4pkmssTKTba3ELzQxTbtROq8jkcb6Tn3w3tP
   pASCYy0pMqdtsXiM1yQbimU6vDlxKVRjdz9sqm9auiFSu7O0yZTqTIm64
   xrAp2tMxR/xWYenMBHIl7ekKsBUG9pyVdz2MeLQUzPeb7KyVk0xIshvb3
   A==;
X-CSE-ConnectionGUID: zX7LZFHrSF2SuT4tSFBwRA==
X-CSE-MsgGUID: jaQoTADwTPOoKN7wo0wCPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38516268"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38516268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 15:04:43 -0800
X-CSE-ConnectionGUID: xLo3ODu3RMOFanj3qDb3nQ==
X-CSE-MsgGUID: J3jsurs1SUKdguADRe0g2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109788550"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2025 15:04:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcudL-000iK9-36;
	Tue, 28 Jan 2025 23:04:39 +0000
Date: Wed, 29 Jan 2025 07:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] mm/hmm.c:595:7: error:
 call to undeclared function 'mmu_interval_check_retry'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202501290659.iOUU7MCr-lkp@intel.com>
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
head:   ee01ea4f1b9ee19a82b4258ea9b8ce1ba7dcf84d
commit: e481300819c9576070aa3b7b8edc2da716d0e3c4 [1/1] ANDROID: GKI: x86: add HMM_MIRROR as DRM hidden dep
config: x86_64-randconfig-101-20250128 (https://download.01.org/0day-ci/archive/20250129/202501290659.iOUU7MCr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290659.iOUU7MCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290659.iOUU7MCr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/hmm.c:29:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/hmm.c:595:7: error: call to undeclared function 'mmu_interval_check_retry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     595 |                 if (mmu_interval_check_retry(range->notifier,
         |                     ^
   2 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]


vim +/mmu_interval_check_retry +595 mm/hmm.c

7b86ac3371b70c3 Christoph Hellwig 2019-08-28  562  
9a4903e49e495bf Christoph Hellwig 2019-07-25  563  /**
9a4903e49e495bf Christoph Hellwig 2019-07-25  564   * hmm_range_fault - try to fault some address in a virtual address range
f970b977e068aa5 Jason Gunthorpe   2020-03-27  565   * @range:	argument structure
9a4903e49e495bf Christoph Hellwig 2019-07-25  566   *
be957c886d92aa9 Jason Gunthorpe   2020-05-01  567   * Returns 0 on success or one of the following error codes:
73231612dc7c907 Jérôme Glisse     2019-05-13  568   *
9a4903e49e495bf Christoph Hellwig 2019-07-25  569   * -EINVAL:	Invalid arguments or mm or virtual address is in an invalid vma
9a4903e49e495bf Christoph Hellwig 2019-07-25  570   *		(e.g., device file vma).
73231612dc7c907 Jérôme Glisse     2019-05-13  571   * -ENOMEM:	Out of memory.
9a4903e49e495bf Christoph Hellwig 2019-07-25  572   * -EPERM:	Invalid permission (e.g., asking for write and range is read
9a4903e49e495bf Christoph Hellwig 2019-07-25  573   *		only).
9a4903e49e495bf Christoph Hellwig 2019-07-25  574   * -EBUSY:	The range has been invalidated and the caller needs to wait for
9a4903e49e495bf Christoph Hellwig 2019-07-25  575   *		the invalidation to finish.
f970b977e068aa5 Jason Gunthorpe   2020-03-27  576   * -EFAULT:     A page was requested to be valid and could not be made valid
f970b977e068aa5 Jason Gunthorpe   2020-03-27  577   *              ie it has no backing VMA or it is illegal to access
74eee180b935fcb Jérôme Glisse     2017-09-08  578   *
f970b977e068aa5 Jason Gunthorpe   2020-03-27  579   * This is similar to get_user_pages(), except that it can read the page tables
f970b977e068aa5 Jason Gunthorpe   2020-03-27  580   * without mutating them (ie causing faults).
74eee180b935fcb Jérôme Glisse     2017-09-08  581   */
be957c886d92aa9 Jason Gunthorpe   2020-05-01  582  int hmm_range_fault(struct hmm_range *range)
74eee180b935fcb Jérôme Glisse     2017-09-08  583  {
d28c2c9a487708b Ralph Campbell    2019-11-04  584  	struct hmm_vma_walk hmm_vma_walk = {
d28c2c9a487708b Ralph Campbell    2019-11-04  585  		.range = range,
d28c2c9a487708b Ralph Campbell    2019-11-04  586  		.last = range->start,
d28c2c9a487708b Ralph Campbell    2019-11-04  587  	};
a22dd506400d0f4 Jason Gunthorpe   2019-11-12  588  	struct mm_struct *mm = range->notifier->mm;
74eee180b935fcb Jérôme Glisse     2017-09-08  589  	int ret;
74eee180b935fcb Jérôme Glisse     2017-09-08  590  
42fc541404f2497 Michel Lespinasse 2020-06-08  591  	mmap_assert_locked(mm);
74eee180b935fcb Jérôme Glisse     2017-09-08  592  
a3e0d41c2b1f86b Jérôme Glisse     2019-05-13  593  	do {
a3e0d41c2b1f86b Jérôme Glisse     2019-05-13  594  		/* If range is no longer valid force retry. */
a22dd506400d0f4 Jason Gunthorpe   2019-11-12 @595  		if (mmu_interval_check_retry(range->notifier,

:::::: The code at line 595 was first introduced by commit
:::::: a22dd506400d0f4784ad596f073b9eb5ed7c6a2a mm/hmm: remove hmm_mirror and related

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
