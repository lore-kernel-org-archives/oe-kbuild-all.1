Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E932EC0B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764064346; cv=none; b=s+PbTHHGLf7uLbrWn3UC1utTJr7b+X6q/rWSi3h5OysI/2AKBtly0YggqQ40cnL4w2PitiDjhR3ENxen/ODN2m49msJ4xQrkgIfF6j5clPDX+8m7vhF3Jow/aaxaZE/0bN6yNXQA4cnr4wP+2nkxmUtF1tdtLaMqEIOyWCjIOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764064346; c=relaxed/simple;
	bh=p27VawQ0735x1k417pSwtWP+BAdRrN4dEHZ9/z+gbDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XP33u0Tb1DB8FqfL7sTNp80e7pjwzZ+X0/F2nOhFPCk2/2hKpb4g942rbBmxAzH3CmtGENPvy0gbHB8ntYoYuLyeJ9L7DCGniMZ8Gx5sqEzMKzRZdUyZ2rJnKPxo7G6+qLYwfxbnoY0a0J9F73qlPJy2Tj3obYEgjt4OqeAbZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNVK3Sq8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNVK3Sq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764064345; x=1795600345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p27VawQ0735x1k417pSwtWP+BAdRrN4dEHZ9/z+gbDI=;
  b=UNVK3Sq8M0TEec4iQSM31CCZDaKh98pyE0QBme904+NiL0ilLkAYJgop
   u95O9reBG7j64CJg6kph6vbJKzHhUD3GPjCuLKOeEdO9tg1lNNF8mpG+w
   dU+hTflmrOCD+/hof6G8X09WHr36KdHlg7By4neVnkdloRPoPf3sKR50a
   2xup1EPPoYckLvXMld4GmIcGfx+4rAQNkT2tE5aU7MvA59ROZgULwjToq
   Q3CSZMTZWmqDK1JB3QPQsATdbv1tsm1NsYLvceP8y88V+ksSDsai3F3VM
   PKvw35jBuWl+sR9l1chmHyb7bAwRb17muLwk2hW7V2Bkh+0U+arvmduQy
   A==;
X-CSE-ConnectionGUID: XCfczxp7QlOa8g/+SIJ63g==
X-CSE-MsgGUID: JJJYhHQmSkufqxbLdg2EIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66155149"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="66155149"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:52:24 -0800
X-CSE-ConnectionGUID: iP9/5N+0Q1KBA6QH97rZIw==
X-CSE-MsgGUID: Fx5Sy5A7QhKXadEzyEUBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="193397162"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Nov 2025 01:52:23 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNpif-000000001bd-15D6;
	Tue, 25 Nov 2025 09:52:21 +0000
Date: Tue, 25 Nov 2025 17:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3316/3316] kernel/xsched/core.c:189:5: warning:
 no previous prototype for 'xsched_xse_set_class'
Message-ID: <202511251727.cFjVKjQN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c1bc27c0f90c1e34d319455cb1e28b2705987616
commit: 76c15076abcb100f7c1204bd1ef0ec55128d6546 [3316/3316] xsched: Add basic scheduler core support
config: x86_64-buildonly-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251727.cFjVKjQN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251727.cFjVKjQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251727.cFjVKjQN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/xsched/core.c:189:5: warning: no previous prototype for 'xsched_xse_set_class' [-Wmissing-prototypes]
     189 | int xsched_xse_set_class(struct xsched_entity *xse)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/xsched_xse_set_class +189 kernel/xsched/core.c

   188	
 > 189	int xsched_xse_set_class(struct xsched_entity *xse)
   190	{
   191		struct xsched_class *sched = xsched_first_class;
   192	
   193		xse->class = sched;
   194		return 0;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
