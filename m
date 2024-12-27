Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591CB19A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735258479; cv=none; b=CajVCYJs33rgFGlYr7rvZHFtaRH/dnpl2jEYy3er39V5PzM5g2BGhx4ExMZB++kyk2oVLY+S9k6Z6Ee8pv58VhHBRufaSP/A9kgtvlRKSBderKQdKsBD1wYF/+HD+C/P2Wxy8JVFW5rIyTrqtfl1zVCRr3MNouBfyG9bF7PNE6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735258479; c=relaxed/simple;
	bh=5BdHZwrFy66m5l++eyZd9xPUvg4z0W0ID+DvtbwRMAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LOLW+URZ9JTax1ZLxOYf9xzHqsjAXMsPOuzCay68axsORG/Uoc+JXlO3LLwXls95RxSaEo1Bl4z2kBNEW0C2rm4Dktr/zcPH/8F7nJs8FAUurljwYoC91WS2FwZz+I38DIXVtp6zTLKo1oraLwcQtusgLX18ggP2IGK/OPUCsuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgzjIjQo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgzjIjQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735258477; x=1766794477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5BdHZwrFy66m5l++eyZd9xPUvg4z0W0ID+DvtbwRMAM=;
  b=PgzjIjQo50fJgV69YoxhkG2scq8BJZAzvBgCwp6Xtkgg7OwBEO1/F1tf
   JaDWi/MaVYn3fCbUKu7nOqudESR4hLH9P+FUOUUfOPQJASVbEXp1MxUVV
   HQ9b+o7Lewit6bfP9loBD+wYa0ZqAAdhiKBzJqlPvGTX6lGqf6X5SrKzH
   nxsDjpxE+fnuA5dipAwlMv72RhyO8B1/FtTXvRh/xBxvIEkBnmT1pJgSZ
   Uusn/sz54nUA77cWgpisJ3r255FB2W9rqmuXLAX21AcBxytItWrR9E5U2
   DeHtRmB0b8Ia7uGA4fvFN+dVDYOpucHDtpnkORcpp+3NGyJ/20F3ep1tp
   A==;
X-CSE-ConnectionGUID: ACX6Hr5qRWWw8HIN3jOjEQ==
X-CSE-MsgGUID: WHLxwN3tQ6SaNfVcO5yWOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="53203212"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="53203212"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 16:14:37 -0800
X-CSE-ConnectionGUID: DIaQBcQcQXabirSODu4R6Q==
X-CSE-MsgGUID: VjkecaCPR4OzXFV5MgP9Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="100400064"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Dec 2024 16:14:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQxzt-0002rk-2T;
	Fri, 27 Dec 2024 00:14:33 +0000
Date: Fri, 27 Dec 2024 08:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1667/1667] arch/x86/kvm/svm/sev.c:2200:18: error:
 no member named 'false' in 'struct hygon_kvm_hooks_table'
Message-ID: <202412270855.zkm1zix6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi fangbaoshun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   16a0cbac6609f8ba10a91a9d52b15bf28243c3ee
commit: 1c3b1095a26ed8bc1aa7ac3d4e8dd3e65964a74b [1667/1667] KVM: SVM: Add KVM_CSV_COMMAND_BATCH command for applying CSV RING_BUFFER mode
config: x86_64-randconfig-102-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270855.zkm1zix6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412270855.zkm1zix6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270855.zkm1zix6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/sev.c:12:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kvm/svm/sev.c:2200:18: error: no member named 'false' in 'struct hygon_kvm_hooks_table'
    2200 |         hygon_kvm_hooks.sev_enabled = &sev_enabled;
         |         ~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/svm/sev.c:66:21: note: expanded from macro 'sev_enabled'
      66 | #define sev_enabled false
         |                     ^
>> arch/x86/kvm/svm/sev.c:2200:32: error: cannot take the address of an rvalue of type 'int'
    2200 |         hygon_kvm_hooks.sev_enabled = &sev_enabled;
         |                                       ^~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:2198:6: warning: no previous prototype for function 'sev_install_hooks' [-Wmissing-prototypes]
    2198 | void sev_install_hooks(void)
         |      ^
   arch/x86/kvm/svm/sev.c:2198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2198 | void sev_install_hooks(void)
         | ^
         | static 
   2 warnings and 2 errors generated.


vim +2200 arch/x86/kvm/svm/sev.c

  2195	
  2196	#ifdef CONFIG_HYGON_CSV
  2197	/* Code to set all of the function and vaiable pointers */
  2198	void sev_install_hooks(void)
  2199	{
> 2200		hygon_kvm_hooks.sev_enabled = &sev_enabled;
  2201		hygon_kvm_hooks.sev_issue_cmd = sev_issue_cmd;
  2202		hygon_kvm_hooks.get_num_contig_pages = get_num_contig_pages;
  2203		hygon_kvm_hooks.sev_pin_memory = sev_pin_memory;
  2204		hygon_kvm_hooks.sev_unpin_memory = sev_unpin_memory;
  2205	
  2206		hygon_kvm_hooks.sev_hooks_installed = true;
  2207	}
  2208	#endif
  2209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
