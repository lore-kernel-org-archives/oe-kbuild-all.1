Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6C279351
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 05:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756530905; cv=none; b=oxaqVI56wrgzUfiogyad+l4t4K+mmc2veyQLLmPa9Vz/iR25yeQoKJojNGJp/qrev2LVebcLKODhP7n6o3Kgu0nMXLgGmbJSBfIoUciXoMqYJm63j7w/OC7qUSNzuG0EcskiCoX41Y96MX1SJslZzeCQLxiZYSar3DeIg2Z+6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756530905; c=relaxed/simple;
	bh=GV4WnKhUEmGu9UiqfTME/ogge1wGFwUfriNa3yvKIk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cYMn7jJfE2tWtdnD1FnmDNe9FGnAS56Jv1zCouEWv54T1mGbYuQ+s+WYnkaFlrXphgKzKqmGZsx/JJe57mNHm4lhWZ7GywCRP034EnlIZXL0MOy2shaQnQtcqUyf1trZlcv9UckjXjd2Q8VB8+uDkh294Huo9iOvcBkOY4vk6/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoAtIVe9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoAtIVe9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756530902; x=1788066902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GV4WnKhUEmGu9UiqfTME/ogge1wGFwUfriNa3yvKIk8=;
  b=OoAtIVe9TmF4ecJbCg9bgG5xQjqS4e9mnhfyg7fSI4hRVZslgxOZcfWD
   ewc0b4LAjgxy3jXuEaXoUqnyUvD1GKBY/DVmq0zAqQAYVVMddRBNVHWIc
   jWofy77dezsqgxxhb1dNa5QrX5YY6vFY9A2iQzXxraN4y+S4h3FYHuYr/
   vMt7JCteu9Na53biOWmNZoF2MVr5AnLxbDtIt5FTJE2BSyA/tSa+Ep5R0
   GrwviIyNAZht+XwBOs+qtFFWvuFRkjOtK2o4PGrDbuVSeI61kn5N+wwZd
   13aP+ixq/8ZZ0uTfiT0xpIc247z6gLKE2luzHJiaBqWgm8DbMpIpJicTR
   g==;
X-CSE-ConnectionGUID: nXbLvn0cQXOgixe+KTkNEA==
X-CSE-MsgGUID: pLKiXcQsRoO95v/WSuE6cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58010219"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58010219"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 22:15:01 -0700
X-CSE-ConnectionGUID: RZBpP8NCSVCZyVJT/2I5NQ==
X-CSE-MsgGUID: mGRKs04NSaOiCbZCIJzwvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170437266"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Aug 2025 22:15:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usDvV-000VBf-2b;
	Sat, 30 Aug 2025 05:14:57 +0000
Date: Sat, 30 Aug 2025 13:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2791/2791] mm/memcontrol.c:4428:12: warning:
 'mem_cgroup_check_swap_for_v1' defined but not used
Message-ID: <202508301353.sMr1cJLt-lkp@intel.com>
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
head:   34513bb98544f7d61a383d9d15901d35e7767c06
commit: a095a940f784db58ea4e87df361f9a4fd0dd977f [2791/2791] memcg: add restrict to swap to cgroup1
config: x86_64-buildonly-randconfig-002-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301353.sMr1cJLt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508301353.sMr1cJLt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301353.sMr1cJLt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:4428:12: warning: 'mem_cgroup_check_swap_for_v1' defined but not used [-Wunused-function]
    4428 | static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_check_swap_for_v1 +4428 mm/memcontrol.c

  4427	
> 4428	static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
  4429	{
  4430		return 0;
  4431	}
  4432	#endif
  4433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
