Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A4415E97
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711274675; cv=none; b=KbJd7UIw++rtEUY1OwSdwRFWkfC7ILyDDsFMaikYAeQRHMwImsWyk4aTPoQA3e6j0yPqwPK+37P+sJjPldWRAUimhEJgKSJDsjLmFQ1RyKRwUS0lUmp3MLmeMj0IJyLkeBbPdHAUnNv1fW8k9BYTOUMA6v1w95ZPYyNZbxBKTwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711274675; c=relaxed/simple;
	bh=haUg3c2YaH8M3ACg2aZhkafE0yxWvFzbHzimuWJZyBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFjixGaSFy5g5F2yXIw37BdaajZVmqi67wy/D7MpqhRfb/qXbzGcwT2Mu/naeS7iON4nBMgDCqxO267ZNZgHFt2aHhC+IHLHqGqDl/ivEeOOob6KPVjtmuqwVsENimqF3c1Sdf7RQ3PPyOlslAYXDRosjhR45DvyBGeJOdD1NkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgM6TkSy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgM6TkSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711274674; x=1742810674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=haUg3c2YaH8M3ACg2aZhkafE0yxWvFzbHzimuWJZyBI=;
  b=FgM6TkSyWjR0LUVFdD4KpA1ebR7nbRCSjhlqUfCI48YPgSH92H82eEBL
   BW7Pm3c3imeg/WwO2IKCdCPJCZQcuEXbTKZjpgFJLignD1+wL0w9AeiHU
   pPWinUz6fsOeRwLhvLm1GwlRJ6iMijfcfk/cGDS/Vxp8TtJjRsBIhyas1
   C23eppg+vFsc+QzC0wHM+9eivF5PN9QgruEpryEgu4CMtqEteIbhe6F/d
   B8rRv6CQ7gC+qXfMbd4HmlPF8GkeuhpyJluYT7lctT1y8781/I/k4B5pq
   FvEj2jOpqJhZShB+JrLrFq+/8DwNTS1ONsz/1lYIFL1DWJns/6iW86Dke
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="9233839"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="9233839"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 03:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="52801716"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Mar 2024 03:04:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roKiK-000LlV-3D;
	Sun, 24 Mar 2024 10:04:28 +0000
Date: Sun, 24 Mar 2024 18:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:twf-hoist 558/627] fs/verity/verify.c:363:15: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202403241700.6cGc6aii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git twf-hoist
head:   709c2aed7586c3ac6a9d636355c623611d5c14d1
commit: 2c5f5bfebb781a9e1ca83434ffc2e8b8fee14cf6 [558/627] fsverity: fix "fsverity: add per-sb workqueue for post read processing"
config: hexagon-randconfig-r121-20240324 (https://download.01.org/0day-ci/archive/20240324/202403241700.6cGc6aii-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce: (https://download.01.org/0day-ci/archive/20240324/202403241700.6cGc6aii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241700.6cGc6aii-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/verity/verify.c:363:15: sparse: sparse: Using plain integer as NULL pointer
   fs/verity/verify.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +363 fs/verity/verify.c

   349	
   350	int __fsverity_init_verify_wq(struct super_block *sb)
   351	{
   352		struct workqueue_struct *wq, *old;
   353	
   354		wq = alloc_workqueue("fsverity/%s", WQ_MEM_RECLAIM | WQ_FREEZABLE, 0,
   355				sb->s_id);
   356		if (!wq)
   357			return -ENOMEM;
   358	
   359		/*
   360		 * This has to be atomic as readaheads can race to create the
   361		 * workqueue.  If someone created workqueue before us, we drop ours.
   362		 */
 > 363		old = cmpxchg(&sb->s_verify_wq, NULL, wq);
   364		if (old)
   365			destroy_workqueue(wq);
   366		return 0;
   367	}
   368	EXPORT_SYMBOL_GPL(__fsverity_init_verify_wq);
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
