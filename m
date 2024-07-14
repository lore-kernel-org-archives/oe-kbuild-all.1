Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86A2A944
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 00:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720918797; cv=none; b=rgqJW8wyYv3zHfqeBthKW/aAI3nQilLmZpwhzs7m8ko4NkiW5OgZNo/PmIC2dGUqsdLwbnfVVadD38ZUCf9zD7XZeWoKsRdiWlJmpiI3WlfR4TkwnOyGT5YjYf6SS0QC0OEBE54bndlYxdcCteWIUXQ2aMDuK6Zt0mEAG/hGb3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720918797; c=relaxed/simple;
	bh=raHL+x6o/nmuqbo2J44+Up5nGTtRePMSRmhUIE1zXEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4O7x5/dnfVjrYuU5QbhNHStCZZ1Sq1qWU89sVAdc7vqsEW0u/1LQuWuilUFepkKHjKHvRqtpxVRe9d6hQ/2EfLgQyM8YiWZKM6jhvf2UGPXKRb59cquDXB7wvBVJIBlMMNA18p9kIjFmhwGyLTOL5krm1p+oEO3NlYTf8DtJ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvvKCZuv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvvKCZuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720918795; x=1752454795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=raHL+x6o/nmuqbo2J44+Up5nGTtRePMSRmhUIE1zXEg=;
  b=kvvKCZuvmObBbxhmq3EAaEhP8E1KFQHKv4wzEuE6uXXM4KqxLbBVEXX5
   mRnckv0uRPNI203sgI1bkZfwO8fuHlpXDqoN9K2zWcygM/VAAXDWVS6SW
   Jld0ON8PF5GDxyKtmgwqag7aCFLpB7XjZudXT6ydYVxo+Dv8ry2jftEg6
   AJa5/Iz5aIviUvHrlXUv2Ku1vM4qzrArQnkkSczUyIttB8m+kOYNsqPTy
   rC5kxvDZHYegqxtX1HblH3oGK9PQSLevFgmdLAs72gqIvby3+Ge5HcR4s
   R3Bqbr4CCtCheDJnAByEuZilYefQklBogoZaMjdgF1oT3kFudsKIBKmIo
   g==;
X-CSE-ConnectionGUID: 5RJB9UWUQNaBIdqgJKtqgQ==
X-CSE-MsgGUID: BIOBnzkHT/SduvtuPwsuyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="29723774"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="29723774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 17:59:54 -0700
X-CSE-ConnectionGUID: vHnTNTndT0ytw2LzlbE5Yw==
X-CSE-MsgGUID: XTc28ntJS+qQi5QTNHhqhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="54449390"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jul 2024 17:59:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSnah-000cu6-0Q;
	Sun, 14 Jul 2024 00:59:51 +0000
Date: Sun, 14 Jul 2024 08:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: James Houghton <jthoughton@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 04/18] KVM: Fail __gfn_to_hva_many for userfault gfns.
Message-ID: <202407140801.z25gh0Q5-lkp@intel.com>
References: <20240710234222.2333120-5-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710234222.2333120-5-jthoughton@google.com>

Hi James,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 02b0d3b9d4dd1ef76b3e8c63175f1ae9ff392313]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/KVM-Add-KVM_USERFAULT-build-option/20240711-101935
base:   02b0d3b9d4dd1ef76b3e8c63175f1ae9ff392313
patch link:    https://lore.kernel.org/r/20240710234222.2333120-5-jthoughton%40google.com
patch subject: [RFC PATCH 04/18] KVM: Fail __gfn_to_hva_many for userfault gfns.
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240714/202407140801.z25gh0Q5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140801.z25gh0Q5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140801.z25gh0Q5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kvm/../../../virt/kvm/kvm_main.c: In function '__gfn_to_hva_many':
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:2690:24: error: 'KVM_HVA_ERR_USERFAULT' undeclared (first use in this function); did you mean 'KVM_CAP_USERFAULT'?
    2690 |                 return KVM_HVA_ERR_USERFAULT;
         |                        ^~~~~~~~~~~~~~~~~~~~~
         |                        KVM_CAP_USERFAULT
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:2690:24: note: each undeclared identifier is reported only once for each function it appears in


vim +2690 arch/s390/kvm/../../../virt/kvm/kvm_main.c

  2679	
  2680	static unsigned long __gfn_to_hva_many(const struct kvm_memory_slot *slot, gfn_t gfn,
  2681					       gfn_t *nr_pages, bool write)
  2682	{
  2683		if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
  2684			return KVM_HVA_ERR_BAD;
  2685	
  2686		if (memslot_is_readonly(slot) && write)
  2687			return KVM_HVA_ERR_RO_BAD;
  2688	
  2689		if (gfn_has_userfault(slot->kvm, gfn))
> 2690			return KVM_HVA_ERR_USERFAULT;
  2691	
  2692		if (nr_pages)
  2693			*nr_pages = slot->npages - (gfn - slot->base_gfn);
  2694	
  2695		return __gfn_to_hva_memslot(slot, gfn);
  2696	}
  2697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
