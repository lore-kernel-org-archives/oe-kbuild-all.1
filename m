Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364F12744F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 04:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765342702; cv=none; b=QIAf4MaORXEzYHqIKxqe8J60fXwToT48RPyQtV0mSQHXWx0xJ6B6yRsv4qfyR0/gcMAb3qn74B9xi8zfQ3PqhS8u3PiyChjWZrTXDpBxAPWrSAzsTcNriSfXp9AncaQ8NI7HagYapSZUNo+zTsIolMmmLcd/Ffpp68ZV8G4ZH8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765342702; c=relaxed/simple;
	bh=Bfan6l5BhIRAWKs87/0uI/pPUNfbhDtwKeAgQSs7ruM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WR/beJhq7akR/ujGGjJ2bwSsclBENzCHbZs67x5OspH5ejtYFedwnWCyrk/TT2iFobA1SI0mtGUr98ikrX654MRiP7CVj/CGd1VER5JAulydN7Q7lFQwMDmcjScM4Pwb2WAgvR5CHUZ+s0sO7xMYvagl6JLDvykie0iqqUl8vLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjHqhm/6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjHqhm/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765342700; x=1796878700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bfan6l5BhIRAWKs87/0uI/pPUNfbhDtwKeAgQSs7ruM=;
  b=FjHqhm/6qoq3Yq+L7MQ2cOvYlPPXqDVFfSjHwLcxaux4AjRwP8xxuDY9
   9xUWSaUpdZXcUZjRpoPGcZqFjh9CWB9huPCRE481rPVjoOwMfUxyGQnNh
   eD+Jfnv1bAE3X9N/w9uoopnhTGcWn+BA39nIpJON41uW7t8IUEajdnyZI
   LRwmj3b3R2WoqIc6Run7OKhX3+dE5ntsmf4nwTyryZgPk3TAGiJn34m+9
   SUaKJcztbLH8zhs0NfzsV+tQyaRcBYN0LjpjuvPdZgEYQv4c7YPBYcvzd
   4tFnR7reGISopga9wbVtyr1iO/H9Gpmk5Dc47JCfJd/J1RBcKrLOCdFEX
   Q==;
X-CSE-ConnectionGUID: ssHkd05VS3SVdxOouZKSVA==
X-CSE-MsgGUID: 6K5Jj4I7TA2WHLJ3U/FTtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67479341"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="67479341"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 20:58:19 -0800
X-CSE-ConnectionGUID: j9QN/dnvQ7CIsHhWTqxY/Q==
X-CSE-MsgGUID: m2xqf48hQxqaYu/p6DO02Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="227077776"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2025 20:58:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTCHI-000000000Um-1JK6;
	Wed, 10 Dec 2025 04:58:16 +0000
Date: Wed, 10 Dec 2025 05:57:54 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] mm/madvise.c:297:6: warning: no
 previous prototype for 'force_swapin_vma'
Message-ID: <202512100526.hg7amXND-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d7d7f131569485a9b6737b85cd8144196135b1a1
commit: 92a0eb9bde6c03412b39f9f3d20968c091ea3b46 [3508/3508] memcg: introduce per-memcg swapin interface
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251210/202512100526.hg7amXND-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100526.hg7amXND-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100526.hg7amXND-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/madvise.c:297:6: warning: no previous prototype for 'force_swapin_vma' [-Wmissing-prototypes]
     297 | void force_swapin_vma(struct vm_area_struct *vma)
         |      ^~~~~~~~~~~~~~~~


vim +/force_swapin_vma +297 mm/madvise.c

   280	
   281	#ifdef CONFIG_MEMCG_SWAP_QOS
   282	void force_swapin_vma(struct vm_area_struct *vma)
   283	{
   284		struct file *file = vma->vm_file;
   285	
   286		if (!can_madv_lru_vma(vma))
   287			return;
   288	
   289		if (!file) {
   290			walk_page_vma(vma, &swapin_walk_ops, vma);
   291			lru_add_drain();
   292		} else if (shmem_mapping(file->f_mapping))
   293			shmem_swapin_range(vma, vma->vm_start,
   294				vma->vm_end, file->f_mapping);
   295	}
   296	#else
 > 297	void force_swapin_vma(struct vm_area_struct *vma)
   298	{
   299	}
   300	#endif
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
