Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A9723C4F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 21:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751491368; cv=none; b=Q4pBC+s4eDyW4XKFEyoOQ7KyO/KSjZyeaC64cm2mUcigpUtIQHNx84dmDXoxmWCr6zF6+OQ8AEnmakar/d4rGOoCFiXWwNQZl2OkZcp/7lGC3PokOTZh1aOzY9HAme8ET+sWd2LMTkGJrktMGQPpsfE8G4y8SS6p9pUOcVnVv8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751491368; c=relaxed/simple;
	bh=tqk5Xf/QtXNEXZ6oYrNirpBR+DeBQCuZcsLz+PyHC9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cz61MK1l8rmcnTwlGgERMN8yrjynp8t7AHYRqlg9DVQV+PzpUGwPpsHNqgJ+LGtRWA2sUpTOXgQwLtYp9hrLUMlRJ+HHD1/4nT6gGWxDLWngXiD+fiFfDZx8iwUZuKJ5EDEOPwEHtK6/D8uiQp8Slr5q1fiKEqn6oyntBRMpvb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLZgPUT8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLZgPUT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751491367; x=1783027367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tqk5Xf/QtXNEXZ6oYrNirpBR+DeBQCuZcsLz+PyHC9A=;
  b=YLZgPUT8xgEBhA7JMuofoSWI300JWNV/ZE1EEd9T1lc4SYdSpth8GxpM
   890+IMfRlOJ1qvbmKEnPTWYVrEbVI0ZoVhX/syS7ccpbF+rMQrJkejKv6
   e0pRLIs6oBb/DJcVK097Ecg+EPdJDXjI68lnZWCJvnay/Qd3ZqRY0BQTF
   SRirZPsVej9x8zVkec7mTfo2FHDvsnO5BHrSQ3MyVGAZTgFsv3e1uF1/9
   BT+pizy3m5Y0QIYxrE5utfSUfED0YnxFnVT6jhocyOC3yiNm2wCWljruB
   kYdPVyJ2oITd1JlTdYb+AyujWKCcOKP0rnxFgRGPiEFWW0xOKInt5mp9Q
   Q==;
X-CSE-ConnectionGUID: m2h3L1DtQFmZQ8Lob+EkPg==
X-CSE-MsgGUID: ZmAo9Iu7SkuaDj8ugyRi0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65262400"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="65262400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 14:22:46 -0700
X-CSE-ConnectionGUID: fWf6cBySRJyhYlkD7gcf0g==
X-CSE-MsgGUID: LGDe1B/WQyafCJ/8z46Zhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="185125788"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jul 2025 14:22:43 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX4ue-0000Kv-2C;
	Wed, 02 Jul 2025 21:22:40 +0000
Date: Wed, 2 Jul 2025 23:22:20 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3003/3003] arch/x86/kernel/cpu/sgx/encl.c:289:
 warning: Excess function parameter 'kref' description in 'sgx_encl_release'
Message-ID: <202507022302.stbezZy1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4755f6a2b98f251edcf63f98f416b5d76425f8c
commit: 2e2b7d495f53c8cc013c4177c1f9da540f9155c9 [3003/3003] x86/sgx: Add a page reclaimer
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250702/202507022302.stbezZy1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022302.stbezZy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022302.stbezZy1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/sgx/encl.c:289: warning: Function parameter or member 'ref' not described in 'sgx_encl_release'
>> arch/x86/kernel/cpu/sgx/encl.c:289: warning: Excess function parameter 'kref' description in 'sgx_encl_release'


vim +289 arch/x86/kernel/cpu/sgx/encl.c

   280	
   281	/**
   282	 * sgx_encl_release - Destroy an enclave instance
   283	 * @kref:	address of a kref inside &sgx_encl
   284	 *
   285	 * Used together with kref_put(). Frees all the resources associated with the
   286	 * enclave and the instance itself.
   287	 */
   288	void sgx_encl_release(struct kref *ref)
 > 289	{
   290		struct sgx_encl *encl = container_of(ref, struct sgx_encl, refcount);
   291		struct sgx_va_page *va_page;
   292		struct sgx_encl_page *entry;
   293		unsigned long index;
   294	
   295		xa_for_each(&encl->page_array, index, entry) {
   296			if (entry->epc_page) {
   297				/*
   298				 * The page and its radix tree entry cannot be freed
   299				 * if the page is being held by the reclaimer.
   300				 */
   301				if (sgx_unmark_page_reclaimable(entry->epc_page))
   302					continue;
   303	
   304				sgx_free_epc_page(entry->epc_page);
   305				encl->secs_child_cnt--;
   306				entry->epc_page = NULL;
   307			}
   308	
   309			kfree(entry);
   310		}
   311	
   312		xa_destroy(&encl->page_array);
   313	
   314		if (!encl->secs_child_cnt && encl->secs.epc_page) {
   315			sgx_free_epc_page(encl->secs.epc_page);
   316			encl->secs.epc_page = NULL;
   317		}
   318	
   319		while (!list_empty(&encl->va_pages)) {
   320			va_page = list_first_entry(&encl->va_pages, struct sgx_va_page,
   321						   list);
   322			list_del(&va_page->list);
   323			sgx_free_epc_page(va_page->epc_page);
   324			kfree(va_page);
   325		}
   326	
   327		if (encl->backing)
   328			fput(encl->backing);
   329	
   330		cleanup_srcu_struct(&encl->srcu);
   331	
   332		WARN_ON_ONCE(!list_empty(&encl->mm_list));
   333	
   334		/* Detect EPC page leak's. */
   335		WARN_ON_ONCE(encl->secs_child_cnt);
   336		WARN_ON_ONCE(encl->secs.epc_page);
   337	
   338		kfree(encl);
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
