Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EEF21A427
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323299; cv=none; b=GxoqMKEk1VJNtSqjFUE0/OzZ4z0yVjI6OGh1Usf4uvVRQ6GOTRaRTLn0RqakXdPLtiKFqBfif0uwDtagW0o1IpaxZ65RpxaMj8MS9GTeLU4ojBwqC4ryZKWrk6nLARNpEXAOyE3WSI785b0PzDwvqNrKxgwHlB6S9mx1Q6lCHeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323299; c=relaxed/simple;
	bh=Ta7G6CBTxU8DNvqDA8rYAFkViNkgINUqipetKCAfWUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNwGLy+ThfenJC9v1DNG01kK7Jrywj1gJGltL6KEtiicoLnRuA2mP1IHRGdBbndYBrodX0CX8I3VNr/EY1HlBWJyPODJ1eTRQz0D+auX8jFAPTGmLyJWO7irMl85lMfWN3W7v08VNGNO9PF6BXo5+M25IJp5xB/rOV8ujwlw4v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFWSLvtr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFWSLvtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747323298; x=1778859298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ta7G6CBTxU8DNvqDA8rYAFkViNkgINUqipetKCAfWUY=;
  b=oFWSLvtrMmRIjp7mQnk0Vyf3pMlJgC0e6KfiDVvsff//AZTrZ+svI1Pg
   r2VQIEu1hpRkfiEayTmBQnSS3Y6hDoiFLDC6nf5vndoZxs7ZEKu+Vi67v
   oparIwEMrSRoz5BaAVkT70TJF1y7CaKD7UxxQj7C4N1Mszv38z8uT/Z+L
   Jjj/e9cUEIvs+iAr8maJnqkubkCcYdmt6vkcqGaoTNljBuSEGphq1MOjI
   rGgT6CsLPEovJrA4d7LXnfqa3Wi/glwGFNXt19AcAKflF8hfVvoDQ3q0e
   SErLHGRS0OETfn2iFRUDscEOoZljArYNK/mJdr4ljxZRZACy3y34G8Xt9
   w==;
X-CSE-ConnectionGUID: C6bTjkoqRC+Q5FBHw2jZ+w==
X-CSE-MsgGUID: ELxcG97lQdupbHhg7bn0+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59496275"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="59496275"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 08:34:58 -0700
X-CSE-ConnectionGUID: vkVBHvzGRHeGs4epsKrZNA==
X-CSE-MsgGUID: /qSu1vxLSGKouuHedNJmlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138129531"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2025 08:34:56 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFabm-0000H9-16;
	Thu, 15 May 2025 15:34:54 +0000
Date: Thu, 15 May 2025 23:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] arch/x86/kvm/svm/csv.c:2037: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202505152346.3HOURWea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: c97c1d0165cc29f48725448620197d76e751d734 [2229/2229] KVM: SVM: CSV: Add ioctl API to unpin shared pages of CSV3 guest
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250515/202505152346.3HOURWea-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152346.3HOURWea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505152346.3HOURWea-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/csv.c:2037: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    *  Return negative error code on fail,


vim +2037 arch/x86/kvm/svm/csv.c

  2035	
  2036	/**
> 2037	 *  Return negative error code on fail,
  2038	 *  or return the number of pages unpinned successfully
  2039	 */
  2040	static int csv3_unpin_shared_memory(struct kvm *kvm, gpa_t gpa, u32 num_pages)
  2041	{
  2042		struct kvm_csv_info *csv;
  2043		struct shared_page *sp;
  2044		gfn_t gfn;
  2045		unsigned long i;
  2046		int unpin_cnt = 0;
  2047	
  2048		csv = &to_kvm_svm_csv(kvm)->csv_info;
  2049		gfn = gpa_to_gfn(gpa);
  2050	
  2051		mutex_lock(&csv->sp_lock);
  2052		for (i = 0; i < num_pages; i++, gfn++) {
  2053			sp = shared_page_remove(&csv->sp_mgr, gfn);
  2054			if (sp) {
  2055				unpin_user_page(sp->page);
  2056				kmem_cache_free(csv->sp_slab, sp);
  2057				csv->sp_mgr.count--;
  2058				unpin_cnt++;
  2059			}
  2060		}
  2061		mutex_unlock(&csv->sp_lock);
  2062	
  2063		return unpin_cnt;
  2064	}
  2065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
