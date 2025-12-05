Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446DD308F02
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764929210; cv=none; b=mBgrSXGVHNQTjLeLx1gaB1ytYcVY9anQX6gddFiAl+R/5VZzuzK02A5FQpSIWvLJ0GXcbwSmwtgHb+4GapMsTl4nODFPCRWeMYbeZYezv78OAEVQ+Q1md3fK4p7z20hhtGtvRlCk4QQD130uAagrdmeFWqJvlRNWRpwtxHDHgiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764929210; c=relaxed/simple;
	bh=XSpEPINUq3ihFTs2DrFX+bYhiDf+IUSaSmJjb/ht7qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouax4xDnYQKVxiSW9KwNTK7J13zenZNni7c9Qxw2wteuLm5jR2xZ9bM4xErsQsJgwaBjpCchHlkaoMWvxV8eeQ7KjiYeRgD0ToEQhHnKev/Q2TjV9cevPoN6XTWqJBIEzowQrB/mhiCJ4KRnUYNGBO+8LwY8TyHcItros7L2uBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lI65H+7Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lI65H+7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764929203; x=1796465203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XSpEPINUq3ihFTs2DrFX+bYhiDf+IUSaSmJjb/ht7qs=;
  b=lI65H+7QPT/pTM6P11JHVzLPIfSoCWS9SBhSYpb7KPXfxsndFy6dtMBP
   DwoNUYJVN5mkpGFEwOlIWhQCr4tyekxGF6NjybZCnxOHNNi5KZuyib5Tq
   3pW+3NITkPySejJ4wAgZm/slNao3w1Lgs1mhrUCSjz24RY8NYblSme8hd
   h8/zUCBfhID8O/Lht6uxb00Tng4Ee1NYnC/FBEmqX8bGT5Q+ILRm2h1/B
   ZYy2h40vCBdjAohsgreJkDakaxlXDXiY3aXsQaYHK1EfxW8ANmSQfX0Qn
   YuxB/foWzA5qY8iC+oOV2K7qpRKpNhrN8BuoCvAy/SKhdhlcnl+PI7TP0
   g==;
X-CSE-ConnectionGUID: XIvbTdarRqmHYixsDn0hYw==
X-CSE-MsgGUID: jxULZiY0REyd8PC7jCmDJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="67127072"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="67127072"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 02:06:40 -0800
X-CSE-ConnectionGUID: hokMAK86Q+mzG8i0+6TVzg==
X-CSE-MsgGUID: cydngRNLRUWkEPAO3XvpCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="195691141"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 02:06:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRShw-00000000Er7-2nJo;
	Fri, 05 Dec 2025 10:06:36 +0000
Date: Fri, 5 Dec 2025 18:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Itazuri <itazur@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] KVM: pfncache: Use vmap() for guest_memfd pages
 without direct map
Message-ID: <202512051709.sYHsygoR-lkp@intel.com>
References: <20251203144159.6131-3-itazur@amazon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203144159.6131-3-itazur@amazon.com>

Hi Takahiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next mst-vhost/linux-next linus/master v6.18 next-20251205]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takahiro-Itazuri/KVM-pfncache-Use-kvm_gmem_get_pfn-for-guest_memfd-backed-memslots/20251203-224344
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20251203144159.6131-3-itazur%40amazon.com
patch subject: [RFC PATCH 2/2] KVM: pfncache: Use vmap() for guest_memfd pages without direct map
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251205/202512051709.sYHsygoR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051709.sYHsygoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051709.sYHsygoR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:17:
   include/linux/kvm_host.h: In function 'kvm_slot_no_direct_map':
>> include/linux/kvm_host.h:634:16: error: implicit declaration of function 'mapping_no_direct_map' [-Wimplicit-function-declaration]
     634 |                mapping_no_direct_map(slot->gmem.file->f_mapping);
         |                ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/kvm_host.h:634:42: error: 'const struct kvm_memory_slot' has no member named 'gmem'
     634 |                mapping_no_direct_map(slot->gmem.file->f_mapping);
         |                                          ^~


vim +/mapping_no_direct_map +634 include/linux/kvm_host.h

   630	
   631	static inline bool kvm_slot_no_direct_map(const struct kvm_memory_slot *slot)
   632	{
   633		return slot && kvm_slot_has_gmem(slot) &&
 > 634		       mapping_no_direct_map(slot->gmem.file->f_mapping);
   635	}
   636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
