Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4F018C00E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 21:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725916366; cv=none; b=Z/GlSjvb7KEan4euA1ULueXoX0oZVjJ4jJQLaL2/8lDLdd0guJTcy4Vpb696XTJdCstqVP8wSKztwGeMLGThW5AbQeO3fnaa0zsojo8w0xUj4ph/+tfvlGXGeab7b4sLluskD+ZoI5cWeo3ndJnyjnNhgGZIpPtEwAbixb3onaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725916366; c=relaxed/simple;
	bh=lNq2ZiVM7y2s7GxT6RD254t6XcSx+9VA3jzmD2zeMWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jERd2y2TuqOct43z0XetgCrNnCTp5Swk3SD3BENNDTFN0lkhX0UGnAYQGadySdymD7uJxlxOU0XoMKY3Rgzo6BBVYoP7fVh+Zxwnnm6FU2vpsf/cOPHcmtQjisVMCPAPuCq2REwZyskIsfqXmBpxldbsC5dvjlHMx076pP+mb2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1IzMxFb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1IzMxFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725916365; x=1757452365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lNq2ZiVM7y2s7GxT6RD254t6XcSx+9VA3jzmD2zeMWM=;
  b=N1IzMxFb/xjcqQorSDjPmFoeIV1B18AC+2K5mtFtPXHpQx5UpoaJIxxy
   KCuY5Xsjw7xOpL9J8zoNOqvecen2w7O1cziW7W5gL/ApV91f60o1lRIZu
   Muonj0OfKpQDi+WYR6cpFgpZgEsH5hMhOgfn8COQ8r7y9s7RTfsMrQW9Z
   JK5J+Rb90WRWgykDp70v2PUVGJWSEdyBLPNi+KE9THCSK7mN1yekd3qMl
   9qb6iK2erjy4vBuMmXyk/X5n5w8Nvec3dYL+APILi1GHFNFkreaTeC1ux
   xEXk/mRp5TNCWTywDCzzmztpiyhTy3zmoPA1bQZXcBOLt6AC+cHJ23eds
   w==;
X-CSE-ConnectionGUID: oDwSUMVYS2WYjtrbHqYsBA==
X-CSE-MsgGUID: komV0Sw5RbarWf2f0KYRQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35303392"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="35303392"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 14:12:44 -0700
X-CSE-ConnectionGUID: 8U6H5Dc2SzaNEfU3H+IpyA==
X-CSE-MsgGUID: ZtgLK+w0QnyCaY3WU9THWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66505920"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2024 14:12:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snlgf-000FEW-1E;
	Mon, 09 Sep 2024 21:12:41 +0000
Date: Tue, 10 Sep 2024 05:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-cip 5512/23588]
 drivers/firmware/efi/capsule.c:249:16: warning: comparison between signed
 and unsigned integer expressions
Message-ID: <202409100533.8dGCN2ik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-cip
head:   309cb0b211f91a4c480ee93f99e73b723bea2c4a
commit: 03f417a59c6e2d6c62b7e2571049244bfc70e033 [5512/23588] efi: Add 'capsule' update support
config: arm64-randconfig-003-20240910 (https://download.01.org/0day-ci/archive/20240910/202409100533.8dGCN2ik-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100533.8dGCN2ik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100533.8dGCN2ik-lkp@intel.com/

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
