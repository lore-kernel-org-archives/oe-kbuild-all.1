Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3438B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 04:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755576975; cv=none; b=jPn7+x9zwRiMHcIlRUMLgpyTMNNh5tWvh1L2AF5jJBXBvoHAjCIbgxae3kiRNbXJwMjnfK8gRR3d//TNOzuRvvgUHkHBOVHjrJlCIEf6zSiLTq17JyiDlsvIE5p4GU6nfXNcyPmYgtRwe5f+f4yhrbvHUtxac3oilNB0yC22wzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755576975; c=relaxed/simple;
	bh=unWv/FnlnT35kUxfsqoeFdpAzJLtrnEgDa3wlFHkVxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgbMuLNmF2U5uL+ddlwJd6/HNeqG8EQdk1/zOrlCAHaKn9X20P9c5UNfMNLojQhzhOvvtQCnN2Qy4pjjC8F/tyrWBNyDGJNN+FXC3p2vWh89aJTmiSCASlGM1UiJ5ZYnVu0ay9/07w4PJpqowfVugWdCcDmMfay3SP/YICM8Ig4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVr2StH+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVr2StH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755576974; x=1787112974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=unWv/FnlnT35kUxfsqoeFdpAzJLtrnEgDa3wlFHkVxA=;
  b=GVr2StH+09lMLXeyMwtjeB21JrrimkBvwELrW90YGMj9kQxFum0qpCSi
   DOzTwuYkRJ2aLdLGCIbOYCKk4PwIyU3Yc5t4/y8xvfIEgMIdqKlHfgOFf
   YlHDbLhSld9J0L6ckYxa7Z/03Iz8VdM8JxOgkMkf81WuDhqK9WRcH9qyI
   5ICLREps/KMgYY/ipxsqmG6JRhfCQY5wWGI7pcKDSXDEY7F9adzzonSap
   iN7x75u+z9gq+TWDeHiLVKXHMLz+qbUP8JsGAgsovL0ulDrI8pu/2hgz8
   Emd9Ce+EYsLlJr++MWKXOeFc6WEmdYtXe2B9aokrRG9XJrP+/N0X84JWc
   g==;
X-CSE-ConnectionGUID: Slhsyj9KTY6eHY5clgGSlA==
X-CSE-MsgGUID: 9HEW3GpwRgCyCVUU7SkM3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56837091"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="56837091"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 21:16:13 -0700
X-CSE-ConnectionGUID: pMNUds3pTaqF9Hj1NTW1dA==
X-CSE-MsgGUID: 61paJ9iYS2ud1Jl/9euOLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167700326"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Aug 2025 21:16:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoDlR-000GVK-25;
	Tue, 19 Aug 2025 04:16:01 +0000
Date: Tue, 19 Aug 2025 12:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 0/1] mm/gcma.c:467:18-19:
 WARNING comparing pointer to 0
Message-ID: <202508191222.E3DQV0XT-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   052ed413ea599387d842eb84c8aac6480eab0c72
commit: bca0e95c0215368d0af3379e7487937e180de545 [0/1] ANDROID: fix GCMA build failure when CONFIG_RANDSTRUCT=y
config: i386-randconfig-053-20250819 (https://download.01.org/0day-ci/archive/20250819/202508191222.E3DQV0XT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508191222.E3DQV0XT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/gcma.c:467:18-19: WARNING comparing pointer to 0

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
