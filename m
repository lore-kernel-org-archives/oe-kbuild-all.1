Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA67199931
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 02:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347703; cv=none; b=BQnem+c8uUubYMtJlUd4cstU9VpMgsDBsRxZg14lpgGifANMrJdFX3Uv5prO3DV8BF9KaM2X9BWQhZbMQTYr+nTFjTl2k1ClcM/xSeQgrksqlMyEsEaJjRbAMZw5qwJGXP84ieDYMzsiZOKRQVytqnEM/xg0FACWQ76z0BSCkxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347703; c=relaxed/simple;
	bh=ViFF+a/J09MPXSaP3cWTps9VgTC7bvontq0kpaV1+GU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=by5uGqZDJTWd4au+dXBJyQF7qU0EZuhvpiF84JtrLzzvToYp+q+TZsqsdD70FCyZKsfY1gUQEvbDr165b5pZZmIRkRkuQT9z6HNXgKigSXJvAyIL25l8roXd8iM2dIF9td18sC4nq7pN+rejL2KPBoN3iO/oz+eR935O6CH2hlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfmI7e4Q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfmI7e4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756347701; x=1787883701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ViFF+a/J09MPXSaP3cWTps9VgTC7bvontq0kpaV1+GU=;
  b=jfmI7e4QLFDqqTccB66hKXagJb3Y/XpV5en8IL2L9LhYgLtJLN4GThCS
   XpRB5MIGdcciXHJtVVL1jL62EDmDAsH5qlC56evB7LbVbbHqzl05xGPxe
   snyCd0Q28y5j9gay0GOltGkNAcBnp8uylU+BIjqbQvVxw0bwvwTFM2zuo
   M88n2P0lQshZs1VtxWJFA0zdNkJicRk4zLK6Umv56bzfyu7VewtlN8n1m
   /Zz6YEG6MhewFMwnH70ojt9Qw/2RQA//l7r7iot448z/0EsbKH4/RWyCh
   3w60eknqWXoTSk4XSRtwYBMa3tMdPki//ajBWbVdhHzJUAMcymPRNgtMG
   g==;
X-CSE-ConnectionGUID: qvAqnr8yRfia3TS4i0m+AQ==
X-CSE-MsgGUID: mH/CY/1BTN6Q/Q/CC8clAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69202734"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69202734"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 19:21:41 -0700
X-CSE-ConnectionGUID: XKeIALpVQ8qOpmgqlzO12w==
X-CSE-MsgGUID: 05klVOVETBWhAL89DiyVIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170801909"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Aug 2025 19:21:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urSFj-000TNL-1u;
	Thu, 28 Aug 2025 02:21:00 +0000
Date: Thu, 28 Aug 2025 10:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 24/24] mm/gcma.c:467:9:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202508281026.B4Qwn8g1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Suren,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d4b065126150b0c3fcb11f6c70b5dc7b06ace2d
commit: bca0e95c0215368d0af3379e7487937e180de545 [24/24] ANDROID: fix GCMA build failure when CONFIG_RANDSTRUCT=y
config: arm64-randconfig-r123-20250827 (https://download.01.org/0day-ci/archive/20250828/202508281026.B4Qwn8g1-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce: (https://download.01.org/0day-ci/archive/20250828/202508281026.B4Qwn8g1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508281026.B4Qwn8g1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/gcma.c:467:9: sparse: sparse: Using plain integer as NULL pointer
>> mm/gcma.c:1009:23: sparse: sparse: symbol 'gcma_cleancache_ops' was not declared. Should it be static?
   mm/gcma.c:333:9: sparse: sparse: context imbalance in 'page_area_lock' - wrong count at exit
   mm/gcma.c:337:13: sparse: sparse: context imbalance in 'page_area_unlock' - unexpected unlock

vim +467 mm/gcma.c

ccf872ebe474a3 Minchan Kim 2023-02-08  457  
ccf872ebe474a3 Minchan Kim 2023-02-08  458  static void gcma_erase_page(struct gcma_inode *inode, unsigned long index,
ccf872ebe474a3 Minchan Kim 2023-02-08  459  			    struct page *page, bool put_page)
ccf872ebe474a3 Minchan Kim 2023-02-08  460  {
ccf872ebe474a3 Minchan Kim 2023-02-08  461  	void *old;
ccf872ebe474a3 Minchan Kim 2023-02-08  462  
ccf872ebe474a3 Minchan Kim 2023-02-08  463  	lockdep_assert_held(&inode->pages.xa_lock);
ccf872ebe474a3 Minchan Kim 2023-02-08  464  
ccf872ebe474a3 Minchan Kim 2023-02-08  465  	/* The inode refcount will decrease when the page is freed */
ccf872ebe474a3 Minchan Kim 2023-02-08  466  	old = __xa_erase(&inode->pages, index);
ccf872ebe474a3 Minchan Kim 2023-02-08 @467  	VM_BUG_ON(old == 0);
ccf872ebe474a3 Minchan Kim 2023-02-08  468  	delete_page_from_lru(page);
ccf872ebe474a3 Minchan Kim 2023-02-08  469  	if (put_page)
ccf872ebe474a3 Minchan Kim 2023-02-08  470  		gcma_put_page(page);
ccf872ebe474a3 Minchan Kim 2023-02-08  471  
ccf872ebe474a3 Minchan Kim 2023-02-08  472  	check_and_remove_inode(inode);
ccf872ebe474a3 Minchan Kim 2023-02-08  473  }
ccf872ebe474a3 Minchan Kim 2023-02-08  474  

:::::: The code at line 467 was first introduced by commit
:::::: ccf872ebe474a33123adc0f822915b4cea59e684 ANDROID: mm: introduce GCMA

:::::: TO: Minchan Kim <minchan@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
