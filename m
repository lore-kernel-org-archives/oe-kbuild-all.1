Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2045B194A6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 22:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738103624; cv=none; b=hK+goi5OXCfeGH0MkK3K14lj0zBtx2nfoaD6Mfpq7skIUkYbjJMHnA6QNVRybC9M96L1Mg5rWt8L4WXM24pU+KyNSzBTsjRmBABeH6lSGEtce2a798skk+2RJTuUvQ4U2YIbeWozMpOGIF6xAy0PbrdFwvR+cicougLf9XlnGFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738103624; c=relaxed/simple;
	bh=dh7VGcnlMb1Tm1pwS5FoAPGoqRcgFE2ayu/cvVFGmyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHzs/lLnfqlKEFbh7bcsqSHLQouZDttBPBXo96XvRhEMcgoFbxst28BomY1XooK3frpI7LJbEUYshCVwJV1Te/AYj6nDYEahlvcTRFl3w/VRuITAaUSQS0lMdLdw7sFYIk/ryz2dtxj93fy40ZF+X6H7bEyPepsvQxsZLx7urZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLqONuoy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLqONuoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738103622; x=1769639622;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dh7VGcnlMb1Tm1pwS5FoAPGoqRcgFE2ayu/cvVFGmyo=;
  b=lLqONuoy1UaLh5Iky1Cg4AEHdCBLPpSHvUvk97KK+GHQJ+mh3kCv4lKE
   26oS2R76Sbl+XqHPVIUZDdUpAPndKzpOHKSRDFdPkbc5Ivc9OIFZJPov+
   p8hQcXXolTtQT9NUkEcVcZVxgkCVvwWOPNiKbnXcz1YrpvJCY7/YAs4Y3
   aS5tluEArfVbewihs7MB+ortdXkGfctJe5t9Q9IG21IkzpF/dFeoBhR52
   AkyqmFegyyhEnvnvRu3b/nxpfo4U36Jogj3JSKo980etjx4xM+qUIufif
   yKEQyN9NtJneDLtulZos1VY6jBgFlG3B8PXEIavEMl/5a9HjIjH10GiJR
   Q==;
X-CSE-ConnectionGUID: QKwrnqaXRQek/FFj87poIQ==
X-CSE-MsgGUID: mJfqcd9eTNyebSpkNMMKrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="26204108"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="26204108"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 14:33:41 -0800
X-CSE-ConnectionGUID: Pub4IpVTSBSrZwPJ/y1Jkg==
X-CSE-MsgGUID: +dfHyeZSR1yHOnint9EWcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="113898341"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2025 14:33:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcu9J-000iIl-1y;
	Tue, 28 Jan 2025 22:33:37 +0000
Date: Wed, 29 Jan 2025 06:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] mm/hmm.c:595:21: error:
 implicit declaration of function 'mmu_interval_check_retry'
Message-ID: <202501290642.bjAIuHH1-lkp@intel.com>
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
config: x86_64-randconfig-102-20250128 (https://download.01.org/0day-ci/archive/20250129/202501290642.bjAIuHH1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290642.bjAIuHH1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290642.bjAIuHH1-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_range_fault':
>> mm/hmm.c:595:21: error: implicit declaration of function 'mmu_interval_check_retry' [-Werror=implicit-function-declaration]
     595 |                 if (mmu_interval_check_retry(range->notifier,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]


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
