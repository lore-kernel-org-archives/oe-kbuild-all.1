Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E60FBA50
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 18:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250657; cv=none; b=i5MANBYXCFmFotx013Z6ubJqOo5kBmLp8XPLWdAOXXI55NTSb49SzixooA2PHz132MqgNXdWwKFhOq7DVhDn5DskvY8StPGbACd1ABH6A3b0pq2qIjYg62vqcgQq911UqbgZvo+OqwIa+rztn1EkiEZYkKUdAMtVbQe4/rWaK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250657; c=relaxed/simple;
	bh=5DS9cPPilbKHo1jHMchMrjtoesE2l1wAmWjAgsqQ9fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpAax0aeI5sNR59XtvRAOArTvg0HjL55QxDMoNhyXxhz+splPHc4VSZCYod8cle+gS2qHu/mLxhEd6fSU9JMjCI99n30rNELMbJ7Xb/D+lncMxODKdL/lx3SJxyqPRYQy3lNuD9cuA16BtAZ6m/qp6uTuL5T9LF2fUB5fD/t9bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaP07HIy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaP07HIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726250655; x=1757786655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5DS9cPPilbKHo1jHMchMrjtoesE2l1wAmWjAgsqQ9fA=;
  b=ZaP07HIyd5+6CMujfvBQujkdSRuGZPIdLdS+O970vdVNHQslCzI7FxZG
   Jw7EQT64cFzwyA+gTcp4Hx4M8ZZlSamYtKtolVTGEE5uRwprBK1RYIoPR
   PiYyP+EGm6SCsLbJ0sSoqGdCFlMgQEjD/sdDrZXIfF5xI1mv4wF+jha0v
   ilIvpPeRnfqHXtGNMUSm9DhT3aMFt4DlA8AgaUNFCNLkpXf/sVFDHf4M/
   erdo0tjLJVe9z5s7MR+G99c4FXfirR1hMTj6WRkl8z3STgVpkMtz0YWZJ
   uH7enroHVfiCRKCZaVPAn7pO5gVObiXtXPhJ0izOKaY7e3RMciXPv86BH
   g==;
X-CSE-ConnectionGUID: 3OszpW9wS76/MY3xoacEuA==
X-CSE-MsgGUID: GJ/oSGq9T4SwT5xYDOJBfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25288131"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25288131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:04:14 -0700
X-CSE-ConnectionGUID: Qhezc30TSW2lZ8mIgWIVsQ==
X-CSE-MsgGUID: zUmGgLowS1SkWeE507YibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="98822304"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Sep 2024 11:04:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spAeR-0006nc-0B;
	Fri, 13 Sep 2024 18:04:11 +0000
Date: Sat, 14 Sep 2024 02:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Roy <roypat@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 07/10] kvm: pfncache: invalidate when memory
 attributes change
Message-ID: <202409140116.x5fqwXJL-lkp@intel.com>
References: <20240910163038.1298452-8-roypat@amazon.co.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910163038.1298452-8-roypat@amazon.co.uk>

Hi Patrick,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 332d2c1d713e232e163386c35a3ba0c1b90df83f]

url:    https://github.com/intel-lab-lkp/linux/commits/Patrick-Roy/kvm-gmem-Add-option-to-remove-gmem-from-direct-map/20240911-003258
base:   332d2c1d713e232e163386c35a3ba0c1b90df83f
patch link:    https://lore.kernel.org/r/20240910163038.1298452-8-roypat%40amazon.co.uk
patch subject: [RFC PATCH v2 07/10] kvm: pfncache: invalidate when memory attributes change
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409140116.x5fqwXJL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140116.x5fqwXJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140116.x5fqwXJL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/pfncache.c: In function 'mmu_notifier_retry_cache':
>> arch/x86/kvm/../../../virt/kvm/pfncache.c:187:16: error: 'struct kvm' has no member named 'attribute_change_in_progress'
     187 |         if (kvm->attribute_change_in_progress)
         |                ^~


vim +187 arch/x86/kvm/../../../virt/kvm/pfncache.c

   163	
   164	static inline bool mmu_notifier_retry_cache(struct kvm *kvm, unsigned long mmu_seq)
   165	{
   166		/*
   167		 * mn_active_invalidate_count acts for all intents and purposes
   168		 * like mmu_invalidate_in_progress here; but the latter cannot
   169		 * be used here because the invalidation of caches in the
   170		 * mmu_notifier event occurs _before_ mmu_invalidate_in_progress
   171		 * is elevated.
   172		 *
   173		 * Note, it does not matter that mn_active_invalidate_count
   174		 * is not protected by gpc->lock.  It is guaranteed to
   175		 * be elevated before the mmu_notifier acquires gpc->lock, and
   176		 * isn't dropped until after mmu_invalidate_seq is updated.
   177		 */
   178		if (kvm->mn_active_invalidate_count)
   179			return true;
   180	
   181		/*
   182		 * Similarly to the above, attribute_change_in_progress is set
   183		 * before gfn_to_pfn_cache_invalidate_start is called in
   184		 * kvm_vm_set_mem_attributes, and isn't cleared until after
   185		 * mmu_invalidate_seq is updated.
   186		 */
 > 187		if (kvm->attribute_change_in_progress)
   188			return true;
   189		/*
   190		 * Ensure mn_active_invalidate_count is read before
   191		 * mmu_invalidate_seq.  This pairs with the smp_wmb() in
   192		 * mmu_notifier_invalidate_range_end() to guarantee either the
   193		 * old (non-zero) value of mn_active_invalidate_count or the
   194		 * new (incremented) value of mmu_invalidate_seq is observed.
   195		 */
   196		smp_rmb();
   197		return kvm->mmu_invalidate_seq != mmu_seq;
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
