Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB79020FAB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753244430; cv=none; b=pOMeMSt1CuXEPgetjhfjNXcn6mkCXSnl3/iz9K5FeQDkKf5z27ZlrZ7inNG8Qmx+br4sCN5c6dt1TqfGgJNVrnejTL1gDZ9EeotjuGmBKUKiu1eqD1A1lQB4WfTyKsGstVFOAuopVcHiMCCYfAHuIBeKMasyGw3LIPhKTftJeMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753244430; c=relaxed/simple;
	bh=yJ2QhLq7VcizGH3DZlRfLUCqJ5bAIcxZXPaaNSEO/RA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vqc+Zav8j5jMu9GBmZXl6DH7Zd2DRdyGujl9orgV1+xH8hQDgsBq0zOO0fnqv1QWbS3BPkdtPFdbPUb1HlrrNY586FdesMW8zR2HVwAU1S2ue2l80rYcOT9t9zRkCBisgmhBwCz+cVz68Cr49ZXLu4hzdtfLebPm/vsQ+mQp3P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jX48zKm0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jX48zKm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753244428; x=1784780428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yJ2QhLq7VcizGH3DZlRfLUCqJ5bAIcxZXPaaNSEO/RA=;
  b=jX48zKm0fH/qEKSPMdfe4WTdzUfQwmNe2ghiTMB30eTdNgszDzkkd2I7
   INCt1t/ORUpBKitWyfYJXSzQJLcgcupy2Y5Yld58ZzIz4NA3yZ3pqpmsw
   gwEJn4mJwd6dhyfHzf/uPiN7llQEA4IUjwrZHfvdGxIc+fReomEWhAHCK
   Lw/NuzylmucyEsKULOWJUQYJn4K5QCrSVTYOj5ZmORUWtadfKA4TR4ebs
   zrg9zJZMVOIquz4/rXM0gozTL/O/fA5Ls/kLyjTwPkYZGgSCZNadtHk/u
   QuVDA/3mUqQQpubTsxKgbgR3re0EsSw8Yb07DyTLR4njSBArQ0ytoEhjL
   g==;
X-CSE-ConnectionGUID: tUgCNVf6Q5WP3TOvaB+tQA==
X-CSE-MsgGUID: 6Kidg7GBS+CPrqIWrel+dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55622965"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55622965"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 21:20:28 -0700
X-CSE-ConnectionGUID: LL7H5bFuRju81BAHE6raHQ==
X-CSE-MsgGUID: 0KADEK18S42tqlrEjsiLNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="190315294"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jul 2025 21:20:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueQxs-000Ix5-1p;
	Wed, 23 Jul 2025 04:20:24 +0000
Date: Wed, 23 Jul 2025 12:19:48 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] mm/memory.c:3334: warning:
 Excess function parameter 'start' description in 'unmap_mapping_zeropages'
Message-ID: <202507231256.VKBzpBLH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kaihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7fc3abd8b21f1ef01108269b858d36abd6b95372
commit: 09797fd32d329b879a57e99f74d83d5704511ea4 [0/9] anolis: mm: add switch for file zero page
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250723/202507231256.VKBzpBLH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231256.VKBzpBLH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231256.VKBzpBLH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:3334: warning: Excess function parameter 'start' description in 'unmap_mapping_zeropages'
>> mm/memory.c:3334: warning: Excess function parameter 'nr' description in 'unmap_mapping_zeropages'


vim +3334 mm/memory.c

  3323	
  3324	/**
  3325	 * unmap_mapping_zeropages() - Unmap zeropages from processes.
  3326	 * @mapping: The address space containing pages to be unmapped.
  3327	 * @start: Index of first page to be unmapped.
  3328	 * @nr: Number of pages to be unmapped.  0 to unmap to end of file.
  3329	 *
  3330	 * Unmap the zero pages in this address space from any userspace process which
  3331	 * has them mmaped.
  3332	 */
  3333	void unmap_mapping_zeropages(struct address_space *mapping)
> 3334	{
  3335		struct zap_details details = { };
  3336	
  3337		details.check_mapping = mapping;
  3338		details.first_index = 0;
  3339		details.last_index = ULONG_MAX;
  3340		details.flags = ZAP_ZEROPAGE;
  3341	
  3342		i_mmap_lock_write(mapping);
  3343		if (unlikely(!RB_EMPTY_ROOT(&mapping->i_mmap.rb_root)))
  3344			unmap_mapping_range_tree(&mapping->i_mmap, &details);
  3345		i_mmap_unlock_write(mapping);
  3346	}
  3347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
