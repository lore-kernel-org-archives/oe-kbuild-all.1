Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447522F19
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 23:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727999279; cv=none; b=diHq4+w7+Xw0aBy1N2B75r7+oju7kOK2zSogc05joqkWiNjmacoMXkV07jDR0kv/3BICgUwNgjJ1AwaWXmClbAFDUCFFVc236GB6263T7hThmMBt7aE0hDksQrSFP2yZKy6qiqB1ikJggRDQ10FkSfCnuGzdgjqA8dDZy4oqTKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727999279; c=relaxed/simple;
	bh=Ot3da+FO502KsN12h8Aml2kUPWkbfFGqC5am8iNmux0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwbmlajl62u0ylmH+qhanS5h25vAIBXH6X6SQX/aahBqzxtHiRlQIs0yPuTBOglHuvQHv3ZgBkyk9QRLL1og+uZ26VGqnv6c5j38OHsoD0j6BzZnbRt2EpTclG5MAM1q+HnkmvlJjmScuexZI1e7QWg5lC2spNvsDjpi2EEyuTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RC1I8Ica; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RC1I8Ica"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727999277; x=1759535277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ot3da+FO502KsN12h8Aml2kUPWkbfFGqC5am8iNmux0=;
  b=RC1I8IcaDtrthfj59k7ZLXWNZsdYH0/pS0gqDdA321ZmhVQe8qiv+1T6
   C1HOF+7EkaQf0Y2yZ88F7I/01tz1nR5DSRRqsgleI/B7TYsui5b7ZTjaF
   wNFHM5QYPdAE8uDY9YH6KS8VtzT30u59S4PTF4qdVniyXW5j4wX0M6sf5
   KzhbKM4tlgSo5vPsTR12g1XTeT1D/xVDFetZedL9w9Si0vfim9Jc0WQ4E
   4J6chK3HCoZnTdrxvISjoVwtbXwxT0w6xk2RexA09bhZa1V3MIUcY+QIw
   29m/u3OdnTzZVGdAhkUoYlx//DVk6xobwYZEBlrZnNECpSJcgT0Tz2BCb
   w==;
X-CSE-ConnectionGUID: 8bT7jIX+RfKAwF7WenLhOA==
X-CSE-MsgGUID: bglWlaCxS56CAiArO+zuGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44683354"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="44683354"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 16:47:57 -0700
X-CSE-ConnectionGUID: VUu3YZ29R0Sji9l2lnIo4g==
X-CSE-MsgGUID: DJBMIQ0bTcGo71YuFt2spw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74832310"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Oct 2024 16:47:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swVY2-00011y-0H;
	Thu, 03 Oct 2024 23:47:54 +0000
Date: Fri, 4 Oct 2024 07:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-cip-rt 6450/25052]
 drivers/firmware/efi/capsule.c:249:16: warning: comparison between signed
 and unsigned integer expressions
Message-ID: <202410040741.8uckwecT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matt,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-cip-rt
head:   d51e63480f2a36ac1c3a542632e60e1e2bdc0119
commit: 03f417a59c6e2d6c62b7e2571049244bfc70e033 [6450/25052] efi: Add 'capsule' update support
config: arm64-randconfig-001-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040741.8uckwecT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040741.8uckwecT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040741.8uckwecT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/hw_breakpoint.h:20:0,
                    from arch/arm64/include/asm/processor.h:33,
                    from arch/arm64/include/asm/spinlock.h:21,
                    from include/linux/spinlock.h:87,
                    from include/linux/mmzone.h:7,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:14,
                    from drivers/firmware/efi/capsule.c:12:
   arch/arm64/include/asm/cpufeature.h: In function 'arm64_ftr_value':
   arch/arm64/include/asm/cpufeature.h:152:68: warning: signed and unsigned type in conditional expression [-Wsign-compare]
      cpuid_feature_extract_field_width(val, ftrp->shift, ftrp->width) :
                                                                       ^
   drivers/firmware/efi/capsule.c: In function 'efi_capsule_update':
>> drivers/firmware/efi/capsule.c:249:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < sg_count; i++) {
                   ^
   drivers/firmware/efi/capsule.c:257:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < sg_count; i++) {
                   ^
   drivers/firmware/efi/capsule.c:266:17: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      for (j = 0; j < SGLIST_PER_PAGE && count > 0; j++) {
                    ^
   drivers/firmware/efi/capsule.c:279:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (i + 1 == sg_count)
                ^~
   drivers/firmware/efi/capsule.c:292:22: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; rv && i < sg_count; i++) {
                         ^


vim +249 drivers/firmware/efi/capsule.c

   194	
   195	/**
   196	 * efi_capsule_update - send a capsule to the firmware
   197	 * @capsule: capsule to send to firmware
   198	 * @pages: an array of capsule data pages
   199	 *
   200	 * Build a scatter gather list with EFI capsule block descriptors to
   201	 * map the capsule described by @capsule with its data in @pages and
   202	 * send it to the firmware via the UpdateCapsule() runtime service.
   203	 *
   204	 * @capsule must be a virtual mapping of the first page in @pages
   205	 * (@pages[0]) in the kernel address space. That is, a
   206	 * capsule_header_t that describes the entire contents of the capsule
   207	 * must be at the start of the first data page.
   208	 *
   209	 * Even though this function will validate that the firmware supports
   210	 * the capsule guid, users will likely want to check that
   211	 * efi_capsule_supported() returns true before calling this function
   212	 * because it makes it easier to print helpful error messages.
   213	 *
   214	 * If the capsule is successfully submitted to the firmware, any
   215	 * subsequent calls to efi_capsule_pending() will return true. @pages
   216	 * must not be released or modified if this function returns
   217	 * successfully.
   218	 *
   219	 * Callers must be prepared for this function to fail, which can
   220	 * happen if we raced with system reboot or if there is already a
   221	 * pending capsule that has a reset type that conflicts with the one
   222	 * required by @capsule. Do NOT use efi_capsule_pending() to detect
   223	 * this conflict since that would be racy. Instead, submit the capsule
   224	 * to efi_capsule_update() and check the return value.
   225	 *
   226	 * Return 0 on success, a converted EFI status code on failure.
   227	 */
   228	int efi_capsule_update(efi_capsule_header_t *capsule, struct page **pages)
   229	{
   230		u32 imagesize = capsule->imagesize;
   231		efi_guid_t guid = capsule->guid;
   232		unsigned int count, sg_count;
   233		u32 flags = capsule->flags;
   234		struct page **sg_pages;
   235		int rv, reset_type;
   236		int i, j;
   237	
   238		rv = efi_capsule_supported(guid, flags, imagesize, &reset_type);
   239		if (rv)
   240			return rv;
   241	
   242		count = DIV_ROUND_UP(imagesize, PAGE_SIZE);
   243		sg_count = sg_pages_num(count);
   244	
   245		sg_pages = kzalloc(sg_count * sizeof(*sg_pages), GFP_KERNEL);
   246		if (!sg_pages)
   247			return -ENOMEM;
   248	
 > 249		for (i = 0; i < sg_count; i++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
