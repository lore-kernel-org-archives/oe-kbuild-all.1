Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1371D287
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFLtDnuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704959146; x=1736495146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9xVQjZEUl1cN2vzmuc+Yyj+nwgVtITRtBb0YkAFlcU=;
  b=dFLtDnuqSMSuasI6onPdK9n5oWTVOlvgkO8Uyfv6gAr868OIpZWx1Xd/
   8bR8vEOtrLjf8SZhdqMv5HEc3m38RzqAYyOzSxe/OIP+Yg8Ht9QJ8thPA
   hFdda0Lo1lre4yYlrGDQWtf1WAa0tH7/3AB8Ylq9hNW+XkK53zyktaHwe
   J+CF7BQNa8utG51X09kU9MkIdUlU79wh4fGX2krFjGkyzgGgin/ccTF8d
   Ff9QGK8r1nUDNOAV+icktdC7rPBZiKTyNwULHanp+YJ4Z3LSYR41fhoF7
   DRc5EZ/ElVwLdkRbid16cV6oW2VjoXHpiZjm1jPKNdQ53E2WRAfhrpNhi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12256264"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="12256264"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 23:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="732126452"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="732126452"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 23:45:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNpky-0007xu-2L;
	Thu, 11 Jan 2024 07:45:40 +0000
Date: Thu, 11 Jan 2024 15:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2302/2334] mm/madvise.c:297:6: warning: no
 previous prototype for 'force_swapin_vma'
Message-ID: <202401111536.tvtzCQes-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c780cd23389087490b4199975c7e16cb696da852
commit: 92a0eb9bde6c03412b39f9f3d20968c091ea3b46 [2302/2334] memcg: introduce per-memcg swapin interface
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240111/202401111536.tvtzCQes-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111536.tvtzCQes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111536.tvtzCQes-lkp@intel.com/

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
