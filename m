Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C06219C56D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691154; cv=none; b=CcP/A/YXNbyGc8KAbIP6/Y07tbV4a0SMDdhCknJ69hnYsEmbRo1VSQ60Wre8OoJ/Ojr50QjUw20A4s8r7F0TZy783ajc9exx+QYtiydP1rMkI++pc6GL7Mq5QwDYo+VgqtZLGnHb69SFAGXBP4WG2PfD3nwhOku0Ustdp+wWMWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691154; c=relaxed/simple;
	bh=qMuoY6db6RoDqQNPYj968IO6iY3etWpCJaHw+94ZxGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g5EHnrXa6LfemGe6Kh9y3WxAATifpSUrbRrOMVUdh5ymyUcpIc4NEqwXeuKrLyUggfbCjxWjqP9ogRPOUYmOtYCnTnlUYOxj1u7lefD3MR6A+Fs8Kp6JVKWc62x8jTNwKvZ1QqzCLM3EMf24ckm37RIen6jnMhrL6sho0ZNLMio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaCOoNQM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaCOoNQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734691151; x=1766227151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMuoY6db6RoDqQNPYj968IO6iY3etWpCJaHw+94ZxGU=;
  b=UaCOoNQMwYtc203N5A5cB6sxQxszJJg6hqorNvt/Bs+/OJMtfA9dZB/D
   Ll12JlPKrtqFKIjTgs26Ugq8Zk3h8NyAr91P+Vx9dtoU+TDDDI6szgNPo
   bUJH/oQxKKgbfqHth3eBNNEctq+ymMutEGSa2jrwlnb/Ay1WtmShXmwPs
   3PpL4AApcWpZwtVCmi6RQBalbvfxkG7sPSfcVjVMck8NePG60byMqH8WD
   MJ5lJkdIYLJqbzCYUxJV3mMnc/pKepGrF6PUxVAzAFNjM+hUSagimEcVL
   YVNIivQq7Zxwrb1QdRisR1YIRxZ9oTDPxNGFD+0Qr7dMOFPHhUnwSCAxX
   Q==;
X-CSE-ConnectionGUID: zF8AfPR5RgmPDlmc3AHUVg==
X-CSE-MsgGUID: t6+9iJuATmWEFm40kGWVjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46245867"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="46245867"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 02:39:10 -0800
X-CSE-ConnectionGUID: wfA//oAFTiqrQvZEjVsMrQ==
X-CSE-MsgGUID: zPgSQ3QITFWrsq5+kgjqwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98677932"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2024 02:39:08 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOaPS-00014B-1P;
	Fri, 20 Dec 2024 10:39:06 +0000
Date: Fri, 20 Dec 2024 18:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: yangge <yangge1116@126.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 253/254] sysctl.c:(.text+0x60): multiple
 definition of `replace_free_hugepage_folios';
 kernel/fork.o:fork.c:(.text+0x858): first defined here
Message-ID: <202412201821.WaOssNFP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   5555a83c82d66729e4abaf16ae28d6bd81f9a64a
commit: fba5261e0039dcf4de077fd12ea9ae2501d92b88 [253/254] mm: replace free hugepage folios after migration
config: arm-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201821.WaOssNFP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201821.WaOssNFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201821.WaOssNFP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/sysctl.o: in function `replace_free_hugepage_folios':
>> sysctl.c:(.text+0x60): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/filemap.o: in function `replace_free_hugepage_folios':
   filemap.c:(.text+0x1dc8): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/folio-compat.o: in function `replace_free_hugepage_folios':
   folio-compat.c:(.text+0xf0): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/swap.o: in function `replace_free_hugepage_folios':
   swap.c:(.text+0x1574): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/vmscan.o: in function `replace_free_hugepage_folios':
   vmscan.c:(.text+0x1cf4): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/shmem.o: in function `replace_free_hugepage_folios':
   shmem.c:(.text+0x12c): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/util.o: in function `replace_free_hugepage_folios':
   util.c:(.text+0x6fc): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/compaction.o: in function `replace_free_hugepage_folios':
   compaction.c:(.text+0x0): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/show_mem.o: in function `replace_free_hugepage_folios':
   show_mem.c:(.text+0x9c): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/debug.o: in function `replace_free_hugepage_folios':
   debug.c:(.text+0x350): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/gup.o: in function `replace_free_hugepage_folios':
   gup.c:(.text+0xab4): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: mm/page_alloc.o: in function `replace_free_hugepage_folios':
   page_alloc.c:(.text+0x1798): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: fs/aio.o: in function `replace_free_hugepage_folios':
   aio.c:(.text+0x206c): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: fs/iomap/buffered-io.o: in function `replace_free_hugepage_folios':
   buffered-io.c:(.text+0x327c): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: fs/proc/nommu.o: in function `replace_free_hugepage_folios':
   nommu.c:(.text+0x13c): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: fs/proc/array.o: in function `replace_free_hugepage_folios':
   array.c:(.text+0x6f4): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: fs/proc/meminfo.o: in function `replace_free_hugepage_folios':
   meminfo.c:(.text+0x0): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: fs/btrfs/disk-io.o: in function `replace_free_hugepage_folios':
   disk-io.c:(.text+0xee4): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: fs/btrfs/inode.o: in function `replace_free_hugepage_folios':
   inode.c:(.text+0x2b64): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here
   arm-linux-gnueabi-ld: security/commoncap.o: in function `replace_free_hugepage_folios':
   commoncap.c:(.text+0x888): multiple definition of `replace_free_hugepage_folios'; kernel/fork.o:fork.c:(.text+0x858): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
