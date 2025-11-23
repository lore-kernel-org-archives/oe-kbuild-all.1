Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8234A01
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 02:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763864070; cv=none; b=DR0rOweRK8rcaxNqhsEGVcG3vf7kUL96S2x3KiUjERK/9KwgARgBq3Y+J9+6yFrq/TCXg310XBSEHv81FSX0729TT5+B/jIWrM7ovCeF+it6d1idIumWRiBxko6mHYG0HJ79ywllOXIvONJ5DLzkzP9SndyQM6jtfmFANuPaAgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763864070; c=relaxed/simple;
	bh=ZuO2GR2M//XMa5pGGvXlsGIxEDl1Kl6GkuCS7fOvO+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DH3zFo0MjAwpSmMFcDxjAf2Pj1jy3wHU+b7hf40WyuiHAd8lNXwgqd2dQz/7lHlop7cDa7yus5FtbEukwllptldHESpaaK9dWtQa2cw2eGV8zJRYQ/6tJzgfXwvuaKxU00lRkT8jIGhjGJLp0lxKrocsiESDRakohsbiB4s/rFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFDA+mZA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFDA+mZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763864068; x=1795400068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZuO2GR2M//XMa5pGGvXlsGIxEDl1Kl6GkuCS7fOvO+M=;
  b=DFDA+mZAdZwOOdVbBzu6SD5dWEtyHxvh4axUSiM49f5H//7TzLyhsdYH
   oZNLvkP4lStuUiHWnxEajU+eMb2bsAn1Jdo5BizkVFHaG+d3GlSW2U19G
   /w+xmNCk+g+0PzLjnVVzgtenIUINPfkmG8VNON/94qe2BCDg0fGMBK+eb
   8cuOdcsx4i1bMVcoNUWMzY+2cfPVZf/WGFD9jYGZNZm7ugVADfkgC6q9K
   5d4ryO9m1/RtwakHx76xjKOi3wB8qwQK3qkG+EUTVyilaSbfCAprlVtF8
   3D3EmB8taoXBauBimBUSWmErK7tI0JryqCDhOui2OkebuJJ/iDusp1men
   g==;
X-CSE-ConnectionGUID: K+3np8JjSUCpl5MDmLmLXw==
X-CSE-MsgGUID: 4IhtFTKVT8WOIySyeeRweA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76520874"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="76520874"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 18:14:27 -0800
X-CSE-ConnectionGUID: dx9C0/I3T4Cnn8qjLi42AA==
X-CSE-MsgGUID: BjeFtn+uTNOJuwII1FcGmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="222963099"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2025 18:14:26 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMzcO-0007zZ-03;
	Sun, 23 Nov 2025 02:14:24 +0000
Date: Sun, 23 Nov 2025 10:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:126:5:
 sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it
 be static?
Message-ID: <202511231029.GHGXNbti-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6c5657aecca1857be6ea39f789159c9acfde2f9e
commit: 1845e7add95773a24019fb72bbea24a0a568663b [1740/1740] mm: Add reliable memory use limit for user tasks
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251123/202511231029.GHGXNbti-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231029.GHGXNbti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231029.GHGXNbti-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_reliable.c:126:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
   mm/mem_reliable.c:126:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     126 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_limit_handler +126 mm/mem_reliable.c

   124	
   125	#ifdef CONFIG_SYSCTL
 > 126	int reliable_limit_handler(struct ctl_table *table, int write,
   127		void __user *buffer, size_t *length, loff_t *ppos)
   128	{
   129		unsigned long old = task_reliable_limit;
   130		int ret;
   131	
   132		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   133		if (ret == 0 && write) {
   134			if (task_reliable_limit > total_reliable_mem_sz()) {
   135				task_reliable_limit = old;
   136				return -EINVAL;
   137			}
   138		}
   139	
   140		return ret;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
