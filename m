Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22AFEEB3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 03:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720928941; cv=none; b=Rw0O1R2kOQhniAYKKQJdbPdgB17w+GR57+OOEOxbBvxdF5aN5NpQO5fnX4TdbctMUPOuBW42+ZpPHyhFLU/8sOuFqPGsSKY7uJH7aZI/dPu2ZFvkxmZOYcgGZc7TFdxjQ6DhAgynVUQTfQgsqBk4Hus2BEHaRPKX3MuPR7SGn44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720928941; c=relaxed/simple;
	bh=9NUfO7BY3HkBR1uEmEHPuY9R4DsZ73PUDEZ0tAu2JAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFXzz6YG/XkdQpY4rqk5LKZ935XrJdzEI0px/T39F2KlJlJV2ffWo2AEMZH1YtKXbN40kEwt/wjv1TWHDIfb2pkY/EJagddlWyvU/aRxvfqnWuHinHhczNKA7KDH8uI7F/JMmdX6UZxP84Vva5/skAyElrQqazUhaacJEYuCHgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtZZBbCG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtZZBbCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720928939; x=1752464939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9NUfO7BY3HkBR1uEmEHPuY9R4DsZ73PUDEZ0tAu2JAE=;
  b=FtZZBbCGwEBjdVrHH+HS5FvjngXi+ylJszMEk8C8iXGoa0XqWTL26Fj0
   OFqtdZ7i7Kh9moRZpyMNy+IzwwVpqQZo4kCeyw7R+WkwwLBOUWCHUwYke
   3WzWX3Yb0A+LsLIRkntiNn9SzQf2M8kMUGl6EDtSG07yXRh1uK6ulttfY
   RKJVaOE0SYbXJdL2CqZ8lr8hhiH3LLwc8yG/TVYS3ZYna5Qm61ZXIL/tS
   yYvzh0BisduQ7VhHldnij9Mpvy5P0VGonyfJwEsCzzMD2xW1ceUKDOnGO
   vw2ISvTe27cKtb5VvUwVeIxYyl14IFXKCiqDlkzStUnPgDmRK7fpmUiE0
   w==;
X-CSE-ConnectionGUID: 2txdqKR2RJOhi5lwc++e8A==
X-CSE-MsgGUID: SQrNzNVZTaaRvNGf1TdIRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="29727600"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="29727600"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 20:48:58 -0700
X-CSE-ConnectionGUID: vqSKcWyiQwqCfZmFDVN1nA==
X-CSE-MsgGUID: EITwamK9TRq6GvTgPX530Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="54223540"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jul 2024 20:48:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSqEJ-000d1K-1X;
	Sun, 14 Jul 2024 03:48:55 +0000
Date: Sun, 14 Jul 2024 11:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: James Houghton <jthoughton@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/18] KVM: Add asynchronous userfaults,
 KVM_READ_USERFAULT
Message-ID: <202407141130.FQSlMZIJ-lkp@intel.com>
References: <20240710234222.2333120-15-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710234222.2333120-15-jthoughton@google.com>

Hi James,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 02b0d3b9d4dd1ef76b3e8c63175f1ae9ff392313]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/KVM-Add-KVM_USERFAULT-build-option/20240711-101935
base:   02b0d3b9d4dd1ef76b3e8c63175f1ae9ff392313
patch link:    https://lore.kernel.org/r/20240710234222.2333120-15-jthoughton%40google.com
patch subject: [RFC PATCH 14/18] KVM: Add asynchronous userfaults, KVM_READ_USERFAULT
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240714/202407141130.FQSlMZIJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407141130.FQSlMZIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407141130.FQSlMZIJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/s390/kvm/../../../virt/kvm/kvm_main.c: In function '__gfn_to_hva_many':
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:2729:32: error: 'KVM_HVA_ERR_USERFAULT' undeclared (first use in this function); did you mean 'KVM_PFN_ERR_USERFAULT'?
    2729 |                         return KVM_HVA_ERR_USERFAULT;
         |                                ^~~~~~~~~~~~~~~~~~~~~
         |                                KVM_PFN_ERR_USERFAULT
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:2729:32: note: each undeclared identifier is reported only once for each function it appears in
   arch/s390/kvm/../../../virt/kvm/kvm_main.c: In function '__gfn_to_pfn_memslot':
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:3059:29: error: 'KVM_HVA_ERR_USERFAULT' undeclared (first use in this function); did you mean 'KVM_PFN_ERR_USERFAULT'?
    3059 |                 if (addr == KVM_HVA_ERR_USERFAULT)
         |                             ^~~~~~~~~~~~~~~~~~~~~
         |                             KVM_PFN_ERR_USERFAULT
   arch/s390/kvm/../../../virt/kvm/kvm_main.c: At top level:
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:2681:12: warning: 'read_userfault' defined but not used [-Wunused-function]
    2681 | static int read_userfault(struct kvm_userfault_ctx __rcu *ctx, gfn_t *gfn)
         |            ^~~~~~~~~~~~~~


vim +/read_userfault +2681 arch/s390/kvm/../../../virt/kvm/kvm_main.c

  2680	
> 2681	static int read_userfault(struct kvm_userfault_ctx __rcu *ctx, gfn_t *gfn)
  2682	{
  2683		struct kvm_userfault_list_entry *entry;
  2684	
  2685		spin_lock(&ctx->list_lock);
  2686	
  2687		entry = list_first_entry_or_null(&ctx->gfn_list,
  2688						 struct kvm_userfault_list_entry,
  2689						 list);
  2690	
  2691		list_del(&entry->list);
  2692	
  2693		spin_unlock(&ctx->list_lock);
  2694	
  2695		if (!entry)
  2696			return -ENOENT;
  2697	
  2698		*gfn = entry->gfn;
  2699		return 0;
  2700	}
  2701	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
