Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5DC155385
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 21:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731274251; cv=none; b=IG34mqYuBwwhhDBwQeFJbLYfnx5SUuSRMxTikCfenkRX3dqrU9VilxSvJpk32Yu7tTxoe0wR5tvJlsxR5ljkJAbpeQErf79AFWJU5SCxwDW/FKWWoEymd7mz0dNLWqBkx+evvTBr44y8ycHcFudpgbsc+r5No/03A9AhniX+z9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731274251; c=relaxed/simple;
	bh=hwY0sL7Ycs6ZFJZSKJNWeEC6F6IXxalbnOhVkFll4cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PNy2n66VMZwAzFADWuVdtj8t0Er1GyeFb7+qgBq6RywiGrKUD/Xm57eUAmKkhj1dG0uiNkJKss3LpcjEtiGFtEMIqHFbj/k34u5cOiSHpZmlrHkrT1In/tSyV/3r/6inAIfExYXNYVfHj3M19TsatjvxygdTEaScFgy7wEXMPq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mghTK/87; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mghTK/87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731274249; x=1762810249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwY0sL7Ycs6ZFJZSKJNWeEC6F6IXxalbnOhVkFll4cg=;
  b=mghTK/8762WKxsSXYrv0QzWJenkWEe8YZ2+IqmGIhCMVN3YCjPPJ7sLa
   YZS5D9rGoaVFp7ncBJVhgQs6LxGRbJHW+m/sZ3LQULtDgWDU8Y0414f86
   hDyUFowR+dopujHTK1tEv+/vW4ElW58wnq5GoFf9siMyh06sJ/E5zgKHi
   7DnLRNWFj48vcRJ7AGYXo+vbuBAiSzNH6JTqc8fGWVJPn6qHyUlTnqrHN
   eqa3cVaiYaY1R4ld7AaP5Xav4gyZmau4BHsYpHJ0YEl0xUxNezvale4q2
   P+apPZB3Mz95lOnx1I1ZJgJeT5M7XDPz9u6NaS3pyqDCBuhm1j/Wege2E
   Q==;
X-CSE-ConnectionGUID: QFw30iN2QI2Uio9czdOMIQ==
X-CSE-MsgGUID: YTY78sNOSmyGAVXoaqFfvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41692309"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="41692309"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 13:30:48 -0800
X-CSE-ConnectionGUID: x6ESbaDxQ+SxXMvP6twC/w==
X-CSE-MsgGUID: xxgRjlstSsqflt90xFiBjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="90525542"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2024 13:30:47 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAFW8-0000Pp-2I;
	Sun, 10 Nov 2024 21:30:44 +0000
Date: Mon, 11 Nov 2024 05:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:net-pp-inflight-fix_v4_1110 4/8]
 net/core/page_pool.c:337 __page_pool_item_init() warn: inconsistent
 indenting
Message-ID: <202411110505.EXmIxHSv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git net-pp-inflight-fix_v4_1110
head:   94c2f79ad577e3fc5fc89e6a779097bac7a666d5
commit: bb3639f9dabded28e04223bfd2830423e2722d63 [4/8] use list
config: i386-randconfig-141-20241111 (https://download.01.org/0day-ci/archive/20241111/202411110505.EXmIxHSv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411110505.EXmIxHSv-lkp@intel.com/

smatch warnings:
net/core/page_pool.c:337 __page_pool_item_init() warn: inconsistent indenting

vim +337 net/core/page_pool.c

   321	
   322	#define ITEMS_PER_PAGE	(PAGE_SIZE -					\
   323				 offsetof(struct page_pool_item_block, items)) /\
   324				sizeof(struct page_pool_item)
   325	
   326	static void __page_pool_item_init(struct page_pool *pool, struct page *page)
   327	{
   328		struct page_pool_item_block *block = page_address(page);
   329		struct page_pool_item *items = block->items;
   330		unsigned int i;
   331	
   332		list_add(&block->list, &pool->item_blocks);
   333		block->pp = pool;
   334	
   335		for (i = 0; i < ITEMS_PER_PAGE; i++) {
   336			items[i].state = PAGE_POOL_ITEM_UNUSED;
 > 337			 __llist_add(&items[i].lentry, &pool->hold_items);
   338		}
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
