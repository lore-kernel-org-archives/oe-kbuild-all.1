Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF64A182BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 20:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773694; cv=none; b=iUNLJX/do1qQ9FRKJ0YSSdyPsil1xhOK1+bUx6CrSZrm9LRtHUZUoSQyUlw0R2Bw5oR18seRla5xF0s5zcGvzWi639tNfaS7OKsYVYx6o+0/FEzNEhGGDKaFmWaOdPQVAEQVbv4pjnxW+FNlT18ZXimWiBrVOeuBjkfDRH/Yf2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773694; c=relaxed/simple;
	bh=5e6ti8tfRcWWVegszgs7YLiAJvtQLuMsSQJzB5ALxM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOU/Znwj+hmT0FYYWRbZODgpVq0B+SSIJjFZyyEjLwgBHV5BVaQXgXo2TSycI/WUm/mQqbg1D2E4OknFE0GS876g/aPhGlWDNy9bTK8tu3U2ZVCntITkKq2HMXJsdeisqU/GOpxoDBOK9O61gKzs2blIunYQ0v0Gvxj1tcyWHn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4J827e1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4J827e1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747773693; x=1779309693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5e6ti8tfRcWWVegszgs7YLiAJvtQLuMsSQJzB5ALxM8=;
  b=F4J827e1Xy/4M+8kUmkjNf94yKxPJ68DNSETkPx89YphPgvQGdeu2Shk
   tnR5V+vkRC2lRE9jkLZjaoUJ0GybY5/0FXqiSCGShYJEj3E9e8vGOEx4+
   gJAdHrgjOeRQEGRFXhOzn9zMF8tyuB057z0OlWLg2hZ50rvF16676GbcQ
   x1Js2BOR84uVjzEZ9XZ64h4maE7RUE9neEoL1v0tJGZ1Ctp0gj/nKHg1A
   l2Jt8g7oQbP2DH4b9UkRVoVG+U5oXhpsO8I83qzwe8WgVuN//Jf/DRDYf
   qiFUUrIBnUFCsiaBzALE/3Q6c8ADK5WryMX22ABMQnApBV5bsCjWqzGMO
   g==;
X-CSE-ConnectionGUID: jzrWmRP4QjS9b9XYPkwDqA==
X-CSE-MsgGUID: AjdmxjbrQjuRBk//7bUjUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="72246888"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="72246888"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 13:41:32 -0700
X-CSE-ConnectionGUID: vs/cqNQVTA+6JQ3Sj2j3uw==
X-CSE-MsgGUID: 4TrwiI3USuSvWMpGBuGIaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="145061939"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2025 13:41:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHTmC-000NYK-3A;
	Tue, 20 May 2025 20:41:28 +0000
Date: Wed, 21 May 2025 04:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11]
 drivers/crypto/ccp/hct.c:1234:15: warning: no previous prototype for
 function 'hct_pin_memory'
Message-ID: <202505210414.R1xhOcuT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6bec8a39b9738b7a22c1f607634a05ba0986225a
commit: f008035cc14436f2d2147a43668b52b169873ff7 [11/11] anolis: newfeature: ccp: add hct module
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250521/202505210414.R1xhOcuT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210414.R1xhOcuT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210414.R1xhOcuT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hct.c:1234:15: warning: no previous prototype for function 'hct_pin_memory' [-Wmissing-prototypes]
    1234 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hct.c:1234:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1234 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         | ^
         | static 
   drivers/crypto/ccp/hct.c:1530:6: warning: no previous prototype for function 'hct_iommu_unmap' [-Wmissing-prototypes]
    1530 | void hct_iommu_unmap(struct hct_private *private)
         |      ^
   drivers/crypto/ccp/hct.c:1530:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1530 | void hct_iommu_unmap(struct hct_private *private)
         | ^
         | static 
   2 warnings generated.


vim +/hct_pin_memory +1234 drivers/crypto/ccp/hct.c

  1233	
> 1234	struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
  1235				unsigned long ulen, unsigned long *n)
  1236	{
  1237		unsigned long npages, size;
  1238		int npinned;
  1239		unsigned long locked;
  1240		struct page **pages;
  1241		unsigned long first, last;
  1242	
  1243		if (ulen == 0 || uaddr + ulen < uaddr)
  1244			return NULL;
  1245	
  1246		first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
  1247		last = ((uaddr + ulen - 1) & PAGE_MASK) >> PAGE_SHIFT;
  1248		npages = (last - first + 1);
  1249	
  1250		locked = private->pages_locked + npages;
  1251		if (locked > MCCP_DMA_LOCKED_LIMIT && !capable(CAP_IPC_LOCK)) {
  1252			pr_err("%lu locked pages exceed the lock limit of %lu.\n",
  1253					locked, MCCP_DMA_LOCKED_LIMIT);
  1254			return NULL;
  1255		}
  1256	
  1257		if (WARN_ON_ONCE(npages > INT_MAX))
  1258			return NULL;
  1259	
  1260		size = npages * sizeof(struct page *);
  1261		if (size > PAGE_SIZE)
  1262			pages = vmalloc(size);
  1263		else
  1264			pages = kmalloc(size, GFP_KERNEL);
  1265	
  1266		if (!pages)
  1267			return NULL;
  1268	
  1269		/* Pin the user virtual address. */
  1270		npinned = pin_user_pages_fast(uaddr, npages, FOLL_WRITE, pages);
  1271		if (npinned != npages) {
  1272			pr_err("Failure locking %lu pages.\n", npages);
  1273			goto err;
  1274		}
  1275	
  1276		*n = npages;
  1277		private->pages_locked = locked;
  1278		return pages;
  1279	
  1280	err:
  1281		if (npinned > 0)
  1282			unpin_user_pages(pages, npinned);
  1283	
  1284		kvfree(pages);
  1285		return NULL;
  1286	}
  1287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
