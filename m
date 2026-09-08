Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89E4B67E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 00:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788826577; cv=none; b=L00E073mXHt2sIlo3L2RJiQ+kx2Sa5pG6GeI8haH562a6MK3UF5c7UGTOKzrjk1IIYef7zMWmsnF9VtRjncWfojzEc1rKDpVGfLjVi0uQDF7z+Ri2JXRlyt3TvwnHspiAnx6nHB4MgZGAGUeZklgUMyJtAwLvBGwJ9XT5Les4bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788826577; c=relaxed/simple;
	bh=RXnnx5IsPxwYsF4/MFgn5geXaE647rg/PtexFPCJ4Es=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sSjU8N1iMjQluErj3qlomoOv2H5EJn0pYIVtVUcg116p6tuqzWy9zAKFkb2GdDvPqcJZhKrYKKVR38oJTG5mDKvp1ogqJqSdRWg+7ISdUU3+lEGBzncdAscGMzpLvwBN2kb+yGfUJ0SSk2cJOuI+W9Wjv+OCWBSeqEMn56K4KMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgtWt8o0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgtWt8o0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788826575; x=1820362575;
  h=date:from:to:cc:subject:message-id;
  bh=RXnnx5IsPxwYsF4/MFgn5geXaE647rg/PtexFPCJ4Es=;
  b=ZgtWt8o0tlbGG485P711VZTbFoTiS5CtZUnPZXFx+aQjw9rFPNs+I4FR
   2d0GoVJ39ySKiNHSHWr6/ttgyUaQM9PNSaKnX/QMDueTSeON5mjMv9bGd
   AAbuAYq9REuv1eY6N83MoslJVtJCFoNc1R7MMshGoXcwk9MrZEzMWG98D
   AksSeK36ceFy/XLqOb+y3YGBicCmkdOMI1/Lk6vrAoRDw40DUyRDJtAmK
   xsvTLewCdB3m+gP+AXRTFTUVhkI1b7V69U98fG3t3iLDv42v4PSLjDvo8
   0z2dGzHWZ3+5K5q8qLCQkvMYLnq2cXm+69t3Aeo0VVgIh7A4oCW1XwA8m
   w==;
X-CSE-ConnectionGUID: GgC33ZX1Rh+jtlEiYdef5Q==
X-CSE-MsgGUID: Fm4c4X+2S3C7JkYdlr2o6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93087132"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93087132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 17:16:15 -0700
X-CSE-ConnectionGUID: 1oGZ3onvRW++WErLmVo4zA==
X-CSE-MsgGUID: BzpvtJqVSF2NWbBdRdb+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="268244420"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Sep 2026 17:16:14 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3jVT-000000001R9-2uZE;
	Tue, 08 Sep 2026 00:16:11 +0000
Date: Tue, 08 Sep 2026 08:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 3227/4316]
 drivers/bluetooth/btintel_pcie.c:776:13: warning: variable 'i' set but not
 used
Message-ID: <202609080812.PANyfUFq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   944a035ecca915ae947905dcfb03f2b9dc6d032c
commit: 755cf7adf8dd2d12627cb7de223d35b12228e2f5 [3227/4316] Bluetooth: btintel_pcie: unified decoder coredump format
config: x86_64-randconfig-121-20260907 (https://download.01.org/0day-ci/archive/20260908/202609080812.PANyfUFq-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080812.PANyfUFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080812.PANyfUFq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btintel_pcie.c:776:13: warning: variable 'i' set but not used [-Wunused-but-set-variable]
     776 |         int nents, i;
         |                    ^
   1 warning generated.


vim +/i +776 drivers/bluetooth/btintel_pcie.c

   773	
   774	static struct scatterlist *btintel_pcie_alloc_sgtable(ssize_t size)
   775	{
 > 776		int nents, i;
   777		struct page *page;
   778		struct scatterlist *sg, *result;
   779	
   780		if (size <= 0)
   781			return NULL;
   782	
   783		nents = DIV_ROUND_UP(size, PAGE_SIZE);
   784		result = kcalloc(nents, sizeof(*result), GFP_KERNEL);
   785		if (!result)
   786			return NULL;
   787	
   788		sg_init_table(result, nents);
   789		sg = result;
   790	
   791		for (i = 0; size > 0; i++) {
   792			ssize_t bytes = min_t(ssize_t, size, PAGE_SIZE);
   793	
   794			page = alloc_page(GFP_KERNEL | __GFP_ZERO);
   795			if (!page)
   796				goto err_free;
   797	
   798			sg_set_page(sg, page, bytes, 0);
   799			sg = sg_next(sg);
   800			size -= bytes;
   801		}
   802		return result;
   803	
   804	err_free:
   805		for (sg = result; sg; sg = sg_next(sg)) {
   806			page = sg_page(sg);
   807			if (page)
   808				__free_page(page);
   809		}
   810		kfree(result);
   811		return NULL;
   812	}
   813	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
