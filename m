Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505C3342539
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 19:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776368326; cv=none; b=gwcNSK5tlY9JwkZcDZxqoWmOYWUQrkb1628lBMMoT04laKqsotDyVq3hmKcTBAmrAtqAgw4ZMLbo/mAUpttTprVmvUkYgiF5K1jGsRX05doK3MlYU93bqd4a0xOfWCpYQW3NBCHbkaf0kCkQ+tdAZL5EDnxTPadYw3JqvwKyKDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776368326; c=relaxed/simple;
	bh=TUI16hRsZBgUg0hG46OIFVxLwPBsC1RE377kspb6oio=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KRdNBPfA3YNdtzWGqPx2vM/X5YcCd1qDBm/At0uQslhDBmuDRNDvK0vdiAMqcVsGAnJk+jFbEuGOuC8FRjxoGBmKN9uyPBRoRkloddt8MWR4HFK4gsifUYaNwbUq/ZNJUvGK6mFss+blvL2QwsySMrd2qokgCACkFNTVaKlgkag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQdim8S4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQdim8S4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776368323; x=1807904323;
  h=date:from:to:cc:subject:message-id;
  bh=TUI16hRsZBgUg0hG46OIFVxLwPBsC1RE377kspb6oio=;
  b=HQdim8S42FgNsBTWq4N6IC7p8mIv/OVvUmCCeuIx/+7gHyJ4WRCCkp3s
   E+3wEAqAjc9HnFajlr+V6KuiZ63CJwicFjHT+mvJqcL+kfY2O59vrtMYb
   g/DBiayN5xB58SKL73R4mniFRPHrbfAsCpT9kFZxJgrSY0Htvj8S0yx8V
   fastp1u8X9IxsUHM+cu0s1ZK1LoMyVaeZFhGlelkQ/VoRlRCQMQvFtHd0
   sZ9yWVmfPqnL80hrytcQ1DocN0C0/LX51BqaignW5Wx1LDjkb2s7M/l0w
   ynaF/4sk6YD4fOtQbmxsIPp1qW5zzT2Sb4ohsX5pS6a0trmCEU0I/hbKS
   g==;
X-CSE-ConnectionGUID: Hz7wRQtVStKUaZB1lNqLpQ==
X-CSE-MsgGUID: OkU6UockSgWcnbkN2U0MwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77455129"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77455129"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:38:41 -0700
X-CSE-ConnectionGUID: c5xjxFJ2Siq+f8WGZdtfVw==
X-CSE-MsgGUID: JmDkFBIYSoWIaYL68r7UsQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Apr 2026 12:38:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDSXu-0000000015R-2I7y;
	Thu, 16 Apr 2026 19:38:38 +0000
Date: Thu, 16 Apr 2026 21:38:14 +0200
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: fs/proc/task_mmu.c:3028:21: warning: 'can_gather_numa_stats'
 defined but not used
Message-ID: <202604162150.N2hGORtE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-Add-softleaf_from_pud/20260416-123625
head:   258d05b2de477745977b64b126df65257709931d
commit: b2dac6ec7efb93198d5915eb518e3d9e82c6bf82 mm: Make /proc/pid/numa_maps use the new generic pagewalk API
date:   15 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260416/202604162150.N2hGORtE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604162150.N2hGORtE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604162150.N2hGORtE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:3028:21: warning: 'can_gather_numa_stats' defined but not used [-Wunused-function]
    3028 | static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
         |                     ^~~~~~~~~~~~~~~~~~~~~


vim +/can_gather_numa_stats +3028 fs/proc/task_mmu.c

f69ff943df6972 Stephen Wilson 2011-05-24  3027  
3200a8aaab0c9c Dave Hansen    2011-09-20 @3028  static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
3200a8aaab0c9c Dave Hansen    2011-09-20  3029  		unsigned long addr)
3200a8aaab0c9c Dave Hansen    2011-09-20  3030  {
3200a8aaab0c9c Dave Hansen    2011-09-20  3031  	struct page *page;
3200a8aaab0c9c Dave Hansen    2011-09-20  3032  	int nid;
3200a8aaab0c9c Dave Hansen    2011-09-20  3033  
3200a8aaab0c9c Dave Hansen    2011-09-20  3034  	if (!pte_present(pte))
3200a8aaab0c9c Dave Hansen    2011-09-20  3035  		return NULL;
3200a8aaab0c9c Dave Hansen    2011-09-20  3036  
3200a8aaab0c9c Dave Hansen    2011-09-20  3037  	page = vm_normal_page(vma, addr, pte);
3218f8712d6bba Alex Sierra    2022-07-15  3038  	if (!page || is_zone_device_page(page))
3200a8aaab0c9c Dave Hansen    2011-09-20  3039  		return NULL;
3200a8aaab0c9c Dave Hansen    2011-09-20  3040  
3200a8aaab0c9c Dave Hansen    2011-09-20  3041  	if (PageReserved(page))
3200a8aaab0c9c Dave Hansen    2011-09-20  3042  		return NULL;
3200a8aaab0c9c Dave Hansen    2011-09-20  3043  
3200a8aaab0c9c Dave Hansen    2011-09-20  3044  	nid = page_to_nid(page);
4ff1b2c29326a2 Lai Jiangshan  2012-12-12  3045  	if (!node_isset(nid, node_states[N_MEMORY]))
3200a8aaab0c9c Dave Hansen    2011-09-20  3046  		return NULL;
3200a8aaab0c9c Dave Hansen    2011-09-20  3047  
3200a8aaab0c9c Dave Hansen    2011-09-20  3048  	return page;
3200a8aaab0c9c Dave Hansen    2011-09-20  3049  }
3200a8aaab0c9c Dave Hansen    2011-09-20  3050  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
