Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8CA4EB38
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 20:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944914; cv=none; b=sxGkG+HbkRD0djS3YcHKGJixyqr6ang/r76Pa7cJWm33KOH5LARRH8oYTSq14wZNK/BrNDHJg7+6gOnvYAUHxtbVLGy2+WoK42fC5O0cOeeOAHePLHO12FgkDj2hVbttQtlkJQWH4mAK+Slw/A4ziwSqP5l6rKG42IKnP8hPf1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944914; c=relaxed/simple;
	bh=hFg9wM10oj5gfiFhG6r4i1Tmy8rWLH6csEt5REFaXcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GuejbHOfnJ4pEaViwa3DxXTnupKMWXAekXN8h0mAXoycCNYFjScsIdAN2P+aHGkmhgHDMTd/zMJ9LxRswnBfJOnpn0XdWBsVTa8UNWMTdfYM+5ANP8L9vIXflS1HtPQpL4EOXvF47eiruis6KpzEcXUUYhswvxVXpCfHOjUf8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGVBQwV3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGVBQwV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754944913; x=1786480913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hFg9wM10oj5gfiFhG6r4i1Tmy8rWLH6csEt5REFaXcI=;
  b=GGVBQwV3qigfAnjVC9h6RLD0/8iUi3gebikZl3l0mG3CoOP3o9BqFQRJ
   Qwao5OdfVCVPGk6KS2k55hul4VgIZcSuTDuBytJdq9tAAo12R3xh9FcFi
   qnQms3L7wOh/1/AXHVqM9Lu62BkVV5dFfePk+zg1oGGXQkcCMtYaBwPSh
   u3/9s3osnjek8g21rjaXwxttjETIw+a6iNKzcd2w12E1ge1IdfLpaYQqL
   lEzy1c+juKfcYTFzFxEiBRabDHuflZiOJZQ6KFCEOdZIpt+pi+8SeyGVC
   owAdrJv3i+AJa/nTMWi1Jg9DE4Bjls1fkCK/c1DzrO3dpsvApQb5sQZWr
   w==;
X-CSE-ConnectionGUID: btq0MnviTfqoJTMvbJYxcQ==
X-CSE-MsgGUID: w0t42ADmSZ6pIZKmttKJnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57079171"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57079171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:41:53 -0700
X-CSE-ConnectionGUID: GnAuqDuITM2yqELojpa6uA==
X-CSE-MsgGUID: cZLg3eKKTBmPSfzDiIpi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166311482"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2025 13:41:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulZKb-0006Cy-0y;
	Mon, 11 Aug 2025 20:41:33 +0000
Date: Tue, 12 Aug 2025 04:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2665/2665] arch/arm64/kvm/rme.c:799:16: warning:
 variable 'data_flags' set but not used
Message-ID: <202508120456.fFlvJz72-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5185c1b0fd7a9b3ea9b6923d5bcedc7392c59b7
commit: e216f77846eeb7062baa345cea2be0978dea94cc [2665/2665] [v8-19-43]arm64: RME: Allow populating initial contents
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250812/202508120456.fFlvJz72-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120456.fFlvJz72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120456.fFlvJz72-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/rme.c:742:7: error: call to undeclared function 'kvm_slot_can_be_private'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     742 |         if (!kvm_slot_can_be_private(memslot)) {
         |              ^
   arch/arm64/kvm/rme.c:763:9: error: call to undeclared function '__kvm_faultin_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     763 |                 pfn = __kvm_faultin_pfn(memslot, gpa_to_gfn(ipa), FOLL_WRITE,
         |                       ^
   arch/arm64/kvm/rme.c:771:9: error: call to undeclared function 'kvm_gmem_get_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     771 |                 ret = kvm_gmem_get_pfn(kvm, memslot,
         |                       ^
>> arch/arm64/kvm/rme.c:799:16: warning: variable 'data_flags' set but not used [-Wunused-but-set-variable]
     799 |         unsigned long data_flags = 0;
         |                       ^
   1 warning and 3 errors generated.


vim +/data_flags +799 arch/arm64/kvm/rme.c

   794	
   795	static int kvm_populate_realm(struct kvm *kvm,
   796				      struct arm_rme_populate_realm *args)
   797	{
   798		phys_addr_t ipa_base, ipa_end;
 > 799		unsigned long data_flags = 0;
   800	
   801		if (kvm_realm_state(kvm) != REALM_STATE_NEW)
   802			return -EPERM;
   803	
   804		if (!IS_ALIGNED(args->base, PAGE_SIZE) ||
   805		    !IS_ALIGNED(args->size, PAGE_SIZE) ||
   806		    (args->flags & ~RMI_MEASURE_CONTENT))
   807			return -EINVAL;
   808	
   809		ipa_base = args->base;
   810		ipa_end = ipa_base + args->size;
   811	
   812		if (ipa_end < ipa_base)
   813			return -EINVAL;
   814	
   815		if (args->flags & RMI_MEASURE_CONTENT)
   816			data_flags |= RMI_MEASURE_CONTENT;
   817	
   818		/*
   819		 * Perform the population in parts to ensure locks are not held for too
   820		 * long
   821		 */
   822		while (ipa_base < ipa_end) {
   823			phys_addr_t end = min(ipa_end, ipa_base + SZ_2M);
   824	
   825			int ret = populate_region(kvm, ipa_base, end,
   826						  args->flags);
   827	
   828			if (ret)
   829				return ret;
   830	
   831			ipa_base = end;
   832	
   833			cond_resched();
   834		}
   835	
   836		return 0;
   837	}
   838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
