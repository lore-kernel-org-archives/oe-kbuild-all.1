Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1C5EE96
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706974084; cv=none; b=CAHoz0odkyQIvTQ/wOfjxlWQyK8/lUHQLzUuXXF9ZvxKmi2/LXat+5nWMWWyenuYUG+bT6+5opUxGRlHOUubA6m0mZCkCPFMs9udWzs+lAKPr5lrxn6cl4eQkUR9wZ1jz20OHZa5YlNrqCNMBm72KL2SsKI6yKBacWVCEbmdb+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706974084; c=relaxed/simple;
	bh=mleHdsRpgFiNqpNnv72bNRKAGIJtE0nN60rA3Mj/2W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ry4bDYWATA6/S+A5MSGcrV3IaSdjfmzIn8EmnCt5Sp8MKXxzMd2QZ0DQ+6+6qAHtldGZjS/qBN73V9e5cGEd1Me4Ml+gUFegVQbR4Cjy8JVXxI7tK6CBLg8pzTd5W9XxZbfWqnwOuuGT7dXswuXSiNtVIg8OA6MAjYuHf+Zq33I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DffyA2ER; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DffyA2ER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706974081; x=1738510081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mleHdsRpgFiNqpNnv72bNRKAGIJtE0nN60rA3Mj/2W4=;
  b=DffyA2ER9K1cktXjwpnkv7oHTroql+n46ErQKlTTw2SrKgU/Q82gozgw
   lIg9uA3w4eNCtWtcdbU62uGXT9ZNRR2qj5NyEdQpqcoyUzbaWUU2p1FJg
   ngN7ff3MVmTMsNZdIIrI4lolyPeDFjWj8XDWG8DECRvyj+tO6kSWIBUVw
   W7AmEfVUYk68gvwpHg/E6wjdui5GDIbN+jY47CRjidU69H1HqudHBUMYF
   96xC+mguw9liRPnIu8y+1V8D49Cl44ccvjqfueDnx3amXaJmSOhiaQcwt
   1lFgqyCc1m6jiIwFVd5HXflM51qNSmlpArNBy3AEXTUmOcW59GN83kQHv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="22799141"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="22799141"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 07:28:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="932757308"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="932757308"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2024 07:27:59 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWHvx-0005EQ-0s;
	Sat, 03 Feb 2024 15:27:57 +0000
Date: Sat, 3 Feb 2024 23:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Fleming <matt@codeblueprint.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Ben Hutchings <bwh@kernel.org>
Subject: [cip:linux-4.4.y-cip-rebase 1884/2766]
 drivers/firmware/efi/capsule.c:249:16: warning: comparison between signed
 and unsigned integer expressions
Message-ID: <202402032355.LoqrMSFQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-cip-rebase
head:   a1ba69950787dfcb1e5268dc14233e12f2861076
commit: a15361999f329f981fd182dff850f23627bbd2c2 [1884/2766] efi: Add 'capsule' update support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240203/202402032355.LoqrMSFQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032355.LoqrMSFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032355.LoqrMSFQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/hw_breakpoint.h:20:0,
                    from arch/arm64/include/asm/processor.h:33,
                    from arch/arm64/include/asm/spinlock.h:21,
                    from include/linux/spinlock.h:87,
                    from include/linux/mmzone.h:7,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:14,
                    from drivers/firmware/efi/capsule.c:12:
   arch/arm64/include/asm/cpufeature.h: In function 'cpuid_feature_extract_field':
   arch/arm64/include/asm/cpufeature.h:156:55: warning: signed and unsigned type in conditional expression [-Wsign-compare]
      cpuid_feature_extract_signed_field(features, field) :
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
