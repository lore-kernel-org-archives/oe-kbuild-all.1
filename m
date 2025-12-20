Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45BF25C80E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766262168; cv=none; b=bICS874H8leRTsSCbc78vucAAWg5KiqO9fmS3ULw6GLF2OUDVsyLrZMnP4Tj9qMlQ2GU2lxuQ5/wv9/J+pVMrZwfiBMf51PmciuLAdsQYzeH8JlODQ8eosupN854ymTcYzefSvmFfWuU4spKA6VHkNnb9pf+fxK7JDkmWbRDrVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766262168; c=relaxed/simple;
	bh=OM1wXSpQJQp/8PMcqBGBPQLnG+SqGD5Z3vy26c7Ixcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzLLF16vgKigH66o+P7t6tNODhEuKuRSivr/dxT0iUiVJf2orKvn5Fx9bT+EF7Coa/HxqtaJf4PRsEPwSPvDU8JgKlvOWmNvEjqFSAkBrJIEB5Qp5Nc7RZFmfFe3BcduFW2WVL1CgJXvxVz+VNBuA0z0fFPWrNrwimgZuqYQENE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhOuwq44; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhOuwq44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766262167; x=1797798167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OM1wXSpQJQp/8PMcqBGBPQLnG+SqGD5Z3vy26c7Ixcs=;
  b=PhOuwq44ARDZeQCdxyj4RIersqqvVAQEUDCyuT5t4tpFkhQatbSe7pSY
   uqU0gADM+OH0+hz2PnjdLctyac8Z8YlH6qpcn0p0gu+AED8AkrARcznsN
   GVPDMEOw9AytQbq8RKV5y6FclgykK2xls+kHz0pSoueN+d1rtWsLvapqY
   D86ic3CjYxulx44EB9jFzANPGPbiEmCeHwHj0hqqJDkPoCkMgeTcXhxsE
   H/n27rpJhiEawaiz4VOrW3kN6Hapn628VCr7NK5ASvDJtXC+CYStSlVlx
   HG2ophggQIXJUNG34IoC7bsdyw31Nuo1EwfeWT7RKEEIMawf2ytjnXjpn
   Q==;
X-CSE-ConnectionGUID: ekmcM75TR5WCoTzn6fq54A==
X-CSE-MsgGUID: z0DHuKCaScmN8fp4k1Z1yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="71816881"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="71816881"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 12:22:44 -0800
X-CSE-ConnectionGUID: j6eFxKdNQeWY8hF43cvH7w==
X-CSE-MsgGUID: ZeGenwzGTzSfP9GV8vOSMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199199878"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2025 12:22:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX3TM-0000000056h-3kcm;
	Sat, 20 Dec 2025 20:22:40 +0000
Date: Sun, 21 Dec 2025 04:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3560/3560]
 drivers/crypto/ccp/hygon/ccp-mdev.c:1144:15: warning: no previous prototype
 for function 'ccp_pin_memory'
Message-ID: <202512210422.Gfg4tcZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 592817a30ddc0ef43c7f5b5fe906ae37cf3bea3b [3560/3560] crypto: ccp: add ccp-mdev functionality to the ccp module.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512210422.Gfg4tcZV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210422.Gfg4tcZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210422.Gfg4tcZV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/ccp-mdev.c:1144:15: warning: no previous prototype for function 'ccp_pin_memory' [-Wmissing-prototypes]
    1144 | struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:1144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1144 | struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
         | ^
         | static 
   1 warning generated.


vim +/ccp_pin_memory +1144 drivers/crypto/ccp/hygon/ccp-mdev.c

  1143	
> 1144	struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
  1145				unsigned long ulen, unsigned long *n)
  1146	{
  1147		struct page **pages;
  1148		unsigned long npages, size;
  1149		unsigned long first, last;
  1150		int npinned;
  1151	
  1152		if (ulen == 0 || uaddr + ulen < uaddr)
  1153			return NULL;
  1154	
  1155		first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
  1156		last = ((uaddr + ulen - 1) & PAGE_MASK) >> PAGE_SHIFT;
  1157		npages = (last - first + 1);
  1158	
  1159		if (WARN_ON_ONCE(npages > INT_MAX))
  1160			return NULL;
  1161	
  1162		size = npages * sizeof(struct page *);
  1163		if (size > PAGE_SIZE)
  1164			pages = vmalloc(size);
  1165		else
  1166			pages = kmalloc(size, GFP_KERNEL);
  1167	
  1168		if (!pages)
  1169			return NULL;
  1170	
  1171		/* Pin the user virtual address. */
  1172		npinned = pin_user_pages_fast(uaddr, npages, FOLL_WRITE, pages);
  1173		if (npinned != npages)
  1174			goto err;
  1175	
  1176		*n = npages;
  1177		return pages;
  1178	
  1179	err:
  1180		if (npinned > 0)
  1181			unpin_user_pages(pages, npinned);
  1182		kvfree(pages);
  1183		return NULL;
  1184	}
  1185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
